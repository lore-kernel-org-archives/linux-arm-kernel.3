Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975C1C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 19:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3I/yM1LIFc5qnjFwFkWXbpoaLK6muVELlDy7x8BHls=; b=eB9IaL4fcA67mZ9+VKycCLt2/h
	KMgJtp8Ml8BsJ5kdKeeRrtRPdkcsfacpge61ZJqs+aSK/vHnYx99KvyB4C/TT//UjmVBhId0NOTPc
	+6j66a8SgfHfpP9Z39/HMznQEAAt9T+KbgujGaNt7nuWiYLI696UaMVBsMMo87fo5S32zf8UgbcaG
	IPTdkRsmrQ1RzpJtLKj5vhA2+yTAoLhzIgxjCqlvlXRJZ8uL6/zSL3xIv1z8GkrJfXL6mueUISy+F
	t6VXK/tmpeOG2YjiTDdL50+kx7jmdPvtXc9ynb4qRynAjIspd4f0PtF4R3sODPd4Ho92UYHajGaAJ
	EDVXMX6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgk4-0000000520a-2F4D;
	Sun, 16 Aug 2026 19:42:00 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgk0-000000051zl-3vMq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 19:41:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so19799765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 12:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786909315; x=1787514115; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n3I/yM1LIFc5qnjFwFkWXbpoaLK6muVELlDy7x8BHls=;
        b=PxPKM9q/CzUVKNhWMGxZGsQA/4RW6kih5ALF0rw0vEgli8YQFiubbp1SQSCAjXDnLK
         A4eOsltsr4rnFsNxghVgCzVRv0egVBiApOoqzAgQxqWea5jjXk5sCTWuZuNDJdgNY7Ns
         iOxbfC86v+9AQn8QR4w3o9rwVh55FQptaJGyrVYBE36OES9iBH4P0ZWQBSbmUuTrwXIM
         ozIlxT+u0P05f/KGTImVBqAoLZBE4lLQEoP+uQfI8ao6R2Ect/VI0nI3xMtd3OJH/DNB
         pLjzeo4nqHl+eQBYVJpwo3V0/+kE1CpkVr0VUBwAjRLehjY0u4ECpOXecEXEtyU+EkX8
         Z9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909315; x=1787514115;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3I/yM1LIFc5qnjFwFkWXbpoaLK6muVELlDy7x8BHls=;
        b=W4Ov8yQblh7X073Yc6bsUvNNgfgMMS+JKdSu2wNyWiTfdlBTazFJbgrEC8DKFThJXG
         QHHTB5uUUwUYbjOmZ53ep3RI8a4pCLk6cdg6t5Jwl//6RRDzLf74NxlV+mJaULRX7krK
         caF15i7G5l+7zN/L/2q11VO9s0P06P3YSF1oecz14E6jc1LhGXRSt+Mr3SzDDnriZchn
         0cFqTYkiaLwhnMUuwZ8KLrFAirESam8BbOpzSdZ7WAxceslJzoRQ58qprefG7FJLa5hz
         IxcnXfNaJkdU4fqcr6Wrv2koPajqzaRscBMDOCgXl6N4h6I3UZzCtEgO9bYTSRTdM3LA
         FidQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpuhm5mlaOHPW4jEyjEPl+3FmJnufZ92Bg8T2NExkUtJs7+fS6Ae1UyPxzK4dEQ4TjjLDuSYcBN4c1kr6Tqjhr8@lists.infradead.org
X-Gm-Message-State: AOJu0YyKSm6gYS3EEDR6PJQPgNpwoFxYd9846D+f4GL+Yu8Nr65qcJ97
	Mi0sBpd5L0KMczVBL8zMncfwsK1bweD4RShFomgMY3u6QTqbMzMpxFsh
X-Gm-Gg: AR+sD10l0mpeD3aBIeY4J6q26Xts57gdu4QE1noE8ZBS7rXl8sC/3m3/zP2HuR2lwO9
	aDMhbKeozlXUBujCClhfm/K1i0qogB8JZZajIYYGO7jo9UoKJJ4E0y7sWTebZbXbAMjaIOv6vVP
	PAufnsOC37y+A+ew7lWs+8ZqYjyIAgBFPzywHVQ1yYOVvNmMJHoBR/bC5VjPaYQ0NOsrY4amWS1
	A6RMeOL8CLoeM7lM8i2uO1P2Edz8W6lvTK7+IeAfTfSTjXTKulDRCvu39mFsGkB6kskcflaOpzS
	HFO0eroJlnE/cqc+pwImp+1ZcFc6ZoJNAZL/a7ywoIR3zo3O+hmne44lHGSYrTHQxl1jWcSk4By
	Rbfs5XWfnIRngIUSj78TTDTjO5kM2a0Jde1Bz+b0+QMpNs6l8r7jTRGt4RLJ4IArBTbT30A++nZ
	0c6FPf9xbz1xwlNkajQetXntT70U1O9cmzo5gNDIVvaL2+5N0H0HZnWg==
X-Received: by 2002:a05:600c:4fc9:b0:499:79c3:4b55 with SMTP id 5b1f17b1804b1-4998797befamr299586395e9.18.1786909314375;
        Sun, 16 Aug 2026 12:41:54 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:f1b:d401:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996106c6esm100527875e9.5.2026.08.16.12.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:41:53 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH v3 0/4] crypto: rockchip: Add RK356x/RK3588 cryptographic offloader
Date: Sun, 16 Aug 2026 20:39:43 +0100
Message-ID: <20260816194112.552100-1-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708175837.1718437-1-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_124157_028670_D0BABFA6 
X-CRM114-Status: GOOD (  25.74  )
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

This series adds support for the second-generation (V2) Rockchip
cryptographic hardware accelerator found on RK3568 and RK3588 SoCs.

The IP block provides AES (ECB, CBC, XTS) and hash (SHA-1, SHA-256,
SHA-384, SHA-512, MD5, SM3) offload via an LLI-based DMA engine.

The series is ordered as required: binding first, then driver, then
the two DTS nodes that reference the binding.

A prerequisite patch removing SECURECRU reset definitions from the
non-secure CRU driver is sent separately to the clk/reset tree, as it
touches a different subsystem. That patch is not a hard dependency for
the driver to build or load, but it is needed for correctness on RK3588:
those register offsets map into TrustZone-protected MMIO and must not be
accessed directly by Linux.

This work started from unmerged patches by Corentin Labbe
<clabbe@baylibre.com> posted at:
https://patchew.org/linux/20231107155532.3747113-1-clabbe@baylibre.com/

The implementation has been substantially reworked. Notable changes from
Corentin's original series:
  - DMA descriptor race condition and DMA mapping leak on timeout fixed
  - Per-device algorithm copy replaces global device list, removing a
    locking bottleneck and correctly supporting multiple instances
  - Runtime PM autosuspend added; clocks and reset gated between requests
  - Multi-SG hash requests routed to software fallback (hardware padding
    engine requires total message length upfront and cannot maintain
    state across LLI boundaries)
  - Hardware interrupt enable register write corrected to use the
    HIWORD_UPDATE mask that the hardware requires
  - Software fallback for all registered algorithms; statesize promotion
    for export/import compatibility with ARM Crypto Extensions drivers
  - SCMI reset and clock references in DTS corrected for RK3588

Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Quartz64-B (RK3566), NanoPi R5S (RK3568), NanoPC-T6 LTS (RK3588)

Tested on Orange Pi 5 Pro (RK3588S) and Banana Pi R2 Pro (RK3568).

All ten algorithm selftests pass. AES-CBC throughput measured
at ~100 MiB/s with cryptsetup. PM autosuspend/resume verified over 1000
consecutive hash requests with no errors. 20 modprobe/rmmod cycles
produce no DMA coherent memory leaks.

Patch series for the crypto subsystem:
  [1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine
  binding
  [2/4] crypto: rockchip: Add RK356x/RK3588 cryptographic offloader driver
  [3/4] arm64: dts: rockchip: Add crypto node to rk356x-base
  [4/4] arm64: dts: rockchip: Add crypto node to rk3588-base

Separate patch for clk/reset tree:
  clk: rockchip: rk3588: Remove SECURECRU reset definitions

Changes in v3:
  Device tree binding (Sebastian Reichel, Heiko Stübner, sashiko-bot):
    - Merge the compatibles: rk3588-crypto now falls back to
      rk3568-crypto (oneOf schema). The driver binds only against
      rockchip,rk3568-crypto; the rk3588 string is reserved for future
      quirks.
    - Allow up to three reset lines (core/aclk/hclk) instead of a single
      reset, so a complete node describing the AXI and AHB resets
      validates.
    - Drop "status = disabled" from the crypto nodes in both
      rk356x-base.dtsi and rk3588-base.dtsi; the block needs no
      board-specific resources.

  Driver (sashiko-bot):
    - Add SYSTEM_SLEEP_PM_OPS (pm_runtime_force_suspend /
      pm_runtime_force_resume) so the hardware is suspended correctly
      across system sleep even inside the autosuspend window.
    - Guard the interrupt handler with pm_runtime_get_if_active() and
      balance pm_runtime_put() on all return paths, preventing register
      access to unclocked hardware during the teardown window.
    - Allocate the per-device algorithm array with kmemdup() instead of
      devm_kmemdup() and free it explicitly in remove() after the engine
      is drained and algorithms are unregistered, so the templates
      outlive any in-flight teardown.
    - Drop the explicit crypto_engine_stop() in remove(); rely on
      crypto_engine_exit() to stop and synchronously drain the kworker.
    - On skcipher DMA timeout, assert reset and synchronize_irq() before
      unmapping the scatterlists, so delayed hardware cannot write to
      unmapped memory.
    - Add CRYPTO_ALG_TYPE_AHASH support to rk2_crypto_debugfs_stats_show()
      to print request and fallback counters for hash algorithms.

  Driver - cleanup (Diederik de Haas):
    - Remove the redundant is_xts template field; test
      rk2_mode == RK2_CRYPTO_AES_XTS directly.

  Driver — correctness and robustness (review round 2):
    - Use explicit 32-bit DMA address handling: wrap sg_dma_address()
      and the LLI base in lower_32_bits() for both the skcipher and
      hash descriptor programming, making the hardware's 32-bit
      limitation explicit and silencing sparse on 64-bit builds.
    - Fix AES-XTS IV handling: req->iv is the XTS tweak, not a CBC-style
      chaining IV, so it must not be overwritten with ciphertext. Gate
      the backup_iv save/restore on a single update_iv flag that
      excludes XTS, leaving the tweak untouched across chained requests.
    - Zero ctx->key (memzero_explicit) and reset keylen when the
      fallback setkey fails, for both rk2_aes_setkey() and
      rk2_aes_xts_setkey().
    - Harden the IRQ/PM suspend path: mask and clear DMA interrupts in
      rk2_crypto_pm_suspend() and re-clear/re-enable them in
      rk2_crypto_pm_resume(), so a pending level-triggered interrupt in
      the suspend window cannot storm.
    - Use crypto_skcipher_set_reqsize() / crypto_ahash_set_reqsize()
      instead of assigning tfm->reqsize directly.
    - Align DMA interrupt bit names in rk2_crypto.h (bits 1–6) with the TRM
      v1.0 specification.
    - Update rk2_crypto_irq_handle() inline comment to reference
      DST_ITEM_DONE and SRC_ITEM_DONE.

  Driver — cleanup:
    - Simplify the hash path to a single scatterlist element (multi-SG
      hash already falls back), removing the now-dead LLI loop.
    - Name the AES-192 capability bit (RK2_AES_VER_SUPP_192) and comment
      it, instead of a bare BIT(17) in the debug info dump.

v2: https://lore.kernel.org/r/20260708175837.1718437-1-dawidro@gmail.com

Changes in v2:
 - dt-bindings: wrap example in a bus node with #address/#size-cells = 2
   and add the SCMI clock/reset dt-binding includes so dt_binding_check
   passes (Rob Herring / Krzysztof Kozlowski review).
 - crypto: fix Kconfig to select CRYPTO_SM3 instead of the non-existent
   CRYPTO_SM3_GENERIC.
 - crypto: drop IRQF_SHARED (the line is dedicated) and request the IRQ
   only after clocks are enabled and the completion is initialised;
   reorder probe accordingly.
 - crypto: set a 32-bit DMA mask before allocating the descriptor table.
 - crypto: suspend the device explicitly on removal before disabling
   runtime PM to avoid leaking clocks.
 - crypto: call synchronize_irq() on the DMA timeout paths to close a
   race with delayed interrupts.
 - crypto: convert fallback statistics to atomic_long_t.
 - crypto: use cpu_to_le32() for all LLI descriptor fields (big-endian
   correctness).
 - crypto: read key/IV with get_unaligned_be32() to fix an alignment
   fault and a big-endian double-swap.
 - crypto: fix the CBC/XTS IV backup offset to use the processed length
   instead of the scatterlist capacity.
 - arm64: dts: rk356x: move the crypto node into unit-address order.

v1: https://lore.kernel.org/r/20260530160704.3453555-1-dawidro@gmail.com/

Build/rebase fixes (not from review):
 - crypto: use sizeof(struct sm3_ctx) for the SM3 statesize, as
   struct sm3_state was removed by the lib/crypto SM3 conversion.
 - crypto: add the missing SHA-224 zero-message case.

Dawid Olesinski (4):
  dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine binding
  crypto: rockchip: Add RK356x/RK3588 cryptographic offloader driver
  arm64: dts: rockchip: Add crypto node to rk356x-base
  arm64: dts: rockchip: Add crypto node to rk3588-base

 .../crypto/rockchip,rk3588-crypto.yaml        |  83 ++
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  11 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  11 +
 drivers/crypto/Kconfig                        |  32 +
 drivers/crypto/Makefile                       |   1 +
 drivers/crypto/rockchip/Makefile              |   5 +
 drivers/crypto/rockchip/rk2_crypto.c          | 783 ++++++++++++++++++
 drivers/crypto/rockchip/rk2_crypto.h          | 254 ++++++
 drivers/crypto/rockchip/rk2_crypto_ahash.c    | 541 ++++++++++++
 drivers/crypto/rockchip/rk2_crypto_skcipher.c | 740 +++++++++++++++++
 11 files changed, 2463 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
 create mode 100644 drivers/crypto/rockchip/rk2_crypto.c
 create mode 100644 drivers/crypto/rockchip/rk2_crypto.h
 create mode 100644 drivers/crypto/rockchip/rk2_crypto_ahash.c
 create mode 100644 drivers/crypto/rockchip/rk2_crypto_skcipher.c

-- 
2.47.3


