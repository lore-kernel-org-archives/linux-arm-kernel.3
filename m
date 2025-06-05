Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AF4C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 17:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpvfIUXNy+0YI+niMZHhnnE2dkA26uyrgOmKrnHQckE=; b=XEjJBExiDA+02ey3ucZHdYcLeZ
	tuynJT5UkjmhAnMXL8aKeTHws6ealmALBN0DzD3D8bWmsJk85HTY6XJxB+hGJLXa7o+kcYBOTOZyd
	1Ioqknr4NpBip6XK+2JbPJRtNEVZemPO6vPXbOS2ZsTGkqNji1MmrSPANzTDQMrKQjyOFCab+APAN
	cMUueYS7ZpSfjpnp08O+yg/mTcwPacAVCAv+PsIogLwLS4G0MZaXTV2gHUDU1hRMM1q19ykzQchcx
	Ed1RxQ8PQGXo3LrRIAF5bd7lqNdibrm/erAqUjeL2Sa429v2fKX7xwspj82eqJ2gBImRLWn9bM+kk
	gs90YLdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNE3e-0000000G6fC-1kFw;
	Thu, 05 Jun 2025 17:07:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNE1O-0000000G6Cf-2ZBZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 17:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749143093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mpvfIUXNy+0YI+niMZHhnnE2dkA26uyrgOmKrnHQckE=;
	b=irttrjNo4uZAbzuJrhqaPlRP7rdBMRKsmadZ1yc+YUCoQS35qn9eODRo5z/MZfaDJaFK2y
	bY3W95yCCi/3++JTF7o+k3lQ42CzTJ8QC7meYVCzZDwrqAPP/DdUWt4p/Ra3hmG0JO+l3c
	gA4RaYPocfS6nOBnhLtDj+wPHbRYarQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-Fog2YPDwNxGKM3q0ePN6Ng-1; Thu, 05 Jun 2025 13:04:52 -0400
X-MC-Unique: Fog2YPDwNxGKM3q0ePN6Ng-1
X-Mimecast-MFC-AGG-ID: Fog2YPDwNxGKM3q0ePN6Ng_1749143091
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450de98b28eso11968895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 10:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749143091; x=1749747891;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mpvfIUXNy+0YI+niMZHhnnE2dkA26uyrgOmKrnHQckE=;
        b=wfQX310G7Pf6op66bYwc0OILKAUDvHD0+AV1i75c8XiQmU+WkREGiZ4URl9wrYHDCz
         LKixubzzt6XvlCvMYslPHoy/G18D2TlaYYoE5hjfXerxuaZ7KDuQFgzZJxx2FF2ghK2b
         duCXgM40YQVuYzon1AxZDvte8B81DlpzhFIDPp+HGGi/EAZlO3D0HWSUddo42by7nnAa
         bTLWJRJBkdDV1bp7/arcD+sxohff65H4kx7qsdnIpuY6K7gcQtdTvu35JBm1Ki0P8WoB
         IQi4IRnVfgSTz75fGJbZNrlDvJWakUkgiUqCenHF+8+LSafVebYTTeF2lESeMlkLnS3r
         m4DA==
X-Forwarded-Encrypted: i=1; AJvYcCV/vMsx/zdmXVPMcGbnZQ6RJfdHof3KWWoDSTC6hU0NqjnwTHQk+4kPrj+ntUYv+mOwLKsu0vX6IxeQXZ/KZdIQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo/+SA3GR6mevvnBc7gMy1W9juen/N9yYs7ZQI5m2d70QWycWb
	3FqEWAD44LhBmRPbkBD5TtnmrFkZhHKJk0rWEUH7vu6UixpZxJmiMYFjSmV6xG5/W+lj8e44YBq
	DUf4Z3M5z8hvrUXhTH6TPfw+9HynytK+N9/Me58Y3/JJ1hPbTF2SAHLrJQP8eXcs4zOQIQ4fLuT
	KY
X-Gm-Gg: ASbGnctak8MeFtOG0QeU+ogNkou5czD1yq0L3jXQ6mh32D0oYZ2mwr0leagInSWUbG2
	cK4UMgepF5FLr1fiPfJYa71QtUGyL2USSLOdkrBtvg4hmT3GDKMH7u8nrFcdkjiXNZy2OuFKKrQ
	yKovKAOw04qxzx0drQ00Ihb5YrK39AEnk6r7uMb3Pim6ejc3cQ+41HaC23qWUjm82yJZ00vWJSQ
	2Qi6HincPC7L3PzE6tkRV4PRcr/49CPE40fwjie0SpsTgXikW0z/rUzdmLguwOVMUtvKk5buK5C
	wx71N6FH1RY/g3jnvwSlvM5pQqmW3cXqqhMKMebadz8=
X-Received: by 2002:a05:600c:628e:b0:442:f861:3536 with SMTP id 5b1f17b1804b1-451f8875262mr47786535e9.7.1749143090815;
        Thu, 05 Jun 2025 10:04:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVQE089ry3sB9Y7MBF2Kawt3CRt9isls3pFu6UKzMYUnWY0Ft7AZGjD26+zCdRTOtAOs+xQg==
X-Received: by 2002:a05:600c:628e:b0:442:f861:3536 with SMTP id 5b1f17b1804b1-451f8875262mr47785945e9.7.1749143090353;
        Thu, 05 Jun 2025 10:04:50 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0f5ef.dip0.t-ipconnect.de. [79.224.245.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f9919648sm30388695e9.31.2025.06.05.10.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:04:49 -0700 (PDT)
Message-ID: <79f75185-ac45-47c6-8f56-2ffa1e4815b0@redhat.com>
Date: Thu, 5 Jun 2025 19:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
To: Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 gerald.schaefer@linux.ibm.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@groves.net
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
 <6841026c50e57_249110022@dwillia2-xfh.jf.intel.com.notmuch>
 <20250605120909.GA44681@ziepe.ca>
 <897590f7-99a5-4053-8566-76623b929c7c@redhat.com>
 <6841c63b3cb25_249110060@dwillia2-xfh.jf.intel.com.notmuch>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6841c63b3cb25_249110060@dwillia2-xfh.jf.intel.com.notmuch>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iNYPry0Daj1Ca5QvXpRX4Gsp1QcdCR37EHlmgpy7xw0_1749143091
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_100455_078536_DE111E31 
X-CRM114-Status: GOOD (  17.70  )
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

On 05.06.25 18:30, Dan Williams wrote:
> David Hildenbrand wrote:
>> On 05.06.25 14:09, Jason Gunthorpe wrote:
>>> On Wed, Jun 04, 2025 at 07:35:24PM -0700, Dan Williams wrote:
>>>
>>>> If all dax pages are special, then vm_normal_page() should never find
>>>> them and gup should fail.
>>>>
>>>> ...oh, but vm_normal_page_p[mu]d() is not used in the gup path, and
>>>> 'special' is not set in the pte path.
>>>
>>> That seems really suboptimal?? Why would pmd and pte be different?
>>>
>>>> I think for any p[mu]d where p[mu]d_page() is ok to use should never set
>>>> 'special', right?
>>>
>>> There should be dedicated functions for installing pages and PFNs,
>>> only the PFN one would set the special bit.
>>>
>>> And certainly your tests *should* be failing as special entries should
>>> never ever be converted to struct page.
>>
>> Worth reviewing [1] where I clean that up and describe the current
>> impact. ;)
> 
> Will do.
> 
>> What's even worse about this pte_devmap()/pmd_devmap()/... shit (sorry!
>> but it's absolute shit) is that some pte_mkdev() set the pte special,
>> while others ... don't.
> 
> As the person who started the turd rolling into this pile that Alistair
> is heroically cleaning up, I approve this characterization.
> 
>> E.g., loongarch
>>
>> static inline pte_t pte_mkdevmap(pte_t pte)	{ pte_val(pte) |=
>> _PAGE_DEVMAP; return pte; }
>>
>> I don't even know how it can (could) survive vm_normal_page().
> 
> Presently "can" because dax switched away from vmf_insert_mixed() to
> vmf_insert_page(), "could" in the past was the devmap hack to avoid
> treating VM_MIXEDMAP as !vm_normal_page().

The thing is, in vm_normal_page() if we have CONFIG_ARCH_HAS_PTE_SPECIAL 
-- which loongarch sets -- if we don't see pte_special(), we will assume 
that it is refcounted.

	if (likely(!pte_special(pte))
		goto check_pfn;

So if pte_mkdevmap() does not set pte_special(), then ... 
vm_normal_page() would detect it as normal, although it isn't normal?

But maybe I am missing something important.

-- 
Cheers,

David / dhildenb


