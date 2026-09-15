Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5327BC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 22:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzbNWZ8TFIHeY8QtO5t5YQsgg2SPGjQY6QoCB/NWVow=; b=ey2lpO/takfTpKn6v0fvXHknJN
	M6jKRXvohVQvgFxgxukWtV+U5POsQUlVMt/w48oGG4bpvuBhyuH0ywX34LDFnuKQ+yS5oNQO0tQiM
	nEHIpA5AJXnPUVsIQJNXE+Z124wyHO01kCeDL2hJuJQKE54p6XSCpKnRgXWvF9c5m5FDeAZejVQAf
	E3LfNvlPh0d21CYP0J0yKvfBZYYXnrERRz7jM84Oihmq607wijK0yVHntcvFfTcBvFVMtYsInBiVU
	a5pmcColpU1VXE/RXJkRDSX45z2Oc7599t/Y65euJ0RuxEbcRjeYPn9QuyzE0MLCMr3toDQGeHgfL
	a61cEnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bbV-000000080My-3ntH;
	Tue, 15 Sep 2026 22:26:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bb0-000000080J3-3iNv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 22:25:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A479541670;
	Tue, 15 Sep 2026 22:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABC91F00893;
	Tue, 15 Sep 2026 22:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789511146;
	bh=RzbNWZ8TFIHeY8QtO5t5YQsgg2SPGjQY6QoCB/NWVow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JfA4ZVLW8tvxWuCKYaVYsUau/0DpqInwAIrAq4bElIHA6tnZFTT1Ae4ogsIepzgdt
	 7OQQIUslTABAz+o6gDciJrZJabDdjoeUYfrijg8BbOlPzMO4wHzaGl7dlVDxWjJDuZ
	 rxjzRaXOb6UXmTSK7G89MrlvxdfVn6fQfhY7RxLXjfVKJXr7R/0s65kIhkdkRtHDHC
	 l3JXCKJY1B16OVHMb/tIDLSe10Cq43+V5j9JXxGtPmQla4x3jwK3iQOTiILKos7CWh
	 rYAMub7uxIREDt2UglcSc7J35RCgDUM0VI2oDEghFnzjF+MP5lSjVRH1dXt5Mo7c/G
	 /XV+mTBfwoQbA==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Don't WARN on an unknown VM ioctl in protected mode
Date: Tue, 15 Sep 2026 15:25:35 -0700
Message-ID: <178951103692.10790.7627884400333495166.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914093838.1082637-1-fuad.tabba@linux.dev>
References: <20260914093838.1082637-1-fuad.tabba@linux.dev>
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

On Mon, 14 Sep 2026 10:38:38 +0100, Fuad Tabba wrote:
> kvm_pkvm_ioctl_allowed() WARNs when kvm_get_cap_for_kvm_ioctl() doesn't
> find the ioctl number in vm_ioctl_caps[], and kvm_arch_vm_ioctl() calls
> it for every number the generic code doesn't handle, so
> ioctl(vm_fd, 0xdeadbeef) from userspace taints a pKVM host and panics it
> under panic_on_warn. The lookup is fed userspace input: return false,
> and userspace gets the -EINVAL kvm_arch_vm_ioctl() returns for that
> number on a host without pKVM.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Don't WARN on an unknown VM ioctl in protected mode
      https://git.kernel.org/kvmarm/kvmarm/c/49d9d295d69d

--
Best,
Oliver

