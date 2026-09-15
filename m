Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AC3C982CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a67IVBhLqJsNZgbAOnCBjd8kwbFGfzIHkQwNN+tuD44=; b=p/ZCCxRQA4CgHWsvr558ZVSyx9
	9h8EcCSWJ4/4lla2dWNl6qNSMWdTK3jSY5vAsHWIaCYo7gYV61XYQ4Q+cR9JLERwqVFRDFbZnnBvq
	LdhDNdFV2xyIybKP9dcdaGK9DwnDsvtXbCMZClqNSpl1OOM5rODFzlRcAu2DzB8ECqgA8EIZr7cvj
	pwQqE+yu7BviZGLAAb5lsvzW5YExTqQRD3gSY4g/8d3g5iSDbBNBa6nPObPNvoGRYO7V5yYLOS+Wt
	QOLcqS7MeweAWEIcRYS0jETHSF3SfiXFZrlyAqbxf/CQUE7Z3PrLlKXG80KJY10KuvdtZBEtLToZS
	4WZd/PSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vch-00000007LtB-3Hh1;
	Tue, 15 Sep 2026 16:03:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VcW-00000007LiK-2H3C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:02:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61F111D70;
	Tue, 15 Sep 2026 09:02:52 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B9AD3F882;
	Tue, 15 Sep 2026 09:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789488176; bh=rO1Aepg+ZPdfUbjznCSF+LW5fDa0Tz1f7cbp73DbIAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kiTqgz1Yy7gR4b79nYtgyPn5gKXuxc5Ql439+CksEyu0ACTiBZF3AQnCkHudHESRL
	 56Vb4DL+sRoAZFCxozDJsocWeomwOVq3oITqrg/vq1LrdObvOx19lnRGaH0eq+s+EV
	 iOwXxpFgCoINxg9YqCKXx/dlurAbS+Nv4jR1BzwY=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com
Subject: [PATCH v18 21/23] KVM: arm64: CCA: WARN on injected undef exceptions
Date: Tue, 15 Sep 2026 17:01:39 +0100
Message-ID: <20260915160141.3543048-22-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915160141.3543048-1-suzuki.poulose@arm.com>
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_090256_632991_D9D9CEA6 
X-CRM114-Status: UNSURE (   8.51  )
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

From: Steven Price <steven.price@arm.com>

The RMM doesn't allow injection of a undefined exception into a realm
guest. Add a WARN to catch if this ever happens.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v15:
 * Switch to KVM_BUG() to mark the VM as bugged as well.
Changes since v6:
 * if (x) WARN(1, ...) makes no sense, just WARN(x, ...)!
---
 arch/arm64/kvm/inject_fault.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index d6c4fc16f8795..d61a3ff04fabb 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -317,6 +317,7 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
  */
 void kvm_inject_undefined(struct kvm_vcpu *vcpu)
 {
+	KVM_BUG(vcpu_is_rec(vcpu), vcpu->kvm, "Unexpected undefined exception injection to REC");
 	if (vcpu_el1_is_32bit(vcpu))
 		inject_undef32(vcpu);
 	else
-- 
2.43.0


