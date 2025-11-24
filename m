Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3B8CFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9c3Qpc7AsTRxWwpMRyYkuInfLdtrj7kwxB62DhZpoe8=; b=d0+TmTOtCiHi+KRT7TRXp4zN5l
	/kMGZD6PfP9L6G5Dv7uOkVmYvHORT7XJnmCiZXkIkt99cgLN+P1IlSZS5HawY9EqC+uTYeys6g3oE
	DT6LAFCMypnwJb+xwScIyzOpZF1ky6uwXpi5gyMa+yzEWfV16hENz88FAYxKock9TXtAoJpUhxuvC
	Y5fwi3LBa/ylStxSCAOPNbrCj4AHfTobnowimtNgmPu9c5MtOgKt3A1X+L11z/9oBcsD8jggiqN8T
	1iQeG8SNAScZas/JLhqBqM9qq60H0y3sVI7fNSUAdmZ85vqOnJCp4prnW0FBkMjMVd1ej/wbAHtG3
	H1oN1BdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUPw-0000000BVPK-0iSu;
	Mon, 24 Nov 2025 11:07:36 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUPn-0000000BVIk-3s13;
	Mon, 24 Nov 2025 11:07:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763982439; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CbICZw+MJLYvDM75sIfnRqr2fQ91fmNYtir5j9yJLOmhLrEZDyZeM0mJ7ETOgQi82FE5ryyxrMo8qwNY+a65frh+aCiYJGMyMhtOC+QYdKZYI4HDUG+YLjF6xDCNm0G2j0svY/ir7cklB4tW6jmeSo6N9v222P1wEb7M1x2lsm4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763982439; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9c3Qpc7AsTRxWwpMRyYkuInfLdtrj7kwxB62DhZpoe8=; 
	b=i3gBuUhesyaZ61vargUjnt8QzA7kpAtaYe0e5ub4wZ1HtAzRm2az09KbCboHtLBR7zSjSIVCWHZ8cjk0kRm7HeIzv3aMntpZETntLdW7fT2/Wg/XXagLS7jcTLAlnpRlwdF/vOJ2QP66Ypi33D0lzzuHd3hBZNrS6YfbI+DmGKI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763982439;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=9c3Qpc7AsTRxWwpMRyYkuInfLdtrj7kwxB62DhZpoe8=;
	b=AbFR2dWGm4T/wE7qV5gHcdokKuzuKOQWD6pN1nurdR3VqNMf1l3314XxXgqbFh3v
	1i618vg7bx8ghfIZCoke0Z0LIAMZqu5njm0Ni2j95LELOdD9+VlahcIO1Mj3zAZKYuU
	HDtZ3s9Dsnlo3N+h5tmE7BkJG2UVXFtgdI2knhKU=
Received: by mx.zohomail.com with SMTPS id 1763982437295434.8072143379791;
	Mon, 24 Nov 2025 03:07:17 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 24 Nov 2025 12:06:55 +0100
Subject: [PATCH v2 06/13] soc: mediatek: mtk-dvfsrc: Add a new callback for
 calc_dram_bw
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-mt8196-dvfsrc-v2-6-d9c1334db9f3@collabora.com>
References: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
In-Reply-To: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
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
X-CRM114-CacheID: sfid-20251124_030728_051230_1C8D2168 
X-CRM114-Status: GOOD (  13.46  )
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
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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
2.52.0


