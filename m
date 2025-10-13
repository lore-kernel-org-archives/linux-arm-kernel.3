Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199BECCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXSVl18LYAxv8kuJFIbcL5dzUgOV2k3k+9+IZ9rZiVU=; b=vrwEQ+ibuJVAhnI4gXTZL5dvU8
	HXLGPxHJxmT/jlXO3knT46N173SGX2ZjNAvkMAc56bRRU83YG4lHTxL9zCJKfA6HrVk86jZGJJPSq
	s+HURNf09Px1ea7mxJGJijSlF3/zBQQfnRcUJB3B/yShdA0KeT9cIFmGwN/LEbdmHDV0oR0WMBiO+
	YWIH/yUR5m1VeZzSfsSTMvrYFNsfKy5brJcd69lQuNgrcL38OQpPDfnzGlGuMC5QV86c7k8DCF6m+
	Sosop2XZxpgchXibWIrzfzOqw6jJkqk3fs86M/x186rO8wrQraM15bFvXoYkeEH9LSeQ36WidlwbO
	waGuAtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Jbk-0000000DPxq-3eM6;
	Mon, 13 Oct 2025 14:33:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Jbj-0000000DPvs-1jnB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 14:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zXSVl18LYAxv8kuJFIbcL5dzUgOV2k3k+9+IZ9rZiVU=; b=ZT1szCXyIHcnqLxX8Jje4uT3OI
	FuJBmy7qTymTkfmXHZnNNwQj0ZD39XP97dpY02jg3OmBjT2FioWS/WvXIC4GfPJATA4eNBvVsieSx
	B+V1mRaw5G3C4jmxG3Yu0G6Wn8qAi+08isc3cS/5ZAiYRt7ooVLY59NfwFS3KOd2WgqCaCvvzmkal
	Ft5+Z1yMR3xFyM67nzIv+re+j107DtPplHDwTxBTpEqUN2TywoE/4uOtcL+8NpznAqjiNpAMH1Glo
	vKidhwS35Tky9HwT7tjbHXWcVay/1kfIbTh/xtlPg8pF9Dy/5e6WyRPevTaW+OW0lhF7hxwEOAswn
	oCQQ3g9A==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Jbg-00000004Nly-0Pga
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 14:33:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B5EA41A12FF;
	Mon, 13 Oct 2025 14:32:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A039606C6;
	Mon, 13 Oct 2025 14:32:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 495BC102F2270;
	Mon, 13 Oct 2025 16:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760365969; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zXSVl18LYAxv8kuJFIbcL5dzUgOV2k3k+9+IZ9rZiVU=;
	b=nyqN0nd67N/9BRSVhqe18zLulVNgq+KdzcnkA39Jy3ycUZKUT8ruC40PnDm/Yzkf/3JplN
	p7gY19TpxU0nR5VkVAxZo/99tAzE42o4nzSPbn447TCisT96Tw0J3LQyxxAYDpuJrnSMpb
	slL6waL3c760wtZVMCOGgVn9wBc8T8GmfHrbFqxZnXnDrwISQerXF+wNSPC3qcpXy/fZzp
	UQgQHCjEoh7adO+pd2qFOW1Yq5BSBLvRYRchROqAwsCh72CPPJAeNir1sEfMvxNtzcQn5Y
	1GtvUgYSajUVCDX33ME0wqnmoadFrQ7TLtr/ygQMV3WN4K7jh1wgXdLWxU/yxg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH net-next v14 06/16] dt-bindings: net: dp83822: Deprecate ti,fiber-mode
Date: Mon, 13 Oct 2025 16:31:32 +0200
Message-ID: <20251013143146.364919-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_153300_399895_95B4394E 
X-CRM114-Status: UNSURE (   8.24  )
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

The newly added ethernet-connector binding allows describing an Ethernet
connector with greater precision, and in a more generic manner, than
ti,fiber-mode. Deprecate this property.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 Documentation/devicetree/bindings/net/ti,dp83822.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83822.yaml b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
index 28a0bddb9af9..dc6c50413a67 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83822.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
@@ -47,6 +47,9 @@ properties:
        is disabled.
        In fiber mode, auto-negotiation is disabled and the PHY can only work in
        100base-fx (full and half duplex) modes.
+       This property is deprecated, for details please refer to
+       Documentation/devicetree/bindings/net/ethernet-connector.yaml
+    deprecated: true
 
   rx-internal-delay-ps:
     description: |
@@ -141,7 +144,12 @@ examples:
         tx-internal-delay-ps = <1>;
         ti,gpio2-clk-out = "xi";
         mac-termination-ohms = <43>;
+        mdi {
+          connector-0 {
+            lanes = <1>;
+            media = "BaseF";
+          };
+        };
       };
     };
-
 ...
-- 
2.49.0


