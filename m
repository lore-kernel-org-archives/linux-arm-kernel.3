Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706D5C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 10:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNGcx2ArrxJr8cIK8d0qYe5Yw20pPHTlFAddIJE8YQE=; b=msnP4D0tyB/awcFzBziBcMjHka
	qA+jN0NiXR5ilJzx8rMSUG5GaO8QjIZWrDgCiqNOBze1ZAP4W32AU5Gp5Y9s9QnsMjsL2F0dij9RB
	iojjCQNmsrcqAQIuVe8mrvVQoTof5th0/ZwbOHZKl4Yja4RTohYaqBd0pTPNDKqIIZaT02YwVcSoO
	SG8fhbu2XEYqcSONN7YVst2kVt+7aXU6tjARB70fh8lY/cMsyHKdMnuWzE5cVq/sCXfj5d/TTK/o9
	vMmKU6PuHyqVDahgWPWA1KOMjWw+lCb1pGHHuCOg/1hcK5shIr+1QDLU+qeyA2lTMVS6X/OthBI9G
	WStHMI6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2W7-00000007CdP-2tHu;
	Mon, 02 Jun 2025 10:35:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2SM-00000007C4G-1KW2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 10:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748860308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zNGcx2ArrxJr8cIK8d0qYe5Yw20pPHTlFAddIJE8YQE=;
	b=BIqhjEgcyXhzr5YECzxep8f2NgNI8G81kTty+Kc/cu15MbXjk00H3FdW3F9zjm1Rip1Y1X
	8teCHTL40WAdivR3ENG4a+fd1i+K4l/15xobcNpWvwx80tpFtbSQfKBiEExT+FxK7SN/8x
	UzhdAGOzSx+Sa3aISKC+LRJcZSkSGe4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-xDpYzb9NPnmXYvmiaggr8A-1; Mon, 02 Jun 2025 06:31:47 -0400
X-MC-Unique: xDpYzb9NPnmXYvmiaggr8A-1
X-Mimecast-MFC-AGG-ID: xDpYzb9NPnmXYvmiaggr8A_1748860306
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450dada0f83so19483685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 03:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748860306; x=1749465106;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zNGcx2ArrxJr8cIK8d0qYe5Yw20pPHTlFAddIJE8YQE=;
        b=asJ7a/Auo7hCahaPK6dzkMqRXft6PETsbWFojo4bR6Qhv9/Y8JSAmLuBUye31JXdiG
         XMHGu0ltYGbF4eFZ9Th133wGEDMQ06+YiHD7ofFskhl73GbQ3HSAOQvZGPdJZOD65Lpn
         HowW3/rbcBmPp7oe+9kMur2NgoVxSeUmegADAve/EHsKWI54cMKgiz/maAUkf1Rm4UCM
         t4RD9suwh+nNfJJacLzAH/jAARtxtwiBrze+mS7R9e/IaoSBqic4lAfcwhBfke6u57Sg
         7qmy6IzWc/4+EFBKYxk4CRbH3J6r9cV8D89vInXEggWMRzuiwVdU4J2bhDbJXF7icdMl
         mmsw==
X-Forwarded-Encrypted: i=1; AJvYcCUYwgnBWuA2FZuqKNNPCHVcYg+RYAUKN6IU27+C4Pvrw4oC/4S32vV2rwL77b26xH63DQcemoeAOKtZlL7e9Sz/@lists.infradead.org
X-Gm-Message-State: AOJu0YxO1lAFCL6ST1+p7r1oe/aZ6zJRK4sJ7HATRoXzIGOczJ0eHXhS
	L765ZTA3tyYsPBoUVTl5uBpo43J2Fsh+mSyqitEOZXHYVsTWXXVIDKGlSzg/Eum+wcyS8d3lEwi
	XIjipmm6xyyAZTXWdTRGx/3lOqPfk9fJDBNrp/p2mWl+dUUNIXmJX4KYlxIDB4P74O9ahOtOQm9
	NO
X-Gm-Gg: ASbGncvrBaTPXdepxpn1/BPThvz1WNZRisJlym4mchWlYaPsCnyjA0juKrBa7ZQ/gfy
	X1W6KFcitpP3KiKu1vsaFKf+oxf7dRoKyCqyuATMu1FBzoCf6xrD8Yy1VnZU9LLK5Jt/gNPBCdH
	/ZBYxn4xrcydDbTu+dk4PxD/M1kgqzzpPbaCtn3ObRMy7L9pq4bPFp4arySTpkDQr0ZmTD2FJCg
	AQyjHH9q3fmsQNoUe1Dx7ozd5uGBqPmOvU9wl1VWWod7WfBjfeeUs7QOZrR443SFhPS1LLT0cu3
	KNKKDUSJvsTFDBGB0F/jQ0fvSlA1NN95TqewhaiA746XjKpfecFS39eMcnWmsMBz/AkV4FDi7dW
	NpjJNVGvYdGZDgc9iVpkMevBK6s4EAPovz4wWJ+s=
X-Received: by 2002:a05:600c:4e48:b0:443:48:66d2 with SMTP id 5b1f17b1804b1-4511ee14c08mr77083135e9.16.1748860305789;
        Mon, 02 Jun 2025 03:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4lrvLwHaEWScY/8IOL/Tuots8CWM7YWfHJfcP7R1yvYuRofYdh+DhIzzTEbvoU5wPzbYr8A==
X-Received: by 2002:a05:600c:4e48:b0:443:48:66d2 with SMTP id 5b1f17b1804b1-4511ee14c08mr77082755e9.16.1748860305291;
        Mon, 02 Jun 2025 03:31:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:a300:1c2c:f35e:e8e5:488e? (p200300d82f34a3001c2cf35ee8e5488e.dip0.t-ipconnect.de. [2003:d8:2f34:a300:1c2c:f35e:e8e5:488e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1e7sm118287075e9.1.2025.06.02.03.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 03:31:44 -0700 (PDT)
Message-ID: <13ea6653-d33d-4f76-88c8-a17f9989d069@redhat.com>
Date: Mon, 2 Jun 2025 12:31:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] mm: Remove pXX_devmap page table bit and pfn_t type
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Cc: gerald.schaefer@linux.ibm.com, dan.j.williams@intel.com, jgg@ziepe.ca,
 willy@infradead.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cRP54ldDzRSi0XCmVbivk5VyQ8fXXcpjILb72FuTdYw_1748860306
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_033150_438882_2773598E 
X-CRM114-Status: GOOD (  27.99  )
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

On 29.05.25 08:32, Alistair Popple wrote:
> Changes from v2 of the RFC[1]:
> 
>   - My ZONE_DEVICE refcount series has been merged as commit 7851bf649d42 (Patch series
>     "fs/dax: Fix ZONE_DEVICE page reference counts", v9.) which is included in
>     v6.15 so have rebased on top of that.
> 
>   - No major changes required for the rebase other than fixing up a new user of
>     the pfn_t type (intel_th).
> 
>   - As a reminder the main benefit of this series is it frees up a PTE bit
>     (pte_devmap).
> 
>   - This may be a bit late to consider for inclusion in v6.16 unless it can get
>     some more reviews before the merge window closes. I don't think missing v6.16
>     is a huge issue though.
> 
>   - This passed xfstests for a XFS filesystem with DAX enabled on my system and
>     as many of the ndctl tests that pass on my system without it.
> 
> Changes for v2:
> 
>   - This is an update to my previous RFC[2] removing just pfn_t rebased
>     on today's mm-unstable which includes my ZONE_DEVICE refcounting
>     clean-up.
> 
>   - The removal of the devmap PTE bit and associated infrastructure was
>     dropped from that series so I have rolled it into this series.
> 
>   - Logically this series makes sense to me, but the dropping of devmap
>     is wide ranging and touches some areas I'm less familiar with so
>     would definitely appreciate any review comments there.
> 
> [1] - https://lore.kernel.org/linux-mm/cover.95ff0627bc727f2bae44bea4c00ad7a83fbbcfac.1739941374.git-series.apopple@nvidia.com/
> [2] - https://lore.kernel.org/linux-mm/cover.a7cdeffaaa366a10c65e2e7544285059cc5d55a4.1736299058.git-series.apopple@nvidia.com/
> 
> All users of dax now require a ZONE_DEVICE page which is properly
> refcounted. This means there is no longer any need for the PFN_DEV, PFN_MAP
> and PFN_SPECIAL flags. Furthermore the PFN_SG_CHAIN and PFN_SG_LAST flags
> never appear to have been used. It is therefore possible to remove the
> pfn_t type and replace any usage with raw pfns.
> 
> The remaining users of PFN_DEV have simply passed this to
> vmf_insert_mixed() to create pte_devmap() mappings. It is unclear why this
> was the case but presumably to ensure vm_normal_page() does not return
> these pages. These users can be trivially converted to raw pfns and
> creating a pXX_special() mapping to ensure vm_normal_page() still doesn't
> return these pages.
> 
> Now that there are no users of PFN_DEV we can remove the devmap page table
> bit and all associated functions and macros, freeing up a software page
> table bit.
> 

$ git grep FS_DAX_LIMITED
fs/Kconfig:     depends on ZONE_DEVICE || FS_DAX_LIMITED
fs/Kconfig:config FS_DAX_LIMITED
fs/dax.c:       if (IS_ENABLED(CONFIG_FS_DAX_LIMITED))
fs/dax.c:       if (IS_ENABLED(CONFIG_FS_DAX_LIMITED))
fs/dax.c:       if (IS_ENABLED(CONFIG_FS_DAX_LIMITED))
include/linux/pfn_t.h: * PFN_SPECIAL - for CONFIG_FS_DAX_LIMITED builds 
to allow XIP, but not
mm/memremap.c:          if (IS_ENABLED(CONFIG_FS_DAX_LIMITED)) {

Can we remove that? Especially the interaction with PFN_SPECIAL looks 
concerning.

-- 
Cheers,

David / dhildenb


