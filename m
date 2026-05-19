Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C423CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmVobqqEallvm7lE3zTMCUvYcTmJzyMk52MpJZx8aRc=; b=Kcp6VgxXAYjX/lB0jXn52hVAHq
	9byr6pDprLyLccZ4UoJzBlEIaHlZpNwEqpT4I/af5AUWTkVmq0ewWYk10BUuDxhI6IKeApDCbkS7U
	JV8ZxbkbFS3dIS8Q5roqa/l+KkMvhqVhWO+3m0eVWYXcG27KNvSp2fW/KaOLdyDmuUHZZMykMH8s1
	dkbvVe46PcZyf8GDUWioiE4fzi75O5KdPHJqx7ZobkFVmodg4v033xomO0pYA/AQNRbvePykAkHAs
	MUrr0ijx4++6MpMuFFBSDkKe9iBOS/bqvGhGXUW1FFXr6ukbjQBovHb9lEul9k337D+UTTLx8GyFO
	ZKn9bfAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPELf-00000000Pvi-1Z3Y;
	Tue, 19 May 2026 06:54:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPELd-00000000PvJ-1pc0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:54:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C83560208;
	Tue, 19 May 2026 06:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB720C2BCB3;
	Tue, 19 May 2026 06:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779173676;
	bh=WTulWk0fdJsYN4VDWBS3LAugunVY3PrhUqz2mvZt/Fw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uSxdtMhTYbo8vA/rS1evCTJW7BFfc4cZ9/tQPleeIUwcXo8myxlf78qlAuxCzWtkD
	 tBmy+pTVVxODiJBiq+9FY3caN9vYALV+porHWp7dOLbCJjY5UEDay1YYCDJ4MQbYn/
	 G/8RbcTGCJJOFWMqQItxyghbiZnq96UF4EtzAlX/zCJw08HF0nVw8f5dRAzFZGYq33
	 2p0Q9V1/0Gccpqoczx/1RxlVbo3hsU9rpmPz86x/IQgTUqiDp7ahzb9jKSgSLbMV3R
	 94v7n1MO5uWG0MYhQHkZfWJTpmaEKBUb60y46Nwb1JIGCszsqEbE8jQRv/QExHo0p5
	 GfjyRqyPPl4Aw==
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
Subject: Re: [PATCH v14 17/44] arm64: RMI: RTT tear down
In-Reply-To: <20260513131757.116630-18-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-18-steven.price@arm.com>
Date: Tue, 19 May 2026 12:24:26 +0530
Message-ID: <yq5a1pf7ubx9.fsf@kernel.org>
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
> +static void kvm_realm_uninit_stage2(struct kvm_s2_mmu *mmu)
> +{
> +	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
> +	struct realm *realm = &kvm->arch.realm;
> +
> +	if (kvm_realm_state(kvm) != REALM_STATE_ACTIVE)
> +		return;
> +
> +	write_lock(&kvm->mmu_lock);
> +	kvm_stage2_unmap_range(mmu, 0, BIT(realm->ia_bits - 1), true);
> +	write_unlock(&kvm->mmu_lock);
> +	kvm_realm_destroy_rtts(kvm);
> +}
> +

We also call kvm_stage2_unmap_range in kvm_destroy_realm()

void kvm_destroy_realm(struct kvm *kvm)
{
...
	write_lock(&kvm->mmu_lock);
	kvm_stage2_unmap_range(&kvm->arch.mmu, 0,
			       BIT(realm->ia_bits - 1), true);
	write_unlock(&kvm->mmu_lock);
        
-aneesh

