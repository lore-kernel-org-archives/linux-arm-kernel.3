Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B65E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JuzEEwZKQf9j9mqhaN0lST/eQY9CbMt5tK8I46FKdZM=; b=m50liy6ivM9OAfwxRNyLxDaI5U
	zf1y7HvHitvS6rAT6+UXLCj1lgLybJg71lo5XseOW19SbtuFHK4NE8tdPO3/KoI9EsNhQbQCZrC/w
	JEp/yMlGle7r53nHQaxlldeDQy2N0ncKSe6YnFHevPRX+JE4CYtaTS5nEtStJP48/hQWKRGn/wk2J
	FmPx/+Fm/IP5mtvyZI8/Mc2jyEHTyWA/ecFbHulDH2herAX/3wkC1izZIU6RPraiW7PVyX2/HDLwC
	4MmAWC1Fo8nfhILqnTkPMjAf//0rsoZulSA0yqk4B6C+iW+1URQH5RqWNwv1WbJvNMBwW6xMt17pf
	Id1naSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Te-0000000CAGh-3jSA;
	Tue, 10 Dec 2024 16:52:50 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Sc-0000000CA0M-03uW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:51:47 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21644aca3a0so27891815ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 08:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733849505; x=1734454305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JuzEEwZKQf9j9mqhaN0lST/eQY9CbMt5tK8I46FKdZM=;
        b=ACxaBqNTrhQj3MRq9JKQlXJP6/XBEfEhj3G1azOK0dsoeMQZk1ErYbYnWIkIRsy1cu
         l6HOHz1yhTGbQjEJZUy1ERQnYUXLOCKUDLkFn9pRrlzCBq2Sw5TWxW4NKIiyX5dlJp6Q
         u4N9Y3lBGG3IAsKak43ZJHhxnH9if2KQPLPvIvnS/38B1A9vK8eyKLfvJTLf50UExmQU
         46nXNWasEhd/yYlbiRuw53kxMt8Jh+PWAQFDqL6KxKqq53YDZZKG8hqFVO4PHBamkQXN
         fv/q+iFo/h27eeqeewRPNr6oO5UDTOD0M6uDsWTyEcE9dP8oTLy7v0KwyljhZt+5gVQO
         KRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849505; x=1734454305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuzEEwZKQf9j9mqhaN0lST/eQY9CbMt5tK8I46FKdZM=;
        b=TCvHMG3gQlYswezY97yfJ6EEpqyk7MpoplQ8byE1vDVECeRh+i9qXRZ0wBvV7ezHll
         3Lf2ZFND0WthOqc628Z2+CC1RvKec2xRZ4OZ8zh+H1chN9rCOqPFPPHAaxyWAL2H2Bje
         Xk2lG4s+T65rZThvzdybYIBSNyTIYSQXJR6xFpfST3ywk/aIaXSjKpCiWUo2xQspxxZH
         I3LAyce5e2yRaaCfvWpmbVVapitZBEyWWA0bemR3caYPn76QI9xd9E+HCFsbQ+cJZkNP
         gfVUtbup2o2xa3GV6GLpIFrMVf5AGbEGn16nb+J9bANo2QjzWLnigx1cqh48egTjeZGq
         XFww==
X-Forwarded-Encrypted: i=1; AJvYcCWSBuLqui8EVhNpF+m10DlbUAuAtNoHfe4U3ihCs36IwfWGelQxVdjH1Jg5+eHc47cVFTuRqoXGR0zA6zFN2xYs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7bJrJr1xzBKOafiroSt/S2fNli7Nv5fTBVHfqaJDy5gydub9e
	MULHdWWo4l4iEiS2rsJEKqjoieRwK7obXSVxyPVofIpneAtGW/Ki
X-Gm-Gg: ASbGnctlc5PPjmwymYPulZ0pjhpbCfop0JCdq8I/6hw7lTNidOY2AFh+BCaQvm0pfa2
	HZMaLqA3V0fZcwaP+pna1+GpD2piO/krUT89Olx9qoj3LEJyKInPSMRXwhNSUp9WqDIAyCwnlNJ
	8c3GXcbm6C4FCrzdJ0vkeV03wcvOlxPw670X/hpJGJzrozWFuR0vu4S9fu+B8d627LmFEpDQnpM
	GmsYoumfKn4cPPvT6eDFb7cJ58JPl2nsNdWjtVZhwgbvPiWTZqlc9aKoMZ46S80fW/au/qIQwaz
	yQtPWdSMbS0zaMuJOIn+CO0viqPy
X-Google-Smtp-Source: AGHT+IHq5GJLA69hWJIqMBI3xX9I2B1vs+oiOQMLHk1Gt8OrfhdtpCShimUSU+G1kzy0p/Cgwakamg==
X-Received: by 2002:a17:902:e750:b0:216:3c36:69a7 with SMTP id d9443c01a7336-2166a0987ddmr69103725ad.45.1733849504588;
        Tue, 10 Dec 2024 08:51:44 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216363a3176sm51054905ad.246.2024.12.10.08.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 08:51:44 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Mostafa Saleh <smostafa@google.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno GPUs),
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joao Martins <joao.m.martins@oracle.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-pm@vger.kernel.org (open list:SUSPEND TO RAM),
	Marijn Suijten <marijn.suijten@somainline.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH v11 0/4] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Tue, 10 Dec 2024 08:51:18 -0800
Message-ID: <20241210165127.600817-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_085146_053575_62056434 
X-CRM114-Status: GOOD (  10.50  )
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
v11: Adjust logic in 3/4 [smostafa@]

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
 drivers/iommu/io-pgtable-arm.c          | 157 +++++++++++++++---------
 include/linux/io-pgtable.h              |  15 +++
 7 files changed, 167 insertions(+), 57 deletions(-)

-- 
2.47.1


