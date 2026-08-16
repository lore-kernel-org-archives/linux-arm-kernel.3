Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE92FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 19:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=saCtLctEFieimkjt5839av7kQUg1qO8hSvOYlxjvmVA=; b=IWrGIa4NXt4YPVg06bqi9iZ1qY
	6/7Vsp53X9wio/DZHu3sK0Cct5pl8OFSe/jJsOSYL3Zjz+8Qb2HKzU+7CFhfKWmFjSsFHVFU2BHwJ
	6U/0BqT0j90vgnR63zBx2/1sPEK+Cyrm10hm5rFisPFNqJ/PbMt1yHDk+Dx9FqlsPo/ZbWIg/XEpV
	IGF2mZVJN0wF1J+oQCsGJxf7JdxQtaspMsdUUGTbK2VfCa7w/hEMPR8t6GsEVgbz39ryRbBOfYard
	VvpS18wi5s/bZYL00BJZSGxAStw19pL3UvI4yf8RXO/cX0+EEa0sxyfrpEqneClk37fJPPD48QA2G
	Nd2Xk/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgkL-000000052BC-0syz;
	Sun, 16 Aug 2026 19:42:17 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgkH-0000000526f-0fZj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 19:42:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-495590dde14so33790845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 12:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786909331; x=1787514131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=saCtLctEFieimkjt5839av7kQUg1qO8hSvOYlxjvmVA=;
        b=kK3A6mIFtXXKbVA3pNvMrrcAjFutH6dBhj7v2fwj93ssh49XrG5ZO7GiUsOG4stpP4
         bWnZqNhY2VxrWPf/IEWjaP3VPYbkA0Uj4QaK8GWIAu+qIwM8zfmHPJREkUnae9J0nEmV
         MOqaiMb0HPTXT6bE1xvBFihDb9M4Sj6DVtI6a+WjJ3znA+v+VhVz69B4EG43SR33wqNu
         ZVPV7KhK8nQsQMbpoOYjGe/yq+bGDu1mDAmD5ARpRy2lDpBzJUnEMq89aB8BHDlbgnI7
         9rtx/M8txuqg/bNmuW0Cx3Vp4bBJ//00782WSrutxbOGxBEX5Tspc7tVd2Tr5TwQI3RP
         U5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909331; x=1787514131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=saCtLctEFieimkjt5839av7kQUg1qO8hSvOYlxjvmVA=;
        b=jgr2RY0hYYhWb3V2sd55FTvDQLLb0gOk+O3BKUF2K7S9IzyXGhEOAza13AbeDFcr+h
         UM9N6Y3FXJEoup2WzcZQic89ndZ9+YxNNbxCNSuuFOOqQybVCQmFZwS+F2roRFoC9sHn
         yBrj+wo2z0v+h/3CGSEHZc8p+z0Kg24JuLUQXMAHwsOpRHyIp1tctR+cZNyUMw1VH/SF
         1PSRB6h7EozuZzQXoTgNoFIWy20lxC3vZV6LZ92HnO8NqoL5Pciy0bKGlCRQmUdIftuA
         4Z0tvE/etXJsAI19MbuLKRQ5RAzvQYBKTnLaUKqdqIH1ubuOHYalO9osm7ts6jk/i+5u
         9vDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBsROs8JZtwPOFO8/DbKY23297CrMrTKj6MpYxtrelLz0gNBp7w1a5dT6pnXWWnvsEcm/vMATwhCmBXghUhgbj@lists.infradead.org
X-Gm-Message-State: AOJu0YyQwhdrf31EVRwKqgVD7vccl23q38GbFJyIYYFCWpQt/eMIzad3
	uCjHExL9xfaQTfpJdP2QlJPQ2trXqBWEbmOFGkZ678JO8aVVlDrWCIQy
X-Gm-Gg: AR+sD123b9JvWsmbohVXcEBErIGxlKtOxBJDFU7l0+/vRcuGSH1Jirkp7F8rTevZURP
	ahXOkBg4zmGb8P2scKho3IfjCB195uoFZFKwUd6bIZlE7bqJxE2EzrW50Xi3nMr+9fKDX7csusf
	mcxxFm8LGvylEbmtBWtwCbn8aKeqoAD1tR8NmPnpFWhEx4xWt6NYADpp9PrPf9NZNzNdDbgD9Ny
	cC0DogCVLIOJiUJ8xmYstdP8HoNTKQB6JICgCI3FNgACoIWi8VyXumYJ8g/NCmauvNqUmbEMOC+
	mqjpP7GmG7tvUW2LGNV3nAy9WncYhKlDclgEZhzgQoQfeTtqXuo6DB/7Ucj9bfwCuBY7Tn0saY7
	O+yR+JetXZKveh96c9rG7nzCJ8Bj5SqjXd5VP0yfvFjF5VIz6cBkjKIaijAB1FGE7LlmGpVwj7a
	zyeC2fzroQo04225Do+1Q5ht9AmUKo3aZUy9qKv5x6Ckp5Tyzohzm1Tg==
X-Received: by 2002:a05:600c:4754:b0:499:7e2b:8e5 with SMTP id 5b1f17b1804b1-4999a2f9ec3mr21366645e9.5.1786909331392;
        Sun, 16 Aug 2026 12:42:11 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:f1b:d401:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996106c6esm100527875e9.5.2026.08.16.12.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:42:10 -0700 (PDT)
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
Subject: [PATCH v3 4/4] arm64: dts: rockchip: Add crypto node to rk3588-base
Date: Sun, 16 Aug 2026 20:39:47 +0100
Message-ID: <20260816194112.552100-5-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816194112.552100-1-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260816194112.552100-1-dawidro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_124213_403056_88AE695C 
X-CRM114-Status: GOOD (  13.06  )
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

Add the device tree node for the V2 cryptographic hardware accelerator
on RK3588.

On RK3588 the crypto IP sits inside the secure domain controlled by
SECURECRU, a register bank that is exclusively accessible to the
TrustZone firmware (TF-A). Linux must therefore obtain its clocks and
reset line through the ARM SCMI interface provided by the firmware
rather than mapping the CRU registers directly. Attempting direct MMIO
access to SECURECRU from the non-secure world triggers an asynchronous
bus fault.

The interrupt uses the four-cell GICv3 format as required by the RK3588
GIC node definition (the fourth cell is the CPU affinity/partition
specifier; 0 means no affinity constraint).

The node is disabled by default; board files that wish to use hardware
crypto offload must enable it.

Co-developed-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Quartz64-B,
NanoPi R5S, NanoPC-T6 LTS
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 4fb8888c281c..980c345a5de0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2249,6 +2249,17 @@ sdhci: mmc@fe2e0000 {
 		status = "disabled";
 	};
 
+	crypto: crypto@fe370000 {
+		compatible = "rockchip,rk3588-crypto", "rockchip,rk3568-crypto";
+		reg = <0x0 0xfe370000 0x0 0x2000>;
+		interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&scmi_clk SCMI_CRYPTO_CORE>, <&scmi_clk SCMI_ACLK_SECURE_NS>,
+			 <&scmi_clk SCMI_HCLK_SECURE_NS>;
+		clock-names = "core", "aclk", "hclk";
+		resets = <&scmi_reset SCMI_SRST_CRYPTO_CORE>;
+		reset-names = "core";
+	};
+
 	rng@fe378000 {
 		compatible = "rockchip,rk3588-rng";
 		reg = <0x0 0xfe378000 0x0 0x200>;
-- 
2.47.3


