Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637F4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3RbPrXYdQbVWUvs+F9bureO/gAjNoSjgQ1E6c4QgBI=; b=oR50FeAidzRgQ7bqyqiEdxdVja
	UzSrE47LVJPWWmczOyGzcHPB2/VKUdUIhdU9s67NP5bUJFzeJdw5JzD3PVew/YkwEgVyf0u77NATP
	GEhCmAVKisInOBp/L5jeUeEnWNBZoFsuqNhaaqvUV8h3CxGXoXJb/pfmz4qlhx2FoGY/8mmsPlbzF
	QrRp41fal61xhjqPYDB47pwFTy4ozv8vOgiFGvzVJnu7ddEjjTER6vai78i8BMyQa6bo5lEA4eGEP
	18K63GRnt4GXt5DcKE4wdY8PmfEA3vXTERZcDW/GQMy1diaQJp4wM9GA7vfrEQ74mt5J1brJJFxu7
	xC209DCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whWYK-000000008wV-0H0M;
	Wed, 08 Jul 2026 17:59:20 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whWYH-000000008sT-2Atq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 17:59:18 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c15e3141d02so1464666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783533555; x=1784138355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3RbPrXYdQbVWUvs+F9bureO/gAjNoSjgQ1E6c4QgBI=;
        b=iu0b2Wb/EBlzS7nYtGj9VMNvcO7ASTASRrx6XGGIA/kJ5NL0kAII+1nVOproJ8imJi
         GZyEPu8lM+ufa/3di6QZC3eTVvz1UrMiEvkhQKspF0NCCCd/WSEBSZmYJC0JQGKcIFzI
         VmQUThCIuFXd8cBEniYNXafzTILVS//sucVvAsHNkICalVizTVTwkfN6Y8yAzLZOAQeR
         NCmp0wsnAm7zZTuvh/M//CzsHNrAdsvt3khbEVZDDDpvNESiLOynwOB00jevkpp08zLL
         N6Huuc1EYKmkADghAai+L9m6z3tjyjHfKIt/fi3sOrtqtMdT2y9fpG805xKSAYU+pVL6
         6SZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533555; x=1784138355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3RbPrXYdQbVWUvs+F9bureO/gAjNoSjgQ1E6c4QgBI=;
        b=GkFTVhyFhcNoJRK0By43Cb7+ntVUTsdflKJq0xm8+8GcqrodIvWvFR9SXWRhBY0VeA
         FjqsV/EzKqOHuqBLRZZqOcQSh2pr5Uq5DgyeYVo82DUcAEY+VqLKIuXcw4nt4uB6N6xw
         CNKPhMDb2ud0Jg+YaviRM/z4mU2Ypg2eMCqiDIF7MQs8HkAEv8zCEhSFxMCxzTpprEEE
         dgHurvwivZSM325Ra8uezcdfuw0hczCN3J7qmugR2iOUNXh5cKuiOuQewYmT3xnihBqe
         t4SBRJMgyLTfhpSwiUR9iPbJT+j9yzARqRcEi7PMHIK3lpveR3u/j/WLO7Oy4FTIG4j/
         DoTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrq25yrB/8VmU41g/M87J1TYvF2bOB6UlNQ+T97+898hWdpJTiV/wargfGCzgQOk7wDRgEYdW831zNLcbvPOeSV@lists.infradead.org
X-Gm-Message-State: AOJu0YwYKYbECNLuOurNPCC9kZsEVplJklRMQuoSJdQYeHjsVgqBFlqD
	PmPEbDA74KeRMFsLNYm449pS+eDIGadWSvc/tYhRVRxyPLld6iJ0qV9k
X-Gm-Gg: AfdE7cnSdnXz7xtHvlN2C38SWxRswAoEE1TJH/wKtzjDrNvQMLJl5qsvCLPFeYFtvQV
	xqcZWaYDNR86Rc74bwCGqvIJ5QgHQP2NydrFIGRKgpgT03D9Gra2J8Q71UFsgL+eUciY4Kpnvc7
	H0t2WVWnLpgP7UTHF7yGS1w8R0zQ7hnT0vEOkRwK55J/C7y/F0wreyF7RhqawUNEqS1THgy0NGD
	W4sZcXto3xN9azteUVIT+DK+wxzXJKuT3VaSSTzfhHL7E2WhzZGmtAmIzx74jdvS/YV63kW797E
	+Pokmab/ay5C/RrXqTSGcl3OGIrV9ZKSMSqwT7ZWVCerSUxGKs3MKOqwyr1ztjKrvoe16B1UDHc
	hfPx84VYclr19qoNuvtG9JWFwVpl2Gu2Onnl8Y3EiyOZb9KJJakxQ9YDBVSqRfhIpNBFdK/Y1MZ
	YVuIH3Fkm9js9GoKVt
X-Received: by 2002:a17:907:3f18:b0:c11:f4d6:48fc with SMTP id a640c23a62f3a-c15ce1c331cmr188941466b.45.1783533555363;
        Wed, 08 Jul 2026 10:59:15 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bcc26sm357653666b.34.2026.07.08.10.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:59:14 -0700 (PDT)
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
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Add crypto node to rk3588-base
Date: Wed,  8 Jul 2026 18:58:25 +0100
Message-ID: <20260708175837.1718437-5-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708175837.1718437-1-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_105917_571839_7A1D2E04 
X-CRM114-Status: GOOD (  14.13  )
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

Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index fc1fdbfd3162..a7560b09aeb6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2447,6 +2447,18 @@ sdhci: mmc@fe2e0000 {
 		status = "disabled";
 	};
 
+	crypto: crypto@fe370000 {
+		compatible = "rockchip,rk3588-crypto";
+		reg = <0x0 0xfe370000 0x0 0x2000>;
+		interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&scmi_clk SCMI_CRYPTO_CORE>, <&scmi_clk SCMI_ACLK_SECURE_NS>,
+			 <&scmi_clk SCMI_HCLK_SECURE_NS>;
+		clock-names = "core", "aclk", "hclk";
+		resets = <&scmi_reset SCMI_SRST_CRYPTO_CORE>;
+		reset-names = "core";
+		status = "disabled";
+	};
+
 	rng@fe378000 {
 		compatible = "rockchip,rk3588-rng";
 		reg = <0x0 0xfe378000 0x0 0x200>;
-- 
2.47.3


