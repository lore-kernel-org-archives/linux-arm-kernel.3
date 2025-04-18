Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF8FC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2pfPRHCfMx1686AqGSEqHuKYU80CCi4N80MO83xG7I=; b=XkuQUXh2PEmxEK8q+YcHgNKGI3
	lLZhp2jnweqIpWs2u98n4d7eitTmAENQjen+535a6ePZVlyMtB0nPq63bSJ8W0wHS+5CE1dJTd1bC
	S6fZARerVu8MFtr56NWWfUaM88h+0wrtcIWaQo7NLQ3F4dVk4xN/FifBJjAVqZhp0cAVS6tyl2lOp
	yBMt+1O2n1DYHvFeNWc3grwWYkBWWc+V1jxtAtqPqdfnNqCVBT8FE3HXRuphuaovp0uJFO3KBT2dR
	mJ6A/dYDa/QSxERqi9hdka+DnDf5jghK/rRNnOju+Szxr/NdYyPn4GiSANtID/Qgv475JlR0ldcu+
	mjGPvYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iuO-0000000FrW9-32y9;
	Fri, 18 Apr 2025 10:25:20 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5isV-0000000Fr4P-1R1C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 10:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=I2pfP
	RHCfMx1686AqGSEqHuKYU80CCi4N80MO83xG7I=; b=jd/zPRsIE1TnNrVaNhTM3
	kxcd/WDZo5qmtQApC/AuzVD8stjDK5bIc5qM73pEmuttirjVkRsB2l5B/FHaXf3f
	1RfwQg+PvUXykIQDPNX0krnoA4YyKv2PWcw80fsxHCAv/0DrHKxyzdT9XnwiuoAp
	stDuu4DnxfMpKe+tJXWgS4=
Received: from node-1.domain.tld (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDX34b+JwJoXuTCAw--.12581S3;
	Fri, 18 Apr 2025 18:22:58 +0800 (CST)
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
Subject: [RFC PATCH 1/1]     KVM: arm: Optimize cache flush by only flushing on vcpu0
Date: Fri, 18 Apr 2025 18:22:44 +0800
Message-ID: <20250418102244.2182975-2-ljykernel@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250418102244.2182975-1-ljykernel@163.com>
References: <20250418102244.2182975-1-ljykernel@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX34b+JwJoXuTCAw--.12581S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zry8Aw4UWrWrtF1xZr47Jwb_yoW8Cw4UpF
	Z3Cw1kKw4kW34xGay7J395ur1rW395JFs8tF98Gw10vwn8Z34q9r9Yk34UAFWDGryxtF4f
	tFWavF1UZrs8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zic4S8UUUUU=
X-Originating-IP: [211.103.135.98]
X-CM-SenderInfo: 5om1yvhuqhzqqrwthudrp/1tbiYBAzbmgCJ0IXGAAAst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_032323_782119_C788FB33 
X-CRM114-Status: GOOD (  12.24  )
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

    When toggling cache state in a multi-vCPU guest, we currently flush the VM's
    stage2 page tables on every vCPU that transitions cache state. This leads to
    redundant cache flushes during guest boot, as each vCPU performs the same
    flush operation.

    In a typical guest boot sequence, vcpu0 is the first to enable caches, and
    other vCPUs follow afterward. By the time secondary vCPUs enable their caches,
    the flush performed by vcpu0 has already ensured cache coherency for the
    entire VM.

    Optimize this by only performing the stage2_flush_vm() operation on vcpu0,
    which is sufficient to maintain cache coherency while eliminating redundant
    flushes on other vCPUs. This can improve performance during guest boot in
    multi-vCPU configurations.

    Testing with a 64-core VM with 128GB memory using hugepages shows dramatic
    performance improvements, reducing busybox boot time from 33s to 5s.

    Test command:
    qemu-kvm \
        -nographic \
        -m 128G \
        -mem-path /dev/hugepages \
        -mem-prealloc \
        -cpu host -M virt \
        -smp 64 \
        -kernel ./Image \
        -append "root=/dev/ram earlycon=pl011,0x9000000 console=ttyAMA0 init=/linuxrc systemd.unified_cgroup_hierarchy=1 psi=1"

    Signed-off-by: Jiayuan Liang <ljykernel@163.com>
---
 arch/arm64/kvm/mmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 754f2fe0cc67..fbc736657666 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2300,8 +2300,10 @@ void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)
 	 * If switching it off, need to clean the caches.
 	 * Clean + invalidate does the trick always.
 	 */
-	if (now_enabled != was_enabled)
-		stage2_flush_vm(vcpu->kvm);
+	if (now_enabled != was_enabled) {
+		if (vcpu->vcpu_id == 0)
+			stage2_flush_vm(vcpu->kvm);
+	}
 
 	/* Caches are now on, stop trapping VM ops (until a S/W op) */
 	if (now_enabled)
-- 
2.43.0


