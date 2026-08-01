Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8A8C55179
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 11:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6P+Ix1HMsH3IeVzY4gyAl8zWgQXvrhsMQGZ3RmXD5Y=; b=UzXt3VB9VIL/cGP8p64NOpba3z
	e0y4W2gitPs/tb4AJHKjUJjExJxyJ8n77daWHRuBcxan/v9Q2QrbUSgZwyzTuG3fikcqQ/ItPRFpO
	p3gNsqeCC/E7/TJZ0LaTBpaXgRKn+/6MA8/5Jbn43VZCLM7rccBq6pg+l/g0mGNngXpnTv83IIEj5
	i8Lw8/LAC7QZDJMkcxpD5pZqTCjxuuqEOkBABcLIyhE6pz+Mn1Q1pTjm3U0DPaFutGhFLMkokiWCW
	ixWPir9PvgVxJq6QW9WRvRD7zyptxZyZOye9RrM18qse5DfZOlhE6lClLQkLbkVY3pxY2CwHCkhBo
	BkC0B7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7mR-0000000EDCu-09yL;
	Sat, 01 Aug 2026 11:21:27 +0000
Received: from [148.251.105.195] (helo=bali.collaboradmins.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7mM-0000000ED4G-0sZG;
	Sat, 01 Aug 2026 11:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785583264;
	bh=fUUtXLDjBk6CCgOqNBHxohDsqafdXykxd3de6nmxpT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O8I/bbzVfTDCEqIlRrICbx6bVCsVl3I6lVCKilwWA19nhT8QdcXOwKEVmNMl8og4M
	 kF8a6Pprs9OUeWLtt5pHjymph/cH/C3EAGPclgOz0eDE2lCvVUjdi28KlKvwUd13YM
	 8SFeAZ4bh9VBCy00NSsJhwhyV0haauExFbyonAsCEVD4UHopa77F0q7+SHxMCnxtLt
	 UwOGE1GvSkpNuJ1FYHwpQKnlFtzzPiz77iK+GtziVPTNt+4CBBUL4gK3pb5xY3outn
	 ebhSqqyF0+gl2SnS092kqUP8Fyjew1FUlkX+axpmPHP3M5HQyV6hJfw7Lvqua/4YmX
	 ncjvrLE25q29w==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD0C617E0700;
	Sat, 01 Aug 2026 13:21:03 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Sat, 01 Aug 2026 13:20:48 +0200
Subject: [PATCH v5 02/25] dt-bindings: clock: mediatek: Make '#clock-cells'
 required for MT8192
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-mt8189-clocks-system-base-v5-2-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785583260; l=1753;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=fUUtXLDjBk6CCgOqNBHxohDsqafdXykxd3de6nmxpT8=;
 b=+WyJ8p8Fq69fbltxSxVvTayhKruhX4mVD/cnHZSRwnlL7+6GiQI52/MYgxrsIU8F76/sT2p4e
 Q7wQ1LqXmSXAQhMcfe5zc6yIaARPBTiw9qW4I+xm+ptIrlAZY+wHcYx
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_042122_461065_2C8E7655 
X-CRM114-Status: UNSURE (   9.90  )
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

Both MT8192 clock controllers dt-bindings (clock and sys-clock)
document the '#clock-cells' property but do not enforce it as required
property.
As clock provider nodes should define this property in devicetrees, add
it to the required property list in both its dt-bindings files.

Fixes: 4a803990aeb1 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8192 clock")
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/clock/mediatek,mt8192-clock.yaml     | 1 +
 Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8192-clock.yaml
index b8d690e28bdc..65e4c2fddf5b 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8192-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8192-clock.yaml
@@ -46,6 +46,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
index bf8c9aacdf1e..0ebd0d60e2f6 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
@@ -35,6 +35,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 

-- 
2.55.0


