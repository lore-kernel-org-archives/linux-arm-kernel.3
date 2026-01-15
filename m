Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C1FD41147
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nt6trYvcQ2wcehBeJ7OqPcjIxUiuzXMHyCLJKQwqa/Q=; b=E0z3fQ7hqH2rciLp/vCB1CRZcF
	jd9wxf75kxBBxg4H91AwKnWfBXGZE59jFCRa2XbodKT8nctrKnWHjLcnb0sB+Fcf/I++bMTzdhZr2
	7UeZ63U+D9KSsolRxmjJCAoC3UJbEdFXV1ITYTovSazvhqhzrgS3x00ZFVO70LlxLXQx1xlHsAMfS
	Dn0d/hkBTzlv4KOKNLyATgXCRXCiU6C3O/KwYr2eZzQs0WT7AKZzGBtw0WfNnX1qwRnp6o/j23PZL
	IeE3PaWMG2cquyGAb5UHV5bSX6qNkV0Ol51PKBFP/lbVbxysB4164acswqkyaakVJE6X4k4qf+ckp
	QfdnPLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJ58-0000000C1hv-3wUn;
	Thu, 15 Jan 2026 08:51:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJ55-0000000C1hY-2nfd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 08:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AF9840A3E;
	Thu, 15 Jan 2026 08:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD87FC116D0;
	Thu, 15 Jan 2026 08:51:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lifeng Zheng <zhenglifeng1@huawei.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: topology: Do not warn on missing AMU in cpuhp_topology_online()
Date: Thu, 15 Jan 2026 09:51:45 +0100
Message-ID: <a8dbf49bfa44a6809fa4f34b918516847dc14460.1768466986.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_005151_768067_E484ACE5 
X-CRM114-Status: GOOD (  10.84  )
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

When CONFIG_CPUMASK_OFFSTACK is not enabled, and resuming from s2ram on
Renesas R-Car H3 (big.LITTLE 4x Cortex-A57 + 4x Cortex-A53), during
enabling of the first little core, a warning message is printed:

    AMU: CPU[4] doesn't support AMU counters

This confuses users, as during boot amu_fie_setup() does not print such
a message, unless debugging is enabled (freq_counters_valid() prints
"CPU%d: counters are not supported.\n" at debug level in that case).

Hence drop the warning, freq_counters_valid() has already printed a
debug message anyway.

Fixes: 6fd9be0b7b2e957d ("arm64: topology: Handle AMU FIE setup on CPU hotplug")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/kernel/topology.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 539b3893518281ec..3fe1faab03620e78 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -332,7 +332,6 @@ static int cpuhp_topology_online(unsigned int cpu)
 	 * may use different source of the freq scale.
 	 */
 	if (!freq_counters_valid(cpu)) {
-		pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);
 		topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,
 						 policy->related_cpus);
 		cpumask_andnot(amu_fie_cpus, amu_fie_cpus, policy->related_cpus);
-- 
2.43.0


