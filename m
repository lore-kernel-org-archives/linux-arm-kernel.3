Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F53BE68958
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FL4j/CYIrubAPxbVw7pG9+khVDUDAsvQ9VUk/zRyv4=; b=MP1xYY9zZ49Q6cfYt1zigQKzof
	fuoyfyf3PWYSy8Yu5UEgy98gc07ob+Z9AloJwIckSF0u8Hv3IHyE6/xEtKoW3VKKKI0WwlSsm02cN
	U8G72/dy8RCq79q+hp/R1z1R/EIt5XS44AKF2wVBX0vuIrgrtml/Lb1saqS00lFbtsA8v52y2z3+/
	9xGgQ9BPWFeZaNQSdX/AusmTOXo4Dmm9xuiT+Befn1S1Ci91jI3mj+UJ5VIOfs+Y1QLHjNFl57c3E
	yMyFZd/bU2zBOIG4By2eszI6L4kQq6ryC7S77/TtsOoXN8uNOhSCv+vSSZoeFTvmzOf2vW5aouAqO
	HCyY6CPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PX0-00000002ndV-0e5H;
	Thu, 31 Oct 2024 07:23:46 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PDP-00000002kWG-0j6U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730358206;
	bh=wUIk/mmpLDWeouMgYhaf2tgEePqBaUSdmwuO0VnKGzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jskWGbQg985yW0BZQQi3CQ6hHJO7+HaROsZ9qZhwlh0HMYwlM2bxzF4bNP3vOOeAj
	 nPp/7UkifmYOJwkcAWsDz8hbJ/yFPkodWVwzlipNZymcQFY+V8p5J8HQN1ZPvpd9Kt
	 fzgk1sBLInXwNycHN2ctK5f11Z6Uq0qrWGaEM5DB9khCN6b9pW1PMaUEt0Vpmfd2cb
	 VKFbEu/ezqvXUNON81kfrJ30xwXHzGq/crovPoVgLSUQ/+xkzC46tvCmjeLY9SFsww
	 TdO8cRGL4ZJGYxB19YcSHlpj4xj7iaTpwJo/8CM4n/DWCzuDzceuHmoqMm1mhs1wTN
	 LyEwBimJgmc9Q==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] dt-bindings: opp: h6: Add A100 operating points
Date: Thu, 31 Oct 2024 04:02:24 -0300
Message-ID: <20241031070232.1793078-12-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_000331_390140_363BCA7C 
X-CRM114-Status: UNSURE (   9.79  )
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

The A100, similar to the H6 and H616, use an NVMEM value to determine
speed binnings. The method used is similar to that of the H6. However,
the information is stored at a slightly different bit offset.

Add a new compatible for the A100.

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
Changes in V2:
 - Fix ordering of compatibles

 .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
index ec5e424bb3c8..75ab552f6ecd 100644
--- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
+++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
@@ -22,6 +22,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - allwinner,sun50i-a100-operating-points
       - allwinner,sun50i-h6-operating-points
       - allwinner,sun50i-h616-operating-points
 
-- 
2.47.0


