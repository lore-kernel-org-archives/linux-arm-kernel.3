Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6EAC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+rOhYbDNp5MUsVIzdDJ8hYJDsHis4+qDWLwyM2arMU=; b=o+UXjfi7L/P0JtjmtAqP8SgFQE
	vk2uORtKIgOnVT3PpkWJB4tMWIgWPYyspGYG+tnSGTD1iv9XsWCPgLYFkx99gYVrsuCCHyId4I029
	QVl62ia15S5sihNYMHcfJYZPMR5V0a8feLn+YlN+u1wUwSqLTYoCrpMMeJKNuRwIm0qNMDr5ZflWr
	HkBx+tPXWuKETpkncYzaRS9qc6dAd3zw1QAPQYejBXPsPI9Gf3TQeyAIEtTTr9BMjp27IUu6zhjMA
	JS3oTIpfsRdTGEXYCLGh5CrS4rQYWpfdIYHqOS9v/Lc41/PQOAwBoC3qpQVxv9G9RwnvogNeWUUMS
	PrdXiGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNmX-0000000AThs-0lSH;
	Wed, 11 Jun 2025 15:54:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ2w-00000009faP-3faw
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 10:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=b+rOhYbDNp5MUsVIzdDJ8hYJDsHis4+qDWLwyM2arMU=; b=cWzo9eWq+UtuRMOgW3TDFa3wt9
	JGgGbiRHXKzcWD7A4HvHo+AzC/fpIYlTu1sWQpX8UwSMYXrlgtGfmpQvFcYcpnutBwvEmVODDARhG
	It9BW45v6CD07U6a2WFEpsOu92yazIDdNE27vLpkCBdIicd24pfji+EOVMvSO1C9ASZCfZG3T8cjC
	u16+XAarilM3dDV31t20q0cS/6dlsW3hGP1jecp1X+FtO0gMj9Qhr72x9zUSYyLC2LzOTVLpunDdK
	nVTRelyLRiVlS0cYHT605XyeZxA1+4+xrHzkQZo++ANvDgux4mLmrBtNkDYigQsfvVTyktK1Sqtmc
	zC48RChA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ2u-00000002IL5-3gh0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:51:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CEA026BE;
	Wed, 11 Jun 2025 03:50:43 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.67.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12F813F673;
	Wed, 11 Jun 2025 03:50:59 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>
Subject: [PATCH v9 33/43] arm64: RME: Hide KVM_CAP_READONLY_MEM for realm guests
Date: Wed, 11 Jun 2025 11:48:30 +0100
Message-ID: <20250611104844.245235-34-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611104844.245235-1-steven.price@arm.com>
References: <20250611104844.245235-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_115105_131803_2C659A4C 
X-CRM114-Status: GOOD (  11.99  )
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

For protected memory read only isn't supported by the RMM. While it may
be possible to support read only for unprotected memory, this isn't
supported at the present time.

Note that this does mean that ROM (or flash) data cannot be emulated
correctly by the VMM as the stage 2 mappings are either always
read/write or are trapped as MMIO (so don't support operations where the
syndrome information doesn't allow emulation, e.g. load/store pair).

This restriction can be lifted in the future by allowing the unprotected
stage 2 mappings to be made read only.

Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v7:
 * Updated commit message to spell out the impact on ROM/flash
   emulation.
---
 arch/arm64/kvm/arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 76b634c17719..50f039050cfb 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -340,7 +340,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ONE_REG:
 	case KVM_CAP_ARM_PSCI:
 	case KVM_CAP_ARM_PSCI_0_2:
-	case KVM_CAP_READONLY_MEM:
 	case KVM_CAP_MP_STATE:
 	case KVM_CAP_IMMEDIATE_EXIT:
 	case KVM_CAP_VCPU_EVENTS:
@@ -355,6 +354,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = 1;
 		break;
 	case KVM_CAP_COUNTER_OFFSET:
+	case KVM_CAP_READONLY_MEM:
 	case KVM_CAP_SET_GUEST_DEBUG:
 		r = !kvm_is_realm(kvm);
 		break;
-- 
2.43.0


