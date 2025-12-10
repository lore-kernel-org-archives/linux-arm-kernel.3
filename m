Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0357D3B9AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 21:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tOfFY77gZCltiZjkrHeQ4oE/3Skq9gP62li7AIVP3wU=; b=0c2JSmu6+8JDF9/iAyZxqhuuFW
	Xd4RdLz5jykmMQ9QhuJUCx+8lNj1+arf3gcKjZEkI+uy9wuvfP9dz/trnWmOPzEBYER7+jLZvInDK
	xlgm/GFaCzSIFHsF1BGjDWCaRYYLGjO9frjG3ezJN4UTjLDijHJtCFxLko5Jx5+UA0V1SfASbNZjN
	tCwoIQAhhjQAcHY9vccFZEu8xrb3aINOvXg/n9P8hOXwZt+j/GCP5L+uqSsuvzbeN4rtlswcwdUKM
	q2feqTlVdY3p/Gl/fOT31m+cJjLXwd4K1qXYv0fWI+OA42aL5dwe+Ld1efB8hSnFNnyqQLmECTu2s
	3M+vq+aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTRZ5-0000000FtYo-3evw;
	Wed, 10 Dec 2025 21:17:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTRZ3-0000000FtYL-21tU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 21:17:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-477b91680f8so2530255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 13:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765401455; x=1766006255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tOfFY77gZCltiZjkrHeQ4oE/3Skq9gP62li7AIVP3wU=;
        b=GwML5gtqmolJwSoE4UIj6B2NPpzyRMG76W7mZ/7akx1uGIo4h0pLlB34nDgcZv3Yet
         0k3+fyAAhKrTcC0PN45nYPXapQX3XkKVf7wSuT30QkGeu93RCafbCYmCn6UOo4Z4ZO5s
         dQP0xdu1E7AH16lDddwsRePLW153tITthhCACU9JxTHLRWZYeduwGAa+1CKQZ53FxB16
         oxMUBDWUlyi9VmVEjqfJL1MlR+yLMmPgwoEEmcGCdyR9pbhxX/mOMf5Ceb60vLjIQ2S6
         3pmB2R3FW25V8bfa6cpyMcwS/bO710DPWKtdY6Ppimq0vfFynoBJA2LLZDtNFDRmTns1
         a87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765401455; x=1766006255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOfFY77gZCltiZjkrHeQ4oE/3Skq9gP62li7AIVP3wU=;
        b=tLepNx0xRIagBN0zCj2BXwVxbEkwJPOQK7vIvPiW/hGqrvkUXu9pi+TFGXI85NZ3aw
         IAygl2KhForvM07lix0+PX+Qe4PRl87HeuIcg28A8Kdzb3GTEMJKWcdU7dO4tcLEmkAt
         fw7WvulfdVdvDWTub9Gb0J9/YTCVECuu9ujDHRFlu2w7isVDpRUCYoX17FkPRENC9cb6
         l5sDKxrbu//tCWG5krg2cJtv4YqaQaZMZrv1Z9Xqn87bsPwGlW6OabLTqYkgAwdyOd+d
         ivjTGVQThA0tf7qwKfV8vOk9R4EVjarxvQPHFhX5rQQpHwACRsEnbuTvI17Lg/E/9DQQ
         GFNw==
X-Forwarded-Encrypted: i=1; AJvYcCWu72wY9xHMDJ2F0ppOCiEIaNl0aNQrUNV/nNI28jfVqYyINuqTihwc3fKKA/Mbkoafy1YBi72D/3Zrk1AirlB+@lists.infradead.org
X-Gm-Message-State: AOJu0YyoVVBZYf6lzJNOyKAgjI5EAhBh2witq6GO5qn9xCUESGXRAWnO
	2fQ3fQ0+hgRrkd3cy0rBL9XE+yMMb4PzEvza1g+hqoD6iPVHN2CTihSz
X-Gm-Gg: ASbGncsRSWZPdC3QyMCQGuqmlV9ig6dgvIKozgHBO99U7QbJJ6kCz28bdeIsZ6gKqix
	RBq+Cctdp5eITGZNbGU0Jtes+bLXdEDPQaBQiFiKFHwTC9WR9QaiqEBg9ymPEqXowZ0zP0iDAn6
	kjL+pAsIkmoGqE1BaHsFgwsO0KL6TG+mn1GNwzcePIW+yKOFT4KY4VPr0AomcNUGWIDJ16bbrt6
	+oQng6lWjG0tGGmSC4FcvsR/AA9GyoYGYO5S4d2a91HBqiu14wkNL200LHgx2xZNTHOua+G9jhj
	OBpL2dEPBBu2KqQcFeBsc2zNdakaSRaDukVP6sH0yfOAsbHMFX4QjgjFDuBzOiHDn5NnP+iam7g
	kF5oOiw16nMEL3TdaxFSI/+2/S17/vFrFv2r8WOu2UKX3Em1FavihjFquEdmNMRHG7qdDzJGP9i
	Qnl2X4LxwnEbK+BsCzVe+sjGJa3rDO1CD2HbEbNuiOdBc=
X-Google-Smtp-Source: AGHT+IEllRKC6NDjpHfpSYxwBWFGd/XV/21Iks7SFysobBhsAwJQ/2swNyMn8d0YVqdg6M9x4r2d4A==
X-Received: by 2002:a05:600c:8b16:b0:471:131f:85b7 with SMTP id 5b1f17b1804b1-47a8375ab5fmr38139825e9.15.1765401455052;
        Wed, 10 Dec 2025 13:17:35 -0800 (PST)
Received: from dev-linux.homserver.local ([51.154.248.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a66614sm1113198f8f.5.2025.12.10.13.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 13:17:34 -0800 (PST)
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
Subject: [PATCH v1 1/2] Bluetooth: hci_bcm4377: Use generic power management
Date: Wed, 10 Dec 2025 21:17:25 +0000
Message-ID: <20251210211728.544677-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_131737_537278_713A3A8A 
X-CRM114-Status: GOOD (  12.55  )
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


