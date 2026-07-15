Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2F7C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DR+pvW4EsCycgYEFvfd5k5NgYUoYOtxUYUldfNIACIE=; b=0ouVhQAseAO9P1zmBqJAgJFtJD
	bcSpErIX1NdGDFSWd83ouSdcv1DRTG6oLuO980fArH7vzF9qtUXM4Qa82J2Wy9trVUBmJgsCD3m+k
	sIyLUa1mMZldu5RzfK4yUyyjLqaQeO3CTJON4PJqVRWzbz6AdKM9c+OqYcH5Sqk3CK3TjyYN33VZI
	/cvCS5j3od3LDzCMHwxrrBfBvcdeprT32QqMJFHy3nVHANOYuhE/q5tMcxgYHmuOsXe3QiYqVsNAU
	CCPUsFvdWgFyAv/xm55ymsTFFGXDlXVidHHXIepWabLuszYdwRFxcoE9XUCIwPMQ6rsRCfIAUUDI4
	INlgf4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuVD-0000000E5O9-1SSf;
	Wed, 15 Jul 2026 07:57:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuVC-0000000E5Nw-1JEq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:57:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF08740A1A;
	Wed, 15 Jul 2026 07:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AA01F000E9;
	Wed, 15 Jul 2026 07:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784102277;
	bh=DR+pvW4EsCycgYEFvfd5k5NgYUoYOtxUYUldfNIACIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H2+DH64e5dAyDit55c5haPRKvxjv+dG1pqKxE7Ft4VqzcD96nCOLXgOeCmfMwKBxm
	 cJR/iNjYxRPYQJz6RrndajgOkH2jfZu4vpYCdJz0KcH0GWTwDj01OjBBpF2kA9ewsF
	 Q9ivDceRKMQ4ui6zVteEE3edaC8BqWq72XkmLdxj+4MewO2byLkNe3bQfOGqxqU8sn
	 TE1jAtY+hE73VoYMsaNYwUfvAByGuutFlG0nCPbXujJSS1RUQhEgj080iAirzeXsce
	 hsEUPEtUHsaN/Xk+4BUb8J9POqa2kvey79Q9e6bmfVZSxUt7fGPhQ3e5SwOt2uouxd
	 /1kOjMv5md5cg==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Keir Fraser <keirf@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] KVM: arm64: Tidy up is_created
Date: Wed, 15 Jul 2026 00:57:54 -0700
Message-ID: <178410226173.1693421.13945529652068436522.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706103129.706974-1-fuad.tabba@linux.dev>
References: <20260706103129.706974-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 06 Jul 2026 11:31:26 +0100, Fuad Tabba wrote:
> Changes since v1 [1]:
> - Carried Keir's Reviewed-by. No code changes.
> 
> This small series tidies up the host-side kvm->arch.pkvm.is_created flag,
> which tracks whether the hypervisor-side (EL2) VM has been instantiated.
> 
> It comes out of the ongoing pKVM (protected KVM) upstreaming work and runs
> in parallel with it. The changes only remove dead or redundant code around
> the flag, not any of the functional paths that work touches, so there is no
> dependency in either direction and the two can be applied in any order.
> 
> [...]

Applied to next, thanks!

[1/3] KVM: arm64: Drop the unused EL2-side is_created write
      https://git.kernel.org/kvmarm/kvmarm/c/581829501360
[2/3] KVM: arm64: Remove unreachable early checks in pkvm_init_host_vm()
      https://git.kernel.org/kvmarm/kvmarm/c/9b36eda4dfe0
[3/3] KVM: arm64: Drop redundant READ_ONCE() in pkvm_hyp_vm_is_created()
      https://git.kernel.org/kvmarm/kvmarm/c/008ea7a6aa01

--
Best,
Oliver

