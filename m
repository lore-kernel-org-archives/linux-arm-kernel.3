Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEDFC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKUZ1+4YVFc7xv72f1Tv2gQXBQdFJKtnqIffuvfuqJg=; b=XRNf8zWtVO/iAyjEO5oBg5zH6X
	pIzfJYYPL60BXLfNH6a75v7ZfdO0qDxRTpFfBJGe0gIaGt59fffLNfhazvmOyerRZYrbtkAzE/n8j
	wOYKAWwuIgMVw2jbYzYv4dYQI6RjYfsOYG21xdYL4FsJYZ7XFf8q3dh+RXgTvRg+pA1x4Vorl7YoH
	EMnulwyvCUk2alCM6M8NcPw4NIM+IDS/zf8JY7lzJTG7nMnc2SfiNsmeOoidv+rsfTg+RlWrCN/ou
	ngPA/468imy6EarZJS4PvQOjD5w/pKedfWNZ6BlhoALccX4CDsLw2keuYjPO/qfcyhLG11T1lOL6Z
	bUniFnlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EsT-00000007YhX-1S6K;
	Tue, 22 Apr 2025 14:45:37 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DcO-00000007HnY-167c;
	Tue, 22 Apr 2025 13:24:57 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout3.routing.net (Postfix) with ESMTP id EEF786151F;
	Tue, 22 Apr 2025 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1745328293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PKUZ1+4YVFc7xv72f1Tv2gQXBQdFJKtnqIffuvfuqJg=;
	b=LU0+EREInbRgxanmLXPYEjIel1kjNAPflLhC5IdCFoTW3GxFoGUVYpi8D/9hgVAXEYXGNv
	OPiVPgNF2B/rhgXA5eN9mu7ffuKM5JLiT3Oxj/7ELYX2TMcS8EagJb+Gc3/Bc38KhXCELa
	6XRUgJmn4rdNqsSZuVo0jq3nTzvza+M=
Received: from frank-u24.. (fttx-pool-217.61.156.53.bambit.de [217.61.156.53])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 11B95804E3;
	Tue, 22 Apr 2025 13:24:52 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Daniel Golle <daniel@makrotopia.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 3/8] dt-bindings: phy: mtk-xs-phy: Add mt7988 compatible
Date: Tue, 22 Apr 2025 15:24:26 +0200
Message-ID: <20250422132438.15735-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422132438.15735-1-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: d55efef2-48a6-4326-9390-880fd53eedf2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_062456_438262_87EFD0F3 
X-CRM114-Status: UNSURE (   7.38  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible for xs-phy on mt7988.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
index a9e3139fd421..3b5253659e6f 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
@@ -49,6 +49,7 @@ properties:
       - enum:
           - mediatek,mt3611-xsphy
           - mediatek,mt3612-xsphy
+          - mediatek,mt7988-xsphy
       - const: mediatek,xsphy
 
   reg:
-- 
2.43.0


