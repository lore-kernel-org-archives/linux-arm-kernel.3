Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1326FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cC8LdNPkcT/2u1+ijE6L5FTUaxOiURX2AC0fC5IpUbw=; b=izH8DGR6CnIf/a8rKjhJOEi1gh
	EW7ggwTR5MvTqu5Q+mg+eNJnV3azqqRwmApi6yImIp6CiJ/lyf0M8JUrXCc2UaOi2w/4nAwzZQgnM
	TubGC9ZuVWgaBk/mKki6iFLft2h4GYE3reRrN7eF5ZNib/1TQYYT0jxvnDEplxR3t5TNyA2zw8Li3
	s+vUZ4Cp+myyH7MGvMMvyTMX9GB7UdoYtSpH2E8vOlflryqsIRB4x8gJksNywvP2HeOB5ePXKujWG
	H66ZEVTVUadnGiQiRbNVftcatb43Zr+D0noUsNO+oNANkyPIiqPHpnpQFmHpa9rN1uN3kbx5ZOnju
	U594Hc8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iwD-0000000Frly-1vn1;
	Fri, 18 Apr 2025 10:27:13 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5isX-0000000Fr52-0ows
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 10:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=cC8Ld
	NPkcT/2u1+ijE6L5FTUaxOiURX2AC0fC5IpUbw=; b=hQtio7i45XsBdvW0furfB
	S0+QnlQmxaNRB/LCk5JO73Oocg/f0lT84+GA80l0WE3F1oCuou/OVB4/d7FIGkvR
	LTsmZbJzVQrOGn4uOR61CIWAR7rae++EDhf3uquLh6HGyc+HfpJ5HyiHqnjJKgP6
	zUV/8hUheMNSZu0MOq/ksI=
Received: from node-1.domain.tld (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDX34b+JwJoXuTCAw--.12581S2;
	Fri, 18 Apr 2025 18:22:56 +0800 (CST)
From: Jiayuan Liang <ljykernel@163.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayuan Liang <ljykernel@163.com>
Subject: [RFC PATCH 0/1] KVM-arm: Optimize cache flush by only flushing on vcpu0
Date: Fri, 18 Apr 2025 18:22:43 +0800
Message-ID: <20250418102244.2182975-1-ljykernel@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX34b+JwJoXuTCAw--.12581S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr15ZF4kXFy3CF48uF1kGrg_yoW8AF1fpF
	WkA3sYgr4kW34fu3WUJ3yvgw1rGrZ5GFs8JFn8Aw40krs8A3Wvkr9ay3yUZFWUGF95tr47
	GrWqqFyDZrn0yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_YFCUUUUUU=
X-Originating-IP: [211.103.135.98]
X-CM-SenderInfo: 5om1yvhuqhzqqrwthudrp/1tbiSg0zbmgCIJDq2gAAsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_032325_626508_AEF1D196 
X-CRM114-Status: GOOD (  10.73  )
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

This is an RFC patch to optimize cache flushing behavior in KVM/arm64.

When toggling cache state in a multi-vCPU guest, we currently flush the VM's
stage2 page tables on every vCPU that transitions cache state. This leads to
redundant cache flushes during guest boot, as each vCPU performs the same
flush operation.

In a typical guest boot sequence, vcpu0 is the first to enable caches, and
other vCPUs follow afterward. By the time secondary vCPUs enable their caches,
the flush performed by vcpu0 has already ensured cache coherency for the
entire VM.

I'm proposing to optimize this by only performing the stage2_flush_vm() operation 
on vcpu0, which is sufficient to maintain cache coherency while eliminating redundant
flushes on other vCPUs. This can improve performance during guest boot in
multi-vCPU configurations.

I'm submitting this as RFC because:
1. This is my first contribution to the KVM/arm64 subsystem
2. I want to confirm if this approach is architecturally sound
3. I'd like feedback on potential corner cases I may have missed:
   - Could there be scenarios where secondary vCPUs need their own flushes?
   - Is the assumption about vcpu0 always being first valid?

Implementation details:
- The patch identifies vcpu0 by checking if vcpu->vcpu_id == 0

Testing with a 64-core VM with 128GB memory using hugepages shows dramatic
performance improvements, reducing busybox boot time from 33s to 5s.

I'd appreciate any feedback on the correctness and approach of this optimization.

Jiayuan Liang (1):
  KVM: arm: Optimize cache flush by only flushing on vcpu0

 arch/arm64/kvm/mmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)


base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
--
2.43.0


