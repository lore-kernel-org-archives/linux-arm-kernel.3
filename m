Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E189DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pp6KOfWg43baNnR2me4Rs+LYAkNdu4Qu2ONWE2ITsw=; b=vgRTGTvguByRP8wgMhhJkixfQL
	ZwDRkA2iO2Rj/q1gd/WaoWuRUFU5kpWTQNpUb36PT0mUDoXO4GeTzJorVpS3+9OdbDhy7wvOBBKe5
	0S67Vs0A1z7m5BLqvRrcV1RZvnAvsS6Cbbg8t7BMdH6b1HtDXBpkMNIAxlmj80eEjwuQbp9t25zcE
	5wcKq7HUgqAL+JwGo3o7WmurWTMmN2Dbh87MzITfI/6ola+VeSZPzjxfjZhgvAAcWUDAB/Ufsi3GN
	FYdx7iRb3keTZAomq+ZhGJTcpvTfMVnJQdQHZrW/WFXCJbO8dW//ZOfQYQi8k+UJzI2JsyWsTZdY8
	yFxjCnQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGw8-00000000xrk-49gT;
	Tue, 19 May 2026 09:40:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGw6-00000000xr9-3rno
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:40:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F84844537;
	Tue, 19 May 2026 09:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133BAC2BCB3;
	Tue, 19 May 2026 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779183626;
	bh=o4J6QqMYpGZvmNuQqLrqFIRgj7m9/fIFtO5TPzuauHo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oR6vMJHZ1hsZL72AJG0MkJgGa2n/YtUM32dpuHsbzYwF4H0uYIHfnCydwREwO3mQH
	 59RSQhrNfCZ9mxSbqk5WMHbJUveqd+xhOze1mf48iur17h0NVmhS/TBosAJYib0beS
	 Q2cxhihEbpbQk+aVfogepWt4oGWNxMu1MHlsUwZldkQkdf5Tj22UvVd7DF0pkdDwn1
	 IMWaV/6K5CcQdDt6YPKJMDJxVSqgznIq9dKBwUQVRXW45M6M8Td3hUr0DTWfCzN7ji
	 4aXAkmOwx8vMq+Vw8s0oQZFH7VeidG+bgPFc0LnB8ziEEvmaH7G2y4FZTGJMtP2M2r
	 QCeG9vkaY2/Hg==
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
Subject: Re: [PATCH v14 23/44] arm64: RMI: Handle RMI_EXIT_RIPAS_CHANGE
In-Reply-To: <20260513131757.116630-24-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-24-steven.price@arm.com>
Date: Tue, 19 May 2026 15:10:11 +0530
Message-ID: <yq5ay0hfspok.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_024026_975887_28D5660B 
X-CRM114-Status: UNSURE (   7.41  )
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

Steven Price <steven.price@arm.com> writes:

...

> +void kvm_realm_unmap_range(struct kvm *kvm, unsigned long start,
> +			   unsigned long size, bool unmap_private,
> +			   bool may_block)
> +{
> +	unsigned long end = start + size;
> +	struct realm *realm = &kvm->arch.realm;
> +
> +	if (!kvm_realm_is_created(kvm))
> +		return;
> +
> +	end = min(BIT(realm->ia_bits - 1), end);
> +
> +	realm_unmap_shared_range(kvm, start, end, may_block);
> +	if (unmap_private)
> +		realm_unmap_private_range(kvm, start, end, may_block);
> +}
> +
 
kvm_gmem_invalidate_begin() indicates a private-only invalidation. How
is that supported?

-aneesh

