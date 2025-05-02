Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBF0C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TunKzoLEJR5EJu7jJjlTuy7onTJgUGYDWPQXzRBljII=; b=I7nme+zojyf8Qv9MWZQ1xh3knG
	KV1vHXGI9FAa74rLpL/XcZEjmOoxDG+faLvkjL3QdjGZNWwQ6CX6Y7/Z+xA8x1bn6R0V3KYHCcq3D
	d8V+UqSiH733MCpi48OK0IBmIrrPGkNu0p+JyjFwb8b28PgyeU7JEGpxI/TZV72zhQmGPG1XjYj/d
	zNNLJIYz51ULW/NfHpg6ZNZQjANozKTD/0UcQW7DEhOYlvucI7TgAXxcGp/Dd0LEMFBNnxwpB9Po1
	C1b/zM70qnjwfbKWK7BRC1uEQFfpjH9DlArzGBZ3Cbwn5uVbWJtzt6pfd5CXSPgjpPnb5CgpIHMXI
	fug1TeGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6b-00000002ePk-1aG3;
	Fri, 02 May 2025 17:23:21 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtqv-00000002bT5-3osg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 17:07:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2260c91576aso22499655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 10:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205629; x=1746810429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TunKzoLEJR5EJu7jJjlTuy7onTJgUGYDWPQXzRBljII=;
        b=R2wa/dCPGSXMVSU1qoLNvt5xltRyHUC+DWgqsU4G7UJkMwwVDDdYiNokhzAl89s00i
         EaRwUIhMWPdVTG84vEeJJn6LVGVuoxhkJJdWHqXUtQJXReLpwPM+hp6s5qgxa8ULXt9w
         9CQAzWdUMfg/kWVw/yPNDgBt6pSXPBcVKxOaqxVfrqeX2mmp8bt0XxTIXgpCXnVr35tF
         kUyy3+iNyuVv9HmqrLzxqGbnlaYUD6G9pvSa0thX3xhb+JZIftEs/YZwi5OYMxOWTPzx
         WftKyYAavmOpbjPcRAsJY8t67nMZIgVmuyngSLfR8S4R64/xFXriKZAepP6u3Z5x8ZIi
         eyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205629; x=1746810429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TunKzoLEJR5EJu7jJjlTuy7onTJgUGYDWPQXzRBljII=;
        b=fEE3z9sbJLpkR0w0AuPWhrqrGAdgbFE5T0JCNF4XViXijlKc8hoLOXWGewu1ud/eA9
         7BHTtJbSiRxRIVHsXRMnNKBAHNBIDD+OxdNOsVmSDXcRGwiGvhhKCkoSGE7Stdl4pt15
         SGXFBXCEQt0i0aQRzSvoLdy3l04PuKKX8tU2qVruVG2ob1V73xr1DLSidGMOAE2mrA0G
         8gL9VBNm+0+rcVyehIp9NHr5d9ioRVefP4MtUYHKKiWYKgoFoRHXBF6KRNg/8FjaXDgc
         uIbljYP42xDD6SyyzYWVJky9MvoqEbjiGbJEH3z//bTcKYHRFVU6cmKSuoT904yTJsL8
         QsGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY8O7PdtE7rHUNi9Lf0Vj2+ltGYidr+qW4s6foiRz5La4PsONeytApBrKuwHh8PSO39s6pCZCML2om7Tl6G7nv@lists.infradead.org
X-Gm-Message-State: AOJu0YyRcFKmp/dVeYY37nv56YHSSsaq9JTVdzH9AjTt8bSNaUJ05yrw
	CA5FBVE1d2qpwCP007bcRSMxSCiizoXtMrNlrZYxDtFC5XODZzh9
X-Gm-Gg: ASbGncsfs2yHYrUFoJO6i/LZ3Pr7YuWyBi7PtBDXZcmczfhyugXK/LaDFLBnD2xfGCG
	y1X8c1fc2y5wYhUf5uNc4/qc8Kb7x/6ctpTfJhxSPCJu6cLUgMCDUD38dCxpvYTawXRX6RfVO4p
	i+HAglUSNeUUKUmtKBWyVMqUH5Vc2S9yXDDOsADRVLJbO7LzOBf9U8t02tpL+XeWhFaac8Uihe7
	iKGtWNtN0dNoisuvDhBdSePyTBHaddtMic5DWD0NUunVMZzWysy03jZuqFUiappSuNRXKd2C+H5
	gAL2Rkhlto97JeCJZ4jT8ub3SGyC7+N8RkrokrMzMVA//VbP4DIIeM2M5sr0SLNwXqTN/0eIBsx
	T30Xo5NxOswZCos0=
X-Google-Smtp-Source: AGHT+IE/Vs9DjTxhGgDydtiPPcIuTgYawUe+pebY4/T1joTUH5wBFPaEByUbsh42IWm4peUk0OXRgA==
X-Received: by 2002:a17:903:2447:b0:224:1157:6d26 with SMTP id d9443c01a7336-22e10311c7cmr56146565ad.4.1746205628501;
        Fri, 02 May 2025 10:07:08 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920f6dsm1032598a12.10.2025.05.02.10.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:07:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Christopher Snowhill <chris@kode54.net>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	Marijn Suijten <marijn.suijten@somainline.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sean Paul <sean@poorly.run>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 00/33] drm/msm: sparse / "VM_BIND" support
Date: Fri,  2 May 2025 09:56:27 -0700
Message-ID: <20250502165831.44850-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_100709_954894_5320E994 
X-CRM114-Status: GOOD (  19.94  )
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

From: Rob Clark <robdclark@chromium.org>

Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sparse
Memory[2] in the form of:

1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP/
   MAP_NULL/UNMAP commands

2. A new VM_BIND ioctl to allow submitting batches of one or more
   MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue

I did not implement support for synchronous VM_BIND commands.  Since
userspace could just immediately wait for the `SUBMIT` to complete, I don't
think we need this extra complexity in the kernel.  Synchronous/immediate
VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.

The corresponding mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32533

Changes in v4:
- Replace selftests_running flag with IO_PGTABLE_QUIRK_NO_WARN_ON [Robin
  Murphy]
- Rework msm_gem_vm_sm_step_remap() for cases that orig_vma is evicted
  to solve some crashes
- Block when drm_file is closed until pending VM_BIND ops complete, before
  tearing down the VM's scheduler, to solve some memory leaks.
- Link to v3: https://lore.kernel.org/all/20250428205619.227835-1-robdclark@gmail.com/

Changes in v3:
- Switched to separate VM_BIND ioctl.  This makes the UABI a bit
  cleaner, but OTOH the userspace code was cleaner when the end result
  of either type of VkQueue lead to the same ioctl.  So I'm a bit on
  the fence.
- Switched to doing the gpuvm bookkeeping synchronously, and only
  deferring the pgtable updates.  This avoids needing to hold any resv
  locks in the fence signaling path, resolving the last shrinker related
  lockdep complaints.  OTOH it means userspace can trigger invalid
  pgtable updates with multiple VM_BIND queues.  In this case, we ensure
  that unmaps happen completely (to prevent userspace from using this to
  access free'd pages), mark the context as unusable, and move on with
  life.
- Link to v2: https://lore.kernel.org/all/20250319145425.51935-1-robdclark@gmail.com/

Changes in v2:
- Dropped Bibek Kumar Patro's arm-smmu patches[3], which have since been
  merged.
- Pre-allocate all the things, and drop HACK patch which disabled shrinker.
  This includes ensuring that vm_bo objects are allocated up front, pre-
  allocating VMA objects, and pre-allocating pages used for pgtable updates.
  The latter utilizes io_pgtable_cfg callbacks for pgtable alloc/free, that
  were initially added for panthor.
- Add back support for BO dumping for devcoredump.
- Link to v1 (RFC): https://lore.kernel.org/dri-devel/20241207161651.410556-1-robdclark@gmail.com/T/#t

[1] https://www.kernel.org/doc/html/next/gpu/drm-mm.html#drm-gpuvm
[2] https://docs.vulkan.org/spec/latest/chapters/sparsemem.html
[3] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=909700

Rob Clark (33):
  drm/gpuvm: Don't require obj lock in destructor path
  drm/gpuvm: Allow VAs to hold soft reference to BOs
  iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
  drm/msm: Rename msm_file_private -> msm_context
  drm/msm: Improve msm_context comments
  drm/msm: Rename msm_gem_address_space -> msm_gem_vm
  drm/msm: Remove vram carveout support
  drm/msm: Collapse vma allocation and initialization
  drm/msm: Collapse vma close and delete
  drm/msm: Don't close VMAs on purge
  drm/msm: drm_gpuvm conversion
  drm/msm: Convert vm locking
  drm/msm: Use drm_gpuvm types more
  drm/msm: Split out helper to get iommu prot flags
  drm/msm: Add mmu support for non-zero offset
  drm/msm: Add PRR support
  drm/msm: Rename msm_gem_vma_purge() -> _unmap()
  drm/msm: Lazily create context VM
  drm/msm: Add opt-in for VM_BIND
  drm/msm: Mark VM as unusable on GPU hangs
  drm/msm: Add _NO_SHARE flag
  drm/msm: Crashdump prep for sparse mappings
  drm/msm: rd dumping prep for sparse mappings
  drm/msm: Crashdec support for sparse
  drm/msm: rd dumping support for sparse
  drm/msm: Extract out syncobj helpers
  drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
  drm/msm: Add VM_BIND submitqueue
  drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
  drm/msm: Support pgtable preallocation
  drm/msm: Split out map/unmap ops
  drm/msm: Add VM_BIND ioctl
  drm/msm: Bump UAPI version

 drivers/gpu/drm/drm_gpuvm.c                   |   15 +-
 drivers/gpu/drm/msm/Kconfig                   |    1 +
 drivers/gpu/drm/msm/Makefile                  |    1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   25 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c      |    5 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |    4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   22 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |    2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c     |   10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   32 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   49 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |    6 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   10 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |    4 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   88 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   23 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |    4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |    6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |   28 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |   12 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |    4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   12 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |   14 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  183 +--
 drivers/gpu/drm/msm/msm_drv.h                 |   35 +-
 drivers/gpu/drm/msm/msm_fb.c                  |   18 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  489 +++----
 drivers/gpu/drm/msm/msm_gem.h                 |  217 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c           |   15 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |    4 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |  295 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c             | 1288 +++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c                 |  171 ++-
 drivers/gpu/drm/msm/msm_gpu.h                 |  132 +-
 drivers/gpu/drm/msm/msm_iommu.c               |  298 +++-
 drivers/gpu/drm/msm/msm_kms.c                 |   18 +-
 drivers/gpu/drm/msm/msm_kms.h                 |    2 +-
 drivers/gpu/drm/msm/msm_mmu.h                 |   38 +-
 drivers/gpu/drm/msm/msm_rd.c                  |   62 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |    4 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |   96 +-
 drivers/gpu/drm/msm/msm_syncobj.c             |  172 +++
 drivers/gpu/drm/msm/msm_syncobj.h             |   37 +
 drivers/iommu/io-pgtable-arm.c                |   27 +-
 include/drm/drm_gpuvm.h                       |   12 +-
 include/linux/io-pgtable.h                    |    8 +
 include/uapi/drm/msm_drm.h                    |  149 +-
 57 files changed, 3043 insertions(+), 1227 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h

-- 
2.49.0


