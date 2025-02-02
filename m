Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8FDC02190
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 07:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Akyo3JQj2YPzoJhRHm4ECXXW4B+Mshy1bBF/6XTbeo=; b=L2Mnw/AePPcj5QUOYSqDb8/OUN
	7NdIKN+Ik/FiHAZyIxbrrIjxaEnl5lJ40yV6ktbgUWGxXt4rXbdAOuH/5NgRFNPQMN427/UU5xKOx
	Ib7hY3WxuDilGqeRdO/4q+475wqxdOpPdKuJKWqxRVGKNubV50sR89SODuMYz6RVCmcAAmELbJfiB
	tX0U2E9nv84DQhbBMslDlHjaASr45Rg/BzlGQBo+nbs5DyyStYzcuZIqlT84ywe+I1Zgug31C5HMV
	dXLkWFM8X/NEEF75pJWaAoOq2JMcB7+JZLpzVeZ1lPsCtNP+9C+LOD6YqanO3gt8HySnsztdRYVBW
	1LKhMLuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teUBd-0000000DSxG-22hY;
	Sun, 02 Feb 2025 07:14:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teUAB-0000000DSrk-24aQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 07:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738480381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Akyo3JQj2YPzoJhRHm4ECXXW4B+Mshy1bBF/6XTbeo=;
	b=iak71eLfDyT2saDd4rfe8VQXebcZSq49M9olITqfJgYOArcPRzZfAweFtwoc3TBZhSROZM
	pgG9+EiyQaVbIVggRHNbIzSz/EoMsjZ3IWqNNx0j6YDoubWX3dByUZIdKIKP8Ux2VQXeHM
	1zfAz9L8bkISHd0GAJEM2pVBzstd2WA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-pUUpdviPPyGRnN3zDSIf1A-1; Sun, 02 Feb 2025 02:12:58 -0500
X-MC-Unique: pUUpdviPPyGRnN3zDSIf1A-1
X-Mimecast-MFC-AGG-ID: pUUpdviPPyGRnN3zDSIf1A
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216750b679eso50095825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 23:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738480377; x=1739085177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Akyo3JQj2YPzoJhRHm4ECXXW4B+Mshy1bBF/6XTbeo=;
        b=HRyjawv9hws48xn+B3xxqj72jWt5XrcgvZVcUz5LvHqIvBeWvKC3J4nkwEQAqrG81/
         6vg2/JjSeYbvZnjvcIwSEwwaDm9calLPZNvWtnZaXaspxfnuGFE3NEJ4XhmwVvWMsckO
         MDUpgVZMlaVij65ItwcK/QBTAb4ZZ7V91qcO5NokRXgj5CY7NONkQ9xGEBA2T7w9ZaWk
         /BmetW90lQeoJqPMk5WuVszBh4sJMfO67hG5uEwK5EN6nwnXzb/LFrk7044bt5EYsIac
         iCUyFjb3YwQsaUMqoi4cryPQ2rYVT6y1HLAGmWYW/EXtJ1ZsAgEsOZMVL5hipTOYEOuH
         hYRw==
X-Forwarded-Encrypted: i=1; AJvYcCW5b6Z/PM+uwEgzC9JRkDnvA61O+sXagJVfprVRcUB8SN8y1B0OHHWo522/Mhhln+KYKvRevkYU3bxeG3Gj2tpO@lists.infradead.org
X-Gm-Message-State: AOJu0YyMnBZqumkVCJ8WgWxx3c2wQshltEhV+T/l+goqbhsMImDEMql1
	cqS7uebvoCih3XyhEEtNeWc4ofuswdMtWXT9hKIJ/gASTx3GmeFn3GXVauNAVDyOLlXI76PsJLV
	lpW/N5+4GA9qKzSz2MPPt6EHO3EiZ/mi6d3sqH0alwIWVdzHqXGB3mGxhe0yGTZ700KRwD6DE
X-Gm-Gg: ASbGncv1ksceqaJsBZwEGaIGRWQ9HE+qdhLbw5G6nB2zXMN1V6v3Em7wR/nQ6a/5Ylp
	amkaO9esar55GwS5gxNBRNdOI7iP+vYarZuCGmqj+NUURUTOaVW1MrqKbo87uL9riM3gAcnkRSc
	iKfnECuliEc+Yn/aQtDbW6HjxQONXdEIjzatwlbmP4zxE95f8SpOKh6LRok4YMLS8etz6H1ZfcG
	H+BYlbxBsR0FNNEIkJB2nhqUhP0iUtxzECghn1aG50ZLpNwz9vxQoEV0ukyaAF4f1DotAQo30cr
	cibPZw==
X-Received: by 2002:a17:903:110c:b0:216:1ad2:1d5 with SMTP id d9443c01a7336-21dd7deebd1mr265357325ad.41.1738480376994;
        Sat, 01 Feb 2025 23:12:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEbEpN4KQNQWRi1soSDL1v4OtYLgM2DYDPCY0eEgB/YujTFWmFABLlbkBOcGlGdKwPsn62yg==
X-Received: by 2002:a17:903:110c:b0:216:1ad2:1d5 with SMTP id d9443c01a7336-21dd7deebd1mr265357095ad.41.1738480376627;
        Sat, 01 Feb 2025 23:12:56 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5f1sm54843395ad.130.2025.02.01.23.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 23:12:56 -0800 (PST)
Message-ID: <f339729a-00a8-40b5-af05-f0f019579e5e@redhat.com>
Date: Sun, 2 Feb 2025 17:12:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 30/43] arm64: rme: Prevent Device mappings for Realms
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
 <20241212155610.76522-31-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-31-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 08Xb1isW2oViGdxVexyH1NKGQBiwOSYkbP8XoYJedUE_1738480377
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_231303_622141_6F970FCC 
X-CRM114-Status: GOOD (  20.18  )
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
> Physical device assignment is not yet supported by the RMM, so it
> doesn't make much sense to allow device mappings within the realm.
> Prevent them when the guest is a realm.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v5:
>   * Also prevent accesses in user_mem_abort()
> ---
>   arch/arm64/kvm/mmu.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9ede143ccef1..cef7c3dcbf99 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1149,6 +1149,10 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>   	if (is_protected_kvm_enabled())
>   		return -EPERM;
>   
> +	/* We don't support mapping special pages into a Realm */
> +	if (kvm_is_realm(kvm))
> +		return -EINVAL;
> +

		return -EPERM;

>   	size += offset_in_page(guest_ipa);
>   	guest_ipa &= PAGE_MASK;
>   
> @@ -1725,6 +1729,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (exec_fault && device)
>   		return -ENOEXEC;
>   
> +	/*
> +	 * Don't allow device accesses to protected memory as we don't (yet)
> +	 * support protected devices.
> +	 */
> +	if (device && kvm_is_realm(kvm) &&
> +	    kvm_gpa_from_fault(kvm, fault_ipa) == fault_ipa)
> +		return -EINVAL;
> +

s/kvm_is_realm/vcpu_is_rec

I don't understand the check very well. What I understood is mem_abort() is called
only when kvm_gpa_from_fault(kvm, fault_ipa) != fault_ipa, meaning only the page
faults in the shared address space is handled by mem_abort(). So I guess we perhaps
need something like below.

	if (vcpu_is_rec(vcpu) && device)
		return -EPERM;

kvm_handle_guest_abort
   kvm_slot_can_be_private
     private_memslot_fault	// page fault in the private space is handled here
   io_mem_abort			// MMIO emulation is handled here
   user_mem_abort                // page fault in the shared space is handled here

>   	/*
>   	 * Potentially reduce shadow S2 permissions to match the guest's own
>   	 * S2. For exec faults, we'd only reach this point if the guest

Thanks,
Gavin


