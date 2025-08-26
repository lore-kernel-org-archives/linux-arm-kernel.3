Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90BACA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 14:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApjG81rInNjF1hqd0jas1HuWqCbxWWM3TdhQAfyik1A=; b=v4wyRoD7KczbQieTJ5KKs2Vzrx
	I41g937U4j/xGs+loxyLFJqrYSWa1PCRGIoyW6O1i6okiYmXz2gw9T/f2b+28yLuwBF9GTrdU4BkP
	h8QbICk5chjbXeq7UW01TDSytJHAdVlk+jjJpYSYvM9loj1mlWvGCTcdSwKYaEERojX3AlKrZlI3H
	+HvxhiZOIyro7Z5aVSUUyNteYe0UN0+0aSXzI9HFceadJ9RE5bZH29ATZdiaurULGqxZYInfQUYD+
	XM157XFb2QCsRFwIIWlsOa+IODVAjOzKR9VUQcajINriFeC9cLAYYel79QTfff+laq+dzTTSzgrkd
	GE4qghHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqv30-0000000CKwY-2ltE;
	Tue, 26 Aug 2025 14:53:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtZn-0000000C4jw-31Mj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 13:19:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92646449B6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 13:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE2DC116B1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 13:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756214341;
	bh=ApjG81rInNjF1hqd0jas1HuWqCbxWWM3TdhQAfyik1A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OaN05jrq4bi1inIfwZLBoKx3WxbZFy61nC/Ox+qKesHiHM6B4L6RWfQ64JcvKeHvv
	 /EqU5YKXp5d7VS83bfrTVG46y4RQnGER8zHlVVkVoAMMDpnrCl8cNAwQorbMB1xixn
	 toSpYUzly+7E+/79KvJcMe7eBFMDvQAWahfshq9YyxeKfdXyRcIgD7Lkx9MusAEDsA
	 b+c1ti+XfMLpGeR427/4gdcTNL5sl+jVKEIxIGF5BR8c7Z+Hf8UhemVq91qqos/UDP
	 IV09e6418LoxBEv7kdyUg9iZMSSHy7xrYZr8utXhtGCZ+sx9WDQBiUrsDMAw1kBpBV
	 suB+kG/vNWNFA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f48d61ea2so2358906e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 06:19:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmfG/RfRSraTAEeqDGR+OEm/y9j189kFK9YBwsSE+5NyJ1Ta1lJdhzCgh64AoncQ2uTjKR0n+eWt0L3EdBAvz4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe0bS8nFSnOunPzI3JlF+E+17sSPgyypLzPa9s4yRQ9KUfbHNJ
	JO7xqaCaI1k9+4G/5d0/8rN/PJKsrOxNnvHUUwMPz1XuvqVcLriYaClADshPCZ78750RYzUPCE3
	msLh96MVluQFUhpONzCLPGD/BUrSfBQU=
X-Google-Smtp-Source: AGHT+IHXfrp3kCO8WaAYTKzmpHz9Y3xyqEAYoduTi5fzZtjnKLnhuV4OCEfMD69+6cml/MqmaABjcDK3g2CbLyEpMrk=
X-Received: by 2002:a05:6512:61d0:20b0:55f:34e8:b1b0 with SMTP id
 2adb3069b0e04-55f34e8ca18mr2581628e87.15.1756214339485; Tue, 26 Aug 2025
 06:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
 <20250821-bump-min-llvm-ver-15-v2-3-635f3294e5f0@kernel.org>
 <35178205-7cff-4b4b-abdd-b4cfb9e69dc2@app.fastmail.com> <6b2c0063-1523-4644-a32c-6aa918ad9dd8@app.fastmail.com>
In-Reply-To: <6b2c0063-1523-4644-a32c-6aa918ad9dd8@app.fastmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 26 Aug 2025 15:18:48 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEOmvUx8f=_v7_AFhMLobtauSw20t76sEDmzays4NLQnw@mail.gmail.com>
X-Gm-Features: Ac12FXzs5STcbVyw1zGnE4IpQ5_3OWRNRisWxOHjyZfN8oZRJqnrrFNRfifbWv4
Message-ID: <CAMj1kXEOmvUx8f=_v7_AFhMLobtauSw20t76sEDmzays4NLQnw@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	patches@lists.linux.dev, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_061903_808002_F3FAFEF5 
X-CRM114-Status: GOOD (  23.99  )
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

On Fri, 22 Aug 2025 at 22:04, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Aug 22, 2025, at 09:05, Arnd Bergmann wrote:
> > On Thu, Aug 21, 2025, at 23:15, Nathan Chancellor wrote:
> >
> > Would it be possible to either change the macro or to move
> > the overflow_stack_ptr closer in order to completely eliminate
> > the CONFIG_ARM_HAS_GROUP_RELOCS symbol and have VMAP_STACK
> > enabled for all CONFIG_MMU builds?
> >
> > Are there any other build testing issues with ARM_HAS_GROUP_RELOCS
> > besides the one I saw here?
>
> With some more randconfig testing, I did come across a few
> configurations that each fail with hundreds of errors like
>
> arm-linux-gnueabi-ld: drivers/crypto/hifn_795x.o(.text+0x99c): overflow whilst splitting 0x10a61854 for group relocation R_ARM_LDR_PC_G2
>
> so I guess we'll have to stick with the current dependency,
> at least for ARMv6 and below.
>

This is due to LOAD_SYM_ARMV6() (rather than the ldr_this_cpu_armv6
asm macro), which is used to implement get_current() on configs that
use a global variable to store the current task pointer (i.e., non-k
v6 and older). It eliminates the first of two LDRs, which would
pollute the D-cache otherwise, as every occurrence of get_current()
emits a literal into .text carrying the address of the __current
global variable. The D-cache footprint of each such literal is a
cacheline, which never contains other useful data.
(The second LDR is needed and always refers to the same address so it
does not impact D-cache efficiency)

The LOAD_SYM_ARMV6() sequence has a range of 256 MiB, which is
sufficient for any ARM kernel that can be meaningfully used in
production. However, randconfigs may produce kernels that are larger
than this, and so we need the COMPILE_TEST check if we are going to
keep the optimization, and I think it is meaningful enough to do so.

