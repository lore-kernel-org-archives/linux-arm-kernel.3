Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6B3CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2i3UALvvPP6Ui/onN1qTLdYAr1h9hBKlMv+xunaajbs=; b=nYn+UlN/voZ+5dlFS47AnDHiil
	PPwcH9Kn5PUIk7kQE0W7df+xe1u2PtH2CA3YPkHk3D31riezi/O9Hv0eQ6HW0je9kUx4ay68uXMtG
	Z0HfLC00vdVPIV+2T8BZft4eQGIETlQJ1u94nO3nBWrYiDVlA9Ard91tRleGoQh/0LyxYB8B+4Pos
	fE5pqI0zkcH7vZD8RO8lLGfB/fXSxFmnkNQe7wTGoB8Z0WiTGWg93kEAiOKYvfc2GCT8y4JE9U9dn
	3DefMltv0gVNVCc3jYH2afFdGPWd9cf370LI/6MkXuPlBei6h1hkyE4D+FD2qHiOHQ6+Qywk7wSZB
	r2mLz6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphqA-0000000452f-4Bof;
	Sat, 23 Aug 2025 06:35:03 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRrg-00000002dMU-0WSG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:31:33 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-afcb7322aa0so25968966b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869490; x=1756474290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2i3UALvvPP6Ui/onN1qTLdYAr1h9hBKlMv+xunaajbs=;
        b=x/Ot25DnSbd8VvktD6mEKJa8R3lDdK1G/5D19uLp0TQnIp2psLoZN65URJTBun2Tb2
         KmAIX1wYT71v9WeMYpE9sXQk+PyXgCI5A0+RTWUtI8sSUv/oJvrJoy5rp9Cnvws4A/V2
         hpT+cgg/9DwSjJqAjG6TCRi1AcwclRaMmWTZVOx+7VFIF2f+xU1N6QPnzC1ZYl0pE2RD
         88/IL7fL9eER34BciUG3C9uKxIBI34WQU27V6xgLzIZqtBjjWMfDf4EFWyeS6K8ugdvp
         nvaWetC7uCnwXbWK5hiWH1nW4LMliHPinj4y7Y/SE5ojWinymBWBcqX11XeHq3rJh9lO
         xfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869491; x=1756474291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2i3UALvvPP6Ui/onN1qTLdYAr1h9hBKlMv+xunaajbs=;
        b=Yq0XH1SAXE8orEnFim2lF9/wN4QZVkPmJRkV60pro80Z9IWd09rw4z7xpMzMCetcVF
         UEjMOay36PQIZyIOp4o1B7xnVHrxABZqVJInUi7WbM/hoZbAGabfjfvGl43bW4Th2uqn
         qmB7WwwZXI/WexCUhL98ukJ2+dkBmUReefPVsyHO5Y6jx6ijRVCwmQhE0rmPcDPgWn/S
         klaoh1GQfxFiFS+J4cpIgaQV5Xwxx220qEBD6wJKT6VsSKduTOdRNb7SmMHkx28cr6sg
         f9CInG3VkuXUlP806/wtNCYO5frGHovnrdrMNupT9oUnagB51IELh/OfDSBY5ytv9eed
         OfMA==
X-Gm-Message-State: AOJu0YzYcE5is/2GdMvjkhvm7XZ1dqQ8kaV4KawKT+g7S8mHzEK5HkmD
	qNJkobs/OK9IS9v8/omVDLX40hp1wgTeXi2PsGAVovfSzSw4uiRqBhVQp0sftE9HrR4=
X-Gm-Gg: ASbGnctgAwK87N643t5xBWjxfoH30i2lcdd1x8Kf4NSw/g20AGQnDEE61SWHb0zam9a
	DFBP+jbiimjwt8y7hLt/oiE8jcIctcerkXPeFALz8XIDSEcs7csxpqlmeMsRQIXlcZ/OZ0qgCxv
	djFi6jqOmUeqbaAuemy9tKC/1tbQbEcWDRSKbvcX9G3lVSbUR3Ue4zDesy8VbZ6ZVNR+QKBMkH3
	1TA5Qsqmv/yMRpgUMHpjA87ZY+bDG6/J5PM0tIUmjVqCC7NV2ed3XbDBlNX6b03ujSmavfcdG/l
	+LlY4EpPVHqeZqCqUuFy/BZYQ6M1v1/rS+RxWB11zXdEkhW81Ccf1LmfrAHc7FASTQKqfIdMrmG
	IwCYYEqfIUdlD/aGLKoiMAEbzlbZg/isABvau/+0=
X-Google-Smtp-Source: AGHT+IHZ5jhA9JpGxGAjhnxBjfGh86JHBTsDrJCTZCPuPU4fbysR9CHB+p5QK15/n8QCznzjnUbV4Q==
X-Received: by 2002:a17:907:9405:b0:af9:5a1c:fee5 with SMTP id a640c23a62f3a-afe2874f3eemr157176966b.0.1755869490268;
        Fri, 22 Aug 2025 06:31:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:14 +0200
Subject: [PATCH 05/10] arm64: dts: imx8mm: Add default GIC address cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-5-f1b479da9340@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1417;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=w5jQPRtxKVdZsfZ+Eeys3YE/WQZUF747Kck162jzCnk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEjwIVHDMjjNUzatpKcLfCThoUYLutFRJ7cw
 HgSaiYJE/mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxIwAKCRDBN2bmhouD
 1xTvD/991PuRFgz8vug1PKR7NPqB+k//ficQEDALcCCDOZPeAgt+1c9/AsH2VEkwsDUDtjRZIRO
 FOUBAHYPr/bcDoNRvgbQP0tyGrxQEtS5QWCvFnFaN8LuIysG7S/9SQ/tat5L/2N9HFwiNDduvt1
 QZlTWj4WmYdxpg84+FqmiM0Thj7h3PBhU/dEvI0+L/oMLzYBbWBr9f7QuBl/Lajh2cm/1YT5bbA
 1v3IL3uqm9+s97dYCDTunv6HxB/Hs5kQ+hfBw4GlleezrordICpGkCfdzZbSgxSVxLoigZYEaXc
 6Cs+Lnp+HYdBC+L6lYbiqpGUz3nLnX84gDviwKOAu8hesje54hPr+fk9fzNzyRDTO62FYDsROHI
 ToW/ol1XArkiMnceIONQe9ZdSEiIRxt7HDdMnRhqdMrhcwT11lbT9mhxXIkcoI7MrP84arLxtf5
 4N4uschFl992r4gnJGmygxE/wu3LtwtQRo2A+9DAg3UFyUbg9Dq3wkf3PPfEXq2/YVVLdjq9Izu
 NWBnWYMBbxlUxFrk5PX9c8RAOx0nM/5c/DpsX+NLNB3Y4VE/FVGuu+MO2PkIXjlom6uN+kwV/1f
 noM4ruD8BYLksYZFwpHYJpheblDAcE2fAdriS6mBT1IZWpJcfEiQseXqOmKrzaCfdhcDDxE4eAe
 SK9s5EkTzpKf2Qw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063132_171202_C4844CD1 
X-CRM114-Status: GOOD (  11.53  )
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

  imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index ded89b04697014771c20cd7c285d01b73ac9edb9..fc3cd639310ef07d6d14c457af607f61e2288b1e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1467,6 +1467,7 @@ gic: interrupt-controller@38800000 {
 			compatible = "arm,gic-v3";
 			reg = <0x38800000 0x10000>, /* GIC Dist */
 			      <0x38880000 0xc0000>; /* GICR (RD_base + SGI_base) */
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1


