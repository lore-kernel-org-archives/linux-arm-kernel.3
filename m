Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1CDCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3058HaZG35cX2XZ/Uwrd0jvSVLQONoV7sGcI/Au62/4=; b=4maO8YZHvrEBrdyXDT8TLFMJUu
	dj4Zeu308CJW3A3suzWYjQBZggHE1LTT9Pqf3lDx1+aoAh3WDSV2XExLRcfbkk2Yd3GLVyzgRcK+S
	pi711i6jFduUBi9hhLSbevAqyZhLvVgVrSW1AKqW/gMBng3rybuGCXebMqIR4X+yyovfXY/WO/N1z
	zAQ3+dNVurp4QOwfJOnlQwjtltsXoUCsPHMpYwzInwREWW8ap80/l7BfDG8ylFfG5KdtUP7P5ahHa
	cU9Tj3OfM2IEZz/CRGoCzupKq3VYuTNVBw5G1CeYTdFAAt8/YVpjtEI52pOBdRMXFastDNFQIapKg
	pcmbAvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdx-00000004SKd-2c8O;
	Sat, 23 Aug 2025 09:34:37 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRtY-00000002df4-1Xom
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:33:29 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb7a96309so30051966b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869607; x=1756474407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3058HaZG35cX2XZ/Uwrd0jvSVLQONoV7sGcI/Au62/4=;
        b=TUsMfsyRi6Dlg3X4OhBd+HunIKYY5MZ9FAUpjrrZPTaOrW9dIFVQR+TM0Qhio884YF
         Wfc6dUmt7wFyT6ha8VRo/BpSpWWLb8hqK/YJ1sHJ2tb72K8FjHKdY4M2iCUwebM2UhWX
         1SEX5ihhLTAa8gkMltK24I/Otkaj2xo3uMzEUkfjyMolMpl8hPuH+/bgIFRTFKbLJB03
         pwwIO3C2b10o3snz9AQBvobmesaeivCwX8wf7MyUjDlBfvFjanW1HvuP6xhTf4XhLyxl
         7joX2x01bUCpSusUnCECzUAyEYVi2+gzdjS3/R1Joynh0XfRqZdIvyRXuY59cXmozgMI
         yFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869607; x=1756474407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3058HaZG35cX2XZ/Uwrd0jvSVLQONoV7sGcI/Au62/4=;
        b=FZ6xOkzrZCb07JzGVcSXwC+fDnn6IiqrmuQlXI+OniIAZTEBRHo612apefXV//+F4r
         MKtQDjJJbtHDtWCHnFhvtxQtZCp9eXK7Guk6hQhrnQj4ECKc4iQTrjxx21zLhlJ4mTUd
         lXFzbUO0EIHO9F24HL/fnBB3LhD7p61XmboIMEw76mpbF/k+te4Ps/2NeXFdiE9emlyV
         i6w1VEiN7dDxwXfojTcpr2ObdiTl2BAkUqvlQB9D++y11tGcH/vKI3sA8w6Jj2ZXOIyZ
         nOHbP/yr8H9W5tRaSCf2OYyHREqzkiOHymv1wKOkJRKuDsjeEAOgWGPgmaOcxoPwTCBk
         R5mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQu3tSQddEQb5jA4xHJ3Uuk6tjijZmSOqM4Vs4RTsNzTLBQxppcB0ONFRV9UJZfHUfjETAA+C020T9342Q+lu9@lists.infradead.org
X-Gm-Message-State: AOJu0YzV4MKkUqzXLgTy+4c+t3JxDKCgC/rWWHWa+9p+fTX4HknIVng8
	dY1lksZx+sqadNDEFiy1pUDSaZy/Cv+We1QAqEfIyKRaAY+Qm9E5EX9ZE52rqYMZqeY=
X-Gm-Gg: ASbGncuqXcRqd8BhNfAF6grw5wQrrLtUkLoZOuV0o/wsg4GGWT4zOiqIrd5wyyvoxIc
	6BGGOLbIf9bryJJxEoIC6E9o0HKDzuJumEVVIWpONEMK9MokKYOkByUYdbZNpHjO+A4jyPK4qPJ
	mE8GaaLsmxoQ83ly0zV30qFVGKWY76zss+Z3OQ9HOnBd7pFTnEp2rJvgNu0uBDhSuS0D4j4Qq6U
	56AKwpwPirft9YYuEbTwxxGUDVTWXfU2Zs/Ywx2tbmVdTUbCcF9dAXSh05grsuEWED963XEmQiz
	oL1DS+V6s0LfSkC2lKjzNlcXWDDmO5+pRn5U1QQUEm729niQvwRcvARJTfRAcC1yHo0zjDNREgR
	//UQsWZksSiyF2PdBwCa4LQyqKPuY1tfSvA==
X-Google-Smtp-Source: AGHT+IHtKcirQUNL1ochiiGTM0PZ2Bt/BmKBeNyJh4I1dwfz3kGNntqYqko2Rsyvv1A1m6TLYS8O2w==
X-Received: by 2002:a17:907:7216:b0:ae3:5d47:634 with SMTP id a640c23a62f3a-afe294cf1c5mr145812166b.9.1755869606944;
        Fri, 22 Aug 2025 06:33:26 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2ba366sm608881866b.19.2025.08.22.06.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:33:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: socionext: uniphier-pxs3: Add default PCI interrup controller address cells
Date: Fri, 22 Aug 2025 15:33:20 +0200
Message-ID: <20250822133318.312232-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822133318.312232-3-krzysztof.kozlowski@linaro.org>
References: <20250822133318.312232-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=uBeC7mf3PEPAn8sqeu6dfy6yJmrTEpravF6dwOWks5A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHGfPYEoemcZVLD4Ece0pw3e1Jo0vFzQUD1it
 D4nvDRASLCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxnwAKCRDBN2bmhouD
 178GD/4sByR6xe9j+oId4fS0kvEgS9z1k/ZNzGSDZe3LgAwxWrP+5ljp9HzwtDXaN6F5wLnwPYA
 foNLnSk8eZOHPj6aPdD4ysyDuymgIwRkivr/lAXDY0FiDs8Sri6ZFWWEAqqUIWGkwzueNbBBN1a
 Rm8harZWIvx5fuBnhd/PxGnUDL2FFHdJgWutJN6ukqmJzhzMBmuOJOoj/VArkF94RTJ+c+1t2Gw
 hxvgPYo6Hvk0XGvcWeJ4oDSFV1PFn8Knb3usTgVtu9WGIosNhGTXRgtma1t5Wfaynahr4V6hFRC
 GfN6+nT9echcgT8n/uzaAK+XBdVuxuoorC4avRaPrphHESCKQehLYOivAV7XKPESaoWkm0L+tFN
 d9VkQhXaLcOsKgqdkIcsaWFxUI1BaIazkWZp2wYf/JnCf8Drh9Zjy5F+espmHAdw5O7mEtNGm3I
 tZeH86BOk6jBKdsi8YuyDXNE1Hyj3pG/b4vNQaaHt/wO1PmS3o9t2t68+Be8FPILcto9V+/z+V8
 oCabngK6rrg9CqiORmq0N3XYIYIyj/lIoOwfRU/RESaTjoLRwJIkzprDG28uNbqHigUfrg1yDy3
 Pd8PlzLVA+H7YhfdDsbwCDNV4CtrbnNQkyN3Mn4ly/x4S5gLm5e+ihiM9uQcTQ1ZshpAoLpggzn LFZYDPjTPEPisZA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063328_404700_202B36F8 
X-CRM114-Status: GOOD (  11.56  )
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

Add missing address-cells 0 to the PCI interrupt node to silence W=1
warning:

  uniphier-pxs3.dtsi:915.4-918.29: Warning (interrupt_map): /soc@0/pcie@66000000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/pcie@66000000/legacy-interrupt-controller, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index d6e3cc6fdb25..4d6c3c2dbea6 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -921,6 +921,7 @@ pcie: pcie@66000000 {
 
 			pcie_intc: legacy-interrupt-controller {
 				interrupt-controller;
+				#address-cells = <0>;
 				#interrupt-cells = <1>;
 				interrupt-parent = <&gic>;
 				interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.48.1


