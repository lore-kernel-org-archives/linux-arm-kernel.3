Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D39E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 22:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSLYMoWvHcnkmKFurx8SkgSXyiJyqs7HoLAYTVGYrAc=; b=cjXre7mzxeZV1fVGZZnRF2qOsS
	PPkjagbKFmKqbCMswVu2xbZItLxAk831wydDaTMTcp9vniOZnUo1yotMQGbsQq9NgxR0p6Teeyflu
	Rcp5b5Y9xPhRaosK7x6CrAz2zItccTDE9RbjYPdIi+229YT8GuCx3AHpx8kkWxuLj2Lc84UJAuVnA
	dAtJZNuVay96o3UZQQUDOHjr+lhHZv99gfuBvlpRVDxb1QxNe3WNwLqPsvUABwmxhnFa+LC2QdcTx
	ayd0B/mmROSfM81z/fWuY36dBvgtpYUvdzFPBHJ8/xbzba0U4eObFN1cGjDt91nJSziyuaYHKtcot
	bV1YAnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfjC-0000000Ex9d-1HMz;
	Tue, 17 Dec 2024 22:07:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfi6-0000000Ex0q-1Twc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 22:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734473192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OSLYMoWvHcnkmKFurx8SkgSXyiJyqs7HoLAYTVGYrAc=;
	b=RUKkYYGn/7UaXt5bF7t1+2H11VTDxzrQhUHYkJgYogQJ1f/WHNY/YSWA+oSaKZmFsidbOS
	WyFzJ9j1n+XG/swLcxvJRgEaU09jz8+MpwOoP8AK+jDfC2LEmzh2T5xqJU91GlZBSGiml+
	5BSJB+5ZZoc3bgRqr4sTEGCIIcVybtg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-Anof5zk8P22lnFmGaZ1ZzA-1; Tue, 17 Dec 2024 17:06:29 -0500
X-MC-Unique: Anof5zk8P22lnFmGaZ1ZzA-1
X-Mimecast-MFC-AGG-ID: Anof5zk8P22lnFmGaZ1ZzA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385ded5e92aso2354742f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 14:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734473188; x=1735077988;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OSLYMoWvHcnkmKFurx8SkgSXyiJyqs7HoLAYTVGYrAc=;
        b=T7AT70NeDmPIp1pXT0DAtLFgAMRhNwaQ2GVFNwDWIrUhQZEocalzLxO3ef5hbQdQ+/
         dDyQER3I0LIFvrtlaM2Y0LoTvy9ecpXkDDr9KW5dKjOgjobiTyYPz2vVDi0prbLB1uZt
         1or3eXo0AEeHXW57ZwwQNqhdVERjGpfuYlNkGAFjf+6PBClMg91tZ9pL+m6H/KSThX4W
         Mup08h7iPrP5gXAQFfIDiIj6yWIYo2V/IM9eFm+WGfoeciG1XvRg1tc+pcZN3nuyaWQy
         WOpuwXohoJNhFXmieSHG0ctoY26KFTSTilfrrWdk7iNqlL+bgW1mIXNSH4pmEPHyflXQ
         Y62w==
X-Forwarded-Encrypted: i=1; AJvYcCXJqXUy/qnXGoBCCeUU62pXrIq7e7ZWK/Sz2uKGuca4eyOPB7bCSzOC1mACZ9Vc3mJXwJO7PGEiTiSIyrhNxrm1@lists.infradead.org
X-Gm-Message-State: AOJu0YwPM6uabbFtNAwrl+eGDbdJfiCx4OXD+WdIjFEknQdchuaD0+CH
	5V5Mtw4x4+uGAVCepoadcngjKvy9jBPlvPzvm5hAXnhsizOv49jN5dXO+p3gSptX98JQIqJLALP
	vKqppAsCTR1w0c38LCXCbUpv+cFU34NJNhdxpCtSUFQAVWRmrDsnMgRiCrLtXri8vXls2HMuD
X-Gm-Gg: ASbGncslhk0ntiI2Duu9hfLxA32TrvhdygCixbqGrpSC/NummnsrZufH8V5IySDJ7od
	ym3xUV8r+CM2xaeZ21S9f30lG3MCHfDL3FxTKY9bmXY/g0wE1updlAWF66ehaW2y3vqYihkO2Pk
	sKsyg+Gt8za4FwhvPeQ+1s8iBablFvwws2KV2cKPneYSPCyjrRiTTTUAU5Ul7BlFJ0gyrwhL414
	m5gaToWyU79J1XP5KCvXJbWVaxs3ep6UZhope7qnHzQ3+9KEaQR0zS5X/K3N1Ct+yuGUZl0GEaD
	mOvKm0DLYI4RkKNVJKrbNvOLm/tZcufZuJ/DHujeSr3hQKju7N70eW6gUfcZ0mDqc8babOUOFrb
	5l0Qfm41Q
X-Received: by 2002:a05:6000:461a:b0:385:eecb:6f02 with SMTP id ffacd0b85a97d-388e4d8b688mr358667f8f.28.1734473188375;
        Tue, 17 Dec 2024 14:06:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEefTx+5wwgHu5Lo3QBynYxK4sBxxlYTWobNsuzYzh7kr1/3xagCl49eAlHDCo53GInNei+Aw==
X-Received: by 2002:a05:6000:461a:b0:385:eecb:6f02 with SMTP id ffacd0b85a97d-388e4d8b688mr358632f8f.28.1734473188043;
        Tue, 17 Dec 2024 14:06:28 -0800 (PST)
Received: from ?IPV6:2003:cb:c73b:5600:c716:d8e0:609d:ae92? (p200300cbc73b5600c716d8e0609dae92.dip0.t-ipconnect.de. [2003:cb:c73b:5600:c716:d8e0:609d:ae92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8012112sm12401862f8f.11.2024.12.17.14.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 14:06:27 -0800 (PST)
Message-ID: <ea6eda57-f150-47ea-97b8-fc8eeaf81bd3@redhat.com>
Date: Tue, 17 Dec 2024 23:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/25] mm/gup.c: Remove redundant check for PCI P2PDMA
 page
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
 david@fromorbit.com, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
 <3f20b8d258d4eb72e1eadd5926d892bc61f0e0d4.1734407924.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <3f20b8d258d4eb72e1eadd5926d892bc61f0e0d4.1734407924.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DTEqjhUzgc6QtrC3AeBR9UVcYYQsxQAppfZ0QnhMIKw_1734473188
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_140634_551348_D1E82E72 
X-CRM114-Status: UNSURE (   8.56  )
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

On 17.12.24 06:12, Alistair Popple wrote:
> PCI P2PDMA pages are not mapped with pXX_devmap PTEs therefore the
> check in __gup_device_huge() is redundant. Remove it
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Dan Wiliams <dan.j.williams@intel.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---

Nit: patch subject should start with "mm/gup: ...".

-- 
Cheers,

David / dhildenb


