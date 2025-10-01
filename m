Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31BFCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3+EPaDu3mTLXOJJXfkxKlMbmHF7t6CqJIFRWvGx0uE=; b=If6i6cIh7N2+k3o9BM0om9LtTK
	hbRizeHYeUV7tNo6u+K81WndumCcTLRAIb7TiJfOfDA6Q2zvo02e+iLIXgNRC5sRSfYOI0cMMtgJs
	KSm2i1LebvFF91tPFy/3ZJU5E4sW8YliUWXo2zqa4tuFPhJUe1lE/+UO+GWx3wXBcsJe1LQANsgXi
	w95uGcEC/b3LUz1VUbczAbt/ojNStVSTJdZIOMJTsJhA85KUCXKuz5cQ525IRJOYCvnANz6TRUWA6
	pf/6EFWxSm6KNWzUE6B8K0DDxQGibN6s4IqzI02oQyByX1VSmfHJtEGA2n8cMxYL2pXW62ssDSVwV
	EkVL9X+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sFw-000000072Ah-35c3;
	Wed, 01 Oct 2025 08:32:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sFt-0000000729u-1iwM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 08:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759307528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=x3+EPaDu3mTLXOJJXfkxKlMbmHF7t6CqJIFRWvGx0uE=;
	b=gUnUx0rzTqbAaetUWsuaCoCBT1AyeciHpuX88ZF+ZBFw6SUFVTeU8nzSAAxhOqgE7gjkGD
	GT6goAHzQiMGB9YBBjUqvC3FyswanNs16rd39YMp7g6IulSHs+/Ad1EBRhMoBMe4Xf/Ruj
	MSMitYzCGxrUivPILJHwElJ3sYXhVIE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-jli47KvvN3aPDqIiTY1AmQ-1; Wed, 01 Oct 2025 04:32:07 -0400
X-MC-Unique: jli47KvvN3aPDqIiTY1AmQ-1
X-Mimecast-MFC-AGG-ID: jli47KvvN3aPDqIiTY1AmQ_1759307526
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ece0cb7c9cso5650813f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 01:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307526; x=1759912326;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3+EPaDu3mTLXOJJXfkxKlMbmHF7t6CqJIFRWvGx0uE=;
        b=CNZpj9VV6fpoop3MLjpT7jfIfY235WmA0MEMmZSvf+XCisMQuVjBIXBZpTvxVEps2G
         wCD9BqyZ71no7rP6x9JNqAKWE677xnWpsj9y+KU/QuFhuOBnKpH/f2le0YO5N7ei1HPU
         DEIv5+2DT2E6DzlZ3ZDBB9HWI2DpIhhK7lBFEtYYGB9zkGtAgI1sfyphtpATsnbjjwb2
         w6GSfkO27n3nZHHuoSz5wwx/A6HRi0K1eI+0Hd5o+5QXzMmrXQPQ60zxNi/SDkViXg2f
         ChDheAp3y89svkiyxzQYTQE7nHlttxgxy+GqJ8Kxd3AaWp6aTbGoEK1drP9Qsbxbv1c7
         8yOw==
X-Forwarded-Encrypted: i=1; AJvYcCUzOJvrwAcBu6FOvrTrc+j6yp5sGfwnF1pWzFIpUXWNDUo6mdKX3up5pnVJ/+ag3/10Rrn6gKEXoJW4WIT+hnKa@lists.infradead.org
X-Gm-Message-State: AOJu0YxO5Pisadp6CBv1OaZWeL0fY0T4DwvZDLEJJUGI8JzKl/LEq2nN
	C7WNEW2tQNDGqXthDWt86THBuySAsZs13Er9Qd8KEJb6QYRss9IcXVPYTH3TlEozyhzvQ2cxsKI
	uHtVywXkLJQce0AFvESvb0SXcXITM+OB809gjfDcsxhQzTwaWXnhXHWBYlRBHEclkZxzASXd4yz
	O5
X-Gm-Gg: ASbGncv/qBG7B3Yq6cgBlvZuquWYWu9g8BS8Fj1N9DFgR3zdjDni4dCe8LXS0xuaOPy
	i8aIOqomIZ7OJCyvKaf7MGkkEPzkcTx0VEjXR4mZxvLNBzH3wbKlceasR0em2v/NLZAeW4SaNTx
	g8QZF/k0Ci0jO9avzI7+ta4r4N9mOXSQAULw8xNXLW/Po4h4CXEvLMMxV98OnqfVhoSLWicKNj/
	1MJzR9EXEM9wI5HczLSM91QqPWS4pkTi4ttZdeYP/YpHEeLKSd+6HOaqlyBoScC8LLW0HbrVSNT
	/EjMJAvL+VrInYTKbkj/sKY9UmBHujhNn0IvIGcecR3H9Cp1DuZ+A/SHX0foJNfm9hT5fefbdlP
	ELpKffmhz
X-Received: by 2002:a5d:5f53:0:b0:3e8:b4cb:c3dc with SMTP id ffacd0b85a97d-425577ee13dmr2185338f8f.3.1759307525627;
        Wed, 01 Oct 2025 01:32:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEamlFHKk0lW4qrWPYCPK/rhtvhoE8+VAFZFxpeTixsTjPGZGBvNgnUReYlehmrWW+5PQy6XQ==
X-Received: by 2002:a5d:5f53:0:b0:3e8:b4cb:c3dc with SMTP id ffacd0b85a97d-425577ee13dmr2185305f8f.3.1759307525126;
        Wed, 01 Oct 2025 01:32:05 -0700 (PDT)
Received: from [192.168.3.141] (tmo-080-144.customers.d1-online.com. [80.187.80.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5602dc2sm25902920f8f.32.2025.10.01.01.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:32:04 -0700 (PDT)
Message-ID: <819891f6-4e30-470c-b641-350a14b395a2@redhat.com>
Date: Wed, 1 Oct 2025 10:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] mm: hugetlb: avoid soft lockup when mprotect to large
 memory area
To: Dev Jain <dev.jain@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
 muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
 carl@os.amperecomputing.com, cl@gentwo.org
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250929202402.1663290-1-yang@os.amperecomputing.com>
 <cc40d827-3b98-4e15-ad45-5c2033e4ce20@arm.com>
 <6cde8290-3aa2-411c-bf29-eb91a99e33a5@os.amperecomputing.com>
 <746c4dd3-2285-4353-9e15-a0a2fbd4e6b5@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <746c4dd3-2285-4353-9e15-a0a2fbd4e6b5@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mksfNTk-XFEagSQ3VSWQ1_PIj1dWEtop779XuurJklA_1759307526
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_013209_524474_67C54F0D 
X-CRM114-Status: GOOD (  23.72  )
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

On 01.10.25 06:23, Dev Jain wrote:
> 
> On 30/09/25 11:38 pm, Yang Shi wrote:
>>
>>
>> On 9/29/25 10:26 PM, Dev Jain wrote:
>>>
>>> On 30/09/25 1:54 am, Yang Shi wrote:
>>>> When calling mprotect() to a large hugetlb memory area in our
>>>> customer's
>>>> workload (~300GB hugetlb memory), soft lockup was observed:
>>>>
>>>> watchdog: BUG: soft lockup - CPU#98 stuck for 23s! [t2_new_sysv:126916]
>>>>
>>>> CPU: 98 PID: 126916 Comm: t2_new_sysv Kdump: loaded Not tainted
>>>> 6.17-rc7
>>>> Hardware name: GIGACOMPUTING R2A3-T40-AAV1/Jefferson CIO, BIOS
>>>> 5.4.4.1 07/15/2025
>>>> pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>> pc : mte_clear_page_tags+0x14/0x24
>>>> lr : mte_sync_tags+0x1c0/0x240
>>>> sp : ffff80003150bb80
>>>> x29: ffff80003150bb80 x28: ffff00739e9705a8 x27: 0000ffd2d6a00000
>>>> x26: 0000ff8e4bc00000 x25: 00e80046cde00f45 x24: 0000000000022458
>>>> x23: 0000000000000000 x22: 0000000000000004 x21: 000000011b380000
>>>> x20: ffff000000000000 x19: 000000011b379f40 x18: 0000000000000000
>>>> x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
>>>> x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>>>> x11: 0000000000000000 x10: 0000000000000000 x9 : ffffc875e0aa5e2c
>>>> x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
>>>> x5 : fffffc01ce7a5c00 x4 : 00000000046cde00 x3 : fffffc0000000000
>>>> x2 : 0000000000000004 x1 : 0000000000000040 x0 : ffff0046cde7c000
>>>>
>>>> Call trace:
>>>>     mte_clear_page_tags+0x14/0x24
>>>>     set_huge_pte_at+0x25c/0x280
>>>>     hugetlb_change_protection+0x220/0x430
>>>>     change_protection+0x5c/0x8c
>>>>     mprotect_fixup+0x10c/0x294
>>>>     do_mprotect_pkey.constprop.0+0x2e0/0x3d4
>>>>     __arm64_sys_mprotect+0x24/0x44
>>>>     invoke_syscall+0x50/0x160
>>>>     el0_svc_common+0x48/0x144
>>>>     do_el0_svc+0x30/0xe0
>>>>     el0_svc+0x30/0xf0
>>>>     el0t_64_sync_handler+0xc4/0x148
>>>>     el0t_64_sync+0x1a4/0x1a8
>>>>
>>>> Soft lockup is not triggered with THP or base page because there is
>>>> cond_resched() called for each PMD size.
>>>>
>>>> Although the soft lockup was triggered by MTE, it should be not MTE
>>>> specific. The other processing which takes long time in the loop may
>>>> trigger soft lockup too.
>>>>
>>>> So add cond_resched() for hugetlb to avoid soft lockup.
>>>>
>>>> Fixes: 8f860591ffb2 ("[PATCH] Enable mprotect on huge pages")
>>>> Tested-by: Carl Worth <carl@os.amperecomputing.com>
>>>> Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>
>>>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>> Acked-by: Oscar Salvador <osalvador@suse.de>
>>>> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>>>> ---
>>>> v2: - Made the subject and commit message less MTE specific and fixed
>>>>         the fixes tag.
>>>>       - Collected all R-bs and A-bs.
>>>>
>>>>    mm/hugetlb.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>> index cb5c4e79e0b8..fe6606d91b31 100644
>>>> --- a/mm/hugetlb.c
>>>> +++ b/mm/hugetlb.c
>>>> @@ -7242,6 +7242,8 @@ long hugetlb_change_protection(struct
>>>> vm_area_struct *vma,
>>>>                            psize);
>>>>            }
>>>>            spin_unlock(ptl);
>>>> +
>>>> +        cond_resched();
>>>>        }
>>>>        /*
>>>>         * Must flush TLB before releasing i_mmap_rwsem: x86's
>>>> huge_pmd_unshare
>>>
>>> Reviewed-by: Dev Jain <dev.jain@arm.com>
>>
>> Thank you.
>>
>>>
>>> Does it make sense to also do cond_resched() in the
>>> huge_pmd_unshare() branch?
>>> That also amounts to clearing a page. And I can see for example,
>>> zap_huge_pmd()
>>> and change_huge_pmd() consume a cond_resched().
>>
>> Thanks for raising this. I did think about it. But I didn't convince
>> myself because shared pmd should be not that common IMHO (If I'm
>> wrong, please feel free to correct me). At least PMD can't be shared
>> if the memory is tagged IIRC. So I'd like to keep the patch minimal
>> for now and defer adding cond_resched() until it is hit by some real
>> life workload.
> 
> If we have large swathes of hugetlb memory like in your workload, and it
> is MAP_SHARED, then there should be high chances of sharing the PMD.
> Although, I incorrectly
> 
> observed that we are clearing a page there - we are only clearing the
> pud entry which is 8 bytes. So yes a soft lockup should be highly
> unlikely. But since cond_resched()
> 
> is cheap (I assume this is the case since it is liberally sprinkled all
> over the codebase) I think we should be consistent. Probably not an
> immediate concern and not a matter

Right, that's one of the cases where we might just want to wait either 
until is is reported or until hugetlb is finally removed in a couple of 
decades ;)

-- 
Cheers

David / dhildenb


