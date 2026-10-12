Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A3BCA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 17:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yF/Iy3Hd3jJ7PHeSixb0MK6yhBJ3J2UORZlYHvOyz9w=; b=PDedcXOLlKLw+2qQsdHrOSPe3r
	Wz1L8rGgvau8MlKgr7CkwFKDca1wskNeiOH97PLHlcy0mwJeA/RTgh98fefb4S99EsnzADr8onnqk
	SJPznCSynFn3LTkKDa/afeJZG7sV7BPVEIr6ezw10Uu/y72N3lkaBgyFpNz3XJw2dJglwuUJhVcfb
	zbq8m+ubAUVD917O3Ml+YtRRw3NKMb+PWMWZODgZZoAjeeAPJhhfKBEZNqp0aMJniuDKjrqDRnLN5
	xTzgftb1ID3pb7KGNXXXNOyqoELRO5SCK+Wka0LVTvgCaKH5w4RnDhIayEvdOJ2o3zXy5qhuu9x4+
	slwFzCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJuf-0000000B7J1-06kk;
	Mon, 12 Oct 2026 17:34:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJuc-0000000B7Hq-3xMo
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 12 Oct 2026 17:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yF/Iy3Hd3jJ7PHeSixb0MK6yhBJ3J2UORZlYHvOyz9w=; b=k7CN9oAZZ7sneaiEwsPvA70FuM
	JDYuz1SI8lEIs7I2lzM8RGCb2Yd6cImxn/OCxskZiAbMaEAOjpSHzw+lL6m+mBZXRAjkGODNhlRvW
	MIjzI7i5AKngzRrdgn0IZ8O2eoZeo/mDnVyOlQQDgqcHRt1HyrihOMZ+b4reftYXtqeIpKQmSWdKM
	sRfMV2MX0RxgRSJGVwGmPBgSxEPX1WNsuUgQdjZtyLLzOJFXLl4oQz9eXUQj9VSJHOfDR7pz2F9/e
	M+925GpNsP0wqm5LCk3XR0FAtEc3s4uK+EiWbmd3j5YjvdhuEEys0bE5u7gM1FD4booo56iSR3+F6
	Q31nBzcQ==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGJuZ-0000000Ehml-1UAV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 17:34:09 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-88b7d853b11so1229234b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 10:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791826445; x=1792431245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yF/Iy3Hd3jJ7PHeSixb0MK6yhBJ3J2UORZlYHvOyz9w=;
        b=E45cnrxnQlGouqqTueDGUsE14BUz04uDz5DalDoiIA9x98lvsL12b/6W6H2nW9zKC5
         k7zosc19eZPF3bPWlj1RUuuPH/fVhsdEDT33j+w3Ixyqu3+N63/sOSyDhWgKSy6YZtFF
         9SUMkD18RKFHLtlNRej5xQ16tDRgIhar1Zhdt3UHNjmO147znPTPKYbLyb48+rL54BrO
         B8XyqN9S2betAPz2J5t+FQ8SrLbQMyt6oONGtspUjWjwDprmC+e4z/b7kblMqgd2e1Nw
         4ALhOWIuvvshU8/KqWA4+G9MeLRqQidGELkPZpgR7JqZPaPQPHa8IZHEmkhLOo4r7CFp
         OfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791826445; x=1792431245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yF/Iy3Hd3jJ7PHeSixb0MK6yhBJ3J2UORZlYHvOyz9w=;
        b=m+k+jHn3vWQmSI6lN2SQnrns4uFZFY+08A1GJ4vOWrEaqCZTo5Qeflasbyzbr86AI4
         OFgv7ekCkUpaAg/4Dnlod5mSVZJyG2AAslVDnNOZPWkJqV+LJjqZ/mEhvEmYiPWl06X7
         H6P0mDw5VzMKioQIGltleS38qzNBUdFH8vcrAkTUurt7/7bQad6VCfswo8uIV2HfCKXC
         rx/1Q9JKrYBW7www9ylVhpa+Xm3mO5m/BLon6NsbsuMQMVmlsUdsVe0KDsvgeHXosCQP
         IlsZ80VpWcMFrEcHXXjvpbJUTtiA5wwPHaA5Ham5q1N2JO6RvEarTQTpsAX18hkfmK1c
         VbCw==
X-Forwarded-Encrypted: i=1; AKwUvByKICJa51a3jHg/ozY2ZfA1+PHbYjmsYjwBaOkeDNq/ia0/N1unaYq/YR3ZCP+GehYtb8XDhoy9B721gEhobxyg@lists.infradead.org
X-Gm-Message-State: AFq9FYJoUZDgcoGk44YBmP3z5YWI5OXkc2lKLODJw7H2q22Ov1Trq7eJ
	tuHY2ajuZnJliQJpGNnh66P0xsiQq+xoG1JH+qge1BsfjEZJs07Wm5WnmJaAWnrz
X-Gm-Gg: AYBFou3nUPA5uqvCbm0m5JEZYucWG6NF31UGSctU/jlx/ywISkcPuqSYT3z7pDkOOuA
	eah/fhStUOLbCA1Vf1Ss6uaaTjd/1i9Sn0dZaJ1QtLQZ+hU3qhl8sg4qNrSovg0DoS+0xBfgIvH
	UOBj7/mqIHQnPtanPmE2cq73th9tJwmmfdIprYutJ9tdzBw+QAnBjf/8aVdMHkLoAkradjfXVZO
	rW9H7PQh6ikbFCD9t04zSBHwgwFgUaHfW7lXbAQnD54kCQlnn785WmrtQZ57o5uYf//qGhh1d0m
	sXSwkbJcpBvMl6tNiLXNHzjolg0QxixANLv8dMfAbm7pE5FcYJviEa9iYxMlCp/2nOPDUSnyIYt
	KdqIIaSrMqenW43bZdmEi3ISBlYt3xcezA3CmvuNDbxm4EyKKucjZLOplrRTh7RUMRvK92fK1XE
	R5mEW4vtKNgBc1+Lg8JTqqQqTXbun4KzQaAZHSyY4v6Z0pD5ZUyW4QJ3VTuynNqHQBZJ0MkE1hV
	Umj6u57fEbkIZHZeI0kPXdWiFCVoyeGY2z5y7fuDvJeYqEnofx4SzHRfqzTSW4XIYxkFDrfiodj
	cJJTbCSdXnxdj75qG5J8NnvWiidIo+9Khiy5vJjnjkL2CB1NUQ==
X-Received: by 2002:a05:6a00:e0a:b0:88d:4b30:1c11 with SMTP id d2e1a72fcca58-897c3efd912mr8494544b3a.6.1791826444565;
        Mon, 12 Oct 2026 10:34:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c49901fesm4166886b3a.57.2026.10.12.10.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:34:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek USB3 PHY DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek USB3 PHY DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH v3] phy: mediatek: tphy: simplify main allocation
Date: Mon, 12 Oct 2026 10:34:02 -0700
Message-ID: <20261012173402.24568-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_183407_476804_255501D2 
X-CRM114-Status: GOOD (  14.40  )
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

Use a flexible array member to replace kzalloc + kcalloc with a single
kzalloc.

Shuffled some code around as __counted_by requires the counting variable
to be assigned before any array access.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: remove of_device_get_match_data message as it's now stale
 v2: add back NULL check
 drivers/phy/mediatek/phy-mtk-tphy.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index acf506529507..e9b9e667b319 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -340,10 +340,10 @@ struct mtk_tphy {
 	struct device *dev;
 	void __iomem *sif_base;	/* only shared sif */
 	const struct mtk_phy_pdata *pdata;
-	struct mtk_phy_instance **phys;
-	int nphys;
 	int src_ref_clk; /* MHZ, reference clock for slew rate calibrate */
 	int src_coef; /* coefficient for slew rate calibrate */
+	int nphys;
+	struct mtk_phy_instance *phys[] __counted_by(nphys);
 };
 
 #if IS_ENABLED(CONFIG_DEBUG_FS)
@@ -1572,22 +1572,19 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 	struct mtk_tphy *tphy;
 	struct resource res;
 	int port, ret;
+	size_t nphys;
 
-	tphy = devm_kzalloc(dev, sizeof(*tphy), GFP_KERNEL);
+	nphys = of_get_child_count(np);
+	tphy = devm_kzalloc(dev, struct_size(tphy, phys, nphys), GFP_KERNEL);
 	if (!tphy)
 		return -ENOMEM;
 
+	tphy->nphys = nphys;
+	tphy->dev = dev;
 	tphy->pdata = of_device_get_match_data(dev);
 	if (!tphy->pdata)
 		return -EINVAL;
 
-	tphy->nphys = of_get_child_count(np);
-	tphy->phys = devm_kcalloc(dev, tphy->nphys,
-				       sizeof(*tphy->phys), GFP_KERNEL);
-	if (!tphy->phys)
-		return -ENOMEM;
-
-	tphy->dev = dev;
 	platform_set_drvdata(pdev, tphy);
 
 	sif_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.56.0


