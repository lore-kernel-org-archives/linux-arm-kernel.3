Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D9DCF9C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ADVxKePBqLnp/F277W5iSk7JJ7AiK2uq8VPH9L2tmo=; b=CoK3HGLriUk2uoWsFpnCpnCVNM
	63apnX6SeWh0xBoGoXQnzg31mXwtb6no+ZnzggODk+R7gttLp6If0yzrwMcf7io368iCsceToXz0y
	OR6tCh5Te13kZtL/G9vQMWUKrIZTGt59NLmxBbwuKAx7v95115oXnRGs9uxmwpAY8nJUM9/dkXPbC
	T3pm58f9gteEE/ccnYYLPNqcGoPLvplW7//FtKA+i/r9yum2SO40fkVgidwA8tRAjvny8bsu4adTH
	LB2+neRKU6zNnsPQjvor9+oaDpXX7PLKiS4/Mj08cHm8zBrPKuplD5PuOHShcxB3KAMI+4qobknuY
	HV4pOmCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8SZ-000000078uv-1tiQ;
	Thu, 20 Nov 2025 17:28:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q7-000000075kD-1lOJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Nov 2025 17:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7ADVxKePBqLnp/F277W5iSk7JJ7AiK2uq8VPH9L2tmo=; b=gbH1FHsFlymHjknHrVkPxBhM0w
	osdDSyanP6hbH6YVrSBs0IpEJsXcPa/7VoNUOtWtzofBFg/QP6/31MaonljLKMoEo1ca0Dn7N02ra
	G2PuKc24MEt2qj3VFdBtFD3Z6L/1CNiUJJuHBjwaN/j5xB66vCdw1wg4jtej2v3DfQRDj0IZTdhwt
	VkiZ0hyE1fmmDHm6UktykaM3K3IwQcbe4+tOt54Q96VjuCWQMtrNls3noMYqI3yHhzDaaOenC4QhK
	lRzV7G+XKQ2ayvE2u1c+utlC1E9ulAVoeGUHh4WSQh5S3d1OyX5rTxQAFrT6YZTXsUMI3dyPi1WwW
	D0zLeEjw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7YM-0000000F6eH-1ezJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03E31442EF;
	Thu, 20 Nov 2025 17:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0D0C16AAE;
	Thu, 20 Nov 2025 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659557;
	bh=9zmvyJnqM1pmsDAZmL9HBzTQeKZt544wzk09PL440M8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oXJuAi0Ng0UM8uATPILI+p1EcvRTKkW1WwAgtUgGL4NwGDqabcAKNx09h51Y2NlyH
	 GjeD8M65DlydSXu+VtKf0vyt7pq6D6zTJapiFu3W5tTn2HcpWqXgniqigM3KgT9fVB
	 wF/Qh4leL6IBz5FBgF6Kw0IgCPZEreyyORGMWCV4LaK+iZ914nQEQyPbXnOB0RtEtO
	 kDh7WwGQhJokx69c4WwDTvoyAyAYX7kvX2XodZhH7L0JZLT1dKSdwwPIZl7f86DyjZ
	 bnvX5qP9yTcH/nYILAst1jZohzk084rjo92Z08ywLHwvMBPMESlAorjFh5UBTjd3zG
	 Z3nvPPSlywE/w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pr-00000006y6g-47kU;
	Thu, 20 Nov 2025 17:25:56 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 09/49] KVM: arm64: Add LR overflow handling documentation
Date: Thu, 20 Nov 2025 17:24:59 +0000
Message-ID: <20251120172540.2267180-10-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_163042_312798_F6A19B2E 
X-CRM114-Status: GOOD (  23.45  )
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

Add a bit of documentation describing how we are dealing with LR
overflow. This is mostly a braindump of how things are expected
to work. For now anyway.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 81 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 6dd5a10081e27..7ee253a9fb77e 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -825,7 +825,86 @@ static int compute_ap_list_depth(struct kvm_vcpu *vcpu,
 	return count;
 }
 
-/* Requires the VCPU's ap_list_lock to be held. */
+/*
+ * Dealing with LR overflow is close to black magic -- dress accordingly.
+ *
+ * We have to present an almost infinite number of interrupts through a very
+ * limited number of registers. Therefore crucial decisions must be made to
+ * ensure we feed the most relevant interrupts into the LRs, and yet have
+ * some facilities to let the guest interact with those that are not there.
+ *
+ * All considerations below are in the context of interrupts targeting a
+ * single vcpu with non-idle state (either pending, active, or both),
+ * colloquially called the ap_list:
+ *
+ * - Pending interrupts must have priority over active interrupts. This also
+ *   excludes pending+active interrupts. This ensures that a guest can
+ *   perform priority drops on any number of interrupts, and yet be
+ *   presented the next pending one.
+ *
+ * - Deactivation of interrupts outside of the LRs must be tracked by using
+ *   either the EOIcount-driven maintenance interrupt, and sometimes by
+ *   trapping the DIR register.
+ *
+ * - For EOImode=0, a non-zero EOIcount means walking the ap_list past the
+ *   point that made it into the LRs, and deactivate interrupts that would
+ *   have made it onto the LRs if we had the space.
+ *
+ * - The MI-generation bits must be used to try and force an exit when the
+ *   guest has done enough changes to the LRs that we want to reevaluate the
+ *   situation:
+ *
+ *	- if the total number of pending interrupts exceeds the number of
+ *	  LR, NPIE must be set in order to exit once no pending interrupts
+ *	  are present in the LRs, allowing us to populate the next batch.
+ *
+ *	- if there are active interrupts outside of the LRs, then LRENPIE
+ *	  must be set so that we exit on deactivation of one of these, and
+ *	  work out which one is to be deactivated.  Note that this is not
+ *	  enough to deal with EOImode=1, see below.
+ *
+ *	- if the overall number of interrupts exceeds the number of LRs,
+ *	  then UIE must be set to allow refilling of the LRs once the
+ *	  majority of them has been processed.
+ *
+ *	- as usual, MI triggers are only an optimisation, since we cannot
+ *        rely on the MI being delivered in timely manner...
+ *
+ * - EOImode=1 creates some additional problems:
+ *
+ *      - deactivation can happen in any order, and we cannot rely on
+ *	  EOImode=0's coupling of priority-drop and deactivation which
+ *	  imposes strict reverse Ack order. This means that DIR must
+ *	  trap if we have active interrupts outside of the LRs.
+ *
+ *      - deactivation of SPIs can occur on any CPU, while the SPI is only
+ *	  present in the ap_list of the CPU that actually ack-ed it. In that
+ *	  case, EOIcount doesn't provide enough information, and we must
+ *	  resort to trapping DIR even if we don't overflow the LRs. Bonus
+ *	  point for not trapping DIR when no SPIs are pending or active in
+ *	  the whole VM.
+ *
+ *	- LPIs do not suffer the same problem as SPIs on deactivation, as we
+ *	  have to essentially discard the active state, see below.
+ *
+ * - Virtual LPIs have an active state (surprise!), which gets removed on
+ *   priority drop (EOI). However, EOIcount doesn't get bumped when the LPI
+ *   is not present in the LR (surprise again!). Special care must therefore
+ *   be taken to remove the active state from any activated LPI when exiting
+ *   from the guest. This is in a way no different from what happens on the
+ *   physical side. We still rely on the running priority to have been
+ *   removed from the APRs, irrespective of the LPI being present in the LRs
+ *   or not.
+ *
+ * - Virtual SGIs directly injected via GICv4.1 must not affect EOIcount, as
+ *   they are not managed in SW and don't have a true active state. So only
+ *   set vSGIEOICount when no SGIs are in the ap_list.
+ *
+ * - GICv2 SGIs with multiple sources are injected one source at a time, as
+ *   if they were made pending sequentially. This may mean that we don't
+ *   always present the HPPI if other interrupts with lower priority are
+ *   pending in the LRs. Big deal.
+ */
 static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
-- 
2.47.3


