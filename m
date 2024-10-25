Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FE8D0C619
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Db/7vYWfVTvRELCJjsaav3g2wtQjNY/cZ7wO3qNfos=; b=b2rIskx6MUsq9IYkdlcXTd2JIb
	6B1hq9n9RFdlkkqnAvZuiaSvzDEWszWf3yIvsUzz6EtDZdgL826FwA4mb7unNrCdFxCQbRakKkAMb
	aBHmmiRzUw9f074vmvSta2iM5tYJdHMvUsXcz7jEU5tiYROdZ6IjtkcIHePqj0AD8us091v97kBjx
	XaDRiOG4Y6/kEHn5vOnxgD/pxg2IBsc6v+41I5aimXFLpJcHZElfX4+pqW97OFbpR9WEt5HqOKPR9
	nWtqCDl035oUkC8TL0c/gQw7nQ3/60kT8cWC7VqXaIWd17kJTYpA0t9I5upwWnW0dHx8qc+PxXELe
	0Ij9l5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LLV-000000041Vc-2ERP;
	Fri, 25 Oct 2024 14:31:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9i-00000003mnk-2Zxf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 13:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/Db/7vYWfVTvRELCJjsaav3g2wtQjNY/cZ7wO3qNfos=; b=awngOrHlQ6WYYgoDNL3A1DAEXO
	bOrB4cvtiee+lMFKu0H+rHZ7QPrKtPL/oL9JJNS2XM1k3ZSeYu3RQc/X1f84BQdQYWv3Ra81rIQ1a
	M/3cTpi47S78Y9izKFfsxm09q2LjgG9Zrieq1zjUp4NSTZIKta8KnCrsJ4y7y6EP0CsufQVaAT/5a
	7F7RTVBjp7kwO2HJ3YIT9HPk1IHPRKRierKsJ8ZdIPJEkxKGBVQQsdDh7QiYdA4DKhmFQXQBrJh9H
	FkchUZozxyRAkyuch0e/AziPZlDICX556mkKFnvDHa5C5I/A+RT2JYxJ+vVLcUU1vEUatT9fdlrSe
	wR2doVaQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9f-00000008v45-0JrB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:15:05 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4316cce103dso26309045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862100; x=1730466900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Db/7vYWfVTvRELCJjsaav3g2wtQjNY/cZ7wO3qNfos=;
        b=EWkyK0aE8OgQPxKHWjIPlZmqrlo8yaoYo2tweDUzJLqy3+RU4nEajJs0xBjuAslZj8
         dQB4UjWVLjy53pazgwI7J6EmOPqXQmaEl6Fu96h5QUETgE6104s01ZyQuZdDQezjHtyQ
         KIWyroLy3geEVWIoPXK4Sl1OOep9GkDHX17P//2DO2oT9H+ILOduAQdb/7fR1IYQGcFA
         pKuttxrf1BMT9V1oelm4NzjK+hCJB6Bft+qOk67knQtP35lDTaHeB7XBfFp5efFgy0Ay
         zBEiZom65q4sx6Z3Al6RoXxHfhFSZL2i+sYzKtxADAqPwK/KM6CTIYjn4+QZg4R1RH2A
         /k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862100; x=1730466900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Db/7vYWfVTvRELCJjsaav3g2wtQjNY/cZ7wO3qNfos=;
        b=VoLrVpdu1m6LK6ZKdsYjmvGigz9s0Hy3eieC7B71/g8TZMhf4llzJotYYbQTPGMzaq
         TTmZVEz+cFMZlsmbxL5TNLkFnrMCzp7Pa6dhWz01ybgadbUdaTLjkh/5Fb9hy2UFoQuE
         PKIK9jpr27DWcFHRC0Fw9VfvyTdPIWnzXH9/3dAj0pyzJvT+PgW0vFOUg56htxjpRR/v
         d2znJRhQtGEBNyVUsYttoX+o59AUNDC9rneDllva064rkjRjy59pgNNOAVNuJlhqtSb/
         mZKsGf7329x9jPkkuO1FrIZYBSyRwUOhyOH4lBnyMyZ4v8rT59JvBJZAXoZaaMJqcdxY
         iZOA==
X-Forwarded-Encrypted: i=1; AJvYcCXRaduMDwv6N27+grE2AD+GfvU5NYSfDTgB7nGWGUIzP9qkx7tl8nekv+w5DwbGQw71z+6ZjcXPLYUyhuINbrCL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0DgVIDI4rSRNBx5wxp5OO0+cSnb/QxZzQLoT1K4VycN6YxHvu
	KtwAKgcCG98KgMT1ee3RgP7IfwmBCG2G9R1viTsQup1MsrTOlF3DEH078BaJkBY=
X-Google-Smtp-Source: AGHT+IGy7gCwHmZzWRjYuJdLjKUklIvRll7qzxjTVKsdjpMsJu9lcX39EllePZe+fyuRleAhBbilyQ==
X-Received: by 2002:a5d:4441:0:b0:37c:d1ea:f1ce with SMTP id ffacd0b85a97d-37efcf15f1fmr7504792f8f.25.1729862099741;
        Fri, 25 Oct 2024 06:14:59 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:14:59 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	krzk@kernel.org
Cc: tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ebiggers@kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 08/11] scsi: ufs: exynos: enable write line unique transactions on gs101
Date: Fri, 25 Oct 2024 14:14:39 +0100
Message-ID: <20241025131442.112862-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131442.112862-1-peter.griffin@linaro.org>
References: <20241025131442.112862-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_141503_251588_1D290DF9 
X-CRM114-Status: GOOD (  11.35  )
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

Previously just AXIDMA_RWDATA_BURST_LEN[3:0] field was set to 8.

To enable WLU transaction additionally we need to set Write Line
Unique enable [31], Write Line Unique Burst Length [30:27] and
AXIDMA_RWDATA_BURST_LEN[3:0].

To support WLU transaction, both burth length fields need to be 0x3.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 40b2563fe011..b0cbb147c7a1 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -48,6 +48,8 @@
 #define HCI_UNIPRO_APB_CLK_CTRL	0x68
 #define UNIPRO_APB_CLK(v, x)	(((v) & ~0xF) | ((x) & 0xF))
 #define HCI_AXIDMA_RWDATA_BURST_LEN	0x6C
+#define WLU_EN			BIT(31)
+#define WLU_BURST_LEN(x)	((x) << 27 | ((x) & 0xF))
 #define HCI_GPIO_OUT		0x70
 #define HCI_ERR_EN_PA_LAYER	0x78
 #define HCI_ERR_EN_DL_LAYER	0x7C
@@ -1925,6 +1927,12 @@ static int gs101_ufs_post_link(struct exynos_ufs *ufs)
 {
 	struct ufs_hba *hba = ufs->hba;
 
+	/*
+	 * Enable Write Line Unique. This field has to be 0x3
+	 * to support Write Line Unique transaction on gs101.
+	 */
+	hci_writel(ufs, WLU_EN | WLU_BURST_LEN(3), HCI_AXIDMA_RWDATA_BURST_LEN);
+
 	exynos_ufs_enable_dbg_mode(hba);
 	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_SAVECONFIGTIME), 0x3e8);
 	exynos_ufs_disable_dbg_mode(hba);
-- 
2.47.0.163.g1226f6d8fa-goog


