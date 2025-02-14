Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AD7C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DQae58/7ZgRGmpkImz3Fvmxvfg6932EKFfHBFpHyTDE=; b=D6KyNkj5ljomcc3PfhO1XwTYAF
	G0OxxG5cLIT+M2pbjZ08e/2CZ1yz5Db7Kw1iczdH5cBWGlLoHPTxUY+0+z6fcs6NQ6/SgzkkFYHEE
	KtXtl9R3LXpU9Sds0kyhA901vLojnjBEJ880kFRGls4E4Udf9rqYMzBPDAQNOoSWk7rlEiYpBtNre
	lLopSSFfebBkRpPFf89R790/ClltkMBg9YTBpF9dS+YfNEnDrqxR/Sub96gKowtibLlGxaW1XKyv1
	rUqGTeftlOdJhDf+8GyI8YW/Qw2eTqNEVZH2ezDgz4kAsNbXmjHENtzEJAbT/Lf4XAwscolLBPVjs
	3WPNjg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tix9P-0000000FECs-3O2Z;
	Fri, 14 Feb 2025 14:58:43 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tix7y-0000000FE4b-11AU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:57:15 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-307c13298eeso21021431fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 06:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739545032; x=1740149832; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DQae58/7ZgRGmpkImz3Fvmxvfg6932EKFfHBFpHyTDE=;
        b=Jr1Meq8ECWiriHvksnURn6KwU7Hn/UGmr5djnkiBaaiBQ9AVmXuN2gzS2YhxqiphA5
         wsqExmzlJGRI0qWtJNm/qG7ijOQKDZhYOf3Art83QRn2SPG61OmtgOkpXl+Skz6DnYCu
         eT9/0hr2vKQc3kAuA/LfReMqZSClmCtfJkKi/8amfb/qxx9mB1A2ShW6/5Nrn9Nv4W9y
         Dd3RoOCm/u4FNSffQ7d1jnhS4kAHEE5f2KrYPBuAKlnOEpKY0lAaZ4l1mmhi+6Xxj3Zv
         AkakPZzoDBBrYfQMf6oCdDLMbvDCeskgwh/fNzoZHS3xyz9Zkb2OtmpBYMeb5vpd2dzu
         b/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739545032; x=1740149832;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQae58/7ZgRGmpkImz3Fvmxvfg6932EKFfHBFpHyTDE=;
        b=D/kIbzEgBC6zZHrKpZzsYSe9DjFbEmjlY03u/NoeAgaWNTlJF7IP/8TF3VIXbdxcKf
         oiZ+RBpASklhW8sEEdfy0fAAbQA/TX+7VstvfNJmaEIKt6KMQt5obFi7J0U/nYLhsT2o
         rsCVOK17j0G/3IatKRiCEnhOuOKgka4hQV0f94W2xCQgAeqxbL29mWSXCKdNLiutpYLi
         5Y+NNycX1Elhfc+ODZasGuxstpKRdlinDpSws2btNeixzIZmix4t0vx5+HSJDNNinINn
         tWH6jmKv1w1WgE4ZzlDvavsV2EcT/56EnNUiNtI1SNJku3/mwvsTURmlEZkwvZ/qMcUG
         OUSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRTCN1qOH5L+R9Nbio0y/Fqh621Zb9GQLHe35P7Pk4xDrsMUzw3YpKmYb35yd8JF5fzHCrCe9vZTlWPwcJLxuU@lists.infradead.org
X-Gm-Message-State: AOJu0YxDgA3SDmKcy+8M9TcWC0XIVpilRWvb7cC+8kLlpFol56ThgT5Q
	NjKK4XYkzb+Kqtu2/2brG3oclmGlId6H+aOqlnnGm97yVN5MUS4A51sYNSMFIq8=
X-Gm-Gg: ASbGncsop8IJelAuWGr71rSoqpJkBb9wfBfHZ5YL8UE+Rz9gu8qdwrROdw+IBYWeEkR
	hqmaah4pMTxx4HJgQceAhsiuLtWSEsT3VeDKKPOgBEB16mi6qf5hoNO3aEFFSeV/nl8H5+EeXHs
	qqnhGNQqHmwIUyV2ClZU040yB0GPEiCfUhUHdIzObW7KXai2Z62tSp2ViYTEiB9ixmaI5wl5lyH
	Su8fFWZGLjlgts+houpXPO+ekeeY7ZzdCxZ4VF6DGTZxOEW7ZTjI3XtDXbBNi1fYrSZTD26OrNM
	XiaXT1OR9wZ4ggLgDxhhkkQ=
X-Google-Smtp-Source: AGHT+IEGXwyfxyoObKs7o/lt7dV9tEhqiBuBL0KpjS6e5z7omskUER6BZ1nOd81V/L7kuC4TLU7acA==
X-Received: by 2002:a2e:a907:0:b0:308:e54d:61aa with SMTP id 38308e7fff4ca-3090f353cd9mr34630161fa.2.1739545032292;
        Fri, 14 Feb 2025 06:57:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30921447bdcsm2129911fa.35.2025.02.14.06.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:57:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Feb 2025 16:57:11 +0200
Subject: [PATCH] arm64: defconfig: enable DRM_DISPLAY_CONNECTOR as a module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-arm64-display-connector-v1-1-306bca76316e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMZZr2cC/x3MSwqFMAxA0a1Ixi9gix/qVuQNSowa0FZSEUXcu
 8XhGdx7Q2IVTtAVNygfkiSGDPMrgGYfJkYZssGWti6tqdDr2lQ4SNoWfyHFEJj2qEiGTN240bX
 OQa435VHO79z/n+cFzY/Bc2kAAAA=
X-Change-ID: 20250214-arm64-display-connector-c1c1569f9799
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=z2Q0IRBbFBY5UO2dBzF27h1+kSCMj9v5w1Ed/8luhF0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnr1nHdqBlbiOcs9Fq6bYoQ+iyjmFYH6QKSuxfO
 /WMhlNqTjWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ69ZxwAKCRCLPIo+Aiko
 1dUzB/91jaiBLtA2Q8zCpQ3QjdZ+QQiJ+ot6o6nCYuWdrktym6dcD4EKzYZwUmJ3Vh2WGNTsGMV
 h6BwL6PgWizo3efy5boVtu7ecr80HjH/1Ug+saZSI/7ZkA3hzOUEooQUsUtg7sdhN18RXhzykXh
 c6rgBzQhOnB4cq3zCf7rxGkwZCDwEn/6C2hI/luw86qLkxCNCrzcxGqO5R8oQV89DnUglP8akpK
 BSxLXt7esBRbJAR2NhjPmslaZK9COmB7nGaw/L2Z/5XD8U8NKU6uQtX4+hLHIGWvloM/9TdDO8/
 3GuXHoOg15yu3UUAupDJYCQxzSPgQoadi6B/nWgl+EGv7EQ3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_065714_296649_5061A140 
X-CRM114-Status: GOOD (  10.55  )
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

The display connector family of bridges is used on a plenty of ARM64
platforms (including, but not being limited to several Qualcomm Robotics
and Dragonboard platforms). It doesn't make sense for the DRM drivers to
select the driver, so select it via the defconfig.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da44155999b59aff95966f4cdc9107f2af46a..dfcc754962f7a40377d1f8e0f16983af5ace28f4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -911,6 +911,7 @@ CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m

---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20250214-arm64-display-connector-c1c1569f9799

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


