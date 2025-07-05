Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4E0C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 00:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEeVyQfEh3s84Gk/h1G/+yo135mlgtCH8tpGlJcItNI=; b=Ks21BS28+piVdW0mHhgMRyBy//
	UoncfAKjCLYROYcTN8UMXl06ITsYqbxA3YWcuvZFBgrXNYh7+3y5YHpSJDSDuijWReDFeUQ1dLxzU
	1HdcJiuRhRbtOuoNuzenfInxdTcV2ZkAHZIQyOWP3i//e3c0vZh4aG2BgRd8jOynq6+kVmiPvrTHa
	AYkkivCTF5ueOSHfSenm92mWCkm2ZRawXMWdf7zHURhjVofWy5LUW2t823/EoZIP22/4SKD5oUAvq
	/F9ajiWnXHoWgV8SYpykLc/yF/9jJ+qz0J32HhYF8C0kE/ecj/I5mb6cvt/cwu22z0Pqy+yW2oL33
	DC6ZM6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXqm5-0000000FiTe-3WOa;
	Sat, 05 Jul 2025 00:29:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXqhN-0000000FiEI-1in7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 00:24:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 584106146C;
	Sat,  5 Jul 2025 00:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3561FC4CEE3;
	Sat,  5 Jul 2025 00:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751675047;
	bh=TYMHv9Dv3jYkEo0ht4anEZrvvyj/u+eRTcHdOKiIkT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYidcRh9JSsGEtUvSUoH8Iej1+FHtvxx79zfAWPMVtVKYmKKsFV7NnX8VP71MxHJD
	 A03GKEFUqUDO4mRq2W9QHOlCF+4eE0AuCaXs0AMs+QPax+l8/IV3TKLnxzK5I51LSx
	 4gLLjta80GaB/gRhUoabLoOPA+JQGaVjIxf4dYCk1vZarSltPACBtJcEy/kBNl89vS
	 iophvVHOe0uKLMAVbTWjMLWEh8yEPMTphAT8GZR5m9tza6FaHfrcWcbjqWeKmgkPcp
	 0QblpLiigZu7bcz2Gcv3Gkz9bA233H3uHDkQ6TSrPtWJn5zuqwsrqfsRBCBhLft0vO
	 y8Y9aemEcEngA==
Date: Fri, 4 Jul 2025 17:24:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rob Landley <rob@landley.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Eggers <ceggers@arri.de>, Arnd Bergmann <arnd@arndb.de>,
	Yuntao Liu <liuyuntao12@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>
Subject: Re: [PATCH 1/2] ARM: Require linker to support KEEP within OVERLAY
 for DCE
Message-ID: <20250705002402.GA1968690@ax162>
References: <20250311-arm-fix-vectors-with-linker-dce-v1-0-ec4c382e3bfd@kernel.org>
 <20250311-arm-fix-vectors-with-linker-dce-v1-1-ec4c382e3bfd@kernel.org>
 <CACRpkdY-yxaiG89Co+C2=vyd0i6sh9pP0UGWZh1yUg4jd9jmuQ@mail.gmail.com>
 <6739da7d-e555-407a-b5cb-e5681da71056@landley.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6739da7d-e555-407a-b5cb-e5681da71056@landley.net>
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

On Fri, Jul 04, 2025 at 02:15:18PM -0500, Rob Landley wrote:
> On 3/13/25 03:48, Linus Walleij wrote:
> > On Tue, Mar 11, 2025 at 8:43 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > 
> > > ld.lld prior to 21.0.0 does not support using the KEEP keyword within an
> > > overlay description, which may be needed to avoid discarding necessary
> > > sections within an overlay with '--gc-sections', which can be enabled
> > > for the kernel via CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
> > > 
> > > Disallow CONFIG_LD_DEAD_CODE_DATA_ELIMINATION without support for KEEP
> > > within OVERLAY and introduce a macro, OVERLAY_KEEP, that can be used to
> > > conditionally add KEEP when it is properly supported to avoid breaking
> > > old versions of ld.lld.
> 
> I bisected the 6.15 armv7l build break my mkroot project hit to this commit
> (e7607f7d6d81):
> 
>   LD      .tmp_vmlinux1
> Segmentation fault
> make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 139
> make[1]: ***
> [/home/landley/toybox/clean/root/build/armv7l-tmp/linux/Makefile:1226:
> vmlinux] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> 
> The toolchain in question was built from gcc 11.4.0 and binutils 2.33.1
> which were the newest versions supported by
> https://github.com/richfelker/musl-cross-make when the still-current musl
> release (1.2.5) came out.
> 
> You can grab a binary toolchain to smoketest with from https://landley.net/bin/toolchains/latest/armv7l-linux-musleabihf-cross.tar.xz
> and build using the attached miniconfig ala:
> 
> for i in distclean allnoconfig ""
> do
>   CROSS_COMPILE=armv7l-linux-musleabihf- make ARCH=arm \
>     KCONFIG_ALLCONFIG=linux-miniconfig -j4 $i
> done
> 
> This _just_ seems to affect armv7l: armv5l and aarch64 still build fine.

Hmm, I do see a bug in that change, as it allows DCE to be turned on
with binutils older than 2.36, which should be avoided with something
like

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3072731fe09c..962451e54fdd 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -121,7 +121,7 @@ config ARM
 	select HAVE_KERNEL_XZ
 	select HAVE_KPROBES if !XIP_KERNEL && !CPU_ENDIAN_BE32 && !CPU_V7M
 	select HAVE_KRETPROBES if HAVE_KPROBES
-	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if (LD_VERSION >= 23600 || LD_CAN_USE_KEEP_IN_OVERLAY)
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if (LD_VERSION >= 23600 || LD_IS_LLD) && LD_CAN_USE_KEEP_IN_OVERLAY
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
 	select HAVE_OPTPROBES if !THUMB2_KERNEL

but it does not seem like your test configuration enables
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION so I would expect this change to be
a no-op in that case? Does the above change work for you? I won't be
free to validate this until after the weekend.

Cheers,
Nathan

