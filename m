Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98619C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8vqlpYKbN2ZGEQc2typSaRsAJ9F84vvJPakp1FJPjg=; b=Y9ymZWrzUPyqnnx46TWFlrJk7a
	x9U3F1z+IvuDOsyzmJoaSVROXaiB92rESnqQ2NE/3zzgJSjcFHlzOauCXMbcDwHgZS9b8VV6oNJu9
	tcEWUI35fwXt5kXlnbbSPdY6cb0tHIbhpbl67kOsZbtTDDW4+asly8YBeAjDexZRs6mnzyUeh7pga
	0eTWLjN0nEklFQ2DuXhcOQ4TO/uR0xaixbnnvqZ8EutVHSV0VMbtgGPWru/2A5yd6DlFq1mGXKp40
	cil/akVxfZFaJHZAoyutqfrNgxIocbCNx3palPQ3koLv+AAw5EIdP/TurqgLZqtxfNqC5PpK1xtQl
	V73Iyxgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TNm-00000006xlp-2FkB;
	Wed, 09 Apr 2025 11:14:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TM0-00000006xHo-1RTw
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Apr 2025 11:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C8vqlpYKbN2ZGEQc2typSaRsAJ9F84vvJPakp1FJPjg=; b=QNgh6JBkNZ9HdKaDCSw3VykukQ
	6oVeGf2cN/DBGiSNsBjTJ/ZSu6KD7fhaVyz53Yz6Aph7A6mdmulyZkLVqYKKlhBXQFVPvIzyGcSDP
	RG0uJ5Yv3lvltpzPVoS5VaXJAuvHMZ1lw3gvStaF1r3bPjnrW3kggBA4I1FWTFotxk85oNCQkKetg
	FQjk4uARjIMh+1/kE9YvNvr5Mh3CoWoHpKppEH5lh13B1qDeuvBUizgQEmIzJWJ1XaqVjKvpM53qv
	ks6gsr/QTgpiucj6WfGkcvqslv3vs6WI8xAzrIPgYoniZVLqvHhQgsbqx4CKkaERPbMF6Q4DD0Eac
	6knzJbOg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2TLw-00000008bNT-49ad
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 11:12:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B186B1595;
	Wed,  9 Apr 2025 04:12:18 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C69193F694;
	Wed,  9 Apr 2025 04:12:16 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:12:13 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Matthew Bystrin" <dev.mbstr@gmail.com>
Cc: "Cristian Marussi" <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <arm-scmi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	"Philipp Zabel" <p.zabel@pengutronix.de>,
	"Peng Fan" <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <20250409-fierce-astonishing-bug-dd2adb@sudeepholla>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto>
 <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_121221_473971_94770676 
X-CRM114-Status: GOOD (  33.95  )
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

On Thu, Apr 03, 2025 at 10:50:17PM +0300, Matthew Bystrin wrote:
> Hi Sudeep, Cristian,
> 
> Thanks for having a look on the patch.
> 
> Cristian Marussi, Apr 02, 2025 at 19:05:
> > > Please post this patch along with the vendor specific protocols mentioned
> > > above and with the reasoning as why 2s is not sufficient.
> >
> > Ack on this, it would be good to understand why a huge 2 secs is not
> > enough...and also...
> 
> I've been working on firmware update using SCMI vendor/platform-specific
> extension on FPGA prototype, so not posted it initially. I'm open to share the
> details if needed, but need some extra time for preparations. For now I'm
> posting a brief description of the extension. It has 2 commands:
> 
> - Obtain firmware version number.
> - Update firmware. Firmware image is placed into shared physically contiguous
>   memory, Agent sends to platform micro controller (PuC) physical address and
>   size of the update image to start update procedure. After update is completed
>   (successfully or not) PuC sends delayed response.
> 
> 	Agent ----     start update         ---> Platform uC
> 	Agent <--- update procedure started ---- Platform uC
> 	...
> 	Agent <--- (async) update completed ---- Platform uC
> 
> I've faced timeout problem with the async completion response. And update can't
> be done faster than 10s due to SPI flash write speed limit.
> 

Understood.

> Why not to use notifications?
> 
> First of all, semantics. IIUC notifications can be sent by PuC in any time. This
> is not suitable for updates, because procedure is initiated by an agent, not by
> a platform.
> 

The start update should retain as soon as Platform uC acks the request.
And 2 notifications can be sent out for update procedure started and
completed. I don't see any issue there. What is the semantics you are
talking about ?

> Secondly, code implementing  notification waiting duplicates delayed response
> code. I had implemented it as a proof-of-concept before I prepared this patch.
> 

Even delayed response as some timeout so I would rather prefer to use
notifications in your usecase as it is completely async.

> > > Also instead of churning up existing users/usage, we can explore to had
> > > one with this timeout as alternative if you present and convince the
> > > validity of your use-case and the associated timing requirement.
> > > 
> >
> > ...with the proposed patch (and any kind of alternative API proposed
> > by Sudeep) the delayed response timeout becomes a parameter of the method
> > do_xfer_with_response() and so, as a consequence, this timoeut becomes
> > effectively configurable per-transaction, while usually a timeout is
> > commonly configurable per-channel,
> 
> Totally agree, usually it is. And that's why I didn't change do_xfer() call.
> Here is the thing I want to pay attention to.
> 
> Let's focus on delayed responses. I think delayed response timeout should not be
> defined by transport but rather should be defined by _function_ PuC providing.
> And of course platform and transport could influence on the timeout value.
> 

I think in your case, it is not even transport specific. It is more operation
specific and hence I prefer notifications.

> > so valid as a whole for any protocol
> > on that channel across the whole platform, AND optionally describable as
> > different from the default standard value via DT props (like max-rx-timeout).
> >
> > Is this what we want ? (a per-transaction configurable timeout ?)
> >
> > If not, it could be an option to make instead this a per-channel optional
> > new DT described property so that you can configure globally a different
> > delayed timeout.
> 
> Taking into account my previous comment, I don't think that having a per-channel
> timeout for delayed response would solve the problem in the right way. What
> about having a per-protocol timeout at least?
> 

Yes neither per-transport nor per-protocol timeout will suffice in your case.
This 10s timeout is specific to the update operation and hence use
notification. All other solution is just workarounds not generic solution.

-- 
Regards,
Sudeep

