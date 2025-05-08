Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6BFC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOjfC+LN17usEmwgstDmlQ8TxIaIPGoVKa8pXSXr8JI=; b=kDvqA4Bp3GHqcp0kgk/5fjGIua
	VVqOpoQWQVnwvuVqb+G17t0JPat/1X2CY8ac7A5EPCCgiWI25GL7QAQuC9pTUE7GK0UGh+3G4k1bO
	iTBNjL53aFIzN+sahY2uF4/3qQ0Qo1pCvi4kmS5RwVlqUCh4062dAm2jCuPaczYJWc6Fw6e812VI0
	2J9R1/3lX9mNPL5OzQXJIv2g5S/NqTYxDvntzAiUf1tFTs/SWiDPzkhFXitHeHrby/vyKu5UaT/CW
	Q9la5MIKyvUKUxAaO6B9qU2jAtcJ3KExmqGrhZrpM0a+viw4+CAeOzzBzIJ4D+owoBmZmunvTMkNc
	1NQpNsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxe3-00000000GoJ-0k3o;
	Thu, 08 May 2025 09:34:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCx3L-00000000BZ1-0JhU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 08:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746694586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOjfC+LN17usEmwgstDmlQ8TxIaIPGoVKa8pXSXr8JI=;
	b=dgOLVq9WJvB+mLSpXl77EVsxy7g/xn+N+LSEUiuy2gPiKIqkRW4ecQs9hsux6mcPZkUuK7
	Y22PaSb8uMdbXf/swYeRYcoU5Xv9jvCPVHwnLr+idRIHq0mepfAWeBKNOpH8PS6Mv8mnjG
	Zp5Vz8RnnExX9WIPEtP5m8Hv5Ee89Q4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-ajHa8Eg8MH-Pe5v5yaySHg-1; Thu, 08 May 2025 04:56:24 -0400
X-MC-Unique: ajHa8Eg8MH-Pe5v5yaySHg-1
X-Mimecast-MFC-AGG-ID: ajHa8Eg8MH-Pe5v5yaySHg_1746694583
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-224347aef79so11168195ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 01:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746694583; x=1747299383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aOjfC+LN17usEmwgstDmlQ8TxIaIPGoVKa8pXSXr8JI=;
        b=wrYsvUNQLVkm7IKelpr6bIYpBWsXKo0EN2AernLjOHsCcHCDP7UBcUDTN3UAXc97M7
         dLyD06DyQNkyuOzof3gZIjeZJ3aflphPXaNbe91osBG9CVJLJpBnjc6++Emjist2u6Zi
         lVG0Zg/Pxz1Q354rk2QnrfREIKudQ/a82orrJfxGHQJx8EBdYZLmepabqIiRvA0Io29a
         Hwjs7R8yp4JhGcYBIvVGas3pVSC8NGdhpPFRK0E+hxOJ6Dugw1AQQXKDMIIG0ZXNXgmQ
         lm+nUXxpU3kVz+1QNDtxACZJ83unsyjb5ckpQEG+k9+Zr94HGjWxVK7URrwOclezRWx1
         uwmg==
X-Forwarded-Encrypted: i=1; AJvYcCXmkJM1l0+yq9lcRs2tS8yJi1uV1GdVujF89vp0GEn/LMP4vrpAolRivQ3bs+Xggac0HHrS4X1tGJHN1hgF1a4J@lists.infradead.org
X-Gm-Message-State: AOJu0YxRme93gsH90bq0SUp6VkRqaVPl9BBP7eW9gCBcEvtM/EoHFx2I
	cgyFhmoec0fg+cQLPUz0pi9kYktdx8C/tBXmAt2Ktc8z2CX12Q3outomHtI2JkkcSKo6VY6msqV
	xCwiiurgHqC939nHlEeaxLmRN7iS0r5+6dWW/VK0PBPUq+dNNY71wauZG/ZyL88aBWwhuMTTJ
X-Gm-Gg: ASbGncsYtJY6G6Ngbqk7b673dtUM+0l6e/64n59Ob1lkpcfRiwLHMWDZYD7XdPucAKj
	wzIScAEcsRYPM9K3BGLsfzB59T+pVjbvdwl5mnWYdK3pcb+FduoT+6WkuzGrFXGxJ0tbiNjvucg
	BgMlqpqUZL7mSmINw8DJj3LNzpGeVdxTmJqAxWOX33nmY4z+pQvM09beRBviCDlfqAJyvmHdCVn
	iza5HljJDfpHIJnqVlZMVW9ppk4ynLXropId8qOyQitotx3N9BuGjoK3kIDNC1zGwTX5tw/YMTX
	GCZ8l5jq/k2O
X-Received: by 2002:a17:903:1744:b0:22f:a921:db4a with SMTP id d9443c01a7336-22fa921db82mr16679315ad.45.1746694583383;
        Thu, 08 May 2025 01:56:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHir1BGYfGeGr2WBHGYd/bWypOVZuEVrtE9+DRdnIGOsBpFbbagNrFbeU80omop6cm+laFLtg==
X-Received: by 2002:a17:903:1744:b0:22f:a921:db4a with SMTP id d9443c01a7336-22fa921db82mr16679075ad.45.1746694583097;
        Thu, 08 May 2025 01:56:23 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15232718sm107628285ad.230.2025.05.08.01.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 01:56:22 -0700 (PDT)
Message-ID: <fdeff5e5-daab-4967-a6bf-f71efd78507c@redhat.com>
Date: Thu, 8 May 2025 18:56:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Drop duplicate check in pmd_trans_huge()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 ryan.roberts@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 yangyicong@hisilicon.com, shan.gavin@gmail.com
References: <20250508035142.189726-1-gshan@redhat.com>
 <4e5941f8-7e61-4a63-a669-bee1601093a6@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <4e5941f8-7e61-4a63-a669-bee1601093a6@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uddsXD1Dc9X5tXfhKjhdfDLtArPsrSe7ApolzPLzIcA_1746694583
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_015627_195611_C902C73F 
X-CRM114-Status: GOOD (  20.30  )
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

On 5/8/25 3:44 PM, Anshuman Khandual wrote:
> On 5/8/25 09:21, Gavin Shan wrote:
>> pmd_val(pmd) is inclusive to pmd_present(pmd) since the PMD entry
>> value isn't zero when pmd_present() returns true. Just drop the
>> duplicate check done by pmd_val(pmd).
> 
> Agreed, pmd_val() is redundant here because a positive pmd_present()
> also ensures a positive pmd_val().
> 
> #define pmd_present(pmd) pte_present(pmd_pte(pmd))
> #define pte_present(pte) (pte_valid(pte) || pte_present_invalid(pte))
> 
> #define pte_valid(pte)           (!!(pte_val(pte) & PTE_VALID))
> #define pte_present_invalid(pte) ((pte_val(pte) & (PTE_VALID |
> 				  PTE_PRESENT_INVALID)) == PTE_PRESENT_INVALID)
> 
> pte_present() cannot return positive here unless either of the flags
> PTE_VALID or PTE_PRESENT_INVALID is set which implies pte_val() would
> also return positive.
> 
> Probably it would be better to add the above details in the commit
> message here as well.
> 

Thanks, I've squashed those details to v2, which was just posted.

> The earlier commit skipped dropping pmd_val() in order to keep then
> proposed change confined to just adding new pmd_table() check, even
> though pmd_val() redundancy was evident as well which should have
> been dropped there after.
> 
> d1770e909898 ("arm64/mm: Check pmd_table() in pmd_trans_huge()")
> 

Yes, agreed.

>>
>> No functional changes intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>> Found this by code inspection
>> ---
>>   arch/arm64/include/asm/pgtable.h | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index d3b538be1500..2599b9b8666f 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -739,8 +739,7 @@ static inline int pmd_trans_huge(pmd_t pmd)
>>   	 * If pmd is present-invalid, pmd_table() won't detect it
>>   	 * as a table, so force the valid bit for the comparison.
>>   	 */
>> -	return pmd_val(pmd) && pmd_present(pmd) &&
>> -	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
>> +	return pmd_present(pmd) && !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
>>   }
>>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 

Thanks,
Gavin


