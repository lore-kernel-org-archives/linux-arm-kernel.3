Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF17DCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 14:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9gy2Et/tdx42KkCuY9tv69YTLaLyxM7iG0J3rCGUz8=; b=uBIxnvr2pYkMc9v2mMcy9/fi9x
	gKawI6B7iGZ+xmBc6a5pPr26RjoUCCMqkxn5ZHCoYXdYDNcG6T8R3tsqkf4CVGOLeV631u55k091W
	3OwVYgjwEVBZE7eaUcnj1zaVKwxF8AYpNA4a6GNafLoIofOtlwiEawRZ6LBfZkksTlcqoq0iIBDKC
	aWlsQQWPo40c3DUPDEqewO61FcZj5/O48GiNOIwqVIhokktk4+2vaXmHsCLJalh/9hUAr2H7auw7z
	+EV49LcSGWsP8BTieLvKpcDjV91L0Aj+zz8h93ECaSOxJGMCiwL9FSOJoxZ6zS93w4Mdh2ueCJNdY
	tCO2fFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNXW-0000000HVjO-2kkm;
	Fri, 07 Nov 2025 14:34:10 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNXU-0000000HVin-1KPP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 14:34:09 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso326342f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 06:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762526046; x=1763130846; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U9gy2Et/tdx42KkCuY9tv69YTLaLyxM7iG0J3rCGUz8=;
        b=YPLhMnlmWlOtCck0vDmm0ToVQzlk30i0JLb3FcTBZ7Q5kIKp98BGbqJZ60PLgAEL6N
         tlWU1ZZiAFOmwtF2PlevbCeVX+Thd73qlgyVcB1ptSvUd3NqGykLIp2p3bED4oZ5W0YR
         4zu2XwuBNcZV6VnjgTYMGVGifTzSgFjVijeDaI1TGzRPN2uRhVNd8a85gUMCdxrjN8fO
         PgUdXptvEvCezGjYurvtFqaxoT2g6p5F2VDB9kfNkLGJqghHRrvrX+t5bbUtnndFS/Kf
         f0BM7Qq7NPz311S8v4NUqCQ+YiUwnpH3PK54bjNgQyOyL4p0awHZzfzlD4aA24cGLhJ5
         gryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762526046; x=1763130846;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9gy2Et/tdx42KkCuY9tv69YTLaLyxM7iG0J3rCGUz8=;
        b=jxIpDPnk2xA/N6v/AkO3UWSt1UgW7ASrYMkxCybg3CFqET834wAbbmhYvhHrUj+STh
         S07B7sO144qOsSgLCxxtgHaCHbJJenxawbYBRgaWFE9BSKTzuJNPWGELCfTjPs4GkrZH
         y01E4WycKHoNC2XXz7dM/qz0DfRV+OeyBoBpG0xG34hXeK3dHogGKOwVuyUQi/MPEmXQ
         BbPnOHGkCOHh030IJdVYDEXBqgxwByh8Qz3qOv+oKxcM63pDIwfF+UmVH3/fQlxUbRUA
         PccjU0NlDam0R45OctuBU3TAEoP0Do+5hiG+ChdEK8YmY+Fshu6uDKJqRqBpLvonNLuR
         15gw==
X-Forwarded-Encrypted: i=1; AJvYcCXywg6EJuyrNe4AQdivCVD+8L8kaHtLVfDCYZjlVmkNBtoKFaxhq5OA9Z7dbJ1Zu19LwrBvYgBujowt/vclpmZy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8kHp1VtxkW5BqoXFpHsu8FgW1nFGgpu+yzfRyMk/xWeT5HBf7
	p5JyucusATz8Gu2JmVRO8a/UW7a7OO/Fyzhk9H/5WXYZs3R4nuO+LIXq
X-Gm-Gg: ASbGncs1vtMX8fsZYXsb/waI2++X48w2G6z/YPLFm5ugLaFYrAqIndL41iaPqpYUBiT
	m8/S/u4hVjiF5OaZmMWVnztE2Gs6HuX3ufBvWFsz8DWyXhDjAJnf1k52myvyeRY2inS3csSKGCg
	aImJxBfEUKZVnvz16DOHeJgp7vKH6WNCcT4WA1mXnZx/mYw/1rFMAm21diZC5HqJX99qedvyE7i
	o56mVumFOHe+1t4uEKCK1WWDSp1TfRRBLo76I5RT2eu9MDN//ctqtjuhBxdeiLK2emRrObgdsBE
	an0hxIn2jTgiHGXuGpco0JUNMHUR6bGNYqre6BvlgcC67fSy2GWv15ry0M03y35ZPijQhvNsdYt
	WQcuv88WhR7xPYXvw+eC5lHT9JuHk+zz7/yZLOxFnhJu59jJuQRPrV4yITpPi1vlDOd3Jf+vphp
	WVmMDWl1glhSSkaHNTITM3zwtItGgRaVTrhvk0cBUeF1QSB+qDbSEr41debyvJrSh6VzmqZMZIb
	BuPnlPAYvADU4vMo34pq6OtGIOm/t4=
X-Google-Smtp-Source: AGHT+IEbeI8C8CzNAXSH/bs89gWIf/ZmK+BLjDzXB4QFwcXH6hASOjwiIfYomA42vxdn493DYIICBw==
X-Received: by 2002:a05:6000:2084:b0:427:e1bf:13bd with SMTP id ffacd0b85a97d-42ae5adfd73mr3148986f8f.52.1762526045768;
        Fri, 07 Nov 2025 06:34:05 -0800 (PST)
Received: from ?IPV6:2003:d8:2f30:b00:cea9:dee:d607:41d? (p200300d82f300b00cea90deed607041d.dip0.t-ipconnect.de. [2003:d8:2f30:b00:cea9:dee:d607:41d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67845ccsm5465086f8f.36.2025.11.07.06.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 06:34:05 -0800 (PST)
Message-ID: <c764489e-0626-4a50-87b5-39e15d9db733@gmail.com>
Date: Fri, 7 Nov 2025 15:34:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] mm: introduce generic lazy_mmu helpers
To: Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky
 <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-7-kevin.brodsky@arm.com>
 <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
From: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>
Content-Language: en-US
In-Reply-To: <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_063408_378140_76C49188 
X-CRM114-Status: GOOD (  17.49  )
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

>>   #ifndef pte_batch_hint
>> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
>> index 5d2a876035d6..c49b029d3593 100644
>> --- a/mm/kasan/shadow.c
>> +++ b/mm/kasan/shadow.c
>> @@ -305,7 +305,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>>   	pte_t pte;
>>   	int index;
>>   
>> -	arch_leave_lazy_mmu_mode();
>> +	lazy_mmu_mode_pause();
> 
> I wonder if there really are use cases that *require* pause/resume? I think
> these kasan cases could be correctly implemented using a new nest level instead?
> Are there cases where the effects really need to be immediate or do the effects
> just need to be visible when you get to where the resume is?
> 
> If the latter, that could just be turned into a nested disable (e.g. a flush).
> In this case, there is only 1 PTE write so no benefit, but I wonder if other
> cases may have more PTE writes that could then still be batched. It would be
> nice to simplify the API by removing pause/resume if we can?

It has clear semantics, clearer than some nest-disable IMHO.

Maybe you can elaborate how you would change ("simplify") the API in 
that regard? What would the API look like?

