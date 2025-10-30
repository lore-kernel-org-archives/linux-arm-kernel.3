Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79669CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0SwesoPyJz+syejXsAX+S7iKTALPDfUQvtyQOyFo8o=; b=uXZn2lfn/iukvd33scXEftS98N
	sWTj87MZE3hZaPlcSZ79/7mcCICrryhZmGgt/NANkTrfKT+7Y63XPqridSIx3w3d9yURXoURJsCRB
	jucnplqaTWFolpSsbsTR5RcUc4LbVu6L+yhXrxcVD8VWYBtLs1JFNYcJilOVF2VuAR5czLfJDBMye
	s1Ag8JV6NmJZFdOVSbDw95wKesOKnEalmjaDZWXn/acbALsU2qhzkhxLL+pYATF4fpRuJIpyd6VYS
	7bkTnmx3dO8zaWxPJOr6ArJFiAhXQwur59eauxfxo9sRNNyWvMAmm5c3/khxwa/l31W/PLz0A6fg+
	y1BdO51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUQi-00000004Mtp-1oGP;
	Thu, 30 Oct 2025 15:19:12 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUQg-00000004MtR-05CF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:19:11 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 0E2B51D001BD;
	Thu, 30 Oct 2025 11:19:09 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 30 Oct 2025 11:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761837548;
	 x=1761923948; bh=P0SwesoPyJz+syejXsAX+S7iKTALPDfUQvtyQOyFo8o=; b=
	UXIt0JVxp1q/NmIgoBkQxoJx/fQwdQ/u9GxnOEMykZ8wb39OufR25I9HAw96seAw
	Aebzx6o928bShL82jkGjDLWqZM+l4TEpnjgdZv9a+UosQ2muBbKs7MLWmJXvOkp7
	oseu1C/Js8KWmYIjbXf840oouUZv2MqRfmaIzxIW0XAE2in1+XL9xdhIMKPl5yLM
	g5e1VpKwrN57Wn9+us+I55H4ss2BK+LS0zOURg+qPlf328gXPG7UMhnDnOqR0Fv5
	k1g+pkezrkwEtUntvxdoLOoFRca9Uf61lvMzVFMz1M/3GbgXYfVvCRK0lTc4vfYW
	zeQktQ/OvtR4UYnoaU7TTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761837548; x=
	1761923948; bh=P0SwesoPyJz+syejXsAX+S7iKTALPDfUQvtyQOyFo8o=; b=U
	q+PX7pdnDvZvMn+IZ0AqEKiqWQXV/F/hb6HM6kDBDJ+OqozqrGt8PDRBdieoyYP2
	4LbWI9lvXfsvXhTjQTbzum4YC5G4TaQeO/ZGcxZ2JnCtxSRPjamE7k09RkTwSwbx
	anVCPhrotzErZOyig+M6CKQY1Pjy6I1aXJUb5o5V1xpCsBuzZw8w/tswTB//RY2G
	gDFlZ4+67QVu4RD2gpaFJ1eMK+7AL4QcuSn4oF3kLh3y0uWtsPrhkNyto1a+eQrn
	gLCxdrxoG2Ql/ofcDvfdGLDcmyvu65sseA6bO2dHPOVp0g4BspLaTrgAAR9NuBmn
	rdqKC2Ij7s4G5wkRS0f1g==
X-ME-Sender: <xms:7IEDaXHsA1EcLr4gyf8iSY_35WnREFH1gKqwcuTDndTzhp4v-l-IdQ>
    <xme:7IEDafIF1Na2MSZm1K5n7gsIR80Hp1UrLET4ElrHpOsaOo5xdMvSSyK53n4rb5t2Z
    D-HY_vM29x59sh5zYy5Zp_8BsjswWEZOrlks3zswXPGzoQ7ZWtvBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieeileegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopeigihgvhihurghnsghinhdusehhuhgrfigvihdrtghomhdprhgtphhtthhopegsihhg
    vggrshihsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrhhtqdguvghvvghlsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:7IEDaYa074gn6BzWsNOfY6SYTRF0LmPp5qZHy964iNzeIHlxzVuDtg>
    <xmx:7IEDaXGCOUHMqKOj03GBev_O1npopLVyY7w805543PwdOSHKxqBLjQ>
    <xmx:7IEDacxqnfeQSQQb06SNg21UXp9rF-bEyQbjpS_5-ukcUgP91k8-_A>
    <xmx:7IEDaZkw9xt6hqkznrTm4py_VMJi0EwZpGsr7OXx8GW7OTWJvoTEJw>
    <xmx:7IEDaa-6G2MmxE_HaNU9_OYjjn7eA5LJS909Zt1pLMmtgECRZGpKROhc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4844C700063; Thu, 30 Oct 2025 11:19:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ABs-jBIYyMx3
Date: Thu, 30 Oct 2025 16:18:45 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Xie Yuanbin" <xieyuanbin1@huawei.com>
Message-Id: <1ab2724c-4280-4193-832b-4afc0ba496c1@app.fastmail.com>
In-Reply-To: <20251029155918.503060-6-bigeasy@linutronix.de>
References: <20251029155918.503060-1-bigeasy@linutronix.de>
 <20251029155918.503060-6-bigeasy@linutronix.de>
Subject: Re: [PATCH 5/5] ARM: Allow to enable RT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_081910_623029_0F1A6909 
X-CRM114-Status: GOOD (  12.21  )
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

On Wed, Oct 29, 2025, at 16:59, Sebastian Andrzej Siewior wrote:
> All known issues have been adressed.
> Allow to select RT.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  arch/arm/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 99c9b1c320af8..002db8da69ee5 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -41,6 +41,7 @@ config ARM
>  	select ARCH_SUPPORTS_CFI
>  	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
>  	select ARCH_SUPPORTS_PER_VMA_LOCK
> +	select ARCH_SUPPORTS_RT if HAVE_POSIX_CPU_TIMERS_TASK_WORK
>  	select ARCH_USE_BUILTIN_BSWAP
>  	select ARCH_USE_CMPXCHG_LOCKREF
>  	select ARCH_USE_MEMTEST
> @@ -129,6 +130,7 @@ config ARM
>  	select HAVE_PERF_EVENTS
>  	select HAVE_PERF_REGS
>  	select HAVE_PERF_USER_STACK_DUMP
> +	select HAVE_POSIX_CPU_TIMERS_TASK_WORK if !KVM
>  	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RSEQ

This can be simplified slightly since CONFIG_KVM is long gone on
ARM, so you can just select both HAVE_POSIX_CPU_TIMERS_TASK_WORK
and ARCH_SUPPORTS_RT unconditionally.

      Arnd

