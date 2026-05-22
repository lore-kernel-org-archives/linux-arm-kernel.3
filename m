Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B57BCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mJkyipvc3IqDM0RSCkuAPvsrzuqXuTst7xaupG3y5v4=; b=xm381m81fnggJKTTdFZcEocbWH
	vaJQjvLThgVi3UGdGE/T8nOmUd2o0ciR17ZLxj/1kftS/V4uL5Kl0E7VvGDWNsAsIW3ivlR1hBY47
	gP9+rBL/l5ZNhoEBJ9nqGBl0IL/ojlQEiryc47bXwpnotGncqVE9uWalsqH8q2TGTWdZA3XPurLy5
	AYn7kkVEBI3I012wXSJLeYFV/Fuvg9hVqIFiabfV+Stmdnalmnr/riAdm8g1fLewb5VUelDDft27d
	fZIKJHKAaaKQmv/9NHNgN87qUDu3HDcS13i8g9glA30LwvpiysJe/Q0ZzIbxbKZJO4XGqTWaMZUmS
	IefVZx3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKFt-0000000A4rQ-2W1N;
	Fri, 22 May 2026 07:25:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKFs-0000000A4r5-2NuU;
	Fri, 22 May 2026 07:25:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89BBD60219;
	Fri, 22 May 2026 07:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54E41F000E9;
	Fri, 22 May 2026 07:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779434711;
	bh=mJkyipvc3IqDM0RSCkuAPvsrzuqXuTst7xaupG3y5v4=;
	h=From:Date:Subject:To:Cc;
	b=T2i9SoqpC9ZJTEwxxzBRTBIa6nUIDPM9hRClfW9Vn1R1J2kMTyqyseFRzdlcfpkXt
	 YXRd4WbTgS4TYJget+H0U1pDJkHj43b4+pXNK2IOSXELWKYsPQ8YRNOAGEsBDJPQap
	 khJlKlIR4NvWyFBeu12k/Z5wgPQPwUaKvs1iYlKudy6udzX7Y1QjQMAcJJiRtiOVSz
	 cjq8HJ0qxYp8pSkAxNZcHVU5hHj6GLIJI4YqJTVjKoHWLS+hMn0m3+t36SWizN9CEm
	 skbodHXNJTPhhJYXIZbT2iJ+WOjukNsh5zIOqih/KQxHU4B5ofdh8/1gGlM6Uro742
	 Xgz4V+MFxCP0A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 22 May 2026 09:24:52 +0200
Subject: [PATCH] wifi: mt76: mt7996: remove redundant pdev->bus check in
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-mt7996-pdev-bus-fix-v1-1-c91716484365@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G4gR6/IV8aA2ag4utFoE8e8Wj
 zMw84AXp+KhSR5wEtTrvkXI0gTGpd9mQbWRgYkNFcy4nmVdGzysBBwuj5PeSNJnOfFE1lQQy8N
 J1P+17d73A4IpCSRlAAAA
X-Change-ID: 20260522-mt7996-pdev-bus-fix-0ea1302f0d68
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-wireless@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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

Drop the unnecessary pdev->bus NULL check in mt7996_pci_probe() since
the pointer is already dereferenced earlier in mt76_pci_disable_aspm(),
making the check dead code. Silences the related Smatch warning.

Fixes: 377aa17d2aed ("wifi: mt76: mt7996: Add NPU offload support to MT7996 driver")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
index 12523ddba630..b7d9193e042f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
@@ -141,7 +141,7 @@ static int mt7996_pci_probe(struct pci_dev *pdev,
 	dev->hif2 = hif2;
 
 	mt76_npu_init(mdev, pci_resource_start(pdev, 0),
-		      pdev->bus && pci_domain_nr(pdev->bus) ? 3 : 2);
+		      pci_domain_nr(pdev->bus) ? 3 : 2);
 
 	ret = mt7996_mmio_wed_init(dev, pdev, false, &irq);
 	if (ret < 0)

---
base-commit: e9aeddfe98ebccd3761ac7dd316af4fb5de1c28a
change-id: 20260522-mt7996-pdev-bus-fix-0ea1302f0d68

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


