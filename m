Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B295C02190
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 06:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmFZPr7vvicMrPdu+ITYGzZQ8FMqK4dGeuyKQ/HiL5g=; b=no4KhM2AuosMUmiNgNLyx2+jNj
	JoETrYKEaVWtV1S9dTBPMMfE0Lszq0WZVQVdOvg7RkdKep7LZiCXGH3jztWtTamb6teaN54/Y4xV2
	7ovV7r+nR99KTRPcoxns3BRkDVSWgEPex9iFSy//PhHKoGWjKNb+1Vr9rRRO8iGg0MpZjT7C+iJfs
	UjAIJ1th7RULapdtOQz0E2vCQwpLQNrVGRangIbjFM1FpvSqfgd0g2ZkOGGYilkrAGdL0iYixBPnF
	4j18quV5hxDf2LPcJ62R+MrnKx5r3N3TeWroaHMDnVxBYZmenMR0Gpmv0AQ3zh/+nr2H1Fxy+iK4t
	HbMJkYaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teTs8-0000000DS6K-26Wc;
	Sun, 02 Feb 2025 06:54:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teTqm-0000000DS1G-1Um3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 06:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738479179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dmFZPr7vvicMrPdu+ITYGzZQ8FMqK4dGeuyKQ/HiL5g=;
	b=IPRhCvdBGl3kt8pW7g7KBwVgDuz6heMKARPBw48rB+MUhBp4lfApO9sOpb85tDj+uMbwHx
	XduBMqf85pTaKy6AzR7IHis+LYr5IQkL4xqCEplREzPcbZAQaSt6vX4Ipvo0ZoE3UcLs9J
	yvQKJI8O1J6ZOHYxp2wZ5RPhlBN10zg=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-KRwV7c9HMFKSum_X3AzXXw-1; Sun, 02 Feb 2025 01:52:57 -0500
X-MC-Unique: KRwV7c9HMFKSum_X3AzXXw-1
X-Mimecast-MFC-AGG-ID: KRwV7c9HMFKSum_X3AzXXw
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2163d9a730aso69758375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 22:52:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738479176; x=1739083976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmFZPr7vvicMrPdu+ITYGzZQ8FMqK4dGeuyKQ/HiL5g=;
        b=up97D1JvtcrhuO0ZnvW9le9qUzHVQKtJL+74B8m1YHDBC7KORF+p50O2+GpMruahhs
         9T3AEbdFijw2+txZJHOuXoMWmaLOVuyAQIb22uS+HOqI6GnU5qVe8kug4QE+4PK8rWgO
         qZMVdgQX7ft8HPUdaTCT9FOU3zspMwCVOf0QaOtOcsrxK/qnWfurSWtrkWdeTENzFxGr
         jYh/BHIjl2Be07gmuJiBRPJgtxkmAqicgwETR4sT0FBbifq79oe9XIB3gmEY+sq46bQV
         OA4KHWooWLC/Et6IwqH6+1lckbmE32kkqZE8TLXUpA+Nbol4D/fBXzQXjchndZiEHYla
         jDGw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ1Y8vFopPWyaSbAULlK1Gwm/szyQkSrRZEkCBhDBWWODuE1h3M2W2LLSWYzJvtSQnxXSubKteWwxhq7Bycq2F@lists.infradead.org
X-Gm-Message-State: AOJu0YxUAYzYZgkruw98bsmp6lTd/1mpfFSTGPMONrmiHRMcvtmw1vei
	ndJcOv7a83l1Od7FzNS9RSy0sXZ6UoWNQ7dLM5MSERflzMIKekrpW09NUBSilXayvk9TdtG7TJx
	D0nck7CuOcyT+o0ZJgsMzDq3sEdFAU5/EYgCbyBF3xWxtHyO8UNmSKNUoniII1+rxRESWP6yF
X-Gm-Gg: ASbGnctpaQafB7VKJrGdsB/DrMLLxlPLwNMSEVTAK0oWpRPeNwRcWnUM94/Q0q0RE47
	cKWQNmVtL/tepXmm5hGLyzo3X8dq1HEJuRnbBzHAF62L7XIym6k8rYcJpK00a3DsZgzurB0Zo/8
	XEiYttqLQvppjrW/CHVOqR+Ap9cbPEFMZmopH65mg1mHc9C3p69Ml8JBCSliNqkjdh4csPBgGa1
	lXj7uRk0kn6cwMy7yJUSvRtoV8S7lp+1Ntdotb6ZPsmdzAZ9UkqnxIDdJJnQWtRvA4kWc64TnIf
	FFLB8A==
X-Received: by 2002:a17:903:246:b0:215:b1e3:c051 with SMTP id d9443c01a7336-21de1968f37mr191228175ad.11.1738479176574;
        Sat, 01 Feb 2025 22:52:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGr8YDEgf3AQME0gtW8Rc2bNGoGwAlcqKLbbyp/bsjze7Hnub47aEwGNl8h+IYW0bDy17/2PA==
X-Received: by 2002:a17:903:246:b0:215:b1e3:c051 with SMTP id d9443c01a7336-21de1968f37mr191227855ad.11.1738479176239;
        Sat, 01 Feb 2025 22:52:56 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3335cc9sm54443775ad.258.2025.02.01.22.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 22:52:55 -0800 (PST)
Message-ID: <82659880-f7a6-48ad-bf54-8371fc3d41d8@redhat.com>
Date: Sun, 2 Feb 2025 16:52:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 29/43] arm64: RME: Always use 4k pages for realms
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-30-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-30-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XkB8PA6f8aF5_UI9hiDqOnGwqv-7VeHMZLnG9akR2kM_1738479176
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_225300_543598_D40F6162 
X-CRM114-Status: GOOD (  21.79  )
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

On 12/13/24 1:55 AM, Steven Price wrote:
> Always split up huge pages to avoid problems managing huge pages. There
> are two issues currently:
> 
> 1. The uABI for the VMM allows populating memory on 4k boundaries even
>     if the underlying allocator (e.g. hugetlbfs) is using a larger page
>     size. Using a memfd for private allocations will push this issue onto
>     the VMM as it will need to respect the granularity of the allocator.
> 
> 2. The guest is able to request arbitrary ranges to be remapped as
>     shared. Again with a memfd approach it will be up to the VMM to deal
>     with the complexity and either overmap (need the huge mapping and add
>     an additional 'overlapping' shared mapping) or reject the request as
>     invalid due to the use of a huge page allocator.
> 
> For now just break everything down to 4k pages in the RMM controlled
> stage 2.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index e88714903ce5..9ede143ccef1 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1603,6 +1603,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (logging_active) {
>   		force_pte = true;
>   		vma_shift = PAGE_SHIFT;
> +	} else if (kvm_is_realm(kvm)) {
> +		// Force PTE level mappings for realms
> +		force_pte = true;
> +		vma_shift = PAGE_SHIFT;
>   	} else {
>   		vma_shift = get_vma_page_shift(vma, hva);
>   	}

Since a memory abort is specific to a vCPU instead of a VM, so vcpu_is_rec()
instead of kvm_is_realm() is more accurate for the check. Besides, it looks
duplicate to the check added by "PATCH[20/43] arm64: RME: Runtime faulting
of memory", which is as below.

        /* FIXME: We shouldn't need to disable this for realms */
        if (vma_pagesize == PAGE_SIZE && !(force_pte || device || kvm_is_realm(kvm))) {
                                                                  ^^^^^^^^^^^^^^^^^
                                                                  Can be dropped now.

Thanks,
Gavin
                  



