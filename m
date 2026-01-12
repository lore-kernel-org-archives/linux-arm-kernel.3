Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF17C9EC98
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 15:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z36QOE9rQ/JyP1zjnS3tdGN/wm5VsDtu7emJlg9dcSA=; b=43ox0B+djdXy9N12FcpqaWaQHz
	h42PNhERtVnAogJPXMZOO7RX0LkMB2LWHZvUsOg6wAk40XjZEiLk1I6J4UhsMvZPDm00uZocH+UEq
	DEolYwNG3fT5CJe4auQ/BEF3YquWvpwxibm0aSz6+icos9nienUZcbHSVHGP9Ob4Nz3EWG8a7YTSd
	NEXj2Wh8klTmLr/Owv33WEb0ovgW5nrKG5UeOkhtaUPb8SNmWK0XUzBiqSqapI5SX4I3fJr3GKIGQ
	Td5e9mfWOiKIXXZHGhqMPXPdw7EOm0D9uEtzbuBqyjpv51JdYZPD6WtVl37dVAZUDnBrLkHDbBM5b
	ajZ+il4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKJ7-00000005g9D-39me;
	Mon, 12 Jan 2026 15:58:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKJ5-00000005g8X-0CGP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 15:58:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51B16497;
	Mon, 12 Jan 2026 07:58:06 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B15533F59E;
	Mon, 12 Jan 2026 07:58:11 -0800 (PST)
Date: Mon, 12 Jan 2026 15:58:09 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: Implement arm,poll-transport
 property
Message-ID: <aWUaES-culTeUfjD@bogus>
References: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>
 <20251231213016.185575-2-marek.vasut+renesas@mailbox.org>
 <aWTjs1Y9yoz1k4Ry@bogus>
 <aWTu4o4Z59QQOc2O@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWTu4o4Z59QQOc2O@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_075815_208035_561D27D2 
X-CRM114-Status: GOOD (  36.82  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jan 12, 2026 at 12:53:54PM +0000, Cristian Marussi wrote:
> On Mon, Jan 12, 2026 at 12:06:11PM +0000, Sudeep Holla wrote:
> > On Wed, Dec 31, 2025 at 10:29:19PM +0100, Marek Vasut wrote:
> > > Implement new property arm,poll-transport, which sets all SCMI operation into
> > > poll mode. This is meant to work around uncooperative SCP implementations,
> > > which do not generate completion interrupts. This applies to mbox/shmem based
> > > implementations.
> > > 
> > > With this property set, such implementations which do not generate interrupts
> > > can be interacted with, until they are fixed to generate interrupts properly.
> > > 
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > ---
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > > Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> > > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > > Cc: arm-scmi@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > ---
> > > V2: Drop no IRQ handling from SMC transport and update commit message
> > > ---
> > >  drivers/firmware/arm_scmi/common.h | 4 ++++
> > >  drivers/firmware/arm_scmi/driver.c | 4 ++++
> > >  2 files changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > > index 7c35c95fddbaf..7c9617d080a02 100644
> > > --- a/drivers/firmware/arm_scmi/common.h
> > > +++ b/drivers/firmware/arm_scmi/common.h
> > > @@ -235,6 +235,9 @@ struct scmi_transport_ops {
> > >   *		      to have an execution latency lesser-equal to the threshold
> > >   *		      should be considered for atomic mode operation: such
> > >   *		      decision is finally left up to the SCMI drivers.
> > > + * @no_completion_irq: Flag to indicate that this transport has no completion
> > > + *		       interrupt and has to be polled. This is similar to the
> > > + *		       force_polling below, except this is set via DT property.
> > >   * @force_polling: Flag to force this whole transport to use SCMI core polling
> > >   *		   mechanism instead of completion interrupts even if available.
> > >   * @sync_cmds_completed_on_ret: Flag to indicate that the transport assures
> > > @@ -254,6 +257,7 @@ struct scmi_desc {
> > >  	int max_msg;
> > >  	int max_msg_size;
> > >  	unsigned int atomic_threshold;
> > > +	bool no_completion_irq;
> > >  	const bool force_polling;
> > 
> > My preference would be to reuse `force_polling` for this. We need to drop
> > const but that should be OK. Anyways I would like to know if Cristian thinks
> > otherwise for any reasons I might be missing to see.
> 
> I would rather keep the 2 things separate since force_polling is more of
> a brutal low level debug/test facility and, even though it basically
> produces the same result as the new @no_completion_irq, if we remove it
> and unify it in a single boolean that can be overriden from the DT we end
> up in a situation in which we cannot anymore easily force_polling by
> switching the flag in the code since it could be overridden by a
> conflicting 'arm,poll-transport' DT setup. (and you have to patch DT
> for testing)
> 
> So if we have one single underlying boolean (e.g. 'poll') and by any chance
> we end up with a DT containing:
> 
> 	arm,poll-transport = false
> 
> we cannot anymore override the condition by forcing in the code
> 
> 	poll = true,
> 
> since it would be switfly overridden by the DT prop.
> 
> Also semantically force_polling express much more the situation.
> 
> Anyway...I may be overthinking or missing something.
>

Understood, looking at raw I did get a sense of this but didn't spend much
time and thought of asking you. So, all good. Let's not mix them together
then. Thanks for the details!

-- 
Regards,
Sudeep

