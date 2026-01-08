Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568DFD185C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOpG4ctuGxaFemqROhr+mYZ3twHePcGw1CvALVuGy0E=; b=oo/BDPxR9tJSU+ZGl48lmxRI7v
	mifrsqtyEDHrP/ViK7KZh0ef6uc1ncv0176uFuDFC5AL0/nhp8RWYgC5UVFo0epH3VwCyCdh2fcVl
	T2+qK2eHp4Baps94sKetNtxU4gTlek9ITCeToMGQ+XeyNPfqVWa6a9ITDQQuGLe3+ecauWpvmREyj
	X3VU/rokn7tl0vee1hOfvd1S6wkSb+3HUAOBLiZnEP9gUGAOCRZkvdMxHcTQInhtEA5j/HtuwABII
	w7eK8AVx9qenszRDaXT1xtOCniX2RoRCXOeDNl5ke83G+eF+A3LiGQzsTlurrA2R1Xr1hnHE3Xmxg
	P6tBanSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdndG-0000000Giz3-0u4f;
	Thu, 08 Jan 2026 10:52:46 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdncz-0000000GicK-0Cll;
	Thu, 08 Jan 2026 10:52:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767869537; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YmWcFSOC76fGbVOBvUJ21xVrxngjzaHvSQk1q5n+008+2y/t8l8NgKU9F4x/n/sKnfds0giPe/IOw40X137Qk7vsvNCiSagRvIRUcxNhKYfjQS8OBD6esLevcQcE4SfH9RRoF8ReY2a4mYa9bCQgT+QVXjq8GaUETts/+X+6urU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767869537; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zOpG4ctuGxaFemqROhr+mYZ3twHePcGw1CvALVuGy0E=; 
	b=ONgsnNYz3Ub5EX1fkAjjReXFd96MJVXxiVUPjhZ9TyjaW8IJlENXDkesHsTmvgJTzl4Dt6/r69VrX39A8jMVt6EJSyjN2pCjQdzgGmH1bjs9QHvEEAB7HxRBeHxTBXanrgsXOO2LML2YLNMl52MswsPzPgZr9Eo+O3S5l2yc3W4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767869537;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=zOpG4ctuGxaFemqROhr+mYZ3twHePcGw1CvALVuGy0E=;
	b=DdDL4nxIvWZXSKg6opCkNkcq2KTiuPAho9N/PlSOgwPy7dRtcy4WX3glwVv/cKvR
	8dxEg1uNAIg/j6MS+Vdeiut+8mPg1KJaAksNAcuz7+PPxhtMaqZagzmwW5cZyyfMxWz
	iKtCeK/lek77tCXlfQOWfuMUdO1f1Ar/ix7v0wew=
Received: by mx.zohomail.com with SMTPS id 1767869536276411.19284101434323;
	Thu, 8 Jan 2026 02:52:16 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 08 Jan 2026 11:49:42 +0100
Subject: [PATCH v5 23/24] scsi: ufs: mediatek: Remove ret local from
 link_startup_notify
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-mt8196-ufs-v5-23-49215157ec41@collabora.com>
References: <20260108-mt8196-ufs-v5-0-49215157ec41@collabora.com>
In-Reply-To: <20260108-mt8196-ufs-v5-0-49215157ec41@collabora.com>
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
X-CRM114-CacheID: sfid-20260108_025229_412147_2B743D41 
X-CRM114-Status: GOOD (  11.61  )
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

Remove the "ret" local variable from ufs_mtk_link_startup_notify, as
it's pointless; in all cases it is assigned, it is returned right after
without being read first.

Rework the code to just return directly, and get rid of the default
branch while at it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 5cddbdb1db40..0842522cda51 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1500,21 +1500,15 @@ static void ufs_mtk_post_link(struct ufs_hba *hba)
 static int ufs_mtk_link_startup_notify(struct ufs_hba *hba,
 				       enum ufs_notify_change_status stage)
 {
-	int ret = 0;
-
 	switch (stage) {
 	case PRE_CHANGE:
-		ret = ufs_mtk_pre_link(hba);
-		break;
+		return ufs_mtk_pre_link(hba);
 	case POST_CHANGE:
 		ufs_mtk_post_link(hba);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
+		return 0;
 	}
 
-	return ret;
+	return -EINVAL;
 }
 
 static int ufs_mtk_device_reset(struct ufs_hba *hba)

-- 
2.52.0


