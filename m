Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC50C4452C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDlY3L+wbIeuKuWj1TRGxelV/jYuwKeoBpfxYCOkCmU=; b=CzGkNqiK55QTd3sKCtjo6hrjZa
	QiqpCplZEt/XgIh+qKd3u5X0DXKXHQhVgICHhAv818jcptIYX/6IOhZAP2plfMZZIsj6eD8yFrJjU
	IsmURFc+6OF/hBQrgcpBLRSDEVCr0eWdAz+rx/DK0kDMIGQcmIrxldyCYQjLQ56YsO6SH2CEa8wE8
	7yoOYgE0yjrxgslkFhEBwtLuGNP69Eriuem+7XryaZ3xHp/Xk6Lz2LFE0Q6IborF6ZxmZc9okTUNh
	nFjw+qsVXncd2tg7AO4OXZ34E71Q1lphhOMQUHRjR7joNq5uBX3+64U4Utf96SfUGgLLvuiH6GZWf
	2WbmBX1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkrx-00000006Pkf-0NAm;
	Mon, 20 Jul 2026 10:05:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkrr-00000006Ph6-36Ss;
	Mon, 20 Jul 2026 10:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784541896;
	bh=rp96vQvpmzcYQQQawuTsiCW9FJPQfixEXB6+OjlKWjQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cUXuEiIht+z70ITVtT3aMJOqVAXPEkt+xdNaJYwPQV+u2ysejRxe34pOPW12ibkJl
	 JBnGfuynBWdNBTSW0azMZkJ+GeRW3VArIdc04fy73BiZcxRXp61sAcditjKfkxispg
	 WrhtT1ruPxqFCeOyNm9PC98cEsBd7m4f3P5yNlZYpt+T2n1oYho0Is8x09iq1ZU/RJ
	 O9wsOb7vkmkOKfeNSnEuvK8Sp1byEfkFDK7QBUUpdS67KycyW/efyI/YlPTPqiB74g
	 VhEa57ALvp7KHwxL6dztDpo9nytY3nGb0p5FybyShxnOoJ/i0MNzyv2wpkU3xpSxfG
	 gvEjOpor5Eh/w==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AB8B17E0D87;
	Mon, 20 Jul 2026 12:04:55 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 20 Jul 2026 12:04:11 +0200
Subject: [PATCH v3 01/18] dt-bindings: clock: mediatek: Make '#clock-cells'
 required for MT8186
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-mt8189-clocks-system-base-v3-1-8e6d99ab3ad2@collabora.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784541894; l=1753;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=rp96vQvpmzcYQQQawuTsiCW9FJPQfixEXB6+OjlKWjQ=;
 b=yJg4F6Q1CnIIBmJawSiJfmtIHG86T4HrpDtuEhOqvNV0DbM3TeQd90ds4tCNnyTIW/zjiSR6t
 7yXpB3P6uJ6B/9SDTXG6NidujT3BGzXWjsxBw+e7Pdmzh1ef8dKy8/o
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_030459_936220_74CBD62C 
X-CRM114-Status: UNSURE (   9.92  )
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


