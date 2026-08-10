Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF50C5B569
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOe5l9utNgT7rnp1te/CrBZS1W64mKYVhM5GuNKN2to=; b=iIUegCXunKNvuc+i/w2RCjlLls
	Ge7oP6HqQmbxTqD8jak9sJ71iOxT+Tl2lV0AJ/sNF49kuhpEpQYejGYELN9T+GZ1Z9UNe2a7mTjvB
	9AKS+0SXFNXLxjASpvBRvA6qG16COQvYpv6507JjBoIRdhmli1NAqGbdEXBDEiVM2PkGuGsovL+fn
	veT1x+2fEPXIsvH1LCySdB4Wxp5YUj8rHP3/m8atIlo5HGgc20X56XMWLr/V394A3KPcIJS4bPBNG
	aPR6sUQ523eNp3Q/HgkgU7uxR2QROHWnvrols3vzdbDkrNR6IyOa2+6qb+wVJ7E8nbLU61JVpcDxV
	tACQ777Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvt-0000000Bjuo-1Jro;
	Mon, 10 Aug 2026 12:16:45 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvd-0000000BjP6-0PQr;
	Mon, 10 Aug 2026 12:16:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4EC63C0518;
	Mon, 10 Aug 2026 15:16:24 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364186; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lOe5l9utNgT7rnp1te/CrBZS1W64mKYVhM5GuNKN2to=;
	b=nFuLd717My9K/2HTU5k1GvZJr8IbjhdkNZTwa0rR081ukM0y7pRzaCclLFR25Os905OgqI
	c6o6mwtDaf+6mi02TDhDEXbeFYnXSGx+UQQlLB7lR9Rx2FZy6tmqZcqrGVeHaYc9ma4KRJ
	Zk6zNpKdAQN7kjMzuTMwzdkyX10QQM/QVbCwaR6zSL3ceY2zhqx1Z1H/DE9me6wiFORduy
	4WNmbKQquo5xf1V4hPd+9pp+nJJ1yxNdcMfGgZVyWum5DzF2PFGgM/TpQCeXau2JvJcVLZ
	RJQkSfTF2ChmyDoT1FxMsXUAnjZT3FcmeGNeXqXAslDVOp67nJbo8Z+OOVOkMg==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh@kernel.org>,
	linux-crypto@vger.kernel.org
Subject: [PATCH 20/25] dt-bindings: rng: rockchip: Add RV1106 compatible
Date: Mon, 10 Aug 2026 15:11:11 +0300
Message-ID: <20260810121121.210040-21-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_051629_350850_9BB4A3BB 
X-CRM114-Status: UNSURE (   9.65  )
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

Add rockchip,rv1106-rng as a variant of rockchip,rk3588-rng, following
the pattern used for fallback compatibles in the schema (an items list
with an enum and a matching const fallback), so RV1106 can reuse the
existing rk3588-rng driver bindings.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 .../devicetree/bindings/rng/rockchip,rk3588-rng.yaml  | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
index fcc5be80142d..60ceac2697c0 100644
--- a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
@@ -13,10 +13,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - rockchip,rk3576-rng
-      - rockchip,rk3588-rng
-
+    oneOf:
+      - const: rockchip,rk3576-rng
+      - const: rockchip,rk3588-rng
+      - items:
+          - enum:
+              - rockchip,rv1106-rng
+          - const: rockchip,rk3588-rng
   reg:
     maxItems: 1
 
-- 
2.47.3


