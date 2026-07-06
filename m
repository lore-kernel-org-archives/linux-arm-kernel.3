Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC50BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDWkCAd4wd1O5a+AJqC/Cbz+oKO4i4/1IVYuaDmE9UQ=; b=MlCLPI7v1A39lO5PzdRAOM/OIf
	aY4GhdgitI56hIsybu0+vhyDkgq05PiqdRS65Xao8vx1trUGkhqpM9Nu5DHWiP9eMbVgb6YQ6u+6E
	hSyAgVke7BiKD/XnDnflP+pLc9BkOhz1f2XXzAib29DFF76LR6TRL3lPy2VoJbInV4t/MWqgyBWX8
	0H1R9CJCCGMX43UHheXC/6LEJtSYTZUswGXvKZ02vYlzpcRl0jPLunJympbqKRgled368GptmgpX2
	/e8xMUu5P2tP2YRq8AQiqV0+lQV6ea4DzNHdqbBDHdUmY/g8woGSz/b5+gcCwdLrDZlJwv531LHdB
	e4Xi/gMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggBX-0000000C8Yd-0LrP;
	Mon, 06 Jul 2026 10:04:19 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggBT-0000000C8WD-4ATh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:04:17 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 666A3TQ6013128
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 6 Jul 2026 19:03:44 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=YDWkCAd4wd1O5a+AJqC/Cbz+oKO4i4/1IVYuaDmE9UQ=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1783332224; v=1;
        b=U65FBOYr0bjrwIJ4HDtQmTovBKJTbkY/zUGcirN2zujm+k7V3mKx9tJWrmBni1Ew
         Z4rzRcOs9YhC1qUnqP/owy+umCMic/Pg/Ba7piCZ3d1N5Hq7KlIDnu8+SPcHOpzC
         WLeL/1YmIitydRnH4gkorjvgyQa3oJtATYM32Au9z8/JiHf80mQjenUrMMNy38n8
         aOhH9dTVLmQDbm+VB2tHFx5rQiv+4pHVUqgr6E/rPm8qLLdXW0+SLGvw+cvxMBHQ
         Pe28oCvLSS7OL9u7QS9OXGh09Cp8mS5KoDQ4ljUpXjI+MdBDP9PmfaeTjg9sv234
         eG39I2az2kwboqJmcu/n1g==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 06 Jul 2026 19:03:26 +0900
Subject: [PATCH v8 3/7] KVM: arm64: PMU: Pass the pPMU to
 kvm_map_pmu_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-hybrid-v8-3-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_030416_264764_75D1CBA8 
X-CRM114-Status: GOOD (  12.61  )
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
---
 arch/arm64/kvm/pmu-emul.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 4e8c872b3e20..185ea3631eee 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -678,10 +678,8 @@ static bool kvm_pmc_counts_at_el2(struct kvm_pmc *pmc)
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
@@ -733,7 +731,7 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 	 * Don't create an event if we're running on hardware that requires
 	 * PMUv3 event translation and we couldn't find a valid mapping.
 	 */
-	eventsel = kvm_map_pmu_event(vcpu->kvm, eventsel);
+	eventsel = kvm_map_pmu_event(vcpu->kvm->arch.arm_pmu, eventsel);
 	if (eventsel < 0)
 		return;
 

-- 
2.55.0


