Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5B5CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHSlakyKxrjNUT7S6VUafjxhT54zInLD1iFLeYFLDh8=; b=DA8vsmHGuA3rxl6yw+pp572MOY
	5yM7w58U4dITDB1a82sLrOnq5fPRam7rX+EYPIfz0wCpCXMxBA2e169JFI5SuEdGhzAshzZ7xWsLL
	xadmTkLwcXBuVyW4FjbFtyzd+1Yv4XQ6T/IPLyxAyIx9zC5jAC4tBmhwUKMvMdIteS6eg2QJNWOpz
	jihVpmjlmhYI1nQapieuaxN3pLZ2wNS0p+iDxd0R5fPa+HEy1Y7EVVoXbvIXrehHN3T6eU+x/tLH5
	/OTyEQq9p54t6Nz/JUQYgFC/RPGwtYWroG5AP3GrapCHFSz09LnkaJLoxqoYchsoJ8eSu2J1tW0OE
	PC1DZ1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphqK-000000045DR-3AoD;
	Sat, 23 Aug 2025 06:35:12 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRrk-00000002dNg-0H2D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:31:37 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-afcb7a5cff3so34375566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869495; x=1756474295; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHSlakyKxrjNUT7S6VUafjxhT54zInLD1iFLeYFLDh8=;
        b=WMyIEhwmbQ+ZgKPcVKSXXEe77HkZSuIX81ZFz1TTj7WgoYjxu/blTqvujHxPcjQ2iF
         WFedwWhdr3AkBcdylbQx+CvhfOGcqTgFpgRpzVg6SSbAivO8zbzcG3Sm1DL3TemdZYH2
         31APcERHv3/C8NJD8SBva4jnKUYYDCZkCPBY5EcdSSyo76ca8pW4CFZ0FVASD/IMbuKo
         wbISrgxhzmXYgtg5b2b+eMDEV7kDxPoVV4a1kJVUS6bqBBvDfeiOX2RTMRzsMHiSsjWj
         98MTxjI33sDh/a96irsdCdnKaSI/UGNBdgTdE63r4fJyfWH/amI3I1XKudNWqzi9rE98
         UGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869495; x=1756474295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHSlakyKxrjNUT7S6VUafjxhT54zInLD1iFLeYFLDh8=;
        b=ezb3y6PSNJmZGB26IL1E0UQZZtU9OobawMRTzYZCqRmP1vHDwNuVI9RJcu66wfwHrm
         j3RYWB3dbeWuhEumB9hxvezw+8YeJDBPrY6Fy/nysSuaJscYN2geUZDExVXe18hBAbqm
         diaE08AVqvbxpoA4CKEVGko4RWNbvareF2GrRAAnx0Z+ybKrMJyTAN9SN0ezcsGMFuGV
         2xT1+gLsTRYn0hPEZ/f277RjhWjlJW+aBtTkjGBenFMU+gSePcoHhGvSIAC68yIEzQCF
         yKSri583z4tVMIGK61ytf3XQRv2sms2coyjci/NE59eRc5E2SLpV2i9JN1mstIx5a977
         B+PA==
X-Gm-Message-State: AOJu0YzNHmW2120oWTyjW5yTAqgcxB874WzMW08fRQKxIeWSPNXICxEO
	LLB7R7z0Hvl3aVbfrI0QzdsraDKxC2gQlV7SJYj3e7XQmGR/BZNFiqJQvnwLiU4uHXDFPqfSpbE
	+EdzR
X-Gm-Gg: ASbGncuMU/bXA60Q+gnkFcxUmrdatf2PPawfrvPI6xTmh5TbBRSMOmp4LiNJFbOWP30
	p1imVXUAE+FpL0T5IzycPKeGyPOlixZSZ2akdIfT8TFgTAhsi2pWLjVuWl1FlrhMuzzKQHNuFSc
	+zjhjL8TA7nLcN7oKTAgB8ZVVIxIaE+gvi5nd34y9+IIrevHY8+oPPQ72pRHG33fn/yfoadkXxf
	dEaNZ5g3mIcN3uBigLol4XkBlcdFjdFHhvAex6ToexBvQHbcoMlKKeDYsC3IN6DWrMJADaUHI+w
	7g8qyc+1+OWr2knqs4B9kSJ0K2y2BeWzOGmVA1dYv5uCb8BcZKgznpt4K5ocBoCxYkfkWwR1+aT
	xrIhkmLEDU85f9rwp8JAhmoXFZkLi1eakO+Bci/U=
X-Google-Smtp-Source: AGHT+IFH99GO8Rglk9z1kVj4gHZfOeJnVrjz3zilZUHOkV9zKxf8NlcHsbBnTMmSCOB1kQdl0LkccA==
X-Received: by 2002:a17:907:7b8c:b0:ae0:ba0e:ae59 with SMTP id a640c23a62f3a-afe2943ebfemr132325066b.7.1755869494660;
        Fri, 22 Aug 2025 06:31:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:17 +0200
Subject: [PATCH 08/10] arm64: dts: imx8qm: Add default GIC address cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-8-f1b479da9340@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kHSR3OBfxE0kL9LgZuy6tb09v4e6Fk2998ktGFCNaNE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEmpXOBhphAMxpNv9K4iWFobvh3z5y2FOtCm
 oc8Bat2eRuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxJgAKCRDBN2bmhouD
 1zvTD/0cT8GVrN4h/fVwVC9D8PivWS1iPCVzB1oOviTi/ZPILeFCCt2UiG8SZTY5AHKpyFrCKBr
 y7r5VnQ9k7POV0GkdF6cr6Rx0kudWl4Auhxq7ljxJ3SgQ6q/sbyiIWaqbsIa4vVS8Ul65R5mgSn
 HWrLun9VAVRgCyRoR8fvkqyuk6rOP7THvuAOtiudMDyRHEBWl0xw4dD04mXY0TROWpHwlmQykoo
 SnrfYpXxDmunvQ3EddTUce+v9o7lb09/PkaC/4BkqJF9WofBhpx+A5WWC0xPdtiOdO3RKThEIvc
 KIFPBTEM9nOVfqHIOZ1EG80xO+cweeADF0tPU/lHMhXbhr4XgrUXnmi0mum8ifop7YeqBgGNiDG
 eV9uoWroZ4Uvg6FN8LDXCgmfUmhlRlR1A3I1v9maOZhV2ojio1j2dx83Xk+TZeFeLyfb7h7U0oe
 7XtohEOhkEdeR9Y8NresyjZWLoyXYWhV3JAvVIll5sFWqWimk8PqAPRAn9Z6x5YkWHUvIiHyHyc
 bjZfi3NJhcS/uXvZE+qMaAfQAG960emuj0Tfj/MVQLRPmX1gA0Y+Rmqv0o0qbtJdgsk02i0Xwfb
 8b+uMpM2Ur591EvypbdpzjlyzSbnriMvUMYgHhv8/Kyvt1geFiEIh3+3S8Y2lZzxjNUjEkqROCI
 EsXQufp2TZc5omg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063136_105670_F6266A5F 
X-CRM114-Status: GOOD (  11.31  )
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

  imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 827e1365b5dae438d4628852ed6884aa846eb89b..5206ca82eaf642a32299147e9c1b45704075e2b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -245,6 +245,7 @@ gic: interrupt-controller@51a00000 {
 		      <0x0 0x52000000 0 0x2000>,  /* GICC */
 		      <0x0 0x52010000 0 0x1000>,  /* GICH */
 		      <0x0 0x52020000 0 0x20000>; /* GICV */
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1


