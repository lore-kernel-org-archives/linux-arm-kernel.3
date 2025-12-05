Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC57CD339AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 18:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5fT0V/7EcGVNeWv5Ukgul6S9sM0pvDeoYDyMv8o/Gc=; b=gmEJ6In/eKG9IIQc4Sm9ZsHND5
	LDnwVdz8d8hIvuBOHPhC+DPvcAmK6yxpNFPNpp8PU+R5y6wmOlk44zZludlz7rmHxFajKfnrDuQSz
	AY8EVQSc27flLcl9BnZ5OOICV4xlptdyqO3nvdo71oXe/z2OP8vwJ9Earh3ofgKeo/b1z4lJGbUXn
	d7zcOJNh7Nx3TGOJjc5V76jt610Czxe6rOGGWGcOvTDvSwtPytZnA+kqkYVa9E8kKUTY5VIPQGewC
	v6MV6Br6ZMbF9X7cU6DbfnoUQuT3nQ2GBNgYevkCsBGTEIG3Edvlz1qXmFRvxzVP1QA2pDAu4VUaw
	B89pRH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRad2-00000009opb-1HFo;
	Fri, 05 Dec 2025 18:34:04 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRacz-00000009op5-0wkr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 18:34:02 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A3E667A00B1;
	Fri,  5 Dec 2025 13:33:59 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 13:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764959639;
	 x=1765046039; bh=F5fT0V/7EcGVNeWv5Ukgul6S9sM0pvDeoYDyMv8o/Gc=; b=
	GtGktRiHR7mRGIwQnGlJM7skezEgo02pm08ocXBxFKc1npvy881zwF2n0a5t75Ms
	1uf4SCblSAQQCl9mnvlWbu0bTqKbx02AI0CTia2m64YGnuvsLRbvWqW7aI+LstX6
	uzLBcIHCIM3XMx6eZCKBLu7nsmkQuGX8MvOEJKP+bTN8gpCPSXkc84RbkXJvD1NJ
	FjEHR1/Ke1Nk/SG2EvlyVqBWeCIxfWCGCkShuF4lBIqxi/9VBd4iSShsqRwCik3c
	vUA5wGQGWentLSc12piKwiH3I+1qE8ytwvtQoIrJW79WYNJKr39MrDYa5ANNck5E
	U3vX2pizKWle9qTRbVBrgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764959639; x=
	1765046039; bh=F5fT0V/7EcGVNeWv5Ukgul6S9sM0pvDeoYDyMv8o/Gc=; b=x
	pfsyZ5jTSWHB6SbVeXbSiU77bh4lIKUM1Q0zNPUVpCjtj8vm5md/aWzkE1zOeWEx
	i79dhI2SHYrnmZTMLEW5dxQAEUyRoKP3Z4nK2jVitkUhn/5V6/C+UiQO0SwrqRYl
	mv+zs/L9IifL9PcxlZkAsRP2uYOEOUlTnMdCbXK9cnAfuP45SSvzm6iPKVSZUhQm
	Aq3vetm1vpnzrp68ZMB9NIICVQAIcvhzNMrunWw87fviwuUmvkIDd4YAfaAr3Mwy
	QIIrjG6eybdK1G8Pak1ZPAT9XIih6VUObOccaeejCZTWO7+/IQvO9V0cY1U87JKF
	hDaIDTYgp4P/UZDJVT2+Q==
X-ME-Sender: <xms:lyUzacER3BDEPqTyMfHH8m_CXfz_jcpmPwUm_-6xUsfpNrv53-sN2Q>
    <xme:lyUzaQLJIX2KZ_K8EhFyh5XQ2kWnQulcOGncb7cMwsmIZpnOQXERLwQHPWTjq5mmR
    KMrUYEfGTyXPQVf5cZvLdxt22PPepC4dgZSzOSx5K5emFVv8mQVIhk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeluddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epueevgeeigfehfeejuedufeffgfeivddvfffhjedvhfekkeduuedvteeujedutdetnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghdpphgvnhhguhhtrhhonhhigidruggvnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghv
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:lyUzadwgPWlcMwJcZkBtxR-JTR0Yv5i7096gv8zvZM0X0XQYmPQnEA>
    <xmx:lyUzaUKMieiKUhvVqYc_iqkmHxQ4T3RxbxHXQJ8vyDeG4USuVplY9A>
    <xmx:lyUzafqWfsK963xpo970d-3Shi3uycgQo_rKfcymhwfHScbYtTFg-Q>
    <xmx:lyUzabIOpAtxWw3ia9VAY9rG2wGuFMvWu9lFWzvKfvNELNAyEt7itw>
    <xmx:lyUzaWZlidV9u5yLSGp08kEwT1aU5V0cxYuVASuY2kKhEDTsdT2wyStD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5F6A6C40054; Fri,  5 Dec 2025 13:33:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 19:33:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <16f9deb7-8717-4983-99b7-91a6e84eb560@app.fastmail.com>
In-Reply-To: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
Subject: [GIT PULL 6/6] soc: driver updates for 6.19, part 2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103401_376146_C38DA827 
X-CRM114-Status: GOOD (  14.90  )
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

The following changes since commit 6a23ae0a96a600d1d12557add110e0bb6e32730c:

  Linux 6.18-rc6 (2025-11-16 14:25:38 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.19-2

for you to fetch changes up to 68f9bbf4dfc356ccc6586ba6e7dd79576c48f7f0:

  Merge tag 'samsung-drivers-6.19-2-late' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/drivers-late (2025-12-05 15:31:33 +0100)

----------------------------------------------------------------
soc: driver updates for 6.19, part 2

These updates came a little late, or were based on a later 6.18-rc
tag than the others:

 - A new driver for cache management on cxl devices with memory shared
   in a coherent cluster. This is part of the drivers/cache/ tree, but
   unlike the other drivers that back the dma-mapping interfaces, this
   one is needed only during CPU hotplug.

 - A shared branch for reset controllers using swnode infrastructure

 - Added support for new SoC variants in the Amlogic soc_device
   identification

 - Minor updates in Freescale, Microchip, Samsung, and Apple SoC drivers

----------------------------------------------------------------
Arnd Bergmann (8):
      Merge tag 'reset-gpio-for-v6.19' of https://git.pengutronix.de/git/pza/linux into soc/drivers-late
      Merge tag 'reset-gpio-for-v6.19-2' of https://git.pengutronix.de/git/pza/linux into soc/drivers-late
      Merge tag 'amlogic-drivers-for-v6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into soc/drivers-late
      Merge tag 'soc_fsl-6.19-1' of git://git.kernel.org/pub/scm/linux/kernel/git/chleroy/linux into soc/drivers-late
      Merge tag 'apple-soc-drivers-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux into soc/drivers-late
      Merge tag 'soc-drivers-for-v6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/drivers-late
      Merge tag 'cache-for-v6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/drivers-late
      Merge tag 'samsung-drivers-6.19-2-late' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/drivers-late

Bartosz Golaszewski (9):
      software node: read the reference args via the fwnode API
      software node: increase the reference of the swnode by its fwnode
      software node: allow referencing firmware nodes
      gpio: swnode: allow referencing GPIO chips by firmware nodes
      reset: order includes alphabetically in reset/core.c
      reset: make the provider of reset-gpios the parent of the reset device
      reset: gpio: convert the driver to using the auxiliary bus
      reset: gpio: use software nodes to setup the GPIO lookup
      platform/x86: intel: chtwc_int33fe: don't dereference swnode args

Charles Keepax (1):
      spi: cs42l43: Use actual ACPI firmware node for chip selects

Christophe Leroy (CS GROUP) (1):
      MAINTAINERS: Update email address for Christophe Leroy

Conor Dooley (4):
      dt-bindings: soc: microchip: document the simple-mfd syscon on PolarFire SoC
      soc: microchip: add mfd drivers for two syscon regions on PolarFire SoC
      MAINTAINERS: add new soc drivers to Microchip RISC-V entry
      MAINTAINERS: rename Microchip RISC-V entry

Gongwei Li (1):
      soc: fsl: qbman: use kmalloc_array() instead of kmalloc()

Johan Hovold (5):
      soc: apple: mailbox: fix device leak on lookup
      soc: apple: sart: drop device reference after lookup
      soc: amlogic: canvas: fix device leak on lookup
      soc: amlogic: canvas: simplify lookup error handling
      soc: samsung: exynos-pmu: fix device leak on regmap lookup

Jonathan Cameron (4):
      memregion: Drop unused IORES_DESC_* parameter from cpu_cache_invalidate_memregion()
      arm64: Select GENERIC_CPU_CACHE_MAINTENANCE
      MAINTAINERS: Add Jonathan Cameron to drivers/cache and add lib/cache_maint.c + header
      cache: Make top level Kconfig menu a boolean dependent on RISCV

Lukas Bulwahn (1):
      MAINTAINERS: refer to intended file in STANDALONE CACHE CONTROLLER DRIVERS

Marco Crivellari (1):
      soc: fsl: qbman: add WQ_PERCPU to alloc_workqueue users

Marek Szyprowski (1):
      soc: samsung: exynos-pmu: Fix structure initialization

Pierre-Henry Moussay (1):
      dt-bindings: cache: sifive,ccache0: add a pic64gx compatible

Xianwei Zhao (2):
      dt-bindings: arm: amlogic: meson-gx-ao-secure: support more SoCs
      soc: amlogic: meson-gx-socinfo: add new SoCs id

Yicong Yang (2):
      memregion: Support fine grained invalidate by cpu_cache_invalidate_memregion()
      lib: Support ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION

Yushan Wang (1):
      cache: Support cache maintenance for HiSilicon SoC Hydra Home Agent

 .mailmap                                           |   3 +
 .../arm/amlogic/amlogic,meson-gx-ao-secure.yaml    |   3 +
 .../devicetree/bindings/cache/sifive,ccache0.yaml  |   5 +
 .../microchip/microchip,mpfs-mss-top-sysreg.yaml   |  47 +++++
 MAINTAINERS                                        |  17 +-
 arch/arm64/Kconfig                                 |   2 +
 arch/x86/mm/pat/set_memory.c                       |   2 +-
 drivers/base/swnode.c                              |  30 +++-
 drivers/cache/Kconfig                              |  37 +++-
 drivers/cache/Makefile                             |   2 +
 drivers/cache/hisi_soc_hha.c                       | 194 +++++++++++++++++++++
 drivers/cxl/core/region.c                          |   5 +-
 drivers/gpio/gpiolib-swnode.c                      |   3 +-
 drivers/nvdimm/region.c                            |   2 +-
 drivers/nvdimm/region_devs.c                       |   2 +-
 drivers/platform/x86/intel/chtwc_int33fe.c         |  29 ++-
 drivers/reset/Kconfig                              |   1 +
 drivers/reset/core.c                               | 138 +++++++++------
 drivers/reset/reset-gpio.c                         |  19 +-
 drivers/soc/amlogic/meson-canvas.c                 |  12 +-
 drivers/soc/amlogic/meson-gx-socinfo.c             |   6 +
 drivers/soc/apple/mailbox.c                        |  15 +-
 drivers/soc/apple/sart.c                           |  13 +-
 drivers/soc/fsl/qbman/qman.c                       |   2 +-
 drivers/soc/fsl/qbman/qman_test_stash.c            |   2 +-
 drivers/soc/microchip/Kconfig                      |  12 ++
 drivers/soc/microchip/Makefile                     |   1 +
 drivers/soc/microchip/mpfs-control-scb.c           |  38 ++++
 drivers/soc/microchip/mpfs-mss-top-sysreg.c        |  44 +++++
 drivers/soc/samsung/exynos-pmu.c                   |   9 +-
 drivers/spi/spi-cs42l43.c                          |  40 ++---
 include/linux/cache_coherency.h                    |  61 +++++++
 include/linux/memregion.h                          |  16 +-
 include/linux/property.h                           |  13 +-
 lib/Kconfig                                        |   3 +
 lib/Makefile                                       |   2 +
 lib/cache_maint.c                                  | 138 +++++++++++++++
 37 files changed, 805 insertions(+), 163 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
 create mode 100644 drivers/cache/hisi_soc_hha.c
 create mode 100644 drivers/soc/microchip/mpfs-control-scb.c
 create mode 100644 drivers/soc/microchip/mpfs-mss-top-sysreg.c
 create mode 100644 include/linux/cache_coherency.h
 create mode 100644 lib/cache_maint.c

