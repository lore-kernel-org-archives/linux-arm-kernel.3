Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A971D735F0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 04:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmPhZNGPE8mMemtgd5DQsk0URwF4+NKg4toOn7tg90Y=; b=rpijz4Pa6s3dQ8ZruRRXFTB5Gk
	BX7f+dJb4hOcqsRVNTZhb+GlTRWDpI8Xmo3s29CXCflgCB4AScjn4HDOjsEXWBaXwmEp4US5HW6MQ
	YVwCalNz6dmuPKMmUU6ddRJIBVuKVYlb8g+Qv58csVg7Eg1NKMyrIdl03DTFa8W754cQSe3d8ETXP
	j0+aEGXNu1zzfj2OU1odFCIJS2maNBMwQqjw22jjfL1eF9iQwUUhgQW2VzzKtbPLm0QnMqOQdKJ5X
	tkFB7m9T6mqmkbpQHdQYg5SbmFtZkadhDHkWuRTZXpcNMN4Vbl3g6jNeKRmLB/I//8pp3XpigHhR1
	mGn6xlLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHbSY-0000000317c-1h7q;
	Sun, 01 Dec 2024 04:21:26 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHbRZ-00000003132-2OxX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 04:20:26 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so4270a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 20:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733026823; x=1733631623; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmPhZNGPE8mMemtgd5DQsk0URwF4+NKg4toOn7tg90Y=;
        b=nHGsuHGpHZq3DzaUFdlQD2O3NLlGivce+Y4roWrMJDdtI+MQPuFC/4LRt8mgvPWYNw
         r+lEWctDWxUA3AgUKOEXbq8gBlrdVU6rm8n5wnePfZra2yQBdjARByb+sAekq59u0bIN
         UVn1eAJsDXShTVPdwn37LnrR7SdiKKRClchUj72fpiDS3bElnJRzosUtLgyd0/lnENVL
         3skPqjVTBaXH2BHccbz7tQ18EkRTaXWXCXfhCpA1Kw6bab8tIlzKj8/vQYymKdkq3IQH
         ejkmFL4lmO6bJ3hi+tjKK9ryn70FImuL1vPE+zr4oxVcKgMbPRSx+B3FMQt5/eX74SFU
         rVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733026823; x=1733631623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmPhZNGPE8mMemtgd5DQsk0URwF4+NKg4toOn7tg90Y=;
        b=IAO8A5u5SFtbIpOpT1i6UiUYgHQQFsS/E5+1r2KMOsGIohfhVzVyBZsKqnpl5U+ips
         GPUr7mcg3vGCVke29q6p9LxzjsPVqN2Ytt0h8cQv/Tr+gCPXL05yIk65eiz1YwKfBH89
         HVhok7bc/uLO6PcY+Uv7Ln4TNsI/TmR++OCxWbfDBfrkYBfzbrKBa6ia/B4qcEiwnNxf
         wvXbdLDLLLXZKZ10gHfTOcgYRHWdAiFPIb6BL4AFYpZxLbJSa74+ObC4BI+TfJKydRTR
         +FgSazzkEkP2f1HR9TdxfuW8SlY1bwXV7lsuZ5NcbbdB6oIhFp627yxWvicIH7vSrZZq
         KP1g==
X-Forwarded-Encrypted: i=1; AJvYcCXIw7izhwOELacThaInO9HOYf2tFPrViKexIACqMt/BmscpoPwly8K9FnRXY8eToqGs+hm6FVLIaXMtLEowP/WN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3us8xaQcXTLRlh7IgEsHi9rjF3uV6+LZjWWQ+rcj+lC5htw9z
	2Z8RP39CEFTzNsRtLPki9A5Ntedc0Z8nZnc//lX2GMeUzcJJokMajEg3ShXwaDcrKPDLfWoGbUk
	BeQf71eQTJWSps4S9phUDw8IgasPxim/vE4yF
X-Gm-Gg: ASbGncsK5fScp7FSf1YksBKF5LlVxwE9+6eEGcf7Oam8rABTYSPeQkzyUzCGhuoi3Ux
	UTYsew2qj2psrx85aJAvDVm25s4RaXpexMPKysQE3BYUvxoPgZ6qenPXdSRxr5M1H
X-Google-Smtp-Source: AGHT+IHoeM3ZWdsXpysbtXILaOMhF4g1b9pNpRPjgClx7+msxAyieBJRdcI07s8YXo322NaVWIhNiRHRu3rHoGsXDnc=
X-Received: by 2002:a50:cd5d:0:b0:5d0:bd0d:fc06 with SMTP id
 4fb4d7f45d1cf-5d0bd0dfd4emr82853a12.4.1733026822501; Sat, 30 Nov 2024
 20:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20241024162516.2005652-1-smostafa@google.com> <20241024162516.2005652-2-smostafa@google.com>
In-Reply-To: <20241024162516.2005652-2-smostafa@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sat, 30 Nov 2024 20:20:10 -0800
Message-ID: <CAE2F3rDyj8WohXHTa1H3_gqTndyJL3cUEfBnXCEibNo1oYTt3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/io-pgtable-arm: Fix stage-2 map/umap for
 concatenated tables
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_202025_632653_94D35C11 
X-CRM114-Status: GOOD (  26.39  )
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

On Thu, Oct 24, 2024 at 9:26=E2=80=AFAM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> When calculating the max number of entries in a table, Where
> RM_LPAE_LVL_IDX() understands the concatenated pgds and can return
> an index spanning more than one concatenated table (for ex for 4K
> page size > 512).
> But then, max_entries is calculated as follows:
> max_entries =3D ARM_LPAE_PTES_PER_TABLE(data) - map_idx_start;
>
> This leads to a negative index in the page table, where for:
> - map: do nothing (no OOB) as fortunately all comparisons are signed,
>   but it would return a negative mapped value.
>
> - unmap: it would leak any child tables as it skips the loop over
>   =E2=80=9C__arm_lpae_free_pgtable=E2=80=9D
>
> This bug only happens when map/unmap is requested with a page size
> equals to the first level of the concatenated table (for 40 bits input
> and 4K granule would be 1GB) and can be triggered from userspace with
> VFIO, by choosing a VM IPA in a concatenated table > 0 and using
> huge pages to mmap with the first level size.
>
> For example, I was able to reproduce it with the following command
> with mainline linux and mainline kvmtool:
>
> ./lkvm run --irqchip gicv3 -k {$KERNEL} -p "earlycon" -d {$ROOTFS}  --for=
ce-pci -c \
> `nproc` --debug -m 4096@525312 --vfio-pci 0000:00:03.0  --hugetlbfs  /hug=
epages
>
> Where huge pages with 1GB would be used and using IPA in the second table
> (512GB for 40 bits SMMU and 4K granule).
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-ar=
m.c
> index 0e67f1721a3d..3ecbc024e440 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -199,6 +199,17 @@ static phys_addr_t iopte_to_paddr(arm_lpae_iopte pte=
,
>         return (paddr | (paddr << (48 - 12))) & (ARM_LPAE_PTE_ADDR_MASK <=
< 4);
>  }
>
> +/*
> + * Using an index returned from ARM_LPAE_PGD_IDX(), which can point to
> + * concatenated PGD concatenated, get the max entries of a that table.

I believe the macro that returns an index is called ARM_LPAE_LVL_IDX
not ARM_LPAE_PGD_IDX.

> + */
> +static inline int arm_lpae_max_entries(int i, struct arm_lpae_io_pgtable=
 *data)
> +{
> +       int ptes_per_table =3D ARM_LPAE_PTES_PER_TABLE(data);
> +
> +       return ptes_per_table - (i & (ptes_per_table - 1));
> +}
> +
>  static bool selftest_running =3D false;
>
>  static dma_addr_t __arm_lpae_dma_addr(void *pages)
> @@ -390,7 +401,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable =
*data, unsigned long iova,
>
>         /* If we can install a leaf entry at this level, then do so */
>         if (size =3D=3D block_size) {
> -               max_entries =3D ARM_LPAE_PTES_PER_TABLE(data) - map_idx_s=
tart;
> +               max_entries =3D arm_lpae_max_entries(map_idx_start, data)=
;
>                 num_entries =3D min_t(int, pgcount, max_entries);
>                 ret =3D arm_lpae_init_pte(data, iova, paddr, prot, lvl, n=
um_entries, ptep);
>                 if (!ret)
> @@ -592,7 +603,7 @@ static size_t arm_lpae_split_blk_unmap(struct arm_lpa=
e_io_pgtable *data,
>
>         if (size =3D=3D split_sz) {
>                 unmap_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> -               max_entries =3D ptes_per_table - unmap_idx_start;
> +               max_entries =3D arm_lpae_max_entries(unmap_idx_start, dat=
a);
>                 num_entries =3D min_t(int, pgcount, max_entries);
>         }
>
> @@ -650,7 +661,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgt=
able *data,
>
>         /* If the size matches this level, we're in the right place */
>         if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> -               max_entries =3D ARM_LPAE_PTES_PER_TABLE(data) - unmap_idx=
_start;
> +               max_entries =3D arm_lpae_max_entries(unmap_idx_start, dat=
a);
>                 num_entries =3D min_t(int, pgcount, max_entries);
>
>                 /* Find and handle non-leaf entries */
> --
> 2.47.0.105.g07ac214952-goog
>
>

