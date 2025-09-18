Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43E3CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ef7XKUvE5od0cAsfj9E7V+izqiuRXvVII+/DKoHVAjg=; b=gxZx3IZEVSsBDKdNhKF9EaIZ41
	KBRw0KtOwEd+2H7B9s/bD5nVAcvFtvXF30uqCFwxHqCSBCk1ngSm7mmBP800JWLiwLdBaHdMFyO6U
	w43tL0L+YUKvTScw06X/oKMGoZJ63iBLiTPi4TLVAlZSRa90/PM5I4dekWsO0U+nj7Z9Cc/j/Pyxr
	lT6/39DkriL+iqDRhD9QAbbuwyTZ8+esWQ6KbOtJWscaE2J8xwBHMsu7K5f6Az1Bl2pnAnyO7Z/xS
	bSbDkSGqH4VzxGTsjEaJcgrWFEroXWu4xEer2Jk0hvur+HABRHpCYE51AzDkXUFzSLTH+oOxLGciz
	QxPXCd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGbg-00000000OR0-33Wv;
	Thu, 18 Sep 2025 15:31:36 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGbd-00000000OOV-29qn;
	Thu, 18 Sep 2025 15:31:35 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D572F25FC1;
	Thu, 18 Sep 2025 17:31:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaX2TIHOkGrM; Thu, 18 Sep 2025 17:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1758209491; bh=M1y4kyl7/u9ISiwORUl0PBLLRmK62BT8dpUJThLsa44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lnkAaIfZT7DKYWkRJEIOlW3ppvRJGOyH5FGe3UXQ3josx0Ye2dY+cWRyyP5/N4Rnf
	 KWcTAeiIZW3AZdUEeZWlpJuTVqxdUohKHGH4Q+0r5FD+Rib36KegUeegZCxNK/Spm3
	 NLGbiWFUNtWQ31yMktiLXIGezjP/vTp/scQnUG0bNAygUsmh14zyKnkckXWykdC0a+
	 y2BFD6pyJ4FQdZDQxP9/DdufUl5EdtUvJyCbgsfndVEyuZIVWlz1LL9sXoHQhdt3E2
	 sgJkJAaatZ/8arOwvviVaomS6vjGbOseGy/GBGJPUST1JO8eN/tLnSsSbVWOY1nX1a
	 /mPmddGUO1wDg==
From: Yao Zi <ziyao@disroot.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 1/3] dt-bindings: PCI: dwc: rockchip: Add RK3528 variant
Date: Thu, 18 Sep 2025 15:30:55 +0000
Message-ID: <20250918153057.56023-2-ziyao@disroot.org>
In-Reply-To: <20250918153057.56023-1-ziyao@disroot.org>
References: <20250918153057.56023-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083133_696133_E3D9D238 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

RK3528 ships a PCIe Gen2x1 controller that operates in RC mode only.
Since the SoC has no separate MSI controller, the one integrated in the
DWC PCIe IP must be used, and thus its interrupt scheme is similar to
variants found in RK3562 and RK3576.

Older BSP code claimed its integrated MSI controller supports only 8
MSIs[1], but this has been changed in newer BSP[2] and testing proves
the controller works correctly with more than 8 MSIs allocated,
suggesting the controller should be compatible with the RK3568 variant.
Let's document its compatible string.

Link: https://github.com/rockchip-linux/kernel/blob/792a7d4273a5/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L1610-L1613 # [1]
Link: https://github.com/rockchip-linux/kernel/blob/1ba51b059f25/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L904-L906 # [2]
Signed-off-by: Yao Zi <ziyao@disroot.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
index 6c6d828ce964..67f1a5502048 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
@@ -22,6 +22,7 @@ properties:
       - const: rockchip,rk3568-pcie
       - items:
           - enum:
+              - rockchip,rk3528-pcie
               - rockchip,rk3562-pcie
               - rockchip,rk3576-pcie
               - rockchip,rk3588-pcie
@@ -78,6 +79,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - rockchip,rk3528-pcie
                 - rockchip,rk3562-pcie
                 - rockchip,rk3576-pcie
     then:
@@ -89,6 +91,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3528-pcie
               - rockchip,rk3562-pcie
               - rockchip,rk3576-pcie
     then:
-- 
2.50.1


