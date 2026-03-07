Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41668FC9EFB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 12:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XQD1v2qhVZp8NhPQPu8txdDVmzh6ba/4NY1ZmUZwUTc=; b=Sy52zcRMJIEFkfgS/NzSVwDyVH
	7OvUJK9wrrFtEb0rq+sImjTwTe7goS2dGfMzzVlJiTENl63yyJMvA2e90IoeAVUHY0WCh91otXd6+
	y4gSw2mshW++abqVI/C3DYLMDL+4mH7f6+KwSkisdKT/vk/3quZJ9IDkXrHiTXGB23CaMzeTbp7o/
	Bbfl3blnHrUNqh7KzZdoY6j/p/bHgVjgzQDCea698HX/lWSPtuopzbOdZi8Mc44lWNKPCNUsF/dxI
	ErxyhFe/2NNSF2VJoBwEkcRHpv7JjBOyZZB13x11Tcp6PzFYqagf1rd/+whkr82LG8z1GXi88aRuy
	2VjlRxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyqMi-00000005Aun-0JPm;
	Sat, 07 Mar 2026 12:02:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyqMd-00000005AuS-3ySD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 12:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772884951;
	bh=ZMGMoK71DW20ifGmPRAf0tsM9kerlbBDYGNdYE6Seuk=;
	h=From:To:Cc:Subject:Date:From;
	b=UJB3qnuXI42oSBRk7xI1SOpFfXw381UJW+gSgAWuqkwXiXKeDrKfy5IB533dkr+xb
	 62gAw8gDof7m7vhVQLFudvWzXLXOqXc/QneNxxxnBN01O/nD+0f0rtkOA5lA1R3fA8
	 AHj+714VMoBUtxPXPMThbMrbPThEFnBqQG/uJMb3ZCaJMohZADOEWa+n5dLKXHOaqo
	 C+mnP80vwN0VOXMsQcOA2bFPVBoljmJW4UFsRFqQDZfpUJj9Mo5rPx6Q3ld1lhzvfO
	 5+1BXaZYyy4NMSYHggb5dNNimDURXiVkkB3sWqAeSFY+5RQGICdNM/glOw/YgAd+xg
	 GBD0YtA9JMjFQ==
Received: from thinkpad (20014C4E2782E40079F207E35B989CE7.dsl.pool.telekom.hu [IPv6:2001:4c4e:2782:e400:79f2:7e3:5b98:9ce7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: valentine)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 33A4317E12A2;
	Sat,  7 Mar 2026 13:02:31 +0100 (CET)
From: Valentine Burley <valentine.burley@collabora.com>
To: maz@kernel.org
Cc: tabba@google.com,
	broonie@kernel.org,
	Valentine Burley <valentine.burley@collabora.com>,
	stable@vger.kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Sascha.Bischoff@arm.com,
	sebott@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: Skip interrupts in LRs during EOIcount replay
Date: Sat,  7 Mar 2026 12:59:50 +0100
Message-ID: <20260307115955.369455-1-valentine.burley@collabora.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_040237_646689_CA24D535 
X-CRM114-Status: UNSURE (   9.57  )
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

Commit 05984ba67eb6 ("KVM: arm64: Invert ap_list sorting to push active
interrupts out") allowed active interrupts to be evicted from LRs to
make room for pending ones.

When an evicted interrupt is deactivated by the guest, the GIC
increments EOIcount. KVM replays this by finding an active interrupt
in the ap_list to deactivate. However, the replay logic may pick an
interrupt that is currently residing in an LR, leading to a spurious
deactivation and leaving the actually finished interrupt active.
This results in interrupt storms and boot failures (seen in Cuttlefish
guests on Qualcomm SC7180).

Fix this by skipping interrupts that are currently assigned to an LR
during EOIcount replay.

This allows booting Android VMs in Cuttlefish again.

Fixes: 05984ba67eb6 ("KVM: arm64: Invert ap_list sorting to push active interrupts out")
Cc: stable@vger.kernel.org
Signed-off-by: Valentine Burley <valentine.burley@collabora.com>
---
 arch/arm64/kvm/vgic/vgic-v2.c | 14 ++++++++++++++
 arch/arm64/kvm/vgic/vgic-v3.c | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 585491fbda80..821cf5bc30da 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -135,6 +135,20 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 			      irq->active))
 				continue;
 
+			bool was_in_lr = false;
+
+			for (int i = 0; i < cpuif->used_lrs; i++) {
+				u32 intid = cpuif->vgic_lr[i] & GICH_LR_VIRTUALID;
+
+				if (intid == irq->intid) {
+					was_in_lr = true;
+					break;
+				}
+			}
+
+			if (was_in_lr)
+				continue;
+
 			lr = vgic_v2_compute_lr(vcpu, irq) & ~GICH_LR_ACTIVE_BIT;
 		}
 
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 1d6dd1b545bd..00d9bc39bffb 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -179,6 +179,25 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 			      irq->active))
 				continue;
 
+			bool was_in_lr = false;
+
+			for (int i = 0; i < cpuif->used_lrs; i++) {
+				u32 intid;
+
+				if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3)
+					intid = cpuif->vgic_lr[i] & ICH_LR_VIRTUAL_ID_MASK;
+				else
+					intid = cpuif->vgic_lr[i] & GICH_LR_VIRTUALID;
+
+				if (intid == irq->intid) {
+					was_in_lr = true;
+					break;
+				}
+			}
+
+			if (was_in_lr)
+				continue;
+
 			lr = vgic_v3_compute_lr(vcpu, irq) & ~ICH_LR_ACTIVE_BIT;
 		}
 
-- 
2.51.0


