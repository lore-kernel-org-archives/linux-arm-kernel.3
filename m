Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A3DC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 17:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NQzNVxSYCC2FNoqYgqHcnaCCKOuJ/N1MxANOboKaTNU=; b=06gGwrxHz7yt+h
	lVPiCCQL5ygJafTYvkmP6r/gyJG0P2goWAduCf60Wh6WQqSst0dtCkRLDpZvnUt+olkoP2LP+lhy2
	o22us3D65DIXmfcbCxuRXEOzPA1lRs4XjQ+uU3KccJpSi3GBJkjUuOm0wTy41XuqWkhD+sQD57gwM
	wVlXC2fln7P5MoX1sJ5/2+3eKhMcDKcprWZI9g4J6oOrbnungpLEQoze6cBYfAB1zuEWi3GSyYjG3
	Gfmhwj7kNgnn+su+E+WMo3ZSZiUvEr5ggPX5rhuHsyM9YeQtueuAPQ6TMX70wqAHH7h3d6Apv274q
	t7DzF2DDCIXNWiqQxPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHR3a-0000000DiQE-3cmI;
	Tue, 20 May 2025 17:47:14 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHR1R-0000000Di9j-23BY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 17:45:02 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6f8adf56370so9292766d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747763100; x=1748367900; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NQzNVxSYCC2FNoqYgqHcnaCCKOuJ/N1MxANOboKaTNU=;
        b=Xg2Rcjf1Q8a02csM5B1js7xT/pjTGFvXZmwRIiC6GIaOFyvrwD1aK7e1KxzOVfLQQg
         1y97gPe2E4KQ29khUyi/CjRrkU6pSoNgi3Q3vrax+0g1j/XlNjv9HsdawZclMI//+V+6
         2uqQn4yfl+LCZDXfF1lrOUSPTmRW1lhoJJmHh13gtIqNgqn6NfhGglf/D/DMzLK3l/ow
         nIaMswtmwuDrKn07UxrNA5Cf8sNi4Joi2qpeDjFz3LQVxncvSY/LMLYGyDX/G5NfZWDe
         JNZqXeqZohND5PPTdl+bpe6ap8oWxAqt8r1B3o+5eapFXButLdi/5/5QWEY1Y0bLfj1I
         Cm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763100; x=1748367900;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQzNVxSYCC2FNoqYgqHcnaCCKOuJ/N1MxANOboKaTNU=;
        b=uN3f3vzek54OZetDis84eztZ5wIWAM0fwkbs5Qs/f1VydOKISTOo7AqjlsXprju6VC
         LX+9sbFJAAGeXcCxgXq5KcGXCzo0F9dtnaYEQscF2CqiMFeKojRVPVou+BEyjAvDw3qp
         MhaxEOvD0Bi0q4onTJSaHVe+3y+JinZDTE+0+qgDLrk64Xk9Y0fjwV3uP4Jwsjk4hJfD
         pBIZneXHN1QLgK0y7U7f3qEZNRHiPytd6l1m62IyRolA7vxPFMsUaFpuUhpYkFNR/FEX
         jbkeHss9NS5BX7qa51v/RLjSh4IriiD6xKu7wg3V1WD70VR5Bsz54HYdPdl3mPYBM64u
         pO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCUYiRSp4gn8lxl63N+MxDskj3SWfVNtNj8iokE9X8bRSI429Orlrng22Rok73S56j6wXtno+gG6K6F5Jtaq2l@lists.infradead.org
X-Gm-Message-State: AOJu0YxpxA+xE2aqwypmhmnkYjaridtroIlI2xS/zutCyajxHVtjrsTn
	JGb0HGwCAcjMphzwM93W+jd+QaMkrVPpSNEGare4FDg73+KLWF9NJsDp
X-Gm-Gg: ASbGncvndO70RCRKTVTD/Vc65IMQJxmk2XyjArn0aFOl3/ycgNLQLn4GEGuYqJ2sjgY
	5tgOwEzj/WwNuLKDLB1jN9/KWl3c5etj9UGYHT/beKevcXCo1CfQxUt8OrTu85SGKXeroca3qhf
	3KDWRQn9JGP8P+J0cPvIbkr6Aq0JtXb5GDhEV5/rJzj9Y7AM4dLedKlNIs+COZUDuhfKlIF0q8F
	QK14WEzT1w1zazIzeSNBFFKkICDbxOeIfQqnmM4CsTsvX4onOjVVEcldWuVZ9vHMQEScF3RJQpY
	78n+wjOV1uO29f74zrVfTgT3zmgoRZN/dbGzgkztltFNYGWrHBgRmM+9O8xVTPDfa9Byu0TS7Ds
	LNyA0HGkXosMmFZH/cWM=
X-Google-Smtp-Source: AGHT+IFMsjsAlp/KmRWJUce4mkstVxqQCTLw9Ds84YBX1CPbtRzn3h6pU65n5IYZAossuniw2u+bEw==
X-Received: by 2002:ad4:5941:0:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6f8b0881b97mr96409666d6.5.1747763099887;
        Tue, 20 May 2025 10:44:59 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:44:59 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v7 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Tue, 20 May 2025 13:44:49 -0400
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJG/LGgC/43QzW6DMAwH8Fepcl4mx/nuae8x7RCCoZEKVISiT
 hXvvtBLEQe049+Wf5b9ZJnGRJmdT0820pxyGvoS7MeJxUvoW+KpLpkhoAYhLO9yx9vbnTfhfp1
 4kx6UeU+PiXtDErwDlCRYGb+N9OqW6e+fki8pT8P4+9o0i7X6D3QWHHgVfSUlVrqG6qvtQrp+x
 qFjKzrjBkI4gLBAtZEmKkALCveQ3EJ4AMkCQWgCgNBOo9hD6g1JUAeQWk8joSqStlFR7iG9gYQ
 /gHSBvNWmPMDXtYt7yLwhLfQBZAqkGsKgnQzOui20LMsfL98kES0CAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=5530;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=PfUViJW6wIlPq1eq8mbT7TIDbT/guCIxVWkThk/PvMg=;
 b=5U797NgALzxcffx0leSrLRx1UFnLBJFlcaQFBXdBnTf3m7QtKC4YUXE3mTgPy90CLhOCn90dd
 v0Vi2w8OTqSCx9eFDdF5aGe4NS03I/NHUey6Cy2chM88n0n9EJx2tgP
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_104501_541054_719DB4FC 
X-CRM114-Status: GOOD (  26.63  )
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
Changes in v7:
- Rebase on v6.15-rc2.
- Add debugfs entry for whether stall-on-fault is enabled to help igt
  tests that want to wait until the cooldown period is over to collect a
  devcoredump (Rob).
- Link to v6: https://lore.kernel.org/r/20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com

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
 drivers/gpu/drm/msm/adreno/adreno_gpu.c          | 54 +++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h          |  2 +
 drivers/gpu/drm/msm/msm_debugfs.c                |  3 ++
 drivers/gpu/drm/msm/msm_drv.c                    |  4 ++
 drivers/gpu/drm/msm/msm_drv.h                    | 23 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c                    | 20 ++++-----
 drivers/gpu/drm/msm/msm_gpu.h                    |  8 +---
 drivers/gpu/drm/msm/msm_iommu.c                  | 12 ++----
 drivers/gpu/drm/msm/msm_mmu.h                    |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  9 ++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 43 +++++++++++++------
 drivers/iommu/arm/arm-smmu/arm-smmu.c            |  6 +++
 include/linux/adreno-smmu-priv.h                 |  8 ++--
 16 files changed, 144 insertions(+), 61 deletions(-)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


