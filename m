Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C952EC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 06:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6pfM6xEo4INvwse6gyrlBAaMdMxHVhvCkb2KpLjGTA=; b=kYL8JP+sBJ4R1AIbfVYISbWyjB
	H7w1b04QVImLd+YJpM01ZU3tSGXNk/v8jOYhWcjTsY7qykn+iwwi1d9iA3nqAgSX64OBqqdIYybvY
	rkF0rJHhBtEYmQ8Pq8xcMuGGu0lFPt4gGXNril9AHktIaTJgGMHFgVSxqJkymrYoVcgBHiN/nF6dK
	Gb9/sqFaRBCpdpSzOtqztY7E9F6tL1AD/4Q/FuRcsp1Mf+PsC1eq4QGBW2N2ie9Vlw6l/E8SEciAk
	iJiNnpItqeFmcpY2VgD7E9oJJiNFlGLAnuKvOAaTgNXJFLlVk5biJh9tO0bdtNITJ8GacWb6WvlUm
	YEjkTtEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20p1-0000000GTOZ-1HOd;
	Thu, 03 Sep 2026 06:21:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20oy-0000000GTNI-32s8;
	Thu, 03 Sep 2026 06:21:13 +0000
X-UUID: a601d89ea75f11f1acbe4559397dec65-20260902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=a6pfM6xEo4INvwse6gyrlBAaMdMxHVhvCkb2KpLjGTA=;
	b=dyDMGbzChpduyyp3hgO9YdMkrIkQrIfRXn+9v8DU5lf8VMm6AQsV3dlE2iAFOn6LqEAiaJ5uYtsMnZpNi1NmxWSYpNuXUe64xdudGcQYOsDzFssscNXDj37a/WB2G0/IGaCmMBE/KVsnKOjippN0OgrKX9P5GfjoLMyrM7Bcsds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:096d36e6-4ccf-4901-839a-41a281912bfa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:fb4bc50b-079b-435d-86f5-6a8271106506,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a601d89ea75f11f1acbe4559397dec65-20260902
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 65785129; Wed, 02 Sep 2026 23:21:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 3 Sep 2026 14:21:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 3 Sep 2026 14:21:04 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 1/2] regulator: core: Export helpers used by regulator couplers
Date: Thu, 3 Sep 2026 14:20:46 +0800
Message-ID: <20260903062056.1024263-2-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260903062056.1024263-1-justin.yeh@mediatek.com>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_232112_783522_33BAB80E 
X-CRM114-Status: GOOD (  11.66  )
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

regulator_check_voltage(), regulator_check_consumers(),
regulator_do_balance_voltage() and regulator_coupler_register() are
already declared in include/linux/regulator/coupler.h for regulator
coupler implementations to use, but none of them is exported. That
limits couplers to being built into the kernel.

Export them so that coupler drivers can be built as loadable modules.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/regulator/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6a4008f387b5..6b7e613fbaaa 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -462,6 +462,7 @@ int regulator_check_voltage(struct regulator_dev *rdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(regulator_check_voltage);
 
 /* return 0 if the state is valid */
 static int regulator_check_states(suspend_state_t state)
@@ -502,6 +503,7 @@ int regulator_check_consumers(struct regulator_dev *rdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(regulator_check_consumers);
 
 /* current constraint check */
 static int regulator_check_current_limit(struct regulator_dev *rdev,
@@ -4468,6 +4470,7 @@ int regulator_do_balance_voltage(struct regulator_dev *rdev,
 out:
 	return ret;
 }
+EXPORT_SYMBOL_GPL(regulator_do_balance_voltage);
 
 static int regulator_balance_voltage(struct regulator_dev *rdev,
 				     suspend_state_t state)
@@ -5797,6 +5800,7 @@ int regulator_coupler_register(struct regulator_coupler *coupler)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(regulator_coupler_register);
 
 static struct regulator_coupler *
 regulator_find_coupler(struct regulator_dev *rdev)
-- 
2.45.2


