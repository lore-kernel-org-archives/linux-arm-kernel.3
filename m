Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A267CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 12:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkqQTWDiFQG/rhmW5z9gOyGt97QuPR5S/ZSPPEuBM80=; b=nVKLFp2IBGOj9bQ8LJVjMdkOom
	TlCwT/sTnE8xSyimoPdrg3/zdptCItc9y9rOqeetGBLhqVAo+lbp4LMzEJ2Jcc3wv+Bvq60lx3bcy
	bkwdqk4R4eguVMzGjmbLtz4jel98P1bG7M1lpzHkT+HjrF/amiA5TtlEMzETvH9lkTJMCyskn0iXu
	vcAcp3YHzGvGyHzXdNSatp+T5LmbhDgjZ0XU/B4z2p70ueMOGLzUHdOyyZJ/d4cKVQBLTRqrU/Kt+
	mZNdus6bDGNlcdt34rjdo/PtfTjhoLBw4oqjXxxU+LRl1HpRBLAGiIfV5S207+Y3TQXm5jTa11kfB
	4enLWLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90Xl-00000001Xim-0DTs;
	Wed, 15 Oct 2025 12:23:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90Xi-00000001XiP-2HOS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 12:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760531025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZkqQTWDiFQG/rhmW5z9gOyGt97QuPR5S/ZSPPEuBM80=;
	b=fTWqUzG5Gcn0xi+fRKT7bqie5RvmHCc4c94nlidJsXVzfJjFyg6XeKtlJuIJdhAdOin//3
	3W/I/JvIaVX2ZtcsBWhr5LV8dA+2wguAYHU/FXNxKWWo30gDA97eYoeZLWgF4uUgqKL7pz
	QDXcO9VVacDn0Xr8GItz3xxZATlPLT0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-qY5hwNnOPQ-spXz84s9MrQ-1; Wed, 15 Oct 2025 08:23:44 -0400
X-MC-Unique: qY5hwNnOPQ-spXz84s9MrQ-1
X-Mimecast-MFC-AGG-ID: qY5hwNnOPQ-spXz84s9MrQ_1760531023
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-336b9f3b5b0so12872236a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 05:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760531023; x=1761135823;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkqQTWDiFQG/rhmW5z9gOyGt97QuPR5S/ZSPPEuBM80=;
        b=YZ4UHIJwl+1mw2LJwYoWexpvQ2XI2ivw9gY6qW/btMHIxEnfrSV31y8rPg+tqWmpY8
         +cvxUzPU9t3qOLdhIws2OtTAW5MPPJ0rxZRsIbecYPy2yuGqOWQAwUtnigWq70Abttw8
         H8wjvkK3BCBk8EieIjso0bk8BM9OUJTWqHa3qkVwcjqr1gwtUjPWHuQqW9PfTH3VcK3l
         pGbOEsOWt0haHlUhQxnOp/pgV/xY12JdA6Rgbx/dSUYGWVW/ma1PSHa1xXx9GTTsYHrb
         6+Auw6toeJZg5btKKIlt4kWIht+GAkLOboj/SJHjux0sBCJwSAXhk/jDeT9tBQ5NVBHI
         4GCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8w4P7iGxZC6P/vRAsnioQT3nXf/rPFNFpONnm91ZufFRBzf6Pi140VT49xVJAUY+kGC+zY2X/gjm7cD5daxcL@lists.infradead.org
X-Gm-Message-State: AOJu0YwduuZdPOVgSufY63HRQxy8GUq9L9eUoqicaYuKfCNpijOxBvul
	BTb3gJWFsx8gpzUSFOK+ZUCjSMJMh94KuDWDeRbunl/0qYjJyO4dcQthfB8BGgB9foaqDaC1rS8
	M01D+PZbZXfynuxI7pkw2jwfge9j3m/6Mbk91vcFroVSUaKVQXtuV8INqRFC0QB4csYGCFMZcww
	QM
X-Gm-Gg: ASbGncuIgWZdAq6u20M6uP1P/fKDKfMfJvZJxhACT+h4SnPqDpkkCpbz+DVn0MOzF+Q
	+FAKa7J0E4zzs2wOIDzvxnHwpudbpIOhVDz411w2Mvyk1MP/tMcA6oJiLhF3TXNjRmiJ2+aoE6M
	R2nIcgn0KFuwqtpRiDfJ/XwHvJP3O7O2oT3UQfWnJD6UuaunCfhysFtASF84vri3reQf8jlDPNj
	9fcmekDEmJqlgouOCMIISAVN7JfnVlSjVLa2vO1zwgH9sDw3I6/LDlpEuoWn0qwnTy/TA5+Xlu+
	+gLZ3MIRZxd57/iOzXBfR8tIdNMwTfao/9cxIVgWxGbBGxg251LnUWonyIIHijQ=
X-Received: by 2002:a17:90b:4c4a:b0:335:228c:6f1f with SMTP id 98e67ed59e1d1-33b51168de3mr43078752a91.12.1760531022989;
        Wed, 15 Oct 2025 05:23:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHphda3lGGfkiLRoBnQzpvHA4Ky6Irwuv735W3mQQQTqQIM8ZJIPop8Z5JRhjHaRWbxoi3uKA==
X-Received: by 2002:a17:90b:4c4a:b0:335:228c:6f1f with SMTP id 98e67ed59e1d1-33b51168de3mr43078717a91.12.1760531022428;
        Wed, 15 Oct 2025 05:23:42 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df2360dsm15222181a12.25.2025.10.15.05.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 05:23:41 -0700 (PDT)
Message-ID: <b479a6af-1e13-41da-82b7-d4c17e9034dd@redhat.com>
Date: Wed, 15 Oct 2025 14:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -v2 1/2] mm: add spurious fault fixing support for huge
 pmd
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Yin Fengwei <fengwei_yin@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
 <20251013092038.6963-2-ying.huang@linux.alibaba.com>
 <4c453dcc-2837-4f1a-905b-3462270f5e31@lucifer.local>
 <87ldlcpnbx.fsf@DESKTOP-5N7EMDA>
 <d748bc6b-2aff-4cee-a233-008f4d2555fa@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <d748bc6b-2aff-4cee-a233-008f4d2555fa@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tjRjkLyiw-icmHrnIkmbO8Q_ZLytQZEMjYLzBTcmiss_1760531023
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_052346_675669_F1018333 
X-CRM114-Status: UNSURE (   8.08  )
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


>>
>>>>
>>>>   	_pmd = pmd_mkyoung(*pmd);
>>>>   	if (write)
>>>>   		_pmd = pmd_mkdirty(_pmd);
>>>> -	if (pmdp_set_access_flags(vma, addr & HPAGE_PMD_MASK,
>>>> -				  pmd, _pmd, write))
>>>> +	changed = pmdp_set_access_flags(vma, addr & HPAGE_PMD_MASK,
>>>> +					pmd, _pmd, write);
>>>> +	if (changed)
>>>>   		update_mmu_cache_pmd(vma, addr, pmd);
>>>
>>> We can make this simpler, e.g.:
>>>
>>> 	if (pmdp_set_access_flags(vma, addr & HPAGE_PMD_MASK,
>>> 				  pmd, entry, write)) {
>>> 		update_mmu_cache_pmd(vma, addr, pmd);
>>> 		return true;
>>> 	}
>>>
>>> 	return false;
>>
>> No problem.  As long as David is OK with this.
> 
> Sure I don't think he'd have an issue with it but he can raise it if so :)

Absolutely fine :)

-- 
Cheers

David / dhildenb


