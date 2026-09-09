Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553D3C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD52kSI1bMiOql8tKOqAnnYbynQfw9FhKyunGxJ4H2w=; b=gCDy/vJ5IgnOoiTztDWD/Sba3g
	vemASlN5dOw43GZ4IXZFpgFPw2bEvbgyVJR8W1tqQpWmHNYbX434bGgLBPkPPb2wHCfEvK6MZoQ8w
	d7E85h9WRj0MKYPYZjVVPM4qu9sNm28e+o3ID7wTa1FM6B/2lgrLv1+jWOiE0lseb8j7KRJ8wTNu1
	9hGLs8LJ8JBqfkAMI3/q16JFNiDMUFZNXvs/U9dAQnERkisXqKd8h28jYkLQfd1GnM9yp9yZWceT2
	KGwdniLcTNinjQ7m3gx/cJYKYfmDU7NaMY33xSJd3lfp72oZLFJQi71DpOugI3yj3TXnvAOVCKcUt
	a3Z/j+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LOI-0000000CMVp-0yTa;
	Wed, 09 Sep 2026 16:43:18 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LOF-0000000CMTB-0i5X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:43:16 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4hg67P6Kgxzlfvpb;
	Wed,  9 Sep 2026 16:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1788972178; x=1791564179; bh=qD52kSI1bMiOql8tKOqAnnYb
	ynQfw9FhKyunGxJ4H2w=; b=n4iCgFEMQEmPX1Ij3Om1LK0nnt0tTbDtZwIZaOTn
	EjzudmIgqoqTb4QbC1dhTT1Ftbf/aItaxHEi+Rd0xWNQYl0kTvTP16N/icIcH4EI
	Zz2eIQERlJoHHbmCNZZPTYG5punBSLgYBvTClToBIMhDHs/S0D8Xi4CLqxl2o9+Y
	oIOidxOBUTHH3KeighWCbqqw9j5hBIK5WAhBnL7OGUy38v3NIildnCAHEZZGYJFW
	S0sjeoY6ZvCrnKj+jGgMARXK8B2qRZXKEUNAAcr1fd0BHCcqlRfbi6nI3RM5kmwx
	kbbsCtXMqx5SbisPCdGpU9E75nIxfYNUrN9AKtsQwNbxtw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id N08FdswJcFRd; Wed,  9 Sep 2026 16:42:58 +0000 (UTC)
Received: from [100.86.178.220] (unknown [104.133.214.192])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4hg6724zrCzlfvpG;
	Wed,  9 Sep 2026 16:42:54 +0000 (UTC)
Message-ID: <2da174ef-1d5a-425d-b885-be9482b0be90@acm.org>
Date: Wed, 9 Sep 2026 09:42:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-omap@vger.kernel.org, linux-block@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-4-arnd@kernel.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260908152808.3928630-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_094315_254672_FEBA623F 
X-CRM114-Status: GOOD (  18.52  )
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

On 9/8/26 8:27 AM, Arnd Bergmann wrote:
> The Acorn Risc PC is the oldest still support Arm machine in the kernel=
,
> originally shipped with an ARMv3 ARM610 support in 1994, it later allow=
ed
> faster StrongARM CPUs.
>=20
> The main limitation here is the CPU bus that does not allow 16-bit
> wide data transfers and hence requires the kernel to be built with the
> -march=3Darmv3 compiler option that was discontinued in gcc-9.
>=20
> As gcc-8 is barely supported for compiling the kernel, this one
> will not see another LTS kernel release, so remove it now.

If this patch has to be reposted, here is the feedback of my AI coding
assistant (based on an LLM and hence may be wrong):
----------------------------------------------------------------------
Overview
--------
This patch removes the Acorn RiscPC platform (ARCH_RPC), the oldest=20
32-bit ARM machine supported in mainline Linux (originally ARMv3 ARM610,=20
later StrongARM SA-110). Because RiscPC hardware requires -march=3Darmv3=20
(discontinued in GCC 9) due to bus limitations, deprecating and removing=20
it paves the way to clean out legacy ARMv3 support from the kernel.

Removing RiscPC also represents a major architectural milestone for=20
arch/arm: with SA-1100 (patch 1), Footbridge (patch 2), and RiscPC=20
(patch 3) removed, COMMON_CLK, SPARSE_IRQ, and USE_OF (Device Tree)=20
become unconditionally selected for all 32-bit ARM targets, and legacy=20
headers mach/io.h and mach/memory.h are eliminated.

Overall, this is a very welcome cleanup, but there are a few missed=20
references, orphaned symbols, and stale comments that should be addressed=
.

Issues & Observations
---------------------
1. Missed arch/arm/Makefile cleanup
Patch 03 deletes the entire directory arch/arm/mach-rpc/, but does not=20
touch arch/arm/Makefile. As a result, two orphaned entries remain:

makefile


machine-$(CONFIG_ARCH_RPC)		+=3D rpc
machdirs-$(CONFIG_ARCH_RPC)		+=3D arch/arm/mach-rpc
Furthermore, machdirs-$(CONFIG_ARCH_RPC) was the very last user of=20
machdirs- in arch/arm/Makefile (after Footbridge and SA-1100 are removed=20
in patches 1 & 2):

makefile


# legacy platforms provide their own mach/*.h headers globally,
# these three are mutually exclusive
machdirs-$(CONFIG_ARCH_FOOTBRIDGE)	+=3D arch/arm/mach-footbridge
machdirs-$(CONFIG_ARCH_RPC)		+=3D arch/arm/mach-rpc
machdirs-$(CONFIG_ARCH_SA1100)		+=3D arch/arm/mach-sa1100
KBUILD_CPPFLAGS +=3D $(patsubst %,-I$(srctree)/%/include,$(machdirs-y))
Once RiscPC is gone, the entire machdirs- inclusion block can and should=20
be removed from arch/arm/Makefile.

2. Missed ARCH_ACORN reference in lib/fonts/Kconfig
The patch deletes config ARCH_ACORN from arch/arm/Kconfig and removes=20
#ifdef CONFIG_ARCH_ACORN from
lib/fonts/font_acorn_8x8.c
, but missed
lib/fonts/Kconfig:74
:

kconfig


config FONT_ACORN_8x8
	bool "Acorn console 8x8 font" if FONTS
	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
	default y if !SPARC && !FONTS && ARM && ARCH_ACORN
Because ARCH_ACORN is removed, this default can never trigger and the=20
reference should be cleaned up.

3. Orphaned ARCH_RPC reference in arch/arm/mm/Kconfig
In
arch/arm/mm/Kconfig:281-282
:

kconfig


config CPU_SA110
	bool
	select CPU_32v3 if ARCH_RPC
	select CPU_32v4 if !ARCH_RPC
Since ARCH_RPC is removed, select CPU_32v3 if ARCH_RPC references a=20
non-existent symbol. If CPU_SA110 remains temporarily (before the=20
architectural cleanup in 7.5), this should be simplified to select CPU_32=
v4.

4. Dead code in arch/arm/kernel/atags_compat.c
With CONFIG_ARCH_ACORN removed from arch/arm/Kconfig, two blocks in
arch/arm/kernel/atags_compat.c
  are now dead code:

Lines 150=E2=80=93157: #ifdef CONFIG_ARCH_ACORN / if (machine_is_riscpc()=
)=20
memory bank tagging.
Lines 186=E2=80=93194: #ifdef CONFIG_ARCH_ACORN ATAG_ACORN translation.
These blocks should be removed as part of this patch.

5. Stale comments
arch/arm/include/asm/io.h:207-209
:
c


/*
  * Now, pick up the machine-defined IO definitions
  */
#if IS_ENABLED(CONFIG_PCMCIA) || defined(CONFIG_PCI)
CONFIG_NEED_MACH_IO_H and #include <mach/io.h> were removed, leaving=20
this comment describing generic PCI/PCMCIA I/O limits.
arch/arm/boot/bootp/Makefile:21
: # guess an initrd location if possible is left dangling right before=20
ifdef INITRD_OFFSET after all initrd_offset-$(CONFIG_...) logic has been=20
stripped out.
6. Floppy driver & arch/arm/include/asm/floppy.h status
The patch removes the ARM MFM AND FLOPPY DRIVERS entry from MAINTAINERS:

diff


-ARM MFM AND FLOPPY DRIVERS
-M:	Ian Molton <spyro@f2s.com>
-S:	Maintained
-F:	arch/arm/include/asm/floppy.h
-F:	arch/arm/mach-rpc/floppydma.S
While
floppydma.S
  was deleted,
arch/arm/include/asm/floppy.h
  was left in the tree.

On ARM, floppy support requires ARCH_MAY_HAVE_PC_FDC, which was selected=20
only by Footbridge and RiscPC.
With both gone, no ARM board selects ARCH_MAY_HAVE_PC_FDC.
Furthermore, asm/floppy.h references IRQ_FLOPPYDISK and DMA_FLOPPY,=20
which no longer exist on ARM.
Either
arch/arm/include/asm/floppy.h
  and config ARCH_MAY_HAVE_PC_FDC in arch/arm/Kconfig should be deleted=20
in this patch, or noted if intentionally deferred to the 7.5 driver clean=
up.
7. Good changes & verification
block/partitions/Kconfig: Dropping default y if ARCH_ACORN while keeping=20
ACORN_PARTITION available under PARTITION_ADVANCED is correct; users can=20
still inspect/mount Acorn media on modern architectures.
drivers/tty/vt/keyboard.c: Clean removal of !defined(CONFIG_ARCH_RPC)=20
from the raw keyboard scan handler.
Elimination of NEED_MACH_IO_H and NEED_MACH_MEMORY_H: Very clean removal=20
across arch/arm/Kconfig, arch/arm/include/asm/io.h,=20
arch/arm/include/asm/memory.h, and arch/arm/mm/mmu.c.
Minor Typo in Commit Message
text


The Acorn Risc PC is the oldest still support Arm machine in the kernel,
originally shipped with an ARMv3 ARM610 support in 1994, it later allowed
faster StrongARM CPUs.
"oldest still support Arm machine" -> "oldest still supported Arm machine=
"
"with an ARMv3 ARM610 support" -> "with ARMv3 ARM610 support" or "with=20
an ARMv3 ARM610 CPU"

