Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A623AD715C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 12:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwwnmuAPN5C3mRg40eyyOITsRVUqtofDe576sNby2MQ=; b=Un2zhA+Zsx/OglpwJPHt1OSdm8
	c68CKZpnfGv9dYBqEOAIYEdNuqySvGwoakOye2vjN2yjoUDtEqZuF7KY7SgQEfEr4GXqIHg+05TK2
	ISarjqfi+Kf4NpSbMAY2j6uFisMAAWEHJm0QN9UPDH55I9UtqkIxkRtDVoPSyugqwlH6//Q4cNRzE
	HlhJvAAUm0JiMIW0uI7KIpKGX9Cwj5qNcS5CV/8/AXXVRJTkUcbQFfdRsIRtPQFy565UeRbPA31Fa
	wb/VUlGUa8Gf7k/Cp54ugwiTc/HvShSjQsOn1qp4RIA168aBtBLHdpAkzm5sfnYHUIbwpSIt8V+Pf
	pVq2BdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcNQ-0000000AEEe-1WgB;
	Sat, 24 Jan 2026 12:04:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcMm-0000000ADm1-3Etb;
	Sat, 24 Jan 2026 12:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IwwnmuAPN5C3mRg40eyyOITsRVUqtofDe576sNby2MQ=; b=jsWGyAu+iexuRKBpnDkPqjLZMr
	OPiQdQcn5BeWYvlzPhOunvtNqXQW+NBYysgHkeQG0eR4J0LZsCOIayrSphi2ZlTHn0nsyIIu4ENCK
	kKrs5WiBbgdm69uoXto4VV4DjN2Np5KIfgw6rwze6MIWxd0+XLgI3Qu8Vetm32l9avik/2yt8wYIV
	z9GrXroh5ZvuuFK3WbMvYUdrzhwug1sEKKZ0Lljst21VDtUCKdjY6YTWhxuNjKgrPSEv3IYRc/ZOQ
	s3rIU5/F94U47RkKjPq09CvYy6A5OIs8iLyGBk4wMlua1aIBEM9SQGneVqbYff+xzj6WVfidnwc9u
	skRHqzVg==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcMj-00000003V58-2Wrb;
	Sat, 24 Jan 2026 12:03:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769256215; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lwFDECibAK1lHQRqIM08/FjRL9i5IJ4Q4UuLAc7XCAkDk3cirCk7OyLsUXq2Nt5KwyGOTglGDNXxXcDsapQzliyeVDs4wwvImeHjnhiw7NRh4471rlqX4jznuuVT4D84agR329mSnF3GB7cvDkznDVWsUoDugKASQQTtDxPEfNU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769256215; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IwwnmuAPN5C3mRg40eyyOITsRVUqtofDe576sNby2MQ=; 
	b=QsZe1xEKvKTdz4tAOLB4qj4WAVIm+bv655YJSVDV4D09+n2m5I60mdsnhtndM7ppH/Bwx2L5dfwJ0vgAOnsQRZg+wcgVqXk+wvoQHLjnTrMuV/y20DO6HhlzOqGHzBRF3Q0Q8Yc0wBx6h8aPnueZH6V+72OiFXak+gbTLSWu3Do=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769256215;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=IwwnmuAPN5C3mRg40eyyOITsRVUqtofDe576sNby2MQ=;
	b=T+UpmyHThVANsaAZKUDKGfb+5S4zQDnrBRPog9OmrxsKp1py5ZGzJfxb92kjvGju
	TUnMe7os69Jw1RFT+BHLueZwfNeDm8DJNyw+UtIZxkcEb3NCvR3BufFtowM760bUOZg
	+F9h/ucFsDh9EqMDZ89SYwIqd65iJYTNJCzVwBvA=
Received: by mx.zohomail.com with SMTPS id 1769256213273593.3161087498282;
	Sat, 24 Jan 2026 04:03:33 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 24 Jan 2026 13:01:08 +0100
Subject: [PATCH v6 22/24] scsi: ufs: mediatek: Remove ret local from
 link_startup_notify
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-mt8196-ufs-v6-22-e7c005b60028@collabora.com>
References: <20260124-mt8196-ufs-v6-0-e7c005b60028@collabora.com>
In-Reply-To: <20260124-mt8196-ufs-v6-0-e7c005b60028@collabora.com>
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
X-CRM114-CacheID: sfid-20260124_120346_059498_57ED2636 
X-CRM114-Status: GOOD (  11.79  )
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
index 046e2f9bb6c7..e863e4f8af55 100644
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


