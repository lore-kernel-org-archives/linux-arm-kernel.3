Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E94EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 22:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lq3p/AP2ehM2TE8laSRpSoByadMgmXpnPOPj4urYp8A=; b=qSZ2pDyuZ0eINq1asO6ppL/vqT
	VuKP83nFaJvv8dFDUtjM4sIh0wi05z2jFCCEyNYRw8G6pToPN+d/BMq3b/m+rHvMgbxPIHtyh6YC/
	38p4pSnfz7Xhf9QUqLICU92rsMGl30skmgrkbYV65i1EZRFXU6soCk1JaJ4RSfzTNuRqFZYBEAG20
	kE1BD6QB2huPB1d80hgUXd7clYYqFoLeZokgVCcEWOJpFnoAkZ5w9nSEmVuMLd4xoAHYYS/rlfayV
	t3Vu9KW0Y/1cf3uDDlJPFxFng4Fg1Oh+RiVdULYVSlnACvOgANai/v5Ln7r0PcYuveqLv+8jKmKmG
	w5fxZoDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmBE-0000000GfGw-1f35;
	Wed, 06 Aug 2025 22:00:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkdi-0000000GNp3-20Ve
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 20:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754511693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lq3p/AP2ehM2TE8laSRpSoByadMgmXpnPOPj4urYp8A=;
	b=C7CDkCLAr0EPbR3f0waaPEU66HUZyEIJoajIFKSaR2wHdS8mqa7HXXg/MhCsSXGQ9xq/wL
	vYxu6b8YOWfAEU4fvRiRGdqN0ABBOnLAazSo39BityaP5k03+DNyfwiIvnM7HW+MZakmO0
	a5uebtKfyI5PFVJB9tCA6c7XfHZ11ew=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-jXkA-4BPMlCNA-Z0oR20gA-1; Wed, 06 Aug 2025 16:21:32 -0400
X-MC-Unique: jXkA-4BPMlCNA-Z0oR20gA-1
X-Mimecast-MFC-AGG-ID: jXkA-4BPMlCNA-Z0oR20gA_1754511691
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-458bb0e68c6so1320405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 13:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754511691; x=1755116491;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lq3p/AP2ehM2TE8laSRpSoByadMgmXpnPOPj4urYp8A=;
        b=aWQ2uIw1MlOFhiTnIgf0wrwEa+M68emtIAFZMb5eFKGzEnSzcHyi7CefbBLURs0J3/
         CkT+Q8wL6N03Kc6xG8TE1I5Kf3syjFfodW/Nxpqz+qUx7ME/KtjsK/CXHHBTnCfxcJaf
         DENYoKFiiCBhXs9hUyNZEaLplsfFacOtaKIHODyJWaJ1MHf7Q6nlZNKYSV7i1owIDb8c
         +SR7do6DYT7I/V683kkmsRUKtYPWBDw3irCaJNEdVAY6oSkiijjsnEOC4BSyfSmy3B9k
         gYVnvaYar6bm/+WunkxZqtWa9ZsNj/rmY7uZEedt1kywuerxwSDax5bEca1WwI2PQ5Zz
         FGHA==
X-Forwarded-Encrypted: i=1; AJvYcCX244bzYsg0eTEBJRpe7kUpUAiErJeLzTj4dJUmeVgko5gB4D+tzhqHaKx4VLthsDwGg2qXk3Sr9LkcVqUtdbeT@lists.infradead.org
X-Gm-Message-State: AOJu0YyNtKv9grpbcPypblPdTVUeCy0DQkUECLy6Jh5T55AH1eCxKDO6
	CeiCsvFEipe/JCj0EBchVuCBdwiH6MxN7N5CfqV40EiQfplvO7MNR76SyoHMMLN4KB5etJMs1vT
	hZwvCIXMmte8pGkT2TSXhGAZfc3irE2jdqP+GzRmWuXtt33ev8c3wrip+30DD5EZjqbhQpjx80R
	0H
X-Gm-Gg: ASbGncs2nfZm76P4a/9q7NcmUhJXwXEURLufTEe6oiKGSdSNpLJpc29Kq/nvct7CB5Q
	1Meya8qgGfNqulVWp71+ze6riq5Swr/80Qfg1SO/lOL9mKRHI3HPf+dWFT1gmT/OyXntCPs8zJw
	rvDxspJWbxgm6MpYZZ3KjAkqJ7MFLlpvKIb7rBJ5l0KaT5Tx+KvFUbObBnvQN9hZ9SZYdfqzq1Z
	40iugtxgP8T509Ot/GnXNuyQALcoAn8HzeY5jPdY9zAOwE/HEx03Bu3Du3tTPStRNYkZKH6XSC6
	79CDe2Qx8d3cR3rQKse/BAjPvfIjfWf63Hgj6QsVGwt5HNlPTjQ+X/c6zWDtHFacrLhzK8AsesL
	zKeZjBI2tSNR3kPJRKiPqf2eLfLBrtA3169LnVHXtJ+CDxrn4xL821Rxlb5f1vpggu44=
X-Received: by 2002:a05:600c:46c8:b0:456:3b21:ad1e with SMTP id 5b1f17b1804b1-459e748fbafmr42832605e9.17.1754511690824;
        Wed, 06 Aug 2025 13:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz9L54Y8dv3ZQQQ5zpImfkqY1bGBCy7DJowT7QpPPwDnagA1P2KPKg47yvDFrtnPzdqTms+A==
X-Received: by 2002:a05:600c:46c8:b0:456:3b21:ad1e with SMTP id 5b1f17b1804b1-459e748fbafmr42832425e9.17.1754511690266;
        Wed, 06 Aug 2025 13:21:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f42:da00:badf:cc55:23d5:1679? (p200300d82f42da00badfcc5523d51679.dip0.t-ipconnect.de. [2003:d8:2f42:da00:badf:cc55:23d5:1679])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458bbf91b69sm106335825e9.3.2025.08.06.13.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 13:21:29 -0700 (PDT)
Message-ID: <0de8d37e-5977-43f4-8e21-0ad47130d62f@redhat.com>
Date: Wed, 6 Aug 2025 22:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-hotfixes-unstable] mm: Pass page directly instead of
 using folio_page
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com,
 syzbot+57bcc752f0df8bb1365c@syzkaller.appspotmail.com
References: <20250806145611.3962-1-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250806145611.3962-1-dev.jain@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8CyB2A20hw5lmlZpUU5ETAnHI6yLGmuPQ-cWmW6WHLw_1754511691
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_132134_589384_C0999F47 
X-CRM114-Status: GOOD (  12.41  )
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

On 06.08.25 16:56, Dev Jain wrote:
> In commit_anon_folio_batch(), we iterate over all pages pointed to by the
> PTE batch. Therefore we need to know the first page of the batch;
> currently we derive that via folio_page(folio, 0), but, that takes us
> to the first (head) page of the folio instead - our PTE batch may lie
> in the middle of the folio, leading to incorrectness.
> 
> Bite the bullet and throw away the micro-optimization of reusing the
> folio in favour of code simplicity.

Huh? We are still reusing the folio. There is a single 
vm_normal_page()+page_folio() lookup in that code.

Maybe what you meant is "Simplify the code by moving the folio lookup 
out of prot_numa_skip() such that we only have a single page+folio lookup."

> Derive the page and the folio in
> change_pte_range, and pass the page too to commit_anon_folio_batch to
> fix the aforementioned issue.
> 
> Reported-by: syzbot+57bcc752f0df8bb1365c@syzkaller.appspotmail.com
> Fixes: cac1db8c3aad ("mm: optimize mprotect() by PTE batching")

Fell free to add a

Debugged-by: David Hildenbrand <david@redhat.com>

> Signed-off-by: Dev Jain <dev.jain@arm.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


