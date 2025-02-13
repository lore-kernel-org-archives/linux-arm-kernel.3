Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C94DC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 15:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFjZbmq5N/uUC7IMPKbDCXn3OAnliBa3w8lFJJhLWrI=; b=LHWS0mw9J4fy0wDt0q91Z/tPN5
	oMfQnFBcrN5IY6ylXb8xlNk8YmQo6yOaxrdtLNPoFsBZRx8Ow2OVA88NF+TndG/xNxQP+/djkaqep
	NSiqYnIHOtx73H7X9ZN795pdLANfOXwpaakAhZZcfzAwbhy5fFIEQhNewLy5ePFFM00MzLkkXbZgS
	F9aWfUlY1ZyB7PkNty7wsdpNGszZBupuPLCmMjm6hlnUZ7ODjwas+PZAZdYnrvb4v5wOBIm2X3u9J
	3CwGmvDNgC3I2q5TF6/iUFcjzMZTxKdqUUycIZ8zHkrCTglSFcdISv+4n0rF08b8UcdYhryLCmiKT
	WFAYBFMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaja-0000000BRy8-39ZJ;
	Thu, 13 Feb 2025 15:02:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiagt-0000000BRcp-1ISN;
	Thu, 13 Feb 2025 14:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739458785;
	bh=Mh/H6vQ6A1hrURy8whbQOLd0UQiv3ywbjr/FbGu1Dl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lOE83DM1Rcs8YdJsFqk4qL57kFELrRb9e5OCj354qcjnKANYO9f194cfqHPZxHPQB
	 TeKRkANuFRgWu30YOxGwRHYq1XznwOFnyPQKegml7a2OtsXNFK2pUS7DQpb+6XSblc
	 cJDcYVy+g+CJjU4o4foTxm0F7q20FmoG+hAMnbJVsf20uNT2ULcyCXqx6oIKkVWxm/
	 +bOMeNPbK0b/Uhmh6e7YLniM7ZN6rO3feGFiFXGJkHYVrFxjP6PhvRW44M3B0GOZZV
	 zpR1j7DpNemDDN8Dft1s6UPy41mGay6allNkE6mTTUYkuZzAGp7FksoeL10omi7RDj
	 abdo9KV7wzqNg==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5428F17E0860;
	Thu, 13 Feb 2025 15:59:42 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chris Morgan <macromorgan@hotmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Tim Lunn <tim@feathertop.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Weizhao Ouyang <weizhao.ouyang@arm.com>,
	Elon Zhang <zhangzj@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>,
	Stephen Chen <stephen@radxa.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Radxa ROCK 4D board
Date: Thu, 13 Feb 2025 09:57:15 -0500
Message-ID: <20250213145921.133412-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213145921.133412-1-detlev.casanova@collabora.com>
References: <20250213145921.133412-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_065947_534485_35C15AEA 
X-CRM114-Status: UNSURE (   7.77  )
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

The board is based on the Rockchip rk3576 SoC.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 522a6f0450eae..9ddb20890627f 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -862,6 +862,11 @@ properties:
           - const: radxa,rock-4c-plus
           - const: rockchip,rk3399
 
+      - description: Radxa ROCK 4D
+        items:
+          - const: radxa,rock-4d
+          - const: rockchip,rk3576
+
       - description: Radxa ROCK 4SE
         items:
           - const: radxa,rock-4se
-- 
2.48.1


