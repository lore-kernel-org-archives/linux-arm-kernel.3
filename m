Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07268E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 22:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eJTTDJmqLymoNkdRC+AVperlrWlU0YZNLMNy9tALto8=; b=HLqb1MxLBOhceFdCNqJV1vdK6T
	FQEYv9EM/qHfqRe45gRNAPHzyh87s2Qbu6EUOhr3QCqnyaNUKEsWI/DAgC/HAaQHEwfH+IiIc6rSj
	uM3R+N+ocwsl4JMXKTVIuO8jyDZRiFW1FEGfvdzgi13gkMXxlSW3Pv3aIIhg7V03MTv/+TKNWrfP6
	UoeTSxi2yt9uaTQVTO/0NsLT19ucH8QS3sSzeIsAx7m89/exQSn7ag1YTCbA9jGZXbqPGVSwez2ze
	gY+faB788dVyY6pIAj4IXX4B9WOS2igMYqY44xE3MT6k1G6ULp+UeuxjdasgUZXRhJPdFmX9KVr7X
	7Rvg22MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWNuL-0000000HCQz-3OBN;
	Fri, 10 Jan 2025 22:55:13 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWNt7-0000000HCJ0-1O1X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 22:53:59 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736549629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eJTTDJmqLymoNkdRC+AVperlrWlU0YZNLMNy9tALto8=;
	b=rxRidBOWYfEutC16dOZAuW3ZTMoV+kHg5ik3aLx5CZRtabjkTcVS5FGW1ERMCF3/hv7ZbF
	PeKpOjRfUnU5KhiGJz5Pe3ErFWQUT2PHVkQ+IkOwQ3eBdCo4hTK232/S823GL6PC+RP4Qx
	VROEmT7dSLG0nXwNUfQMrQhd8dtSHzI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sebastian Ott <sebott@redhat.com>,
	Fuad Tabba <tabba@google.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: vgic: Use str_enabled_disabled() in vgic_v3_probe()
Date: Fri, 10 Jan 2025 23:53:09 +0100
Message-ID: <20250110225310.369980-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_145358_020578_B0B31FD5 
X-CRM114-Status: UNSURE (   8.87  )
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

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index f267bc2486a1..528ee93fefd4 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -6,6 +6,7 @@
 #include <linux/kstrtox.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
+#include <linux/string_choices.h>
 #include <kvm/arm_vgic.h>
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
@@ -663,9 +664,9 @@ int vgic_v3_probe(const struct gic_kvm_info *info)
 	if (info->has_v4) {
 		kvm_vgic_global_state.has_gicv4 = gicv4_enable;
 		kvm_vgic_global_state.has_gicv4_1 = info->has_v4_1 && gicv4_enable;
-		kvm_info("GICv4%s support %sabled\n",
+		kvm_info("GICv4%s support %s\n",
 			 kvm_vgic_global_state.has_gicv4_1 ? ".1" : "",
-			 gicv4_enable ? "en" : "dis");
+			 str_enabled_disabled(gicv4_enable));
 	}
 
 	kvm_vgic_global_state.vcpu_base = 0;
-- 
2.47.1


