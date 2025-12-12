Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8847D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 03:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuyDECpbExg+nEmnOMQ7o3o65WKLu/fmobzAQ2nsiYs=; b=iN8Ys3bubPdUXobvXVvvPUK+zi
	MLNgDMfBdg28HyeWPPotkln4Y27bJia/97h5euyvdJU7cDtOEBGx4FVz6NHoMk+y97UODMPs2SJme
	TO0IDuYQOKtpwmy4F9kgi50b2ax01FU9HC/Vtrj+dDICa4YjCJGU09gggfHGTJ1Ra7lvL05wmjSgQ
	zjRFZ2eOGj0jBZnAJCGohmawl0vYajeOr8/TTPjeixlPaMlN6C48B4b4BiXPziDgtbBfpf8inCy/D
	9X4hiMTUMJsoRV0I+yvRdQ4crXDc8RIEhwAluC3BKARj4vxG6SBAdf69/HwkS7dleRdZWhNrqcdFS
	Za8UDI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtci-0000000HacC-1Mzt;
	Fri, 12 Dec 2025 03:15:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtce-0000000HaWC-49ev;
	Fri, 12 Dec 2025 03:15:14 +0000
X-UUID: c15924a8d70811f0a52f393f94899d25-20251211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TuyDECpbExg+nEmnOMQ7o3o65WKLu/fmobzAQ2nsiYs=;
	b=hruJY3+cgW5kwovUVPS7JKjzM741fiRT2bqCUQqVr+OenIrHcagEtxUbMjmt4p336ksgU2ltEvleaW3hQa+q56q2FEunnfCtlOb8RBsjqRVHE+5EKE2Bam5CjWCmRKt2yYgMOG/EWcFBrhKdEv3Ld93DpuAZ3dycLojn4AbGSFM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:4800f8ef-8076-42b8-af50-8c8885f4943c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:d7136f28-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|888|898,TC:-5,Content:0|15
	|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c15924a8d70811f0a52f393f94899d25-20251211
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.corp-partner.google.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 630388337; Thu, 11 Dec 2025 20:15:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 11:15:02 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 11:15:02 +0800
From: Xiaoshun Xu <xiaoshun.xu@mediatek.corp-partner.google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiaoshun Xu
	<xiaoshun.xu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu
	<vince-wl.liu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 2/4] soc: mediatek: mtk-devapc: Add support for MT8189 DEVAPC
Date: Fri, 12 Dec 2025 11:13:43 +0800
Message-ID: <20251212031450.489128-3-xiaoshun.xu@mediatek.corp-partner.google.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251212031450.489128-1-xiaoshun.xu@mediatek.corp-partner.google.com>
References: <20251212031450.489128-1-xiaoshun.xu@mediatek.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_191513_055290_07837655 
X-CRM114-Status: GOOD (  21.75  )
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


External email : Please do not click links or open attachments until you ha=
ve verified the sender or the content.


From: "xiaoshun.xu" <xiaoshun.xu@mediatek.com>

Add support for MT8189 DEVAPC, DEVAPC debug registers have new version,
so refine the structure of devapc_regs_ofs_xxxx to devapc_regs_ofs_verX,
and rename the infra_base to base in mtk_devapc_context because DEVAPC
not only access the infra_base to dump debug information when violation
happens

Signed-off-by: xiaoshun.xu <xiaoshun.xu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 146 +++++++++++++++++++++++-------
 1 file changed, 114 insertions(+), 32 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-d=
evapc.c
index f54c966138b5..6dbec4016a24 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -26,9 +26,19 @@ struct mtk_devapc_vio_dbgs {
                        u32 addr_h:4;
                        u32 resv:4;
                } dbg0_bits;
+
+               struct {
+                       u32 dmnid:6;
+                       u32 vio_w:1;
+                       u32 vio_r:1;
+                       u32 addr_h:4;
+                       u32 resv:20;
+               } dbg0_bits_ver2;
        };

        u32 vio_dbg1;
+       u32 vio_dbg2;
+       u32 vio_dbg3;
 };

 struct mtk_devapc_regs_ofs {
@@ -37,6 +47,8 @@ struct mtk_devapc_regs_ofs {
        u32 vio_sta_offset;
        u32 vio_dbg0_offset;
        u32 vio_dbg1_offset;
+       u32 vio_dbg2_offset;
+       u32 vio_dbg3_offset;
        u32 apc_con_offset;
        u32 vio_shift_sta_offset;
        u32 vio_shift_sel_offset;
@@ -44,16 +56,20 @@ struct mtk_devapc_regs_ofs {
 };

 struct mtk_devapc_data {
-       /* numbers of violation index */
-       u32 vio_idx_num;
+       u32 version;
+       /* Default numbers of violation index */
+       u32 default_vio_idx_num;
        const struct mtk_devapc_regs_ofs *regs_ofs;
 };

 struct mtk_devapc_context {
        struct device *dev;
-       void __iomem *infra_base;
+       void __iomem *base;
        struct clk *infra_clk;
        const struct mtk_devapc_data *data;
+
+       /* numbers of violation index */
+       u32 vio_idx_num;
 };

 static void clear_vio_status(struct mtk_devapc_context *ctx)
@@ -61,12 +77,12 @@ static void clear_vio_status(struct mtk_devapc_context =
*ctx)
        void __iomem *reg;
        int i;

-       reg =3D ctx->infra_base + ctx->data->regs_ofs->vio_sta_offset;
+       reg =3D ctx->base + ctx->data->regs_ofs->vio_sta_offset;

-       for (i =3D 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i=
++)
+       for (i =3D 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num - 1); i++)
                writel(GENMASK(31, 0), reg + 4 * i);

-       writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num) - 1, 0),
+       writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1), 0),
               reg + 4 * i);
 }

@@ -76,22 +92,22 @@ static void mask_module_irq(struct mtk_devapc_context *=
ctx, bool mask)
        u32 val;
        int i;

-       reg =3D ctx->infra_base + ctx->data->regs_ofs->vio_mask_offset;
+       reg =3D ctx->base + ctx->data->regs_ofs->vio_mask_offset;

        if (mask)
                val =3D GENMASK(31, 0);
        else
                val =3D 0;

-       for (i =3D 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num) - 1; i=
++)
+       for (i =3D 0; i < VIO_MOD_TO_REG_IND(ctx->vio_idx_num - 1); i++)
                writel(val, reg + 4 * i);

        val =3D readl(reg + 4 * i);
        if (mask)
-               val |=3D GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num)=
 - 1,
+               val |=3D GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1),
                               0);
        else
-               val &=3D ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num=
) - 1,
+               val &=3D ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->vio_idx_num - 1),
                                0);

        writel(val, reg + 4 * i);
@@ -118,11 +134,11 @@ static int devapc_sync_vio_dbg(struct mtk_devapc_cont=
ext *ctx)
        int ret;
        u32 val;

-       pd_vio_shift_sta_reg =3D ctx->infra_base +
+       pd_vio_shift_sta_reg =3D ctx->base +
                               ctx->data->regs_ofs->vio_shift_sta_offset;
-       pd_vio_shift_sel_reg =3D ctx->infra_base +
+       pd_vio_shift_sel_reg =3D ctx->base +
                               ctx->data->regs_ofs->vio_shift_sel_offset;
-       pd_vio_shift_con_reg =3D ctx->infra_base +
+       pd_vio_shift_con_reg =3D ctx->base +
                               ctx->data->regs_ofs->vio_shift_con_offset;

        /* Find the minimum shift group which has violation */
@@ -163,22 +179,52 @@ static void devapc_extract_vio_dbg(struct mtk_devapc_=
context *ctx)
        struct mtk_devapc_vio_dbgs vio_dbgs;
        void __iomem *vio_dbg0_reg;
        void __iomem *vio_dbg1_reg;
+       void __iomem *vio_dbg2_reg;
+       void __iomem *vio_dbg3_reg;
+       u32 vio_addr_l, vio_addr_h, bus_id, domain_id;
+       u32 vio_w, vio_r;
+       u64 vio_addr;

-       vio_dbg0_reg =3D ctx->infra_base + ctx->data->regs_ofs->vio_dbg0_of=
fset;
-       vio_dbg1_reg =3D ctx->infra_base + ctx->data->regs_ofs->vio_dbg1_of=
fset;
+       vio_dbg0_reg =3D ctx->base + ctx->data->regs_ofs->vio_dbg0_offset;
+       vio_dbg1_reg =3D ctx->base + ctx->data->regs_ofs->vio_dbg1_offset;
+       vio_dbg2_reg =3D ctx->base + ctx->data->regs_ofs->vio_dbg2_offset;
+       vio_dbg3_reg =3D ctx->base + ctx->data->regs_ofs->vio_dbg3_offset;

        vio_dbgs.vio_dbg0 =3D readl(vio_dbg0_reg);
        vio_dbgs.vio_dbg1 =3D readl(vio_dbg1_reg);
+       if (ctx->data->version >=3D 2U)
+               vio_dbgs.vio_dbg2 =3D readl(vio_dbg2_reg);
+       if (ctx->data->version =3D=3D 3U)
+               vio_dbgs.vio_dbg3 =3D readl(vio_dbg3_reg);
+
+       if (ctx->data->version =3D=3D 1U) {
+               /* arch version 1 */
+               bus_id =3D vio_dbgs.dbg0_bits.mstid;
+               vio_addr =3D vio_dbgs.vio_dbg1;
+               domain_id =3D vio_dbgs.dbg0_bits.dmnid;
+               vio_w =3D vio_dbgs.dbg0_bits.vio_w;
+               vio_r =3D vio_dbgs.dbg0_bits.vio_r;
+       } else {
+               /* arch version 2 & 3 */
+               bus_id =3D vio_dbgs.vio_dbg1;
+
+               vio_addr_l =3D vio_dbgs.vio_dbg2;
+               vio_addr_h =3D ctx->data->version =3D=3D 2U ? vio_dbgs.dbg0=
_bits_ver2.addr_h :
+                                                       vio_dbgs.vio_dbg3;
+               vio_addr =3D ((u64)vio_addr_h << 32) + vio_addr_l;
+               domain_id =3D vio_dbgs.dbg0_bits_ver2.dmnid;
+               vio_w =3D vio_dbgs.dbg0_bits_ver2.vio_w;
+               vio_r =3D vio_dbgs.dbg0_bits_ver2.vio_r;
+       }

        /* Print violation information */
-       if (vio_dbgs.dbg0_bits.vio_w)
+       if (vio_w)
                dev_info(ctx->dev, "Write Violation\n");
-       else if (vio_dbgs.dbg0_bits.vio_r)
+       else if (vio_r)
                dev_info(ctx->dev, "Read Violation\n");

-       dev_info(ctx->dev, "Bus ID:0x%x, Dom ID:0x%x, Vio Addr:0x%x\n",
-                vio_dbgs.dbg0_bits.mstid, vio_dbgs.dbg0_bits.dmnid,
-                vio_dbgs.vio_dbg1);
+       dev_info(ctx->dev, "Bus ID:0x%x, Dom ID:0x%x, Vio Addr:0x%llx\n",
+                bus_id, domain_id, vio_addr);
 }

 /*
@@ -203,7 +249,8 @@ static irqreturn_t devapc_violation_irq(int irq_number,=
 void *data)
  */
 static void start_devapc(struct mtk_devapc_context *ctx)
 {
-       writel(BIT(31), ctx->infra_base + ctx->data->regs_ofs->apc_con_offs=
et);
+
+       writel(BIT(31), ctx->base + ctx->data->regs_ofs->apc_con_offset);

        mask_module_irq(ctx, false);
 }
@@ -215,10 +262,10 @@ static void stop_devapc(struct mtk_devapc_context *ct=
x)
 {
        mask_module_irq(ctx, true);

-       writel(BIT(2), ctx->infra_base + ctx->data->regs_ofs->apc_con_offse=
t);
+       writel(BIT(2), ctx->base + ctx->data->regs_ofs->apc_con_offset);
 }

-static const struct mtk_devapc_regs_ofs devapc_regs_ofs_mt6779 =3D {
+static const struct mtk_devapc_regs_ofs devapc_regs_ofs_ver1 =3D {
        .vio_mask_offset =3D 0x0,
        .vio_sta_offset =3D 0x400,
        .vio_dbg0_offset =3D 0x900,
@@ -229,14 +276,34 @@ static const struct mtk_devapc_regs_ofs devapc_regs_o=
fs_mt6779 =3D {
        .vio_shift_con_offset =3D 0xF20,
 };

+static const struct mtk_devapc_regs_ofs devapc_regs_ofs_ver2 =3D {
+       .vio_mask_offset =3D 0x0,
+       .vio_sta_offset =3D 0x400,
+       .vio_dbg0_offset =3D 0x900,
+       .vio_dbg1_offset =3D 0x904,
+       .vio_dbg2_offset =3D 0x908,
+       .vio_dbg3_offset =3D 0x90c,
+       .apc_con_offset =3D 0xF00,
+       .vio_shift_sta_offset =3D 0xF20,
+       .vio_shift_sel_offset =3D 0xF30,
+       .vio_shift_con_offset =3D 0xF10,
+};
+
 static const struct mtk_devapc_data devapc_mt6779 =3D {
-       .vio_idx_num =3D 511,
-       .regs_ofs =3D &devapc_regs_ofs_mt6779,
+       .version =3D 1,
+       .default_vio_idx_num =3D 511,
+       .regs_ofs =3D &devapc_regs_ofs_ver1,
 };

 static const struct mtk_devapc_data devapc_mt8186 =3D {
-       .vio_idx_num =3D 519,
-       .regs_ofs =3D &devapc_regs_ofs_mt6779,
+       .version =3D 1,
+       .default_vio_idx_num =3D 519,
+       .regs_ofs =3D &devapc_regs_ofs_ver1,
+};
+
+static const struct mtk_devapc_data devapc_mt8189 =3D {
+       .version =3D 3,
+       .regs_ofs =3D &devapc_regs_ofs_ver2,
 };

 static const struct of_device_id mtk_devapc_dt_match[] =3D {
@@ -246,6 +313,9 @@ static const struct of_device_id mtk_devapc_dt_match[] =
=3D {
        }, {
                .compatible =3D "mediatek,mt8186-devapc",
                .data =3D &devapc_mt8186,
+       }, {
+               .compatible =3D "mediatek,mt8189-devapc",
+               .data =3D &devapc_mt8189,
        }, {
        },
 };
@@ -268,10 +338,21 @@ static int mtk_devapc_probe(struct platform_device *p=
dev)
        ctx->data =3D of_device_get_match_data(&pdev->dev);
        ctx->dev =3D &pdev->dev;

-       ctx->infra_base =3D of_iomap(node, 0);
-       if (!ctx->infra_base)
+       ctx->base =3D of_iomap(node, 0);
+       if (!ctx->base)
                return -EINVAL;

+       /*
+        * Set effective vio_idx_num from default value.
+        * If vio_idx_num is 0, get the info from DT.
+        */
+       ctx->vio_idx_num =3D ctx->data->default_vio_idx_num;
+       if (ctx->vio_idx_num =3D=3D 0)
+               if (of_property_read_u32(node,
+                                        "vio-idx-num",
+                                        &ctx->vio_idx_num))
+                       return -EINVAL;
+
        devapc_irq =3D irq_of_parse_and_map(node, 0);
        if (!devapc_irq) {
                ret =3D -EINVAL;
@@ -296,7 +377,7 @@ static int mtk_devapc_probe(struct platform_device *pde=
v)
        return 0;

 err:
-       iounmap(ctx->infra_base);
+       iounmap(ctx->base);
        return ret;
 }

@@ -305,12 +386,13 @@ static void mtk_devapc_remove(struct platform_device =
*pdev)
        struct mtk_devapc_context *ctx =3D platform_get_drvdata(pdev);

        stop_devapc(ctx);
-       iounmap(ctx->infra_base);
+
+       iounmap(ctx->base);
 }

 static struct platform_driver mtk_devapc_driver =3D {
        .probe =3D mtk_devapc_probe,
-       .remove =3D mtk_devapc_remove,
+       .remove_new =3D mtk_devapc_remove,
        .driver =3D {
                .name =3D "mtk-devapc",
                .of_match_table =3D mtk_devapc_dt_match,
--
2.45.2


