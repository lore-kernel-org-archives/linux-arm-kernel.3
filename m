Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E306AC61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJiMZaUffWiL8j6SvXTcbl1FPBgJTBk4CSGKpcGohmQ=; b=ww0Rrp6/BHoY/ZKKYuiKbMipQN
	8q7I3kg0TSrIh3RFaWojfWpikLk0NSIS0wDzccXLiiHNAMiGXjC6SsE5zb0c9CdCC8NMyKrdrmfvj
	odK0Ttw5tYreLp8Kay0pKG7mROdnewO5iMlj3Vn4OKD04/sWhRfFLIYPTUdpF+6YnoI+K5aaoRuWM
	leXJOQT0R8otgBFg8ElSfBc/NYawZsv/sptMEhMBf2X+e49N9DcXA4lAHDOdSjNM/T9DON0gYsVb7
	IWhpUUc7TkMWelufDa19NUJKKkpCxVfta5OaFC2OWHKebFgHEifIv7C3Dl50GLymS9Jvhh5Pj1dTP
	dfLLVo4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyn0o-00000000RRq-04Mr;
	Tue, 25 Aug 2026 09:00:06 +0000
Received: from out-125.mta0.migadu.com ([2001:41d0:1004:224b::7d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyn0f-00000000ROJ-2QGo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 09:00:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=MSUuQABVVUc6gwSvoRq9rt/EUbCdwq4ILWrmprQ0Dzo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787648395; v=1; x=1788253195;
 b=jgkIIzZ0XypmlQHdcS+BIeouet3Ll7e9QuqukDEJOJq/pV4OcSk1HB7U9TR6XMSqoAeyt7nk
 ljke+jZ8poO13AaGJBl7+h/sIxhjozVGOzW7X5938qmGD0UBJnrmYtC9vs6phx0jFyCFTyLFNC/
 0jiwdU3NqPP5M6o5iqToBe+I=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.local (2a01:4b00:ad36:1d00:3a05:25ff:fe33:35a9)
	by smtp.migadu.com with ESMTPS id c708cb14ba227278;
	Tue, 25 Aug 2026 08:59:55 +0000
X-Mizu-Trace-ID: c708cb14ba227278
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Stefan Teodorescu <fane@google.com>,
	tabba@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] KVM: arm64: Key unpin_host_sve_state() on the state it unpins
Date: Tue, 25 Aug 2026 09:59:47 +0100
Message-Id: <20260825085948.1674721-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260825085948.1674721-1-fuad.tabba@linux.dev>
References: <20260825085948.1674721-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_015957_776132_85AC6957 
X-CRM114-Status: GOOD (  11.73  )
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

unpin_host_sve_state() gates on the VM's SVE feature bit, but what it
unpins is the state pkvm_vcpu_init_sve() pinned. A vCPU that completed
init has sve_state set exactly when that bit is set, so the two agree.
Gate on sve_state, which is what is being unpinned.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 73e6ee059eebb..1d8cc984fb88c 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -398,10 +398,10 @@ static void unpin_host_sve_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	void *sve_state;
 
-	if (!vcpu_has_feature(&hyp_vcpu->vcpu, KVM_ARM_VCPU_SVE))
+	sve_state = hyp_vcpu->vcpu.arch.sve_state;
+	if (!sve_state)
 		return;
 
-	sve_state = hyp_vcpu->vcpu.arch.sve_state;
 	hyp_unpin_shared_mem(sve_state,
 			     sve_state + vcpu_sve_state_size(&hyp_vcpu->vcpu));
 }
-- 
2.39.5


