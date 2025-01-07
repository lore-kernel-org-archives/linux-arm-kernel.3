Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD89E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJHF6OgALpXsDMgREdanysBcHUY87rvlDcgFVe73W1A=; b=sGnOhWdtEJrNg18ykVTmvleuih
	YpQwAeOk71pyCaAIEJJ5ViM0cDojgUxXSJkPeWxREqWf7P6P7pnUTtV/jhu/4av1wVITgXypxMNlQ
	RrnLaaT1CGFcMC2dHQbYvNNfeqCyn3W6uUv7+udLPJ3jlSDWFvGm5HZ9zGksaZGe7yZ+pojoIeVNk
	C1Pq06dBvqvbhVmELS197RYfvUCX2BoyZxGK8XPjE3r0Qb7xTaOf5tTgYus5xEcyla2jJFqulRkHL
	wDaYHVmQjGUBqYe/F38MykA65OMuxe1+7C7D09gbuQxbEcFxsAwD2GEd87nds2rF0RdsdIy7oJfsT
	3DT3PDxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV998-00000004rwc-266J;
	Tue, 07 Jan 2025 12:57:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV97q-00000004rV2-0EjH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 12:56:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso45435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 04:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736254560; x=1736859360; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dJHF6OgALpXsDMgREdanysBcHUY87rvlDcgFVe73W1A=;
        b=0Wy9Bonje6AB+wsbcdUlFfsYSIi6GBjT2iIe09n2ZEVKUql7uV4jh/+Zk9WHOFuw5V
         NVLhIrQoB8GVViAJBO6AFxiv3uRWVzaDcVKezYdAcQrG+JVvNnDzKVCXdEB1Sp69FILP
         dmQJZTTcHSUrenrwOaoiCIHKeDfBCZiDac3rbR6Ru/rEUxhC4RccFyj0nYi9rEU7Nh0I
         NH1XFd1tH9TI9Y8yyeEo4ds8HyanyMTO2GaenD6IvvSSxGHs/+rdh3oxDTgl9YFd/uMv
         vb/FxJ4J1oGs0OxDcTYHn50DADwGdvyzHllnF4HEdMu5JA2MtlVUZlMobJIyJZ7Rol9H
         c4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254560; x=1736859360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJHF6OgALpXsDMgREdanysBcHUY87rvlDcgFVe73W1A=;
        b=RtS00kcWWGgJ8b9SPLwHMj9v7x70cNgzBiIzj0bN/JRUYCa6YhfSf7rGYx0CpRSYX9
         o25JWKbwllulSzuTNANjWIy8MyRcyUvP8B8qJZyM6NpR6WjrynjVB/sqVkSSM0cbtnO5
         f+49wRFd3aM/lWEMXSZ76eywljqbR4vSDF/PakUfemb6RIhO5CQPCD5MnISBG5pPyMw9
         e8D2l00CddS1W2AHGEGfeEjhc8t9nZ/E379f9KFz6UV0nd1PGEIR+ZlfVmHJuQUls8FB
         LTA3LBxZm/7ewP9VpCVk1rG0Q+FlBdnwbXDh2cw5zxBliaqrcgO2nsUy+Wq/oJ2VIbvy
         d6WA==
X-Forwarded-Encrypted: i=1; AJvYcCXH4my9n/P3dZLQNfmNkRM5zttyqw053YINkwkAOtnMyZJ+lB/M/QCc3vI/C1+Ouqj3S5DPJEAdzPtitdV0o42q@lists.infradead.org
X-Gm-Message-State: AOJu0YzS9lvA8Q/e8ob7G1otEHcw0nzp3JFEq1witi0ioGiug30ExY4Q
	yNUNqNjnd0P9RTRgr6DpqwU1BqAByP7SFu7dZNuhnmXYNbbx+y3FO7LbO6j2CA==
X-Gm-Gg: ASbGnct0CSWA6DgfP8wlm8CF9SSG+sWmRUCUoqcCigCzhQf7UVTl5WRHNsj5+NBG5dt
	ZvxKL9lhrQ8hdHBfpxRKasg4CdBG+A1Vol6YaYsG/7Nd7Z3MHadfvBbRXe63RbFXKYKLaBTmhKS
	hfUd0DZeFEIJijAl9DfuQRgw+86S87b5vnxj9xzchE7RwxoS7khx4lVYwwSLUlZy6agqds88QFH
	C422KbpFrRzwhVY0ubhyMGatXaLiOAIsFQ+S1vLfTpQiwZUp7nN+c3P/pmPzE8CWvWz/UtLemEN
	ZQZZTBHT5lDVcGvL4Ic=
X-Google-Smtp-Source: AGHT+IGshgYKYU49AS8Yt3DzTbm9jzfDb1zOfiYsDlqWPz/kk/iuG9opzk/qyzVKRNqNypOg626I8w==
X-Received: by 2002:a05:600c:4f8f:b0:434:c967:e4b5 with SMTP id 5b1f17b1804b1-436dcf7356fmr901395e9.1.1736254559456;
        Tue, 07 Jan 2025 04:55:59 -0800 (PST)
Received: from google.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a2e25edbbsm42740762f8f.110.2025.01.07.04.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:55:58 -0800 (PST)
Date: Tue, 7 Jan 2025 12:55:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joao Martins <joao.m.martins@oracle.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v11 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
Message-ID: <Z30kWxVxwJXO_z2_@google.com>
References: <20241210165127.600817-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241210165127.600817-1-robdclark@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_045602_095224_80BCEF8A 
X-CRM114-Status: GOOD (  24.29  )
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

Hi Rob,

On Tue, Dec 10, 2024 at 08:51:18AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This series extends io-pgtable-arm with a method to retrieve the page
> table entries traversed in the process of address translation, and then
> beefs up drm/msm gpu devcore dump to include this (and additional info)
> in the devcore dump.
> 
> This is a respin of https://patchwork.freedesktop.org/series/94968/
> (minus a patch that was already merged)
> 
> v2:  Fix an armv7/32b build error in the last patch
> v3:  Incorperate Will Deacon's suggestion to make the interface
>      callback based.
> v4:  Actually wire up the callback
> v5:  Drop the callback approach
> v6:  Make walk-data struct pgtable specific and rename
>      io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
> v8:  Pass pte pointer to callback so it can modify the actual pte
> v9:  Fix selftests_running case
> v10: Call visit cb for all nodes traversed, leave the decision about
>      whether to care about non-leaf nodes to the callback
> v11: Adjust logic in 3/4 [smostafa@]

I see the level initialization was not removed as it was in the diff[1], so it
seems to me that’s redundant as the level is set anyway in the callback, and
actually looking at that I see it’s not used or printed from the driver,
so may it can be removed all together, anyway that’s nit that may be Will can
fix it up while merging.

Otherwise, For the whole series
Reviewed-by: Mostafa Saleh <smostafa@google.com>

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index ed3ba47df350..a884af8fb101 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -731,7 +731,6 @@ static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
 {
 	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
 	data->ptes[lvl] = *ptep;
-	data->level = lvl + 1;
 	return 0;
 }
 
@@ -746,8 +745,6 @@ static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
 		.end = iova + 1,
 	};
 
-	((struct arm_lpae_io_pgtable_walk_data *)wd)->level = 0;
-
 	return __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
 }
 
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 0f17a38a304d..c62e344a4058 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -190,7 +190,6 @@ struct io_pgtable_cfg {
  */
 struct arm_lpae_io_pgtable_walk_data {
 	u64 ptes[4];
-	int level;
 };
 
 /**



[1]https://lore.kernel.org/all/Z1AtDgLD0SDUxDHl@google.com/

Thanks,
Mostafa

> 
> Rob Clark (4):
>   iommu/io-pgtable-arm: Make pgtable walker more generic
>   iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
>   iommu/io-pgtable-arm: Add way to debug pgtable walk
>   drm/msm: Extend gpu devcore dumps with pgtbl info
> 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  10 ++
>  drivers/gpu/drm/msm/msm_gpu.c           |   9 ++
>  drivers/gpu/drm/msm/msm_gpu.h           |   8 ++
>  drivers/gpu/drm/msm/msm_iommu.c         |  22 ++++
>  drivers/gpu/drm/msm/msm_mmu.h           |   3 +-
>  drivers/iommu/io-pgtable-arm.c          | 157 +++++++++++++++---------
>  include/linux/io-pgtable.h              |  15 +++
>  7 files changed, 167 insertions(+), 57 deletions(-)
> 
> -- 
> 2.47.1
> 

