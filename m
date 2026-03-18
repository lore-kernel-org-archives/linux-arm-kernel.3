Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2260103E197
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+tpJsFb1Ttr9lnWH7wpgPR2cAf3WD2JC0Vi5vcACBA=; b=IKpdVn/Ic418trUR0lCQpcsa2w
	qiNpgcZWA8ccozFNPtnCz2dBpzLFn3IsrJ1EHN662ogmga5tpUdSt//YMnc5u7ODfO8btBUUPGQ66
	CRoKaxnBy4nMzoGa6r9QGLQU5aw6frDqDmcwXgSJB7WrZdhFaBkjUfNs8Al9qoQN8t4WzgBktupco
	K6Uv0whGeAdmckNvj4bDCN6ZTlupXsMDc+aqcx4dIVJdI5rZ8ACzaI+m/lWgojoc8qhx1Bpc/17VX
	rjuIZxuW5VQ2jyS9X2+8w553+r/kt075booOo/3aGAhvDQ5GYfJgMLvkq2cDq2LpM4VSBqiH53IH6
	Yi/tv6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tGI-00000008q2A-44uK;
	Wed, 18 Mar 2026 15:56:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tG0-00000008pjR-3lqx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 15:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Z+tpJsFb1Ttr9lnWH7wpgPR2cAf3WD2JC0Vi5vcACBA=; b=fkAkzyLxWq6V4SAZp/7e6y34zR
	iGRF+aC0Y8bcukMxOfZtwphzYInjP4Ca+FcVR6DwGhyEHGyl8lHpaGhUWcisZAcEYkXhRYwytS6qz
	mCZiNU6xzEjj7WzWDNZxqFT2kORxDR21XR/UIVcZP8PJ5YeuicF6zuUXqKwRAajE6TSoVl4PRNydg
	v5+Il6OG502wRIR/UtApE7ypcYrn4/6jV1PUc32lEz17l/y1saaTzV+GdDcaLHx//H1B2qwGVkZU/
	UkwOh5mBA4opDKTcDN2C97ROpsWH/eDGcf9DGlWozXvIdSg3WonzN7Be5kmnkEF1GwUAmeqFuOWml
	vmDUW04A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tFw-0000000Bdn8-0Qdf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:56:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87C17201B;
	Wed, 18 Mar 2026 08:56:15 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.61.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 809DF3F73B;
	Wed, 18 Mar 2026 08:56:18 -0700 (PDT)
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
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: [PATCH v13 32/48] arm64: Don't expose stolen time for realm guests
Date: Wed, 18 Mar 2026 15:53:56 +0000
Message-ID: <20260318155413.793430-33-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_155624_374353_6429ACCD 
X-CRM114-Status: GOOD (  11.84  )
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

It doesn't make much sense as a realm guest wouldn't want to trust the
host. It will also need some extra work to ensure that KVM will only
attempt to write into a shared memory region. So for now just disable
it.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v7:
 * Update the documentation to add a note about stolen time being
   unavailable in a realm.
---
 Documentation/virt/kvm/api.rst | 3 +++
 arch/arm64/kvm/arm.c           | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index bc180c853faf..70911fe6d435 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -9240,6 +9240,9 @@ is supported, than the other should as well and vice versa.  For arm64
 see Documentation/virt/kvm/devices/vcpu.rst "KVM_ARM_VCPU_PVTIME_CTRL".
 For x86 see Documentation/virt/kvm/x86/msr.rst "MSR_KVM_STEAL_TIME".
 
+Note that steal time accounting is not available when a guest is running
+within a Arm CCA realm (machine type KVM_VM_TYPE_ARM_REALM).
+
 8.25 KVM_CAP_S390_DIAG318
 -------------------------
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 61182eb0cf70..7d92ddb06460 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -469,7 +469,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = system_supports_mte();
 		break;
 	case KVM_CAP_STEAL_TIME:
-		r = kvm_arm_pvtime_supported();
+		if (kvm_is_realm(kvm))
+			r = 0;
+		else
+			r = kvm_arm_pvtime_supported();
 		break;
 	case KVM_CAP_ARM_EL1_32BIT:
 		r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);
-- 
2.43.0


