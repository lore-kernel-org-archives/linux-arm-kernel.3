Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014DDC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 11:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uC2wfcZ+7znS/AJhcy/t0D4M8EVdcWLk8ajPU4mVK2Q=; b=TXmzlJa+O4mWc26sLRdlCosz/T
	apZFF/kO/m/otVsizFUUVhuO+wLo0sGYRm9orAFk2uSeyQP+c8ZqFgkAnNF2ueMfj/StFlpnmhdk+
	W8q2bvuNgK1m+4gLqvThmVG1lZogr/Mtz/p0E8esGwTsdQjsUUfmH80J46AMKN7GkX5VCtReqt+mN
	Cobu8ioWpMzpr/gPv0P2/KbJnlFAdrfGqjlxj/lhOsof1ciJCZ3QOXL1V1gJLyijyHitTO21SdXhw
	Y/3/v3akg41L1A9H1QCkg+proi+Q3TGTdFe/RVyRWuZB5H/yVgkHeu2XoKPLMHGNibFVOoHP+CR6k
	JVtnTEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzJK-00000000Tl4-0OcR;
	Thu, 08 May 2025 11:21:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzHM-00000000TWH-2VrI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 11:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746703143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uC2wfcZ+7znS/AJhcy/t0D4M8EVdcWLk8ajPU4mVK2Q=;
	b=ZcobzE2/urokKnKvgcV6s/DuiiB9tB1/bLdZzVWeegNL5EAxCw9j3GwJLQ3h+ke7+XGIzG
	yrCAuVpEigypwHBCRvmt0Mm00f0A13ij95Vpdj9/UxI/7qCu+/W+qhCQnPYCPVGtdp7ghq
	BZWoZkCBxAOo8c2HQr5jbGyeBh/56Yw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-WV3OzkPiODGWOO-PNETdAw-1; Thu, 08 May 2025 07:19:02 -0400
X-MC-Unique: WV3OzkPiODGWOO-PNETdAw-1
X-Mimecast-MFC-AGG-ID: WV3OzkPiODGWOO-PNETdAw_1746703141
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2002bcaa55so242077a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 04:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746703141; x=1747307941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uC2wfcZ+7znS/AJhcy/t0D4M8EVdcWLk8ajPU4mVK2Q=;
        b=OAU2/jDypllcENQewR0oWN0vZRurjvB9/zAu2KvxKTgcuGin3hmz9jRdXPtjGha2KS
         qsXujhqQaAOV0zk7kvNZavHN7C/lF1ztduMK+IAC92Xlbr1bIpa7+UdWzDKJzXsN/JBS
         zKndYh8N363Cha3oqUCPl9pD6X8ksACstqHAJtM09wuLIy68BgKnK/6ErJ8oOkTOoU2o
         KIABWQ89RSzvewxHY6hTEyY4VvUEoTyfaLEoDSdNYWifpRVS8NjYsXw7IANkSw/6I3/S
         jMLTUbOnEK3HT+uVsjI4NPf9l/2H3hRuLcy2fW2kzjsciEn7fOX6lgZdemLSXv2e2Rvx
         onDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCG3RPfQWSjD+fkdqsILpOoP17oZHYshk9rcKJVGITiOscAAFt6eiVsSPqaC8g/05iP3vGiaRDDIf9HMQPzIyj@lists.infradead.org
X-Gm-Message-State: AOJu0YyL+MPwFLmwtGNc4lPvH4FwoRBiLIk9bbInXotM5No3aTzZmK9n
	TDNjQcLnfR9r54olIYFpOXWrF7XB/Rh5PUSoDsIBAJF1iiyPd5kIrfj1wq2q/Cc450SABEdJ2fs
	yH/JIDSjqKVjBpf56I9IlkM6OgCZfGeXvaBTL1H1XmWmD38umsg6fbDieApyCinnYQY9v3Csd
X-Gm-Gg: ASbGncs/vU8rMkKbWGRruNRrjKWzTcgnihfiUZyfn4m4Iu2PSIXXyuPP+1dWJ0Vb9ZV
	aXAw8HGzpzmF9M+X/WROomVo7QnMptoWL6NFhnnWXlJw0f4ZxS1frCRdK/Xx/ccaPiofpZbSFvE
	ZGQKOS9bJIy4ylFm1tfEW4LmAQmNCYlRmigUyJ5JLtRs7b4AVsOJSx0TkdrfcRhs2IaRdRK1VTu
	ECUvAXE+EXrCVED1/FRugoOXdniJSg26uMCeAzA1RldcfovbKvDvfpfxd6KLCLIDuEGbX07QfVu
	cH56SBt5FRXK
X-Received: by 2002:a17:90b:4c8d:b0:2ff:4e90:3c55 with SMTP id 98e67ed59e1d1-30aac21f4f9mr10874129a91.27.1746703141230;
        Thu, 08 May 2025 04:19:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlcZE8WPSp+dD4cbUIoc4dB042EO4sEN2NlL/2/CjCN2EjuR89jLkJrVSshMTD8QHhwYCLTw==
X-Received: by 2002:a17:90b:4c8d:b0:2ff:4e90:3c55 with SMTP id 98e67ed59e1d1-30aac21f4f9mr10874083a91.27.1746703140804;
        Thu, 08 May 2025 04:19:00 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522fb26sm109771185ad.247.2025.05.08.04.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:19:00 -0700 (PDT)
Message-ID: <8c4c158d-8cbc-479e-8561-de9ce961c9cd@redhat.com>
Date: Thu, 8 May 2025 21:18:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: mm: Drop redundant check in pmd_trans_huge()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 anshuman.khandual@arm.com, dev.jain@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, yangyicong@hisilicon.com, shan.gavin@gmail.com
References: <20250508085251.204282-1-gshan@redhat.com>
 <0c6455f1-5a7b-4ae3-b7f8-7f163b6abc9a@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <0c6455f1-5a7b-4ae3-b7f8-7f163b6abc9a@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZFnCixQ40DWp59L91OqwXLQy_x0kxFGl_JR9bmAuv3Y_1746703141
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_041904_725591_3AD2E46A 
X-CRM114-Status: GOOD (  30.88  )
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

On 5/8/25 7:22 PM, Ryan Roberts wrote:
> On 08/05/2025 09:52, Gavin Shan wrote:
>> pmd_val(pmd) is redundant because a positive pmd_present(pmd) ensures
>> a positive pmd_val(pmd) according to their definitions like below.
>>
>>    #define pmd_val(x)       ((x).pmd)
>>    #define pmd_present(pmd) pte_present(pmd_pte(pmd))
>>    #define pte_present(pte) (pte_valid(pte) || pte_present_invalid(pte))
>>    #define pte_valid(pte)   (!!(pte_val(pte) & PTE_VALID))
>>    #define pte_present_invalid(pte) \
>>            ((pte_val(pte) & (PTE_VALID | PTE_PRESENT_INVALID)) == PTE_PRESENT_INVALID)
>>
>> pte_present() can't be positive unless either of the flag PTE_VALID or
>> PTE_PRESENT_INVALID is set. In this case, pmd_val(pmd) should be positive
>> either.
>>
>> So lets drop the redundant check pmd_val(pmd) and no functional changes
>> intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Dev Jain <dev.jain@arm.com>
>> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> v1: https://lore.kernel.org/linux-arm-kernel/4e5941f8-7e61-4a63-a669-bee1601093a6@arm.com/T/#u
>> v2: Improved commit log per Anshuman
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
> 
> I agree the cleanup is useful and correct, so:
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> 

Thanks.

> 
> But personally I find it maddening that we have:
> 
> #define pmd_table(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
> 				 PMD_TYPE_TABLE)
> #define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
> 				 PMD_TYPE_SECT)
> #define pmd_leaf(pmd)		(pmd_present(pmd) && !pmd_table(pmd))
> 
> static inline int pmd_trans_huge(pmd_t pmd)
> {
> 	/*
> 	 * If pmd is present-invalid, pmd_table() won't detect it
> 	 * as a table, so force the valid bit for the comparison.
> 	 */
> 	return pmd_val(pmd) && pmd_present(pmd) &&
> 	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
> }
> 
> Which all do basically the same thing, but with some very subtle differences.
> 
> Surely we should really only need 2 basic functions; is it a table? is it a
> leaf? Then pmd_sect() and pmd_trans_huge() should just be aliases of pmd_leaf().
> 
> I *think* pmd_sect() and pmd_leaf() are really just 2 different ways of
> expressing the same thing? Which is "Is this a *VALID* leaf?"
> 
> And pmd_trans_huge() is asking "Is this either a *VALID* or *PRESENT_INVALID* leaf?"
> 
> I'm not sure if we can relax pmd_sect()/pmd_leaf() to give the same semantics as
> pmd_trans_huge()? I would guess we can. In which case it would be nice to clean
> this all up to a single implementation and make the others wrappers. Or better
> yet, fix the callers to consistently use pmd_leaf(). And do the same for pud.
> 

Right, pmd_trans_huge() is the superset of pmd_sect() and pmd_leaf(). The later
two macros are equivalent in logic. I had a quick check on the sites where
pmd_sect() and pmd_leaf() are called, there seems no PRESENT_INVALID case. So
I think it would be safe to sync up pmd_leaf() to pmd_trans_huges(), and then
make the later one as an alias to pmd_leaf(). Besides, pmd_sect() needs to be
replaced by pmd_leaf() as you're suggesting.

Hopefully, I don't miss anything before I'm going to prepare the patches, which
will be stacked up on current one. I'm understanding you want something (for
PMD) like below.

----

static inline int pmd_leaf(pmd_t pmd)
{
     /*
      * If pmd is present-invalid, pmd_table() won't detect it
      * as a table, so force the valid bit for the comparison.
      */
     return pmd_present(pmd) && !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
}

#ifdef CONFIG_TRANSPARENT_HUGEPAGE
#define pmd_trans_huge(pmd)	pmd_leaf(pmd)
#endif

With above changes, replace pmd_sect() with pmd_leaf() so that pmd_sect() can be
completely dropped.

Thanks,
Gavin



