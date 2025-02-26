Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFDAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVSwZvqHp4KclUxAlGtZReiZmGLJRUAId7nnJAavdso=; b=EuWV1BZOrohniv8rFtem8/4i0/
	k36PQv9S/vOUjJ/kRBcSB12bUhH+Uljbu8Zwj49m5RMaOJStTEZLf1MUJ19NUC5jOZpd4IQKBA+Fj
	JiEr5adbJWphVIFrnnn054EKeet5Xb7t36vExI70fsjr4vRJVgyx8pL3Ib0eVDWcehJeix1AzfR94
	2cbBuzvnH4jOjBumVdp4ruK1GrIgmdduLsHa5BPZu2fiFURuuMyC9om0Nf70YbMrNIOKFm/qs0Od7
	X+7g/xanoAOajapL2SCLFshobGYbhec9f55sWIR/ksZRNw9Bw1XGxXN62qpsu/JNRhBKfGZObdBlo
	bx5whBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPlp-00000005aoY-3C8g;
	Wed, 26 Feb 2025 22:20:49 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPW4-00000005YAp-0HB2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 22:04:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-223480ea43aso5837895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 14:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607471; x=1741212271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVSwZvqHp4KclUxAlGtZReiZmGLJRUAId7nnJAavdso=;
        b=gHDWjI1BL7G18W4Yu2PEUILaGOE7WdUXKjUBA5MdoZTkl70rz8OSHon5ae1FYqAvZg
         7qm6GPUDfgc8IbH5SIYWTZo2mKD8f9QvrKVPaAzgNQjN2pDLCFG4wVVFMiyZDCwLZYpD
         ygae1NdPx69mh/e+cqV21pM9qoTxOIHjgItWAzYkVqrGIVs/BhYx/uLClYT3XlNKu0Ey
         cO2AvKRxHEy8WXs3OmnMLZ7f0i2vbd47f3QMS45lLTSUJQjGUl8AJI/K9OXOR6fj2iUi
         9Uc9Hro7yX3tXuG30EnJl5QLC6mSgkSCJFNP4vdFO0jqg4C5bdFXxX2nkFvZz0r5Cjm9
         48iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607471; x=1741212271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVSwZvqHp4KclUxAlGtZReiZmGLJRUAId7nnJAavdso=;
        b=JD/HYkhBxqMHhpejy6D0VjILhG34KAH1PsgvvbH6gMoM4UROkcIzC0pRLA3rxd94jX
         3vJ5daJ/DV93SduuSIvzb472qAAvKJjVRiBAk/wTVvwjRmpUYg2evKjMi2Syzc0BRJGq
         xnm6U6pXKyLxltuLJUPEUfBGNGuW4iDj75vxkyLbx3gZpgTSFJCQLtbxbFfBD9Cm72x6
         7rJ7Teos2vIS8vyhkZ8eMhxIdm1rnliDOajAcUliGfpllHBKqGj/nIRblnrsa247keZY
         BV2F4EedE9tpRJLYWXHE/YJN8NZINVxZqQJXLL45supPI2hpHdZUr6mgH6SUc8Cj/HDQ
         fsow==
X-Forwarded-Encrypted: i=1; AJvYcCWb8elJuBmbaAp+iYCncmowg2KGhxruGMFdKSk6TV7nyLcBdLqS1oc+PszAnm64nBb0oTt47eGycQMTXVAV0nTH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8d/JeHk3Yuld77s8fIh6RCKcMLNwHAF9X6kcRSQKp9bOWOQcn
	+bHdqxnjv3f2o23SGB1IqBgOhiLefiwFUNZENDKEfkDf5gG2A8OZoHdczBPakE0=
X-Gm-Gg: ASbGnct3YLeTg+gXeFGANPue3JDLrSECAmBgGEdcW+Itiu2fnsCLz6D7yKiSgD3ptk0
	a8gFNAxuuYzU5L9xAYHOzZLFUgwEGHi+fDxTzVRYVHXKg0C/iy5ujR7/4g9yCxUlBuybH5SwMBr
	If/Z7eEfJsqGB8cPODbFzlfY0AkaTwxi4N6QAwCCtK2cj4W18uVFgZWFFTl7rSmdAgONDTwptG5
	u9MYDwavbgZlR/6UT4nrVt76NhJaVUsvLJzYavJZSh0P1jWle7axc/Fa5AW6YcmamUG/iDirqgL
	tXB3JywXmAJVB4Si4oju0osNH7VZPL1aDmtHwIgAtvKHSzDLWm0pASwe
X-Google-Smtp-Source: AGHT+IHv2DLo5yokOufzr6ieTPFjBCf/BVk00fjUAV4YbzWaoAbBY7sSAOQrP6QEylsN4Iqip6zQ3Q==
X-Received: by 2002:a17:902:d2c9:b0:221:f61:14c3 with SMTP id d9443c01a7336-221a0ed8294mr315855585ad.18.1740607471584;
        Wed, 26 Feb 2025 14:04:31 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:31 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	krzk@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	ebiggers@kernel.org,
	bvanassche@acm.org,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 6/6] scsi: ufs: exynos: put ufs device in reset on .exit() and .suspend()
Date: Wed, 26 Feb 2025 22:04:14 +0000
Message-ID: <20250226220414.343659-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
In-Reply-To: <20250226220414.343659-1-peter.griffin@linaro.org>
References: <20250226220414.343659-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_140432_105782_951E9AA2 
X-CRM114-Status: GOOD (  11.21  )
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

GPIO_OUT[0] is connected to the reset pin of embedded UFS device.
Before powering off the phy assert the reset signal.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 4c3e03a3b8d9..64e2bf924213 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1517,6 +1517,7 @@ static void exynos_ufs_exit(struct ufs_hba *hba)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 
+	hci_writel(ufs, 0 << 0, HCI_GPIO_OUT);
 	phy_power_off(ufs->phy);
 	phy_exit(ufs->phy);
 }
@@ -1700,6 +1701,8 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	if (status == PRE_CHANGE)
 		return 0;
 
+	hci_writel(ufs, 0 << 0, HCI_GPIO_OUT);
+
 	if (!ufshcd_is_link_active(hba))
 		phy_power_off(ufs->phy);
 
-- 
2.48.1.658.g4767266eb4-goog


