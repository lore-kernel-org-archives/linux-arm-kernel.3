Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057ACD5B86F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SY8SmIA5wIrmUO7nUF+PTW6lkLiJZzNE7N5vXcjY0Rw=; b=zhP/BsvUxUNWpH5VMnkqnf1pw3
	oXK12LTyzWBkRLh+UC9uzGZyGGYjSJ8MFUNrvjoEfwBQGNk4XCEtQ8Qi1yhg3g4BePCAPdQ6S+/0/
	8vtCydg5Ux/gyzoreQj2Iadbsvdcj2x79Fqv8rFYAHapK0UNFpGcoYwS6+9ChXxLmsH0zTzdtM23e
	cZ1louZecOdlmiIo5p9i0OFfbH3PDZYVIUzOGS3D7LwvSajjvmUVoBfo8dB49n9f0XFu8N70LONG9
	tclC51PFzf1UgI7xPLYdlMl7zECfzeIlMwn3DpSgWolIgy4PGhZjFoC7jAR4OPx69IiNoVzEOMYOH
	rIudj+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG61-00000004HxI-3P0U;
	Mon, 15 Dec 2025 21:27:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG5z-00000004Hwr-0tPw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:27:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF732419A7;
	Mon, 15 Dec 2025 21:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BDDC4CEF5;
	Mon, 15 Dec 2025 21:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765834026;
	bh=ksO7t38lHNhsA2pzzobpl6s+Z69+v/dzbkND9pR8gN4=;
	h=From:To:Cc:Subject:Date:From;
	b=oFjaieZf5e2XHuOqzdwVYbvycw+ge2R0jF1QOMKdAkV+s2YNgyHAi5+XA0ZgQi3Fw
	 JtQlscIa2D12MTvsnGBxVanJZRi4jpCbVrIjKSRPztFFoI9oOOhfIUHTYFEaCvUVWN
	 C/x8st5nzeJwFlCJADf3yc1jR9yF3t9oBgUOQB+t5nLICg03Yd8K9YbxVIEfosKR0e
	 OigtU8Ie90RFCnshKgXHjxaZZ8weRhizWVSGGvs1XEJbF1CdSP0+Wywxf6jVhxZjkh
	 n6YeEGjt/MrHBMbt97NdkCbfMsBXB4l2LbqV/L+NFxtDGS+FRIM6v1XXkSURK/aM28
	 YAqm1NWbrIIoQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: bus: stm32mp25-rifsc: Allow 2 size cells
Date: Mon, 15 Dec 2025 15:26:59 -0600
Message-ID: <20251215212700.3320634-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_132707_267963_B1F1835E 
X-CRM114-Status: UNSURE (   9.06  )
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

There are users already with 2 size cells, and there's no reason to not
support that.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
index 4d19917ad2c3..c6280c8c54a3 100644
--- a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
@@ -54,7 +54,7 @@ properties:
     const: 1
 
   "#size-cells":
-    const: 1
+    enum: [ 1, 2 ]
 
   ranges: true
 
-- 
2.51.0


