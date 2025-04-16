Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68376C369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4cXuAtgUs1MzeQPNLofj0xLDBzZAy2dVcqVMZRNRe8=; b=uAGbv+zOkx/ym2oHDNjE5RToUi
	4SW8HznXGjY4bwq5o711361/+59NOugRiPmfxROZqhHg9kW+i6o8KshPw3DBQQ0nVxuLeePKoOXwm
	PZji7os7mQuvVJ/H2QsQ+gIzSpyFVoQEW6rIGvzRhb3508hpWtRQY7oRDUNVT3cmyCEibs+QftPaq
	kg0xiaSdb3oYJqqrOSwlVoZ9Ro8VVClprNIiN6U/vyK8jbjlpPb+r86W1NKfk8Xof/cwSsMhyZd+H
	N4OijUWvpG7VXL0uNY3qEy5ChdwhQDldWMWk3M54cNbQNLTN18nYdJ0lQmS0eDQRunlNAM9jfycOx
	xUzjxddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u504p-00000009C7b-1Vm9;
	Wed, 16 Apr 2025 10:33:07 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4zTK-0000000935E-49KZ;
	Wed, 16 Apr 2025 09:54:24 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 7AFE65FD8F;
	Wed, 16 Apr 2025 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744797261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4cXuAtgUs1MzeQPNLofj0xLDBzZAy2dVcqVMZRNRe8=;
	b=TPJyp0WfXF/jAxsru8seatfdEiB0yh7loihj2kwzcA+bXYxZ6CxtxtoDxRQE7IJBDYj+da
	GwBbt67XO0Bk0PqE9vj0VesWebJDn8konX1dKupwD96WQTcdVeSBzjKmfphOH7oeu+b5gp
	r9ZRUP4DwWdJX9xh1iZKISYq5pKa2JA=
Received: from frank-u24.. (fttx-pool-80.245.72.47.bambit.de [80.245.72.47])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 7EBB73602DE;
	Wed, 16 Apr 2025 09:54:20 +0000 (UTC)
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
Subject: [PATCH v3 5/8] dt-bindings: mfd: syscon: Add mt7988-topmisc
Date: Wed, 16 Apr 2025 11:53:57 +0200
Message-ID: <20250416095402.90543-6-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416095402.90543-1-linux@fw-web.de>
References: <20250416095402.90543-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: eea6f89b-b660-4cd0-b880-70c4cda35fb3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_025423_170139_577A7171 
X-CRM114-Status: UNSURE (   8.64  )
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

Add compatible for Mediatek mt7988 topmisc syscon.
This hardware block contains 2 functional blocks

- a powercontroller which is not needed (switched by atf)
- a multiplexer for high-speed Combo-Phy

This compatible is only for the multiplexer part.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index c6bbb19c3e3e..4f3d522bc3de 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -84,6 +84,7 @@ select:
           - mediatek,mt2701-pctl-a-syscfg
           - mediatek,mt2712-pctl-a-syscfg
           - mediatek,mt6397-pctl-pmic-syscfg
+          - mediatek,mt7988-topmisc
           - mediatek,mt8135-pctl-a-syscfg
           - mediatek,mt8135-pctl-b-syscfg
           - mediatek,mt8173-pctl-a-syscfg
@@ -187,6 +188,7 @@ properties:
           - mediatek,mt2701-pctl-a-syscfg
           - mediatek,mt2712-pctl-a-syscfg
           - mediatek,mt6397-pctl-pmic-syscfg
+          - mediatek,mt7988-topmisc
           - mediatek,mt8135-pctl-a-syscfg
           - mediatek,mt8135-pctl-b-syscfg
           - mediatek,mt8173-pctl-a-syscfg
-- 
2.43.0


