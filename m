Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BEDC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4cXuAtgUs1MzeQPNLofj0xLDBzZAy2dVcqVMZRNRe8=; b=jEHgZ00V2z8lVoDhp8zwSd5/v3
	6BUksCkePcyu2VMR5cJmTQKudgvvh701H7sCspWJrqCaG628hi/XFyv+sH89t+GmhwWztBjLxsMre
	EBxrViNsFTdAXhoadmCo7pxAqHEuKZWc+3efRR46otAKY+IcB1B4J0nVvkj6JxXzqQe9A4Ttn5kLj
	jB2LBTxyJQGMCX/bND94DBnRDzuDzBFy0s6S93pTyNUbzMsg24ssQwJJueOV7+ijwgmwbFYGQ1bSm
	UZWwMYjq/KAeQvOEK1Txq75pb2qBCMMdo9mpDRxp497sNqbqdTl0D83P+Cyp1wWnUXMo6W8n7gCby
	zBtC6cKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ezu-00000007Zna-01nP;
	Tue, 22 Apr 2025 14:53:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DcS-00000007HqX-1S6D;
	Tue, 22 Apr 2025 13:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T4cXuAtgUs1MzeQPNLofj0xLDBzZAy2dVcqVMZRNRe8=; b=llTAgAk0maoy6OvXznwIBkoKyW
	cRnmSsy4Egn2t/8O8jVwXZLZHi0xn+4Y+f+ddOdQyG5bhood+D6xkKSPbGyIvQQSqtIPOrhNwHTvL
	CmFuqJNHzCPsFOuoBl2z1YEtMXDEVr0hRt+5bM4yqzCJQZYieo6ziguCRnnYUEJsnPkZlyltqX3o9
	EUMqFgOQJyxoQR9SgbC4hEfm8AgAmHAXS6R9VuoWkZfQoGwBBlqdFyxaI0uXHTzgcRr2gKoA56uQS
	qxsKUAHPAAfM8FJTB9lhZouMloMUs3eN49rc72/3gME+2LUzWQ+G7Y6ilv0BJO8eH8HwHko6kIX6S
	6IxcqwSw==;
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7DcP-0000000BEPk-0Nsk;
	Tue, 22 Apr 2025 13:24:59 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id 9154A3FEAB;
	Tue, 22 Apr 2025 13:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1745328294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4cXuAtgUs1MzeQPNLofj0xLDBzZAy2dVcqVMZRNRe8=;
	b=VqK3lDo8PVhYpULBdkKMU4E6PXwrIZj4LSWhXDcNiP24772PkxdJqo9vQn9ZC4jmK2tw8g
	f4qBw+UJHpRKnS+9BYifvFSGYysl+xCYp1FD22g4ZeZMdwnI+7K/lpQmkghWOKFAUaeWyd
	bc1svMrCnNlPQYKu/lGtpVZXjJxoIVQ=
Received: from frank-u24.. (fttx-pool-217.61.156.53.bambit.de [217.61.156.53])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id ABAC6801F5;
	Tue, 22 Apr 2025 13:24:53 +0000 (UTC)
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
Subject: [PATCH v4 5/8] dt-bindings: mfd: syscon: Add mt7988-topmisc
Date: Tue, 22 Apr 2025 15:24:28 +0200
Message-ID: <20250422132438.15735-6-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422132438.15735-1-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: b8e8432c-90f6-4c86-b7f0-98af8c167af7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_142457_279762_7AC3A233 
X-CRM114-Status: UNSURE (   8.32  )
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


