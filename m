Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09079CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IwV4RZD2OlQ4qAGdKt6fe7VA4/9Ek4QzezWocwQhwBg=; b=Cre2QtWrxRx3vVSZYgke65EzL6
	tnfA1AFaayDhaHOLhygTMElqz/g9Z8gG/NFts8ronvWEH01qRG6CHGsEenFO8J+KBP9BYLQtdb00c
	7TyctQ9ZcLjxAys4DBf/UPbbrjW3er3nLgqO3AR3wziQUW7prhyAJOIHGnPwlKHXFlxZ3k4afZq1/
	PBWyxJPVUmNcOMWDFLTHHGvJ7L8XLNkwNnRZA7qAvzeoKBxsFn+tXdnFLtqtG3IzER78YSpAZsVrV
	AlqX5yhdBOYwPIGFTUbrJrCkidVxrZ4pip8Ej2IIFK7G2JEPnme9shTOH+q2LG9oajd0OetpLIHRI
	WlXmBE4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMDS-00000008u7w-475k;
	Sat, 30 May 2026 16:07:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMDO-00000008u6k-3xcy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 16:07:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45ef5146b56so837627f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157228; x=1780762028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IwV4RZD2OlQ4qAGdKt6fe7VA4/9Ek4QzezWocwQhwBg=;
        b=BMQBILy0PWxvpma30/8TlgdNJY1szmhlEaojAWSz4J65M7tD3CEmxlpJLB9hnihQV6
         Bl3/FKBHyDGTKi5Xkr8fNIX8mCk/VUuoZv31+IsVikBrujdu9rZna/zHv3cyYcZZ6zs/
         hJIMUtQqJvndoJnNqRQKufazM/MUeCmSGQ8MyJPwss53oEpNpTB0JqekGxwI6Pv2l8AT
         MQSb3KtFci2qduOlCYwxXijdqlGWmqLbfPKhAHvms2m5OAVn+MMijYLPzRMz/Y1rzp5q
         opHMadYmC9QL7kAVNYu5r802X2HFOo9Wgg0xOQOWithpDsouXqUg1GCS68ZVOwfZzUzw
         B1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157228; x=1780762028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwV4RZD2OlQ4qAGdKt6fe7VA4/9Ek4QzezWocwQhwBg=;
        b=rP30i+7In8GezYZdyqiFwtwQ1/iaxfXDVTaRv7GzyFkaEnOlEt9nfjfTAAW6aRaCCM
         c3sLGl7O+SV7YAAJCv4z2V74lKnyLIprgIyCClXZK3PpsTQn/nd2B3p+zf0e8n5s3vRa
         OB+0c9KMIBz/F28+7i0HZU+8xbEqoiyKJxky8JhFaLefBtk5/f1cm0wPiWRAjFNCHLWQ
         NCRVdFdITbWVqgOaS9v5ZnyZWwDK6mxdopMIUo575b3bRmuP0b3nJZRJ5Vw9Cst9ThEs
         kPj67Cxv+kT6oufK8Ai19zWIaktgXi+5FrvH8SXK1tZ/gkRGj6I7iZw+PvP23vavyaTB
         U/Uw==
X-Forwarded-Encrypted: i=1; AFNElJ/BUvC1N12OqV1BPvj742R9PntazkWe+i0+c1hcyeaLMxqmMJNXPfqLtbHg0qo6SvUAigQVrtLDzD1RyGsSnQqm@lists.infradead.org
X-Gm-Message-State: AOJu0YzcuoLblG4yPxOD+5+U/H+6Kpnurorj20c48pETaa9E65U+SBD4
	PtJHzoWPhG+yUwXL+7dUc6a4+XecV0XMcy0TiBITrcb4AlMFoA6Lmzj5
X-Gm-Gg: Acq92OGcHZli/1Bk1PBOWnj/6zv22kK0UnXRRv4Q1OJ4coRFWlI9DNzyiSeSXIGNeUV
	asYQAY3R6sn2gktOnEWeypGbXqVFHDuGLML4fwWQpiI1i0hU39NCnTjwZqZZnZ+Pn0FSKXcxIan
	NlAg8X6/gc79nbP6PGZ+IVLx2/3D5Tn2Rg3SEMnStgCvbB60ScdaZBtzEXEPjHH6IAA8ZMrvj99
	aTsp0gVV7wsoLLdY8Bs96d5UggK5R+1PzNzqbCnGy3rs4NY52/3PMyS80MFsaP9vzE40VY+6e3B
	V0CFSyc3c1gtf93iOt04X32bGICfc22FDS7PYbhlMUBLkbgvc0mAZg2r1YnX0oxvQJYdrV5yulU
	mzMiASqzsAd2zOBPQ+g2X9L5/2RwlHUnnZ1PGgzA+cz1tzzZqUsudNEDzj4kyaGZbtVmoHQA5eP
	XOqxcLdY2wAq9XbxcmeDin7WQw1j8=
X-Received: by 2002:a05:6000:2213:b0:45e:f3b2:1228 with SMTP id ffacd0b85a97d-45ef3b21526mr9317645f8f.3.1780157228260;
        Sat, 30 May 2026 09:07:08 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef32fabcasm11667339f8f.0.2026.05.30.09.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:07:07 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	heiko@sntech.de
Cc: linux-crypto@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	clabbe@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH 0/4] crypto: rockchip: Add RK356x/RK3588 cryptographic
Date: Sat, 30 May 2026 17:06:41 +0100
Message-ID: <20260530160704.3453555-1-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_090711_014309_5E01C761 
X-CRM114-Status: GOOD (  16.15  )
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

Signed-off-by: Dawid Olesinski <dawidro@gmail.com>

Dawid Olesinski (4):
  dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine binding
  crypto: rockchip: Add RK356x/RK3588 cryptographic offloader driver
  arm64: dts: rockchip: Add crypto node to rk356x-base
  arm64: dts: rockchip: Add crypto node to rk3588-base

 .../crypto/rockchip,rk3588-crypto.yaml        |  69 ++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  12 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  12 +
 drivers/crypto/Kconfig                        |  33 +
 drivers/crypto/Makefile                       |   1 +
 drivers/crypto/rockchip/Makefile              |   5 +
 drivers/crypto/rockchip/rk2_crypto.c          | 740 ++++++++++++++++++
 drivers/crypto/rockchip/rk2_crypto.h          | 243 ++++++
 drivers/crypto/rockchip/rk2_crypto_ahash.c    | 547 +++++++++++++
 drivers/crypto/rockchip/rk2_crypto_skcipher.c | 724 +++++++++++++++++
 10 files changed, 2386 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
 create mode 100644 drivers/crypto/rockchip/rk2_crypto.c
 create mode 100644 drivers/crypto/rockchip/rk2_crypto.h
 create mode 100644 drivers/crypto/rockchip/rk2_crypto_ahash.c
 create mode 100644 drivers/crypto/rockchip/rk2_crypto_skcipher.c

-- 
2.47.3


