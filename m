Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED5AC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kNso+hK1n4iMaCMwsIjpacjAkCoQDiy41c2Y+VhG8E=; b=jdwAEYN8EAwT1BDtt17TnhnXlu
	4igXow7SwGSYJkEhVtxvUAmE3JkPhl00i4binEohZHipF/lGEDLV+yDuBkKwGEjN0ATYHPNb4bfhA
	WXCBWy3H1Wamy6NmTkLAVZxo70HB/GiR3xSbSVTwpzt7MPeHs8WydzSU/eq6dvq/p8QQFwdUc+Y7Y
	wGwjk2cMhjmXDUrA1ifmPk8oJvT3Qo/Lihx16POG0bQAc50kM97XAP59PzMVDZevxnJu2Q9AnaWke
	OjWg2x7mAwAN4t2XJ5Gb3uzbcBnCz4auSo8MDYDHFtuaeEPJo4lvGE1HX7xEMjrUkm4iC9FB2Ayyx
	LobcjFOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HMT-00000008TOY-2W1s;
	Thu, 03 Apr 2025 09:59:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GQI-00000008JzD-20d3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8716E106F;
	Thu,  3 Apr 2025 01:59:44 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB72B3F63F;
	Thu,  3 Apr 2025 01:59:40 -0700 (PDT)
Date: Thu, 3 Apr 2025 09:59:38 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Matthew Bystrin <dev.mbstr@gmail.com>, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <20250403-discreet-tangerine-mink-d5faaf@sudeepholla>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-1gY8mQLznSg5Na@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015942_559379_65983D98 
X-CRM114-Status: GOOD (  27.36  )
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

On Wed, Apr 02, 2025 at 05:05:55PM +0100, Cristian Marussi wrote:
> On Wed, Apr 02, 2025 at 11:59:47AM +0100, Sudeep Holla wrote:
> > On Wed, Apr 02, 2025 at 01:42:54PM +0300, Matthew Bystrin wrote:
> > > Add timeout argument to do_xfer_with_response() with subsequent changes
> > > in corresponding drivers. To maintain backward compatibility use
> > > previous hardcoded timeout value.
> > > 
> 
> Hi Matthew, Sudeep,
> 
> this is something I had my eyes on since a while and never get back to
> it....so thanks for looking at this first of all...
> 
> > > According to SCMI specification [1] there is no defined timeout for
> > > delayed messages in the interface. While hardcoded 2 seconds timeout
> > > might be good enough for existing protocol drivers, moving it to the
> > > function argument may be useful for vendor-specific protocols with
> > > different timing needs.
> > > 
> > 
> > Please post this patch along with the vendor specific protocols mentioned
> > above and with the reasoning as why 2s is not sufficient.
> 
> Ack on this, it would be good to understand why a huge 2 secs is not
> enough...and also...
> 
> > 
> > Also instead of churning up existing users/usage, we can explore to had
> > one with this timeout as alternative if you present and convince the
> > validity of your use-case and the associated timing requirement.
> > 
> 
> ...with the proposed patch (and any kind of alternative API proposed
> by Sudeep) the delayed response timeout becomes a parameter of the method
> do_xfer_with_response() and so, as a consequence, this timoeut becomes
> effectively configurable per-transaction, while usually a timeout is
> commonly configurable per-channel, so valid as a whole for any protocol
> on that channel across the whole platform, AND optionally describable as
> different from the default standard value via DT props (like max-rx-timeout).
> 
> Is this what we want ? (a per-transaction configurable timeout ?)
> 
> If not, it could be an option to make instead this a per-channel optional
> new DT described property so that you can configure globally a different
> delayed timeout.
> 
> If yes, how this new parameter is meant to be used/configured/chosen ?
> on a per-protocol/command basis, unrelated to the specific platform we run on ?
>  

+1 on all the points above. I agree this must be per transport. If it is
per message then you need to think why it needs to sync command. Why can't
it be changed to async or use notification. I am waiting to see the usage
in your vendor protocols to understand it in more detail.

-- 
Regards,
Sudeep

