Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC705C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pl6PxwbpUS7ADU1xqvtXXrf/iKUynSR5SAu+83BnGX4=; b=RI4h8m1qFiwBaUJmHBsV+8HSeW
	eZg1w6fDAyuX6VfKedmzltexFJoYIwW6m4H4PnxT4W16yjzCUEsGUoQaeuSm61QleEjazo4MkZdaj
	1IUPmOIV+7G3xPsvXA4hdOIMWsiAErq7VA0WJQq7EQCd1l34BtdrRjgrYhvS8cDAKGRpsf5hsC2RF
	NJhxWRho4LsxnROFwqYshJJFkVyrNetK0nNyudZcmQvbfRmt/1KxrFpy4ogfRUDJefbfKKAKVEKAh
	RGIxA6uL6h6KnoK1q1YXjIqmVoHJoyvXtwek213i7rAphrXIya+Zp42JLLhoDwA4eOk5a8KqmEWYh
	hFyCL4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSeh-00000006l7y-2BZT;
	Tue, 17 Jun 2025 09:30:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSTl-00000006idT-1RqT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 09:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750151980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Pl6PxwbpUS7ADU1xqvtXXrf/iKUynSR5SAu+83BnGX4=;
	b=J24VFdGI1Z2zNW5lowKImzrZa41MUw9N78xUxZth2XJjoSJShAPhIYTr2htFpfa59Cjdzw
	XTUEUhkjhRqhQHbdlfuaXujIDXeP1HJQ3+X962gL36RkT2O/PpVH0L02K91PV/XOVVu71Z
	UnuyuFkDzG9kNouA7GqVHe3zSyVWzwg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-4gAchVGXOya67K_MgBFVyw-1; Tue, 17 Jun 2025 05:19:38 -0400
X-MC-Unique: 4gAchVGXOya67K_MgBFVyw-1
X-Mimecast-MFC-AGG-ID: 4gAchVGXOya67K_MgBFVyw_1750151977
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f8fd1856so2649346f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 02:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151977; x=1750756777;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pl6PxwbpUS7ADU1xqvtXXrf/iKUynSR5SAu+83BnGX4=;
        b=VopdWSSCRLIfVQ08a4+CiQk+Gt8I1veRvgUgaXgbrUuTCyNY1t5pQLLOfxSBTMeiw8
         te2CNTWfrYrgmDyE23STJUzOllONMFB2MDdRInXDefYMG2ve+CbXjuEG8M1hZwh4A21t
         zwWXXtqjB+SgD11ch/Um1CbQXdiG3V26w9bH+qFOUFbb6L1wiOaDlBE3SyqcNwBsQ6R/
         AwRUR+AE2g4ArO3sWGEJq4uTqH6RtNnkNWMJKzJKsFQya8W0NRmKZy/fFhrOzyqpsZSr
         47dyd3pYxGbNZo8Y+bmejWTxKncU9qRthSs2ViCJI6XG3FDSqoDthC0dHFlULJ9UC8l0
         YKNw==
X-Forwarded-Encrypted: i=1; AJvYcCXFjQOakESed3fou4rq4NISkt2owI1ukWOoxDGm5iaOB9lu6tEK4DrfiFPNa0niCYTyQ/Hf2j4QeMJDnUwZrWri@lists.infradead.org
X-Gm-Message-State: AOJu0YwEmuaep/5jNVdoUN2fgD3akWQIuCZMnwJ1o9/rY97Hls/bUdYb
	gN2dkO1OfdNZ2SchjgBlTvebgq6wAPRrX0zlLG59hxxl/ov47jBEcM9but0mBVdzAVf3oZOBl9j
	DQkRd5zeAru0vaicv8aoIbs8KFgolxHOPnuAk4vKQOq8khcwt3/KWzMUkW6fCldnpTrOlMQs2MO
	Ob
X-Gm-Gg: ASbGncv6v3ahLIaE9hy7gr1i3D0hJlu8i5YaKfPn0L2Zd3RqypLkBRYLX0iuT07ro15
	m8EH8AlOjThgNkJrRDlFro3Im5Ue064jIdW6Lx4ZqHvMJLAinB4GHOSpe6kvXBg9IzqS4nuS4gD
	NZBiyXJ8c61/XkD7nKyqYiXarNduoGgbxuHbEof3Qg/RP9agJ9kkHJkwBSGJ8P046tYIMB1ZmzK
	+Ou/EQEBkq4J0Z/M/oIpGhW86tCCJQkv6OAkuATW4G+PoGpBWufh/qBpSlOzs/TPSYD9HrDTE3r
	HqgiT6iS/C+F7Jo0cCc3dLv/Kk6cLz+2mx9/UtCHKOOkd1ScpSzIT4obwn8Vh9LzPzSh4bwOvWl
	ngw37Q3dAzK7WMzRhZSPRfEp3ENzLn7RAcqr2F3/Yq1DYy1k=
X-Received: by 2002:a05:6000:4202:b0:3a4:dfaa:df8d with SMTP id ffacd0b85a97d-3a572367c45mr11265706f8f.9.1750151977297;
        Tue, 17 Jun 2025 02:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt8iXJvJT0W2e4sI8GT6VcpVG8jxrePAU09oM8r6xnq4XSbjmN3FC6k4gXR+D2djVSpIQQtw==
X-Received: by 2002:a05:6000:4202:b0:3a4:dfaa:df8d with SMTP id ffacd0b85a97d-3a572367c45mr11265656f8f.9.1750151976687;
        Tue, 17 Jun 2025 02:19:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08e21sm13528866f8f.52.2025.06.17.02.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:19:36 -0700 (PDT)
Message-ID: <bf855ce0-d0ba-4bd6-bfc1-8be2fdbdfe70@redhat.com>
Date: Tue, 17 Jun 2025 11:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] mm: Convert pXd_devmap checks to vma_is_dax
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
 <361009510f346090fad328c53ec228d99bb955ee.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <361009510f346090fad328c53ec228d99bb955ee.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FdIuVREwMp8t8WS-gmf6xrcm-kbspoYbCSFJ7R6JTp8_1750151977
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_021941_657711_354490C5 
X-CRM114-Status: GOOD (  20.57  )
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
> Currently dax is the only user of pmd and pud mapped ZONE_DEVICE
> pages. Therefore page walkers that want to exclude DAX pages can check
> pmd_devmap or pud_devmap. However soon dax will no longer set PFN_DEV,
> meaning dax pages are mapped as normal pages.
> 
> Ensure page walkers that currently use pXd_devmap to skip DAX pages
> continue to do so by adding explicit checks of the VMA instead.
 > > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> 
> ---
> 
> Changes from v1:
> 
>   - Remove vma_is_dax() check from mm/userfaultfd.c as
>     validate_move_areas() will already skip DAX VMA's on account of them
>     not being anonymous.

This should be documented in the patch description above.

> ---
>   fs/userfaultfd.c | 2 +-
>   mm/hmm.c         | 2 +-
>   mm/userfaultfd.c | 6 ------
>   3 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> index ef054b3..a886750 100644
> --- a/fs/userfaultfd.c
> +++ b/fs/userfaultfd.c
> @@ -304,7 +304,7 @@ static inline bool userfaultfd_must_wait(struct userfaultfd_ctx *ctx,
>   		goto out;
>   
>   	ret = false;
> -	if (!pmd_present(_pmd) || pmd_devmap(_pmd))
> +	if (!pmd_present(_pmd) || vma_is_dax(vmf->vma))
>   		goto out;

VMA checks should be done before doing any page table walk.

>   
>   	if (pmd_trans_huge(_pmd)) {
> diff --git a/mm/hmm.c b/mm/hmm.c
> index feac861..5311753 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -441,7 +441,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
>   		return hmm_vma_walk_hole(start, end, -1, walk);
>   	}
>   
> -	if (pud_leaf(pud) && pud_devmap(pud)) {
> +	if (pud_leaf(pud) && vma_is_dax(walk->vma)) {
>   		unsigned long i, npages, pfn;
>   		unsigned int required_fault;
>   		unsigned long *hmm_pfns;

Dito.

> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 58b3ad6..8395db2 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -1818,12 +1818,6 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
>   
>   		ptl = pmd_trans_huge_lock(src_pmd, src_vma);
>   		if (ptl) {
> -			if (pmd_devmap(*src_pmd)) {
> -				spin_unlock(ptl);
> -				err = -ENOENT;
> -				break;
> -			}
> -
>   			/* Check if we can move the pmd without splitting it. */
>   			if (move_splits_huge_pmd(dst_addr, src_addr, src_start + len) ||
>   			    !pmd_none(dst_pmdval)) {


-- 
Cheers,

David / dhildenb


