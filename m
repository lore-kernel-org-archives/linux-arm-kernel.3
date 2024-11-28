Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA7CD690ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 09:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHvSNuslLvCirSttMP2rRTBlXF7S2ADtrEIGnjsm5g0=; b=hAsObuYddQ1nngqFqtC7/v2SG+
	IS0Tg4ySSXECYh9dz3YzZOaxkoxDoW5WdEL4Mzr5BE2v8Mn8Sg5Y2afik24KdHGh19gZRxlEAGTqG
	+9tkB5rdO4LjY/RdbN/jEPbTTEq0RJ13dKzYuzFKQQ6b0FIq96dRn6or8pQyrjWrfAVnpr1UWHuSe
	O3g6q6p7/6YXAxTDEwtgyksbZiC7oy27hA8gNifhaKmkj0c1ztVHq+AcIVBbdUk6+2u3l/ckOQLcc
	1TcMtz/yXd/eTvKkvrhuBl+6uCu3ZONyH49g+UwaLn/P2ItcbMDA5bGTsGy2LjxaY6roV7PPRv9jI
	OO++OUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbHI-0000000FCJs-3S7c;
	Thu, 28 Nov 2024 09:57:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbGJ-0000000FCE9-0uVh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 09:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732787797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eHvSNuslLvCirSttMP2rRTBlXF7S2ADtrEIGnjsm5g0=;
	b=e/KDayud+oaniUOzg/mkEIovOwierS+DhDlbB1R53WxWSLIJ47NsYkMzPaEyQcqmKARDeM
	FnBtj+S/TSH05v5Zo36/Y1n1ICV0sraSl8ic5G+PN8PgcebajC+zU3MJS84xPFoBegp2Uz
	5iyvjAS2upl8TEwvpJ7RDID6Yk+huJ4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-_kBKdzr2OdaraT9NtEyUeg-1; Thu, 28 Nov 2024 04:56:36 -0500
X-MC-Unique: _kBKdzr2OdaraT9NtEyUeg-1
X-Mimecast-MFC-AGG-ID: _kBKdzr2OdaraT9NtEyUeg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4349e08ae91so4603435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 01:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732787795; x=1733392595;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eHvSNuslLvCirSttMP2rRTBlXF7S2ADtrEIGnjsm5g0=;
        b=BhYpuAwAba0hnn2hXMZ/CZLDlGlRMXUOOzLauUMRuAqFPcG6SwOAfJIPjniT8i8VQI
         od59xv/I0tqSH/VB/391zDkHMh7ybnDsjXByBNQkGYjSW1Yrd/cDZCjZBZQe6T6za0vP
         6SXSXlJD6VChkDInMICOGW7OnIE+ZtwO89L0QSpTcWCXt9xbm0SIXKBWQtpeDhTyiA2E
         iJ1cFdv5Ke1m1UQ9qZjvYF9AKkhhV8/1gcMb5aty+7tqQUvUxdJDy4JOP0rSffAaMomj
         gIc992Y3g4PtGXBMSYPKQ+qvWcz5ASRNNbABT206ZmtAbZPL2C3KrhkafUgmCU9MQ0/Y
         BEWw==
X-Forwarded-Encrypted: i=1; AJvYcCUo68q98c+I+LzZmfgkBEvthnQF4cGAWKJrNBl8ioBnyCpDGdcdSc7qBIufAcbyUoBf33Fi3I9P1qt3CqFzMmjh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Fmtxpe98wTbcZQrDbdjHv8h+k/mESxjXVkdZCWJZ6emZEI9G
	yddaCTJxw3K8i3uzFS/ApmJbnBMZqZYUzLyB5AVCImE35IT6IheH3OHo1FQuOb6Yh87n0lhfQyz
	DMzWYG6auHaHgp4YyCyOu+VSnFpR+JHdSXu+ofdo8Anj6+81nkwUHOXJ2bQZjzbeRiORgRE1F
X-Gm-Gg: ASbGncvQbcJPYC6xyaHENWgxr5fcg+A9VP2qnlO2abhNJbm7/MAuA0/HyLsmvq04mBg
	dPg6AePxfDnv3AXlQH/DaehaSeUAH6a9BvHO0tdxJ5I+jnmVT+DQcAxGom9LSbxrEHXvndswuGJ
	NWgpIMV2UuoZ+d/+fiYV0UFue9P44Gic7ALWvjlk+aNHdvLIwFDcRNBsfvQU9xF/3M60LQYpvF+
	9VCSD1qhEgGNW4ziNIOe9OfZREnV2fJD2PcA3qqmfLpTg1DfwAl/qSkKTFoIyxSmAy0kO0TQ2+6
	UqGESjcyLWD7rYDLIUsnZio3wanmDj/O6S9UPVJbxMs/LL4LOI82viKuDHvBZDDBpan4J4NGpZM
	=
X-Received: by 2002:a05:600c:314a:b0:434:9f0d:3839 with SMTP id 5b1f17b1804b1-434a9dc3d2emr57803635e9.8.1732787794762;
        Thu, 28 Nov 2024 01:56:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiMcfKWkTqfNVnrQ+ET5ExtEv9HsAt7HBCk1uFn156kHSulgQVcobXk07GkLfGJXqhMqnTYw==
X-Received: by 2002:a05:600c:314a:b0:434:9f0d:3839 with SMTP id 5b1f17b1804b1-434a9dc3d2emr57803465e9.8.1732787794399;
        Thu, 28 Nov 2024 01:56:34 -0800 (PST)
Received: from ?IPV6:2003:cb:c714:1600:f3b:67cc:3b88:620e? (p200300cbc71416000f3b67cc3b88620e.dip0.t-ipconnect.de. [2003:cb:c714:1600:f3b:67cc:3b88:620e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f70cbfsm16852685e9.36.2024.11.28.01.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 01:56:33 -0800 (PST)
Message-ID: <e6b3e6c7-193d-43c4-a8c6-6023458723dd@redhat.com>
Date: Thu, 28 Nov 2024 10:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] arm64 updates for 6.13-rc1
To: Yang Shi <yang@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Sasha Levin <sashal@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon
 <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241118100623.2674026-1-catalin.marinas@arm.com>
 <Z0STR6VLt2MCalnY@sashalap> <Z0TLhc3uxa5RnK64@arm.com>
 <0c09425b-c8ba-4ed6-b429-0bce4e7d00e9@os.amperecomputing.com>
 <Z0dhc-DtVsvufv-E@arm.com>
 <dc5e8809-825f-4c38-b487-b16c7d516311@os.amperecomputing.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <dc5e8809-825f-4c38-b487-b16c7d516311@os.amperecomputing.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lUjAXcd0hLfX4-YkHJqpokHtRPAcQTRYRUDrcmFyDQc_1732787795
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_015639_331979_AF226383 
X-CRM114-Status: GOOD (  13.42  )
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

On 28.11.24 02:21, Yang Shi wrote:
>>> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
>>> index 87b3f1a25535..ef303a2262c5 100644
>>> --- a/arch/arm64/mm/copypage.c
>>> +++ b/arch/arm64/mm/copypage.c
>>> @@ -30,9 +30,9 @@ void copy_highpage(struct page *to, struct page *from)
>>>     	if (!system_supports_mte())
>>>     		return;
>>> -	if (folio_test_hugetlb(src) &&
>>> -	    folio_test_hugetlb_mte_tagged(src)) {
>>> -		if (!folio_try_hugetlb_mte_tagging(dst))
>>> +	if (folio_test_hugetlb(src)) {
>>> +		if (!folio_test_hugetlb_mte_tagged(src) ||
>>> +		    !folio_try_hugetlb_mte_tagging(dst))
>>>     			return;
>>>     		/*
>> I wonder why we had a 'return' here originally rather than a
>> WARN_ON_ONCE() as we do further down for the page case. Do you seen any
>> issue with the hunk below? Destination should be a new folio and not
>> tagged yet:
> 
> Yes, I did see problem. Because we copy tags for all sub pages then set
> folio mte tagged when copying the data for the first subpage. The
> warning will be triggered when we copy the second subpage.

It's rather weird, though. We're instructed to copy a single page, yet 
copy tags for all pages.

This really only makes sense when called from folio_copy(), where we are 
guaranteed to copy all pages.

I'm starting to wonder if we should be able to hook into / overload 
folio_copy() instead, to just handle the complete hugetlb copy ourselves 
in one shot, and assume that copy_highpage() will never be called for 
hugetlb pages (WARN and don't copy tags).

-- 
Cheers,

David / dhildenb


