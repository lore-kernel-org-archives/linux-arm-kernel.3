Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6AFC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxNGLVvBoDB549OTJwTVX80yqxzNkqnyUmP8nOzpMNA=; b=A/RmmR7xB1qEaiNE3xdfyA7j1f
	6XBuP0VYAQSUFLqDgzsPfPDuZW4OKG379wtcWCj8YgAzzehYy1XogsyIRwEYMKQ/YjkKkPJRsACgB
	JF5mDg6aAw3JYir1c4vlX9wGnCX0ZAgSEWzo5WzesTywgowntnENnnSWsQ7iv5+kiVQfJ4vzH8RjN
	ddwIIENrcx5Fdyul68chAhn4mrFwpVqBvawjanb+7TnLWSdj12jj/hSJiibHCVH+NuXkTOqCw2c5f
	G1tRGcY5w+EFwB3xKNm7RgQnHeDv30rfiK9JXrm1FUtgOgHkzsxdioexm6X2sLG/fZRUDQcBbkiuC
	HvaYjnlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSwt-00000006opX-0QnU;
	Tue, 17 Jun 2025 09:49:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSiv-00000006m03-0Fv1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 09:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750152920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sxNGLVvBoDB549OTJwTVX80yqxzNkqnyUmP8nOzpMNA=;
	b=AvQaWm3Ht43NUfF8OAsJlinLYj89bH5Eq8bxCkS4mbxA9H1BceW2396vZ1qDdy45emtXj5
	qpqEv05cJWHMFG0aICNwX9jXR1/EZt5eE5lq6cbzeoZSNA6JVBLDpPeGR17emuziG4LTJV
	MnQMM//W58fqwMoG51P8ZntcvTxrYQA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-rInfeOnEPcmN-Hvb5SKT1w-1; Tue, 17 Jun 2025 05:35:18 -0400
X-MC-Unique: rInfeOnEPcmN-Hvb5SKT1w-1
X-Mimecast-MFC-AGG-ID: rInfeOnEPcmN-Hvb5SKT1w_1750152917
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso3047625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 02:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152917; x=1750757717;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sxNGLVvBoDB549OTJwTVX80yqxzNkqnyUmP8nOzpMNA=;
        b=gqkLDcg0hhGzSBMitk66bOKEzdfVhmralJW38MVlY0bnvIaGrNQc1uvCKPDZ3hmXBv
         jcFRvWCyi8pDqR9F49rBQA/9AWW7kLe+cesh7mvrJ8oat9z0NY6Eu/mOJ2QPWgXJ4obI
         VaN8C9m8zyFbuAUzlaGwBSoUcAo7J7gdjDtyrf/d4CDFBKNLm9fhaScwBPVcfnBohPit
         TTy5wrstSe9HgefoSIm4c0yV1s967d/vtlK2uexSxMbb3l1evXKmdpSTTms4dzuHawHZ
         4mMrP71xqsqVEm2pknu5Vh+ylNSGMucObVWuF6Ar5tzspzFn2hgjha9eTUW2wD+iX3Dq
         j+og==
X-Forwarded-Encrypted: i=1; AJvYcCXL5CpZtBCVfXnWgBDhOYflKliGMkaloVo7taeRtOdLUAoXEpeDEIM4e7K+ogd+Ul9ko9Ud4iCx/10RJmIVdeXl@lists.infradead.org
X-Gm-Message-State: AOJu0YywSVjwtoIKe6jWvKc3M4wOVy1wzcyiU2/6kCXSydbJ1VLf5rHX
	ZyOJCdiA0MMgFGtu4pPL92CJNw0jNIFaooGiVaQpuwB7bkv9l77ABmDuRIdDyYNbkgY3OX0IaNk
	0WqwonldDCSza23oH7b+iscbgW1JdsM0hbafD81cSLtGNkN/5Qj3w4nt+Kf8HsdJvtluY3UZBsU
	Go
X-Gm-Gg: ASbGncuLDNjD3i3/GlAMXm1Kf2KCctFOwF9GhDuaM9KXhd3CvP1WXkUFEdQO+Ydo7bW
	Db57Q1xp9jSUdXl/pKJtfpQld5LrtTjJyblSuryfnlA5BZI0FhUGm44OiCPD/SgmOJLPbVI4GbO
	UYSmmijQ3DbJ2YrK84z0SNKcXbscH6oXpAI2nXBTMJB9mu5qkcO+z/HJmB5Ez09hV9twW35VifD
	KMuBs7kFjUuhqptoLNBvo4/WTM63r6cAt0aREIhDXa7aXwGTdDmp9JRg7dp/EAsbuRR5k/ImsL0
	kxe+TK1prmLBolc/prFbvjiepCDL4wjwfxpXjQ7WLzJIQn8AfsIYrU/tziUUFh1hHSftJl6Kgsz
	z69H3T8Butb5NEZJsGzmkGgQfB8F1y7KXZy5z+LyU1T7G4fw=
X-Received: by 2002:a05:600c:64c8:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-4533c92e02dmr116196975e9.9.1750152917439;
        Tue, 17 Jun 2025 02:35:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEit+yPVLJbHP2/NKoMhgu9bHwQKBDL8e7RYDOzVbEtAUjPvQmNHH9hZ4psmoetdsF5NGVCyg==
X-Received: by 2002:a05:600c:64c8:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-4533c92e02dmr116195515e9.9.1750152915523;
        Tue, 17 Jun 2025 02:35:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a57b15015fsm7801901f8f.95.2025.06.17.02.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:35:15 -0700 (PDT)
Message-ID: <69bea6b9-e9e7-4d17-843c-001029d4f2c2@redhat.com>
Date: Tue, 17 Jun 2025 11:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] mm: Remove callers of pfn_t functionality
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net,
 m.szyprowski@samsung.com, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <657be8fef1f0d15c377ad3c420d77ca4db918013.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <657be8fef1f0d15c377ad3c420d77ca4db918013.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: drYZMoVzdOhF1uqKvEbMutdhJL6pxsyK3bQa6tI9hK0_1750152917
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_023521_183516_D614D6E1 
X-CRM114-Status: GOOD (  12.70  )
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

On 16.06.25 13:58, Alistair Popple wrote:
> All PFN_* pfn_t flags have been removed. Therefore there is no longer
> a need for the pfn_t type and all uses can be replaced with normal
> pfns.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> ---
> 
> Changes since v1:
> 
>   - Rebased on David's cleanup[1]
> 
> [1] https://lore.kernel.org/linux-mm/20250611120654.545963-1-david@redhat.com/
> ---
>   arch/x86/mm/pat/memtype.c                |  1 +-
>   drivers/dax/device.c                     | 23 +++----
>   drivers/dax/hmem/hmem.c                  |  1 +-
>   drivers/dax/kmem.c                       |  1 +-
>   drivers/dax/pmem.c                       |  1 +-
>   drivers/dax/super.c                      |  3 +-
>   drivers/gpu/drm/exynos/exynos_drm_gem.c  |  1 +-
>   drivers/gpu/drm/gma500/fbdev.c           |  3 +-
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c |  1 +-
>   drivers/gpu/drm/msm/msm_gem.c            |  1 +-
>   drivers/gpu/drm/omapdrm/omap_gem.c       |  6 +--
>   drivers/gpu/drm/v3d/v3d_bo.c             |  1 +-
>   drivers/hwtracing/intel_th/msu.c         |  3 +-
>   drivers/md/dm-linear.c                   |  2 +-
>   drivers/md/dm-log-writes.c               |  2 +-
>   drivers/md/dm-stripe.c                   |  2 +-
>   drivers/md/dm-target.c                   |  2 +-
>   drivers/md/dm-writecache.c               | 11 +--
>   drivers/md/dm.c                          |  2 +-
>   drivers/nvdimm/pmem.c                    |  8 +--
>   drivers/nvdimm/pmem.h                    |  4 +-
>   drivers/s390/block/dcssblk.c             |  9 +--
>   drivers/vfio/pci/vfio_pci_core.c         |  5 +-
>   fs/cramfs/inode.c                        |  5 +-
>   fs/dax.c                                 | 50 +++++++--------
>   fs/ext4/file.c                           |  2 +-
>   fs/fuse/dax.c                            |  3 +-
>   fs/fuse/virtio_fs.c                      |  5 +-
>   fs/xfs/xfs_file.c                        |  2 +-
>   include/linux/dax.h                      |  9 +--
>   include/linux/device-mapper.h            |  2 +-
>   include/linux/huge_mm.h                  |  6 +-
>   include/linux/mm.h                       |  4 +-
>   include/linux/pfn.h                      |  9 +---
>   include/linux/pfn_t.h                    | 85 +-------------------------
>   mm/debug_vm_pgtable.c                    |  1 +-
>   mm/huge_memory.c                         | 21 +++---
>   mm/memory.c                              | 31 ++++-----
>   mm/memremap.c                            |  1 +-
>   mm/migrate.c                             |  1 +-
>   tools/testing/nvdimm/pmem-dax.c          |  6 +-
>   tools/testing/nvdimm/test/iomap.c        |  7 +--
>   tools/testing/nvdimm/test/nfit_test.h    |  1 +-
>   43 files changed, 109 insertions(+), 235 deletions(-)
>   delete mode 100644 include/linux/pfn_t.h
> 

Lovely

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


