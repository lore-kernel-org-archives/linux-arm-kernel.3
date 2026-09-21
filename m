Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53A0C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rgouXHW55aIbAEz+yxgGnRtHE3IVMg92WaPFZm2OsIo=; b=i5nEtnxUowObkwdSFqA1CirT30
	ui3kPOZOGefg1GqL9lfMAGiRIBFnRFucUaNRrj2vEj0ulg1Q2lFkUx9zcGbrWhqapzt6f7eEuwlX6
	k2Y+IGA58Xwf161RmBhsrI+fMQKoqdp67JOSDlLh1ocpXvc/WHP834HjIQySo+QmqJAL63O1N97AH
	SFQWn8aYRJjgQb2sNCJ9W/VtttIb1GNTtAYPGqNNVz+ePJhIj2MSxtECPI5jBxEnXkbYdvoGKD7WE
	QFThYfLXr6aHkDAuQ5Kjb8uaryFLzEe3UINnm21qR/JsVRe0N4WfdoUVCAaHRHPIyOJjgz+n7dJWK
	hpeHkC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jSQ-00000003DAf-1xCY;
	Mon, 21 Sep 2026 19:13:42 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jSO-00000003D9x-2vYN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:13:41 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-91205165f71so22225236d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790018019; x=1790622819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgouXHW55aIbAEz+yxgGnRtHE3IVMg92WaPFZm2OsIo=;
        b=tNbuP18+ggdvHeod17x1GzIxVCEV4OVFmU7piyxZgzmp+DgiwKtrvbvWu8zr9NIDZ1
         exf1o0kC39E4hB7svOCnHkvIghw4uhCbD2dc2XemuAQndf053nj6XSBR/JNHpfl93fg6
         KYxz8UQiK6VuOCO52C1acdm2Givxk1uHIy4dIEYs+v2p1SNrQEHyV57h3ENhs1uMh8Xe
         6T/oy+k+chvtT+exCyNXbKuTVtnuXOGw66Y4Yof+Ge+MT1TjhLiVmareZOVrvYRX3I6Y
         mjg42kV0586oFEPU+BD2pNYKTVb8/fj4i4kT5HXR9B6xTuLAN0mSJvnLYn0YuFl3xe0B
         8S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790018019; x=1790622819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgouXHW55aIbAEz+yxgGnRtHE3IVMg92WaPFZm2OsIo=;
        b=swKuCFE9svEKt5YohAkTB2H/+mhIH5KjlSpNerWkO7+H//6V2RfI8/1vxHXar5ZQ4P
         e3bETr71qOjlZTeuFEtKgehfilv8Gd0MDQXA54NXs2NGs6+lVwDTktlMn0LWdJGDXmbN
         JgiQ15H9Y1vYQ9nO6d8jBwQE/zNAVx6G9iVREUZff2ubOe0u7mCTvXKy5nT7ewz2GSDu
         EdfmJkm4cLCOCe/w4tshtpjBXOaFAwv+tjNxDs4979yfbuzjPUahvMqv6d90p1kkseDM
         LWyS+L7x7KDh5YRTdh4fZ2wMryXf8GU0PdcdXScRDjZDg5Zu/LycOPdAQknWQ1FFG2vi
         KFQw==
X-Forwarded-Encrypted: i=1; AKwUvBxquhvxwm3YgIGHnW7X3CoZ4nZ8n4TsjoGE8HpcKufujHxCwAeZHdPCTV8H6LDr8WyTUOZ+OKhnfdr+SHPRHK9J@lists.infradead.org
X-Gm-Message-State: AFuF++kSfcfc1HaCbBjlo9vmXyltBdelPzovEQzK09oNNG4U3Fkk2hTk
	QgcoCasHsKaeSXovzd8qjNu2EfKCAPl5VzjMTlLN4ZdC/xuFDqbRtaEr5vos953WJuXMX2YmLWz
	42SZgCR6XHf6IMgLFcoDikWmRchtVQuQAX3JCSj6l+Cu39pQptZv1WoJg10ZgtGHVkyE/yQ==
X-Gm-Gg: AYBFou1e0nO0+tpeM7wVHY7ZxV9VUt3Pkzha7MCrg7y2U3nW2mJklixO6LBj8Hf6XGC
	0mt6HuMfKuvbq6H7KYLFvft7mTSrLUK9x8tM0IC1SSeZJpjycOXtNCuuEe9g5ZKiMcmqVfQ1TF2
	KWQuT4WO+o4PutVm+PKWFAhSmwm46H1fFJJk6WTSiKnJVd2rINi9cv7FLpZUxIhOEbIxESTDQy5
	2OjO7m1Fd9aW60oqRKNtvV8TADwHY3OXoAd6jZqkaFTrdhewzuRHDNLjR7Em2cGx9TKIm8rvP0y
	1YQGgBChtFxOHSb+mwyo2ADctk7OD0qa/J65XXimDsAwE5mjIRp30PDAhJplVX+J0xSnC9Joz3X
	aHAVuNcG8Vo/BTb3W2cFwZyPry6xZ1zdFADGky5daruS1i+rdu2TsZAuDxQXEmCZ+eZ7O04rh99
	60m8unkZVZEVN/6wxxSduS0Ai4BvjRPjonpOFaMCBeULuBdu8Hvoi1RBkLZsa2U4eAZsDDyM0c9
	A==
X-Received: by 2002:a05:6214:19cc:b0:912:12cf:f6b7 with SMTP id 6a1803df08f44-913fc8a23f8mr21513036d6.7.1790018019138;
        Mon, 21 Sep 2026 12:13:39 -0700 (PDT)
Received: from strozzi ([66.193.28.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a61570sm75443526d6.23.2026.09.21.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:13:38 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Sean Anderson <sanderson@brivo.com>
Subject: [PATCH] mmc: meson-gx: Convert host->lock to raw spinlock
Date: Mon, 21 Sep 2026 15:13:08 -0400
Message-ID: <20260921191326.2146363-1-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_121340_750976_D1932D23 
X-CRM114-Status: GOOD (  13.59  )
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

The primary handler for IRQF_ONESHOT interrupts is always run without
threading, even on PREEMPT_RT. Therefore, we must use a raw spinlock,
which will never sleep (even on PREEMPT_RT).

Fixes: 066ecde6d826 ("mmc: meson-gx: add SDIO interrupt support")
Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 drivers/mmc/host/meson-gx-mmc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3f..d5365c0404cb9 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -176,7 +176,7 @@ struct meson_host {
 
 	bool needs_pre_post_req;
 
-	spinlock_t lock;
+	raw_spinlock_t lock;
 };
 
 #define CMD_CFG_LENGTH_MASK GENMASK(8, 0)
@@ -953,10 +953,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	cmd = host->cmd;
 
 	if (status & IRQ_SDIO) {
-		spin_lock(&host->lock);
+		raw_spin_lock(&host->lock);
 		__meson_mmc_enable_sdio_irq(host->mmc, 0);
 		sdio_signal_irq(host->mmc);
-		spin_unlock(&host->lock);
+		raw_spin_unlock(&host->lock);
 		status &= ~IRQ_SDIO;
 		if (!status)
 			return IRQ_HANDLED;
@@ -1112,9 +1112,9 @@ static void meson_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
 	struct meson_host *host = mmc_priv(mmc);
 	unsigned long flags;
 
-	spin_lock_irqsave(&host->lock, flags);
+	raw_spin_lock_irqsave(&host->lock, flags);
 	__meson_mmc_enable_sdio_irq(mmc, enable);
-	spin_unlock_irqrestore(&host->lock, flags);
+	raw_spin_unlock_irqrestore(&host->lock, flags);
 }
 
 static void meson_mmc_ack_sdio_irq(struct mmc_host *mmc)
@@ -1225,7 +1225,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_init_clk;
 
-	spin_lock_init(&host->lock);
+	raw_spin_lock_init(&host->lock);
 
 	if (host->dram_access_quirk) {
 		/* Limit segments to 1 due to low available sram memory */
---
base-commit: 587858367581b9c55c3690f4e63382ad622719d4
branch: meson_mmc_raw

-- 
2.53.0


