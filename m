Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517F3C71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nN63ktlFz22i54H8J24OeO66wAVVX2BDpbJDaUX8onk=; b=etRxZTMIsIGHktsxi8sej88T5W
	Uzxhrkflq2/U2bySAbLi1jIw+dRq2FN7TrX22xJ758S9z+E7lP0/d3fgDdM0ouZP6aDVG6XbJyOdl
	aAihFhEwti/cTlvEKcTbkRU5jCRNXEw5l1F4pJeObznj3zYZZr7Gi6H1O8BA2hRsACeeLPAWdWhPX
	N0j2TJhbW7Fkiv28Dlv7v1WIuGOn6ILCrw+aZHJzGmlNQt97F9ekZLgFZWxKiee1r1QxTLev5fjxi
	msmZZldNESz+ll4k1l9FiOtn4K5r8R7H5EZvBL6IK4N2M58cN9CFgLHyIHBUe2kqzxLuj0NkDM4C4
	rs5w4BMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNmy-0000000AUYl-1jNC;
	Wed, 11 Jun 2025 15:54:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJJO-00000009i6j-0YA5;
	Wed, 11 Jun 2025 11:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749640084;
	bh=eczncSLUPb6w9rh7PFvANX6F7sbxAiYrYAHhnJYfBzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CbrH4D5i9gfkQ8LDHJOb8ZcIk2AtbXEKIaEJQ1iUOEeAzQo0tmYbi0wNVqYpwNTHc
	 /FLSHZhAbzpZJVgD76DnERdKQYBMC3cT5uiYXX5m8RhmUCfda++G8HFSbSwqq4GHfO
	 omBdiPKF3clc3yqaTTdFO5urWwjHnsI9hoA+4PQ11jGJwGMZvHOtRILXznVGlXyNt9
	 m9jcsEz4UDqFMr90aDjeDd+80kQgVx9BuevAlslZQO50hOVB5X9F6n2gKnrU0S9fGQ
	 ZXGiHaYaBABU4m/HDJL01fKZwo6smC9xN/Wb5micmtT0CXvNsBvAvUlqFxmYr9Vvi9
	 9DLm6xZEiRSmQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C9F0717E0F66;
	Wed, 11 Jun 2025 13:08:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: devicetree@vger.kernel.org
Cc: qii.wang@mediatek.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-serial@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/3] dt-bindings: timer: mediatek,timer: Add MediaTek MT8196 compatible
Date: Wed, 11 Jun 2025 13:07:58 +0200
Message-ID: <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_040806_309167_4985EAB2 
X-CRM114-Status: UNSURE (   8.11  )
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

Add a new compatible for the MediaTek MT8196 SoC, fully compatible
with MT6765.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index f68fc7050c56..8e535c6dbf66 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -44,6 +44,7 @@ properties:
               - mediatek,mt8188-timer
               - mediatek,mt8192-timer
               - mediatek,mt8195-timer
+              - mediatek,mt8196-timer
               - mediatek,mt8365-systimer
           - const: mediatek,mt6765-timer
 
-- 
2.49.0


