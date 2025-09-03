Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978C4CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sXropmRvRzVq8QVYH11V1C2zJovVWTZHbdPqhav95Y=; b=D45LeN48U8wuaL1febuqYFMLPp
	dJwAXsUfKOBtpg+SuJyzZS0Q0qv2DI9ovZRy4fwohUKGv/4AjklJpyMP1dMGeZjM4K7NpieG1ZflV
	tCZhNDZRwIzjIzDH2WusfnuyU8i9VEudZNAlq81HvdLWWcLG5AYCVQAyBk6O4b0hsX2TsKtsO0E2E
	+jRZY7AaewxUAe/4V9n1Azw7IeiVOWAPOD+UUTOtXScb8Ha+A13KDsOA8TB/Zm3Z2re0eGo85OwrX
	Eb7PYc79Za26I+tKhN+bbl+DZa4/zWH2pkaPzZPf/jl4jAI1pvCffKKKY4MwFT2Pwveg9f1PYANrc
	4hybD9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzRj-00000008GgE-0SxJ;
	Thu, 04 Sep 2025 02:11:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utx1U-00000007v2u-2kpb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 23:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756942575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0sXropmRvRzVq8QVYH11V1C2zJovVWTZHbdPqhav95Y=;
	b=dsMo/tzMkadQxNeemH2ItPeOAD+xwxUdqlSOmiZYEPFrhi6c04mW3kgbQcVQlh+Usw8So2
	XD9uOPMowOwXIx5n0jkuY+uO54W7DHpVie7BNvKdzPLDvwvCO0Q2faOZozZ2rCtig1P8+0
	eLIVTVkKmoH7rEA6Vw+FTiiiK800Z24=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-jCPIelzFOFK12WbIcZASow-1; Wed, 03 Sep 2025 19:36:13 -0400
X-MC-Unique: jCPIelzFOFK12WbIcZASow-1
X-Mimecast-MFC-AGG-ID: jCPIelzFOFK12WbIcZASow_1756942572
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244582bc5e4so5170885ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 16:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756942572; x=1757547372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0sXropmRvRzVq8QVYH11V1C2zJovVWTZHbdPqhav95Y=;
        b=SKMQtuqxsw0/R3Mz0Aw2pslyfFDOVHRIQQK2NTdlG0JZgDEXJxks4G3u6ALDrBXGk0
         OsFefnW7aVcdQValCbTgJHFLWlwMN/TUEd6CyEdKkv7IE1DfmYcWvzGBydCZxRMgwI96
         YkLuLXxqWyJUVOrRHp0BXkqGUgN/TSjfdbfXH9qbFK7uHtW4n7+g/19ZOt9j0ZVlsPl/
         jcdRPCkiX755keuSNdgV05k43v61hbnMc/BwC8FwBPDjB9Zctnaxxhda8fUcwBGr7SPA
         rjDyQ9JRpVnTO706GxV4IkneQFzex6ee6d0/Z/OkWDAfAsKvFkxxYmyD70v6EaYPv8p0
         alJA==
X-Forwarded-Encrypted: i=1; AJvYcCVRd22kpyK4y0qMiu/ZRdR6XbFyyIU2yWmbr2irsIQjP7OIPRBWOQUT55xG9EyrhAUfiXNeewOrZOW4ciAvW/u/@lists.infradead.org
X-Gm-Message-State: AOJu0YzVchwOrxUemqJDC3Xf2/beDKwASflLL2MGkTYpW5/PIhp0Gx6s
	+v79wbQRDQl2sSb1t1CHxr+MpUptE2y0G50uJ04cSwO5BlIqIZzLlpZB3lqhND9mER2Tu2Sw5pd
	oGk6Ug+a24CEyhXjchqnSXAV/I+4pBaSIqXfAlZyYeZC8QhVk0jowA1DHQEZ76e/brpQzWdfsxv
	px
X-Gm-Gg: ASbGncsxvwrj4Gb/fxia8csF1oHY8/7P3QmZH2tELVEskknsUSF4HxSup2bbvS/4IdJ
	lrizkxJintmfTlA1JSt6aXPdSuL+N+7wMsfG0FTvVrOmgjGJTlxSLCPGpW1sjT+zy3rF6YgsStL
	HFqTvxBDKvaB8DbcgvpluZ2OZFIJa9NUBmesy7S8j5gupjtK+6gK7THfPVR0fqCxvTjLcQAH5Pb
	HS7LqrP+f+uMJqtYDe1/riNEjR3F+qtpg8i+YhBKS+gjmfAIph0YDu1u3eSK0hAlsBtLvCSkeIv
	uDVpUWPVpbducLxyNZj9xDVMZy7veACP8VepjaB1FaU9bhXAyEQtkGxxfBbjYXPUBGK4umevJPj
	dXaGS
X-Received: by 2002:a17:902:d4cb:b0:249:3049:9748 with SMTP id d9443c01a7336-24944a98207mr213064115ad.35.1756942571802;
        Wed, 03 Sep 2025 16:36:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWxDvzz4guDF0h66h4LLb4oxiM+mn4RFSoqx9tFAX6Irf9VMfNEHKTbxRTX3+Sn09XeYBQ/A==
X-Received: by 2002:a17:902:d4cb:b0:249:3049:9748 with SMTP id d9443c01a7336-24944a98207mr213063695ad.35.1756942571216;
        Wed, 03 Sep 2025 16:36:11 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490375b6d0sm172156625ad.62.2025.09.03.16.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 16:36:10 -0700 (PDT)
Message-ID: <cb387dcf-7ee0-4cf6-bf10-d043d20190f0@redhat.com>
Date: Thu, 4 Sep 2025 09:36:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/43] arm64: RME: Allow VMM to set RIPAS
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20250820145606.180644-1-steven.price@arm.com>
 <20250820145606.180644-16-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250820145606.180644-16-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wVYx0qdJEO_ylnt09wCFVbwR8HEH-enqHScP7dX6Akk_1756942572
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_163617_125073_833D7761 
X-CRM114-Status: GOOD (  25.12  )
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

On 8/21/25 12:55 AM, Steven Price wrote:
> Each page within the protected region of the realm guest can be marked
> as either RAM or EMPTY. Allow the VMM to control this before the guest
> has started and provide the equivalent functions to change this (with
> the guest's approval) at runtime.
> 
> When transitioning from RIPAS RAM (1) to RIPAS EMPTY (0) the memory is
> unmapped from the guest and undelegated allowing the memory to be reused
> by the host. When transitioning to RIPAS RAM the actual population of
> the leaf RTTs is done later on stage 2 fault, however it may be
> necessary to allocate additional RTTs to allow the RMM track the RIPAS
> for the requested range.
> 
> When freeing a block mapping it is necessary to temporarily unfold the
> RTT which requires delegating an extra page to the RMM, this page can
> then be recovered once the contents of the block mapping have been
> freed.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v9:
>   * Minor coding style fixes.
> Changes from v8:
>   * Propagate the 'may_block' flag to allow conditional calls to
>     cond_resched_rwlock_write().
>   * Introduce alloc_rtt() to wrap alloc_delegated_granule() and
>     kvm_account_pgtable_pages() and use when allocating RTTs.
>   * Code reorganisation to allow init_ipa_state and set_ipa_state to
>     share a common ripas_change() function,
>   * Other minor changes following review.
> Changes from v7:
>   * Replace use of "only_shared" with the upstream "attr_filter" field
>     of struct kvm_gfn_range.
>   * Clean up the logic in alloc_delegated_granule() for when to call
>     kvm_account_pgtable_pages().
>   * Rename realm_destroy_protected_granule() to
>     realm_destroy_private_granule() to match the naming elsewhere. Also
>     fix the return codes in the function to be descriptive.
>   * Several other minor changes to names/return codes.
> Changes from v6:
>   * Split the code dealing with the guest triggering a RIPAS change into
>     a separate patch, so this patch is purely for the VMM setting up the
>     RIPAS before the guest first runs.
>   * Drop the useless flags argument from alloc_delegated_granule().
>   * Account RTTs allocated for a guest using kvm_account_pgtable_pages().
>   * Deal with the RMM granule size potentially being smaller than the
>     host's PAGE_SIZE. Although note alloc_delegated_granule() currently
>     still allocates an entire host page for every RMM granule (so wasting
>     memory when PAGE_SIZE>4k).
> Changes from v5:
>   * Adapt to rebasing.
>   * Introduce find_map_level()
>   * Rename some functions to be clearer.
>   * Drop the "spare page" functionality.
> Changes from v2:
>   * {alloc,free}_delegated_page() moved from previous patch to this one.
>   * alloc_delegated_page() now takes a gfp_t flags parameter.
>   * Fix the reference counting of guestmem pages to avoid leaking memory.
>   * Several misc code improvements and extra comments.
> ---
>   arch/arm64/include/asm/kvm_rme.h |   6 +
>   arch/arm64/kvm/mmu.c             |   8 +-
>   arch/arm64/kvm/rme.c             | 446 +++++++++++++++++++++++++++++++
>   3 files changed, 457 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


