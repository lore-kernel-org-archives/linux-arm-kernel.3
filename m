Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BEECCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgmTBazmU3APPPKImmp2BpdY5glVvngR/Z5Kx4m3KiI=; b=LFNXS4PYkM6TBv0eJoVecsAKcj
	RL10ETvejr8ZfticX/qOJ3F2arGT/zS/J1tU/iu/HkRMlUEo7bqHwDU8W41X6x5sgjeADIQIBQ96o
	QYC1NptT0gCmfpKMnIRmYAJh3luK2h4d2xl+NZ40ITFDoY18iHPiQnmZ+fU4DDgDfpFP6BjtQ0Woi
	N0eKmZ9zoGcTg5oAmbEUpDd7EIDM82ElMTMjKswlW4KJRjg0mmCIZu8Kyqd5ZIlzAkSvrzn4Y9fhk
	lEdQIejJr9x9HiSpPdm2REqJkQFpC/BHJ+6xy7m9DkuRVCsvv1kxYdFS4izJVXyNYS9YpUaf/Z+d1
	U2iaZUDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsjG-00000006SsB-0omq;
	Fri, 31 Oct 2025 17:15:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsjC-00000006Sr9-0Fl9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761930949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tgmTBazmU3APPPKImmp2BpdY5glVvngR/Z5Kx4m3KiI=;
	b=fFIGdgPQ3EptZfBCNKkzzxY6YeyY2odVrdi971ulIR+jwtBZzmSPytNUR/WZRkfn5u2mYq
	P+tnVFHacPcBUBhN3iS5UQp0+k5ciO5S8eOk+rrgFAgJnoNKwdxQ3BAmpbCUz3uGn/7VTR
	6VVdnz0TVv8ACXnkjwKunyIFbj3XaDk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-vBSRvKRyNIefi5t-fyuLvg-1; Fri, 31 Oct 2025 13:15:47 -0400
X-MC-Unique: vBSRvKRyNIefi5t-fyuLvg-1
X-Mimecast-MFC-AGG-ID: vBSRvKRyNIefi5t-fyuLvg_1761930946
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ecdb10a612so1917797f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 10:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761930946; x=1762535746;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgmTBazmU3APPPKImmp2BpdY5glVvngR/Z5Kx4m3KiI=;
        b=fvOuSuMJWHS+fuvdqoG6WmTkd8GXRot2fqcQTTMRjfVbJ7yRXn9IKu0GQyItcdzAvo
         y6DMlDeIiE1DJTxFD4xg+GbGYPOnN5YesI/11D9gSGVFU/yATxW3pNFweuYfD1rK2wUw
         JHYHHVquagifPCAo5qyoENaP9K9vmCHIqkn/Mt5B6pDltbPX+6IKGS2ICCItKsFTrNch
         rkLT2lZsyMJJw3HP0xbrtdWH50ApHl4M43iteYeE1mKwoubbq9EyGzvxFFGDiwuJVJyn
         aj93T1k/n7j27qdq/Yy5tx2PZe4vECSmWaErRX2Sbv5JBHHOqLX/gMXqbykzF5H+uXAb
         2DLQ==
X-Gm-Message-State: AOJu0Ywx9VmRFDw7skt58FyeMRM5m5IA3dljBossTEeC/51U6wHi2Mgg
	/VN3kQhRz2bTlzCxbthxEHdWY3Dz54mjgVzAH0tVadTnZPDJ4s2s73Er3UhNwQgpG5rIDaH8zzp
	MIWtr5Drp/mtPxa+6Ohkz9161ccgCSsQw4HOwYCWfWj2AAzI/dF79F+l9CRDT4+vEcxb3YH8yTm
	1xqg0MLcGw
X-Gm-Gg: ASbGncso0pCOJy4giNUI9sl9zo01uEPcPTyT2YSEhLJ+uZHgXfwzDu9ZIS/9oeDg3my
	VOx+w7Pquw1SqVIq2oq8re3Zecr7cSAIf+DWl5S48WWEevIVU9KHJ3hYRrcmF9NUer8Rr3AUpSh
	rvdqycnq9iSNQ676CGuhVIDjyBvENYYjMI4X5Jyn8vzzhDVX0UuY7+sNVR//3US4Pd9K1WD00ow
	Oob4BAvzMfwCs+xGbvXO0kaHJj30o3IT0G3XFGqYX56j1AFsafU2A4bK/2zVBfU0Hkya3zqDWiW
	EJM9oyrfhSSlOWSosSNSXLkdpvG225kzl9N923jdUHjc/xk1xvwbNurVednQMkLd3T83F8sKXTu
	1gBT3UCi07T0MWNbJUEA8VioSfD65X230JUzt4GLR6OFLyEhc698HroUBn7WBqxA9wPkmLe97EH
	gSA5AblA3bkqB3hidWJSjFa8JnWR0=
X-Received: by 2002:a05:6000:2585:b0:428:3cff:3234 with SMTP id ffacd0b85a97d-429bd67e0ddmr3468015f8f.21.1761930946249;
        Fri, 31 Oct 2025 10:15:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfRdCnmdJNsaRWMm6Hvpwfn8ktJOmZbZ2fpl5KdmmxvY0X5gxISTNhc+2EgznD9qOwvAwSBA==
X-Received: by 2002:a05:6000:2585:b0:428:3cff:3234 with SMTP id ffacd0b85a97d-429bd67e0ddmr3467988f8f.21.1761930945762;
        Fri, 31 Oct 2025 10:15:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13eae16sm4529835f8f.32.2025.10.31.10.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 10:15:45 -0700 (PDT)
Message-ID: <7dd84c85-3cb4-48d1-94c2-83e17bf74d34@redhat.com>
Date: Fri, 31 Oct 2025 18:15:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: Initialise the tags of the huge zero
 folio
To: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>
References: <20251031170133.280742-1-catalin.marinas@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251031170133.280742-1-catalin.marinas@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9vAXRl91VvlQJJWU5LyLIcwNuOgz0zADj2TB6uEck-Q_1761930946
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_101554_611861_687EB087 
X-CRM114-Status: GOOD (  13.68  )
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

On 31.10.25 17:57, Catalin Marinas wrote:
> On arm64 with MTE enabled, a page mapped as Normal Tagged (PROT_MTE) in
> user space will need to have its allocation tags initialised. This is
> normally done in the arm64 set_pte_at() after checking the memory
> attributes. Such page is also marked with the PG_mte_tagged flag to
> avoid subsequent clearing. Since this relies on having a struct page,
> pte_special() mappings are ignored.
> 
> Commit d82d09e48219 ("mm/huge_memory: mark PMD mappings of the huge zero
> folio special") maps the huge zero folio special and the arm64
> set_pmd_at() will no longer zero the tags. There is no guarantee that
> the tags are zero, especially if parts of this huge page have been
> previously tagged.
> 
> Allocate the huge zero folio with the __GFP_ZEROTAGS flag. In addition,
> do not warn in the arm64 __access_remote_tags() when reading tags from
> the huge zero page.
> 
> Fixes: d82d09e48219 ("mm/huge_memory: mark PMD mappings of the huge zero folio special")
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Will Deacon <will@kernel.org>

Acked-by: David Hildenbrand <david@redhat.com>

Thanks, Catalin!

-- 
Cheers

David / dhildenb


