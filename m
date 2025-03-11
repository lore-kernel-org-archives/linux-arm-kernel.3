Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC2AC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g4b/KdywCYMFDDq1/kWvENPSoLkrsBJwlXAOtPzvf0I=; b=l0n5KYkWFOjDjpv2vlJBIfOnHg
	PPa5IeGOhbFCoJHTCi72LnhSMdmpjqXZDfEr4ioe0K5ZX01zJ/J83vzhHzj1UQYsGMkBhp8eGTIRZ
	wMM5OwlsRrD2Bd9rVcD8S8e/7Bd5O9GK7CbT12jMS4LySeMFxllb+xjhJ4zTweI2HM8riBlW6Ete6
	h8lERmG7MPDiZGy18cnMHufB7iUBD/yarXjSNDjDI4BgfsK8p3p/mtZx+RkyaK2Jwjc6aQR2CIO67
	N2wtttiNh5mhdlfp8m9YoYfSC/u3GQMxGabPz6LTVdiM2daGT6kNyzi68b1KwLnVl4FJdu5y2GJt7
	eJivOM8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1Bx-000000064ss-3XnQ;
	Tue, 11 Mar 2025 15:06:49 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts176-000000063uL-38Zi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:01:50 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3f9a7cbc8f1so541749b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741705307; x=1742310107; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4b/KdywCYMFDDq1/kWvENPSoLkrsBJwlXAOtPzvf0I=;
        b=Mest3qPb2rDAuBulrTgbbxxVWqm0SIgJqn6hNI+9Lpbl1Fag399fn81zQgnTHuCcKo
         bZp7LJ/OiCV6mX2YejCrqe636H/bkLRpwstmOO6zrTnANYLK2vxik11pJnkPptDqM5wc
         Xai83dkCdbMMkvkLlhgzrmYN2alf+30sl49/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741705307; x=1742310107;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4b/KdywCYMFDDq1/kWvENPSoLkrsBJwlXAOtPzvf0I=;
        b=iYv0zrb6wI/ngZvdmaxqNIeHNC9A+IwqngRo0fdB1CGl4LRGZh3yAHLwULhO66Z9w1
         PeI7VX7AgXQzeNT2nlopcdqj2EqM/VnOOTx4B5XaYf0KyHSgQdZp75cC8bDkLinrPje1
         9u/YurszuXz+c2BdiSjnVWSNOQ+3UC0PLLfVo1/AUsFNSOM7ob48RfZXwzD0zIX96WTR
         7dBMHSC/vW+Avv3K1MpVuA5VRkrWnm4aK8Csb++6HHKEuuRP9FLO4iT/kAnyWYP3rr/2
         ywSwoKLCOQ7zbiAE5n+voUx3oeCdj8wDqn7X1vV3UfUG6fLHL/4KH/JRsKDO0z542dy6
         3kDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz2PNnozuAccf8SgLxuGJjJAjjU4TP4M83S8mR02K8ben42wj0YHb8E+eHs3nkeTGcB/JNvbzirwh6kgivDyCa@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+Du9usMaKBQlwHUluV2QksHvaMDSs7Z03NJWUIMRZrtVMNHwP
	9skr9mriJn2daCMYz5s4IkUtvt2mCKVeTv3yLg4WpzuL179YdCWx2Gc0JaiTTg==
X-Gm-Gg: ASbGnctx5Z+ctpnSPYyEgYhFXOxJxt6CE8fgNVE8UCWCllX7f41qsPx6axg4+gjPRrX
	MX26VHQv6wqPoas2vOeWSl+lNDKQ3bQ0FQJqgVXxh3+CwiP6CTzTTyAoXSbVld8JZBUmDJvS6ai
	WP/+lqB2h+2hXPXU0dTHC4qhbR1+h/0VW5nla2ttzucv6UKP9AhjITo6+BzJyofcpMqO0joaWSA
	szmLh/AlS1TEBp7N5QObbZ4LlQsnYKdbQ+nvBEKsrl6zv8bSgwLkVkfGW1IXCd1oenLHIqW1PrJ
	YfzY7U+5R5DqoUmUvO0KwLY/d52Nk2aFfJAmNZVmI9fqDIRymJrYdANImNRVrX24Mo1ei6mTADK
	HFyyW
X-Google-Smtp-Source: AGHT+IFdbjAPLkBcT/PdO6aUZ/LPk9p9TaaPPNTQhmFPj4MU5+L0g0wPVorRUgYDuoVha/IN/Ce0Hw==
X-Received: by 2002:a05:6808:151f:b0:3f6:d59c:6a40 with SMTP id 5614622812f47-3fa2b30bb82mr2312809b6e.28.1741705305315;
        Tue, 11 Mar 2025 08:01:45 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f9513f1f88sm646247b6e.0.2025.03.11.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 08:01:44 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] mmc: sdhci-brcmstb: add cqhci suspend/resume to PM ops
Date: Tue, 11 Mar 2025 11:01:28 -0400
Message-Id: <20250311150136.46938-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_080148_824717_0FC3B8E3 
X-CRM114-Status: GOOD (  11.32  )
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
 drivers/mmc/host/sdhci-brcmstb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index 0ef4d578ade8..bf55a9185eb6 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -505,6 +505,12 @@ static int sdhci_brcmstb_suspend(struct device *dev)
 	struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
 
 	clk_disable_unprepare(priv->base_clk);
+	if (host->mmc->caps2 & MMC_CAP2_CQE) {
+		ret = cqhci_suspend(host->mmc);
+		if (ret)
+			return ret;
+	}
+
 	return sdhci_pltfm_suspend(dev);
 }
 
@@ -529,6 +535,9 @@ static int sdhci_brcmstb_resume(struct device *dev)
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


