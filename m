Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C7CD44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qM3SFd960LUQ6qJ9SIEr3BThy8+THmQ1ZjQTavl+/+Y=; b=VlO16ZikJsK62fC2Nj5v5IrcL+
	Iir+rJRg5XCzeMiNwa/+8Eq5A2HUROvJ3ZsPrUoI7i5v5oDIin7tN7Q7aYoj+lNUGshJw089bShan
	tPiAbAh/TFZ99Pq+mPGHQhAbWuo+cVaQURdlzWikMf3v4wF20xY550Jj4WG/pp8qQLZ8NZR8FxGyW
	PS8NbqEAtsJnGhl4Oj8vyxGhLTXliZ7wfYVrPjO52ayeEgb94JTcWrYMa5OK7ZF8BTlSce44EjU+S
	GVYAchrPfE1iix0P1fWH/+30QjBNRf0hh6x8kLWulCU0C3KpeiXZ5YLwnCJjq4hGc8wr6BdeM1PaA
	UL2sffuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eym-000000039J4-1KXW;
	Wed, 06 Nov 2024 12:17:44 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dzo-00000002tD5-1Rii;
	Wed, 06 Nov 2024 11:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730891681; x=1731150881;
	bh=qM3SFd960LUQ6qJ9SIEr3BThy8+THmQ1ZjQTavl+/+Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=VOPJh4ZUDC3lfmyz9SRbVX2kET4FLzs8fcJMvGuVJE5cGirkQdufazFm/bCphbKwX
	 UgFIETVo8sMfahj3dirEb+KhXsuz5oVH3i/zfIrtIo8HlsW1m+etN/fkQdzZd2VDm4
	 5T+VSkOlUX88JJFEYsQrDS3w0SsLIs93UmAzmYvgHUCBeiqScDq912fZea2WOXfyeA
	 nHtvPiapaCujzRqZsnNNDqPvVHx9K//15T+P/Qwe+n3IGuGliXtlTVtyRMZLRFNJTJ
	 iUhqDCGvdDodgmUx5qXcxgfqeoT9p2h6SySZnDGkrocLkLOK3T1INaYBapIaaG5+Jg
	 c2X39oVYCAjTg==
Date: Wed, 06 Nov 2024 11:14:37 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Shih <sam.shih@mediatek.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, Daniel Golle <daniel@makrotopia.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] clk: mediatek: Add drivers for MT6735 syscon clock and reset controllers
Message-ID: <20241106111402.200940-3-y.oudjana@protonmail.com>
In-Reply-To: <20241106111402.200940-1-y.oudjana@protonmail.com>
References: <20241106111402.200940-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 1eb11f123cf4723be67fb6c20ef154d39bc46bd0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_031444_713428_960903DA 
X-CRM114-Status: GOOD (  15.03  )
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

Add drivers for IMGSYS, MFGCFG, VDECSYS and VENCSYS clocks and resets
on MT6735.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 MAINTAINERS                               |  4 ++
 drivers/clk/mediatek/Kconfig              | 28 ++++++++
 drivers/clk/mediatek/Makefile             |  4 ++
 drivers/clk/mediatek/clk-mt6735-imgsys.c  | 57 ++++++++++++++++
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c  | 61 +++++++++++++++++
 drivers/clk/mediatek/clk-mt6735-vdecsys.c | 79 +++++++++++++++++++++++
 drivers/clk/mediatek/clk-mt6735-vencsys.c | 53 +++++++++++++++
 7 files changed, 286 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt6735-imgsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-mfgcfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-vdecsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-vencsys.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ddb557f7fef9..16480ccd197a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14621,9 +14621,13 @@ L:=09linux-clk@vger.kernel.org
 L:=09linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:=09Maintained
 F:=09drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+F:=09drivers/clk/mediatek/clk-mt6735-imgsys.c
 F:=09drivers/clk/mediatek/clk-mt6735-infracfg.c
+F:=09drivers/clk/mediatek/clk-mt6735-mfgcfg.c
 F:=09drivers/clk/mediatek/clk-mt6735-pericfg.c
 F:=09drivers/clk/mediatek/clk-mt6735-topckgen.c
+F:=09drivers/clk/mediatek/clk-mt6735-vdecsys.c
+F:=09drivers/clk/mediatek/clk-mt6735-vencsys.c
 F:=09include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
 F:=09include/dt-bindings/clock/mediatek,mt6735-imgsys.h
 F:=09include/dt-bindings/clock/mediatek,mt6735-infracfg.h
diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 7a33f9e92d963..5f8e6d68fa148 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -133,6 +133,34 @@ config COMMON_CLK_MT6735
 =09  by apmixedsys, topckgen, infracfg and pericfg on the
 =09  MediaTek MT6735 SoC.
=20
+config COMMON_CLK_MT6735_IMGSYS
+=09tristate "Clock driver for MediaTek MT6735 imgsys"
+=09depends on COMMON_CLK_MT6735
+=09help
+=09  This enables a driver for clocks provided by imgsys
+=09  on the MediaTek MT6735 SoC.
+
+config COMMON_CLK_MT6735_MFGCFG
+=09tristate "Clock driver for MediaTek MT6735 mfgcfg"
+=09depends on COMMON_CLK_MT6735
+=09help
+=09  This enables a driver for clocks and resets provided
+=09  by mfgcfg on the MediaTek MT6735 SoC.
+
+config COMMON_CLK_MT6735_VDECSYS
+=09tristate "Clock driver for MediaTek MT6735 vdecsys"
+=09depends on COMMON_CLK_MT6735
+=09help
+=09  This enables a driver for clocks and resets provided
+=09  by vdecsys on the MediaTek MT6735 SoC.
+
+config COMMON_CLK_MT6735_VENCSYS
+=09tristate "Clock driver for MediaTek MT6735 vencsys"
+=09depends on COMMON_CLK_MT6735
+=09help
+=09  This enables a driver for clocks provided by vencsys
+=09  on the MediaTek MT6735 SoC.
+
 config COMMON_CLK_MT6765
        bool "Clock driver for MediaTek MT6765"
        depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 70456ffc6c492..6efec95406bd5 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -3,6 +3,10 @@ obj-$(CONFIG_COMMON_CLK_MEDIATEK) +=3D clk-mtk.o clk-pll.o=
 clk-gate.o clk-apmixed.
 obj-$(CONFIG_COMMON_CLK_MEDIATEK_FHCTL) +=3D clk-fhctl.o clk-pllfh.o
=20
 obj-$(CONFIG_COMMON_CLK_MT6735) +=3D clk-mt6735-apmixedsys.o clk-mt6735-in=
fracfg.o clk-mt6735-pericfg.o clk-mt6735-topckgen.o
+obj-$(CONFIG_COMMON_CLK_MT6735_IMGSYS) +=3D clk-mt6735-imgsys.o
+obj-$(CONFIG_COMMON_CLK_MT6735_MFGCFG) +=3D clk-mt6735-mfgcfg.o
+obj-$(CONFIG_COMMON_CLK_MT6735_VDECSYS) +=3D clk-mt6735-vdecsys.o
+obj-$(CONFIG_COMMON_CLK_MT6735_VENCSYS) +=3D clk-mt6735-vencsys.o
 obj-$(CONFIG_COMMON_CLK_MT6765) +=3D clk-mt6765.o
 obj-$(CONFIG_COMMON_CLK_MT6765_AUDIOSYS) +=3D clk-mt6765-audio.o
 obj-$(CONFIG_COMMON_CLK_MT6765_CAMSYS) +=3D clk-mt6765-cam.o
diff --git a/drivers/clk/mediatek/clk-mt6735-imgsys.c b/drivers/clk/mediate=
k/clk-mt6735-imgsys.c
new file mode 100644
index 0000000000000..c564f8f724324
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6735-imgsys.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mediatek,mt6735-imgsys.h>
+
+#define IMG_CG_CON=09=09=090x00
+#define IMG_CG_SET=09=09=090x04
+#define IMG_CG_CLR=09=09=090x08
+
+static struct mtk_gate_regs imgsys_cg_regs =3D {
+=09.set_ofs =3D IMG_CG_SET,
+=09.clr_ofs =3D IMG_CG_CLR,
+=09.sta_ofs =3D IMG_CG_CON,
+};
+
+static const struct mtk_gate imgsys_gates[] =3D {
+=09GATE_MTK(CLK_IMG_SMI_LARB2, "smi_larb2", "mm_sel", &imgsys_cg_regs, 0, =
&mtk_clk_gate_ops_setclr),
+=09GATE_MTK(CLK_IMG_CAM_SMI, "cam_smi", "mm_sel", &imgsys_cg_regs, 5, &mtk=
_clk_gate_ops_setclr),
+=09GATE_MTK(CLK_IMG_CAM_CAM, "cam_cam", "mm_sel", &imgsys_cg_regs, 6, &mtk=
_clk_gate_ops_setclr),
+=09GATE_MTK(CLK_IMG_SEN_TG, "sen_tg", "mm_sel", &imgsys_cg_regs, 7, &mtk_c=
lk_gate_ops_setclr),
+=09GATE_MTK(CLK_IMG_SEN_CAM, "sen_cam", "mm_sel", &imgsys_cg_regs, 8, &mtk=
_clk_gate_ops_setclr),
+=09GATE_MTK(CLK_IMG_CAM_SV, "cam_sv", "mm_sel", &imgsys_cg_regs, 9, &mtk_c=
lk_gate_ops_setclr),
+=09GATE_MTK(CLK_IMG_SUFOD, "sufod", "mm_sel", &imgsys_cg_regs, 10, &mtk_cl=
k_gate_ops_setclr),
+=09GATE_MTK(CLK_IMG_FD, "fd", "mm_sel", &imgsys_cg_regs, 11, &mtk_clk_gate=
_ops_setclr),
+};
+
+static const struct mtk_clk_desc imgsys_clks =3D {
+=09.clks =3D imgsys_gates,
+=09.num_clks =3D ARRAY_SIZE(imgsys_gates),
+};
+
+static const struct of_device_id of_match_mt6735_imgsys[] =3D {
+=09{ .compatible =3D "mediatek,mt6735-imgsys", .data =3D &imgsys_clks },
+=09{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt6735_imgsys =3D {
+=09.probe =3D mtk_clk_simple_probe,
+=09.remove =3D mtk_clk_simple_remove,
+=09.driver =3D {
+=09=09.name =3D "clk-mt6735-imgsys",
+=09=09.of_match_table =3D of_match_mt6735_imgsys,
+=09},
+};
+module_platform_driver(clk_mt6735_imgsys);
+
+MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
+MODULE_DESCRIPTION("MediaTek MT6735 imgsys clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c b/drivers/clk/mediate=
k/clk-mt6735-mfgcfg.c
new file mode 100644
index 0000000000000..1f5aedddf209d
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mediatek,mt6735-mfgcfg.h>
+
+#define MFG_CG_CON=09=09=090x00
+#define MFG_CG_SET=09=09=090x04
+#define MFG_CG_CLR=09=09=090x08
+#define MFG_RESET=09=09=090x0c
+
+static struct mtk_gate_regs mfgcfg_cg_regs =3D {
+=09.set_ofs =3D MFG_CG_SET,
+=09.clr_ofs =3D MFG_CG_CLR,
+=09.sta_ofs =3D MFG_CG_CON,
+};
+
+static const struct mtk_gate mfgcfg_gates[] =3D {
+=09GATE_MTK(CLK_MFG_BG3D, "bg3d", "mfg_sel", &mfgcfg_cg_regs, 0, &mtk_clk_=
gate_ops_setclr),
+};
+
+static u16 mfgcfg_rst_ofs[] =3D { MFG_RESET };
+
+static const struct mtk_clk_rst_desc mfgcfg_resets =3D {
+=09.version =3D MTK_RST_SIMPLE,
+=09.rst_bank_ofs =3D mfgcfg_rst_ofs,
+=09.rst_bank_nr =3D ARRAY_SIZE(mfgcfg_rst_ofs)
+};
+
+static const struct mtk_clk_desc mfgcfg_clks =3D {
+=09.clks =3D mfgcfg_gates,
+=09.num_clks =3D ARRAY_SIZE(mfgcfg_gates),
+
+=09.rst_desc =3D &mfgcfg_resets
+};
+
+static const struct of_device_id of_match_mt6735_mfgcfg[] =3D {
+=09{ .compatible =3D "mediatek,mt6735-mfgcfg", .data =3D &mfgcfg_clks },
+=09{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt6735_mfgcfg =3D {
+=09.probe =3D mtk_clk_simple_probe,
+=09.remove =3D mtk_clk_simple_remove,
+=09.driver =3D {
+=09=09.name =3D "clk-mt6735-mfgcfg",
+=09=09.of_match_table =3D of_match_mt6735_mfgcfg,
+=09},
+};
+module_platform_driver(clk_mt6735_mfgcfg);
+
+MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
+MODULE_DESCRIPTION("Mediatek MT6735 mfgcfg clock and reset driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6735-vdecsys.c b/drivers/clk/mediat=
ek/clk-mt6735-vdecsys.c
new file mode 100644
index 0000000000000..8817085fc1db4
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6735-vdecsys.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mediatek,mt6735-vdecsys.h>
+#include <dt-bindings/reset/mediatek,mt6735-vdecsys.h>
+
+#define VDEC_CKEN_SET=09=09=090x00
+#define VDEC_CKEN_CLR=09=09=090x04
+#define SMI_LARB1_CKEN_SET=09=090x08
+#define SMI_LARB1_CKEN_CLR=09=090x0c
+#define VDEC_RESETB_CON=09=09=090x10
+#define SMI_LARB1_RESETB_CON=09=090x14
+
+#define RST_NR_PER_BANK=09=09=0932
+
+static struct mtk_gate_regs vdec_cg_regs =3D {
+=09.set_ofs =3D VDEC_CKEN_SET,
+=09.clr_ofs =3D VDEC_CKEN_CLR,
+=09.sta_ofs =3D VDEC_CKEN_SET,
+};
+
+static struct mtk_gate_regs smi_larb1_cg_regs =3D {
+=09.set_ofs =3D SMI_LARB1_CKEN_SET,
+=09.clr_ofs =3D SMI_LARB1_CKEN_CLR,
+=09.sta_ofs =3D SMI_LARB1_CKEN_SET,
+};
+
+static const struct mtk_gate vdecsys_gates[] =3D {
+=09GATE_MTK(CLK_VDEC_VDEC, "vdec", "vdec_sel", &vdec_cg_regs, 0, &mtk_clk_=
gate_ops_setclr_inv),
+=09GATE_MTK(CLK_VDEC_SMI_LARB1, "smi_larb1", "vdec_sel", &smi_larb1_cg_reg=
s, 0, &mtk_clk_gate_ops_setclr_inv),
+};
+
+static u16 vdecsys_rst_bank_ofs[] =3D { VDEC_RESETB_CON, SMI_LARB1_RESETB_=
CON };
+
+static u16 vdecsys_rst_idx_map[] =3D {
+=09[MT6735_VDEC_RST0_VDEC]=09=09=3D 0 * RST_NR_PER_BANK + 0,
+=09[MT6735_VDEC_RST1_SMI_LARB1]=09=3D 1 * RST_NR_PER_BANK + 0,
+};
+
+static const struct mtk_clk_rst_desc vdecsys_resets =3D {
+=09.version =3D MTK_RST_SIMPLE,
+=09.rst_bank_ofs =3D vdecsys_rst_bank_ofs,
+=09.rst_bank_nr =3D ARRAY_SIZE(vdecsys_rst_bank_ofs),
+=09.rst_idx_map =3D vdecsys_rst_idx_map,
+=09.rst_idx_map_nr =3D ARRAY_SIZE(vdecsys_rst_idx_map)
+};
+
+static const struct mtk_clk_desc vdecsys_clks =3D {
+=09.clks =3D vdecsys_gates,
+=09.num_clks =3D ARRAY_SIZE(vdecsys_gates),
+=09.rst_desc =3D &vdecsys_resets
+};
+
+static const struct of_device_id of_match_mt6735_vdecsys[] =3D {
+=09{ .compatible =3D "mediatek,mt6735-vdecsys", .data =3D &vdecsys_clks },
+=09{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt6735_vdecsys =3D {
+=09.probe =3D mtk_clk_simple_probe,
+=09.remove =3D mtk_clk_simple_remove,
+=09.driver =3D {
+=09=09.name =3D "clk-mt6735-vdecsys",
+=09=09.of_match_table =3D of_match_mt6735_vdecsys,
+=09},
+};
+module_platform_driver(clk_mt6735_vdecsys);
+
+MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
+MODULE_DESCRIPTION("MediaTek MT6735 vdecsys clock and reset driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6735-vencsys.c b/drivers/clk/mediat=
ek/clk-mt6735-vencsys.c
new file mode 100644
index 0000000000000..8dec7f98492ac
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6735-vencsys.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mediatek,mt6735-vencsys.h>
+
+#define VENC_CG_CON=09=09=090x00
+#define VENC_CG_SET=09=09=090x04
+#define VENC_CG_CLR=09=09=090x08
+
+static struct mtk_gate_regs venc_cg_regs =3D {
+=09.set_ofs =3D VENC_CG_SET,
+=09.clr_ofs =3D VENC_CG_CLR,
+=09.sta_ofs =3D VENC_CG_CON,
+};
+
+static const struct mtk_gate vencsys_gates[] =3D {
+=09GATE_MTK(CLK_VENC_SMI_LARB3, "smi_larb3", "mm_sel", &venc_cg_regs, 0, &=
mtk_clk_gate_ops_setclr_inv),
+=09GATE_MTK(CLK_VENC_VENC, "venc", "mm_sel", &venc_cg_regs, 4, &mtk_clk_ga=
te_ops_setclr_inv),
+=09GATE_MTK(CLK_VENC_JPGENC, "jpgenc", "mm_sel", &venc_cg_regs, 8, &mtk_cl=
k_gate_ops_setclr_inv),
+=09GATE_MTK(CLK_VENC_JPGDEC, "jpgdec", "mm_sel", &venc_cg_regs, 12, &mtk_c=
lk_gate_ops_setclr_inv),
+};
+
+static const struct mtk_clk_desc vencsys_clks =3D {
+=09.clks =3D vencsys_gates,
+=09.num_clks =3D ARRAY_SIZE(vencsys_gates),
+};
+
+static const struct of_device_id of_match_mt6735_vencsys[] =3D {
+=09{ .compatible =3D "mediatek,mt6735-vencsys", .data =3D &vencsys_clks },
+=09{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt6735_vencsys =3D {
+=09.probe =3D mtk_clk_simple_probe,
+=09.remove =3D mtk_clk_simple_remove,
+=09.driver =3D {
+=09=09.name =3D "clk-mt6735-vencsys",
+=09=09.of_match_table =3D of_match_mt6735_vencsys,
+=09},
+};
+module_platform_driver(clk_mt6735_vencsys);
+
+MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
+MODULE_DESCRIPTION("Mediatek MT6735 vencsys clock driver");
+MODULE_LICENSE("GPL");
--=20
2.47.0



