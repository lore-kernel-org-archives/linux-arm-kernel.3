Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8BBCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPjWI7EHXybjCjXrMdkmBIb5D7sVI/NhlSvf78izrHE=; b=XfDTjqU7ClcBcny/+7Dvu8MY6I
	NYV973Pz0GurwcbegysOlA4ddz/HARcUMpgBNaNMhjhoxXzJAOceYFt9SSIH0i/u3VaNwe40tPY7y
	mcByBbfyturdqyva2JCjJUZgvenxE4H2nE2nJYGHfv4xKONHw36qQePceAmamp2lJCggTTBeiubcw
	FgwPBzZJYFI6D/DOyiTkwMns/6T1J1hUufx/pOFiBPOEnC3LcaMQjiGIQB2V+XYsFwEtt7Ga+pBJE
	VQHgk4YHPiXn4SBf15qA5aeKRTWCa9My9tK+CCWf11d/JGzLWi7F2CRXTaHcCFxz3EKmx3D6t0D4O
	a6Yjf8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdu-00000004SHT-2T4U;
	Sat, 23 Aug 2025 09:34:34 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRra-00000002dL4-3dMW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:31:27 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-afcb7a5cff3so34373266b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869485; x=1756474285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPjWI7EHXybjCjXrMdkmBIb5D7sVI/NhlSvf78izrHE=;
        b=K91IC/UawpQAgNUH2SVThbHhiyZGf3IZDU8ZoX6fqbtfrEi04P4KoBbjl9SXvE0TBR
         lS5uq4Mug7YmMekqYC/yUExSgJLVGv7QAkjQt7B67p4xIk/Khg5G/ByvqX6PBZYtXrlU
         Uf2rnFETm3oHFzimUTA4DAPflBIFhQ4dE7R7IYDhUT5utzcN5EEXmWoGIkjyn59t6xXg
         +KveO7WLpTZEU1E0CiDSquUld8j0ryytQbLTLacIJOzZXNjNniIzXJQcUTLvEirXtxEZ
         mG9R+n8tsdA9tGCTUVZHlWtBo8o+f44yba7txJU489u3uWxq5wCu1Awf4D3egt7Bxei7
         qCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869485; x=1756474285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPjWI7EHXybjCjXrMdkmBIb5D7sVI/NhlSvf78izrHE=;
        b=nqA7lq6XfudZr5MVEaCJzwF8twf0nJAr/aArEPdBOTqkX50LjLLJjqMyy0eV0iZ4V+
         kiwaVBThNVrY7gmEAHvNHd4eA2ljKd78KSDt6Bd65G+oHkSP5eYTg+D2h/DxgiEZJgUg
         R8IPv/dMCMr1FEi5iUglEh8GJ9ZjIn0BGnPV5K6UBrq235bWAgeC7jEmw/5JN/jtwm2n
         FtNyT045WRZgGg2OFz0URgsRBJUVKCHTDCaeLxycerenm2S/QwGNksff2i34g3YICfv6
         hElTiuFGUjGfvO/rRZOQ3Nd4l2iLlxvQNAUTsGeCc+rCX7YVvD2lKhhkK3VoI1ssbZfL
         0FIQ==
X-Gm-Message-State: AOJu0Yx005bWmS+/6/Z0Q+jAR7fLe+wRbPzCfqCyEcZdZPRJQzxGQ5kw
	fcZubz6hG0V2Z2nYNIR6319Bcyx9gJQsM12IHxLOb1Dq4wPNxpc/m/fGvxWE6RhQiPk=
X-Gm-Gg: ASbGncshDSo4DIa3FYZ6Rf2MA8060100JHEFlvMe7RjtU1ZEVzAstZ4hwgzX4RGYTX7
	Eq5mv2jqH3kaL/jiZWzV7+WNnpRB1CL+jjcEHYShlwjmNSNMIovkmiigGr+7cjEGSHiT8WJF7PK
	uVEew2oviIbJn6DattMBA/x7bpuQuMzFgYP0ovP1nq0Js1x4VfdV2CxEnPq66RBpOzC4Wg13eAj
	WY4oAQ/qK3uo3d+JeAWoeo/S0J3WHxP249+MOz+JPLNM6ErVZzW3Hx/MQiAZ4cYsLxFcomXvkrv
	IOJQA3uMY1GOzXHFXde5IQSKQPs78M7t5WNxrIEX62UCLaq/bVUXXaxVEiLBA7fbW9mSP4a8S0Q
	5JEHcZf+qSxTswwXaepwFAAbmMVvhIcqHo1S21uA=
X-Google-Smtp-Source: AGHT+IFNlJzZkDjLydkUzPUYLlA2c9JWh9TESZKV4zpfAYn8jjKMtO3j/MHwJN4CO/OBrA5y4xzAzQ==
X-Received: by 2002:a17:907:2da9:b0:af9:649c:d0ae with SMTP id a640c23a62f3a-afe294b454fmr144101566b.8.1755869485266;
        Fri, 22 Aug 2025 06:31:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:11 +0200
Subject: [PATCH 02/10] arm64: dts: fsl-ls1043a: Add default GIC address
 cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-2-f1b479da9340@linaro.org>
References: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
In-Reply-To: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qJdqhbannqpcNe/ZF5YUjLIXi50NcD/YKBgc5cMgrCM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEgGG8Ahoy4wxm6xwMlRb9HztC+05u5oiGkT
 kxjGtiUVeSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxIAAKCRDBN2bmhouD
 18B8D/9OaqPF1Mfs2Ufem0YAlsIQ5SlbHEwLAzxREncxYfZL8LpWvL5GA2B3aULGUmLI4k3HVBU
 XYr16qUJN2hSlRM5e07nlfHYNM/IsvAgif+INe8YNODi+pBIOvo5FpsWFR6nCSGEMPyqHDA5732
 bY+iUCrPIadFPGVQxHCuRvsovQFP2oDHuB5rzAPO6vlYABNqA9l+UC4n+MqEEa3S/sQCAhwO1dX
 D/QSwxXAKw6xOzZkp8gwxvxuuxeQwnbGD87eUuMNW/JLQg549HY4jQlWaNKvix4UJgnhqfIK+p/
 E02HY+5e/wOS4958yv2SFIjXt14YHFcCRlgvRWeeCQcy3Q9BSSIIP6NBa2GYeuYElQmnpgP6Ei0
 WltvDg3oBZIkReUE1fZNCQsITc7R8vZw+i1+tX/Yk1IGzQgYAFvB4xMzPrBJK0WZcoTB4nH/GT1
 +a0pidmbdqbT/MVM3PYYk+n+JmvvrpabaTXa72ubWo4vK0wicl1Gmx9Zukc7eXfrrNKGOC8OrmA
 zWBNin+TdD9T8yH5rrVGH2A7HuJj47d7aPoGJD4EVNgfGex/Xi7nQuf2YCZbFchzQVsVFDTjpaQ
 JOlfvddfcs2Pek3McvvhumLNXxH0VGtEQqOH1aO0QIsM8qkFThGIK80ReiXtGWPzLsX+zoRXG/r
 d4IQ0px1to6syqw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063126_908410_EB628D65 
X-CRM114-Status: GOOD (  11.76  )
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

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 26bea88cb967ccdb7b3cbae3191476f486c86288..73315c51703943d9ee5e1aa300c388ff6482423f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -289,6 +289,7 @@ pmu {
 
 	gic: interrupt-controller@1400000 {
 		compatible = "arm,gic-400";
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x0 0x1401000 0 0x1000>, /* GICD */

-- 
2.48.1


