Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8231CC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 09:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tVggpdHRMe70SNIVLjgFowvBJ62eIYbXphR2T3zCDQ=; b=eXcDSou408g5hZFoOJypXP8V1h
	JpgiYd8p/vjkcUzhsGC6DCJKY6TjiNnuTTge71aC1mPKha2a8Kx/HyS+VuQIGm6U/XUQuu2TCMMCt
	o2qFaVa/iVbM0yS9T8CL5PBI/+UjXDK6vpuf0rFOvV1vm8VDek8q93/mCiW99Z0QGCSKQ3sUPh4F4
	fX/KlwDTBj8LYqjLhKT811gTTUbMArnqBBq7v+tV2tuLEzRfdc0fR47rpUIz+TEcRsDsdjEWOwB5q
	VDEpWKZ6FqS049rD14M4OoLKu8YfSvbsLX4TZyxe0wcAsBTz5PSZKV71w+KNJADingYMnE+DQvEMe
	hwNi1K8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRT61-00000006r66-19Zb;
	Tue, 17 Jun 2025 09:59:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSlD-00000006mig-0YvW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 09:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2tVggpdHRMe70SNIVLjgFowvBJ62eIYbXphR2T3zCDQ=;
	b=UMoOWkEqqlbRwSqFW0CHNxp38+Wd1ob891MnyY+5Mmbbl457B09psOAlud7BAxUbueZqdH
	0DgYjpiNdQKyMFDitMPEX2/nrGmzck+eECLU7650Eg3N2+RNiLw+UAUhzTv9KOOfkjPlmS
	p2+DE2BEwl02bwR3Ykn8R5sMcCmL6aI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-WErf2hxTMNK_vOdt4R2JRA-1; Tue, 17 Jun 2025 05:37:36 -0400
X-MC-Unique: WErf2hxTMNK_vOdt4R2JRA-1
X-Mimecast-MFC-AGG-ID: WErf2hxTMNK_vOdt4R2JRA_1750153056
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d244bfabso44594205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 02:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153056; x=1750757856;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2tVggpdHRMe70SNIVLjgFowvBJ62eIYbXphR2T3zCDQ=;
        b=A/Eq65a5QZlr7oKBgzOsmPGNlfjDDhADph8n9N1HugKlQStWv0pcyKSVecNlJtmbJM
         fNkPZ82hKoC0XqhAHX9Ao4oM+VY4eniCU2FGcdGstb1p1SHZgx0XowKbZacz5PWNgDkn
         rlpv/FXFRe4NLs3tiYlP4XxgZHs09FdhUurZWbLcmKUwntRdcTIClyjeZekEq2U2ZWDD
         sqdXUhlhuT2eX16aBNl0+PEmnWka1/kfJeKV04VkzjzVB8jGl98kZYjUChQt8Fpf3g2r
         HaXd2NA8kg6emVeSrolFroC/pCtQxillCkLd+cYe1WAaeg0UbNq8RWWwhr+cc2s73ne0
         SCgg==
X-Forwarded-Encrypted: i=1; AJvYcCVWFW0KNiMZzGjabEb03W+xT1kEx6e7Oh5Ud3n+9ohzCDeIQhDQ5fBoRp/dXg0Wef9t2UYtifP3wi/4vrk7Ajmt@lists.infradead.org
X-Gm-Message-State: AOJu0YwRDYUSea+vvv3QCd6JM0FOQP7ccfE/IICNmCUtwsbILHSu+LYX
	UfY58ckMbmgnQkp6bTqfXVGOdqA7w6OO+0CSZUlxMlZ05p/y6wZ9X6h+UdGXgBJsqG9zUQFh3R/
	H0JloCGd1VF6f1tZCct05w6Mh3gX7lWMRx1HzYh61fHqlIXpX00BZgEJAUXW1X1Hq71nJm5+cv0
	bU
X-Gm-Gg: ASbGncvxXbiq9SrqM5EY4TUTPjnIFTuAkqSDshtAjXHJzlZbVZ4E4kLOPmv4+L87fBG
	vslGhbPu3V8Hizj/CXleHpGrhuDdyFNCUTKS0zSE9j/v8ZoaWhh6o0FVKcmxiNSOWkAFCMn40i7
	H+Qh5IsBohTZEVSDVIAffBhm+bnFXda9bJKUBIgxxjf6bfTBSfuyuYrDJxJjXkaPySAPxoSor+I
	UoHE/23pqPoavU5MlS1JtaqzG2B3QLCObDFV5prhpaS+epOruWfPk5TIwOTQhIgbtfLoj+5ijMw
	e7yiQ9XNLY7SzvKZUtfDHTDD5Mg2YCRpR6Na+23P5bEzI7hyWkAd4OJLFlNGOIqK+AKVAeP+RYr
	AzpxCDY2KR6VA7niVveqAasDrUX+uzIjL7f6SgVW6rGEXaks=
X-Received: by 2002:a05:600c:3587:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-4533cad1aa0mr127695135e9.31.1750153055574;
        Tue, 17 Jun 2025 02:37:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE33mK7aAFnuzBQX82pmdkrCA/cX+3l1nAlm3F6BLNfxNOkhwo9+uvgQ5HQNw5b5NLLg7ZP1w==
X-Received: by 2002:a05:600c:3587:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-4533cad1aa0mr127694505e9.31.1750153055045;
        Tue, 17 Jun 2025 02:37:35 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224888sm172776835e9.1.2025.06.17.02.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:37:34 -0700 (PDT)
Message-ID: <338a45b0-40dd-4c11-bbe8-a047559fb77c@redhat.com>
Date: Tue, 17 Jun 2025 11:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] powerpc: Remove checks for devmap pages and
 PMDs/PUDs
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
 <818b2fb2f2cf7450ecdd698f2fa019aed3be7b85.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <818b2fb2f2cf7450ecdd698f2fa019aed3be7b85.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fVzkHXrFx3RFO7BhNeW0ldWnEjxQkKdkM6thqV3vw6I_1750153056
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_023743_237404_88257026 
X-CRM114-Status: UNSURE (   7.61  )
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
> PFN_DEV no longer exists. This means no devmap PMDs or PUDs will be
> created, so checking for them is redundant. Instead mappings of pages that
> would have previously returned true for pXd_devmap() will return true for
> pXd_trans_huge()
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


