Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4AFC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=864YrNfy8UZMLzOsnhtRzZwiudL/5ffA/g3ckIQhd4Q=; b=XyB1N4PdD6nzyW1D2qCD6q5Fo1
	+aUTdnrE79UXAUyENR+kBgGcyeKq565GnJ8ykU5gbzD0d4IsdYxDULjCaIxeDObAJRgiNh3yU9fe3
	YNqhzTK0k/ocgbAaJiE/4Ex2DfdjM8qiZ5rSpOCPleTt2g+0a2ocOAwGYHHzF02l6o8JUNBJ/IGSK
	oCu2WcP/6NR3JfkHhylZ4VIyPTFVeT1BtkZ+btrvG0hL19M596iv7dEMMMcYoNpqxhrh8Lk/yiYPv
	vlIJ9u1/zsJng6xz+lEpBbdrdSrooPQJFLlKiaEwDWh/+W0y3Mu66ZqpWe74fdX2kCOU6vbJfefob
	RWdZZwJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyn0g-00000000RPT-1G5d;
	Tue, 25 Aug 2026 09:00:00 +0000
Received: from out-118.mta0.migadu.com ([2001:41d0:1004:224b::76] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyn0e-00000000ROG-0NOd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:59:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=qzr5u5nyOHcveIVIzXVin5uMFlcqJuyQtDVpldTuy/o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787648394; v=1; x=1788253194;
 b=j3OjFZTBxOBbZXn156bp158NgZLaY0sZiSrRDlCB50ws+ThmNw8sq6whitCwpIutFFVcaqVN
 tXSaicL5Vd7AQoFn2gIhySGGX2liVFYua6pH/FXGACEKG5Xo07raate+KvhwEG0ddbjDXCG+ns1
 UFSOv08YbQiqnHW+0VDmRJsE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.local (2a01:4b00:ad36:1d00:3a05:25ff:fe33:35a9)
	by smtp.migadu.com with ESMTPS id 4384835a12538f90;
	Tue, 25 Aug 2026 08:59:53 +0000
X-Mizu-Trace-ID: 4384835a12538f90
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
Subject: [PATCH 1/4] KVM: arm64: Validate the SVE vector length in pkvm_vcpu_init_sve()
Date: Tue, 25 Aug 2026 09:59:45 +0100
Message-Id: <20260825085948.1674721-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260825085948.1674721-1-fuad.tabba@linux.dev>
References: <20260825085948.1674721-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_015956_276019_2C5608CF 
X-CRM114-Status: GOOD (  11.29  )
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

pkvm_vcpu_init_sve() clamps only the upper bound of the host-provided
sve_max_vl, so an invalid vector length reaches sve_state_size_from_vl()
and the WARN_ON() there, which is fatal at EL2. The existing
!sve_state_size test rejects such a length, but only after the macro has
run.

Check sve_vl_valid() before deriving the state size. A valid length
cannot yield a zero size, so the !sve_state_size test goes with it.

Fixes: 5db1bef93342 ("KVM: arm64: Track SVE state in the hypervisor vcpu structure")
Reported-by: Stefan Teodorescu <fane@google.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 24d6f164129ac..095ebfce91b08 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -460,14 +460,15 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
 
 	/* Limit guest vector length to the maximum supported by the host. */
 	sve_max_vl = min(READ_ONCE(host_vcpu->arch.sve_max_vl), kvm_host_sve_max_vl);
-	sve_state_size = sve_state_size_from_vl(sve_max_vl);
 	sve_state = kern_hyp_va(READ_ONCE(host_vcpu->arch.sve_state));
 
-	if (!sve_state || !sve_state_size) {
+	if (!sve_vl_valid(sve_max_vl) || !sve_state) {
 		ret = -EINVAL;
 		goto err;
 	}
 
+	sve_state_size = sve_state_size_from_vl(sve_max_vl);
+
 	ret = hyp_pin_shared_mem(sve_state, sve_state + sve_state_size);
 	if (ret)
 		goto err;
-- 
2.39.5


