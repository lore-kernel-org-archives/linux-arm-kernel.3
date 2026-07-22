Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BED3C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/2r/FxGKWALSDQS7gcX3VsAvCtPvUfjfU8VvkzFAnw=; b=EU9bIw+bqC9gtf6i+8KKD5oQr0
	DnJywgv60KPRFZgRuAxe7Sv/ymqy5VETTMuXtpNn/3cGhUBroHFttz5tLiVvZiK1CjQsxA+jfS2F7
	/1tZQ6EhkjqYt08EGloiehryDYoDq3P9D2z3PBVwBwkZsA3z0gfmETn2C8izX8yst7YyxDOO19SKL
	Amr6f8l0L2H/EPCtPqC5ntGQSVBxWpSZ+70Q9FtT5sM6YLlJN8r/LQN2FjfuteP3B1aZQEeuiAVKz
	7PHYS8e9gZu6WWf797TSNImXL4oOYaESAWm21+0D+pI5OKatgKnTrOehhBje+P/6zRk6nwOe1YlV2
	SuzczCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdXT-0000000CieJ-3Bq8;
	Wed, 22 Jul 2026 20:27:35 +0000
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.68.102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdXM-0000000CiaY-1qso
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1784752048; x=1816288048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A/2r/FxGKWALSDQS7gcX3VsAvCtPvUfjfU8VvkzFAnw=;
  b=hcPK/T0L3ag+bd+e8cMNiZjD6Hy+PyyMy2m/6DANzVjeLbnwPOKoD7bv
   cIj/rgdnrD8U/7xzlc1oRPBu8SLdGvEFdhXgNQPE8j6bO3IvH7ujVOllC
   GkZp7W2YLBJr347EmVV/zKfHTcjxVwyEcpL/JzhRZOk1Bc2qcUSoTJIXk
   Lvc1hgCeEH3Op7CpcneJUnqAR8OV5GK8pW1lzVrQ9WPQlMRyDXnxXcTyt
   AKkX/TPen0BtgT8bocTbkv+0nTSmeP47so328N8036pNeE894lfF8iPS8
   TA7LQLGvZK+YMcHpQx+/T2eL+YHJV7CJRo3sCtPSt9tCzfXVzajaXfsuk
   g==;
X-CSE-ConnectionGUID: 07WjkSdJTRiNjRMtdabEcA==
X-CSE-MsgGUID: mpRXSEovSaOifgua35QxSg==
X-IronPort-AV: E=Sophos;i="6.25,179,1779148800"; 
   d="scan'208";a="24201992"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 20:27:23 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:6195]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.59:2525] with esmtp (Farcaster)
 id 8a451785-e587-4cec-becc-ac08e7c16abd; Wed, 22 Jul 2026 20:27:23 +0000 (UTC)
X-Farcaster-Flow-ID: 8a451785-e587-4cec-becc-ac08e7c16abd
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Wed, 22 Jul 2026 20:27:23 +0000
Received: from dev-dsk-congkai-2a-df9e8fab.us-west-2.amazon.com
 (172.23.251.204) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43; Wed, 22 Jul 2026
 20:27:23 +0000
From: Congkai Tan <congkai@amazon.com>
To: Oliver Upton <oupton@kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
CC: Congkai Tan <congkai@amazon.com>, Marc Zyngier <maz@kernel.org>, "Joey
 Gouly" <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, "Haris
 Okanovic" <harisokn@amazon.com>, Geoff Blake <blakgeof@amazon.com>,
	"Stanislav Spassov" <stanspas@amazon.de>, <kvm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/4] KVM: arm64: Ignore writes to PMCR_EL0.N when using strict UAPI
Date: Wed, 22 Jul 2026 20:27:01 +0000
Message-ID: <20260722202702.4165917-4-congkai@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722202702.4165917-1-congkai@amazon.com>
References: <20260722202702.4165917-1-congkai@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.251.204]
X-ClientProxiedBy: EX19D045UWC001.ant.amazon.com (10.13.139.223) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_132728_528239_524F399C 
X-CRM114-Status: GOOD (  10.75  )
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

From: Oliver Upton <oupton@kernel.org>

KVM allows userspace to configure the number of event counters by
writing to PMCR_EL0.N. While this makes a bit of sense prior to NV, the
value of the field is context-dependent whether or not the vCPU is at
EL2 or EL1. As such, the vCPU attribute was added afterwards and made
mandatory for NV.

As we're in the process of papering over old mistakes, force userspace
to use the vCPU attribute if KVM_ARM_VCPU_PMU_V3_STRICT is set.

Signed-off-by: Oliver Upton <oupton@kernel.org>
Reviewed-by: Geoff Blake <blakgeof@amazon.com>
Reviewed-by: Haris Okanovic <harisokn@amazon.com>
Signed-off-by: Congkai Tan <congkai@amazon.com>
---
 arch/arm64/kvm/sys_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 4c6f608c4fe5..e93f11b90813 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1502,6 +1502,7 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	 */
 	if (!kvm_vm_has_ran_once(kvm) &&
 	    !vcpu_has_nv(vcpu)	      &&
+	    !kvm_vcpu_has_pmuv3_strict(vcpu) &&
 	    new_n <= kvm_arm_pmu_get_max_counters(kvm))
 		kvm->arch.nr_pmu_counters = new_n;
 
-- 
2.50.1


