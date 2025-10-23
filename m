Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE0BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 19:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqLnB78neSi6OXDSm/nO57Oj4cmBaz+P1PW4hSeUDCY=; b=UXJXQ4ilSxIZ99wZRlGMPUTvcF
	DfNGOJp8J1gGa3KQO4evDAqq8HgxNHF57oc7hlGxgrD43X4sgF2CFie2qZCPXXlu2oTliw56WTMk2
	s2ad8J0K0Z2LpcO5SOkzCx3bHBNmaeX+9X0wvm+RMiEsrz09e44J+sJQIdPixECQnX/13xDQUhMS/
	WArbHrJ1CNrgluFzMzuaO8WQRNtmLFS2AR55s1JdWgOY/YrugEOVHLieZ0icyxwA86volVV8GS5YQ
	KwvK8VCLXZVNnZUoRPYOgGJyv0CpDKxPty86T8+zix5FxgmyWGm6z99XFnFUoEocO8h//o0v/oqwl
	LwyuUi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1Ms-00000007RpQ-0T32;
	Thu, 23 Oct 2025 19:53:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1Mp-00000007RlI-12IK;
	Thu, 23 Oct 2025 19:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uqLnB78neSi6OXDSm/nO57Oj4cmBaz+P1PW4hSeUDCY=; b=Li8VyeqQFzHCzPcGSdgUoP4rsD
	scZcJG4GlYGFG3F31kItQzAG71HFgqvJHYZB9YCBf3tTWeaCOtXOvOCXlqOSc71MMloxCvOBzcTVO
	rXPm+57tbzizhWF9d/E0KjDT79Fw2kDCYKLg595UAQX3Koh7jxPBZ+Z0gw9rOUNTE2AJo/F8GCKiH
	po0dPIx3zo7IOC34LcOw19WqZITbrgfeUH6Ml7YJdY3QpLFHV7WhFHrI+dBE69y0fOh0VE1AwHDWu
	Qzid4n9DzU3ElR5foDb985U4MAWFmYg+pJQHZdILMkCl60skD590MmB6x/kWYW2IjdI9KdrgYB90j
	AWfEz+cg==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0V7-00000001gSD-2NcX;
	Thu, 23 Oct 2025 18:57:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761249162; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VDR01vSCP6/d2x3JWBeIXcm/obWd21GdvcoOT1oDD3u1LpCOExNV2RVCtyjZzxEoer+JwQLN76ABjNzNKhrR24GbLeCYCFlt5DOuvdkhF49oeNHVETaUx0HODTPXHDYKb+/EVcxQB1BA32scoLtZMsWuex4ZkVppWyKcBQ9L9bk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761249162; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uqLnB78neSi6OXDSm/nO57Oj4cmBaz+P1PW4hSeUDCY=; 
	b=hJCURP6gO9NAdmEcVyWowbmXcSerqqJ0BKwBHOZFa0MIJ49OJdESThMh/j7c15csbkx17X89NDoiwZ2msC4vBkKPPSPLpUGFd3xhcvWpPZHS6CqqaEwrKGDLdmwVPV9b8fI1h8fnbiNkQNXkXwcLSs9BHHNGMMl8VrX9UEnhUyQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761249162;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=uqLnB78neSi6OXDSm/nO57Oj4cmBaz+P1PW4hSeUDCY=;
	b=WJRUPPwNg+Itu0vdCkczL1rirjBcaDYTIy3Cr/Q3QDob5UYk6/nr8oj8kQDwmiPT
	EgJ3Dgu1BnJB5zGUc81d/NmVot3XscJpseC8nAb8v59Xs6o+yNmH9F54vdvn7JYycGa
	iObirYkGSTQ2KLTLTD85XuyGVQ3WkSiCX9yUza3o=
Received: by mx.zohomail.com with SMTPS id 1761249161979886.3318559681989;
	Thu, 23 Oct 2025 12:52:41 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Oct 2025 21:49:42 +0200
Subject: [PATCH v3 24/24] scsi: ufs: mediatek: Add MT8196 compatible,
 update copyright
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mt8196-ufs-v3-24-0f04b4a795ff@collabora.com>
References: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
In-Reply-To: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
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
 Mark Brown <broonie@kernel.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_195730_000541_444DB140 
X-CRM114-Status: GOOD (  11.23  )
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

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 932d1fdfdc65..49ab92acf3db 100644
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
@@ -2202,10 +2204,15 @@ static const struct ufs_mtk_soc_data mt8183_data = {
 	.has_avdd09 = true,
 };
 
+static const struct ufs_mtk_soc_data mt8196_data = {
+	.has_avdd09 = true,
+};
+
 static const struct of_device_id ufs_mtk_of_match[] = {
 	{ .compatible = "mediatek,mt8183-ufshci", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8192-ufshci" },
 	{ .compatible = "mediatek,mt8195-ufshci" },
+	{ .compatible = "mediatek,mt8196-ufshci", .data = &mt8196_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ufs_mtk_of_match);

-- 
2.51.1.dirty


