Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D59BFA3751
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 21:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNaPKUGx0i7GPxS9qV3ftiVed/UzQ6HG+Hft9CuDkyk=; b=2WSrRfL/z5foC1AlKFPZ3NRA7z
	ascrfk8lBLia2GlvfyRcQkbF7KTvwBY5vM/5hxcordS7rmMt0fVxOf9v5C80voOjLF5Ppacut9YsL
	6d6dz/ypRqxrraJH+jdMU93P7333Yc9LEfleDT8IQ1/YH0zy7Sy0q207XP+401tbn5B1sH8oRIkbO
	yC4DrA9iW5GEr7TMV3f39vL17igs112Nw54HpRLr8TX1bb/GI426G4Rtp3wwIJqSB0g9S1ChJAW9b
	NDCdhqbhf5CmoJUhTDstWYITkHGLyrJarKIGlr3dHRNKIzXQznhLShUqkHHoAXjEudc2vGbgScVYN
	oHN52Bcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbn5K-00000008jvI-3oBX;
	Fri, 02 Jan 2026 21:53:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbn5J-00000008jv9-1mJk;
	Fri, 02 Jan 2026 21:53:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D1D76013D;
	Fri,  2 Jan 2026 21:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D09C116B1;
	Fri,  2 Jan 2026 21:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767390803;
	bh=oNaPKUGx0i7GPxS9qV3ftiVed/UzQ6HG+Hft9CuDkyk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ogDzbZHKQU2RBx2fdNIwScC07hsN0kNwhvw61Cp1uwYQF9wL9aqBSUXCUHzW+rIGT
	 4QwueY/wh3z5MoMKqkPRVZjdTLNM/MUZW1xCRckve05zeOnnbu9Ryn1ji6V1Nugt8G
	 +U50XhR5on5uJ7E/nyGPNweV7lBotly6NVuxFBF1riH+tR6hf/LQKE/8wofZU3FD4S
	 RYx2QBbOCdyJm6NcdUasdWS2i75pPF/XNFb5vVu7zcKTqkWeatboEOCC/JZDrsjLd6
	 5ufIwbcI1v1WW1qYzf10IGubd119PdiNX9b+8sdiUVP6C2i2t5uif4+zJI/vefRl6f
	 Nc6THmFT3pzZQ==
Message-ID: <a033a402-e3c5-4982-9fff-b6a4c55817ae@kernel.org>
Date: Fri, 2 Jan 2026 13:53:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARC: uapi: Stop leaking CONFIG_ARC_HAS_SWAPE
 reference to userspace
To: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-1-efba5c58073d@linutronix.de>
 <9ecebf46-c230-4074-9001-7ba9d65634f1@app.fastmail.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <9ecebf46-c230-4074-9001-7ba9d65634f1@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Arnd,

Long time no see. Happy New Year !

On 12/30/25 13:23, Arnd Bergmann wrote:
> On Tue, Dec 30, 2025, at 08:10, Thomas Weißschuh wrote:
>> UAPI headers are not supposed to leak references to kconfig symbols.
>> These won't be set when building userspace. Hide the kconfig reference
>> behind 'if defined(__KERNEL__)', so it will be stripped by
>> headers_install.sh. The result for userspace will be the same, but the
>> exception in headers_install.sh can also be removed.
>>
>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> Same as for the nios2 version, I think the nicer solution would
> be to use the asm-generic header for uapi and move this one
> to arch/arc/include/asm/swab.h for kernel-internal use.
>
> In theory, using 'select ARCH_USE_BUILTIN_BSWAP' in Kconfig should
> let the compiler pick the best swap instruction, which would
> be even less code, but I'm not sure if there was a reason that
> nios2 and arc don't already do this.

The builtins didn't exist when the insns were first rolled out in hw.
It seems ARCH_USE_BUILTIN_BSWAP assumes 16,32,64 variants to be available which
surprisingly seems to be true.

foo32:
    j_s.d    [blink]
    swape    r0,r0

foo16:
    exth_s    r0,r0
    asl    r2,r0,8
    lsr_s    r0,r0,8
    or_s    r0,r0,r2
    j_s.d    [blink]
    exth_s    r0,r0

foo64:
    mov_s    r2,r1    ;4
    swape    r1,r0
    j_s.d    [blink]
    swape    r0,r2

And as you said, since all upstream cores support SWAPE, we can really get rid
of all the legacy stuff and just rely on builtins.

Thx,
-Vineet

