Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9FDC44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mQO7OwEt2ayLBwYgGRVhBYGfbjzxMLDxfhpK0SkwD/o=; b=Q79yqvdTbLhW1q3Mdr3mtD771O
	nrdpRsB1/bLLHbSWtSFhtuCFfgeMqO0Mg/NJsaoJaKScSWg6O9D2o2dgqfgl3Zgme2dArKpDZkbxD
	6kn/mVAI+uofeVnjwwZc3Es2XV2WI0HJgd2LLIzwkaUabn1zT1RqVeNwS68FRzz29uTy7XymCgydF
	WFzOVgLQL4Kw/TeucNwUdhVOS9Weos+twX48ewZrauuXuqqMM4ZTr5vbWAdkKemB8CYtjmlw8GBYE
	3u7KeKFgh4wiGNX6AyAQgfE8lYo6YTIoGxYSM2s11auPFYkN8AMrqZBcFrs7uDZrcC29NjYH7igIy
	7nmmUFfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whWY1-000000008fb-2nMQ;
	Wed, 08 Jul 2026 17:59:01 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whWXy-000000008ee-2D6w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 17:59:00 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so27932a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 10:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783533536; x=1784138336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQO7OwEt2ayLBwYgGRVhBYGfbjzxMLDxfhpK0SkwD/o=;
        b=hJr2SRc9NXYHURux4FYF9sJyFQ/a43AQouNbQ2HUnYIFuW4x77tLJ3EB6pD96stADM
         jFMIr33DwV+4Isd+hs6OM4Uku9VUX57aYnMOW/F1txyh9EmG3ZqLvwMXWExr61as3EEz
         DJGF5DIwRnGVkhQXy3UkB1FuE1fIGLm0dZgX5Wl2+ej8LMLTu2Q54tiYhxjw8WPaEcmz
         joOwIl/g3YwZn4Js2zBRUJ0DDhIBfEwpGkucvyp3kH12gSA76EXVNyAsDPSFG5rbqsvD
         G0RI5SVF15IgEpRxf92U8vHdppMqOYkG3YWpF9JjZBraYx5M+x/NyfzbnjO0EgrwuKne
         aIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533536; x=1784138336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQO7OwEt2ayLBwYgGRVhBYGfbjzxMLDxfhpK0SkwD/o=;
        b=asF+5SC8flcj3aKVDQlsRofXIo6Zh9KYd1I/spThVCmeyPhI1vnrYm6iJoGlM2HPAY
         paeqXTRCnc/J44tP9SYAnp0pQt2k4kVMOCPKlyNBX7eKI8QciPw3IhXgdWskowE1bMO1
         w5Ic5hzbAuEZFqjrM7+FbKOt1QBoepP7Puixv3Dy0n/Sotnd8dmKR4PojFxKi+ExAJkt
         +ZwBB1jQ4jbYook+tneaWC1FdnriBvF63OV8WBEQ5tPyIfmUMZIXme0DvVB/oK/KimCI
         2LKmpB/WcrcnVsoftvXTGP3bZcfWM/jLyWw89Bx0xyWfoHB2ID3uoTUvi1H7EH/9BuU8
         IGOw==
X-Forwarded-Encrypted: i=1; AHgh+RpSki8pOMnOJezl/vQOMZv2NkJYjzFDYpcbqXEK6v/aIDa2YIbNtJet1bIlRx99uBJ+AtXPr3c6tIHS4byNPVu/@lists.infradead.org
X-Gm-Message-State: AOJu0YxwygbeDmXYmP6fKYuAdD6kqed5uDp171T1jqwuuzDzr+6ChlpE
	nc7EF1G64mRA6qdFMkqCfZUqfEy9Phi/TeVpEJLu4gVInt/lcRdtQRDs
X-Gm-Gg: AfdE7cnJLDRmSlS/Cy6/eeleeafLC8y2COxCdmBH6cibfVJBSuQ/b3tapMO4LvW/8WF
	5bOwl+QO4mIiLkZ0o8cFFF7neNp9kqRqoH8C1KQhGvcjYvVcd6pKgfeAbAleLpnxWkNDNcJVHJi
	0W8+xv4dk6yf0J+s71phEUFFEMouP7rwL5nCCXW4oQe3To5BQQXHnrst7I9+alUjwT4WPvjOzBt
	tcF2O2pr9YRpjr5/zsD1tc8sNVR+Z8DZuvScA802MXY0054aZA/ZHRUop4X9w/u5ZXFGVn/IbII
	raPDy5+kewWO0cEaUQpjC9Yboluy4FJTpNf9HxZCgsfad5ACV4WJWs1rVn8g6t0traKfF5vE6HW
	omJjtFJDSdG3jeqG1W8R8oKItZW/Dsz/snP9MpqCEkwzPrUehsHPx1vsnBDJrC+IWDQvjY0kzrz
	FNmEAhPQ==
X-Received: by 2002:a17:906:4fce:b0:c12:5e26:da50 with SMTP id a640c23a62f3a-c15ce14c65bmr157380766b.65.1783533535639;
        Wed, 08 Jul 2026 10:58:55 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bcc26sm357653666b.34.2026.07.08.10.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:58:55 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Corentin Labbe <clabbe@baylibre.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH v2 0/4] crypto: rockchip: Add RK356x/RK3588 cryptographic offloader
Date: Wed,  8 Jul 2026 18:58:21 +0100
Message-ID: <20260708175837.1718437-1-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_105858_601265_59B1B650 
X-CRM114-Status: GOOD (  20.14  )
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

Tested on Orange Pi 5 Pro (RK3588S). All nine algorithm selftests pass.
AES-CBC throughput measured at ~100 MiB/s with cryptsetup. PM
autosuspend/resume verified over 1000 consecutive hash requests with no
errors. 20 modprobe/rmmod cycles produce no DMA coherent memory leaks.

Patch series for the crypto subsystem:
  [1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine
  binding
  [2/4] crypto: rockchip: Add RK356x/RK3588 cryptographic offloader driver
  [3/4] arm64: dts: rockchip: Add crypto node to rk356x-base
  [4/4] arm64: dts: rockchip: Add crypto node to rk3588-base

Separate patch for clk/reset tree:
  clk: rockchip: rk3588: Remove SECURECRU reset definitions

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

v1: https://patchwork.kernel.org/project/devicetree/cover/20260530160704.3453555-1-dawidro@gmail.com/

Build/rebase fixes (not from review):
 - crypto: use sizeof(struct sm3_ctx) for the SM3 statesize, as
   struct sm3_state was removed by the lib/crypto SM3 conversion.
 - crypto: add the missing SHA-224 zero-message case.

Dawid Olesinski (4):
  dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine binding
  crypto: rockchip: Add RK356x/RK3588 cryptographic offloader driver
  arm64: dts: rockchip: Add crypto node to rk356x-base
  arm64: dts: rockchip: Add crypto node to rk3588-base

 .../crypto/rockchip,rk3588-crypto.yaml        |  75 ++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  12 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  12 +
 drivers/crypto/Kconfig                        |  32 +
 drivers/crypto/Makefile                       |   1 +
 drivers/crypto/rockchip/Makefile              |   5 +
 drivers/crypto/rockchip/rk2_crypto.c          | 746 ++++++++++++++++++
 drivers/crypto/rockchip/rk2_crypto.h          | 249 ++++++
 drivers/crypto/rockchip/rk2_crypto_ahash.c    | 565 +++++++++++++
 drivers/crypto/rockchip/rk2_crypto_skcipher.c | 728 +++++++++++++++++
 10 files changed, 2425 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
 create mode 100644 drivers/crypto/rockchip/rk2_crypto.c
 create mode 100644 drivers/crypto/rockchip/rk2_crypto.h
 create mode 100644 drivers/crypto/rockchip/rk2_crypto_ahash.c
 create mode 100644 drivers/crypto/rockchip/rk2_crypto_skcipher.c

-- 
2.47.3


