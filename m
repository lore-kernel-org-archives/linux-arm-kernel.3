Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31044D5B158
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 22:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O/WuSIt+DjzGI2XfAN06ei9IlKFvKYq+fLWWtLmBqEs=; b=XaLosCylUAazeUgzygUp0nKWSU
	ZE2g4th+uVP2g9+7aKjHLDxO48FjfYvMZcXi56VUA9VEzwbNxVRsSYeujop5qTduEVz9+9OB6pkaj
	0sdwNGdlyOQro9/fRQl/c2hBki+wjVC5RlKRqHL9npy9SXjgdDpKUmnU9cofvdtxSi0e0da1a4x+X
	NTkTcWuz7j1IhLDillisKwhTKHBNXERJUtw89aXW0+ZePCZFcMG4zCH2gVXO7MQSPsH5xZ7o//EwH
	oNTcvYmEVBg4jKjlAPXLpQ+p/9zqzLbgWp3lo7QCMV4qXzGfn9Ye9uLRZ0g1AS7Lr08rn7hayrkCo
	huNR6m0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Xoc-0000000CSQM-2vih;
	Mon, 28 Oct 2024 22:02:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XOV-0000000CLzo-0yux
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 21:35:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso41393895ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 14:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730151322; x=1730756122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/WuSIt+DjzGI2XfAN06ei9IlKFvKYq+fLWWtLmBqEs=;
        b=h9xHAu2Jx/IbgMfNCXoPfg4TV+TOCtYHlYfokSsTkph4pY37Sgh02qBb23ZmiWHdZk
         JHSaOrGfvMCxTOcB1l2daM+VXy9SnGAZmW4ZaI4X+mRiEGykfvAWhYpc56r5UF0Yp2JA
         Ff7i5qAQ69SXkQTockDP5/PwjJ+JZIPCKpuLDa+06lF+idLZtVu0AZcYPASM+OwZd5HX
         8su+8+z5f7ENEMh3DEmlLEtfRBv620bxVAaQPcjna7zjkUZJ6nayYfUtOIKoQlIOM7zw
         Bd2WfsvQDQWULhSG6UuwZUwqQAKbKEWbGxam3WHx6l6cC5/968PW++GVTSEGQDsL08jo
         c0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730151322; x=1730756122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/WuSIt+DjzGI2XfAN06ei9IlKFvKYq+fLWWtLmBqEs=;
        b=AA35mTlDWjEf6L6lp0/uCwn2KkZzka6aymhHvzRSvxUuMnoLNY8t3e8w4zf9rsvaJj
         QDeq77X4Bfa9aJa5r7oAsuSdyxe/VF+2ZZnhL/5cTPumZVoi/cbD8BC69Vz2LMENXFSm
         O+VzkwCzrsJGsfrX0ebEP4CFLOstmNsKmgnCTLN48yMp9+A42xfqkYv2OciqjgX1tJqD
         2w+EIfKNzwMgodcJByZ1oGyls6r/9xmOxkh+VYMSX5/VWy3U9aiDOOLBCm5piGNlT+gy
         8IfGDG5FtWhDmf1gFz9EDBxqLZKLGgQkgVH5FI8mDCfCuSFogV5dwL7Gizn7hHHtWPxf
         KwYw==
X-Forwarded-Encrypted: i=1; AJvYcCWgiRQjbsKkwuMQXRaopntdirUHDUJ70BACBwpCuGaP1eWxfBfGuI1BjAuNmohM2DuvdGkmtIfnw8OkDs+3na5T@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6FXeg7jBChAFn6Iy9orRZWmVDjTtsllDV6AYd5l5aYwHnoxQz
	70pBq6PcNkPX3jkzimlvYuXsAhVeZuVF/QCrpOz44OlFOb6lC5gC
X-Google-Smtp-Source: AGHT+IHpXaUaQZbGQlSlLzr86C3aCU0KQKQ4WqN1NM7MJCznKl4kJ0inRJj992VpciPWjE7vWWI19Q==
X-Received: by 2002:a17:903:2445:b0:20c:bcd8:5ccb with SMTP id d9443c01a7336-210c6c0610amr146342205ad.30.1730151321914;
        Mon, 28 Oct 2024 14:35:21 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf6d3dcsm55171655ad.88.2024.10.28.14.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:35:21 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Rob Clark <robdclark@chromium.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno GPUs),
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joao Martins <joao.m.martins@oracle.com>,
	Joerg Roedel <jroedel@suse.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-pm@vger.kernel.org (open list:POWER MANAGEMENT CORE),
	Marijn Suijten <marijn.suijten@somainline.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v10 0/4] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Mon, 28 Oct 2024 14:31:36 -0700
Message-ID: <20241028213146.238941-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_143523_305637_D007BD3C 
X-CRM114-Status: GOOD (  11.18  )
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

This series extends io-pgtable-arm with a method to retrieve the page
table entries traversed in the process of address translation, and then
beefs up drm/msm gpu devcore dump to include this (and additional info)
in the devcore dump.

This is a respin of https://patchwork.freedesktop.org/series/94968/
(minus a patch that was already merged)

v2:  Fix an armv7/32b build error in the last patch
v3:  Incorperate Will Deacon's suggestion to make the interface
     callback based.
v4:  Actually wire up the callback
v5:  Drop the callback approach
v6:  Make walk-data struct pgtable specific and rename
     io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
v8:  Pass pte pointer to callback so it can modify the actual pte
v9:  Fix selftests_running case
v10: Call visit cb for all nodes traversed, leave the decision about
     whether to care about non-leaf nodes to the callback

Rob Clark (4):
  iommu/io-pgtable-arm: Make pgtable walker more generic
  iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
  iommu/io-pgtable-arm: Add way to debug pgtable walk
  drm/msm: Extend gpu devcore dumps with pgtbl info

 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  10 ++
 drivers/gpu/drm/msm/msm_gpu.c           |   9 ++
 drivers/gpu/drm/msm/msm_gpu.h           |   8 ++
 drivers/gpu/drm/msm/msm_iommu.c         |  22 ++++
 drivers/gpu/drm/msm/msm_mmu.h           |   3 +-
 drivers/iommu/io-pgtable-arm.c          | 156 +++++++++++++++---------
 include/linux/io-pgtable.h              |  15 +++
 7 files changed, 166 insertions(+), 57 deletions(-)

-- 
2.47.0


