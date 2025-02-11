Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EEFC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 03:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIyrTTeXw+C4BCHVXGUIGZGr+s1+Cv96AxvzOxDoOWg=; b=U+u/l7e+PzFX3+CVJ3z8iwvagj
	9faO1QKqtXhK4gr8du/dy3X03I7UhaXRiDAovUPOxaftFbhzTdfYT0E+4YNjlS+d0L0ilOnLNkzPk
	hQK/KbTnqoPPAVfyPdb5Ti6fvjtoILBsC8OvA7ppKxCif+tniRS8c/KyN19Sv8sUL0ULV0UqkefAe
	OBDR+buaNIWqjhEWIez2bNnwzlVOvTZ++crgjg4iQDBjibFp0uZa33lFcqRkR8BxM5J4f1a4r44ib
	QOFABhiMaa1pXUUBWXDMp2bidKctbXsrgPlZwlt4HRUrhExCsBpEmA0AMRiyJ7w8jcS5UW/hs/vcF
	I4C3qw7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thhNI-00000002RTe-1H2r;
	Tue, 11 Feb 2025 03:55:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thgP0-00000002KVW-3zmL;
	Tue, 11 Feb 2025 02:53:36 +0000
X-UUID: 5ec4e392e82311ef9048ed6ed365623b-20250210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uIyrTTeXw+C4BCHVXGUIGZGr+s1+Cv96AxvzOxDoOWg=;
	b=scj4I0q8ajkCM7GKjoRHQ9Rs8dsZ9LaLxwOtorLzzev38j5rb7Cy1/yaclSd+mUWpW8KIrfP8avf8EGy6zKtIWMPfdE1KPTmdLNI8gSVx7ykNocHywePp+QwaGS+JMoCK0fqosiRuy0jlGjP5wcnSJu0glYjBCesVXZLCGLhkzg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:2dbbd65a-542d-48ca-9b05-f5c18d858078,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:60aa074,CLOUDID:44ca627f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5ec4e392e82311ef9048ed6ed365623b-20250210
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <sunny.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1836505567; Mon, 10 Feb 2025 19:53:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 10:53:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 10:53:25 +0800
From: Sunny Shen <sunny.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Fei Shao <fshao@chromium.org>, Pin-yen Lin
	<treapking@chromium.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Paul
 Chen --cc=devicetree @ vger . kernel . org" <paul-pl.chen@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Sunny Shen
	<sunny.shen@mediatek.com>
Subject: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules for MT8196
Date: Tue, 11 Feb 2025 10:52:50 +0800
Message-ID: <20250211025317.399534-2-sunny.shen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211025317.399534-1-sunny.shen@mediatek.com>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_185334_997372_6FC85965 
X-CRM114-Status: GOOD (  12.33  )
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

Add MDP-RSZ hardware description for MediaTek MT8196 SoC

Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
---
 .../display/mediatek/mediatek,mdp-rsz.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz.yaml
new file mode 100644
index 000000000000..6642b9aa651a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rsz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek display multimedia data path resizer
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  MediaTek display multimedia data path resizer, namely MDP-RSZ,
+  can do scaling up/down to the picture.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-disp-mdp-rsz
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MDP-RSZ Clock
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        disp_mdp_rsz0: disp-mdp-rsz0@321a0000 {
+            compatible = "mediatek,mt8196-disp-mdp-rsz";
+            reg = <0 0x321a0000 0 0x1000>;
+            clocks = <&dispsys_config_clk 101>;
+        };
+    };
-- 
2.34.1


