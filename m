Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EFBC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 11:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdEh9cEys/eVA2SD9wfMRib1+LZeWMxS5mffwDFqNgM=; b=XfgImRZCDUT1cUFYSJ1Kb04XfT
	DXN2P2f6zO86+u2TJSQ3fSBwuZN7lKXVGM9Rn28RbtWXqjHZ3eEP3OeYhF9PcqmVNZamxUSoJkOms
	lc0QGgNxJ4XevJJsH3sFvuor8eFmGqucUTMS5LtRGgGWQQ8efbwuqXEZ57Jfd0oa0WQk1aOmILNV0
	8eAhtskCtx1ByLwoH90t8TXHRe+cHTIOugqpFAa6cGiUUbzo8IZJoFQg5soR7V3Qvd9UBB6OWqCnX
	2PE44+d8FjdUb7aQzK8uOpeskkt6HmoXFYPJ+JJ7poP9+UQrHcAPxiw+QS3FYUtvUudvp2CoO1PbN
	/RPrLJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUIt-0000000716N-3avh;
	Tue, 17 Jun 2025 11:16:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSrw-00000006nl6-2jJN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Jun 2025 09:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sdEh9cEys/eVA2SD9wfMRib1+LZeWMxS5mffwDFqNgM=; b=gEDdMRxTnGsM0XmZIJWwtlsp8j
	aQwd5I5INjAUBiBMkX3SjROEhALaxfutkSjEfvzYUflhmKBaqDazLPiDIV5z1g7UXAmyOMrwfNuck
	T3EBfSuxhy9I6/P3NH/SLbhId8I7HYasvU/JrBY9iNbhEZ18ekVE1UEDvh+I8w3+zof3uUzajq+VV
	IPF5P+nQPXFHOfvvcgDUBxJwo4QphBNghma8liROHpTFJ6ZQztfAs8kgZWjSGJxRlkXS/FB/U89fc
	ODAA3x3pD1BTZavQw9f6ze7CuMEWdyoUsKyyX52ualwgJEzXLiLULZBZxQdYXUHlkF9uW9fgSB38S
	PN/qYP9w==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSru-00000003kzn-0aes
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 09:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sdEh9cEys/eVA2SD9wfMRib1+LZeWMxS5mffwDFqNgM=;
	b=HzkAvfQ5MxcdicUALf8x+HJQ6rSnG6en5uVXFbpN5p7IIQg8wsyrYNKbvGRIfahqmatl66
	bdDS32JdHJKsv+TlHV1MoFmk8t6EJwDoD1XHnrdkQ5k7lovxogAD7ftAczwnfDO7+nAEcm
	F5e1O3jlh6AtTAu8gH/HK6fOh8tf/5o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sdEh9cEys/eVA2SD9wfMRib1+LZeWMxS5mffwDFqNgM=;
	b=HzkAvfQ5MxcdicUALf8x+HJQ6rSnG6en5uVXFbpN5p7IIQg8wsyrYNKbvGRIfahqmatl66
	bdDS32JdHJKsv+TlHV1MoFmk8t6EJwDoD1XHnrdkQ5k7lovxogAD7ftAczwnfDO7+nAEcm
	F5e1O3jlh6AtTAu8gH/HK6fOh8tf/5o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-KSyP01_zPg2vU_UJGAWuVA-1; Tue, 17 Jun 2025 05:44:34 -0400
X-MC-Unique: KSyP01_zPg2vU_UJGAWuVA-1
X-Mimecast-MFC-AGG-ID: KSyP01_zPg2vU_UJGAWuVA_1750153473
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530c186394so23912805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 02:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153473; x=1750758273;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sdEh9cEys/eVA2SD9wfMRib1+LZeWMxS5mffwDFqNgM=;
        b=DcAoGytJYzGODm8HYLp81r0GTgI2VgMImXBd6AzppofdSnz7W42hFR5Dv3b5aG4yNK
         Pi8e38ufVxTeEPXnOzIV9DixskBjo6MwsPx78yhmeHxslRAENb5+8oYVMP+hPdXWILLF
         hxmhux9uRazKuSkUalkqpNTHUsrmCkvVlRaYtryMhuKIILqR+H5/dDjLNxzipl8xEm/i
         ZrnUN4bM6bfYYFwa40P2qUseirFUzjoqNgCVqvXhjG5zbmxpXF81I+6Zkj40eZ4zRXRF
         NQMRjQnl1UkFeeyf3vgdO5Hxce1vH0g1I0ZKzuX4yLwI96b3hpSChgGz1MyufUm6sIN9
         HToA==
X-Forwarded-Encrypted: i=1; AJvYcCUvW5y46CLLaNBF4pThb/omDdR/oU8YBMccDybDTUXYRNcyhIN7YtMjyeAmOi5tLUjhky5Q3ZS6qmP3XUqZMg8R@lists.infradead.org
X-Gm-Message-State: AOJu0YylJItoYEQUw6I0Hvmp0e5pOt/DV2GlOHT5iguTSo3jef1s4aRr
	mnuNsWdu7tGIFkHAl4uVf2mdGVXd+iex7xqGbeLz5dywxv3eomTnzOQlDkwvcv3dg8RwhZHkQ1K
	OrQnphptyST1fu/3UGpv6PRG1OdhcyPzonrQ4cO58PGuQCZJkzM8Ih9ygicGfJ94dxUqmYGsVUa
	RD
X-Gm-Gg: ASbGncuO80BXK9Y4055YKRRoicFMUfqyizfLKG80A9282Ejm6i1Hy7hHIYBvmPPwsZJ
	3ax86PXRSz/fDRA2RT3RrcWXw3uZNoXNzOI1VXlBq9fJa7GQGrhRvYB5HHmzQwUV/76+pb2LDEC
	WAR6sz4RDrK8M58wXYirxKIApU1oxt/K3Hjju/KDXkO0Mfd437mbQOyABsKCWx22PzkvhdJiiXw
	BoAXALC6YR3BVeWsDXSnANJ4Ku3EuFxdttOfGUMlrQLcTQwQc3fJkVpk98fdTshL34fRRIBXRGo
	YQmV4FCRog840hQKQeV4TKSTMU7MYdEnGq5CGzhoWcssjSFRMI+0olkHlR28J2rLuooUzFoi4Xr
	qOn7dk5OxwRjtam0JuuW+OaXQ2382qWYBJwUMfCAA2oXXpVY=
X-Received: by 2002:a05:6000:65a:b0:3a5:88e9:a54f with SMTP id ffacd0b85a97d-3a588e9a99bmr1291316f8f.1.1750153473097;
        Tue, 17 Jun 2025 02:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHQpVd3mwZ+TEDjCXC20DL1F3MMRYh4Y/yZHPnb93a/Bf/b7RyUJmn1/nXnnPCK9NELoBd4w==
X-Received: by 2002:a05:6000:65a:b0:3a5:88e9:a54f with SMTP id ffacd0b85a97d-3a588e9a99bmr1291288f8f.1.1750153472667;
        Tue, 17 Jun 2025 02:44:32 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4b67bsm13257644f8f.83.2025.06.17.02.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:44:31 -0700 (PDT)
Message-ID: <31bdbfcf-bbfa-46b7-a427-806d42d88cec@redhat.com>
Date: Tue, 17 Jun 2025 11:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] mm/khugepaged: Remove redundant pmd_devmap()
 check
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
 <d4aa84277015fe21978232ed4ac91bd7270e9ee0.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d4aa84277015fe21978232ed4ac91bd7270e9ee0.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gDWXqFrgmprpEOpsThpD30eq4tV3NbMHRBLMJYP7EFg_1750153473
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_104438_683438_A1254740 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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
> The only users of pmd_devmap were device dax and fs dax. The check for
> pmd_devmap() in check_pmd_state() is therefore redundant as callers
> explicitly check for is_zone_device_page(), so this check can be dropped.
> 

Looking again, is this true?

If we return "SCAN_SUCCEED", we assume there is a page table there that 
we can map and walk.

But I assume we can drop that check because nobody will ever set 
pmd_devmap() anymore?

So likely just the description+sibject of this patch should be adjusted.

FWIW, I think check_pmd_state() should be changed to work on pmd_leaf() 
etc, but that's something for another day.

-- 
Cheers,

David / dhildenb


