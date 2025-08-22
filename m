Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B11CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2Ul2W0BQETQWNbcAlwTY9yoNAx48v1oZv5jnDd27cw=; b=bW9PJhSuQPTHtuPsv5ZiRxcCdY
	5GiDe4lwnImDtsnG5nD6AGm7M71PfnnEqBkPGA5uaYtUo21REMDGW0yO5r+i9ikbDxXwtl+P6hjCl
	Py0FBSIPrs1rc2JH0dgLZchYJGRcJFZix0E7l2xKPnAdwd1tRCzZx0UUg2j27+HOwjc3PBDtgOko0
	HprWHSdv3Yv4QodjD4lpe903+UP7ZtnxkMP+BG1Uo0trs3XlivLLvXskiMf7/ExF7GKkEBToAzz7v
	J7BOyA1wxJ13ftfIL7Cc788g0kw3foUdNDbFEYAqAEx8ESItcaNn/mRrvrRku3flsfUc1lkXyZFVU
	pmvkHJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphq6-000000044xH-2gfr;
	Sat, 23 Aug 2025 06:34:58 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRrd-00000002dM2-4BNm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:31:31 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-afdf5843940so36061666b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869489; x=1756474289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2Ul2W0BQETQWNbcAlwTY9yoNAx48v1oZv5jnDd27cw=;
        b=T0fPQV2cr4YDqtzWZ6G1glCE8zN59FOkU8oTffzDHESPJzsR0arF9b6cJkFfrVq0hE
         JLHEJzO+JcvbVFsb834yGFoeA/cBijzRb53s07PBU4/60UOEo1lbXNUp9GmK1ewePJdQ
         Z6yFTKK+ERXJckswYhXc032edH593q71JECveoQtLF6iyhCVSBwQ5hjzrvsS6PIEY6kN
         LzSAnDEHT2NGt/zEZTvTldlhFYdldkvDQLIzGiqELvxZXnAPJCDbY1kgtLXWn+EDJ/RM
         m9m4G6u9Fpxak4G6Q2AiyGnKzIjf4/7e7+XjFQhpviHdviOGhhsKGBhP2GjKhJ27dU/X
         eFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869489; x=1756474289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2Ul2W0BQETQWNbcAlwTY9yoNAx48v1oZv5jnDd27cw=;
        b=b8b8x5VpeUpNWQvLV51e3FMwYWkn1dWKmb+WZWeGZSQr+oGyTggOhNrhd0FY7WqeQ1
         Pdn/fqFKeH0oMG1GGef7z+tkiVH/haVvIl7c58Np+Wl35ZnmP9pDB/JPAZNmDtH/AK9k
         RG9sOLlgwTgHYkC2ngNbXWyrFJornU+7mB/ffhfuG2/O3z2q+JsHEyIi7A+tcZPaPa9g
         dqcPFKHiC1/U/NIzSM+YaolLBwOXCvoLraiLA1ZqpDfTmfv3T9y37CT9rAhlK0HFAhdx
         K1WMcwmrt8PZlNR165NBmeCisZrruT/+IBVfyCJoIMBn0iQ5j5/xyd5QomVX96mbEMcp
         NKLA==
X-Gm-Message-State: AOJu0Yy9ipdHWwPh8CyYKj8S5+8+v+KluLq2tQuY/ILXNZx8BAT5+jR7
	jORf68E7Ftnwvsj7MnUDC/PBUMPb6NTEkE9Mqz65tSAvwQTuyw9pYpykMx9Ecs8jqa4=
X-Gm-Gg: ASbGnctJ63RV1t3jPeFUhgzr9k2c540GySLC/DzH8lA0rmS7uXCC1uifSng3TKUgIsI
	kqMeIjflcN3pZyQ+ZEy0rOLI9IV6VyBIDFb8vD1C9MuXzoCNVZjQybpeh0pJGXZsv54iuhHjbid
	Wu5LmdiJPf9FHrUXE7cmlTPCo3R3qOllEFm33F/IVJcJ76TQufBwsvaOD518ydO4rHnlBGUDxMQ
	Vnccu9QBg4ca6GzYUPlQ+gmaxvyf+3MjYjhRFC6Nxk7LgD10vbqUF8Vgr6/nTjPQxb7LBIyjsrz
	q/pYF02dPv5wbeM9634CTqLXgdmZxaOO4nVWnV2yyqF2YoccWNPGbhgxwkd3M/f2cEYwy0S8elu
	2em/I+O5EMUAEyq1ynXuVjdhxbKtwfFuaft7Dk3pzdONFQHN6BA==
X-Google-Smtp-Source: AGHT+IHV78ZxU3iKNd6nP7fZUbBvl9S8fQrvWntZEx4dMBRpAUfAAE5JWDVypBBpJHo8PYXAQs5H5Q==
X-Received: by 2002:a17:907:728c:b0:ae3:63fd:c3b4 with SMTP id a640c23a62f3a-afe2904d606mr159402866b.5.1755869488604;
        Fri, 22 Aug 2025 06:31:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:13 +0200
Subject: [PATCH 04/10] arm64: dts: imx8dxl: Add default GIC address cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-4-f1b479da9340@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aXy08N5ASlJt1VGT53iFuQkAElMeDXbRExFiLdVB5y4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEibvRBDJw4yp+gxDajS6PLcrd0nA3hShUtl
 8Dm0nFuyeKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxIgAKCRDBN2bmhouD
 14DaD/9L8xMva9DaFBSQ4PC9biqUYgFlQGRgXmbDMV/uW9ip4ASvFGD8OCb/h2g5ADDSG6hW7gm
 OUeCOa3+yLMQP4eP0gJUSlyVLD+JFjk45RqiywwCDWa4fGnvmDAPMf2eavxTgGll3Kq9Lzlwf76
 UZgG28HmG1rMEz/KyPqBTx/LchefFJOnxbPKeU4iWmpYdNgPQ7ggQlPG1rSIc2teYq4wOTpV/Ov
 X5Cmi9pNXCeQxqgiUt9zZNIZOPodSZq+cPKqEhGeoVP7SLhDnsUHQK84BLFzXyfrQ1oQbobXMm9
 SRnkMRxE8Ilztcs9uhwiOs7wVyXWyprkWQgwdxUkGe2aAqC210k441aZsSVj26lOKVjnmmtx5bK
 02wtbUxMuxWwnsCxkMhUqV1jIhtuQ8oRA/ISwTqdcxGb9R1JgsW7e0DWXFVu7/mnWK8SwGWlfct
 XFshe7VwJA7v3K6mpa37v2JZjifiDk9Lyq7EYaCLDA9W2qn71OxdlhjRhzDN3bITix2YNrbXzET
 vkLRUdrtAnjv34SO3Fp1neixvBP9oDEI3KysCAPbtPk0pJTOMe8BNW6Q/7ReuJRxvmu9/C7k0d4
 P3rt6mILJ69BqKaD6hh4dvVwslFScCPb4evHRO/Ddp+DFdFZ4v7TIiVvyi87YS+qvSVg588Z+4a
 foDRYXgoncHtsdg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063130_042893_4B701FF9 
X-CRM114-Status: GOOD (  11.36  )
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

  imx8dxl-ss-hsio.dtsi:45.3-48.27: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
index a71d8b32c1920bf9d73020ef48eb98fdbe9adc6f..8d60827822ed1cc6cfb1a9369faaebfd711708d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
@@ -92,6 +92,7 @@ gic: interrupt-controller@51a00000 {
 		compatible = "arm,gic-v3";
 		reg = <0x0 0x51a00000 0 0x10000>, /* GIC Dist */
 		      <0x0 0x51b00000 0 0xc0000>; /* GICR (RD_base + SGI_base) */
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1


