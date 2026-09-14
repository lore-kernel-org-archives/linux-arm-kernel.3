Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FADCC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ph6HSKjKoqZZNsqdUSSmK2O4fifuPfULBi73hh+J6dM=; b=GD4kx4C/kmWJyKM5prZipRRztL
	tGZbnQTqIM5c7yooIsXTRbNbFR8PAayHj2qx6MedKqcQqme/LZRgUpu3ZkXc01KJkwsedyVDaahHE
	nqd4hq0ttXI2RO2Mffx8Syk3A8bKYrMrdBk0Pvd7PRkLDZhIPtN+VuAeVnmPpcxVoFO9RgG4lft8F
	wPuF+ozyfAYEm/mMhAZR1q6xwpznFw+R0SH6B3g2MZostDV2vXOgPUBK2XX3XzUUtWuU+MVj2ACsi
	U57ZOFPPVx+MBZcql7LtQumrSwfQ3ixaCRPehWB7LHm7uEJshze6akvGz3narRRIwvxkmrzzFhl8J
	39DOSHAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655O-00000003LYr-2Sjk;
	Mon, 14 Sep 2026 11:42:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655B-00000003LKz-2Ig0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 11:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ph6HSKjKoqZZNsqdUSSmK2O4fifuPfULBi73hh+J6dM=; b=SEXlKDN1vZFYpAfIVI1Cg10JZj
	CMy/QKDsQTqqZwi8Ep992txRHxuNAN8noNcnUbexO+CLibC3SUo+yyzW0YAY1OTlQXRvE8Gr+SnYT
	69T+b3HXo8BPf5cdjeDMprh4Gy6vsK0VeDVIh4sibGgUX+tD/vwzzmfSrbhHwlW8H3o3xtYRFl++r
	ki9lUZoNa2XmGQOdPrA/C4HaCCMjyYG3mMGv6S3szcHYV8601LPfUkqPKZ1DUicZUoeonyRCjPaZ5
	3tTFQckfmY9REwCoXzDg31Cd6sCxsX3OOnRGCGw0H124EhlSRjbecAfSSkl0FuKbF4sizGWlxDP3f
	ft8LWzzQ==;
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6557-00000005YCq-3wzh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:42:44 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68EBfjsI084060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 14 Sep 2026 20:41:56 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=ph6HSKjKoqZZNsqdUSSmK2O4fifuPfULBi73hh+J6dM=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789386117; v=1;
        b=uUkqqHGhMeoppu6h32pd368gX+IMWeFJdo/UK7+mtTMxp+d72t/WgvPxcOYjhiqR
         e7U+AEBeTmu4SpuU21Zc82pVBbw6Luf0skOY5GYO57j8GPPDxgoBHiUbZ00cjoxK
         b/lrgYhxg+EwTvibicaB06xw6GcpZ45ZnBBfkRzzbPDO6e0AaaURctRrBbgEJB52
         TsGf+e/XBfQ2IBjq0F8/+FzSGBZvRk9LJsXmYd2h8IymADlhr1VJbwnLhUiqbjOJ
         3qBgL7so1k2X+ROQoD5HXxe+vQHgF2gkS4uQc6/1sBpwWbTabIjQQoOFMJDpNNBD
         Ud/+5I7FHj9My7X/4HrfIQ==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 14 Sep 2026 20:40:55 +0900
Subject: [PATCH v10 16/20] KVM: arm64: PMU: Pass the pPMU to
 kvm_map_pmu_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-hybrid-v10-16-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
References: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Andrew Jones <drjones@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
        Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=fyAPY3wbyhFxJx0Uh0Y1Wf3h8lp8DodEluZsH4qRO3o=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9byu6WvIn6sUZfcFva88p9SiuGtP2onDPdYFq3LnZoXn
 z1ZvftCRykLgxgXg6yYIktK0W5ujejaT4UJ8S0wc1iZQIYwcHEKwESOlTL84b7/aXP/0VI3TkmL
 zZ48Lcc4U964my87oKuaLecz/d7XYEaGmdZLRZ/flG2zkKxacz4z8eY2w/5WJ9vuHVJhtjmNd40
 4AQ==
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_124242_572209_A88B9411 
X-CRM114-Status: GOOD (  12.18  )
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

Replace the VM argument with the pPMU used for event creation. The
current caller still passes the VM's default pPMU, but this removes the
implicit lookup from kvm_map_pmu_event() so later changes can map events
against the pPMU selected for an individual vCPU.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 94bc69727c9f..05b48be05abd 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -682,10 +682,8 @@ static bool kvm_pmc_counts_at_el2(struct kvm_pmc *pmc)
 	return kvm_pmc_read_evtreg(pmc) & ARMV8_PMU_INCLUDE_EL2;
 }
 
-static int kvm_map_pmu_event(struct kvm *kvm, unsigned int eventsel)
+static int kvm_map_pmu_event(struct arm_pmu *pmu, unsigned int eventsel)
 {
-	struct arm_pmu *pmu = kvm->arch.arm_pmu;
-
 	/*
 	 * The CPU PMU likely isn't PMUv3; let the driver provide a mapping
 	 * for the guest's PMUv3 event ID.
@@ -737,7 +735,7 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 	 * Don't create an event if we're running on hardware that requires
 	 * PMUv3 event translation and we couldn't find a valid mapping.
 	 */
-	eventsel = kvm_map_pmu_event(vcpu->kvm, eventsel);
+	eventsel = kvm_map_pmu_event(vcpu->kvm->arch.arm_pmu, eventsel);
 	if (eventsel < 0)
 		return;
 

-- 
2.55.0


