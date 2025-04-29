Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A0FC3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcwgSF8VPBQ4GrzqeTBGO0gBdExjzBeKM9YAxqzWWgs=; b=JWL4Vl+5gnXSOAy8ky8RxW0KFS
	rIQhAztjcUTQZ+a/l9LG4XEb/stWhgB4uozyNbkHG53H0B658ZjvdBuqD4CEhvsP0BsDwxAoJET3z
	WcgJQh9AfKrCDlfm8VxezaahRjLwwCMj7QT5Mr6vlRGZY/4as1VwHN93wzNNF5y5B5YDVfqxas1m1
	Q1Fd3he9NfGRrr07Lu4P/DHJz2zPNh21dAsyF3GdP4gf7xc2sdwQT4jeRRnPk5xbbb7KyZklWD7JM
	82g595mGW+E1Mau+t7RpETYda5S8wjtsDn8ftSuYAwc+4aabQdOlI0duds3n5YcVWXxqbbUKcyv3j
	EZlaueVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9h6C-000000095lH-01Wg;
	Tue, 29 Apr 2025 09:17:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9h4H-000000095Q6-3Nro
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 09:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZcwgSF8VPBQ4GrzqeTBGO0gBdExjzBeKM9YAxqzWWgs=; b=MieJgPWiETfh7vqrJ1wtFOTtSr
	mvjzN5ZdVHlR0hasnxHfoeH5d4VjAaguihXN0qewhPExSqrpntzpgb6suPrFDgJ3JC+d3j6Fw2K09
	IrAZb8CMyncMPRJg7U0DSlQdoB1iZ2YK9dhGVHOE4sUU4WLByUR87WJPsw3BMQ639+azvEvCC5p5O
	BrdTX++/fL8cYFAkjKOV3zMeKg63ApbLLeR2QhPKtOZpLuaTs101txmZoqjr2s/cuSFtZOVlANlVq
	HTsgU6auXrgYHXAO/o2EvvYsWrB+0EWVFhUE/j76t93VIZ60Y2+Nqqv5e4ZFjjLjOqqk0mvvCL2u2
	+qPD3XjA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9h4E-0000000DFAM-290n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 09:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745918152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZcwgSF8VPBQ4GrzqeTBGO0gBdExjzBeKM9YAxqzWWgs=;
	b=B3Xx3yKV6aW47VZsj9D4PmGu+RSbiu1/3peWieRfgWGZ08MCPI53BrIhEvrDKZfxMQl/pI
	X9O1L9MYTdzCG4SN7iYUzEqZH2SegIrtg74mW2Mu357otmMmXFZzOi8hASgVBAyeHMXj9p
	eBFsh7hxXQVMfMzepZIlQ8KzNDKjuBU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745918152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZcwgSF8VPBQ4GrzqeTBGO0gBdExjzBeKM9YAxqzWWgs=;
	b=B3Xx3yKV6aW47VZsj9D4PmGu+RSbiu1/3peWieRfgWGZ08MCPI53BrIhEvrDKZfxMQl/pI
	X9O1L9MYTdzCG4SN7iYUzEqZH2SegIrtg74mW2Mu357otmMmXFZzOi8hASgVBAyeHMXj9p
	eBFsh7hxXQVMfMzepZIlQ8KzNDKjuBU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-Lb5VAkUhMMyHdvnSMcwK6A-1; Tue, 29 Apr 2025 05:15:48 -0400
X-MC-Unique: Lb5VAkUhMMyHdvnSMcwK6A-1
X-Mimecast-MFC-AGG-ID: Lb5VAkUhMMyHdvnSMcwK6A_1745918147
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so23289635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 02:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918147; x=1746522947;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZcwgSF8VPBQ4GrzqeTBGO0gBdExjzBeKM9YAxqzWWgs=;
        b=Xr8AIyLfQUSBDPVhtFbhlADyPNJn6dL+0BYrPP3rfAL8uBan3sThCy4u2Wz7KOydPj
         lj5Va5jDL5ja2+O4qmEYVkAUJCmpd0gwpmmHNn2hWxD2wVR2EsNdSFLWJsC0hBik3c7N
         r3sD/4h2u5rKE+6FpRQDxq8TCiTIYRyY5zZVktOUwBlGD1G2YOp0pc97cf4VrwVMP/h6
         5dmZ8rrEy9BNgHK3b6pkft7zVecRgyHOqU+jnMygYWRAxKZlDl91RlKCNnKs79c/Q+8U
         b/xPGVo0iXG0+mFoRpJTF31gBKK1usikP8PFgL0c592U8KDTP09ju1mqVZKx2YmqsqDr
         IygQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRuti/pkNfS9yHmk/2l2+z2mGeuNUhn0bW+cZS/DUOdJSyiYHafZodychGfPVmo+OXiTEQnI8Of+EKoAQ3n5z+@lists.infradead.org
X-Gm-Message-State: AOJu0YwB6yyeHA+sscpt7LH7l+fDIXUZx8s0sAf7bd+g7YEXQgB/MYXk
	jgSkHu1BJQrU0lGX6M7Nqq0v9Q312JsFIk4SobvyXoG66iDO8BeCwjWyrVENaHgQ1h3YHF3Kcxe
	9OiMGiRSbB/T1jQls3R0gxA5Zgoqn3vUprTdjzvrTXroD+iyA4dBLhWNQzz0wUWRPIA/IMbzQ
X-Gm-Gg: ASbGncu2V1PYKn2y/iTEkrxqztSyUPQfYHxMzYh48oonP9V82r0NE3dKvZOtiID5681
	Zi5IssWCy4lLHpyQVr9m+YJFPD0vYzBgDVvc2EAJOwxMRxzi034FBGjU7zqZdoQ55FP01Idz7Lq
	4+v+1UkzdwYUtvZ5KO0IgAHXVnJSxSzTheRZ9o+H9aUxMR2I7ktdFBof1c7eaqbLDPjOvf3G/uN
	Lm04ALZue38BhcW/gpzTRUryxeBnuc2PvHTZmUV4oAS/MRHTP1XUMFPxC6fG9D1ugEAKQQjnN93
	tmrilPMbnzeSh92Po+OwYNuVhCAOS/UhLR+dUVrs2/RZdnSZ4GaKZr1Yga3QFbsNKldCnjnlcMT
	HJQRbVCBp+DXmFIXQMjqQne2LsFBoHRZNiB8pDhs=
X-Received: by 2002:a05:600c:1e27:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-441ac8eb188mr20551785e9.12.1745918147562;
        Tue, 29 Apr 2025 02:15:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELhiEp0lABCNLnJeW2eLuvjciUB25c0973dnzFKV0LJPmcTWuy7SPqkifmdzuBt3v5z/C/6A==
X-Received: by 2002:a05:600c:1e27:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-441ac8eb188mr20550535e9.12.1745918145671;
        Tue, 29 Apr 2025 02:15:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29ba34sm187785875e9.5.2025.04.29.02.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:15:44 -0700 (PDT)
Message-ID: <bbd0e5fb-ad47-4531-adde-c2c2ee2cef61@redhat.com>
Date: Tue, 29 Apr 2025 11:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250429052336.18912-7-dev.jain@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: taKwup43-4ebd_7oHyYKsDu9B7GXLfzdmVw1XE13UcI_1745918147
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_101555_014785_AE8216D1 
X-CRM114-Status: GOOD (  13.10  )
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

On 29.04.25 07:23, Dev Jain wrote:
> In preparation for patch 7, we need to properly batch around
> can_change_pte_writable(). We batch around pte_needs_soft_dirty_wp() by
> the corresponding fpb flag, we batch around the page-anon exclusive check
> using folio_maybe_mapped_shared(); modify_prot_start_ptes() collects the
> dirty and access bits across the batch, therefore batching across
> pte_dirty(): this is correct since the dirty bit on the PTE really
> is just an indication that the folio got written to, so even if
> the PTE is not actually dirty (but one of the PTEs in the batch is),
> the wp-fault optimization can be made.

If you want to add a batched version of can_change_pte_writable(), do it 
right away instead of just adding parameters to functions.

Then, add a simple

#define can_change_pte_writable(...) can_change_ptes_writable(..., 1);

So you don't have to touch all callers and don't have to update the 
function name in comments.

-- 
Cheers,

David / dhildenb


