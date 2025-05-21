Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7396C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 15:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKkEtmr9JckLML+vUD08UD8mMuu6nxdoJSVQGs1RUd0=; b=ekLZdCOcfxNlIpmsjbPdj8FcSc
	RwsJ62AM4tLqXr1dnal8b85KDP/WCzvsaQDPgFJSGShyOYlupxOjMgHOUz/bMjheiaQ4JDkU+5TfJ
	y7nOaQfi61QYkGuKNMRnvO4rK2EgmgcLbunGbR9+sCw0SFDwENnpzAKq6rKYq03AEH3k1t3uaKDYJ
	di8OF8Jhe+A76EANuA/CoWZ/X/be/4LlbKSIT5/S+eguloyoV8KX/oJcc7OkGBvDeIiCi7w4w2u1B
	Bq+UaUthe/orUi2wjWAGQS+8V0XJ3o099UeJdMYUFkXhwv8DTHUR00qw3mKlLVswDH5gfuqHiSt1o
	nhFlzc2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlQx-0000000GHzK-3diX;
	Wed, 21 May 2025 15:32:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlOB-0000000GHXC-0m0Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 15:29:52 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747841387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kKkEtmr9JckLML+vUD08UD8mMuu6nxdoJSVQGs1RUd0=;
	b=s0+xod5BLYW9KulcM7O1W5Q4BLROjJ0Aifqi0li7nIS2Amxd1jevf3NuYpUO3U+Mb9/pai
	I+c9EM6RvaBi3bB2RsgiUYHCzKS+/qD+NIN8bUkFGD4xHswuWnNrRcnlthrRYLiQ/H427Z
	GW28bTu2Bs0u03ZvnJ0V5OxqXGeuvP3HDTtad+TSTsYfljrLkvK+1Th1fcW/MbkyHDW5mp
	8wA9rp3wIRSHt9KnVo+whICGHt6GgQfDsW5dzj0nmgSGRudxtsw7BiIBKKzVgb5ompAjQT
	nJj4TZxenfUAhBEHkN6QT+uCM9fIC6oxmMqBM1FKEN1CcOPfwjcthlrT+QUcAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747841387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kKkEtmr9JckLML+vUD08UD8mMuu6nxdoJSVQGs1RUd0=;
	b=XM6s92RSv+OzRcXi2rKVpG+yt2spUH9M8C9J5k4ut7nZiOSv17i1tRfi0Bre5xt2bldf3A
	y7K0nTrwXwhafxBA==
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH v2 5/5] irqchip/gic-v3-its: Use allocation size from the
 prepare call
In-Reply-To: <86v7pwekum.wl-maz@kernel.org>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-6-maz@kernel.org> <8734d1iwcp.ffs@tglx>
 <86wmacewjr.wl-maz@kernel.org> <87zff8hk1x.ffs@tglx>
 <86v7pwekum.wl-maz@kernel.org>
Date: Wed, 21 May 2025 17:29:46 +0200
Message-ID: <871psirnh1.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_082951_364993_5C1D052E 
X-CRM114-Status: GOOD (  15.48  )
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

On Mon, May 19 2025 at 15:28, Marc Zyngier wrote:
> On Mon, 19 May 2025 13:16:58 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> > Maybe. It is rather unclear to me what this "dynamic allocation"
>> > actually provides in terms of guarantees to the endpoint driver.
>> 
>> It allows the driver to avoid allocating a gazillion of interrupts
>> upfront during initialization. Instead it can allocate them on demand,
>> when e.g. a queue is initialized. Of course that means that such an
>> allocation can fail, but so can request_irq() and other things. I'm not
>> sure what you mean with guarantees here.
>
> What is the endpoint driver allowed to expect in terms of continuity
> of allocation in the IRQ space? If this is solely limited to MSI-X,
> then the answer probably is "none whatsoever", and the driver should
> only manage the MSI descriptor index.
>
> Can any other MSI-like mechanism end-up with multiple allocations and
> require extra alignment/contiguity guarantees in the hwirq space, more
> or less similar to what MultiMSI requires? Because that'd be much
> harder to provide.

It's only relevant to MSI-X today. That's the only facility, which
actually provides an interface _if_ the underlying parent supports it.

static const struct msi_domain_template pci_msix_template = {
       ....
	.info = {
		.flags			= MSI_COMMON_FLAGS | MSI_FLAG_PCI_MSIX |
					  MSI_FLAG_PCI_MSIX_ALLOC_DYN,
		.bus_token		= DOMAIN_BUS_PCI_DEVICE_MSIX,
	},
};

That's the device domain template, which requests the functionality and
the core then checks whether the parent domain supports it. If so the
functionality is enabled.

Thanks,

        tglx

