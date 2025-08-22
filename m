Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E19CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+/3XqC9O5lqfeiA7jEpapMypPzqJuRm5i4h79cnVCQ=; b=b1/V2NqQHkR9AQrzlufhINRGAO
	NLZBcv4u0pwEbUho9sEKuvQ0xX7GiRZIiqWPQflASrFzFWPZ1L/zvEqVi0FcTt0Gx2Zls6EXVdfqY
	VY3kRqF7BY7fyEO0ApXRXaR5PRzhdWa7YSsDoDQiW4Tr1cOL8EKe04fs144Xt07a6DQsHR7kkfsah
	Fakf1bRClPjmviDjim29BdeiBeVqv8wpqK6zfh41wTpQoCR4Ps+BCkUGIOw+gRYcw8SnUgwh3ak7n
	0UZBJ6sMRooF+rLXPcXHi5gOY8RxtsUXh1Ain7FFv4AXlG6WUgOUUYhW4n9uHhM6SM1VzngC4S55C
	ufNLYWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdu-00000004SHy-3boM;
	Sat, 23 Aug 2025 09:34:34 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRri-00000002dNK-3R1t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:31:35 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-afdf4bb0e5cso31555066b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869493; x=1756474293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+/3XqC9O5lqfeiA7jEpapMypPzqJuRm5i4h79cnVCQ=;
        b=GqNfq9HIEHYAoKSak/BWGt2rqpHhKDe3sOavbgspz+vhZyzDoJEWbQKCO6wEM4SNwk
         SfgxV9e85SebZ5RvXqSPsvzoYpZd6istRD6nJlGOzs/SyP7FU00dT1RIl5VG5uMp9WPh
         Lmra4dbaylV463kQ/2H9YkREaTva35f/TCwRvBkdf1lQImEaLJxf8uHHYbQ7opb5C8A0
         t1cAfuG19jPAKbBH1v76hPDe7qFO3xkNIQXYUJcWd2uGch0bM7wDahMDRQCHmQWYZrH4
         EeVXLicAlzMo3GaeWNgpIifRMwBDNjXll4rByWBFaK6jhcuHheFRcPDOIKBuSMLW5qW1
         oY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869493; x=1756474293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+/3XqC9O5lqfeiA7jEpapMypPzqJuRm5i4h79cnVCQ=;
        b=fKw1L1m288i3GSNusg0ZPbF0fpQDuwQ7wET1UW3eg1xq5LTbB3AZ1SXgaz2FRWYY8P
         sgozjzMA3Nv9D1q0KbzDLahAX4BTLIouphu00q8xCJKNqRzFjO8knj3OoS7uVaXFEchJ
         g73B9DSO5n9Dvso4rJ8c9J0X1tDRrnBvdtDsY7DOqPhZQkzxXZZqjG1qfkVX4kqFDn/p
         s8OJpWBIr1Cank7Y8y7TPSvTZ1dYohZuXi2yoBmSgWCQIDAKfgX0GE43FT8J6YHy1bUX
         x7agH3HKi+oogALMN8PhLYR6LRqw1cIcpf7psz41lzm4gRWwP4NbSZlQFTwHsWsrPElz
         255Q==
X-Gm-Message-State: AOJu0YwBw8pD6yZwsjrYfZLBNpPsGCh8JAAFu6VCHpls5aD62pGv2rkO
	nazBJex9owTDdAP057Uo9A1v5pEYMA+Cr4TdsP/3e0vch97uruVLG36X1A5tUSp0gwg=
X-Gm-Gg: ASbGnctkO8riH3c8O5/NE3f5X0EDVLYAW0Evyx4GEaOB3qYWE3fsAK5Mf/38WR6v+iO
	7ELr14v64kNMIUAmwI9FpQLemt9Cpom8kzohu39/xanri1WaGhNYBA5pxom540U9fFnH89GTKMb
	PeWTDgOTY+3IoI4316FurhNCr1bYiHiSDFHjdiNhPouXmj5qBrZL2f6FLl7MXvnUmEgVfjCXMuX
	BlAGanwL4qfwYigvo7N+GwGgnRfrJlglywK4vU0LsMQi6X4kvyNQhENpGAXyQeQAw8vvoo0GYyS
	DlRg2tn/YS6Oxjz0yHEoeYhGetGnHMEw0Y4o1It4LHtzNiamF4Md1kZHUQG44mb4qOnXJeqrucL
	EvDBGEdPn1IXrijZ9poo55z+2L6+h1dkOjcviasY=
X-Google-Smtp-Source: AGHT+IGv7fFkgXyf3+soUZrw4vUGsNAYnhF5jPzx8yt72j1BLMthgE61ET3nwo62H4P4NqEQzXSWRw==
X-Received: by 2002:a17:907:2686:b0:af9:3397:ee9d with SMTP id a640c23a62f3a-afe28f60bfamr149944766b.3.1755869493213;
        Fri, 22 Aug 2025 06:31:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:16 +0200
Subject: [PATCH 07/10] arm64: dts: imx8mq: Add default GIC address cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-7-f1b479da9340@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9aGPRqF3hU3LhHMJ5AKmjiN2YyxcsRNqdApXK8jOBCE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHElcNZBJwVVoVferD3+Ha+vRMM/Yxaj3iOuX
 ndH63U9FAaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxJQAKCRDBN2bmhouD
 10X/D/48aejT48pDsDMcPM2RnZNjcDN50dVq1bQ31lwG1aErEMVxN7xy/aIU54uRE8a1JAdMWL4
 pVQKTkVJzM9DlzkY83kNNUh5agl27PtDyQ+pM27g3ZNU3uQQIGF7EDt1Nzlc9MGKtJN0DQ63qcC
 Qmyj0yLBCpSuyD5wh/CUh8Re08HOJvxdWKghvffYt1NNHnm3K1kP1fyR1PfHNhImMcmhpNc85zR
 Kp5gLcNSxsWFa9VEYXHhZuFNUi2+UPoFdrsTgbJAzSfapIxW3g8BbQ4CzZGkTrI3KtQ29kPyM+D
 bP0DC0vMAiOmkG9CLT+AujHSVUi364vqMFOOZ2GOSpvLNOTXHLipnwdHJkBDMjYEo5UJmq+xhLt
 fGblRgCLiQm7Weav9a9TR7xdjXB7aLrnSAKB0j3eeqblgZEE2iYG9KnIVyfEpnDPeV8D050knca
 xyJN4Cx6rB61FPv9KxFVCLL7IvDPwk0PRrQHaTjgfNw8WHWmssVH5yQjPQK5CJH2NVwRNWBqnxa
 QF7Jrs2hGiGAFvnmdYFgp7AbjOzbfnGe/Ya0HSzbRq4ANwnmGT9KAUN5YrtLyq6iBQK0/8JZCvT
 JyaPu35vcRb8esRoFPgb6m5Ev4KQHv+qDKFQiDJa9SJ9i/N09E6EG4XPGAkaXXKYATRRP69svZG
 +h0aCa505lvd3jQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063134_861465_9FA0A3FB 
X-CRM114-Status: GOOD (  11.49  )
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

  imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index c9040d1131a80941474806da0741df18bd36b2c8..607962f807bebe52d55976019a210738fa6bb339 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1890,6 +1890,7 @@ gic: interrupt-controller@38800000 {
 			      <0x31000000 0x2000>,	/* GICC */
 			      <0x31010000 0x2000>,	/* GICV */
 			      <0x31020000 0x2000>;	/* GICH */
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1


