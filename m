Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E212C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 18:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=; b=od90dxsHpt9mbcEScxleB6wZbN
	OzGKjmpIHU+Ba1QViNNUFI1OLZJyDLzDl2XgjOnHBAhCzULds2Ss2bCizgiipJDcC1G5c5X2/clmH
	fe7C8E50HMUMCEw0ygYhabb/eJW7pKfj0HCd85srsr9oJVOBVYgKF5Oh9pEmS+lCdwJotNXNBjTrB
	wJGfjUFB3DE2YF5heAB8tSfVWkg/G6TmqIHooMIyxXfN9LGk/OOMgapnmeUtJ0ALsZAQapsqmXL4g
	321Wrr7DrQQW7mrDgoaCwPZlcclw/jF1lCgvR/b7xDh3z/EMrETDtErPju5hY4i1f+sS5W/XsUjdW
	XdyhWPfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHRIO-0000000DkPE-4684;
	Tue, 20 May 2025 18:02:32 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHR1Z-0000000DiDN-1oJi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 17:45:11 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6f8af95ce87so8910436d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 10:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747763108; x=1748367908; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=;
        b=Fpan2pH1EWrfPZl7KIS1E1Y/p7hYC8mwHqJ/DJ8hmYNx3H8w/aH4geVLxHP8g+4UzT
         xhDBuILBD/Yx75WN8sF2a+Ld8LgP/1JvlDwcWOuqhb7xBK8LZhZqAA2wbB1y3EfTFBQ+
         vzDSiV8XgD0RJ3/gXVjEdXyXI1OfHAn0osV/RXTLVGwlO3XrFzkpOt30oTHFCfXcSwE/
         OwSb17jisH6C1fklsfQeZRu++WXwFVRpSLXiVCM0DNCFMPU3TzTm7iWPSjaPWlMJJI+F
         E9m0Geb/u1ZQBnUbrJYiNLUezXUgYWfMwK9T2cdapTBxBGTX7LZ8FGJQCFG5pDq6tmPn
         s2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763108; x=1748367908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=;
        b=fAMMy81BPwUYeGz39W4ABGISDwXB71Ed88SXyBLJ+EXNpSUq59E9yvYZ5YRbdViw3I
         nbouuBTQH5rFbjbIyZ4VcdO7Pr5NJ0BkGbdZ7nhe4wXhkmRTMD/3bzigiQFCaCx4h+n6
         kH8CbuocZhCMvwRTpuZO5y3Wq+YbzoiQ7bljXyBGbeYOs2FWNBTYf7wGylnPfQ3fGQO2
         +2j2Mev55lKb/MmDhq+z314yW0sdBTonDHNXDsXslXvZ88h1nTgZLLg/bGJMasD57ssj
         P3FTta/QFD0rYROgZZPvegihZ2a4uFJU8C19nkm2ZNws7Q0Bi39yqAqdU1u+tGzR44H4
         nOAg==
X-Forwarded-Encrypted: i=1; AJvYcCWVtEAWaQRBHxeZnNMU6miG1pIThyVOErojOpnCME253MjMBgrC000BfR/N9mV/drivbCLL3WCqhGkzEM3H77vE@lists.infradead.org
X-Gm-Message-State: AOJu0YytsQCpUpML6sT6S0y9bN/LimJ8NM135naasMhckPDyWbCt/Frd
	X0gLUVsIex5wvlq6ciF7IVf7lcVn7NjivgYPKITaNMz4GLEuScFiVKxX
X-Gm-Gg: ASbGncuaiv+q6p4uqINYExadCnPJQlbaB0G8kGiEe/yFg/OU1Q3VpZDlJJorhs4Vno2
	U4yz6Hxz43WAYHndoFIxy2T0hi1OTOepQFelsoYVkbuTUQLAUjRuuBRckt2kplNROw2phJDOSlG
	XXudkUZ81KdcoG0exLOIiFK+Vtc5/eY2+XI5eNwIvxX+xxqpywEDp9k5JUfb3DpgV8z9OWkYW0Z
	1KQ5cFv2SE85VYqXTseiNjiXoX/DF3A+E3cLHZoJNE5bUVpYdY6VeoHc+k5D4pgZci4Z2dWOzw1
	wzUS4ZhsSSmK55u2m7O6jn0xM2Inh/HlWqEwVO2DUcCiyZLlfMF7LdwHd4vtyBRP0ITGXRxCyP0
	x6wI7QHUpG13W09V3v6M=
X-Google-Smtp-Source: AGHT+IFCdFtXD0ROOtYtBP0OI+hMuOVWsDmLO4ZEV9rDAumTtHnKdWFKDekI52EYfVxWEILyc/wwTA==
X-Received: by 2002:ad4:5f8e:0:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6f8b089442dmr94348406d6.4.1747763108580;
        Tue, 20 May 2025 10:45:08 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:08 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:56 -0400
Subject: [PATCH v7 7/7] iommu/smmu-arm-qcom: Delete resume_translation()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-7-96cd1cc9ae05@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=1671;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=T92V8eX3Vz4beQQo+V6nyo4FyO6B+nwmyPWJT1oO+Pk=;
 b=vtKS5WA2jt4fvTdysRQedDxOh8WN7S66xhFGBrNMjcLIhRmubh69gcLR/NbqQtWPPrry50qfq
 lDnb+3B5orhDydZLJby6AbGaTMBEjlxIm7FW0NgjDlqGLt+O1uUASXR
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_104509_481315_54756A4C 
X-CRM114-Status: GOOD (  11.43  )
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

Unused since "drm/msm: Delete resume_translation()".

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 include/linux/adreno-smmu-priv.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index d83c9175828f792f1f43bcc8056102a43d822c96..4106b6b372117119bbebe67896de18fc6286fb44 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -46,9 +46,8 @@ struct adreno_smmu_fault_info {
  * @get_fault_info: Called by the GPU fault handler to get information about
  *                  the fault
  * @set_stall:     Configure whether stall on fault (CFCFG) is enabled. If
- *                 stalling on fault is enabled, the GPU driver must call
- *                 resume_translation()
- * @resume_translation: Resume translation after a fault
+ *                 stalling on fault is enabled, the GPU driver should return
+ *                 -EAGAIN from the fault handler if retrying is required.
  *
  * @set_prr_bit:   [optional] Configure the GPU's Partially Resident
  *                 Region (PRR) bit in the ACTLR register.
@@ -71,7 +70,6 @@ struct adreno_smmu_priv {
     int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
     void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
     void (*set_stall)(const void *cookie, bool enabled);
-    void (*resume_translation)(const void *cookie, bool terminate);
     void (*set_prr_bit)(const void *cookie, bool set);
     void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
 };

-- 
2.47.1


