Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906B3C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 20:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOJQZsuitJv3y9s8sz3fzgy77bgdsy3S43prspkqpPY=; b=lSDEkvPtPeYxPo++bf9ez0SqXI
	I+hR6/oVQzUMjncOQj9U6LkM+3+L6mQZLHUPB/9WpNFXSh777qDtIDGpxdKkWAozfFDRpISNV6uyK
	lXWHa4pzo/etS1hbPXqHnGiPQdtrrvUrb/GrS6fHJWe47FCGayvRoW6R3ir7DZTAnf0tCT+wSlwTf
	Zs45SAKdgm+Zn2n8i3ULxuWzByloanmSxdnzjuE11639QmzuNhllE0j2wAv7g6pdKbUQPEaxhRZbf
	+TlDrescRgSZwNMDGNpziTnv7Hsu2ijsEei5LYf2f07GA4HbtvEjU0OVe0bwh6yojZV4jPfDzd8lY
	liwYhLGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIR-00000009auP-1vFk;
	Sun, 05 Jul 2026 19:14:31 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIP-00000009aqk-1bbj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:14:30 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47d6c634f45so422142f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278867; x=1783883667; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOJQZsuitJv3y9s8sz3fzgy77bgdsy3S43prspkqpPY=;
        b=NLrohi3Viu7A4mdGIjabh9ETt7iV1yV67FmcHmd4shec7JjC+RZz4m7y1jhRCIC6Xq
         BvACjh19g1XgpUskSogX/8vI6c1m8bJJNofPhsiXqvnbdjW01wV1euc0KTTLzcd6qDGz
         2jyMIkUvY1okSPE9JDdno8ywz6xks/f7zG4Zvp/uD4jBLjUR8/2M38qGevdXxxPdoWz0
         OxJcn0u3u8S1ry5dxBeQXCY/1Moj4DsxktWkOfecq8pLs/GL7GNfl+5DLpB6lte8AVtk
         B23G/Z3n6ZgLa296lqMBopExpkzskme2YjCfqXPDPlxEFXnO8ayF3xq8laoE7KcdVp44
         lCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278867; x=1783883667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FOJQZsuitJv3y9s8sz3fzgy77bgdsy3S43prspkqpPY=;
        b=RvE4QJL/efuLm0h/0RpIZFgoa7MIgrZtFVL6pJ3+m3wJ2R4iG+2k3BFl62CdFjeVOn
         0S4+rlQmjOLqxJ4fQy3JUb3Mmx4x+fOFcQQA6fLjlASXNyZSxGC2hMRWS/aAW1pisEmk
         nz3ljIPXlXdIHHgFHP42a6gngAJ/GIZu8k7Mo6u308kWhG7P0TFfOGU0YyBHQwyDDHN3
         436KYma81h63BruUwg0Lzr2mGmwdbU8zSUyW9ihqsiMoJxEtvQpx/JJXe56o3m3pYXnp
         fmU7kCUHVQ9dSMxVTgfv8KolINh4XVnGU+ApfZ5sE3jF32pbelq2LlUgd3AsOvQaWr2A
         Iq9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoXeTt94A2/S6aWSL7gSCBhUSZbilijPKahUxyuHfDqbICBdJwH5ysXQlJlYgwzUMuYaUGBknSpbTbxfaFxQK/B@lists.infradead.org
X-Gm-Message-State: AOJu0YwS4nZ2DfNSAJidc8IHiepqdo4lDg2my3bRlWE5NOi7ubBMW6/y
	wa10LZTP9OYrBWJmR567LdD453hk/Pe8RumBSMp3fv2RffsGUdxeJwQ=
X-Gm-Gg: AfdE7cneUouL4xFgM6E2r2sPzJd01DgeCRRT4P67xrhNZwmubhGCxtaACAeqdEhvaeV
	Er0gVVGaeYbwwc7SsqNCDkEmAJ6ZbHSIv0YaaWKL/5TzHS4TGDW4yD69RSJywMqRZxsugWwJWnW
	rTvA8GKfl1BqaQx95POKU4M+cSe1Ax2iJSGXfkiyX/HMx5iK/NmDWKag1gD9RZwOTbF/7Hqb5Tg
	3HMuwDEzN64vYmkaYhs/T6fbdBRTH6M4pFhOas8fYreDu1u5w128J5s3VHhRWwfXkvuOipc8K1M
	ei9bnDYGwehO9kxAjmFOAPKZuUhl+mAk74APBhfY26P5+46lczwPp1f3BG/UTG7132o/DnAEINI
	DUJWy0IE/e7XOdKOQCajk7iKcrnh37LQcS+uukHJ5gronsDqkQJGKpNqwqHrk4ags0taZt1XAyW
	GDq6USsqA5qoPrkFZnbhYYyqzudr6uhQ==
X-Received: by 2002:a05:6000:2689:b0:477:6874:542c with SMTP id ffacd0b85a97d-47aab487abdmr8336510f8f.22.1783278867370;
        Sun, 05 Jul 2026 12:14:27 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:27 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:41 +0200
Subject: [PATCH RFC 07/13] iommu: arm-smmu-qcom: Fixed mapping between sid
 and cb for gpu and lpac
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-7-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=1792;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=CTSVd/0edKxTFOAN7N2IneJxadcZY86l85ROlQLsf6k=;
 b=N1CzOkGooWs0D7hEFfO64qs+XczQExJuyhhzPJnlf0WwJlRgmpU6QS/Q3PibSJHKmN1K6WJPv
 WALfNWTwDnSBfYHo0sDNPhrc2jlfRyjKisM+ctCA7C/dwWocYLjvP6b
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121429_447202_AD68246B 
X-CRM114-Status: GOOD (  16.01  )
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

We want to map context bank 0 to SID 0 and context bank 1 to SID 1 as it
makes it simpler to deal with.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index ae6152bddf8f..e605a535f328 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -225,6 +225,25 @@ static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_a
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 #define QCOM_ADRENO_SMMU_LPAC_SID 1
 
+static bool qcom_adreno_smmu_is_lpac_device(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	int i;
+
+	/*
+	 * The GPU will always use SID 0 so that is a handy way to uniquely
+	 * identify it and configure it for per-instance pagetables
+	 */
+	for (i = 0; i < fwspec->num_ids; i++) {
+		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
+
+		if (sid == QCOM_ADRENO_SMMU_LPAC_SID)
+			return true;
+	}
+
+	return false;
+}
+
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -312,13 +331,12 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	 * switch pagetables
 	 */
 	if (qcom_adreno_smmu_is_gpu_device(dev)) {
-		start = 0;
-		count = 2;
+		start = !!qcom_adreno_smmu_is_lpac_device(dev);
+		count = start + 1;
 	} else {
 		start = 2;
 		count = smmu->num_context_banks;
 	}
-
 	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
 }
 

-- 
2.54.0


