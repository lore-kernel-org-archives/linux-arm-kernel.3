Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3F6C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqhIxGQtMExXNTQX0y9RZGnMf0VNsSaZBvYsZEL36OU=; b=HM417Dm89VrD2WBNPp4ZfzLwdJ
	INXOhRfjOCJ6pqc+xIzhsDAhDcySbug9+gy0QAottvbratJOq+0ItlpG9G2toA5iHTkotFA2RYRJg
	98GZ4JInL1CnFU1bMZm4fQ60lIy9OSbqSO877SzWDDKT1ip1rmjMV2uWnvEAQ30qFrpN1mfQbBJX/
	t/x0hrXUCOMLrnZ44pNP/OXtuWns2zg4oMpsOqzzXAqunFKxshH/N/esEs7yFCei9XSriBtishHnu
	8TC2fV490jVDrRF+61BpgSNk3PnuPs3XCaidcHqabCwyNs6Nu0rRtd6RgTFTZw9MdpBF2xGR+yOBf
	A7sOicHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt0U-0000000HEHQ-1wgZ;
	Mon, 03 Aug 2026 13:47:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt0Q-0000000HED0-2a7N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:47:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6C3C1655;
	Mon,  3 Aug 2026 06:46:57 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B96F3F66F;
	Mon,  3 Aug 2026 06:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785764821; bh=R90GSqHKgNKLq0IbPcgJ2Xy7BoduOtRWpnHj0KKueKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W5i9r3b6l4ACstwJ4hcdMWGUNalMjpqK3Kfd2nYwLQ/rPRTuQYAK7sF0ZcIktlg2B
	 HasUL/a8gkc/mzH1Bv24AeL0mjMDbypOSPJ+yuhJ4kIVYfC73yJuZiUsIlugGhPmd6
	 /2xke7+wX/ywgclM9eJm8JOCYys0O6htTk+rDxZ8=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v16 35/45] KVM: arm64: CCA: Support RSI_HOST_CALL
Date: Mon,  3 Aug 2026 14:43:51 +0100
Message-ID: <20260803134403.80630-36-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134403.80630-1-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064702_753059_B6E80A32 
X-CRM114-Status: GOOD (  12.36  )
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

From: Joey Gouly <joey.gouly@arm.com>

Realm VMs can talk to the hypervisor using the RSI_HOST_CALL SMC. The
RMM forwards this to the host and KVM handles them as regular
hypercalls.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v15:
 * Adapt to new exit handling.
Changes since v7:
 * Avoid turning a negative return from kvm_smccc_call_handler() into a
   error response to the guest. Instead propagate the error back to user
   space.
Changes since v4:
 * Setting GPRS is now done by kvm_rec_enter() rather than
   rec_exit_host_call() (see previous patch - arm64: RME: Handle realm
   enter/exit). This fixes a bug where the registers set by user space
   were being ignored.
---
 arch/arm64/kvm/rmi-exit.c | 1 +
 arch/arm64/kvm/rmi.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/kvm/rmi-exit.c b/arch/arm64/kvm/rmi-exit.c
index 1749cde2edff..7cde820bb77b 100644
--- a/arch/arm64/kvm/rmi-exit.c
+++ b/arch/arm64/kvm/rmi-exit.c
@@ -164,6 +164,7 @@ int kvm_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
 	case RMI_EXIT_SERROR:
 		return ARM_EXCEPTION_EL1_SERROR;
 	case RMI_EXIT_PSCI:
+	case RMI_EXIT_HOST_CALL:
 		rec_exit_hvc(vcpu);
 		kvm_make_request(KVM_REQ_RMI, vcpu);
 		return ARM_EXCEPTION_TRAP;
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 3f31ad25680f..904df7c7245d 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -1203,6 +1203,10 @@ int kvm_rec_handle_request(struct kvm_vcpu *vcpu)
 		return kvm_rec_complete_psci(vcpu);
 	case RMI_EXIT_RIPAS_CHANGE:
 		return kvm_complete_ripas_change(vcpu);
+	case RMI_EXIT_HOST_CALL:
+		for (int i = 0; i < REC_RUN_GPRS; i++)
+			rec->run->enter.gprs[i] = vcpu_get_reg(vcpu, i);
+		break;
 	default:
 		KVM_BUG(1, vcpu->kvm, "Unhandled realm exit_reason");
 		return -ENXIO;
-- 
2.43.0


