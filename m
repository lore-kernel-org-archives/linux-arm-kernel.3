Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC27D7497E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQ9IOV8nAvuZ5AXJDSHYbouXEO3y3zCUlP1f9gZH1qE=; b=qkR0corZc8repaeenpLAyOcISb
	0Kfrp4L4Vx/DiABq9ADoJZLpHfidIiAPvZm5my5QxoygsoqUQsspbfxVIKtmGL+U/bX5fWpB5IgV3
	k3+6oFn2RI3pMYtQb6Lf9XOr+gFRP/z+y0w5HM0f8sYfo3LoJAwuB5bUeTL6d24qijuWjvS6UlxJE
	f+FJm++9oQBa5ugFkYqjY79IwqyMsEW6sSTiE5968AjWnYOSAQZ5N+T/h2PO/hG+lQYrO7whQwPPO
	Pf+BzYPrFFIySZZrvNwGkuMNOn9yeOfMk11W96woJbDs2yMcU/vOew9SESfhOr67XInV5vH1t43mG
	YsTDb7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t63Wa-0000000HCvf-2RpH;
	Wed, 30 Oct 2024 07:53:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t63Ux-0000000HCkC-1Klg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 07:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 89856A4387F;
	Wed, 30 Oct 2024 07:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CBD3C4CEE4;
	Wed, 30 Oct 2024 07:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730274729;
	bh=vrq3Hj0eASMy2KLVd52CUc8legLz7mDW/VncF6IQKRk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fyf0LMJf7Dtu1xwovWtcG6BfS649d4d36jLDwt+BeNQyBUsWZQ/X0tcmIebTw/E9U
	 aVV6KA+GAnRHC10my9qHaHTRstRTBSD8dW6oLM1GoPMFE2BhLQBO5vyPCezZzQ2dnZ
	 +oDU45jvPEjKOX5qC77au6BuHcBFxOH7cNEDQIboSQbRKzACVfaJKensFd8+PzY6Z3
	 bD2+bzGtuFPaTXfmMiJXEtpXafSuwz1KoCLyUgJNkPH7DiwWDFJ9uz/IkGg8gpf4ta
	 g7Q+Mnthdgki4eFXTeWepnFh4HvsyZ/yYE8EG2Uij/iTGTHjMMoL9qSrfwU2vRA1R0
	 J6Xt04LlfhfPA==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>
Subject: Re: [PATCH v5 17/43] arm64: RME: Allow VMM to set RIPAS
In-Reply-To: <4075a8bc-2f1e-441d-815e-aaf83e88d3d0@arm.com>
References: <20241004152804.72508-1-steven.price@arm.com>
 <20241004152804.72508-18-steven.price@arm.com>
 <4075a8bc-2f1e-441d-815e-aaf83e88d3d0@arm.com>
Date: Wed, 30 Oct 2024 13:22:00 +0530
Message-ID: <yq5afroec9jz.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_005211_446111_3C2491C6 
X-CRM114-Status: GOOD (  13.43  )
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> Hi Steven
>
>
>> +	if (WARN_ON(rmi_granule_undelegate(phys))) {
>> +		/* Undelegate failed: leak the page */
>> +		return;
>> +	}
>> +
>> +	free_page((unsigned long)phys_to_virt(phys));
>
> The above pattern of undelegate and reclaim a granule or leak appears 
> elsewhere in the KVM support code. Is it worth having a common helper to
> do the same ?
>
> something like: reclaim_delegated_granule()
>

free_delegated_page() which should really be renamed to
free_delegated_granule() essentially does that.

IMHO we should convert all the delgated allocation and free to
alloc_delegated_granule() and free_delegated_granule(). This will also
help in switching to a slab for granule allocation. 

>
>
>> +}
>> +
>> +static int realm_rtt_create(struct realm *realm,
>> +			    unsigned long addr,
>> +			    int level,
>> +			    phys_addr_t phys)
>> +{
>> +	addr = ALIGN_DOWN(addr, rme_rtt_level_mapsize(level - 1));
>> +	return rmi_rtt_create(virt_to_phys(realm->rd), phys, addr, level);
>> +}

.......

>> +static void realm_unmap_range_private(struct kvm *kvm,
>> +				      unsigned long start,
>> +				      unsigned long end)
>> +{
>> +	struct realm *realm = &kvm->arch.realm;
>> +	ssize_t map_size = RME_PAGE_SIZE;
>> +	unsigned long next_addr, addr;
>> +
>> +	for (addr = start; addr < end; addr = next_addr) {
>> +		int ret;
>> +
>> +		next_addr = ALIGN(addr + 1, map_size);
>> +

Is that next_addr update needed? 


>> +		ret = realm_destroy_protected(realm, addr, &next_addr);
>> +
>> +		if (WARN_ON(ret))
>> +			break;
>

