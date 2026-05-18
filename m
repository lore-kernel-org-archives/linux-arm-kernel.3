Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28314CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 15:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWbGMSbQnGh71y+2iU1+aSUDgi6iuewmiRE7YO0PqzE=; b=PwvHAdua7IbjXRal8a9G1TjGNk
	giE1LYeP7Q4B646NijLzpK2fQDJUBidptjlOIWiUkQY6SDCzTrZf6VTYeKwzxhH393+pdHTfEA0z+
	JoNvJe09Nv/zAJH1m2RR7XhGdnYVwlkaQWSAfwpD3G6cFW9FUY9R3yRdsUFGaccGUkZRJ17eZOsao
	jtw0rNQVLYsyuThihOVvNbE16bL9X6VOzFYXkBS7sXNgm/sUyT5YSAFsZsgIjAdepqDERVI2evouS
	rNXIzm7Mv470/lGCZ2WJ5RIrbQFyTOOv/INTxj4Y3VMv6//CYlKJBEvGtbBvPxuWqtz3jhOBqvdTB
	pHX+gvWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzzk-0000000GB5Q-1YzC;
	Mon, 18 May 2026 15:35:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzzj-0000000GB52-2QkL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 15:35:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SWbGMSbQnGh71y+2iU1+aSUDgi6iuewmiRE7YO0PqzE=; b=V6ti58TM8gw394HCiFo8Jx2qgM
	73Rv1zIlwY+Oe9dB9hqyH1QufJkHTvaaXX/fSOh2+nwZbEpi06HOsriIvmBWkzUg/cTz5lQPWx/S6
	rJVxi4vnCNZ6/2pcwfyNxRPk1n1ldmlejvWwBu7Z6I5BXRtZh+fPc3fVlQdyVj5KX9o90TPfeeTcE
	6DyGnye0MqMboImatyiq+AWzDCOxrgEf4+wJYN4byO4N6ZazmXoRZY6lu6IaInk96XQ7E1OeNTps0
	4zpimkphyDFh68zSyJNNNqMkf9UsM+DFBoAJLMm2SkQgkCYk9NDqVcD2CpMcNDn+QD3qQgTkdnUby
	/j6tRtNQ==;
Received: from leonov.paulk.fr ([185.233.101.22])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzzf-0000000Bfri-3qg2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 15:35:02 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 90FF21F8004F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 15:34:58 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 0C7B7B4080F; Mon, 18 May 2026 15:34:57 +0000 (UTC)
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id B706CB407FD;
	Mon, 18 May 2026 15:33:41 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v9 2/9] dt-bindings: media: sun6i-a31-isp: Add optional interconnect properties
Date: Mon, 18 May 2026 17:33:31 +0200
Message-ID: <20260518153339.619947-3-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518153339.619947-1-paulk@sys-base.io>
References: <20260518153339.619947-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_163500_333093_69191182 
X-CRM114-Status: GOOD (  10.60  )
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

An interconnect can be attached to the sun6i-a31-csi device, which is
useful to attach the dma memory offset. Add related properties.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
index 3ea4a4290f23..c0d7accc7bbe 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
@@ -36,6 +36,12 @@ properties:
   resets:
     maxItems: 1
 
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    const: dma-mem
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.54.0


