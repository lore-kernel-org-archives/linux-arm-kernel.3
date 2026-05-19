Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D77CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cT9F7VO3Mh/HgtfFN9iVa+SKSz+PTsYe1tSp0B8YcnU=; b=duR9FDESxl0q99q5yRk5wZmqYP
	mOyO7mXw6OKDS/VwNTSPhKu5ZMwGZHafhNtI0kwK5rxbL0+TbF2DPrr9JLoXlTrq2toWEePloftjk
	cvFDLCIk0sEPjrxZEXnc2RMVqKX8Dtu0Tc/sB3QmIMg/mXgJ37CsLQSgT9yB8hVnB6tyGRWYj5aUU
	OPpig5BfRNd2VInZFi7BzA/g0n1+Cq9uJhzGtMI+g1ZYKA4YN1XPj0kRXtQgDy+yRD0WlX1664bU5
	rZORZ4nL/XiZvkjczr2x7y6aq+yMuIV+5ECnyiHl0alXE/BCcHx9xTYvYUHP2gE2QX9R5l1I4Pldz
	j3SIdNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHHS-000000011kt-3iL5;
	Tue, 19 May 2026 10:02:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHHR-000000011kc-3SBq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:02:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E675560126;
	Tue, 19 May 2026 10:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDF4C2BCB3;
	Tue, 19 May 2026 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779184948;
	bh=5CY+IUXkmbYVoZqzVuKhQ3pZoZ4Pk6BK8MnYzDSzr7E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FCjRvMHJals+Nn6CQNjvcIFda8xr7o7GvV7HXOOaPv+oBEkbfHumyHVdTzBWmzMJX
	 9y/9he4/VJ3Bs5eMQhEVcbDIlBmi+HBcoI12ORsQymuciY5S/osY3WzwQ2FjVbKMR5
	 oM9V8EMF6BOeoyf0r4MV0B3CNksvJqT0q3VjjYBO6unRdMEaVHsdWzBQ1sXpEEendH
	 /U/O6if5goDue3gM21oIUeqmenUE3zkhzrsVLvLMYrqjbA2aeQ3ghJeTj416jFfesO
	 pskTY1BS6PFCLAXcdtu6H6hIbMztjmp6g8bGSBXOKRVvrP+CEcVaojmEzKq/SZF/aD
	 hdsusPyjxEdkg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: Re: [PATCH v14 27/44] arm64: RMI: Set RIPAS of initial memslots
In-Reply-To: <20260513131757.116630-28-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-28-steven.price@arm.com>
Date: Tue, 19 May 2026 15:32:16 +0530
Message-ID: <yq5av7cjsonr.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Steven Price <steven.price@arm.com> writes:

> The memory which the realm guest accesses must be set to RIPAS_RAM.
> Iterate over the memslots and set all gmem memslots to RIPAS_RAM.
>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
 
 ...
 
> +static int set_ripas_of_protected_regions(struct kvm *kvm)
> +{
> +	struct kvm_memslots *slots;
> +	struct kvm_memory_slot *memslot;
> +	int idx, bkt;
> +	int ret = 0;
> +
> +	idx = srcu_read_lock(&kvm->srcu);
> +
> +	slots = kvm_memslots(kvm);
> +	kvm_for_each_memslot(memslot, bkt, slots) {
> +		if (!kvm_slot_has_gmem(memslot))
> +			continue;
> +
> +		ret = realm_init_ipa_state(kvm, memslot->base_gfn,
> +					   memslot->npages);
> +		if (ret)
> +			break;
> +	}
> +	srcu_read_unlock(&kvm->srcu, idx);
> +
> +	return ret;
> +}
> +
>  int kvm_arm_rmi_populate(struct kvm *kvm,
>  			 struct kvm_arm_rmi_populate *args)
>  {
> @@ -890,6 +922,10 @@ int kvm_activate_realm(struct kvm *kvm)
>  			return ret;
>  	}
>  
> +	ret = set_ripas_of_protected_regions(kvm);
> +	if (ret)
> +		return ret;
> +
>  	ret = rmi_realm_activate(virt_to_phys(realm->rd));
>  	if (ret)
>  		return -ENXIO;

relam guest already does. 
	for_each_mem_range(i, &start, &end) {
		if (rsi_set_memory_range_protected_safe(start, end)) {
			panic("Failed to set memory range to protected: %pa-%pa",
			      &start, &end);
		}
	}

if so why is host required to do this ?

-aneesh

