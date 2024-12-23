Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A975E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2SA3IELLyPbbXVQ5aM6sQkCVX0rg3Gm0u9KUQqgd1w=; b=gST3ZPb96G+xGK45kFrrq0yRsB
	ZobxJquNXvA71DSPlPmOJKg/dtUVJMGXcOn/Ufib681I+UEIqYG6KpaiTwRo561pwIyJjgaWAI/6k
	PZe0sY+PMWNbzVHA9zLA643AG0XmwiViRQjuyN0E+EB4Soah1GprOzlf9epkIx9hqtSq3I0r/41Tr
	jw6QMd8UM6JfdT8RX/o4hJUvq37dYDR/FE/xrLysT1hc4SAolLqvvwCX98u2nT2JtN0lsHj9K84N8
	ykLBlZwLJSl5IpJqscuE/XBAlmjwq7SSi9jV9YalCWscQu4LvGEOfQSBbCLIfEOmqJWC2mtjxr6A7
	+UqknRag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgKL-00000009rJy-2IUu;
	Mon, 23 Dec 2024 11:10:21 +0000
Received: from mail-m49224.qiye.163.com ([45.254.49.224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgGs-00000009qWO-0Qx7;
	Mon, 23 Dec 2024 11:06:47 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 68ea013d;
	Mon, 23 Dec 2024 19:06:42 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/7] dt-bindings: PCI: dw: rockchip: Add rk3576 support
Date: Mon, 23 Dec 2024 19:06:32 +0800
Message-Id: <20241223110637.3697974-3-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241223110637.3697974-1-kever.yang@rock-chips.com>
References: <20241223110637.3697974-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx8YH1YYSExOQkodHR8aS0hWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f332a33703afkunm68ea013d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NAg6Hxw6HDIVPgEtGU8PGQ0h
	GTwKCjxVSlVKTEhPQk5JS0tITE5KVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKQ0NLNwY+
DKIM-Signature: a=rsa-sha256;
	b=HSYoV1RJhnHZzyvFNGhga9PZNFSTSdHAistilVb8i7BlNQ+dJXjJ4mis2JPttYKrEQX3WPf8s0zHUV8qEw1pe+EDSDtxBNeAVD9KSjbQ8aGLlZPL242U5omYovQdeUhkX2LfPQlfX7XAC+dhm1F5kH+cbgLv/n1BESd4BKV/9E4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=u2SA3IELLyPbbXVQ5aM6sQkCVX0rg3Gm0u9KUQqgd1w=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_030646_326987_BBA051FF 
X-CRM114-Status: UNSURE (   8.81  )
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

rk3576 is using dwc controller, with msi interrupt directly to gic instead
of to gic its, so
- no its suport is required and the 'msi-map' is not need anymore,
- a new 'msi' interrupt is needed.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v3:
- Fix dtb check broken on rk3588
- Update commit message

Changes in v2:
- remove required 'msi-map'
- add interrupt name 'msi'

 .../devicetree/bindings/pci/rockchip-dw-pcie-common.yaml      | 4 +++-
 Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml   | 4 +---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
index cc9adfc7611c..3762f3dd6de3 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
@@ -81,7 +81,9 @@ properties:
       - const: msg
       - const: legacy
       - const: err
-      - const: dma0
+      - enum:
+        - msi
+        - dma0
       - const: dma1
       - const: dma2
       - const: dma3
diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
index 550d8a684af3..9a464731fa4a 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
@@ -26,6 +26,7 @@ properties:
       - const: rockchip,rk3568-pcie
       - items:
           - enum:
+              - rockchip,rk3576-pcie
               - rockchip,rk3588-pcie
           - const: rockchip,rk3568-pcie
 
@@ -71,9 +72,6 @@ properties:
 
   vpcie3v3-supply: true
 
-required:
-  - msi-map
-
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1


