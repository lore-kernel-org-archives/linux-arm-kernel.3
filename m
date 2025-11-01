Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4971BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 12:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o048ati210LDdtQS+FOPO4jSMwtVqN57n5BUaVz6yTU=; b=YvN/s8u2oY3LLAh88Ycs96fOl5
	xBOUr7r9NnbWN2j35kdv3/eEQrPLETKm+dPw/+XGKp5qmyEEbsNu9hswPzJgjot1hBawcILgsTSil
	u0abZjqoynaSxCdw0m24N/5r5mXzsiaSmFTbR2NPX0u/VMLkcBeyXAiTUxCuNIqf/5G7hHbrXdvYw
	8s+9H0GY/t5+wBJK5o2V+4LzpWgdJ+mC89phbmIfzTQeEXQx4YWli8WQyPohozj1F29rvvGEyn+yT
	jBHv50xg00rBz4Rgis3tWUCFWo5t43wgIFv59T+8xiOxHJFjcTLTv7XgD7N8/cozw8qG8FmYke21u
	/PA7j9Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAtI-00000007hxy-0QA0;
	Sat, 01 Nov 2025 12:39:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAV3-00000007RVg-10Mi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 12:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761999267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=o048ati210LDdtQS+FOPO4jSMwtVqN57n5BUaVz6yTU=;
	b=hR6OaIdQ/mskn2JcUFjIcD7cyYV2Uy38kvmgu2Fssn5ZDGGA+jTJWPrICQjJRX90YDApnh
	HcKBLYOiHGS78S3EvQTWgRPDBYYhfZz25B4VIWf2DtjG0RIfPBDAub+CRTO8ei+doJavPU
	onSH+pOIoF8Kt3NRLbAdKKviXA/0yDc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-wssUFPg-NOuQhLmkjpkuIw-1; Sat, 01 Nov 2025 08:14:26 -0400
X-MC-Unique: wssUFPg-NOuQhLmkjpkuIw-1
X-Mimecast-MFC-AGG-ID: wssUFPg-NOuQhLmkjpkuIw_1761999265
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4298da9fc21so1835737f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 05:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761999265; x=1762604065;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o048ati210LDdtQS+FOPO4jSMwtVqN57n5BUaVz6yTU=;
        b=STdfDUwsWPpLCqRAw3SmyqJinuNYlRCyMM4wXQgwF5WmKthHpEZS349y/7QNK995AQ
         opjIJJEqPd7JDkv2D8IhOKAYKowKs3FVP6iZkp5YMR30oH8b/bZNxd2I1zFSFsCuDqoB
         gtRPrmFM7q1lXWCEyIO3LPSvv+Cxnves74vj3+kYU0GbPZ2McjgMgtXPTn1k1bvP0/I5
         7J0TVuqSkXj5040MrGNBJBp8YhWa9Qu8ToVx+MnJ9I6D5ToUhvm9seQWbG59nj0/2bd1
         Tfavx7w0yz9XXJbvJgF5og8z8OGXTlfx7SM+oIPAnrUiLlGGFJfvNwobR5SznEdxjuDo
         2JhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9Rjz29fRzCy/zz+jJ1i2njo095pq44ZPfQl2eOW5oFeTlp8bfcQx/lWIRM+1rhc1HSdLbe8Lqdh+GsBksxM3Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxCSfNmtR0ISFzuavmvvwYo0TGWNFCFiDL7hIllbkEfzAdKMRxg
	3J7tTGk6kcDC5YxKpDH8xdV/zae+EkJS/s9cCuwWLKgR2jeVLPE79BvxteT3CmLIdKffsQy+mE1
	bUUHksB+tH/aAJKbr1HGj8Ttw70pluROMaOMx5olezzpbQ4tHOz8/uL8t6nruSM3yji+eTSQQbc
	xk
X-Gm-Gg: ASbGncs+ytPdktXl16TGDfsf75QlLq8NqJKUH42t8d1PGRDeZEtkvlERQ3CxkfDpXiX
	LSOdNFRkLKheLu83LrgshNmfKtp3JC2IWKfbpqTF2w3TynZsrtMRgXQVpdL0RNvhE47SWCd7ZTK
	x3XyDfuJKwhM4kbbp/PpH7QftT1DM0Wm3pRncJRcca7P0sQyatE6GtrByR9Ncue3lpjAo1NNn9D
	iw9nhDf8vsh2tSlN+i8v8oE3VcrC4gTO+St9BqGb8MSLWDbcSoqoPVAD6VC5RNvnadHlGbAJwIK
	gH1Xuv+xYd7t83gbRLerVqmze8pol/Fajd5URxbfaBPeul4GbN5pI58eEWkE4CKAsZ3GRdeY6DS
	NczKDbnpuaAdtwjm6EoYi0gi79S7tI1WT5jmep7tnp5CFc1q8jqj1Kv0MC6iwJT1H4Cn4mCZlVd
	E4iR+SJrlCz/cATVDw/ibsOp0en2k=
X-Received: by 2002:a05:6000:4006:b0:429:b1e4:1f79 with SMTP id ffacd0b85a97d-429bd6c1e9emr5632379f8f.58.1761999265102;
        Sat, 01 Nov 2025 05:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUnlqEI4i/IitGbkGmSb5mhRBlBddO47B8HgBUkc3NNZF05OsloV2rMzQDwADfEurYYBklUw==
X-Received: by 2002:a05:6000:4006:b0:429:b1e4:1f79 with SMTP id ffacd0b85a97d-429bd6c1e9emr5632339f8f.58.1761999264653;
        Sat, 01 Nov 2025 05:14:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c10ff584sm9569867f8f.2.2025.11.01.05.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 05:14:24 -0700 (PDT)
Message-ID: <5a3ccb7e-9d36-4ac8-9634-c8dec3d6a47c@redhat.com>
Date: Sat, 1 Nov 2025 13:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] x86/xen: simplify flush_lazy_mmu()
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
 <20251029100909.3381140-3-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251029100909.3381140-3-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mcH2jBorFPA-2fgIhBEigJWY2V3udQK_e6dNP3fhG34_1761999265
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_051429_369105_46FE4BBB 
X-CRM114-Status: GOOD (  17.90  )
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

On 29.10.25 11:08, Kevin Brodsky wrote:
> arch_flush_lazy_mmu_mode() is called when outstanding batched
> pgtable operations must be completed immediately. There should
> however be no need to leave and re-enter lazy MMU completely. The
> only part of that sequence that we really need is xen_mc_flush();
> call it directly.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/x86/xen/mmu_pv.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index 2a4a8deaf612..7a35c3393df4 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -2139,10 +2139,8 @@ static void xen_flush_lazy_mmu(void)
>   {
>   	preempt_disable();
>   
> -	if (xen_get_lazy_mode() == XEN_LAZY_MMU) {
> -		arch_leave_lazy_mmu_mode();
> -		arch_enter_lazy_mmu_mode();
> -	}
> +	if (xen_get_lazy_mode() == XEN_LAZY_MMU)
> +		xen_mc_flush();
>   
>   	preempt_enable();
>   }

Looks like that was moved to XEN code in

commit a4a7644c15096f57f92252dd6e1046bf269c87d8
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Sep 13 13:38:27 2023 +0200

     x86/xen: move paravirt lazy code


And essentially the previous implementation lived in 
arch/x86/kernel/paravirt.c:paravirt_flush_lazy_mmu(void) in an 
implementation-agnostic way:

void paravirt_flush_lazy_mmu(void)
{
        preempt_disable();

        if (paravirt_get_lazy_mode() == PARAVIRT_LAZY_MMU) {
                arch_leave_lazy_mmu_mode();
                arch_enter_lazy_mmu_mode();
        }

        preempt_enable();
}


So indeed, I assume just doing the flush here is sufficient.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


