Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F893D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2Qe7fc8Rc+0pOAStlB9e/yB/Xw4CrjrYCA0t8+DY84=; b=UnYTzV0kDNSmNGEDmw27Qyxuzl
	T4gEIeKni2ZOf7+Y0ZMZI2ybotBoF9MwIk83rsqjPZm7U/6o1Dkbd0k6on8RGNv9yCKQiq99DuRug
	jdDe8zR/h88730VTZFJYQqcuoZFiwzABwdA3ssCj01fefb9MBhFRB7e1PnFvzcDOdll/uMtrXOgvG
	edb5n5Q2xxwn/1AvM7A5HvLhCwodzpLhXJumF6F4V1pKG+E0agd5Rbh85Vu4L7L0o66W8JATacZ41
	NWMVIqBPNjuovWDX3eXtMV/0uc87Xfm7j7mw9Zu/aL+QPN1sOyh4DpK3sRjWV5qJvMGjxY6kwUaI1
	2ysPYT3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ex6-000000038uQ-06te;
	Wed, 06 Nov 2024 12:16:00 +0000
Received: from mail-43167.protonmail.ch ([185.70.43.167])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dzg-00000002tAn-1PjY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730891674; x=1731150874;
	bh=f2Qe7fc8Rc+0pOAStlB9e/yB/Xw4CrjrYCA0t8+DY84=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=JbZc5I4rgog7sLjwZk6liHoCvGeRGqObx6qN9im77n1mYeUgDqN36G1sME+1H4Vjg
	 p+iqKkr/99Z+KRfiffUMq7eqC5iZUQsc5gGduO1UBblhDkY44/bCFzezUgxw2DL4ov
	 i88TXy+IwuF6PBrAE3gBqg1S4rrsUoecW+itPfzU5h8zQTwAfaNsMruwFqWOMMZr0k
	 FkGhnEedjDgvF7NipJYGozMA1gbEe86OediChUMoGyNbruxXy0fGRt4TNNqfE4EqEj
	 3IOFyvSw7DTDWicTI76VdMJ6/123Z9dg60NyfwsGM57spg4tr1dK9R3osGSVuPRw/c
	 MXsQhfYwj0LxQ==
Date: Wed, 06 Nov 2024 11:14:30 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Shih <sam.shih@mediatek.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, Daniel Golle <daniel@makrotopia.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: mediatek: Add bindings for MT6735 syscon clock and reset controllers
Message-ID: <20241106111402.200940-2-y.oudjana@protonmail.com>
In-Reply-To: <20241106111402.200940-1-y.oudjana@protonmail.com>
References: <20241106111402.200940-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 3e1ea39ec08bb0cd65c2f895318f0493916e1ea4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_031437_012252_74DD2AA7 
X-CRM114-Status: GOOD (  11.85  )
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

Add device tree bindings for syscon clock and reset controllers (IMGSYS,
MFGCFG, VDECSYS and VENCSYS).

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/mediatek,syscon.yaml           |  4 ++++
 MAINTAINERS                                       |  6 ++++++
 .../dt-bindings/clock/mediatek,mt6735-imgsys.h    | 15 +++++++++++++++
 .../dt-bindings/clock/mediatek,mt6735-mfgcfg.h    |  8 ++++++++
 .../dt-bindings/clock/mediatek,mt6735-vdecsys.h   |  9 +++++++++
 .../dt-bindings/clock/mediatek,mt6735-vencsys.h   | 11 +++++++++++
 .../dt-bindings/reset/mediatek,mt6735-mfgcfg.h    |  9 +++++++++
 .../dt-bindings/reset/mediatek,mt6735-vdecsys.h   |  9 +++++++++
 8 files changed, 71 insertions(+)
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-imgsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-vencsys.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-vdecsys.h

diff --git a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml b=
/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
index 10483e26878fb..a86a64893c675 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
@@ -28,6 +28,10 @@ properties:
               - mediatek,mt2712-mfgcfg
               - mediatek,mt2712-vdecsys
               - mediatek,mt2712-vencsys
+              - mediatek,mt6735-imgsys
+              - mediatek,mt6735-mfgcfg
+              - mediatek,mt6735-vdecsys
+              - mediatek,mt6735-vencsys
               - mediatek,mt6765-camsys
               - mediatek,mt6765-imgsys
               - mediatek,mt6765-mipi0a
diff --git a/MAINTAINERS b/MAINTAINERS
index f595ee8c2d145..0ddb557f7fef9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14625,11 +14625,17 @@ F:=09drivers/clk/mediatek/clk-mt6735-infracfg.c
 F:=09drivers/clk/mediatek/clk-mt6735-pericfg.c
 F:=09drivers/clk/mediatek/clk-mt6735-topckgen.c
 F:=09include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
+F:=09include/dt-bindings/clock/mediatek,mt6735-imgsys.h
 F:=09include/dt-bindings/clock/mediatek,mt6735-infracfg.h
+F:=09include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
 F:=09include/dt-bindings/clock/mediatek,mt6735-pericfg.h
 F:=09include/dt-bindings/clock/mediatek,mt6735-topckgen.h
+F:=09include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
+F:=09include/dt-bindings/clock/mediatek,mt6735-vencsys.h
 F:=09include/dt-bindings/reset/mediatek,mt6735-infracfg.h
+F:=09include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
 F:=09include/dt-bindings/reset/mediatek,mt6735-pericfg.h
+F:=09include/dt-bindings/reset/mediatek,mt6735-vdecsys.h
=20
 MEDIATEK MT76 WIRELESS LAN DRIVER
 M:=09Felix Fietkau <nbd@nbd.name>
diff --git a/include/dt-bindings/clock/mediatek,mt6735-imgsys.h b/include/d=
t-bindings/clock/mediatek,mt6735-imgsys.h
new file mode 100644
index 0000000000000..f250c26c5eb4d
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-imgsys.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_IMGSYS_H
+#define _DT_BINDINGS_CLK_MT6735_IMGSYS_H
+
+#define CLK_IMG_SMI_LARB2=09=090
+#define CLK_IMG_CAM_SMI=09=09=091
+#define CLK_IMG_CAM_CAM=09=09=092
+#define CLK_IMG_SEN_TG=09=09=093
+#define CLK_IMG_SEN_CAM=09=09=094
+#define CLK_IMG_CAM_SV=09=09=095
+#define CLK_IMG_SUFOD=09=09=096
+#define CLK_IMG_FD=09=09=097
+
+#endif /* _DT_BINDINGS_CLK_MT6735_IMGSYS_H */
diff --git a/include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h b/include/d=
t-bindings/clock/mediatek,mt6735-mfgcfg.h
new file mode 100644
index 0000000000000..d2d99a48348a0
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_MFGCFG_H
+#define _DT_BINDINGS_CLK_MT6735_MFGCFG_H
+
+#define CLK_MFG_BG3D=09=09=090
+
+#endif /* _DT_BINDINGS_CLK_MT6735_MFGCFG_H */
diff --git a/include/dt-bindings/clock/mediatek,mt6735-vdecsys.h b/include/=
dt-bindings/clock/mediatek,mt6735-vdecsys.h
new file mode 100644
index 0000000000000..f94cec10c89ff
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_VDECSYS_H
+#define _DT_BINDINGS_CLK_MT6735_VDECSYS_H
+
+#define CLK_VDEC_VDEC=09=09=090
+#define CLK_VDEC_SMI_LARB1=09=091
+
+#endif /* _DT_BINDINGS_CLK_MT6735_VDECSYS_H */
diff --git a/include/dt-bindings/clock/mediatek,mt6735-vencsys.h b/include/=
dt-bindings/clock/mediatek,mt6735-vencsys.h
new file mode 100644
index 0000000000000..e5a9cb4f269ff
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-vencsys.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_VENCSYS_H
+#define _DT_BINDINGS_CLK_MT6735_VENCSYS_H
+
+#define CLK_VENC_SMI_LARB3=09=09=090
+#define CLK_VENC_VENC=09=09=091
+#define CLK_VENC_JPGENC=09=09=092
+#define CLK_VENC_JPGDEC=09=09=093
+
+#endif /* _DT_BINDINGS_CLK_MT6735_VENCSYS_H */
diff --git a/include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h b/include/d=
t-bindings/reset/mediatek,mt6735-mfgcfg.h
new file mode 100644
index 0000000000000..c489242b226e2
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_RESET_MT6735_MFGCFG_H
+#define _DT_BINDINGS_RESET_MT6735_MFGCFG_H
+
+#define MT6735_MFG_RST0_AXI=09=090
+#define MT6735_MFG_RST0_G3D=09=091
+
+#endif /* _DT_BINDINGS_RESET_MT6735_MFGCFG_H */
diff --git a/include/dt-bindings/reset/mediatek,mt6735-vdecsys.h b/include/=
dt-bindings/reset/mediatek,mt6735-vdecsys.h
new file mode 100644
index 0000000000000..b6ae5d249192b
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6735-vdecsys.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_RESET_MT6735_VDECSYS_H
+#define _DT_BINDINGS_RESET_MT6735_VDECSYS_H
+
+#define MT6735_VDEC_RST0_VDEC=09=09=090
+#define MT6735_VDEC_RST1_SMI_LARB1=09=091
+
+#endif /* _DT_BINDINGS_RESET_MT6735_VDECSYS_H */
--=20
2.47.0



