Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F48FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OdaZ0sAspcn1/scGkVB+Ph2WVMvO525S4sSoRNZBI8=; b=RjRy8uw/wqvrq1UkeWVApDnKX4
	acwyQkAmfFVTRuroNBM30iCEfB9OlTRtu5rJ1EeLYo4klLUkEGZd9tq77x2N76wNTe/kuNhEBbqF4
	FCmZukIefuURVba/tcR+stXi14Pxct51mQ7gtEGYer6Mdan4CHipL18sHh91RKtSoRJ3p5OAJQbaf
	zwqHySNEJEj7i/NDg0HmHgq6hanq3/i5QgU9KLlbXK8Py/BHC1vnI3qkSLKN48mlMzPS/irawUGt2
	bN7eXTwUVm2TRGdg5NoxWz5KlOUTvv0BBOgZxXejV1ksknlFRIxPSLRcqHtoY+LfhvvBLrKqYbJcz
	5LJVw3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVUP-00000008UD5-1gF8;
	Wed, 08 Jan 2025 12:48:49 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUcp-00000008J03-2oXg;
	Wed, 08 Jan 2025 11:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=6OdaZ
	0sAspcn1/scGkVB+Ph2WVMvO525S4sSoRNZBI8=; b=Xs18ly4TGtrprgPHFhsIs
	VhMJr4f6d3aZbWppqBk49c5P+IimW0CdtcgwNAEkqYo2ixjP2TnizVG/JefCOCzw
	mssYrVijj6JxbsKE/T7GFTxB0sUCZNtcPtd9K1j3Seovyk63uNEi/tjxorruS7A4
	ccg9ufy8KP7qZzY9EkaJBs=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDHpyUCZ35n8Xn7EQ--.26804S3;
	Wed, 08 Jan 2025 19:52:41 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	daniel@fooishbar.org,
	robh@kernel.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v9 01/11] drm/rockchip: vop2: use devm_regmap_field_alloc for cluster-regs
Date: Wed,  8 Jan 2025 19:52:18 +0800
Message-ID: <20250108115233.17729-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250108115233.17729-1-andyshrk@163.com>
References: <20250108115233.17729-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHpyUCZ35n8Xn7EQ--.26804S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFW7GFWUWrykJr4fGF17Wrg_yoWrZr4xpF
	4rCwnxuF45Grn29rykAr1DAF1Fk397ta1rCFn7uwnI9rnFgrZ7C3WDCw1jyrs0kryv9FZr
	tFs8t3y3ua4Ygr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWc_fUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBLOXmd+X+etDgAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_035328_134167_B8195678 
X-CRM114-Status: GOOD (  14.50  )
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

From: Heiko Stuebner <heiko@sntech.de>

Right now vop2_cluster_init() copies the base vop2_cluster_regs
and adapts the reg value with the current window's offset before
adding the fields to the regmap.

This conflicts with the notion of reg_fields being const, see
https://lore.kernel.org/all/20240706-regmap-const-structs-v1-1-d08c776da787@weissschuh.net/
for reference, which now causes checkpatch to actually warn about that.

So instead of creating one big copy and changing it afterwards,
add the reg_fields individually using devm_regmap_field_alloc().

Functional it is the same, just that the reg_field we're handling
can stay const.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 66 +++++++++-----------
 1 file changed, 31 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 8e065199acfc..327ead907d44 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -3372,7 +3372,7 @@ static int vop2_find_rgb_encoder(struct vop2 *vop2)
 	return -ENOENT;
 }
 
-static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
+static const struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 0, 0),
 	[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 1, 5),
 	[VOP2_WIN_RB_SWAP] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 14, 14),
@@ -3443,28 +3443,26 @@ static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
 static int vop2_cluster_init(struct vop2_win *win)
 {
 	struct vop2 *vop2 = win->vop2;
-	struct reg_field *cluster_regs;
-	int ret, i;
-
-	cluster_regs = kmemdup(vop2_cluster_regs, sizeof(vop2_cluster_regs),
-			       GFP_KERNEL);
-	if (!cluster_regs)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(vop2_cluster_regs); i++)
-		if (cluster_regs[i].reg != 0xffffffff)
-			cluster_regs[i].reg += win->offset;
+	int i;
 
-	ret = devm_regmap_field_bulk_alloc(vop2->dev, vop2->map, win->reg,
-					   cluster_regs,
-					   ARRAY_SIZE(vop2_cluster_regs));
+	for (i = 0; i < ARRAY_SIZE(vop2_cluster_regs); i++) {
+		const struct reg_field field = {
+			.reg = (vop2_cluster_regs[i].reg != 0xffffffff) ?
+					vop2_cluster_regs[i].reg + win->offset :
+					vop2_cluster_regs[i].reg,
+			.lsb = vop2_cluster_regs[i].lsb,
+			.msb = vop2_cluster_regs[i].msb
+		};
 
-	kfree(cluster_regs);
+		win->reg[i] = devm_regmap_field_alloc(vop2->dev, vop2->map, field);
+		if (IS_ERR(win->reg[i]))
+			return PTR_ERR(win->reg[i]);
+	}
 
-	return ret;
+	return 0;
 };
 
-static struct reg_field vop2_esmart_regs[VOP2_WIN_MAX_REG] = {
+static const struct reg_field vop2_esmart_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 0, 0),
 	[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 1, 5),
 	[VOP2_WIN_DITHER_UP] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 12, 12),
@@ -3531,26 +3529,24 @@ static struct reg_field vop2_esmart_regs[VOP2_WIN_MAX_REG] = {
 static int vop2_esmart_init(struct vop2_win *win)
 {
 	struct vop2 *vop2 = win->vop2;
-	struct reg_field *esmart_regs;
-	int ret, i;
-
-	esmart_regs = kmemdup(vop2_esmart_regs, sizeof(vop2_esmart_regs),
-			      GFP_KERNEL);
-	if (!esmart_regs)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(vop2_esmart_regs); i++)
-		if (esmart_regs[i].reg != 0xffffffff)
-			esmart_regs[i].reg += win->offset;
+	int i;
 
-	ret = devm_regmap_field_bulk_alloc(vop2->dev, vop2->map, win->reg,
-					   esmart_regs,
-					   ARRAY_SIZE(vop2_esmart_regs));
+	for (i = 0; i < ARRAY_SIZE(vop2_esmart_regs); i++) {
+		const struct reg_field field = {
+			.reg = (vop2_esmart_regs[i].reg != 0xffffffff) ?
+				vop2_esmart_regs[i].reg + win->offset :
+				vop2_esmart_regs[i].reg,
+			.lsb = vop2_esmart_regs[i].lsb,
+			.msb = vop2_esmart_regs[i].msb
+		};
 
-	kfree(esmart_regs);
+		win->reg[i] = devm_regmap_field_alloc(vop2->dev, vop2->map, field);
+		if (IS_ERR(win->reg[i]))
+			return PTR_ERR(win->reg[i]);
+	}
 
-	return ret;
-};
+	return 0;
+}
 
 static int vop2_win_init(struct vop2 *vop2)
 {
-- 
2.34.1


