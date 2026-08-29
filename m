Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C72C61DD7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 07:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p19S9D5mhTJAiA7NtWLs++R+Es0z8TIdiwsja7w7kQw=; b=rm8pdod9ey/CMziq4fX0S9nL13
	WZ5+eht7Kmlm56n37rm+oOXsv6gnHTlB4o+ECBwZl4SfJWUH/qOQggbSuS83mRTKxkY2fFTnxYsyI
	wkgyTVVj4DuiRKRCRCdlgahbQT0sbNEAomVT6eK+xMhFScpDELBvgbtrEjDqvltg++FPtJahBiaB4
	MGVoUmCBBGm3/81FcLEyaP/PROez8pKcI7nM08Zxw2cIuT8xn2yktJgpx+LgKocB/Vl7U2wPAHLwH
	sUl7PiOdRJyNfoG3WVg3XkZvyybHUFSyHeSHIw3ymC9QbYEZLzGMiqQJVfhhEhmbPB/s3hWF1qWmM
	nZjz11yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0DDy-00000006oIQ-47U5;
	Sat, 29 Aug 2026 07:11:34 +0000
Received: from out-164.mta0.migadu.com ([2001:41d0:1004:224b::a4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0DDw-00000006oHQ-0Jq2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 07:11:33 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=0WEUwWA13h6lSIRRHugW7N81xLfWs7SnLHtINewqeBo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787987489; v=1; x=1788592289;
 b=gHdy4XCOPwERbcch+mSs+R/AtCyA0wsMxlYxMjYhqmlo/ZO6QGDCVMlKYGr+M41UzEPhDNQt
 NwfP62VVwmYLbYSaebgAI76k04ak09Xm7Ib4QzPjXLdBvWs+R8c7Y6bakK4gU/cVKU+qwkQ/7EF
 ys/noFDTUzhaxmbHJsBfVfIk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 891acf61f080e197;
	Sat, 29 Aug 2026 07:11:29 +0000
X-Mizu-Trace-ID: 891acf61f080e197
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 2/2] KVM: arm64: selftests: Check SError is not pending after delivery
Date: Sat, 29 Aug 2026 08:11:20 +0100
Message-Id: <20260829071120.2522788-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260829071120.2522788-1-fuad.tabba@linux.dev>
References: <20260829071120.2522788-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_001132_256803_09499A00 
X-CRM114-Status: UNSURE (   8.87  )
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

test_serror() never looks at the vCPU after the SError is delivered, so
a stale pending SError goes unnoticed. Read the vCPU events back and
check the SError is no longer pending.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/arm64/external_aborts.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
index d8fe17a6cc592..b276a4998a92c 100644
--- a/tools/testing/selftests/kvm/arm64/external_aborts.c
+++ b/tools/testing/selftests/kvm/arm64/external_aborts.c
@@ -239,6 +239,7 @@ static void test_serror_guest(void)
 
 static void test_serror(void)
 {
+	struct kvm_vcpu_events events;
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm = vm_create_with_dabt_handler(&vcpu, test_serror_guest,
 							unexpected_dabt_handler);
@@ -247,6 +248,11 @@ static void test_serror(void)
 
 	vcpu_inject_serror(vcpu);
 	vcpu_run_expect_done(vcpu);
+
+	vcpu_events_get(vcpu, &events);
+	TEST_ASSERT(!events.exception.serror_pending,
+		    "SError still pending after the guest took it");
+
 	kvm_vm_free(vm);
 }
 
-- 
2.39.5


