Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A399C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3mXZ5saot0RNfXEwNRIKD6v3oYeaF3NNGEULkoMtNjs=; b=MgVHM7W5upA+UKPRxwwp9qH8Ki
	Dd0rI4EVHbtrZz3wOw/M14osCl9dYFWUXgqf58yxmNdIgWBJm52D2RZGP0YWJZsgjvcG9z2BVBFbL
	3uK6a+caLkHOYwlIQ3JJALPGL4MboKKvG+b/YXvWwMEeDVw2EEj+tYQuvmv0xmZGyk5QPs7XddOim
	ShgYgzelHAh6ejiTBvUQO8j+S67yTtXnu3mD9HsK5ZN7dMNEekfcXriS5g6CmKu0GhclxPSk2acWa
	BK3zyRiakSl3Bacxr+f6GyEYBo1lWN/le5G2UpXgqTZ7mdwb2Xm4t6AG/hDBgeyqb9no+FY417CPU
	5tOb1krw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2z4-00000006O97-2mwq;
	Tue, 11 Mar 2025 17:01:38 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2xQ-00000006NzV-35DA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 16:59:58 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-72b8986de41so622614a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741712395; x=1742317195; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mXZ5saot0RNfXEwNRIKD6v3oYeaF3NNGEULkoMtNjs=;
        b=LTJrMVAE52qxtsoTZXR24fyf9EAKKRchigBHqKCqyQ3zZ9KZXhSVU7q1+2mW10oYPq
         Zqm2uo1hMOKHOGVoyJ3/YCItxy4qxcW7Qvs4vX9fXDGA6uj0aUIBCgGv5JuSEllIj89u
         BPs6C0dmuh6ratb6z/mCPuh4drKZrpXtjA/mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741712395; x=1742317195;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mXZ5saot0RNfXEwNRIKD6v3oYeaF3NNGEULkoMtNjs=;
        b=C4g0aewEBITATvGbMJjJFD/HO5brfP+A8k7vyu56b0UHKoKb3i+GRGlvec4iLxOlj8
         8rpwG9vlgqNXw2ERXeTvqC/Kp4UiW+CJ2YorieV1+HYzDFpmZ04KRaPnMDLkZmaWDTIw
         0CV4pPxXPmFvVpp8DmnFGrDzimsNMsuKkyu/PCv1tT8PZXxANCC2qTV9JJaLmf/DBmVY
         QAF6kU5SMAWaZrO3zA09Q6gx+Z2zbCtVa4UZoUOpgEjZTKOefG5H3IPnmYyUXBZJiWLQ
         t0h6Me12c517rUl6hVE+AsKNasRz+VpDONdjYtIB62IMRU1NpGeraiX/7a5t7qYBl81Z
         bMFA==
X-Forwarded-Encrypted: i=1; AJvYcCXSGtPD54oyqX5GzRxt0Toyl+efUj7MJiePSS6mqe2xPNy1YMGWAJcVWQFyGPq7/IzSTtAWuuPDmpK41D7N9Y0w@lists.infradead.org
X-Gm-Message-State: AOJu0YxqDITK7wT0lhwRch+ZzLqNkx2tXCP6+5nkwvu+koazMrXa+lYo
	XeeNxqHrGnQCHSdAe7hbx24qRKH0dtRtC5WRt291PJVLNY6iwJM9NhlWf2Rr3g==
X-Gm-Gg: ASbGncvFG3gFlPHaS/0EaEncEG4f1Gwk5P+WY3Ac637xBuWueYHVvdZ3WWF5C+ewHUu
	hQUr6T0Zd6bf2Q1s3sSkzV69tFK7LqZSJRt3X49egHQlwrBiQVlTcIlMeBww12JhRUgqeiKGIz1
	YfEiDAYP1UP3JDFyCA6wgUItGqyDXnEa2Bn+p0+rwSeAsBAw6lik0hJvc5QYJqoLFN8u1LNASJW
	o9PXVhg9ZZM2r+4i2BkaHVYx2++vzyeGXCYPlcXnU8XfQqMApOxzkddkPgbxJTWrI5UtkgP1RnV
	f3Wa5F3dYHS2sbGwslBDXYO+tOozyMGdr7tENG2WFwt08rfRnmVbCqMeuolzBZ+fzwBRSP7IIOm
	pkJCx9XhMP9Q3aIQ=
X-Google-Smtp-Source: AGHT+IEo2y1B2P4YlspZf6ieZjf8/Wmas/53NMabqNUKfjrw4XnZraf15n9gzLSdbh8zE4W/K5VXSw==
X-Received: by 2002:a05:6808:1b13:b0:3f7:28ac:8068 with SMTP id 5614622812f47-3f728ac86fcmr6097289b6e.13.1741712395590;
        Tue, 11 Mar 2025 09:59:55 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f9513f1f88sm682492b6e.0.2025.03.11.09.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:59:54 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: Kamal Dasu <kamal.dasu@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] mmc: sdhci-brcmstb: add cqhci suspend/resume to PM ops
Date: Tue, 11 Mar 2025 12:59:35 -0400
Message-Id: <20250311165946.28190-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_095956_958029_E836030D 
X-CRM114-Status: GOOD (  11.72  )
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

cqhci timeouts observed on brcmstb platforms during suspend:
  ...
  [  164.832853] mmc0: cqhci: timeout for tag 18
  ...

Adding cqhci_suspend()/resume() calls to disable cqe
in sdhci_brcmstb_suspend()/resume() respectively to fix
CQE timeouts seen on PM suspend.

Fixes: d46ba2d17f90 ("mmc: sdhci-brcmstb: Add support for Command Queuing (CQE)")
Cc: stable@vger.kernel.org
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/host/sdhci-brcmstb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index 0ef4d578ade8..48cdcba0f39c 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -503,8 +503,15 @@ static int sdhci_brcmstb_suspend(struct device *dev)
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	int ret;
 
 	clk_disable_unprepare(priv->base_clk);
+	if (host->mmc->caps2 & MMC_CAP2_CQE) {
+		ret = cqhci_suspend(host->mmc);
+		if (ret)
+			return ret;
+	}
+
 	return sdhci_pltfm_suspend(dev);
 }
 
@@ -529,6 +536,9 @@ static int sdhci_brcmstb_resume(struct device *dev)
 			ret = clk_set_rate(priv->base_clk, priv->base_freq_hz);
 	}
 
+	if (host->mmc->caps2 & MMC_CAP2_CQE)
+		ret = cqhci_resume(host->mmc);
+
 	return ret;
 }
 #endif
-- 
2.17.1


