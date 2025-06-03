Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A958DC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 14:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=; b=wE6pJvUV7gpZSIGE/KBbh7Tft5
	i4PzZwr+HEnDyauNsLyYAvoKUf3kbpKe9JwJJ3YvmHEvDdG+m0YkVqqhQ6ElLJJnkzyPjjSOgzVAO
	P827gPAoTvCInqHf7eda5v8vKy7Tkeg5dF/LXgW2aPv/hZNqrPO3Hf34wFpdCmlr7WQ+f4/9iRK+Z
	uuGWLXOB0gicbYLdbpyDj6HHGBJuzK7gI96EExm1jXaQ9cO6d40TVynd1S9W9rcK9WfSjyFUZiEVe
	RQua+q4Gz7pZLOW7ZPrXN82UWDzb0GQdOvIQ4WFAYbgypXw5DF1jqzNEOj76qOAKa3RHXeIO20rAm
	FHTSnk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSJI-0000000B8DQ-1aYO;
	Tue, 03 Jun 2025 14:08:12 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS20-0000000B5gs-1VDn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:50:21 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4a4323fe8caso36985171cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958619; x=1749563419; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=;
        b=hGOTl4yOISHWe/xIfaFHWdtlB720wdTPFkmgfLyjbZDlzwyuiozqjMMQ92Fl2BvV2W
         lUmACY3PF2OP302IwE8q62kub3juMHRa+Kd5qhWnBjGKchlyrhd0pGNlpVH31AGT1hFN
         Ht7Pkfyr7mqgTvVJEUvGF3H1IxCb+x81GijVpz0fRofRHXRUWIjTmIIyqXWfYGc/yAnF
         69Wr8ilpzSKLA16A6fApMBjoKla6354ddEgCbwdMn1gY3dubaok/uuB9MVcXcL/7K3Lv
         wg0UNSvJzFFJJbqBrRiP0vPkHjI1a1m5gBe11hinQwqOSZALC1aIqo2rEHs2ExOteSbf
         ZYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958619; x=1749563419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=;
        b=Ofvfaze0zpRI/Xhm0vxwGzhXJSGmnppq0RKmbOvSE/b03lMCULQOmTnQn3xBOJ60Dm
         dah9OqWXgla76Pv9uq6h1SiFv82AuNNNEsl7TbkmZx9EUYQxBV73RUVCfqJuRLDS4DE7
         Ff/KkAjNjjIwajE9Sb7H/Ajwj33p0MryjWCwS9gc5LF6Uw9J3GOKe65NGUOtjbvIpevB
         9NjS0awCTVxvGeE9SOGW5nfeiVI/mxhhpM/+lpagKT/7EAJnnjGx9B9cW64smjKeRLj7
         s8pzHq2nppQZE9Sz9GLR7CTW3j5aGpAnlQ7WfUby9tePX34Fs4uJjpih6g1l44AyogAT
         sv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIkQjw+UhsDjoDKC7U4iirCtyBsxHzpv8JoF/+ajS6jJ0ylJK4MIpkxf1Vti69S+izY4OUCge/as8DIjoXXIt+@lists.infradead.org
X-Gm-Message-State: AOJu0YwlUkOGEnUeJ7nTm2JnhpAJX7gGTjzUSJdZTBk38QhDM7Gb9Xgl
	gwHHagDBXu02wWMNaGEL0iMj+uy2nNu9c6vzvEYduy6tzMAdUy0y3jGItS/wPztW3ag=
X-Gm-Gg: ASbGncvI8dRgHpd3Me2ftipg8/pT331XLbFgvDJOtaw+Dgu4BghF07vI8dbM5nmf24T
	1s4usI1A/z1vHJwElA2xxml2/qp5n2dSoVfD6StOSrjluW5vfZu5wblQ6+7YQ440XR2gOG5XK14
	tB/uGU/hsW5qS+M7CKG1ScvBbJZLEjDTnZfoJSrue/yGi4Gu3/7Bux1xKn+eGXD/rDwtLaK7aC4
	t5s8Lt+oX38K22NWuHagnAIT0pHkUPXNYS6Rz52z4nCd4Q0n7WvsFpRSnS+01L1OZnvMxstVsWB
	5kDlaeJT4ZkTzumbpdT64MccTanRKoBmFPaoM2Ix7CObZ9gLO8V5oXkwp3PmOtcIBq2jfptfGiC
	3b0YJ9UMNPxTPZv5yHDnB3HclI7A=
X-Google-Smtp-Source: AGHT+IFrQ3mNOrW6/ZBr5BKf2weoO3iOKbQMChhnKb6iKzSLwy4jyxYkXr8u6rUugOKC/0R4gbcrnw==
X-Received: by 2002:a05:622a:4d96:b0:4a4:3171:b942 with SMTP id d75a77b69052e-4a4aed86ba3mr229299171cf.39.1748958619327;
        Tue, 03 Jun 2025 06:50:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a4358eef6csm75933171cf.48.2025.06.03.06.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:50:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS1y-00000001hCj-1MTz;
	Tue, 03 Jun 2025 10:50:18 -0300
Date: Tue, 3 Jun 2025 10:50:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net, Will Deacon <will@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH 10/12] mm: Remove devmap related functions and page table
 bits
Message-ID: <20250603135018.GK386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <32209333cfdddffc76f18981f41a989b14780956.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32209333cfdddffc76f18981f41a989b14780956.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_065020_401176_2C5A4B37 
X-CRM114-Status: GOOD (  11.57  )
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

On Thu, May 29, 2025 at 04:32:11PM +1000, Alistair Popple wrote:
> Now that DAX and all other reference counts to ZONE_DEVICE pages are
> managed normally there is no need for the special devmap PTE/PMD/PUD
> page table bits. So drop all references to these, freeing up a
> software defined page table bit on architectures supporting it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Will Deacon <will@kernel.org> # arm64
> Suggested-by: Chunyan Zhang <zhang.lyra@gmail.com>
> Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
> ---
>  Documentation/mm/arch_pgtable_helpers.rst     |  6 +--
>  arch/arm64/Kconfig                            |  1 +-
>  arch/arm64/include/asm/pgtable-prot.h         |  1 +-
>  arch/arm64/include/asm/pgtable.h              | 24 +--------
>  arch/loongarch/Kconfig                        |  1 +-
>  arch/loongarch/include/asm/pgtable-bits.h     |  6 +--
>  arch/loongarch/include/asm/pgtable.h          | 19 +------
>  arch/powerpc/Kconfig                          |  1 +-
>  arch/powerpc/include/asm/book3s/64/hash-4k.h  |  6 +--
>  arch/powerpc/include/asm/book3s/64/hash-64k.h |  7 +--
>  arch/powerpc/include/asm/book3s/64/pgtable.h  | 53 +------------------
>  arch/powerpc/include/asm/book3s/64/radix.h    | 14 +-----
>  arch/riscv/Kconfig                            |  1 +-
>  arch/riscv/include/asm/pgtable-64.h           | 20 +-------
>  arch/riscv/include/asm/pgtable-bits.h         |  1 +-
>  arch/riscv/include/asm/pgtable.h              | 17 +------
>  arch/x86/Kconfig                              |  1 +-
>  arch/x86/include/asm/pgtable.h                | 51 +-----------------
>  arch/x86/include/asm/pgtable_types.h          |  5 +--
>  include/linux/mm.h                            |  7 +--
>  include/linux/pgtable.h                       | 19 +------
>  mm/Kconfig                                    |  4 +-
>  mm/debug_vm_pgtable.c                         | 59 +--------------------
>  mm/hmm.c                                      |  3 +-
>  mm/madvise.c                                  |  8 +--
>  25 files changed, 17 insertions(+), 318 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

