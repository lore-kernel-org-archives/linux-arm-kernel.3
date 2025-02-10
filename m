Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC926C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 20:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaDZZ3S+Vjprvw3VoZJyJ+LtDoigFQjXYIj4Wx2Yy4Y=; b=WKs6QxJkH98NkhlHJsJ6Hpp+Ty
	lhupJ5oqc5KTE6cPizrM2iQGyTZs1qU56CfLj9aqKhLYGuLpEocx4pyYjkds2oui/TXQMxOlGIrUV
	FHZCDziM7J4nLhEPUG4cwTAYRlBPWNaZN9cu5QSZVLpv8M8XdiyjiX6Q8L3J9Fto6K31cjZFZq623
	vNUjXisAsQfK/W646faX8CDag2l3Zh33/DOkCnP7bqfCMX2Yr3O/rzaLJ5Rho8CouDK/tkHWjgAOm
	DC/NqElx2fOQvW/appmwMYdOSNta/AiPlVTRg22bpCVQmYv8OY0wHIzxUJr53Q2Dh5KUNGja208OW
	UWmb4mhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thand-00000001Pia-1I6U;
	Mon, 10 Feb 2025 20:54:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thakt-00000001PRj-1V5p;
	Mon, 10 Feb 2025 20:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xaDZZ3S+Vjprvw3VoZJyJ+LtDoigFQjXYIj4Wx2Yy4Y=; b=Jx6XVD4Iy8N4+52uTGGQEdzQB+
	jLTKpT0ic6HxdRNDBMXPCGtemNlLXz54+kQ5DICSiPGlrYiqGoMfsKv+2VFP2QDqbuoLCnUgd34eQ
	uXz0y4zoWyZVafixPtFggYYn5ZvZFTKzE/x6H2pgUuhH0lNGAJagfP+gWXPbjoihpSA1eKweCguGO
	dsNtaNoDoMi0xblxemtfWhGcH7gEoaNpSPnOMFweCd1AmXST3tK21+sUmUBLNMvqoXby9Vhck/MGT
	9IPx/dZEFWjTmOZaoPoY5G7P3UExlbjn1IsWbzkwSzOrJAwUJy0sGRB7i4OWas2jG7umJjVe458yX
	jLs83qsw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thakp-00000000Fyf-3oAI;
	Mon, 10 Feb 2025 20:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xaDZZ3S+Vjprvw3VoZJyJ+LtDoigFQjXYIj4Wx2Yy4Y=; b=xqaIEgokoVRUiW1SZglA7fZNJd
	YHo+F/BTbdqXrteNgfOVhLwG5ZyZZ4uvy3F9flDomG1YFoMS+nXlsr5r3rdIb2xLtUr7zG3HXOHdr
	m28tKOzjDdsd1mqw89YK3nwVUJoc/9DA4RLp2/iM9ouYBfcg/Bms3FNoXpnDvFkidOjpPIs48Mv1h
	4TL+7uUUxaTbR2W7kd+c9EoEOKVyVMCR0urLn0+HMqpMvgY2/LAheqI8AHzwX41t9NZ60WWSSACjm
	p/U2C1eS/+NLSQbtB3zDlsFq4COEnSBXDhlWt2FktvtvB8EKqMkPWKh5Lj4ZPcHW9hP4nkawsVnxw
	oklbeRUQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thakm-0007Ka-1a; Mon, 10 Feb 2025 21:51:40 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3576-PC binding
Date: Mon, 10 Feb 2025 21:51:25 +0100
Message-ID: <20250210205126.1173631-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210205126.1173631-1-heiko@sntech.de>
References: <20250210205126.1173631-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_205144_144159_C4CC13D7 
X-CRM114-Status: GOOD (  11.22  )
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

Add devicetree binding for the ROC-RK3576-PC SBC.

The board is based on the RK3576 SoC (4*Cortex-A72 + 4*Cortex-A53).

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 522a6f0450ea..0f4ca08d9ae9 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -236,6 +236,11 @@ properties:
               - firefly,roc-rk3399-pc-plus
           - const: rockchip,rk3399
 
+      - description: Firefly ROC-RK3576-PC
+        items:
+          - const: firefly,roc-rk3576-pc
+          - const: rockchip,rk3576
+
       - description: Firefly Station M2
         items:
           - const: firefly,rk3566-roc-pc
-- 
2.47.2


