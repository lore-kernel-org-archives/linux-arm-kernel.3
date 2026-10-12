Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931BCCA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G4FoOdOatVsgAmxetyPEwa2/gwnBhvGjHCPnwiX3txg=; b=KqjZn5FAm1j2mK1aKaFjSYdFAo
	rCVqw9MY+0J5hEnxsAUryNdO1R/4cHfZSN9yg/sunBXbFrlXaAed9/ebzUAAfQB8F6ipdutlR1veU
	fmNWOlybgt507XDpT7840ldkJg/SMvcKHEukQWg0y3XphuaJJ73OTKt3S6l2JxiqbJk0ADvtGb/dt
	vsNQq5LhODEbSMOoaeVS/qynVueqqyKbos3UUQii3Q7EjIsIpO6jq9vk9zrJOCHpI3iBkniNDs6kk
	dFZyOeq0iftoIn/1PU1KkFpgv10wI0pr+XT0kofSKEdQE9e1aBCt66saTSv90JVRFe3NP2VfTU0RS
	va5t3VDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIgW-0000000Aw2t-27Bs;
	Mon, 12 Oct 2026 16:15:32 +0000
Received: from out-65.mta0.migadu.com ([2001:41d0:1004:224b::41] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIgS-0000000Aw1E-0LhA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:15:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=g6cSCDmIiMeFVv+t4Y6Wg9H08beduiIxXPLZlypaYk8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791821725; v=1; x=1792426525;
 b=EcnNG0ySDPJM6Yhx3IcShUu7OXspr8PWmxfYi0iRmo0KAzvgxh7ERUNbvcWuShtJjBNr0bad
 vWWKz3D22RpAfdTVKose/1UPb+1vGDZ1T6hV47XO546sHvY9xevN6/bjzUDJpHyr8EzD8GjN1pF
 I7c/5mXBiliszHvHh5LX+YQA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7c027d74522afa10;
	Mon, 12 Oct 2026 16:15:24 +0000
X-Mizu-Trace-ID: 7c027d74522afa10
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	Sascha.Bischoff@arm.com,
	steven.price@arm.com,
	tabba@google.com
Subject: [PATCH v3 0/5] KVM: arm64: pKVM host hypercall and GICv5 CPU interface fixes
Date: Mon, 12 Oct 2026 17:15:19 +0100
Message-Id: <20261012161524.4016464-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_091529_794878_C7E0A6C5 
X-CRM114-Status: GOOD (  11.39  )
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

Hi folks,

Changes since v2 [1]:
  - Patch 4 now allows only GICv2 from EL1 and requires VHE for every
    other CPU interface, instead of adding GICv5 to the VHE list. Same
    behaviour; I kept Sascha's Reviewed-by. (Marc)
  - Added Suzuki's Reviewed-by on patches 1-3.

Thanks Suzuki for the reviews.

Patches 1 and 2 move the GICv5 CPU interface save/restore and the
stage-2 flushes into the band the dispatcher rejects once pKVM has
finalised, since the host has no use for them in protected mode.
Patch 3 validates the vgic model EL2 copies from the host. Patch 4
stops nVHE from accessing the GICv5 CPU interface from EL1, and patch
5 fixes two stale comments.

The GICv5 residency and VDPEND hypercalls in kvmarm/next still check
for pKVM in each handler. I'll move them into the same band once this
lands.

Based on Linux 7.3-rc3 (fd73f4a665989). On kvmarm/next, patches 1 and
2 have a minor conflict: new hypercall IDs sit next to the ones they
move.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261011143648.211337-1-fuad.tabba@linux.dev/

Fuad Tabba (5):
  KVM: arm64: Reject the GICv5 CPU interface hypercalls under pKVM
  KVM: arm64: Reject the stage-2 flush hypercalls under pKVM
  KVM: arm64: Validate the host-provided vgic model in pKVM
  KVM: arm64: vgic: Do not access the GICv5 CPU interface from EL1
  KVM: arm64: Fix stale VGICv3 comments in the nVHE world switch

 arch/arm64/include/asm/kvm_asm.h   | 16 ++++++++--------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 15 ++++++++-------
 arch/arm64/kvm/hyp/nvhe/pkvm.c     | 10 ++++++++--
 arch/arm64/kvm/hyp/nvhe/switch.c   |  4 ++--
 arch/arm64/kvm/vgic/vgic.c         |  7 +++----
 5 files changed, 29 insertions(+), 23 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


