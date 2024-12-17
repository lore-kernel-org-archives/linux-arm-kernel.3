Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC53E77187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 22:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuUiDwN6JN9Q+rjTOZSr/qEq0VeE7EPwHe1HzzH1/V8=; b=J7G2MTKwvnhBQIqZxhckw9Fqdi
	QJ3B0XtjPQy94gk/Q0GDa4wNvbXumaIACY2izTMd0W1B7xFPLI7Ulb4c/qPfIef/1iTtHbPmP5qeb
	guYChq3e6KVgfkkSH7LPAr/S0tTuXT74KJxv8rwZGVCjjnjgaOjG2BMLFhPBWtHNMsNXZa0GJOywd
	+qSoSg0gW+0T6fIz2oo96R8Raa6CCygAyuFE4e59bKpTMetloKQJZrWlHZ4opgdf4G8jr/NCn9g0z
	CWU5VdMpnWIghTabqygHP22+2+fIX1xOdLwDeOlzKnE8WVs4YGk2e3uVXks3EZO+h4Hq0RpnIi4oW
	SpaXFxAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNg4N-0000000EzEM-393O;
	Tue, 17 Dec 2024 22:29:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNg34-0000000Ez0o-24lB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 22:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734474493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SuUiDwN6JN9Q+rjTOZSr/qEq0VeE7EPwHe1HzzH1/V8=;
	b=OD2mQyA1DaVM3ExrHxU1/KSAV/gcN7DYqnUXDpfD8DXu/iqCVFKR/hhdGKtUUiDsPdNz8E
	g+KNOtCF+NGC97uOnBaPQ7wzw6HgHreryZgibI97diiTDRd88JI45pzrEQPFhD6N8kOD6j
	+XhnPH7M9QjenDLLElF5oXT66q7TVwk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-bYVdpnLaMrC4IFYjvkWnuA-1; Tue, 17 Dec 2024 17:28:12 -0500
X-MC-Unique: bYVdpnLaMrC4IFYjvkWnuA-1
X-Mimecast-MFC-AGG-ID: bYVdpnLaMrC4IFYjvkWnuA
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385dcadffebso2743271f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 14:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734474491; x=1735079291;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SuUiDwN6JN9Q+rjTOZSr/qEq0VeE7EPwHe1HzzH1/V8=;
        b=nIoA0oNzuNpidI3BjmLrvKu5nbdEasN6rw0YYR5FLkBKoiUyTDTmx7YhhKzVIb97Xc
         E7CQwfZCHuABcLAHjqaFJeNr8Wq3wci1LH0tWbJk/BY0Qthusv0DswozmGrKjkkHGglu
         2s/xlusEALcktYJHSBswV9OvoZcpehKahksel7nRYhPLDFumrmNcGqYeLJwmXSuP4hEq
         L1F5vsfffqcLfntZLS5/W3Js27uZj24XUP4UQeAZj8XcGnslZKG8/yqDsGmA8L6FuJSp
         2TnKRqJLsb8FsB+sFs6wFYPyg1yqb2UKq71FFpr7UfLyeMkr1ta5wbTRZCOulJsHma/f
         pDaw==
X-Forwarded-Encrypted: i=1; AJvYcCXVQCvi5Sa886k+fswpGxd6Pyczr7T18/GSBvcG3wTEd577TZTBDbbZdWmSIZElGwaFqW/lzmpHsaJbM0o0zHsa@lists.infradead.org
X-Gm-Message-State: AOJu0YwFuMIPOZN/5RCcK+LHo+Xz8JIlMqHExIbBehofXSoKYeO035ef
	YM90EN/AYechmBYTyR7z4XcB6RkcaNe0YgTgB6iQuREHSWZhWRmg+zt16YN3AOoQU5+8xXnZgLa
	zH4d4Xsxn9DzXpkLofvqVZ5tVV6cuiI70+Pla6irN22d+SD9N9aruXNEYLPqjeApKu90tCZn6
X-Gm-Gg: ASbGncs5XhVBAA0F2wleGw+TcWUXMbMT6IQvU3fJfCKTBukMb+c3N9qPR8y/REmnVU9
	vCozAp4th1z6TGnAsJW0VBm7A9VRQ0cKkCW2NrJBje3Hha39SDcdK6gE+p/7WLo/ULk0zPbfEVu
	UgVhgrmBr1w9wovQU67ucApDv2SCFegKAlNjx7KFrghG/dSzQhWvO0OA6ukmeFh/JQWixwWsxhx
	SHBh+CdIWRm/P+juOyeCPEdpwldmhnYg2VYkYk8kSHCUdrIYj/MmdCeKKSUDLAzZfgg7lN9o7He
	jfbMDeE3bTl3iWcFYyBZ4NsMD6Gfev3EC+EfFvUkllXbglAwu4MkesrlSLHVFHSFDSJ8uKXTrko
	93k28UXHp
X-Received: by 2002:a05:6000:4a06:b0:388:c7c2:5bdb with SMTP id ffacd0b85a97d-388e4d6bc86mr490222f8f.2.1734474490931;
        Tue, 17 Dec 2024 14:28:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvTFVi7q0TnTvpbrbppzv+CwZ1GXbtoatrg/I2tIqfy/l4JTDnozGATbxCSGEYBCYXlyagPA==
X-Received: by 2002:a05:6000:4a06:b0:388:c7c2:5bdb with SMTP id ffacd0b85a97d-388e4d6bc86mr490194f8f.2.1734474490540;
        Tue, 17 Dec 2024 14:28:10 -0800 (PST)
Received: from ?IPV6:2003:cb:c73b:5600:c716:d8e0:609d:ae92? (p200300cbc73b5600c716d8e0609dae92.dip0.t-ipconnect.de. [2003:cb:c73b:5600:c716:d8e0:609d:ae92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801af46sm12218432f8f.61.2024.12.17.14.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 14:28:09 -0800 (PST)
Message-ID: <b5111052-4bc2-481c-8510-c1b86c70bf30@redhat.com>
Date: Tue, 17 Dec 2024 23:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/25] mm/mlock: Skip ZONE_DEVICE PMDs during mlock
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
 <e1fe10474fc06aaf24b17fcd916efffcc8c13f78.1734407924.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e1fe10474fc06aaf24b17fcd916efffcc8c13f78.1734407924.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ky6OJghQXQmfSePvmMXjvTTbXQYqyKZrOQcZS31eR1E_1734474491
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_142814_599515_B4AEC0F6 
X-CRM114-Status: GOOD (  14.23  )
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
> At present mlock skips ptes mapping ZONE_DEVICE pages. A future change
> to remove pmd_devmap will allow pmd_trans_huge_lock() to return
> ZONE_DEVICE folios so make sure we continue to skip those.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>   mm/mlock.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/mm/mlock.c b/mm/mlock.c
> index cde076f..3cb72b5 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -368,6 +368,8 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
>   		if (is_huge_zero_pmd(*pmd))
>   			goto out;
>   		folio = pmd_folio(*pmd);
> +		if (folio_is_zone_device(folio))
> +			goto out;
>   		if (vma->vm_flags & VM_LOCKED)
>   			mlock_folio(folio);
>   		else

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


