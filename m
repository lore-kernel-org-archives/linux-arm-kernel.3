Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00F8CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HutlRlAmarm4unWdhm/gDtaCXWn1GhN3+MlaZtBoyWI=; b=0+MS7LkXFF50vhWhrap3A1S70C
	k2XCC1v/GpAPYvYHOuiWz5sM8oOyM2AM0aZffUO5QxWx6SADddctTKLf7n8QI/U1ZDR1O4TWMwaoE
	15bzCPCX79LRvUPi/+tjHPFjup4WrY8PXR5QA48U4md0yxhdkUK1Fx4EPCnYrPrpxvpNqhLZdeQof
	RL44HYV/ctjnDwzxvy+pKAt1DBmngjlo/Y7FXTLJ6qcgb04dGj2lT26/wV37GuWsBeAE9v6uOSQ0C
	lyKhtyDXZhKVdLE7CA9T/144SLKkDT5sh8Qi4U1wVk0KV5E94ZM8clY057YvMK/ee8owYBmZD+/pm
	SryelZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUW2-00000004NVE-2hko;
	Thu, 30 Oct 2025 15:24:42 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUW0-00000004NUd-0Ea9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:24:41 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9B0987A0196;
	Thu, 30 Oct 2025 11:24:38 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 30 Oct 2025 11:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761837878;
	 x=1761924278; bh=HutlRlAmarm4unWdhm/gDtaCXWn1GhN3+MlaZtBoyWI=; b=
	T0oDgNTHOlDgQ6flqHJZjNNqtS1yb/zCmZaj8SlMcaK3xFSwLKkPjjNyojVygb4o
	LQeuOlQXEmF834OhKiwvWWmYDKeveY7N9qwh+fhK7DSFMMEIt4JXR4UyBU0Qh7g6
	Ym95NkeUNoUUErm0fN8E48jhbDXadBXmpzqm+456izpFMl9xODYQfdOaN7lixqjO
	oAfx8SoEjgQW1z284GsYNqJ7EiUtOveY/c4e8+fWRoC7dzKG6J23A91JM4YLYD8Y
	Y+mJGk6vM8zJ2vyJQVWYHKfGmJN9t30ttK4bYpGb8inKklEQeNuvR5RZkApv2aVa
	S3phK+YfK3Aa/KohAGzvjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761837878; x=
	1761924278; bh=HutlRlAmarm4unWdhm/gDtaCXWn1GhN3+MlaZtBoyWI=; b=m
	ZLm+pBjvWg2UY94Sbd7BAu5h/yXxiiP4pSllbjntCYB1chH0YTw1xNQYYFA/z0Ii
	HEG8un3EevpKFLUVbhku/X1AOb1oSmmxjVbOez9MB+eszDcjk1/gM8bUIQtPSRIX
	ROOxpLgi6QpVef4okYNJP2L93w6aRUEl4Y6KtCSIci5Gi/9Hdtv5s7O6XpwA95T4
	/WoXwKhgIDSoEuin3M5ZqKmgrIpGjD6Na72CPOaSPoG6s+PjqFQYp5l5ecCkTvfd
	/JCh6Jqr5pKC0C43gXYZ1CVSawZy+Ren/tWJt4ucQxpGHZKm+rjGO4M0ypHA2BK3
	+1qTyWsAqmWkMCHG5GJYQ==
X-ME-Sender: <xms:NYMDaQjioTXrVIZPTpqnL0I9YhtIIImnmGTXRf1QtFMdIFciSkqnzw>
    <xme:NYMDaT1B73GMrchXz7XWWex9zmBOfzyO9hUrjlXpynZNwKeuK3eK9r52uKo1lBCAe
    zNtB7cMCKhOz8I1lmW6PZzgYHU0_LUneTwbPxFA5NeP-NzxAC-HXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieeileeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrh
    hmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepgihivgihuhgrnhgsihhnudeshhhu
    rgifvghirdgtohhmpdhrtghpthhtohepsghighgvrghshieslhhinhhuthhrohhnihigrd
    guvgdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthho
    pehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhrthdquggvvhgvlheslhhishhtshdrlhhinhhu
    gidruggvvh
X-ME-Proxy: <xmx:NYMDaRH4NUgWrAJZP5B9cZ3POHXW22RAOKe190FhYYLY89NQv755uA>
    <xmx:NYMDaYnpU6he7zMXEbxaSFzKeRHWwCepI6MrK4xQMIhg6vX0WiD4Mw>
    <xmx:NYMDaVZhGxNykfuqqkEc7CplPct1Y9g2GmijXPpsCjXobVhU7JbjMA>
    <xmx:NYMDadEjE5q2jMCC2r_v7G1i2qvaxVmaOhwZMAt1YAW3FT147kvkcQ>
    <xmx:NoMDaaNLPS1Tizk2zGq-u1wg_MXWgg0o4QrN2fnnbdwHlkyhW9PpvjHk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D65EF700054; Thu, 30 Oct 2025 11:24:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AnkmHEGtRmkZ
Date: Thu, 30 Oct 2025 16:24:16 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Xie Yuanbin" <xieyuanbin1@huawei.com>,
 "Thomas Gleixner" <tglx@linutronix.de>
Message-Id: <a86e9827-9b8b-4313-8d46-5fb2af5b8826@app.fastmail.com>
In-Reply-To: <20251029155918.503060-5-bigeasy@linutronix.de>
References: <20251029155918.503060-1-bigeasy@linutronix.de>
 <20251029155918.503060-5-bigeasy@linutronix.de>
Subject: Re: [PATCH 4/5] ARM: Disable jump-label on PREEMPT_RT.
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_082440_151978_3300E227 
X-CRM114-Status: GOOD (  19.54  )
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
> From: Thomas Gleixner <tglx@linutronix.de>
>
> jump-labels are used to efficiently switch between two possible code
> paths. To achieve this, stop_machine() is used to keep the CPU in a
> known state while the opcode is modified. The usage of stop_machine()
> here leads to large latency spikes which can be observed on PREEMPT_RT.
>
> Jump labels may change the target during runtime and are not restricted
> to debug or "configuration/ setup" part of a PREEMPT_RT system where
> high latencies could be defined as acceptable.
>
> Disable jump-label support on a PREEMPT_RT system.
>
> [bigeasy: Patch description.]
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  arch/arm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 864a14a434b08..99c9b1c320af8 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -80,7 +80,7 @@ config ARM
>  	select HAS_IOPORT
>  	select HAVE_ARCH_AUDITSYSCALL if AEABI && !OABI_COMPAT
>  	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6
> -	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
> +	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU 
> && !PREEMPT_RT

I posted a slightly different version last year, which optimizes
the uniprocessor version and has a little more information
in the changelog:

https://lore.kernel.org/all/20241210160556.2341497-2-arnd@kernel.org/

     Arnd

