Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04999EF8FEE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zl1V74JjZEQ00igJg/pKn4t3Auq4QD7fJPZAoJSVfA=; b=vLDOkMkLfO9MupzOqDaaTeEkMn
	rURpK6YtngAgvybXjBhNxo0+yz+ScM3fDyRPjmUQ+6eWlVGlkLOBMUKAYG8YBgPNtOwb6tCCu1ttf
	ZpoRbVr1vuOqy0h9T3GP99wxCvgeT/LP+7oHPkX4/6v5yv2HyuVN8VT7DIzXMvUDQ+CafvLZRcjG8
	4pYP0wry3YSsE3HICVADbxH0tZH7MBGzKfZf1S9Vqh2UAe49tGESV7iOdNaII3F8vItblGfI6trJR
	vHC5UW59SvG87qecoTkfXITEHsd8wF2AJfI3i+x1GiXx5e9+WFYtw4VYqlO+s5EIkXsK9IYhvoLSC
	HwJYr/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxndj-0000000HUNZ-1rN8;
	Wed, 04 Mar 2026 14:55:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxndh-0000000HULM-2xxM;
	Wed, 04 Mar 2026 14:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4zl1V74JjZEQ00igJg/pKn4t3Auq4QD7fJPZAoJSVfA=; b=DDkfURqf0sbal8PPOK6D2qt+UL
	/cQId9N6R3mqO4+sESYlp0D3830H5kZIqBidBeo6fQmP2qHSyr8qJAqw01ZgpvIBzOdB0fW3SXcrC
	SP3pDEuaTMYeGGUEbz8Z0E/0QFhs2Oxg9bCDHlw7YJHKG2mlFG10/rRrREO1GLoqmjtDDtE3BlqiN
	t4rFD4b9fu2jkgZAijp7CypOITNcCm+jSi32zVPRV1GTgCmNJ/KogOf1yHSZmsti+hcpGHAdWHyi9
	G5NnILxcaNnTRf+FXuEVzDejFgTZd4VCPbtHOTdusExKTxeLUCK9TbpNfKhEVhch8K4iJK/YxfON9
	quF9so6g==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnde-00000004qi4-00uk;
	Wed, 04 Mar 2026 14:55:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772636138; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AU0dfGiZJIbbK19p+MDgaZqtm2R8hFunuv7hkxWvN6CN/Aehq1IiXkufMjjxOL+R25jcZDVaPiMZfBItqQtx75t42UPS+/GgGnRIUqfkplF11c4ihG1S3X30yatO7evq/t4n+4V9xSku8D16cGIyjOQjw1ZXk7afzaTo/2Wioi0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772636138; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4zl1V74JjZEQ00igJg/pKn4t3Auq4QD7fJPZAoJSVfA=; 
	b=gVlxjpgtsUFSiDmVuH1dHsCkCcvn3hhWRu2pjJvqKFZCevfTZPYhmUGpobIh2sCnRq5Ciu2SyjLfO2x2zY+ACJIK50SV4Tu6LB37FnyUkfRyeK8DvH8WZgw/P0gQXQnvxefRett//bTBNB0uM98T6uHy9eUegPTQ0uQeSDSJYQg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772636138;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=4zl1V74JjZEQ00igJg/pKn4t3Auq4QD7fJPZAoJSVfA=;
	b=CAIVtC2jK4y+72dTp8PKmASE6jlKNXnPR7+5yTnczVfwQIxsAE1s+eZp8CUQsKwR
	yq+31FkI+NLA2Im8mXncAY/VPyFUzIYORcdaORlxoEp3lwIhNDnB5dRaiVH8AYe3ip1
	cK3jtSiLDlRxqgwnoELj0W8RVGgyqMCy/Vq86t0g=
Received: by mx.zohomail.com with SMTPS id 177263613629493.10029857824361;
	Wed, 4 Mar 2026 06:55:36 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 04 Mar 2026 15:53:28 +0100
Subject: [PATCH v8 23/23] scsi: ufs: mediatek: Add MT8196 compatible,
 update copyright
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-mt8196-ufs-v8-23-5b0eac23314f@collabora.com>
References: <20260304-mt8196-ufs-v8-0-5b0eac23314f@collabora.com>
In-Reply-To: <20260304-mt8196-ufs-v8-0-5b0eac23314f@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_145550_419998_6FF756C7 
X-CRM114-Status: GOOD (  12.25  )
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

THe MT8196's UFS controller has a new compatible. Add the necessary
struct definitions to support it.

Also update the copyrights and authors, without tabs following spaces to
avoid checkpatch errors, to list myself as having contributed to this
driver after the preceding rework patches.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 6292c943ef99..a9e8641e6f29 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1,9 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2019 MediaTek Inc.
+ * Copyright (C) 2025 Collabora Ltd.
  * Authors:
- *	Stanley Chu <stanley.chu@mediatek.com>
- *	Peter Wang <peter.wang@mediatek.com>
+ *      Stanley Chu <stanley.chu@mediatek.com>
+ *      Peter Wang <peter.wang@mediatek.com>
+ *      Nicolas Frattaroli <nicolas.frattaroli@collabora.com> (Major cleanups)
  */
 
 #include <linux/arm-smccc.h>
@@ -2200,6 +2202,10 @@ static const char *const ufs_mtk_regs_avdd12_ckbuf_avdd18[] = {
 	"avdd12", "avdd12-ckbuf", "avdd18"
 };
 
+static const char *const ufs_mtk_regs_avdd12_ckbuf[] = {
+	"avdd12", "avdd12-ckbuf"
+};
+
 static const struct ufs_mtk_soc_data mt8183_data = {
 	.has_avdd09 = true,
 	.reg_names = ufs_mtk_regs_avdd12_avdd18,
@@ -2212,10 +2218,17 @@ static const struct ufs_mtk_soc_data mt8192_8195_data = {
 	.num_reg_names = ARRAY_SIZE(ufs_mtk_regs_avdd12_ckbuf_avdd18),
 };
 
+static const struct ufs_mtk_soc_data mt8196_data = {
+	.has_avdd09 = true,
+	.reg_names = ufs_mtk_regs_avdd12_ckbuf,
+	.num_reg_names = ARRAY_SIZE(ufs_mtk_regs_avdd12_ckbuf),
+};
+
 static const struct of_device_id ufs_mtk_of_match[] = {
 	{ .compatible = "mediatek,mt8183-ufshci", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8192-ufshci", .data = &mt8192_8195_data },
 	{ .compatible = "mediatek,mt8195-ufshci", .data = &mt8192_8195_data },
+	{ .compatible = "mediatek,mt8196-ufshci", .data = &mt8196_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ufs_mtk_of_match);

-- 
2.53.0


