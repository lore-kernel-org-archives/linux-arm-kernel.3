Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C043CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 12:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ec0hJUsQTUWsdl6E8s6GRpczB51mwhz+FQUrv1x/BOM=; b=Z+NZ+R/YAJDAsd17AUfE8yiq7I
	+JwNp9lYZKc2+17i6iRmxsLTC5Aix9zWMY70OO/4DzOzpWxgN937p+NjLrlOoh9zRDhgXccnj6zQU
	mIC4/ilinib1D1kepFn6R3hfY77TW85GCoJ7teRzn4EuMnYxODYhZhXjW9MgHrshHgH6DDl+/EXV0
	aZ8DEOGnL7pCcbNP8VjF1fTkaml/LDwgl0eYhUtBcnECCNtCrQn4If+aQJapCbfNGNcEy+gby870R
	acqAviwNz4vMtbJACIBCJt4cAMDsHC68cUeyHiF0LlHf0Ivp6QMmPw+OXWSTXRHN0U9acgxH7jdtc
	4TtCagnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAtN-00000007i4M-0djh;
	Sat, 01 Nov 2025 12:39:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAXQ-00000007T0I-3KWC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 12:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761999415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ec0hJUsQTUWsdl6E8s6GRpczB51mwhz+FQUrv1x/BOM=;
	b=R+pvMkH1HJx6jcVYDDjGzxmmI+Rzb0WGRQj1eYMVv/YnnC5LTIAziPzT52op1s8uSV9VSh
	Oa4JsJWsRbBzIax9SizxsHyVDrfPqZBeXCb2Z9C39SmbpNfbF4AQKv4l3pcuBAx6eY5hlx
	NVwYp4u/QKjunymin8YhjTgTSXveGHQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-E4prWruDPHyUvrvT_vzq7Q-1; Sat, 01 Nov 2025 08:16:54 -0400
X-MC-Unique: E4prWruDPHyUvrvT_vzq7Q-1
X-Mimecast-MFC-AGG-ID: E4prWruDPHyUvrvT_vzq7Q_1761999413
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-429c8d07874so222113f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 05:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761999413; x=1762604213;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ec0hJUsQTUWsdl6E8s6GRpczB51mwhz+FQUrv1x/BOM=;
        b=Ytpt/TS3UiEAnBfZzS82f1ZPKPafYGCaxMH3mlw6YFJRlVPAyaJou6WFO037bSY2Oq
         6Iu7Ng69kWQTH3ZMo7NNihPtYxYnCic6Sx2wiUbYXlz+Ehr3Ra2rAfbN+GxlGbETxGu1
         57df/pXdVLcJWWGKSfQQ8Jw4U0qoFCxJJwu4keRgrnZesvnwqZGBl2XGzgv2PUse/XCo
         74Cg0XByAZ6EkB0DpLIvBFw93At57dGJh4k5rDSPPjiNMcu0HfY4rwJGEf26FxsJfgD3
         5ua5c/SoKD7+gOsVSnXlenDa+PZP47QvhtaJoTEQ6/ev9G99D4VGaeazL4mKMA/6O8d7
         YCSA==
X-Forwarded-Encrypted: i=1; AJvYcCWLZlsGAcaik1zYj6QEE+AxsgTezz1l6bpiX65VOZTHabyY8tF/SNJDkWjwZFkVSTEwwXFMeMgr7QRo011pi0jW@lists.infradead.org
X-Gm-Message-State: AOJu0YwBP3TxHvEnSXZLScHmq7PDQuGpcGfSGrsfgR7k61SLCbnE9uA0
	TCgygsUtavI+Qk4ZmoD2IrWg5GsKI17RZ7X1fgidSa66K8rV3lIDW+XSdRQT8Png3ozVK/GiB8U
	nZ5glYCnj6yIrc9HH4QxnYE08M6KW/gLRv1MADQ8XNlaejBb+hZJBemSBX8nOnSrpuj2kon7fwn
	8K
X-Gm-Gg: ASbGnctLa3kCMWFXC0L+w7HTiIsRY78hTgCOgk085gCKoKnQ9zY3azg2ZGJg3LpDY3O
	CPCTonjyeeKc3HexYcpmSt4va4KiM72plDNT/r34ZI5MRuuG9kJs34cC8ISOyk2wsMpUIi/YFWi
	gRulvSxTIq3vdf1KuO9KJgQJiJXSMTOCRuGUaRHCtjus9M3f/BGhckhG+BGy6oi9UbEfPyhD/iO
	BCH7XBp7FnxfCl0I3BbN70wA8m1i8IXxTRrrWSKbrcNUNLAV28y2AUEHECd/mLe60LG801gDwWr
	Q6YIU7sQycglGCo6H3XdJEQsnH1gyimmALcL+1KywPIVDAomR3cGTK57/OW+GHSk/AR/0eoUK8o
	W4vO9qLpYgszFb9vsmnc7YozgD1gGIX9w9day0dF/zIqTpHTVp+6LI7JEN79qI69cGasK/rIzLg
	OQ9Az4hRmIMUtU8AeAb8/BLQOvDC4=
X-Received: by 2002:a05:6000:2f86:b0:3f0:2ab8:710f with SMTP id ffacd0b85a97d-429bd671cc6mr4920647f8f.8.1761999412959;
        Sat, 01 Nov 2025 05:16:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwyu8iCMznl2jxRh8YLUHJ3p228bh0SCAtFEkItp6biokKqMXHyqxQIX3SdYCS4w5abwUMoA==
X-Received: by 2002:a05:6000:2f86:b0:3f0:2ab8:710f with SMTP id ffacd0b85a97d-429bd671cc6mr4920621f8f.8.1761999412492;
        Sat, 01 Nov 2025 05:16:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c114ca0csm9986764f8f.21.2025.11.01.05.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 05:16:51 -0700 (PDT)
Message-ID: <5368a371-10f5-40ce-9246-d8eeff52e654@redhat.com>
Date: Sat, 1 Nov 2025 13:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-6-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251029100909.3381140-6-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N6n-LLS5yBHrYqTvBuZE3A8cQZJtTJSSjce8uIrYfb0_1761999413
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_051656_922486_A035578E 
X-CRM114-Status: GOOD (  16.86  )
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

On 29.10.25 11:09, Kevin Brodsky wrote:
> Architectures currently opt in for implementing lazy_mmu helpers by
> defining __HAVE_ARCH_ENTER_LAZY_MMU_MODE.
> 
> In preparation for introducing a generic lazy_mmu layer that will
> require storage in task_struct, let's switch to a cleaner approach:
> instead of defining a macro, select a CONFIG option.
> 
> This patch introduces CONFIG_ARCH_HAS_LAZY_MMU_MODE and has each
> arch select it when it implements lazy_mmu helpers.
> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is removed and <linux/pgtable.h>
> relies on the new CONFIG instead.
> 
> On x86, lazy_mmu helpers are only implemented if PARAVIRT_XXL is
> selected. This creates some complications in arch/x86/boot/, because
> a few files manually undefine PARAVIRT* options. As a result
> <asm/paravirt.h> does not define the lazy_mmu helpers, but this
> breaks the build as <linux/pgtable.h> only defines them if
> !CONFIG_ARCH_HAS_LAZY_MMU_MODE. There does not seem to be a clean
> way out of this - let's just undefine that new CONFIG too.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


