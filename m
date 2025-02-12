Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED20C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URKKB59F/q0mF1SZHAnHb3HC+RFEwqYwuY5f1Lrg/6M=; b=WeY/b1IWnfa5NDe6egxKT5WUmL
	mFc7mwYu3NfUu28GjxodlgObaEdFtlvuGVtXWEJ26ArNWMz5Xgc86lTx+W7ZahYYQUxhZc4G/lc1e
	byv8tt0fIhNkqjPK7W23aohg4AappqXoGwl0opXRDj7d/Q6TnxJ5lQ3wsprtty7ILqzhKaVfv68/q
	/6ZwzfDw2CZCAGeEoKXmnKn/ANyv+NvnM4W44PFtuQF2S1gUlfmg5zu6seMNOYJSaDePqmRs5HyQ+
	OuVnfjdOO/TTAfmGjd+nOeJ3m70I4T37pJ3311QLzonqbHkKIrvnF4Ic1kNcK7oB/5AQahuYDXM/I
	PjtS0+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9DH-00000006ozi-1IZu;
	Wed, 12 Feb 2025 09:39:23 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9A6-00000006npM-3XLp;
	Wed, 12 Feb 2025 09:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=URKKB
	59F/q0mF1SZHAnHb3HC+RFEwqYwuY5f1Lrg/6M=; b=W/U9ojoUFD0Ezbx44WQ/c
	fKXXxs2TX+q25TzBRH44cdTzvhaA/Am+offgB53//E35EP1B1IMmj84wXor7DtIT
	FiXioG43/NdbFBT/jpkhk5IUB+T8WyYjZlr2nWgpYak9cknqUP++SEShDrUSVfk7
	7tMAa8HZ8n++HHv5NK5cEQ=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBnG9Fja6xn14FuLQ--.33700S6;
	Wed, 12 Feb 2025 17:35:39 +0800 (CST)
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
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v14 04/13] drm/rockchip: vop2: Merge vop2_cluster/esmart_init function
Date: Wed, 12 Feb 2025 17:34:59 +0800
Message-ID: <20250212093530.52961-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212093530.52961-1-andyshrk@163.com>
References: <20250212093530.52961-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnG9Fja6xn14FuLQ--.33700S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw4UKF17CrWktr18AFykAFb_yoW5Xr1DpF
	W3Gr43Wr4UGrsFgr4kJrn8uF1Fkr12yaykAa48KwnIkwnrKF9FkFn5JF10yr90krWv9Fy2
	yFs5K3y5ua4j9r7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UZ6pPUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAHxXmesZw5TqAABse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_013607_264471_AAACF679 
X-CRM114-Status: GOOD (  11.34  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Now these two function share the same logic, the can
be merged as one.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 42 +++++---------------
 1 file changed, 11 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index a0d961cb5d21..844df4001159 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2424,18 +2424,18 @@ static int vop2_find_rgb_encoder(struct vop2 *vop2)
 	return -ENOENT;
 }
 
-static int vop2_cluster_init(struct vop2_win *win)
+static int vop2_regmap_init(struct vop2_win *win, const struct reg_field *regs,
+			    int nr_regs)
 {
 	struct vop2 *vop2 = win->vop2;
 	int i;
 
-	for (i = 0; i < vop2->data->nr_cluster_regs; i++) {
+	for (i = 0; i < nr_regs; i++) {
 		const struct reg_field field = {
-			.reg = (vop2->data->cluster_reg[i].reg != 0xffffffff) ?
-				vop2->data->cluster_reg[i].reg + win->offset :
-				vop2->data->cluster_reg[i].reg,
-			.lsb = vop2->data->cluster_reg[i].lsb,
-			.msb = vop2->data->cluster_reg[i].msb
+			.reg = (regs[i].reg != 0xffffffff) ?
+				regs[i].reg + win->offset : regs[i].reg,
+			.lsb = regs[i].lsb,
+			.msb = regs[i].msb
 		};
 
 		win->reg[i] = devm_regmap_field_alloc(vop2->dev, vop2->map, field);
@@ -2446,28 +2446,6 @@ static int vop2_cluster_init(struct vop2_win *win)
 	return 0;
 };
 
-static int vop2_esmart_init(struct vop2_win *win)
-{
-	struct vop2 *vop2 = win->vop2;
-	int i;
-
-	for (i = 0; i < vop2->data->nr_smart_regs; i++) {
-		const struct reg_field field = {
-			.reg = (vop2->data->smart_reg[i].reg != 0xffffffff) ?
-				vop2->data->smart_reg[i].reg + win->offset :
-				vop2->data->smart_reg[i].reg,
-			.lsb = vop2->data->smart_reg[i].lsb,
-			.msb = vop2->data->smart_reg[i].msb
-		};
-
-		win->reg[i] = devm_regmap_field_alloc(vop2->dev, vop2->map, field);
-		if (IS_ERR(win->reg[i]))
-			return PTR_ERR(win->reg[i]);
-	}
-
-	return 0;
-}
-
 static int vop2_win_init(struct vop2 *vop2)
 {
 	const struct vop2_data *vop2_data = vop2->data;
@@ -2484,9 +2462,11 @@ static int vop2_win_init(struct vop2 *vop2)
 		win->win_id = i;
 		win->vop2 = vop2;
 		if (vop2_cluster_window(win))
-			ret = vop2_cluster_init(win);
+			ret = vop2_regmap_init(win, vop2->data->cluster_reg,
+					       vop2->data->nr_cluster_regs);
 		else
-			ret = vop2_esmart_init(win);
+			ret = vop2_regmap_init(win, vop2->data->smart_reg,
+					       vop2->data->nr_cluster_regs);
 		if (ret)
 			return ret;
 	}
-- 
2.34.1


