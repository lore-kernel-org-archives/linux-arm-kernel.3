Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C0BD3C932
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 23:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L08jHXpXjen58cg14Adrr2f98WJp67FFgA9qD2YXBHU=; b=WnaHLeMZ0+u+zOu/rBKNvyT2hZ
	nkBlhQ0ZOMJn6wHQJGPkaWcAumPBRqI2tI1qLuBk0pm2RoqsfyhwHlDlsGPI4f6LscBtvHYQ8l1O5
	8ytGMAYk7bhwSLx+2gPFT3oIMypkQXG5UvqeOM3HGd3DFdKq0vwGQ6GjH7T95e+XRGk3KX5NHEfOd
	/B6uED6FYQKFyGQT6lB/cyk6jM5TSNW8hmIryQd6JgqDbZIJHUCO7aOF/ZiJeGNYsS9RE1BLyAZ9z
	Td5ehOKzAmiufjxGroy7ED83zPvYqqQ4VemLK3QvSx9rIQ01mcqEDydoMMeuk9mUr8/DAX0ZOLYvd
	MKQmnJjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTTUw-0000000FyJ8-09o6;
	Wed, 10 Dec 2025 23:21:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTTUt-0000000FyIo-379s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 23:21:28 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so1947465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 15:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765408886; x=1766013686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L08jHXpXjen58cg14Adrr2f98WJp67FFgA9qD2YXBHU=;
        b=KQLOQLBsF1dAyQzU/5DEpGfVHdP6ImXx2HUkjA0YOHWP3LQlpjaOfswOB7OANALfjN
         F9uNHv1xRWUkykNWCJB88d8CobZGGXlLo7zSXIpQSWZL7xaai5riCG4n4eJgdcfHBj81
         /vv5TjuJtQHNEKVBJhlNQauVpETGBmSV9XWBXSzy2WhDtnKbwUYZF5+w7YJBMUwfbt+z
         sCh9ofgaCV1bvSzJXtmcIcd88t5HOT/otH8ZssAxGTLX+3IgGpPfVT1Ojy4xFpxxnLyo
         keEAyos0TqcLO2NBt9H2CBP7KS//BLM80rx34ixclruBB1PsWogXzn52w2CL9+JAZ4Vn
         jTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765408886; x=1766013686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L08jHXpXjen58cg14Adrr2f98WJp67FFgA9qD2YXBHU=;
        b=jgxcCatqk/v0iJPCw7dqnsWNkpw+/5LtCt0AqhE4lPeqkrdu2h+H1BQ2aUR8QPNQKI
         1cdCXtu+NOm72mpwuihHW4AhJbzM08KLB+oLVudtHsUQ7Q/jh5xEb6vovi9KKdcwP2Cl
         wokoz71MdciqhDLv/+tYildhDZmv+uG45x8f186/mVz55eUiPNX625zBrKly2zFox9CZ
         fReTrb9X81JOO3wuPSv8yah8F+5n13MX7TSU/8I6d/ltBvgQPPln0bEgEIaVfj4857/y
         3GSZk32rw8Nfe6Q+PD8XVOUuRks2Hh8OLhwZPWjmKMTza8npC8Eeryx8mpiLXYdTj9Fa
         gNrA==
X-Forwarded-Encrypted: i=1; AJvYcCWX5soEGWeGEkx3gSN7LObsqvhNca6OtFoHb544pqsaCbTwpZFtfe9bMkFdtdaodUvLE53D/IHD/sy3JVKRG6nV@lists.infradead.org
X-Gm-Message-State: AOJu0YwUltAGkMb8In3H2ZipLYVUilIe7MGkTfIMMTM0N/4ZjIyKZpDf
	hquyewKJGl6MrPLnUHrFZdVTneXUW+SEBOqqE6DFxHxH3JTHMLK6w/uO
X-Gm-Gg: ASbGnctReNmZ2zkh6xg75AkTCy48hUc2PuHZb2oRQRpmjZNyPtE3JGe7LGznHClIQlP
	FzA/m6545FKvzWybJY2VB166Si5d4ErqaGB7+absCNgyd/V5ytzDHtdI7Rov9M2krBIgDn2Pj2d
	5F8mP8o6/OWagUm897abW9y95l8P0c5Wbj5AqJ9kV2TdeHcN7iwCapQEKf5+h5uLcMtQrWhGLS1
	J5KkxL3eURHlc1lMg6wTwtNJWwZdmBP5nEBu1JhG51knzkmvfFLjt200iqAHimbEVxDbGribOTe
	prC7ZEdvtCX2VJyroWoq+eNgwjJw4Fy10Mg0IKot1FFJ9Eajf40pZ8YGcHRQ3wJJJT02hwth4Yb
	+cf2EuFMVDhLMbyQW3xkVfFuBQwrvMKS37s17swvaD2JX28MtBDKC1dR8PZZB4TcYEWgmiExLFL
	CPdZ4RFPODsVrsbbetupcZPhjL2gt6LhtwAQ==
X-Google-Smtp-Source: AGHT+IGHScSlL9cu47vMGSsn/jos8nO6lMKdreWx01YeiMB6yIIL90yCPe3N5A1FoFFavDktLuDS7g==
X-Received: by 2002:a05:600c:1c93:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47a837b9a4cmr42271815e9.26.1765408885028;
        Wed, 10 Dec 2025 15:21:25 -0800 (PST)
Received: from dev-linux.homserver.local ([51.154.248.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a89f742a4sm654425e9.10.2025.12.10.15.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 15:21:24 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Neal Gompa <neal@gompa.dev>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Bluetooth: hci_bcm4377: Use generic power management
Date: Wed, 10 Dec 2025 23:21:09 +0000
Message-ID: <20251210232115.547729-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251210211728.544677-1-vaibhavgupta40@gmail.com>
References: <20251210211728.544677-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_152127_818376_C3434A7C 
X-CRM114-Status: GOOD (  13.09  )
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

Switch to the generic PCI power management framework and remove legacy
callbacks like .suspend() and .resume(). With the generic framework, the
standard PCI related work like:
        - pci_save/restore_state()
        - pci_enable/disable_device()
        - pci_set_power_state()
is handled by the PCI core and this driver should implement only
hci_bcm4377 specific operations in its respective callback functions.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
v2: v1 has a typo in its subject. This patch is not part of a series. So
there should be no '[.... 1/2]'.
---
 drivers/bluetooth/hci_bcm4377.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 45e6d84224ee..925d0a635945 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2416,8 +2416,9 @@ static int bcm4377_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 					hdev);
 }
 
-static int bcm4377_suspend(struct pci_dev *pdev, pm_message_t state)
+static int bcm4377_suspend(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct bcm4377_data *bcm4377 = pci_get_drvdata(pdev);
 	int ret;
 
@@ -2431,8 +2432,9 @@ static int bcm4377_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-static int bcm4377_resume(struct pci_dev *pdev)
+static int bcm4377_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct bcm4377_data *bcm4377 = pci_get_drvdata(pdev);
 
 	iowrite32(BCM4377_BAR0_SLEEP_CONTROL_UNQUIESCE,
@@ -2441,6 +2443,8 @@ static int bcm4377_resume(struct pci_dev *pdev)
 	return hci_resume_dev(bcm4377->hdev);
 }
 
+static DEFINE_SIMPLE_DEV_PM_OPS(bcm4377_ops, bcm4377_suspend, bcm4377_resume);
+
 static const struct dmi_system_id bcm4377_dmi_board_table[] = {
 	{
 		.matches = {
@@ -2541,8 +2545,7 @@ static struct pci_driver bcm4377_pci_driver = {
 	.name = "hci_bcm4377",
 	.id_table = bcm4377_devid_table,
 	.probe = bcm4377_probe,
-	.suspend = bcm4377_suspend,
-	.resume = bcm4377_resume,
+	.driver.pm = &bcm4377_ops,
 };
 module_pci_driver(bcm4377_pci_driver);
 
-- 
2.51.0


