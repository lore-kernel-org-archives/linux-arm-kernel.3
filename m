Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97A9C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jr9UUYTDJ7ikkP8jHrSyTuWft6sFVyd5UT0R70tW400=; b=MSGumaylLB5+7xw4CUMxn64ZqF
	oBvpYmivn2m4xfF5m4j3H5vB/Y3QDVeenRwWDj3mUGk7rg3pRCm4fHkYg288j3cWx0eMQKz+MzVF8
	ihCmPfNoUUNpisluhHC5SLyGYfQMSBihIrfkoRwlKBRrQ4k8vAW6n9Ir/xEfG1PDVjT0oQ1x2TSGZ
	DRH0wK9dtg4sj7HSLS/EH34W25A81OTl/Uaq/I+won9gS3DTDLmjcehunwTxgwI8SnS9JFYl3V5QF
	sbnwzpCMVRy1yaZCvVUK0xx4Fd06J2GyjmpYps0CHTeBO+jBqihKN4r6rAD2ytCbEH+sg/W/5/mN1
	obIc299w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR6j-0000000CZxo-1xpY;
	Thu, 03 Jul 2025 21:04:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNuC-0000000CAH3-3nuH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 17:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751564366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jr9UUYTDJ7ikkP8jHrSyTuWft6sFVyd5UT0R70tW400=;
	b=abUr61XRwRbAU+9GckYHH1eck5hA3fbHWWgeCxNoBTaPeIznGa5z6XPpu8CLbhdW0qTGSg
	tZwFjMiUbzNQJ5MqICXrukNxtaB22ziAaIL7NNqNZJg4lUrFpq41fgr1DzxExI8M0/0eOc
	U50knsePAvtus9AL8LK10ERmDMEkILY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-382-W8nV6t3uN-Ou3Ud00PVttA-1; Thu,
 03 Jul 2025 13:39:22 -0400
X-MC-Unique: W8nV6t3uN-Ou3Ud00PVttA-1
X-Mimecast-MFC-AGG-ID: W8nV6t3uN-Ou3Ud00PVttA_1751564359
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BF94F1808984;
	Thu,  3 Jul 2025 17:39:17 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.252])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0297C1956087;
	Thu,  3 Jul 2025 17:39:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-arm-kernel@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/2] arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Date: Thu,  3 Jul 2025 19:38:57 +0200
Message-ID: <20250703173859.246664-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_103929_018850_94617DDB 
X-CRM114-Status: GOOD (  18.01  )
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

The kernel Makefiles define the __ASSEMBLY__ macro to provide
a way to use headers in both, assembler and C source code.
However, all the supported versions of the GCC and Clang compilers
also define the macro __ASSEMBLER__ automatically already when compiling
assembly code, so some kernel headers are using __ASSEMBLER__ instead.
With regards to userspace code, this seems also to be constant source
of confusion, see for example these links here:

 https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
 https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
 https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
 https://github.com/riscv-software-src/opensbi/issues/199

To avoid confusion in the future, it would make sense to standardize
on the macro that gets defined by the compiler, so this patch series
changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.

I split the patches per architecture to ease the review, and I also
split the uapi headers from the normal ones in case we decide that
uapi needs to be treated differently from the normal headers here.

The related cleanup patches for x86, parisc, sh and arc patches
already got merged via their specific architecture tree:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24a295e4ef1ca8
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a141be3233af7
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cccaea1d66e94b
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e2b6a188625a2b
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9cc646950eefda
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=179e949719fe81
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2cb74be378675c

So I assume the arm patches should go via the arm tree.

v3:
- Split the arm patches from the global series
  (see https://lore.kernel.org/all/20250314071013.1575167-1-thuth@redhat.com/)
- Rebased the patches on linux-next and fixed the conflicts

Thomas Huth (2):
  arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

 arch/arm/include/asm/arch_gicv3.h                |  4 ++--
 arch/arm/include/asm/assembler.h                 |  2 +-
 arch/arm/include/asm/barrier.h                   |  4 ++--
 arch/arm/include/asm/cache.h                     |  2 +-
 arch/arm/include/asm/cp15.h                      |  4 ++--
 arch/arm/include/asm/cputype.h                   |  4 ++--
 arch/arm/include/asm/current.h                   |  4 ++--
 arch/arm/include/asm/delay.h                     |  4 ++--
 arch/arm/include/asm/domain.h                    |  8 ++++----
 arch/arm/include/asm/fpstate.h                   |  2 +-
 arch/arm/include/asm/ftrace.h                    |  6 +++---
 arch/arm/include/asm/hardware/cache-b15-rac.h    |  2 +-
 arch/arm/include/asm/hardware/cache-l2x0.h       |  4 ++--
 arch/arm/include/asm/hardware/dec21285.h         |  2 +-
 arch/arm/include/asm/hardware/ioc.h              |  2 +-
 arch/arm/include/asm/hardware/iomd.h             |  4 ++--
 arch/arm/include/asm/hardware/memc.h             |  2 +-
 arch/arm/include/asm/hwcap.h                     |  2 +-
 arch/arm/include/asm/irq.h                       |  2 +-
 arch/arm/include/asm/jump_label.h                |  4 ++--
 arch/arm/include/asm/kexec.h                     |  4 ++--
 arch/arm/include/asm/kgdb.h                      |  4 ++--
 arch/arm/include/asm/mach/arch.h                 |  2 +-
 arch/arm/include/asm/mcpm.h                      |  4 ++--
 arch/arm/include/asm/memory.h                    |  4 ++--
 arch/arm/include/asm/mpu.h                       |  4 ++--
 arch/arm/include/asm/opcodes.h                   | 12 ++++++------
 arch/arm/include/asm/page.h                      |  4 ++--
 arch/arm/include/asm/pgtable-2level.h            |  4 ++--
 arch/arm/include/asm/pgtable-3level.h            |  4 ++--
 arch/arm/include/asm/pgtable-nommu.h             |  4 ++--
 arch/arm/include/asm/pgtable.h                   | 10 +++++-----
 arch/arm/include/asm/probes.h                    |  4 ++--
 arch/arm/include/asm/proc-fns.h                  |  4 ++--
 arch/arm/include/asm/ptrace.h                    |  4 ++--
 arch/arm/include/asm/system_info.h               |  4 ++--
 arch/arm/include/asm/system_misc.h               |  4 ++--
 arch/arm/include/asm/thread_info.h               |  2 +-
 arch/arm/include/asm/thread_notify.h             |  2 +-
 arch/arm/include/asm/tlbflush.h                  | 10 +++++-----
 arch/arm/include/asm/tls.h                       |  4 ++--
 arch/arm/include/asm/unified.h                   |  6 +++---
 arch/arm/include/asm/unwind.h                    |  4 ++--
 arch/arm/include/asm/v7m.h                       |  4 ++--
 arch/arm/include/asm/vdso.h                      |  4 ++--
 arch/arm/include/asm/vdso/cp15.h                 |  4 ++--
 arch/arm/include/asm/vdso/gettimeofday.h         |  4 ++--
 arch/arm/include/asm/vdso/processor.h            |  4 ++--
 arch/arm/include/asm/vdso/vsyscall.h             |  4 ++--
 arch/arm/include/asm/vfp.h                       |  2 +-
 arch/arm/include/asm/virt.h                      |  4 ++--
 arch/arm/include/uapi/asm/ptrace.h               |  4 ++--
 arch/arm/mach-at91/pm.h                          |  2 +-
 arch/arm/mach-exynos/smc.h                       |  4 ++--
 arch/arm/mach-footbridge/include/mach/hardware.h |  2 +-
 arch/arm/mach-imx/hardware.h                     |  2 +-
 arch/arm/mach-imx/mxc.h                          |  2 +-
 arch/arm/mach-omap2/control.h                    |  8 ++++----
 arch/arm/mach-omap2/soc.h                        |  4 ++--
 arch/arm/mach-omap2/sram.h                       |  4 ++--
 arch/arm/mach-pxa/irqs.h                         |  2 +-
 arch/arm/mach-pxa/pxa-regs.h                     |  2 +-
 arch/arm/mach-s3c/map-base.h                     |  2 +-
 arch/arm/mach-sa1100/include/mach/bitfield.h     |  2 +-
 arch/arm/mach-sa1100/include/mach/hardware.h     |  2 +-
 arch/arm/mach-tegra/reset.h                      |  2 +-
 arch/arm/mach-tegra/sleep.h                      |  2 +-
 arch/arm/tools/gen-mach-types                    |  2 +-
 drivers/memory/emif.h                            |  4 ++--
 69 files changed, 129 insertions(+), 129 deletions(-)

-- 
2.50.0


