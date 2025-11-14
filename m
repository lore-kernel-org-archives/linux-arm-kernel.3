Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C78CE8D57
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xhZzsPi24ECLdv/HgXQy4+BFguBDGlSdpqV9FxukS4=; b=hHn3Wgy1s9ofduq6FGQ0ESSJvo
	koS+Eir+akcnGc6vZBxUDgc0dQYsaYpecNEvbp+UYaA/p3XeLN1EZHI+zfhlHSGZ/Ql7vrLq1bXvY
	83/7uVFiST9wuYO9UL0y9VptqJSC0LzJ/onGDi0j1lVRVeO+lRAOVW90Ozu25AuoTeyqDfSZ3Kyv1
	o38rE45k9BnhQTN12Q1Qz7hqCiUTJcZQpfZmSDEHqphZHgGU+pIkbFzTkjL5hm/r9GxJh8w2UrMUG
	4bVE0RPgmttM3uX9oh2UCX9lm6kE49nvwvSoDsrS5Vh3o50I77/I0K3Ofa+DabxRY9w3vbXZ11IuB
	jUfkDFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4I-0000000Cm0e-2WX5;
	Fri, 14 Nov 2025 16:54:38 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJx4F-0000000ClyD-3jhn;
	Fri, 14 Nov 2025 16:54:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763139268; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DYPfGWTJNBjxboSjap2cs8MXufQH8Nu3yjo5vQgys5a4dR2Nrq35InIVuJe6qm5Naglvn4YByj15J6dgmXS0iCYv2HSdC9lYLzzw/O37gCu0IpOMT8bGdd00exTKL8AiH5DGA3BVZBN5zZyd/ftKY2aRdQzCfF9N+eQ7mg4MVRY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763139268; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2xhZzsPi24ECLdv/HgXQy4+BFguBDGlSdpqV9FxukS4=; 
	b=iLP5cIflj/Fc8fCzI+JUGpkgkgSJpxRZuwc9US2R22Yh0fxAVnqXgWRIHcs1/CYfGSykiT5CXvqccIzU2cbTzI69wP/IzckfH4U99wvEVz3tUrlss9aKlnUJm/LCnqY/JkgcfftA9tsXxS6+2xPvKtOilYh9lQqQduURXy2mruU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763139268;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2xhZzsPi24ECLdv/HgXQy4+BFguBDGlSdpqV9FxukS4=;
	b=RQ6vNugEveXtZ50gIbNsQdp+9MFbCI81bHj43b2UXZ+a6JhjeWYdQzJZVM7YOK/R
	tx3J3g/GNwDbKJt2poMbaCAB4Co71V1gSIM+4IZfQ6smAbzPuZIkeJAKWIpm5NSBsSQ
	E0LIjHVb707fSlPH97wmD2BX1oesBDB/RogdXHDc=
Received: by mx.zohomail.com with SMTPS id 1763139267314497.20972658135963;
	Fri, 14 Nov 2025 08:54:27 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 14 Nov 2025 17:54:00 +0100
Subject: [PATCH 06/13] soc: mediatek: mtk-dvfsrc: Add a new callback for
 calc_dram_bw
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mt8196-dvfsrc-v1-6-b956d4631468@collabora.com>
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
In-Reply-To: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Henry Chen <henryc.chen@mediatek.com>, Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_085435_988281_C9E52548 
X-CRM114-Status: GOOD (  12.89  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

In preparation for adding support for DVFSRC Version 4, add a new
callback for calculating the dram bandwidth, assign the current
calculation algo to all of the currently supported SoCs, and use
this in __dvfsrc_set_dram_bw_v1().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index a684e405daf7..3cbccbb7469a 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -73,6 +73,7 @@ struct mtk_dvfsrc {
 struct dvfsrc_soc_data {
 	const int *regs;
 	const struct dvfsrc_opp_desc *opps_desc;
+	u32 (*calc_dram_bw)(struct mtk_dvfsrc *dvfsrc, int type, u64 bw);
 	u32 (*get_target_level)(struct mtk_dvfsrc *dvfsrc);
 	u32 (*get_current_level)(struct mtk_dvfsrc *dvfsrc);
 	u32 (*get_vcore_level)(struct mtk_dvfsrc *dvfsrc);
@@ -274,10 +275,15 @@ static void dvfsrc_set_vscp_level_v2(struct mtk_dvfsrc *dvfsrc, u32 level)
 	dvfsrc_writel(dvfsrc, DVFSRC_VCORE, val);
 }
 
+static u32 dvfsrc_calc_dram_bw_v1(struct mtk_dvfsrc *dvfsrc, int type, u64 bw)
+{
+	return (u32)div_u64(bw, 100 * 1000);
+}
+
 static void __dvfsrc_set_dram_bw_v1(struct mtk_dvfsrc *dvfsrc, u32 reg,
 				    int type, u16 max_bw, u16 min_bw, u64 bw)
 {
-	u32 new_bw = (u32)div_u64(bw, 100 * 1000);
+	u32 new_bw = dvfsrc->dvd->calc_dram_bw(dvfsrc, type, bw);
 
 	/* If bw constraints (in mbps) are defined make sure to respect them */
 	if (max_bw)
@@ -519,6 +525,7 @@ static const struct dvfsrc_opp_desc dvfsrc_opp_mt8183_desc[] = {
 static const struct dvfsrc_soc_data mt8183_data = {
 	.opps_desc = dvfsrc_opp_mt8183_desc,
 	.regs = dvfsrc_mt8183_regs,
+	.calc_dram_bw = dvfsrc_calc_dram_bw_v1,
 	.get_target_level = dvfsrc_get_target_level_v1,
 	.get_current_level = dvfsrc_get_current_level_v1,
 	.get_vcore_level = dvfsrc_get_vcore_level_v1,
@@ -549,6 +556,7 @@ static const struct dvfsrc_opp_desc dvfsrc_opp_mt8195_desc[] = {
 static const struct dvfsrc_soc_data mt8195_data = {
 	.opps_desc = dvfsrc_opp_mt8195_desc,
 	.regs = dvfsrc_mt8195_regs,
+	.calc_dram_bw = dvfsrc_calc_dram_bw_v1,
 	.get_target_level = dvfsrc_get_target_level_v2,
 	.get_current_level = dvfsrc_get_current_level_v2,
 	.get_vcore_level = dvfsrc_get_vcore_level_v2,

-- 
2.51.2


