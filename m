Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BABC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 09:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0MHOGUjmr8CBAu6+jgP/lS26uCKI6a0snpMcutbOis=; b=HALIViCmpkXPr/0gaxMzZvT2hp
	s0r8XDpBS9QgFvfi964BGKICQgOR1c35uTN8tbs99bj91f5T0PabCZdLs/UDTA2wmRv8Lu7RhS2NB
	FTo2oWfKFyGwagHvEJClt8/PB8RSSpmpDHES0KQqHfTSQgptpB623i6CSvV4xMi/Hlo0HcLt3g8VS
	jGXuqYo4Jg6KNUdXPq/e6hE1HjQH99K5/9bcxTb0oU7FILoN6RnuoxqhZwzNMJGO17kTD3gxBo3Sl
	jik31uHmN+nIjuh1brJQTBhxah7WEiBsYq6xfDkicIShVUpg9qRMH3HqemLdmMeWH+V0pvLikg+DA
	gWsWgdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwbl-0000000ALj5-24me;
	Fri, 28 Feb 2025 09:24:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwYg-0000000ALEX-0pfz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 09:21:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FA201515;
	Fri, 28 Feb 2025 01:21:40 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A6FD3F673;
	Fri, 28 Feb 2025 01:21:23 -0800 (PST)
Date: Fri, 28 Feb 2025 09:21:20 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Set dma_mask for ffa devices
Message-ID: <Z8GAEDVIUiooPjf_@bogus>
References: <e3dd8042ac680bd74b6580c25df855d092079c18.1737107520.git.viresh.kumar@linaro.org>
 <Z4osWNCUfufciZNG@bogus>
 <20250228082745.rc2u5jiqnq7h737l@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228082745.rc2u5jiqnq7h737l@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_012126_282197_5A88915D 
X-CRM114-Status: GOOD (  12.02  )
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

On Fri, Feb 28, 2025 at 01:57:45PM +0530, Viresh Kumar wrote:
> On 17-01-25, 10:09, Sudeep Holla wrote:
> > On Fri, Jan 17, 2025 at 03:35:52PM +0530, Viresh Kumar wrote:
> > > Set dma_mask for FFA devices, otherwise DMA allocation using the device pointer
> > > lead to following warning:
> > > 
> > > WARNING: CPU: 1 PID: 1 at kernel/dma/mapping.c:597 dma_alloc_attrs+0xe0/0x124
> > >
> > 
> > Looks good, will add to my queue after next -rc1.
> 
> Ping.
> 

Sorry I forgot to respond. I kept this out for now as we need to resolve
the DT bindings.

If you think it can be used/needed irrespective of how we resolve that
issue ? If so, I can queue this.

-- 
Regards,
Sudeep

