Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4451D185D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57g72nEKhFS9cVDS/J74QWdU/o+2zGhdVxwS4ayb/Nw=; b=aA8QZtKeDMhn9aMTrX+Clrcmwi
	MrUBmjkLAC9cWMtuhBWXVIUL27/E0gGp6kS1ClnA4k6VuvnciUVZdpe1XVLpHErAI+tHd2iwkZBTW
	jlSCJLrtapt13txBY54UsX5eP+4ZzljPKCSOeXdDkw9nNP+cJpiCHT3M3gDwOhg+7dhzuPerjZbwM
	8yPzQSrgFsHJlpxtXkBQoMFNG/txY28XpsjmlWr6nDjg4knJRsAziy/4t/txw9AtKGkPh3u9mbP5I
	A9GxRQ6ZaloZ+wVp2fBefGE1bhI25vjfmpWeqLnVB6HZjGguMKpxfLicfBX3nFnKDiSVTSxIKJ7lG
	Vgisty/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnmk-0000000GmNA-311P;
	Thu, 08 Jan 2026 11:02:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnmi-0000000GmLO-0n8d;
	Thu, 08 Jan 2026 11:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767870149;
	bh=FgDwPYPu4XP815gYCnlu4ei2ijDYZBkFZkwZ1M4VH5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LK6J9AAB5I5iOpJhNKmrWMzuhnPsw0Obn1cRP55CpWrjQidssTCKwrD+Q7SFzHQex
	 3hU90X/52QdOZIAH0eGE1sjm5C1zXveD6jlaWSfzFgiWz02vmMSuLhmqQfeBR0SVaS
	 +5qEI58uUZA79OsvXqGIFcxC4dEkuGF0u6L+CN5g97AUf/k5L+9an7NmUfUYQe4l2c
	 tSgVIoysVsGMVJF9aKFPmEPJdYdBm3B2cd63CJVUHwMYteZ7YvdHG0gLDmtyPV5H+f
	 N8JvnmX9M2LzrLNLto3iJrU42FSyi6KGTsLY5YTZefituntFor+qvJj8EW6Ld+uAC7
	 uoYL8f7o3xB+g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BDCC917E11FB;
	Thu,  8 Jan 2026 12:02:28 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/4] dt-bindings: crypto: inside-secure,safexcel: Mandate only ring IRQs
Date: Thu,  8 Jan 2026 12:02:20 +0100
Message-ID: <20260108110223.20008-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108110223.20008-1-angelogioacchino.delregno@collabora.com>
References: <20260108110223.20008-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_030232_397113_3DB399B5 
X-CRM114-Status: UNSURE (   9.33  )
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

Not all IP implementations of EIP97 and EIP197 have the EIP and
MEM interrupts hooked up to the SoC, and those are not required
for functionality as status for both can be polled (and anyway
there's even no real need to poll, but that's another story).

As an example of this, the MediaTek MT7968A and MT7986B SoCs do
not have those two interrupts hooked up to their irq controlller.

For this reason, make the EIP and MEM interrupt optional.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/crypto/inside-secure,safexcel.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
index 343e2d04c797..22025b23d580 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
@@ -26,9 +26,11 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 4
     maxItems: 6
 
   interrupt-names:
+    minItems: 4
     items:
       - const: ring0
       - const: ring1
-- 
2.52.0


