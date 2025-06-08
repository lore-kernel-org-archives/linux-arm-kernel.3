Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B958C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 09:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mFeNLmeUYvcx0Sby30gvWYu18HQQjsxDQWfQuWDwMHU=; b=XmfnPLN08DSlnW8xdR6I/qMqC0
	GHIM7zSJL9KG/3IvXlJ7rOXqf91fHnf60/oGG3fHMzjBaAJaQU6t0wyUCM7CSrUCwDnBDZqIN79f0
	raJQb0IDj+hlhIHhDfIuebmf7eAI4GGMrZr3OLsxkWMNPNsovuasR2E0AYMO/gZ3zucSGjcx1CS42
	oANbjuYLqErbLGML7E5o3RHDuDhIz3XWsexnzjS7Ao36hlSN1W/ol/BhnIOjPozb5eEYm9ORmKbP6
	e66L5ZFnWxzmvdvGhizjXvIiRwu6I2HePzNAENwGDHR/R3GJF6iZcQsLzGrgqKo4J4CBsEh4Ab5nC
	Ex0jPANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOClY-00000002Vyv-1qQX;
	Sun, 08 Jun 2025 09:56:36 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOCjP-00000002Vvo-2OFp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 09:54:25 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bFVjF3T3sz1fy4l;
	Sun,  8 Jun 2025 17:52:49 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 9AD96140155;
	Sun,  8 Jun 2025 17:54:05 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sun, 8 Jun 2025 17:54:04 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
CC: <maz@kernel.org>, <oliver.upton@linux.dev>, <joey.gouly@arm.com>,
	<suzuki.poulose@arm.com>, <wanghaibin.wang@huawei.com>, Zenghui Yu
	<yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: selftests: Close the GIC FD in arch_timer_edge_cases
Date: Sun, 8 Jun 2025 17:54:02 +0800
Message-ID: <20250608095402.1131-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_025423_794584_78BA7E11 
X-CRM114-Status: UNSURE (   8.23  )
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

Close the GIC FD to free the reference it holds to the VM so that we can
correctly clean up the VM. This also gets rid of the

	"KVM: debugfs: duplicate directory 395722-4"

warning when running arch_timer_edge_cases.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 .../selftests/kvm/arm64/arch_timer_edge_cases.c  | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index ad882ec8ff7b..b75e506324ce 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -954,6 +954,8 @@ static void test_init_timer_irq(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	pr_debug("ptimer_irq: %d; vtimer_irq: %d\n", ptimer_irq, vtimer_irq);
 }
 
+static int gic_fd;
+
 static void test_vm_create(struct kvm_vm **vm, struct kvm_vcpu **vcpu,
 			   enum arch_timer timer)
 {
@@ -968,12 +970,20 @@ static void test_vm_create(struct kvm_vm **vm, struct kvm_vcpu **vcpu,
 	vcpu_args_set(*vcpu, 1, timer);
 
 	test_init_timer_irq(*vm, *vcpu);
-	vgic_v3_setup(*vm, 1, 64);
+	gic_fd = vgic_v3_setup(*vm, 1, 64);
+	__TEST_REQUIRE(gic_fd >= 0, "Failed to create vgic-v3");
+
 	sync_global_to_guest(*vm, test_args);
 	sync_global_to_guest(*vm, CVAL_MAX);
 	sync_global_to_guest(*vm, DEF_CNT);
 }
 
+static void test_vm_cleanup(struct kvm_vm *vm)
+{
+	close(gic_fd);
+	kvm_vm_free(vm);
+}
+
 static void test_print_help(char *name)
 {
 	pr_info("Usage: %s [-h] [-b] [-i iterations] [-l long_wait_ms] [-p] [-v]\n"
@@ -1060,13 +1070,13 @@ int main(int argc, char *argv[])
 	if (test_args.test_virtual) {
 		test_vm_create(&vm, &vcpu, VIRTUAL);
 		test_run(vm, vcpu);
-		kvm_vm_free(vm);
+		test_vm_cleanup(vm);
 	}
 
 	if (test_args.test_physical) {
 		test_vm_create(&vm, &vcpu, PHYSICAL);
 		test_run(vm, vcpu);
-		kvm_vm_free(vm);
+		test_vm_cleanup(vm);
 	}
 
 	return 0;
-- 
2.33.0


