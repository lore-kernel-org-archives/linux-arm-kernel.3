Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67562C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 15:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jyWkEYx8l19GBLVFTRZATObQ9E8Z6bbFOrHEmmyhtMk=; b=d+GKRjCK8i7ppz
	WQLHUjgyLI/K8OOi443+QVTxZkZFaELcmv9OvnWrHo8sXbIJs1gQ2bAdlvO6b7UZCc99/yUcmSK66
	GO1LMLSYfdYngNB9p0kMx95MCUm0P4o/94Hz1Fjf/W0zV7CFFeW5HRLeXTIYzY0jB9n69ZxGXGo6o
	Kf1AqXRDoCz/fT+uNrU75U57ywads+MSG/k85bimuWorZ/mPRc9s4ALIk+Lp8dTwhjKbcjtwKlB5b
	ZDo5xepR3XJrTb6emid0KlKCWNstytNlaHDl8LwHBU8B1UtdIpyVHK6gaPRe9U/oUDS5Sv+l907OI
	Rs7cmwU3dlEwMtmmu10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZu0X-00000005vMX-1NC3;
	Mon, 20 Jan 2025 15:48:09 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtzF-00000005v5M-22IJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 15:46:50 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4677fcf112aso7834441cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737388008; x=1737992808; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyWkEYx8l19GBLVFTRZATObQ9E8Z6bbFOrHEmmyhtMk=;
        b=jB7JdltS7DnxE17+38uTZ7qJN5OLT0+h0RiqsHB89cu/0+DzciPsaIgGG2MQ73mXot
         RCiCad5vqb4pS1pmnrbrSfLRyVY+F5AYaObgiPPMKUmXahcd9aKQHCpZpPEgs1hpA/h9
         CQ9m+25SxLZpUAMxuL9ImW8mV+QPaPyuhBhyAeIFdcS5vi14zhx0oUmurOy/lVwJ8Uz3
         zYeiNnwftZTHc3kOmwr9X8Aeir7OtbBgJxMCAn2KL28XrAxlMTiW2zIgDsbKhEMyOifw
         fFZxTDkZNYSkkvytyXqx2kk37fUF4LcHQsN9WBz+7rwj4mIRzU3LKNmhLBGMEP8TAbwC
         QlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388008; x=1737992808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyWkEYx8l19GBLVFTRZATObQ9E8Z6bbFOrHEmmyhtMk=;
        b=XgwLgAyeaFzrp/ObABhyfz3Pl8riwsVQkBuUotMq0QMhP8BUVeTRBnuQdSO8ulKsdE
         vW8dC8hQK9Vckgvy48qbc3gJRekpaDKMnzLvqSRoERauVSJMxE2QHOAGKLNQ9q3wVz5d
         +yw53PcsDnLyzbhwmSIdu3l1AJ6DG4awx6QvOsrf38sellI/8qgygDc/jbykvWNcSCYj
         eCZHcMH/7Kg7uuayka5ciKh1V3aWMks4lOC/sbeJpsS5pHr0AABnNBU7bLBQFNHjZ6As
         C27NNDyv01qFoDbEiPyGPvVtRv4lFd4L3N1V++T8bcDOSp6hFlhNBjbLHSkfWM78t8xB
         nmwA==
X-Forwarded-Encrypted: i=1; AJvYcCXm7e6O0/s/GNKVhowQqv6zmGIexPr9IHxe0vla1rr8QeTsZzBpwUx8ZZOXpOLdfUOPmdj+VpnO3DZ3qkwlYjb/@lists.infradead.org
X-Gm-Message-State: AOJu0YwtDuJP4/VyXcjeDt/hp+/i+Ueo/PX36GTxyJgfl1zwGLZUfcph
	I59mcDFYx2Lm0yPkdIpnNhanvXdJ5e0VFJkqijCL/mXgtXFdmBbb
X-Gm-Gg: ASbGncupW3yNWcEURmh/PHiNVLGDIk3SfZOWS9qLvY7cdGSpBe/QTGebICRe0WePRIO
	OkArH1ffV6ASeK8bNco1LTHMiuhy7++cVTsSohy6pmX4d4ZPUWtNyv6UdFrK69uguRDgOiNbV3o
	uz7A/RgfXU7AELjbJHfnU+UWTZOsj2tZ183LpaPezwavn22i/kk3fycc13NJPDWrLlJExKe485M
	rTKrub61JpERl7YiKRWx4x3JP4zsxaZNAKl+X3wDGP7JeVAPIaJW9pmVypApMYBUshNrk+5o0fs
	oLaiQLz4biVMc4I6wvqRbTBOAuj2
X-Google-Smtp-Source: AGHT+IHR7cjTCixBLNtbAIMXQS0zWLEWtnuMbfw/UHe2dC10Tj90Pa0lJRvcim4eXFdZ/kNXVMOUoQ==
X-Received: by 2002:a05:622a:4ce:b0:467:6eee:1138 with SMTP id d75a77b69052e-46e12a4a7bamr72560861cf.6.1737388007681;
        Mon, 20 Jan 2025 07:46:47 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e258c82a6sm24230501cf.59.2025.01.20.07.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:46:47 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v2 0/3] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Mon, 20 Jan 2025 10:46:44 -0500
Message-Id: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAORvjmcC/42NTQ6CMBCFr0Jm7Zj+BBVX3sOwaMsAk1AgLRAM6
 d2tnMDl916+9w6IFJgiPIsDAm0ceRozqEsBrjdjR8hNZlBClULKO/rosZtXbM06LNjyThFH2he
 sbqRF9RBKk4Ssz4HONtvvOnPPcZnC53za5C/9Y3STKNC6ymqtbNkI++q84eHqJg91SukLjY83x
 cAAAAA=
X-Change-ID: 20250117-msm-gpu-fault-fixes-next-96e3098023e1
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737388006; l=2714;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=lKYxJxxQvusCy8B0sZYN2iP5UpseVkNuNGCfUBuNbWw=;
 b=f7olHGP2Z1qbp+CTIun177dJ1Ntn9nRXTPCjKXceI0rQQ0OUsCtI3Md/ssDJM/frqEjSzshHy
 hqtiuQ1+59vB8KCwoMHx8rX0iYy3xcsxCtrxJQKSpnIDad2eWBW4ik7
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_074649_532144_6331B432 
X-CRM114-Status: GOOD (  17.25  )
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

Patch 1 fixes the first problem and is independent of the rest of the
series. Patch 3 fixes the second problem and is dependent on patch 2, so
there will have to be some cross-tree coordination.

I've rebased this series on the latest linux-next to avoid rebase
troubles.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v2:
- Remove unnecessary _irqsave when locking in IRQ handler (Robin)
- Reuse existing spinlock for CFIE manipulation (Robin)
- Lock CFCFG manipulation against concurrent CFIE manipulation
- Don't use timer to re-enable stall-on-fault. (Rob)
- Use more descriptive name for the function that re-enables
  stall-on-fault if the cooldown period has ended. (Rob)
- Link to v1: https://lore.kernel.org/r/20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com

---
Connor Abbott (3):
      iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Temporarily disable stall-on-fault after a page fault

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  4 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 42 +++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 24 ++++++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c            |  9 ++++++
 drivers/gpu/drm/msm/msm_mmu.h              |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 45 +++++++++++++++++++++++++++---
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 30 ++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
 9 files changed, 152 insertions(+), 6 deletions(-)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


