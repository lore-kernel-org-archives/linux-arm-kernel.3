Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9932EC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 09:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtS9wSJO7yQxTeHMAqbEeeg30dK8tgff88uUJOqCVPk=; b=gISv1Wu53Pu1DACpbEdBSfq5mc
	nxhnmUFaIlm+UOv9hlgPmu8SCNY9bcGvJwpHsN82sMpysYoM8JeASaxvHAmE3+5TZSeI/AOWhx3Xg
	R7bQ95rZixx2zTwnPEBV6TW5sLWP1AYgcMRy64GLxyXwj6FOwb5rIwR61gYlVy2Hvb7giLd0E2bxV
	b7jm66mC2oPmkjBAOpl+RejqJcbO+g4/JwbssLGAnqWJiNgt5es9LTKzZqv8Z8a4IB9g5amLQwgPS
	tm6pgWjzzAST2zIftOv8ut2IjMkjatbx0Nt6HnvtGwHMskol6pZBG//BpCBUOlRu/6KnOGf79W05f
	bWXke92g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtRt-00000005n5m-2FyU;
	Mon, 17 Aug 2026 09:16:05 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtRq-00000005n5R-0xOp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 09:16:03 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C73B11400037;
	Mon, 17 Aug 2026 05:15:59 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 17 Aug 2026 05:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786958159;
	 x=1787044559; bh=CtS9wSJO7yQxTeHMAqbEeeg30dK8tgff88uUJOqCVPk=; b=
	M5XW31s/udPv2pZep1A7RvH6dRxtxYIJkizEH9NHHV2iXiPI3Kugjb843ROAY05f
	JHHg0PUg3Nc9GZ0OOacvE47Ihsq9wYtMEpENtsWsKFA0K4EdewMOHOqumtsBdkN/
	d+QFkSDi0KNQ5YDwJdZu5fJ20zM2zzK6GKqhP+ZdAFDOUmsg5+unQY2wN7Sxvw+Y
	1R9RJ0jT9L9eM+cgDkFKm0K/0I2f9jI6cVUezeu/4VDP82hUoa5XpPosPMTWdsed
	ugyrVfXXWV8hTqRXBGtpcjJ2s7F5jJt5FI2hHkgiYG2cJTV/NVunP4HjmBI67ht6
	bimh9f7ad/M1touSMnMKwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786958159; x=
	1787044559; bh=CtS9wSJO7yQxTeHMAqbEeeg30dK8tgff88uUJOqCVPk=; b=A
	UrY68IvOqOwZH3LMVdmaRTBhBX/+fvIFas5qgzW+p9IstKDMkeUA9lrjFIYAwJto
	IRUtP1DX8772QaGMTzsg1syumuxzFhZFbGRdLCRcthSteZynfnpixw2uUKrqbE/+
	b3kRMnrHenfx//yr5PTEMYphhiZW6C82BbeAt2pZx0trBQNKiGJ7OL3+6mIwAgZY
	MYR0Ohaz9c4blY+iZAf+IWdblmDexaAP0SpEp2tA1fcd0VDkGR4C/D3PncUCH/2D
	OrukiWxFPercz1GMAIxU6UsD3gmGxvS653HonqqJ9aujBYWpubj60iP0xV2PxKN2
	uh4GwHtT9R9SEG+xSCByw==
X-ME-Sender: <xms:StGCagn1wKta5VF6aYIMN5XKtn205JHOIdKHMHwC_PL2nNxHO9GcJw>
    <xme:StGCaqo-KQu-_M1tuS12aBR4LYfocz7vl0sq_qyAd4IFblNVQTq0OonLjr6TOhX2S
    6KU-mWI6z_2aIDQBVhk7hBvgT74ysO02s_GyNJZkPTO5xsCW17pj0GI>
X-ME-Proxy-Cause: dmFkZTEzp/LQEyITID0FxiIgeeeGn/7LhpnhWO/TT+0Xiqu2JHkRt1Oi8GQ32eBY6RLl3I
    RcuCYXzLT0qWSBZ6RtUHfBIt6Jjtyb5EVr4lvcg8ZHg9eYfkdCEJGge7iJwmUGbtHJt7J7
    MR6O9EitekEWgMZPMkay3Ue8Pa+QeMu3Qed+am+jbogw0cSnjby1BBAQiZ5ZZ15FluJXv2
    rmXnArupFuLb8Dn13N3K8OxKkTcKRo+DW43Hw+WTNsnRXqUCH5D/f+jODbY4UsfGNmNMU0
    9G2XoexJjkHvVDj1/YOAzx2+16QpiEW4i0rK96q4+b06lTQSbliXtQ/lHW+fR9JwX5MXj4
    JUauh9SS/CISKlVCOakMK23t6ZAbOJ6U54c+vndQf18C8F1p0p4XX+C40z4STNAQuz95kc
    KQMVk8oxoeBirHyNqSxqbjUNq0OaoC8/X8A2HndhabbjlvQH66O5wBDoAQr7XEaGdnrcwE
    TvpfNgVLt/b4coqpjc/9FyzkU+3yfFG05L97bu1qoK/b/JQELMpvggbfT/33mSBAkXsJbJ
    udwUeH6PEBUaEVpBpswczs6Ky4sVuPHoNSEgaJwMz3UutHPNIrUUojm6BK+pRhCnQGfHNJ
    pw1a0MDQcVdxyZV7+mTf4RCMTEc25K9dxE5s+6kAuLO6rFNyKm9LR2H3PYxw
X-ME-Proxy: <xmx:TNGCaiNk81mgYmEo9IzxVEUb9fyxLHOM3DdrD5DF20DG6vPtPIWP7A>
    <xmx:TNGCarB0KvV6N622tbb8fwJzuylyjwaO5iUQnenvjj7RI9sMf-LDzw>
    <xmx:TNGCapIqBC4DneE6_oB9B5t15ECwy0otluvvwaHdZiQCAiN942EjTA>
    <xmx:TNGCakNHBr8V5Rbt_9jlQNfUowqcQWOQRkY-Nfd_GlXaOU7IE6ITQg>
    <xmx:T9GCar_YygLInF3ygbuTXP8FCYgsyfriTnjuC68bf3Ssu8m5Z7Us9upv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9517832A006E; Mon, 17 Aug 2026 05:15:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Aqm_jcT6PvEF
Date: Mon, 17 Aug 2026 11:15:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: "Mark Rutland" <mark.rutland@arm.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <e238944c-9349-497a-9d30-0dd2edd7f115@app.fastmail.com>
In-Reply-To: <20260817000231.21311-1-kmehltretter@gmail.com>
References: <20260817000231.21311-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] arm64: compat: Keep alignment address arithmetic 32-bit
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_021602_627012_D12AD9DD 
X-CRM114-Status: GOOD (  14.65  )
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

On Mon, Aug 17, 2026, at 02:02, Karl Mehltretter wrote:
> The compat alignment emulator inherited unsigned long data addresses
> from the 32-bit ARM implementation. On arm64, negating the unsigned int
> transfer size wraps it at 32 bits before it is added to a 64-bit
> address. A decrementing LDM or STM therefore adds nearly 4 GiB instead
> of subtracting its transfer size. The resulting address lies outside
> the compat task's address space, so the access fails and the process
> gets a spurious SIGBUS instead of the fixup.
>
> Using 64-bit addresses also prevents transfer and writeback arithmetic
> from wrapping at the AArch32 address-space boundary.

Hi Karl,

Nice find! How did you come across this?

Your patch looks correct to me, but it took me a bit to understand
it, as I found the use of compat_ptr() and changing the addressing
to 32-bit a little confusing at first.

>  	unsigned int rd, rn, nr_regs, regbits;
> -	unsigned long eaddr, newaddr;
> +	u32 eaddr, newaddr;
>  	unsigned int val;

As I understand it, the underlying problem here is the
32-bit overflow of nr_regs. Wouldn't it be sufficient
to just turn nr_regs into an 'unsigned long' or 'size_t'
in both instances?

> -				if (get_user(val, (u32 __user *)eaddr))
> +				if (get_user(val,
> +					     (u32 __user *)compat_ptr(eaddr)))

The individual compat_ptr() in each access looks like it would
have been sufficient as well, by avoiding the effect of the
overflow, and it also makes the address wrap back to zero
at the end of the address space. What's a bit confusing here
is that accessing an unaligned set of words at the end of the
address space will still read a couple of bytes beyond the
end of the 32-bit space.

Again, none of this is wrong, just wondering whether a simpler
change would make this easier to understand and keep the code
closer to the original arm32 version.

     Arnd

