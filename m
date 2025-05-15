Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92254C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X82t4cLKTKnsRxCL8SUZOCcFI9aAbfLSXRgL2LQLe9Q=; b=bevBzba+znFMMbMrEbxkIyN9+J
	eTbiUnYCGJQ8Eco2WvjaODtqenLFMRXPhUxpWfzV5M/HbDu2lPcAlQ3mdEWkHToOVHq2M4q6/ubT2
	ZgIvH/mjXphAakJmldcxDHL9/5OMJYnztKhTYDVEiC+q5YEDYO9nWPpKw1ZBO5sNl1eLzLvYFN5wt
	tpZ/SZviL3BtaPjk6eqZPNKyK+0TJR6fy7Hxtdrs6WaSvFQ5kNpmBcj5cBQnNFS/XUhSCM/qeKca3
	Ca8uSNxp83EewJDlXyJb2op63xTee8pfkckvVxDbE2U2aJMOuc2QaVJfovbFJNWcWSpVFtE82oB5J
	GglfHIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTs8-0000000HVUs-1cj8;
	Thu, 15 May 2025 08:23:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTij-0000000HTbF-1fWY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747296816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=X82t4cLKTKnsRxCL8SUZOCcFI9aAbfLSXRgL2LQLe9Q=;
	b=i6DA1Si627dfbWHVjUv0Qn8+NAu1HiuwuTwhNQL278AEIfvsUuahEqVzH+dMofdAKsIPVR
	8N2jqidw3/ee04W4LjVyuLCLeJsgAj6BvJ35Kwwx6hAPGOl1FU6NG/7pKdggbGVHtdpuCA
	7Su5ICa+ac2yYQaaRGJUGcDSVgj6vbE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-LFz4JsoJPy6SP1qzCl46IQ-1; Thu, 15 May 2025 04:13:34 -0400
X-MC-Unique: LFz4JsoJPy6SP1qzCl46IQ-1
X-Mimecast-MFC-AGG-ID: LFz4JsoJPy6SP1qzCl46IQ_1747296814
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ea256f039so5136925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 01:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296813; x=1747901613;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X82t4cLKTKnsRxCL8SUZOCcFI9aAbfLSXRgL2LQLe9Q=;
        b=VsekAq0mzL6k/8u14MdwLr/smyNpTiR8Wd7zAJmNtXo0L2IAjmrlnJXC2JoBMjctpu
         PWoNaq22ETfaCj26aEh8NZMizG8r2gGCnV+ncSf9H6XCkb3AB7d2xYme3gJ3+J8VbNP9
         81LOJ/XBWf4uxaEM35tVEXMuEwAJe5QIJl2NF1Ej8fl04ZGXdWJ8WEaaUy/toIz2e7ZR
         1EYWRXnB4X6EnKK1t5DJmgjD/u0NtuD+jsPj3REeXwoiRUX+NTVOzN811iayC2SCwkip
         MmLxMJ5Tzs157tLi34NnjfbiLhDMg+u+agMIv0dhbBOmhXf6T0wEB3SFtEg239iT++av
         3H1A==
X-Forwarded-Encrypted: i=1; AJvYcCUqV5Qa2QOj1ep+PXg/5tFoevc/09wAE5fQ/43vsEXhcDfNbx+MXj5xPr/JKbQc93eFqbmUOFR9CnQ+RarlV+op@lists.infradead.org
X-Gm-Message-State: AOJu0YyHuysZd8/7SJVXSHaK56+4jPginJOt/s0vT8LFt2sVw/ahA68Q
	mlbn96OObLBn8iJbwSBkqIxoG4s5yen9V9scjS8ZeqfeIymUlT4hIkTElsApWtJMFX/22Dp9nIr
	5lhLMdyYL9AUY6UBLYu1VLOY6IPg8Mw4YJyYzzrSzpj6fBFA7WIn7kkKN1Mur0dnpYK1z2BE0
X-Gm-Gg: ASbGncs6sbp6Lo/LKPV7A7FovkLCvJkEht4LhYtu2VFikuLl41T7xiCDfbeqfzmDlM7
	Mlnc+gYuChhOaKONHcNd97U9mYVEeAJPv/qcMctbyylzYwUuL9CCs03jCpmEWZ6zOMwVOQ4+Hvl
	lffmMXR10IBXllLvCL3I2NX0v6SWpAWxvHil8NaREoZa8qIC4muv5K8W5M0EYJ/2CimUTKhvPl8
	MJWEeJOZ/ztyY6sTwnWFOr5iVk30gaxqcwFA5pJsnAAORu9+1SkrZBOJMlTNcp7u6K7nzvwbQhr
	LT3GkJjlpPSvp/NTG8z2dGdIIXNyZDE+3o6ufAC3FwTuth0tzgM7/DdiYSKDSVqbRsVc8zkcBRi
	Dq9c/6NldCNh7zqk8rEeYplB93D3hCp6Lm9aIB2g=
X-Received: by 2002:a05:600c:1e2a:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442f2168cefmr62635525e9.24.1747296813546;
        Thu, 15 May 2025 01:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ4yEJ40Bte9/ZvoZPhXRQJk53rxk55y+uY5hjWVaM786EZ6ON9P8vWYAwiAFyikt62n6Dtw==
X-Received: by 2002:a05:600c:1e2a:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442f2168cefmr62635265e9.24.1747296813191;
        Thu, 15 May 2025 01:13:33 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8613704sm23624685e9.31.2025.05.15.01.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:13:32 -0700 (PDT)
Message-ID: <332ecda7-14c4-4dc3-aeff-26801b74ca04@redhat.com>
Date: Thu, 15 May 2025 10:13:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Check pxd_leaf() instead of !pxd_table() while
 tearing down page tables
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: ryan.roberts@arm.com, anshuman.khandual@arm.com, mark.rutland@arm.com,
 yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250515063450.86629-1-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250515063450.86629-1-dev.jain@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0e8vBIGa1JJMXBHkxSp1hK4f3t5nxx8W6hLwWS44TK4_1747296814
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_011337_520493_FDAC6ED3 
X-CRM114-Status: GOOD (  10.42  )
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

On 15.05.25 08:34, Dev Jain wrote:
> Commit 9c006972c3fe removes the pxd_present() checks because the caller
> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller only
> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
> pmd_free_pte_page(), wherein the pmd may be none.
The commit states: "The core code already has a check for pXd_none()", 
so I assume that assumption was not true in all cases?

Should that one problematic caller then check for pmd_none() instead?

If you were able to trigger this WARN, it's always a good idea to 
include the splat in the commit.

-- 
Cheers,

David / dhildenb


