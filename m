Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B91CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PB77BhgDPVqLXInC5oE3SrEz8gPtJUc/9tkX6JDWI3c=; b=wdrbGBDiIGxAZlWL3aLGYuVkKC
	qYKsDQKE5FbyIL8eIdGwHdntQqPSrlj0RNmHhuXgnF3DCEfHsE0ohkKc6z7b0GChUWCRT89Z707s3
	s4wpoOE4rveyUxkn+ANLpc9pmHzSISc3vHGqakbBMPSbxGqVXskw2CMl2gxLHTcURqaxbN/vAKRWh
	nfhuoQ+CacmEZLFDCqVapdM0ZAeMN7VmIJh5RYi93eUxSy4maQu/oD1DbQqLhx/Gjn5+rZ7u5HU8V
	Q8uQ4r627GXwZ82/6n7ibE06j6MJr9N1QflekmoJtJQ3lv2spW0bnzFthXDdVzIaBaRBtQ7+0nIp7
	0rR4Xr9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUNn-00000004MLt-37oe;
	Thu, 30 Oct 2025 15:16:12 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUNh-00000004MLW-2qvM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:16:10 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 9631E1D00132;
	Thu, 30 Oct 2025 11:16:03 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 30 Oct 2025 11:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761837363;
	 x=1761923763; bh=PB77BhgDPVqLXInC5oE3SrEz8gPtJUc/9tkX6JDWI3c=; b=
	lIkAruG7GNX3boS4q1978C5us8tEEkiLIB1C/TGac+iOp5kuJI6j+eqFyJYz+lXk
	3mtF76x7jjeKXtoRouqUJaun1Rvmi2wOy4vp4Qx7IcgeLKU7+RUSFMdf+dVNkvDw
	7pMHbtl1HO6FM8VgtYtfFXvfJanKvsYpEOZK53C0XmTfyH4E229gBZqUZ1E8CEuJ
	M8eycMfbjKJ2r7BDJpZZ1Y5ugrgTVi8X3lcv2H6SaGhI60MrCHIUt44HWxigHi4J
	fJYwQ8CEmj+Pt/9enqAgSbQq1o9UTc9DMUSQncdMrRPgl7UrKd71y3EVVU7CWOLQ
	LzXa/UOcXYcb0XKE3GxXcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761837363; x=
	1761923763; bh=PB77BhgDPVqLXInC5oE3SrEz8gPtJUc/9tkX6JDWI3c=; b=Q
	CnlcO60Z2jfUgktsFJ6r+qan0HxY4cOH20ZqnyzXc7kNsgWpqU2qJMnhxrNggBVm
	9YnJHj0S0utsBi/R4V7Zi1O43J7SufWim7kj7hd1YsZPWvEdPh8hq3OQ+t83QyFz
	aHMN/xkbGvxEYHd1P+7tZvkRwePGQPwxPIusuZfuySJNs5y2ELnJZiWGNB9HtIrR
	GBEeOvXpwGhaRyyU20iC7mc+qpKCJ//rBadEJn+U7/GAf481cRCY2N4f4Iyr4rLq
	1oroNx4qxgIUAaQJLuX1uLsc/Dukiy4zvYHK5F3b4kiOUNu8GZrMa6pOO7WKZPc7
	N2MCvlQbgy/SHhB0YpySw==
X-ME-Sender: <xms:MoEDaaesw3fL0imeZTjWzBYoXX3UXP_hT6RqsdFw2tjwBun5TRDEZA>
    <xme:MoEDafBg8aIiMq_HWtIzdtvdkETvoExPUP7eD8IgZkN5e9yDmdDkH0BUMdA61l5Dz
    GJW5nydY4_G5oyKmE48clRl4wGCIeD3BktW9fBPEELd-lnzPrk_Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieeileegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrh
    hmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepgihivgihuhgrnhgsihhnudeshhhu
    rgifvghirdgtohhmpdhrtghpthhtohepsghighgvrghshieslhhinhhuthhrohhnihigrd
    guvgdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhn
    fhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhrthdquggvvhgvlheslh
    hishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:MoEDaQyegoz89-uSebOVebeBHSh1jGV57kzTJFGYE9ZLQL5Z82H61w>
    <xmx:MoEDaX9UHUA-8qB2AOkJvEGXcM4T6BxF1lGfGK-BniaR5P3mXZOpsA>
    <xmx:MoEDacJuPvYxHJNcgjK4asRzeon9wm0D9u_tPIilDD_e6lZNluSedw>
    <xmx:MoEDaVfk3Cris_NQTGKOCevlBnm4405jeaia25F8BnMzzkcAROkU4g>
    <xmx:M4EDaXXih8gARFVQ63x3KWfJGwkjjLRB8d5e5OizjRw6cJZo-bAyZGAA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6D9E8700063; Thu, 30 Oct 2025 11:16:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ADO3ruLUhBC7
Date: Thu, 30 Oct 2025 16:15:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Xie Yuanbin" <xieyuanbin1@huawei.com>
Message-Id: <324652fe-b5b8-45a6-9c57-096813e9092c@app.fastmail.com>
In-Reply-To: <20251029155918.503060-4-bigeasy@linutronix.de>
References: <20251029155918.503060-1-bigeasy@linutronix.de>
 <20251029155918.503060-4-bigeasy@linutronix.de>
Subject: Re: [PATCH 3/5] ARM: Disable FAST_GUP on PREEMPT_RT if HIGHPTE is also
 enabled.
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_081605_797220_B8D1DC41 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -105,7 +105,7 @@ config ARM
>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>  	select HAVE_EFFICIENT_UNALIGNED_ACCESS if (CPU_V6 || CPU_V6K || CPU_V7) && MMU
>  	select HAVE_EXIT_THREAD
> -	select HAVE_GUP_FAST if ARM_LPAE
> +	select HAVE_GUP_FAST if ARM_LPAE && !(PREEMPT_RT && HIGHPTE)
>  	select HAVE_FUNCTION_ERROR_INJECTION
>  	select HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FUNCTION_GRAPH_FREGS

I would still prefer the version I posted previous at

https://lore.kernel.org/all/20241210160556.2341497-3-arnd@kernel.org/

disabling HIGHPTE when PREEMPT_RT is enabled.

     Arnd

