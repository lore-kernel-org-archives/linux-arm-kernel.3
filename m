Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE29C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 15:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skHs3OlHSz9Q2Xnt3rP+ayldgN2O9IRiCIDoLEC9snk=; b=eNykjWJDlrAiIP9tfbau1Jaleu
	6Z/Gxj4wjFLWT62pbQNAiGBXt+CXj7M82ji+yPyHeLb7wit1L4ug9uVcRLSM/MXOxaNNDmTOOa/b8
	UV2nOJduTFUmhQcOVC4VyuKP40hEvtCSFlyeiVahI7JD8WcVuu6wCmZXNU6vsDeD/qY+VP2XuYKeY
	HxA1nL1iujbOe+ICMbrwYevoP4kEIZU90jMBW4z4ZJBS96YYS6NI9PYBgyt99LJy71kJuvX1+C/wP
	ld3DxhW9p3zzoZsQyRSvtiA/8v6hgCiffdObx4JlfMpJyg7KNhYz4XCTzx9rFTT9g1rsM3QMcUuAy
	8+cv4xdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh91z-00000001sL1-3oRE;
	Wed, 30 Jul 2025 15:47:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8dd-00000001q4f-4C2t;
	Wed, 30 Jul 2025 15:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753888960;
	bh=Hn1macxBsiwE8zIVXtjtrzSVv+kL8zbKJT5C2OuAsOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d8595H4/FxuZuk/QCIb+PXEPxoFNt6QxfKgDuQUz6v+RDVaefb8DuTmutdarVe5m3
	 TSzeC7uLRfMHEBc5jVOhv5RsQVzqCKFWMBG0KogqiIB+29t5n6+AAkYe9T4fci3O2F
	 IrYY8XB61nbZI7Cruy4xymeabhnTudTpybiWQvzpzbFEe14IeSugacbfhJh74TWLas
	 3j5dIx2G1zenqrO0oDhLQbdZmOqMrTGzScP5N/LrpIPgNTuyKr+hrSbMJL3nXW2B12
	 kVk3UTX87NubKeMhGNn+YUKMrJa8l0iaTwzcH3X5Y0iOf6aMnE57vPl9flx00hyFSR
	 65O8mmbhSD5sQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:41d5:bfd6:7c6f:85ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F1F817E1315;
	Wed, 30 Jul 2025 17:22:39 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: wenst@chromium.org,
	nfraprado@collabora.com,
	arnd@arndb.de,
	colin.i.king@gmail.com,
	u.kleine-koenig@baylibre.com,
	andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com,
	bchihi@baylibre.com,
	frank-w@public-files.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v2 9/9] dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
Date: Wed, 30 Jul 2025 17:21:28 +0200
Message-Id: <20250730152128.311109-10-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730152128.311109-1-laura.nao@collabora.com>
References: <20250730152128.311109-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_082242_178624_F3546E59 
X-CRM114-Status: UNSURE (   8.52  )
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

The MT8196 eFuse layout is compatible with MT8186 and shares the same
decoding scheme for the gpu-speedbin cell.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 4dc0d42df3e6..455b96c1e1f4 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     oneOf:
       - items:
+          - const: mediatek,mt8196-efuse
           - const: mediatek,mt8188-efuse
           - const: mediatek,mt8186-efuse
       - const: mediatek,mt8186-efuse
-- 
2.39.5


