Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9CACA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 05:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eqJik4IYOHY/75Y5UuCar2kZCYK5tdqZHpjteh0qpAE=; b=YyCYeEG1MT47EgpoqCdwFxAF02
	lxsNsGKVIJQH5fdfDLQhQSE0Czd4V7R8WL4a+ZQDFxiTZyoJHgob7SRvebnhLujric73YbkAkl/oB
	V8ylsmCVfveAKL79XK8Co3vHrUkVtq1J9lz/04+FJww9VpWG3luHJN+As3QwYl1BRp6ZkFGrNFjbT
	pHt0XZW7UQZZiAISZPdbuYfEpt/ocxm2h6OzkuB5+X8z4AQ2LE6uoTsUpngiH9QBOyTu+Ft0TxzgZ
	u/mjcOHi0iaKFQzOmaOC5c5OOB7QSZlxDujTrH2oD5qMv2f/Vwi3YSD3K6mqETpUy28S5iqDHui/y
	chAXlSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDarn-0000000FgKc-22rq;
	Mon, 05 Oct 2026 05:03:59 +0000
Received: from out-86.mta0.migadu.com ([2001:41d0:1004:224b::56] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDark-0000000FgJp-2UKq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 05:03:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1rAAjG7z10ioumPSrvqWzbDK82NOUf1K670uFQMRS8o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791176631; v=1; x=1791781431;
 b=oDMhlVj9/nI1UZ/sFwlnmgPqdqbnBPoYi3iurNSUjbU4rIQS0n/T78TbtBGGI3/ht/Gwel5i
 1iZpxicyUc0ukcYzN6kqumBkthyxRM+sEBD9P8z0Bzc2Hcur/WJiNK1+nTHEBlZfkhXBh2xLvm2
 tt9u/Xzev2SonrF/sX/c0W6M=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 80948e4cdbc2f4cc;
	Mon, 05 Oct 2026 05:03:51 +0000
X-Mizu-Trace-ID: 80948e4cdbc2f4cc
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
Subject: [PATCH v3] KVM: arm64: selftests: Check SError is not pending after delivery
Date: Mon,  5 Oct 2026 06:03:49 +0100
Message-Id: <20261005050349.836795-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_220356_837786_160900CA 
X-CRM114-Status: UNSURE (   8.98  )
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
The fix from v2 was applied [1], but not this test.

Changes since v2 [2]:
- Dropped the fix, now in kvmarm/next.
- Rebased on kvmarm/next.

[1] https://lore.kernel.org/all/20261001135711.1640520-2-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20260921101030.1231605-1-fuad.tabba@linux.dev/

 tools/testing/selftests/kvm/arm64/external_aborts.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
index 7836756a38a6c..c35b0c87250a1 100644
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
 

base-commit: fa22cd9947fc245d71bc40482f7f78eb0d5a4af0
-- 
2.39.5


