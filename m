Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF45C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 20:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NfCE0CRwqEB66mE3f4XfDEo+9BNN5CkqWUyTjXC1/vs=; b=rjdRVwLvZQ9PrA
	sNBUQZRMA9xrAHt5FuKcws8wZrHAfoHXCmlrwXXMWDVrrcrEBshmaj1JH6WyZze6AaT2PR1xcpkU3
	eHeoia0tQSy/VqlC6fYOhwxledUAtIUbXr310azVrGvXqHaur052FAytHDB/brMP20QM1AisS8ssu
	gfFc+PR7d7LRH+fgZ2VX+wG7kZiWEfi6YBqBCuf3HedMq99rCOelRM+TYUj3VpCIPsmwVrRbRGRdt
	lEm7Dt77uZWhjM4eDboWFrUlzGNicXxdDrRhtHI6l49Ok23qthD8JVp7z2Z6j8dOBegq7WO8iJ8Zh
	2uitSiyFuAfM6Pj2wZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFem1-00000001kUw-1HTY;
	Thu, 15 May 2025 20:01:45 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFejy-00000001k51-0zFr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 19:59:39 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-479009c951cso2294471cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 12:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339177; x=1747943977; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NfCE0CRwqEB66mE3f4XfDEo+9BNN5CkqWUyTjXC1/vs=;
        b=V0171/TrtwmF6ODK7CWCwBE5dJj745ZHzKqyrW8hzr15RVMcl4UJvxoYnJBEn4EM8a
         eL+RGJuMFD3/AIUt0IbJjB+QTOi5Bwrbv9IANPi16aHsrfjhq9EfTltg63pI4RAm2uTp
         44uqskr8Aeo8vB92IR3etVa0tr4CIjAm6xXA5TajR6N8ybR0oNs20bxrtpsKfaAzw6+R
         HeUkFeybH2xJMiZyyTU3D/n2ZiM574bHi5gA4BN0hhB7xCgPu4YV8gG+rDWDQc9xtSyn
         VarFlOxC8/qF3ksjBxYQ7rro8T3n0/Ql2+UA2R7YnDEJmUfBR8cThis2p0nL7rRr85/x
         CTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339177; x=1747943977;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NfCE0CRwqEB66mE3f4XfDEo+9BNN5CkqWUyTjXC1/vs=;
        b=P8t5xkJ2JMkVfYZC3XWbjkVaRjV6/mIrBJE7HeUdSoJWNoplqe1XyudVj7oI99kXMD
         k1vsB9FMwLj8AFy36v7jpu3SRTtxXYy8e93i7bQxTh8qsIdfof3cv3+KfAPaJWPI2zrF
         m9x9z6OXZuG8btDEOzlqjoUqP6fVy5EZ9wQiwMWLJwWzZl6w7JUSnpxF1+wpKz76rjws
         rDHbabrEZVOY21uI0qiLk7upI0/QkMOS8LpJ73mHo4zgC2s7xnukcmNZEFTOe0tkw/oL
         wEgwyfZPN8/fmLhMvL5cUKkwHnY80JZylo2nJSXDslnO2dF1P34nEtXWK3xwkWI4XPP8
         ve2g==
X-Forwarded-Encrypted: i=1; AJvYcCXvt/+bSU1G4j5GQQENAFr9lDh9/3LIOVocfXWBc5Cm0xHwl3rtonBu07ibLU21/Yo+0X9mfN6U5fNoECMm4+N7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw00Jo7q2jRwxGvoktoi4mzjbmM1FzbUjT+OWpbvNMEAZgFxhHU
	bXCGJuGp7T/rsWdec9qm3Xm4Gn9ylyws7aWkBVdTMIt9N7gPu74b7VxC
X-Gm-Gg: ASbGncsRkv2YIe5KYCNhvTT48XJS0wgCJEqeVjR0FZSUu3NiF3CQyMy8J77SOsurUL5
	CNxyq626QAC6Cqy6UfaVMtG+qrBY9BwjisgBk7i1Q6aRsmf3oMmHtZIotxrgCeaPCbeQAVEkQ6M
	+SYnsVARVzadQOdozt7in7kZQ2I6V7KJEQwVVGFLmmrGX7vqDx2u5uFxC5aky8feBH3fr9pLCgG
	iMGMkcGeiGk5GPZdsQoAVEmw3D6KJFYa0p5zpEvRr939G2waaqjlRCSpIgk/FdfT8kPMQL/jO64
	xuryRS+4rtO9tE5aptH0S5d/p1ZqNy8sl7pyHeoAXLwO/fCclIQB9O6soIGGkOde451fwtNSyFz
	A+fXr4DpxSYQeiv0yZ+NLkbKJqN88pA==
X-Google-Smtp-Source: AGHT+IFkWsAtsnmpyECLquD3Wa6v/pzDjQozponzgbbsKAxLTCxAPwg0uZaNb19m2I0jkfrktlGd7A==
X-Received: by 2002:ac8:5893:0:b0:48b:6eeb:f983 with SMTP id d75a77b69052e-494ae3f8ce4mr3492181cf.10.1747339176983;
        Thu, 15 May 2025 12:59:36 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:59:36 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v6 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Thu, 15 May 2025 15:58:42 -0400
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJHJmgC/43QzW6DMAwH8Fepcl4mx/mA7LT3mHbIh6GRClSEo
 lYV797QyxAHtOPfln+W/WSZxkSZfZ2ebKQ55TT0JZiPEwtn17fEUyyZIaAGISre5Y631xtv3O0
 y8SbdKfOe7hO3hiTYGlCSYGX8OtK7W6Z/fks+pzwN4+O9aRZr9R/oLDhwH6yXEr2O4L/bzqXLZ
 xg6tqIzbiCEAwgLFI00QQFWoHAPyS2EB5AsELjGAQhdaxR7SP1BEtQBpNbTSChPsmpUkHtIbyB
 hDyBdIFtpUx5gY6zDFlqW5QXYuTBv5AEAAA==
X-Change-ID: 20250117-msm-gpu-fault-fixes-next-96e3098023e1
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339175; l=5041;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=tPRz/qaPPPGzFEJkum9i4zbHqAmQAXcIYUP29tajErg=;
 b=YGyiTwfgHlzfazV4WclXmbRcevdot3iPngddWcCaEcAOVt7KIRcRU/+h+G7G5r/mqZKEIVsK9
 E4OvOStUg9sDLtIr2UXwulTAF3g2OVbiqGPUA4uJiI5PDOzT0sTNKgt
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_125938_280290_48F5F502 
X-CRM114-Status: GOOD (  25.11  )
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

drm/msm uses the stall-on-fault model to record the GPU state on the
first GPU page fault to help debugging. On systems where the GPU is
paired with a MMU-500, there were two problems:

1. The MMU-500 doesn't de-assert its interrupt line until the fault is
   resumed, which led to a storm of interrupts until the fault handler
   was called. If we got unlucky and the fault handler was on the same
   CPU as the interrupt, there was a deadlock.
2. The GPU is capable of generating page faults much faster than we can
   resume them. GMU (GPU Management Unit) shares the same context bank
   as the GPU, so if there was a sudden spurt of page faults it would be
   effectively starved and would trigger a watchdog reset, made even
   worse because the GPU cannot be reset while there's a pending
   transaction leaving the GPU permanently wedged.

Patches 1-2 and 4 fix the first problem by switching the IRQ to be a
threaded IRQ and then making drm/msm do its devcoredump work
synchronously in the threaded IRQ. Patch 4 is dependent on patches 1-2.
Patch 6 fixes the second problem and is dependent on patch 3. Patch 5 is
a cleanup for patch 4 and patch 7 is a subsequent further cleanup to get
rid of the resume_fault() callback once we switch resuming to being done
by the SMMU's fault handler.

I've organized the series in the order that it should be picked up:

- Patches 1-3 need to be applied to the iommu tree first.
- Patches 4-6, which depend on 1-3 should be taken by drm/msm. We will
  probably want to create an immutable tag and merge it into drm/msm to
  be able to take them in the same cycle and avoid the temporary
  regression noted in patch 2.
- Patch 7 can be applied to the iommu tree later, it's just a smaller
  cleanup dependent on the changes landing in drm/msm.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v6:
- Rewrite to use a threaded IRQ instead in iommu/arm-smmu (Will). As a
  result we can drop most of the previous changes and instead move
  writing RESUME to the fault handler.
- Link to v5: https://lore.kernel.org/r/20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com

Changes in v5:
- Don't read CONTEXTIDR for stage 2 domains.
- Clarify that we don't need TLB invalidation when changing
  SMMU_CBn_SCTLR.CFCFG.
- Link to v4: https://lore.kernel.org/r/20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com

Changes in v4:
- Add patches 1-2, which fix reading registers in drm/msm when
  acknowledging the fault early. This was Robin's preferred solution
  compared to making drm/msm's fault handler tell arm-smmu to resume the
  fault.
- Link to v3: https://lore.kernel.org/r/20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com

Changes in v3:
- Acknowledge the fault before resuming the transaction in patch 1.
- Add suggested extra context to commit messages.
- Link to v2: https://lore.kernel.org/r/20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com

Changes in v2:
- Remove unnecessary _irqsave when locking in IRQ handler (Robin)
- Reuse existing spinlock for CFIE manipulation (Robin)
- Lock CFCFG manipulation against concurrent CFIE manipulation
- Don't use timer to re-enable stall-on-fault. (Rob)
- Use more descriptive name for the function that re-enables
  stall-on-fault if the cooldown period has ended. (Rob)
- Link to v1: https://lore.kernel.org/r/20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com

---
Connor Abbott (7):
      iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno SMMUv2/MMU500
      iommu/arm-smmu: Move handing of RESUME to the context fault handler
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Don't use a worker to capture fault devcoredump
      drm/msm: Delete resume_translation()
      drm/msm: Temporarily disable stall-on-fault after a page fault
      iommu/smmu-arm-qcom: Delete resume_translation()

 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c         |  5 ---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c            |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c            |  4 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c          | 56 +++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h          | 26 +++++++++++
 drivers/gpu/drm/msm/msm_gpu.c                    | 20 ++++-----
 drivers/gpu/drm/msm/msm_gpu.h                    |  8 +---
 drivers/gpu/drm/msm/msm_iommu.c                  | 12 ++---
 drivers/gpu/drm/msm/msm_mmu.h                    |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  9 ++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 43 ++++++++++++------
 drivers/iommu/arm/arm-smmu/arm-smmu.c            |  6 +++
 include/linux/adreno-smmu-priv.h                 |  8 ++--
 13 files changed, 140 insertions(+), 61 deletions(-)
---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


