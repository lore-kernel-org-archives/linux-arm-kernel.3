Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA3FCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=STgd3/PYhuI3RfZZRk/Qkc+geJ+bPnIGjrcWjkvoL5Q=; b=GC55tsolD/osPnIewfxUgmOsEB
	J6930EEvZsvEWNP4hpiS7IOQgZFjxvBSc1WvjCv9lln3TxmbDGEodSrb9tlHotN4uDPZ8L0iiwdu1
	B6bDojK47zOEhwRmmH7x7wPx6FNFOtQYVZvyzHEElXWfei1wydqTlTHh1PcVov4MBYck403bYC92q
	ytNlcvlVQQpN8JifbVLKiK5wb7flF2qFoCNFz6czAfV4T7RDp9ygesFgtfBt4m7wA++uFlRNtcM7E
	gtqFK5qVSP6fPtUFbp617ULFbir9+kvcM0PQR7T325Hq4f31LXcXL0xUnxE2WX91A4PsC4gCiABrV
	Sfe/0PnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1Te-00000000NpR-3JXa;
	Tue, 06 Oct 2026 09:28:50 +0000
Received: from out-191.mta1.migadu.com ([2001:41d0:203:375::bf] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1Tc-00000000NoL-1LZC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 09:28:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=I68XOz2+dlHst72wv+RGCM6KpZ5GGkDGvyZu0sm4Syw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791278926; v=1; x=1791883726;
 b=MEkA6Q8qN0UqhysbHM0zMcwF6xt4Y2Tyq6RrdzLp/N9665hbEBYSrm4vkkQvZUt9NsbD2OWJ
 D+VDYoqYlZMuH8r+uIwKZpP0NmRu6zR1nvBNrIDwHuIY998qpIzH1bHEmxgPDO5NOTc91j8yJLR
 dY8bOTmn3TTkJsUaD23oCZB8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d166d98b4bdd94e5;
	Tue, 06 Oct 2026 09:28:46 +0000
X-Mizu-Trace-ID: d166d98b4bdd94e5
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
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH v4] KVM: arm64: selftests: Check the pending SError state in external_aborts
Date: Tue,  6 Oct 2026 10:28:41 +0100
Message-Id: <20261006092841.2202109-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_022848_502738_82CD7DEF 
X-CRM114-Status: GOOD (  10.42  )
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

None of the external abort tests look at the vCPU events once the guest
is done, so an SError left pending after the guest took it, or dropped
while the guest had it masked, goes unnoticed.

Read the vCPU events back at the end of every test that runs the guest.
The SError must still be pending in the masked case, with the injected
ESR when the vCPU has RAS, and no SError, injected or spurious, may be
pending in any of the others.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
The check that no SError is left pending after the guest took it is
what fails without commit 3708f6342f01 ("KVM: arm64: Sync HCR_EL2.VSE
back to the host vCPU under pKVM"), in kvmarm/next.

Changes since v3 [1]:
- Check the SError pending state at the end of every test that runs the
  guest, and assert it is still pending, with the injected ESR, in the
  masked case (Oliver [2]).

[1] https://lore.kernel.org/all/20261005050349.836795-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/asNdAXGkxagm88Su@kernel.org/

 .../selftests/kvm/arm64/external_aborts.c     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
index 7836756a38a6c..1a858d0d82968 100644
--- a/tools/testing/selftests/kvm/arm64/external_aborts.c
+++ b/tools/testing/selftests/kvm/arm64/external_aborts.c
@@ -75,6 +75,17 @@ static void vcpu_inject_serror(struct kvm_vcpu *vcpu)
 	vcpu_events_set(vcpu, &events);
 }
 
+static void vcpu_assert_serror_pending(struct kvm_vcpu *vcpu, bool pending)
+{
+	struct kvm_vcpu_events events;
+
+	vcpu_events_get(vcpu, &events);
+	TEST_ASSERT_EQ(events.exception.serror_pending, pending);
+
+	if (pending && vcpu_has_ras(vcpu))
+		TEST_ASSERT_EQ(events.exception.serror_esr, EXPECTED_SERROR_ISS);
+}
+
 static void __vcpu_run_expect(struct kvm_vcpu *vcpu, unsigned int cmd)
 {
 	struct ucall uc;
@@ -134,6 +145,7 @@ static void test_mmio_abort(void)
 
 	vcpu_inject_sea(vcpu);
 	vcpu_run_expect_done(vcpu);
+	vcpu_assert_serror_pending(vcpu, false);
 	kvm_vm_free(vm);
 }
 
@@ -162,6 +174,7 @@ static void test_mmio_nisv(void)
 
 	TEST_ASSERT(_vcpu_run(vcpu), "Expected nonzero return code from KVM_RUN");
 	TEST_ASSERT_EQ(errno, ENOSYS);
+	vcpu_assert_serror_pending(vcpu, false);
 
 	kvm_vm_free(vm);
 }
@@ -185,6 +198,7 @@ static void test_mmio_nisv_abort(void)
 
 	vcpu_inject_sea(vcpu);
 	vcpu_run_expect_done(vcpu);
+	vcpu_assert_serror_pending(vcpu, false);
 	kvm_vm_free(vm);
 }
 
@@ -212,6 +226,7 @@ static void test_serror_masked(void)
 
 	vcpu_inject_serror(vcpu);
 	vcpu_run_expect_done(vcpu);
+	vcpu_assert_serror_pending(vcpu, true);
 	kvm_vm_free(vm);
 }
 
@@ -247,6 +262,7 @@ static void test_serror(void)
 
 	vcpu_inject_serror(vcpu);
 	vcpu_run_expect_done(vcpu);
+	vcpu_assert_serror_pending(vcpu, false);
 	kvm_vm_free(vm);
 }
 
@@ -288,6 +304,7 @@ static void test_s1ptw_abort(void)
 	*ptep |= bad_pa;
 
 	vcpu_run_expect_done(vcpu);
+	vcpu_assert_serror_pending(vcpu, false);
 	kvm_vm_free(vm);
 }
 
@@ -313,6 +330,7 @@ static void test_serror_emulated(void)
 	vcpu_run_expect_sync(vcpu);
 	vcpu_inject_serror(vcpu);
 	vcpu_run_expect_done(vcpu);
+	vcpu_assert_serror_pending(vcpu, false);
 	kvm_vm_free(vm);
 }
 
@@ -356,6 +374,7 @@ static void test_mmio_ease(void)
 
 	vcpu_inject_sea(vcpu);
 	vcpu_run_expect_done(vcpu);
+	vcpu_assert_serror_pending(vcpu, false);
 done:
 	kvm_vm_free(vm);
 }
@@ -395,6 +414,7 @@ static void test_serror_amo(void)
 	vcpu_run_expect_sync(vcpu);
 	vcpu_inject_serror(vcpu);
 	vcpu_run_expect_done(vcpu);
+	vcpu_assert_serror_pending(vcpu, false);
 	kvm_vm_free(vm);
 }
 

base-commit: fa22cd9947fc245d71bc40482f7f78eb0d5a4af0
-- 
2.39.5


