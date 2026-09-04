Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70899C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDlY3L+wbIeuKuWj1TRGxelV/jYuwKeoBpfxYCOkCmU=; b=OGxAMtE3YC8Dqeql/aizioVYb2
	b6Gz+abegEY8xHH4DWRyxS9GhDZhT25vJ7B66L8jlixPuzMEa/wzC6x3dxVcNgUUPUhNHhrSyt795
	W/MCH1Kjaz9AKV8Hj2C6TwUI+2BMFSv3bKbWE8DxH0oI/ULsx5qvyOVqIGvMKPcItzy8qTzG7Et3X
	gHsOcrKtIHwGCPrK+uBQLFiu8EbT5ADaN2q2yohGa5tgE7Re5Sfbf31UDTWwRN9wrCG6kD2Geiua7
	Bj2xARjRsoHBOrVOmTzzRv5O/Q7qrNOYGtzb/uJHN4+Nch6e0uh7cj5CzeI9rSZT0zIhNHgSITWo2
	2VvTnm8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WJY-00000002bMg-1uFl;
	Fri, 04 Sep 2026 15:58:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WJV-00000002bLI-2nQa;
	Fri, 04 Sep 2026 15:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537525;
	bh=rp96vQvpmzcYQQQawuTsiCW9FJPQfixEXB6+OjlKWjQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hNseR17Mr2FEeb7vpRS4ghWeyaEZjje7ZpG+YOxpbJTmU1zP4NKbrmqlmPx2ZCRTA
	 3vngaPHvBQTXjJFi1e59utE3AHU7iWD+J42nEKpLxqkq1Smh8zpKTdIDhQNDHwNov5
	 zBAnJj2zyT/jlGB26ZrEZx3AQcder/2vIa+oWS/r8n/OBwTolMgVdqYxuAxZJA6yIH
	 74Y6grh7tQOyZQ4CjUCLk15kpPZgxB3GmjoGEu+hfl08bRdQcVlsXWR/7tbP7X6OAE
	 klkkS3i04YpYjWXKVtXgdj3tobPxxWo92c+Gq+S1sNgQlWT4cdLgyRBEPLSLMoUcwf
	 Xez8zkb/TNOLA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7102D17E092E;
	Fri, 04 Sep 2026 17:58:44 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:12 +0200
Subject: [PATCH v6 01/27] dt-bindings: clock: mediatek: Make '#clock-cells'
 required for MT8186
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-1-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=1753;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=rp96vQvpmzcYQQQawuTsiCW9FJPQfixEXB6+OjlKWjQ=;
 b=8SAycckJbljlA++tM8/Zl3D8xPkyBNXedGFYjp8uxZtL1/v5djl2j5jekJ2JZYRPWnY85izZx
 MipjenfHAVCAx0UrhOhBDIMqs1i/2JhwfQ9aPs2CgMeBIA5MDEZ3pwB
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_085849_865631_863E191F 
X-CRM114-Status: GOOD (  10.20  )
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

Both MT8186 clock controllers dt-bindings (clock and sys-clock)
document the '#clock-cells' property but do not enforce it as required
property.
As clock provider nodes should define this property in devicetrees, add
it to the required property list in both its dt-bindings files.

Fixes: f113a51aa2cf ("dt-bindings: ARM: MediaTek: Add new document bindings of MT8186 clock")
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml     | 1 +
 Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
index f4e58bfa504f..539149c945d0 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
@@ -44,6 +44,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
index 1c446fbc5108..f8acc02cafee 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
@@ -45,6 +45,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 

-- 
2.55.0


