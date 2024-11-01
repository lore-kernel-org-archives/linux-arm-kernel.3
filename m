Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2B5E6F069
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epRFOHNij3h5S8KJYQr26l3Lp2Hi6cjPFcirUI7Ac90=; b=e805Wvew7xoAzEfBK0CqrIn8pF
	uJzRGBxa5EY4jrWSEjSP9J8WeTJDxOwqW/UDMFdAe2Gjw2maUPzuDQ6eqUy3m1kvfgoe2R8iXfIwe
	qhsdUC01Uj2keZWJe5M4aXjcp+P0sg4HFT744+QluYY5Er3QyD0ys5FJipI7XOAw0AUf2EFJMy7tT
	o7Lv0ijyraKfJYCZqTBKbjktrv+xBsBBDOJCD3DveSOinLmNyWDAwAH0H/LRT/o6Kqy21xltkSqkB
	nqCLh82XbZ9QAmG2xJZNDzejU0nk0v3m1AESWAL1pGEbellkAPV7Wkw3LhAxDQpb1zSZn/dbaKQ9/
	EgQG8Eew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tdl-00000007Vte-27TE;
	Fri, 01 Nov 2024 15:32:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tSD-00000007UH4-2tff;
	Fri, 01 Nov 2024 15:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730474448;
	bh=uJk5zksfhouWGMoFsDHDsI8Z9+bLS8yFcfshC7rakqQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GHyfIKEDrY9ML7tc9WCoIGPV47OSQFh43C05dV6KkyoR6m2vo/doP7LNAIMTbDxM9
	 lchuGR8FMvGxcFHI67T8ePKCcrz/tgfjG2mAf416JOUKyR4DETOMlXjELTslVjtgxe
	 Ca1GmZ3hTnK3ZM1YU0FBUErPV8Ok5XVwuw36FTOJau+K0H1D3S+G8YKlSoiliNndN1
	 069IdUG0fbbInN/Lh7wR2N7uvDGxyRloossaANu+xllQPESC2rX2gEXaiEb+oE7PGe
	 e4IYfiDV9psVm5fQVqzYPNM0r/9DAxrslLtSPedoPpO51e8XuJmWP44buY9i75RHAB
	 AExaN4igeGs1w==
Received: from [192.168.1.214] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6298517E0F7A;
	Fri,  1 Nov 2024 16:20:45 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 01 Nov 2024 11:20:23 -0400
Subject: [PATCH 1/4] net: dt-bindings: dwmac: Introduce
 mediatek,mac-wol-noninverted
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241101-mediatek-mac-wol-noninverted-v1-1-75b81808717a@collabora.com>
References: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
In-Reply-To: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_082049_924660_BE9B0F0D 
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

The mediatek,mac-wol property, as described, was intended to indicate
that the MAC supports Wake-On-LAN (WOL) and that it should be used
instead of the PHY WOL. However, the driver code currently handles it
backwards: setting up PHY WOL when the property is present and vice
versa.

In order to rectify the property's handling while still maintaining
backwards compatibility, introduce a new property to indicate that the
mediatek,mac-wol property should be handled as it is described, not
inverted, and make it required for new DTs.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index ed9d845f600804964e0000dd4354898673fafe08..0f20c4e09e79ff722d53a364825da29bd6323c31 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
@@ -125,6 +125,15 @@ properties:
       3. the inside clock, which be sent to MAC, will be inversed in RMII case when
          the reference clock is from MAC.
 
+  mediatek,mac-wol-noninverted:
+    type: boolean
+    description:
+      Previously the driver parsed the mediatek,mac-wol property backwards,
+      enabling the PHY WOL when the property was present, and vice versa. That
+      behavior is kept for backwards compatility, but newer DTs should specify
+      this property to have the driver handle the mediatek,mac-wol property as
+      it is described in this binding.
+
   mediatek,mac-wol:
     type: boolean
     description:
@@ -140,6 +149,7 @@ required:
   - clock-names
   - phy-mode
   - mediatek,pericfg
+  - mediatek,mac-wol-noninverted
 
 unevaluatedProperties: false
 
@@ -181,4 +191,5 @@ examples:
         snps,rxpbl = <1>;
         snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
         snps,reset-delays-us = <0 10000 10000>;
+        mediatek,mac-wol-noninverted;
     };

-- 
2.47.0


