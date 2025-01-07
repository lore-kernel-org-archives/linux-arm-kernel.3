Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98751E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W9Q7e0Eyf41mZzvfomB9qwYrTCLKcyHFYIEnrYNurLQ=; b=YWNnD2TLTvo5sn
	luZWdUHHD4uYYkFcVafZ5AUA94/22U2CWm08GSq8IsnYxndXxsUb+dEFRBiZ8/9Uioc5Ft8GzJ1pV
	qa4/g5KKLmrSWIt8u1vXRwQ8s9/p8t50pH+nurKPW2UQH+TbT0yt+BzB1F+rs6OGQ72J1pk2yeTrS
	xwcNavIJlOQMO75+VyHt6JwXlxRmvMNEBm43sne3rcabsO3QyhD0QwMPMnGWEjCO7iQLbHVV492yM
	7HAMMmqfRM0OVNls1VHK65w1ta7Ntg4HBecplhdC0RCft+XpRSkXkkrmx0bMklGN7AtkdByPy34O6
	M9+FmQHqSa8uZcj5Cwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDrY-00000005wIh-2jRT;
	Tue, 07 Jan 2025 17:59:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDq0-00000005vqX-3O2R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19FD15C596B;
	Tue,  7 Jan 2025 17:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF014C4CED6;
	Tue,  7 Jan 2025 17:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736272675;
	bh=tnIMFtTngfyPCytSGWtbdqu6kbf4sZLjpE8NlRTHRyk=;
	h=From:Subject:Date:To:Cc:From;
	b=Z4dt3iIgZ7QuZRyHT5VNgetsfmO3KGL1SIpkJHWc6bXNwLrjWiWIAdyWBSPVyWUM+
	 4Z/u+ayvnVW4G4aj1+QTrzOOdmbi53XTeszEK8U9rPw0q0MpjgD08fcpct34CtgcOG
	 3t00tRuFno3gEr2InRiX9YKQxE9ezif/aHX6CyB8Q46wZnXUup40Y16RzHDQxFcSX9
	 4ZWmfNr2jefVvdyAx56YJ9LRDxXGSoKjz3nq5lj27dsQu7jvPfNWxKgYzPGp8iaRre
	 G5aGbFkMSEf347+cyV/vBChF2UnB5QKNTowxN1zyEviyXOvWoLclILv7lHPLiV01Cg
	 I08dIQJmaX1uw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/7] arm_pmu: Counter enabling clean-ups
Date: Tue, 07 Jan 2025 11:57:18 -0600
Message-Id: <20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP5qfWcC/x3MQQqAIBBA0avErBvQSouuEi1EpxooEyUJorsnL
 d/i/wcSRaYEY/VApMyJT18g6wrsZvxKyK4YGtEoIUWPJh4YjgvtTsZfIWGW2OpuUI7soHsHpQy
 RFr7/6zS/7wcfgiiFZQAAAA==
X-Change-ID: 20250107-arm-pmu-cleanups-v1-36485dec867d
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_095756_891730_FA235423 
X-CRM114-Status: GOOD (  10.70  )
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

This series of clean-ups is in preparation for BRBE support, but are all 
valid on their own. Mark started on these and I have since picked up 
working on BRBE. I've pulled these out of that series as it is not 
looking like BRBE series is going to be ready to send out again before 
next cycle. Hopefully these can go into 6.14.

The first patch reorders kvm_vcpu_pmu_resync_el0() call to avoid 
counting it. In testing BRBE, the call to it showed up in the branch 
recordings.

The next 5 patches drop disabling the counter before enabling it as 
that's redundant. Mark did that for arm_pmu and pmuv3. I found a couple 
more cases in armv7_pmu and apple_m1. 

The last patch simply reorders struct arm_pmu to group pmuv3 specific 
fields.

Tested pmuv3 on FVP and armv7pmu on qemu. 

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Mark Rutland (3):
      perf: arm_pmu: Don't disable counter in armpmu_add()
      perf: arm_pmuv3: Don't disable counter in armv8pmu_enable_event()
      perf: arm_pmu: Move PMUv3-specific data

Rob Herring (Arm) (4):
      perf: arm_pmuv3: Call kvm_vcpu_pmu_resync_el0() before enabling counters
      perf: arm_v7_pmu: Drop obvious comments for enabling/disabling counters and interrupts
      perf: arm_v7_pmu: Don't disable counter in (armv7|krait_|scorpion_)pmu_enable_event()
      perf: apple_m1: Don't disable counter in m1_pmu_enable_event()

 drivers/perf/apple_m1_cpu_pmu.c |  4 ----
 drivers/perf/arm_pmu.c          |  8 +++----
 drivers/perf/arm_pmuv3.c        |  9 ++------
 drivers/perf/arm_v7_pmu.c       | 50 -----------------------------------------
 include/linux/perf/arm_pmu.h    | 13 ++++++-----
 5 files changed, 12 insertions(+), 72 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20250107-arm-pmu-cleanups-v1-36485dec867d

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


