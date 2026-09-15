Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1186DC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOyneF6oe4WNfYT0jUx6tKSTshf4jdaj9GOZYK/+KlU=; b=hp4G/y1A1LwojiiYuztA9rR5dx
	IOqBbXanMbla+kSZcXkLwLhqM3ywOEhSyn2F1RB/q2pG07M8MwGROg25ib/dF9bY155Fc05Y9bgQ0
	BOmL9CCFZN0IGHcRDM85+IyS8o8r+fP9ej9Yk4RncBLNHWx+kWaLC+/xZGeRkAPS+yLvlcP4zR/9i
	GNRUD6eyhHLjZDsrLoQ5QOmLYcOYM+HU3SAe1zeaVGRofryDhn79EP1tXvPBGJkQq7B0UFU+t7vtS
	m4ONpfVj1tT4K0uUAsiWDG1Rt1rD5URkCg8y6FbNXvvgtWkmZ+sPQIxBrJQjHLmBDBON+l9b81gip
	8LaZXLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NDa-00000005PoZ-3b0o;
	Tue, 15 Sep 2026 07:04:38 +0000
Received: from out-32.mta0.migadu.com ([2001:41d0:1004:224b::20] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NDO-00000005Pk9-25jY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 07:04:27 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=TxjB2nuw/omS0r1HuiWJ8ceXglPNuUd+88Xw3+fRY0o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789455864; v=1; x=1790060664;
 b=RfYBmcS79BbKA5YbpkzRHGNMsCdzXRD1HEpL6hdNfl/pGiDHfUrufUgaKXXUPH/IHYRiBT23
 Iwz3Kn12AcPNbXgE1yV2U/XRabVttCjM3d7gNYu+FqlFKxra+ZQ9ca17ZnyJup/oUvuH3mDdPBQ
 Ode+nbxhx5VGh0EOwRXLWuoA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d9900a21abb41ef0;
	Tue, 15 Sep 2026 07:04:24 +0000
X-Mizu-Trace-ID: d9900a21abb41ef0
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
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH v2 2/2] KVM: arm64: Pin the host vCPU before adjusting its PC under pKVM
Date: Tue, 15 Sep 2026 08:04:18 +0100
Message-Id: <20260915070418.3209779-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260915070418.3209779-1-fuad.tabba@linux.dev>
References: <20260915070418.3209779-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_000426_677783_751B422E 
X-CRM114-Status: GOOD (  12.37  )
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

Under pKVM, a page the host shares with EL2 is mapped at EL2 only while
it's pinned, and the host vCPU is pinned at its first KVM_RUN.
KVM_SET_VCPU_EVENTS with ext_dabt_pending reaches __kvm_adjust_pc() at
EL2 before that, and dereferencing the unmapped host vCPU panics the
hypervisor. Any process holding /dev/kvm on a pKVM host can trigger it.

Pin the host vCPU around the adjustment when no hyp vCPU is loaded for
it. A loaded hyp vCPU implies it's pinned. A pin fails only for memory
the host never shared, and the request is then dropped like any other
bad host pointer.

Fixes: efa1368ba9f4b ("KVM: arm64: Commit exceptions from KVM_SET_VCPU_EVENTS immediately")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9a3b92e626adb..4cb7347db2514 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -542,8 +542,25 @@ static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	struct kvm_vcpu *host_vcpu;
 
-	__kvm_adjust_pc(kern_hyp_va(vcpu));
+	host_vcpu = __get_host_hyp_vcpus(vcpu, &hyp_vcpu);
+	if (host_vcpu) {
+		__kvm_adjust_pc(host_vcpu);
+		return;
+	}
+
+	/*
+	 * With no hyp vCPU loaded for it, the host vCPU may be unpinned,
+	 * and so unmapped at EL2: its first run pins it.
+	 */
+	host_vcpu = kern_hyp_va(vcpu);
+	if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
+		return;
+
+	__kvm_adjust_pc(host_vcpu);
+	hyp_unpin_shared_mem(host_vcpu, host_vcpu + 1);
 }
 
 static void handle___kvm_flush_vm_context(struct kvm_cpu_context *host_ctxt)
-- 
2.39.5


