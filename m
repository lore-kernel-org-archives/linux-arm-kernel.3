Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB88EC88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFRLY70uQZ3XJlD8CeduqOmhhXpnOmwFSdP42ch1Xjk=; b=p+JFLg8M0I9APZbSdM/5L2l/ad
	HgyQpX4RhvlOdaObd1tGf/L7kDXMrEGrHVX73qXhMg5GO1mjP9dkPP1mJRnZIA6z/14GEPwx3mJtQ
	5VVvIfK43vR2QSTj/VATcoRzmQUT4ABhhldzj8J9T2VSD6SrGoupEeiJGylfJGMdmhoPYlgfTnwqd
	OlgyIG1ibDv5C34/EeaTU7X3Wmr36LKGezVBt5MbBVp+AycZUAdnQSCFZgMGiW3orUDleGYgtKxu/
	sz//+Ymb+Wdm5j2FKKWl/3GycnH52hD1A+FeW2015UC+X2IqqNh9TJp5oK88nwEXmaLIhI0wr25Cq
	Oe/SitCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65HN-00000003OpT-3Cnp;
	Mon, 14 Sep 2026 11:55:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65HC-00000003OiW-3Y9z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:55:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97B974362A;
	Mon, 14 Sep 2026 11:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAB41F000FF;
	Mon, 14 Sep 2026 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386910;
	bh=LFRLY70uQZ3XJlD8CeduqOmhhXpnOmwFSdP42ch1Xjk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IF+whjUKRrGw9vmF3GYzSxrSJZUow6XfgXe0/6Kdq+yXDk/hQAqTybjuN2e9w0l76
	 txMImshSIy4joz7LU2LSehuLSHyHgrYUN4e0aKrE942eC3Z9smo2an92xDqUEilSjF
	 1xwm8+jj3TJkM6sh0PdjX0uADe28nTLu60+rc2zaU2uDkJg7recvAz2+izLac9pjqN
	 5qAWvOrhNRGKoTdF56fN+JxK0TbOUPCS2mKv1RAhbPCXgpU3R0Ud1bN/KH+nx5giti
	 bdu3+one6AEnVCsRxnTejFV+8l2D0trGXgER/L50r9G6sjx2YY1tOkCdKzC2IY8clm
	 atiPIzowJ4XxQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 13:54:36 +0200
Subject: [PATCH v2 08/20] dt-bindings: cache: l2c2x0: Document power domain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-power-domains-v7-1-v2-8-9d0c17e1f816@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Describe the optional power domain for cache controllers.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/cache/l2c2x0.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/l2c2x0.yaml b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
index ee604117ffb3..4e568c2a34ef 100644
--- a/Documentation/devicetree/bindings/cache/l2c2x0.yaml
+++ b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
@@ -68,6 +68,8 @@ properties:
 
   power-domains:
     maxItems: 1
+    description:
+      Power domain controlling the cache controller.
 
   arm,data-latency:
     description: Cycles of latency for Data RAM accesses. Specifies 3 cells of

-- 
2.55.0


