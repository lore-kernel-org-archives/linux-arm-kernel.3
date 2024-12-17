Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62417E77187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 22:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oasFH9YS/5nOK6GsM6YHhbVvy+xnvzjUtw4Gpik0lY0=; b=Tm8DZHXeCGBE47GSE8pz7LgYzv
	SzzyjE9dKjdkYpjQDcYjUcqls1R2F+p5AKT6irtdYz3o8bPp1LpZFh59Trj2VEiPyaMiSNZpoVRsA
	ktsFSRYvWdi832TFn6XGOMq2Sovx2+9tHJ+3JGmCeGNZ0qdShCKcENJ6AI0sXb6eV+A8TJvw4S+ZB
	ajtrY6IC2Td1Ww/3me5UeMcH4n1ozhpAkJWLqFb1uDlvYMSXso2+QV/fpXGGx+Hoxtef4vg38sank
	ZB3sqSU4aFJgWlqCs1KifiVWwjmdZQHRSNw84HxIqxhwEnzNiq46FhdGAo3uXspDH/rfMfeOrgXj6
	CVMQ7/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNg91-0000000EzoF-0njZ;
	Tue, 17 Dec 2024 22:34:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNg7v-0000000EzcV-45PV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 22:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734474795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oasFH9YS/5nOK6GsM6YHhbVvy+xnvzjUtw4Gpik0lY0=;
	b=BodAC2UpZQsmy112PpluQqwxlmDI9nWHuXp+rplIrUe4bZQQlvkT96Nd3CP5QjNZjBn4VZ
	1c7QvB2IUV9fYa3r0YuehwRVDZI/yHuSxCd12JXX9KX6BgRnEBsx2y2NPskNXkdBmjJtO7
	Zo3BdwneLXhlTIREInVPrHH1yMpbjws=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-V7nk1WI0PiqpZePzlUXAbQ-1; Tue, 17 Dec 2024 17:33:13 -0500
X-MC-Unique: V7nk1WI0PiqpZePzlUXAbQ-1
X-Mimecast-MFC-AGG-ID: V7nk1WI0PiqpZePzlUXAbQ
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4361ac607b6so47823375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 14:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734474792; x=1735079592;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oasFH9YS/5nOK6GsM6YHhbVvy+xnvzjUtw4Gpik0lY0=;
        b=VDZhdWFOC+AuiHQtrV90UJk9MEeZ6lzCZLrIAfbcRY89jmlZNPLeL8sJpVeKWqfao3
         390tFa2jaREFRM7DaUt0rZBWZoHKDEjRF7qNDyZVwLTbsBJ4ql840AYYKnbibLiw6LfH
         S231h5cGIVX5WUXz3FiVBS361UNf2vgl1Wlydd6/rP5ez3lOWR6U3SPz1HX52OBwXTVN
         nVInl6xdk2w1pjKTr6tclaVFsMeeD21YZ+sIHa7mi5a0pJNEe0J0mGkewPoTIBEZwkx5
         BbOK+HSnglFKTuyBTvhbXEh6MJ8vpvjX2AdgVhd+Q7CGugdS5f4a60PNoXFFo7Ds4C7J
         /4+g==
X-Forwarded-Encrypted: i=1; AJvYcCW2Pz+joHlywk+X3WgITgGAhdRpvfRkMJRZGaPKYenwzzSl4YfpqV2VcHkpkBoGIzjlS761OXIKytsfNr46jhvs@lists.infradead.org
X-Gm-Message-State: AOJu0YxVdjdrSO7czmjYUY8LcVkupWO2LKlBw+oGpaYbGtqKjMmdSUmr
	g9be4DM2Iyw4OxBG4WTz0ucW5bwhf8MJnRv6bp4nsVKmCHihOK4RGX8EqykOrI5O+CUww5RPXvS
	eirOVkkFS9QbKoc62cRF5SgYPYpGBoV+NHmule+jDoxZdv7HR5Q8K9b46IuPsc4zaRqtDaGzy
X-Gm-Gg: ASbGncsCfdSV3FWzmuX9HpciUK2jWhHzXzN59O8sZJVUWMo2V7h9lXKzsYRVzxwkzFq
	jRkEOelFXilY3TBiQXYebtdl75GZXENCjYk+Vy+aCILwEsobsukI47pX6gRnii++OznNoaav+0U
	nk0HCHxJbhMypjYmYmP9ACBC6BC0kK8iXk1xguQf2FQjOl9x8BTpBEobLi/fUQNM/EFaswErWwW
	ZWlyCA4AM83no60nkjl2yhO0lmveFYg+2HQN4Vp1XdAl6CU6FWvPITXB+2HGuV6NCKxBIDEKWrf
	OB1Y5jHsNCiE+zQNQc5z2qlEIu0fl8ulL7wHRpdL9aAtztw5/M6v8UEWhuaEaY4m3G7y95n4/PY
	xQXAGkvLw
X-Received: by 2002:a05:600c:4448:b0:434:a90b:94fe with SMTP id 5b1f17b1804b1-4365535b4e6mr4137955e9.10.1734474792402;
        Tue, 17 Dec 2024 14:33:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu5Rpx/75DKHPvdCspqV2eTg6oVqu83uuIMN0kGm64YISiw1ESXOe+JcsaDrCGOH1qe5B+Gg==
X-Received: by 2002:a05:600c:4448:b0:434:a90b:94fe with SMTP id 5b1f17b1804b1-4365535b4e6mr4137665e9.10.1734474792038;
        Tue, 17 Dec 2024 14:33:12 -0800 (PST)
Received: from ?IPV6:2003:cb:c73b:5600:c716:d8e0:609d:ae92? (p200300cbc73b5600c716d8e0609dae92.dip0.t-ipconnect.de. [2003:cb:c73b:5600:c716:d8e0:609d:ae92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1a195sm190205e9.36.2024.12.17.14.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 14:33:10 -0800 (PST)
Message-ID: <e7f9433e-bd4b-4284-990b-9ea074064f0a@redhat.com>
Date: Tue, 17 Dec 2024 23:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/25] gup: Don't allow FOLL_LONGTERM pinning of FS DAX
 pages
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: lina@asahilina.net, zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
 <f315b61169d0671301e4a793ecbb1a6c46b69bef.1734407924.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f315b61169d0671301e4a793ecbb1a6c46b69bef.1734407924.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ehOkR-671IO26re9cC5xalyH2uQnWQFP9y9P3KvLF30_1734474792
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_143316_078759_D1617CDE 
X-CRM114-Status: GOOD (  14.55  )
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

On 17.12.24 06:13, Alistair Popple wrote:
> Longterm pinning of FS DAX pages should already be disallowed by
> various pXX_devmap checks. However a future change will cause these
> checks to be invalid for FS DAX pages so make
> folio_is_longterm_pinnable() return false for FS DAX pages.

Nit: I'd consistently use "mm/gup:" as prefix for GUP-related patches. 
(similarly, mm/huge_memory and mm/rmap in the other patches)

> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> ---
>   include/linux/mm.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index f267b06..01edca9 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2078,6 +2078,10 @@ static inline bool folio_is_longterm_pinnable(struct folio *folio)
>   	if (folio_is_device_coherent(folio))
>   		return false;
>   
> +	/* DAX must also always allow eviction. */
> +	if (folio_is_fsdax(folio))
> +		return false;
> +
>   	/* Otherwise, non-movable zone folios can be pinned. */
>   	return !folio_is_zone_movable(folio);
>   

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


