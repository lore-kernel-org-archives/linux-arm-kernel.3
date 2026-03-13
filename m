Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53409105F781
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VUGb2Y1paTKp+Sa/bAh0fWvLo77hq2x/hm1Zugb16KI=; b=P+g9icWU+vfe4o0q4pVUg/tRQf
	it6SGGEYSr6kB/NQCrnKNprOSU9tUBAQQ2hfZQ1mggRZCPbUr0idLdueSwPGQTlT/0lQIw5nP6ACS
	BBL9Mt6KgPCQff3drQp7LRxNZROd4IU+vhkChqvef+JbFJ+t8ODLoldSZbSEqWiD4Ml/TLzgo/Rab
	QzEisQEtplLvzw+pg5KGjkguyTjvEI/oaLycz6O2hoHslTKTyRe2vhOrKnIA04GrWzlrjhFaQSFrk
	Qvu5I79xj26cSRtvfbY1nAFAXddSa4Kuiqs+Kwc42l2UHn6stdkTKQ614sCwkVb3BwKW50DOrEMN2
	/9UtQ4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z9E-0000000HQSG-30En;
	Fri, 13 Mar 2026 09:49:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z9D-0000000HQRb-1o7Q
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 09:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VUGb2Y1paTKp+Sa/bAh0fWvLo77hq2x/hm1Zugb16KI=; b=GZmBeZu9Ae92Yr9Sab3e2bz4UC
	4H9qikN9Jd8Y3hne/xJtnEgVm/bq41FwtlMCifekHjveyW5vohjqWEPp1XgNJrM514ifiL5erEEnT
	VUnUGfEs+6hqfKMEiqnVSRQ1RASUg3YGivQnmFCau+sIfCST0rCk0KbrK3SSYWr73gjlibZFsMZM6
	s25ydodH2PnjpERpQ9wtPkbB1qLXj5kG1Cn54eRxRj/0kfBWHDQC7BBc2eBMle+39bHAUZaq8l7yB
	Oo00DPFUR2NKWVrcR7N64DxJrhgVxzhh/sc6zELOElOJv+AEsAwe6dwe8v+giSKGxNVf4tmcZbKu2
	05QzLrVQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z9A-000000030cI-1gpP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2876643FDB;
	Fri, 13 Mar 2026 09:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6D0C2BC87;
	Fri, 13 Mar 2026 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773395371;
	bh=rUQb+Z8XCOJJahxSZ1DbE4oOFCh6UGrqUYNgYHqSvAc=;
	h=From:To:Cc:Subject:Date:From;
	b=FOFe69m1WQfLhVow/0Ckx8JOq7W24G+NglJ4NKzNaolAFffFHSiFOHMKX1KnAOyp2
	 DPiVvZfYC9fp7NYsn+Rg0wFPY89hoJv0M8r7kc64yKHjP+gVS/mf6qr6jtezqWSoCX
	 gUGxAz8O7vTGBLzXDzlfas+C1Hsg0t4fTaTQ+zJLtn0YMTNh4yWau+TgDeZv92ZUsQ
	 ugT/wNX90RTDc64tOcq3B51ufIG7syS7EigPbQnZaME0q5IIoehOuWiKlda494jEml
	 X3tAAumWhc7XYRxSkIiJY8sR54prjDVQeXZwe2YvyiylIw0gNJpcPT4f3QNa5y9F/5
	 kfev1hEH9EBOw==
From: Arnd Bergmann <arnd@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: avoid unused-variable warning
Date: Fri, 13 Mar 2026 10:49:16 +0100
Message-Id: <20260313094925.3749287-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_094932_669076_A1580674 
X-CRM114-Status: GOOD (  10.99  )
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

From: Arnd Bergmann <arnd@arndb.de>

The 'cpu' variable is only used inside of an #ifdef block and causes
a warning if there is no user:

arch/arm64/kvm/hyp_trace.c: In function 'kvm_hyp_trace_init':
arch/arm64/kvm/hyp_trace.c:422:13: error: unused variable 'cpu' [-Werror=unused-variable]
  422 |         int cpu;
      |             ^~~

Change the #ifdef to an equivalent IS_ENABLED() check to avoid
the warning.

Fixes: b22888917fa4 ("KVM: arm64: Sync boot clock with the nVHE/pKVM hyp")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/kvm/hyp_trace.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index c1e28f6581ab..8b7f2bf2fba8 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -424,17 +424,16 @@ int __init kvm_hyp_trace_init(void)
 	if (is_kernel_in_hyp_mode())
 		return 0;
 
-#ifdef CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND
 	for_each_possible_cpu(cpu) {
 		const struct arch_timer_erratum_workaround *wa =
 			per_cpu(timer_unstable_counter_workaround, cpu);
 
-		if (wa && wa->read_cntvct_el0) {
+		if (IS_ENABLED(CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND) &&
+		    wa && wa->read_cntvct_el0) {
 			pr_warn("hyp trace can't handle CNTVCT workaround '%s'\n", wa->desc);
 			return -EOPNOTSUPP;
 		}
 	}
-#endif
 
 	hyp_trace_init_events();
 
-- 
2.39.5


