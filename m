Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FF9C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 03:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VsoqHfsy8vfIauwLVA9PKXMyNQ320v4wSTRO6evNE/w=; b=ewDe+xT0xIkaFuhW9RaR0raae8
	KzgV/NuGTgZnSOpPnpQRmDjn++aIUGdxv2Ag2v2BmrKOe48P3yTg4EZKUTaFO1FZ1kvsiCdq01BYx
	rPV61a6xt9SC/3RP0CEO1sktbdoruViu7gl8SupODUL2qpzP2KIvyH9Y1zeNDFKprYBmLphHr0ooC
	QBsFh+C94Wfmcpz9V+REDYGDSHIKiYj7/l1QAFju2GY8bb5SXmikUrHUSgDtD2yNPvznYQy705D9I
	5SPpGxqYKgXuX+CP1he+lJyW2d/aWi1ZqL5Lt4p9bnYFkmpjnnuj/I9Eb8uv9CbTNNEJ4uiMxJUtM
	h07QvBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twY9D-000000026xM-1URQ;
	Mon, 24 Mar 2025 03:06:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twY7T-000000026pE-0sFL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Mar 2025 03:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VsoqHfsy8vfIauwLVA9PKXMyNQ320v4wSTRO6evNE/w=; b=lQY/VXH2eqHgdOwdGePRAhQdZm
	MZkd13NOWxmFkwFcNJHFPG7vf95VVZHOrfwfv242/l5XahZ4KZdPCnFidaJbii+1mKfBN4nB9s9Pm
	Gmy+aFhcXiTW9MG3vo8EMMp1bORBYcsq8RrSL575kO5Bm9UV+zHhBvlyBfndlYZGvhsllc1dVfzt/
	/Qj14ZRxX30sAvsI05S/yXEqMPm9MxPxIBfrIwcw/ALxUrl/vWK67NeWkpQKL0SKgLH20eN248kPr
	v71iVUMyGq65z/GJn6NVFu0ZoI9N3KdCaOc05LcShkQY8dR0AbWLx6c9+W6CDu33/RfZr+exm4lGA
	1kR1x5bw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twXfD-000000058y7-2uWh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 02:35:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 175B5106F;
	Sun, 23 Mar 2025 19:35:45 -0700 (PDT)
Received: from entos-yitian-01.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9AB443F63F;
	Sun, 23 Mar 2025 19:35:34 -0700 (PDT)
From: Jia He <justin.he@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jia He <justin.he@arm.com>
Subject: [PATCH v2] KVM: arm64: Skip the KVM pmu initialization when hyp is unavailable
Date: Mon, 24 Mar 2025 02:34:50 +0000
Message-Id: <20250324023450.109312-1-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_023543_947818_1E1BCE11 
X-CRM114-Status: UNSURE (   9.04  )
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

When Hyp mode is unavailable (e.g., the kernel boots from EL1), skip the
unnecessary KVM pmu initialization.

Signed-off-by: Jia He <justin.he@arm.com>
---
v2: 
 - Utilize is_hyp_mode_available() for improved accuracy when detecting the
 guest VM case, as it accounts for scenarios where the kernel boots from EL1.

 arch/arm64/kvm/pmu-emul.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 6c5950b9ceac..81b1a84ee1b3 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -779,6 +779,13 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
 {
 	struct arm_pmu_entry *entry;
 
+	/*
+	 * When Hyp mode is unavailable (e.g., the kernel boots from EL1),
+	 * skip the unnecessary KVM PMU initialization.
+	 */
+	if (!is_hyp_mode_available())
+		return;
+
 	/*
 	 * Check the sanitised PMU version for the system, as KVM does not
 	 * support implementations where PMUv3 exists on a subset of CPUs.
-- 
2.34.1


