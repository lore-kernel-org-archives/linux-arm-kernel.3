Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56E0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 20:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmTeIgN5AtQt28lNx3DVWq0mIIdy+DVEwXhPE9hXVsA=; b=UEF+v0Zvfz9L/c0jGpoQBrew/g
	OMcgDDZ04YPev8x9+a0ScmO1jT2jpS6QNl0itZ1GoO/9savPrBPEnNpr7WmzHR8n8aOJd/VSqjlGp
	U5hrmYsGFJSsuLIOBKIXIYJn0VykC/uomw5+iesKybwugoVuRWe6fcBqXm12O/ebbDInR1Hck/COG
	xpU7zAfUMRBRg/r5gRLohaSk0GU5t9pWz8mJ8yylHEaejqSO9nP/15v9abVA36TKXwmL3b3bh/A/2
	scz3DNEDcXWaK7sJymgnffgQamLXJ/WFyPuNdVFPIvga3gBDtUYhcgKJAQOiJqTtv8Oi75+MmkE5a
	K2xlQ0iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIR-00000009atq-0xsj;
	Sun, 05 Jul 2026 19:14:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIN-00000009apM-244R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:14:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-474303f3c72so1285626f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278866; x=1783883666; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmTeIgN5AtQt28lNx3DVWq0mIIdy+DVEwXhPE9hXVsA=;
        b=eu8nZxt9Q7ODFuyWe7zMfbocCdpAengl8vLi00t1QYTS/IkNeveV168MXjfG1QfjIu
         LowMmAfteKAk4/AkNKVCfGGv30vFlgFyeE0lVYELwkSquWCEtVpSUTpqMCkwjZzZEiwO
         KUKieCpv15GPOBkCKnFLRw2m3jY6rPDTik/e+EwDSQWNqLIBQGL8vWNIWRbwLhvyMJCP
         /0RYOzM1mRcuaYST69TENoq44BnoPCKu8+qdCUmf7L+M705yfqs9qV5Ue9sagNtvuJVo
         JhymNR/sQs1o73wWsY/f+3nqzBv3RDI/KDHzpsOyhdF54zfLaAYK34keHarUssg68U7c
         uNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278866; x=1783883666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RmTeIgN5AtQt28lNx3DVWq0mIIdy+DVEwXhPE9hXVsA=;
        b=PAOya0dGbEyF2dy2N7xVXJmkHwYW1HWmT5LGjZRhZFVowkJZfkbON50T4JmOU7sRsM
         aNX1o/j9p1LHSAWs/QzkuTGlGt9DyzGJCNgDCcCE7EF9EoewY6P2xOVSAUNPgkmKmStq
         d1nMzcKA1VkdcvYCMVsimwAR1Czak/J9aWMO+mmiiVYmwMZVzdpNsEBAA3af7OVULAaL
         jSZveYli6kb7Vd5oVyMxzkR2Tmh5U7EpPWV0Vx9ioDlA7mp/xfBrDwo6D0HgCwIbP5mt
         8r3ecgjz61oQwprOtG6AwceN91Bns099R90x7bbGvyXSPG8BmxiwjHUgPtaQ0A0fioiG
         EZcg==
X-Forwarded-Encrypted: i=1; AHgh+RqvI80nQny/rrs8NMNLxwm/kaUGrVGDrSzCYyABCB425jFvGCV4oFh1KnLA5W7rdn5vM1d54m/BfZ1ZBIZs5mB3@lists.infradead.org
X-Gm-Message-State: AOJu0YznthPS0P3tttMenwOGcQI0iEalMplK48wGeYffZ/7ocK3sPSLM
	+QHglI8n5ko9LR7ThSf8CfbrKQufSGYEhu786Oqp9LJRFqTHTbGwE0c=
X-Gm-Gg: AfdE7ckm4c/yXmf88WZFFXSnvoZGDyBvSW71IhLWH0mGqXkFgD/TFQ5Wszib2M9Yr7+
	QlplUgTWFOOBQE5C0A0TcjdZBvXSzpUBR0ZOSl6L04voSDCrARP0fvPMb9s7jfDZhTCs9GxN7op
	myCwOzutew5R5awugSNjFxjp7YH0S3qJYvF/MR2Fi7+dwlQYlNODQqToUoSE9IECNPUbnNTLjky
	GKiZHrqyWZd+AZTVEV4RPZHd9KyFzMnLWz+YGQgRQPdyqzWbxJIyyDn/YiQ/yfQfo50k914ghg0
	PcL0iTbPi9woaHXpwRD9ukBkCBEop/eCrnwx2S1+PmKqgQQ2Sf3+IxjY4ERWBHcxvBd5emPwnoC
	xMA1x1xwiCUQXrklk+4GHnBVbfBwgy09VHecovQXXkqmn69HImXfN59mFt8WvpE99us+DuEnvYe
	AOeYNKJZuu2nBpkig+OELwDduO6nVbUg==
X-Received: by 2002:a05:6000:46c4:b0:470:3edf:e2a7 with SMTP id ffacd0b85a97d-47aaaec02c4mr5836740f8f.37.1783278865571;
        Sun, 05 Jul 2026 12:14:25 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:25 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:40 +0200
Subject: [PATCH RFC 06/13] DEBUGGING: print contextbank and other ttbrs on
 fault
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-6-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=2450;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=U1AI7O1BhdkrzXxItW/0XejZckUMlwC4IaAuS4BWmNY=;
 b=M+uiiUBR/lmMuad/SAHrKO891VirOTvBs28b6xreWN52s/uXJnTXUgzkAI4/P/yddSN2TXP4j
 AH+AF+T02UICCWBKtKMyVk6fvecJCMlYT6OCGtiT5he3yQ4MXqiVKBI
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121427_577568_BB84316B 
X-CRM114-Status: GOOD (  12.89  )
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

Faults can now come from different context banks so print that
information as well.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 4 ++--
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
 include/linux/adreno-smmu-priv.h           | 2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index be374cf209f4..6a48e211fa3c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -329,8 +329,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	else if (info->fsr & ARM_SMMU_FSR_EF)
 		type = "EXTERNAL";
 
-	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
-			info->ttbr0, iova,
+	pr_warn_ratelimited("*** gpu fault: cb=%d ttbr0=%.16llx cb0_ttbr0=%.16llx cb1_ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
+			info->contextbank, info->ttbr0, info->cb0_ttbr0, info->cb1_ttbr0, iova,
 			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ",
 			type, block,
 			scratch[0], scratch[1], scratch[2], scratch[3]);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 48a590aaeb5e..ae6152bddf8f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -136,6 +136,10 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
 	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
 	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+	info->contextbank = cfg->cbndx;
+
+	info->cb0_ttbr0 = arm_smmu_cb_readq(smmu, 0, ARM_SMMU_CB_TTBR0);
+	info->cb1_ttbr0 = arm_smmu_cb_readq(smmu, 1, ARM_SMMU_CB_TTBR0);
 }
 
 static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index d83c9175828f..5d6de4b4de06 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -32,6 +32,8 @@ struct adreno_smmu_fault_info {
 	u32 fsynr0;
 	u32 fsynr1;
 	u32 cbfrsynra;
+	u32 contextbank;
+	u64 cb0_ttbr0, cb1_ttbr0;
 };
 
 /**

-- 
2.54.0


