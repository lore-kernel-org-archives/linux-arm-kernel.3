Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E948CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRgEqIoxZpJY3Vtnk+TDaJkye7JvksGsldVSrPpS5hM=; b=hEEmAS2XT4xTsz+H3nbjre5hT6
	3iLeQN2C8yWh6Ln/0rfQQlp7zwh2VHLV8OMpFjrJ+BY8ayTgoKcki45QAv9WfnMbth4K9t+t4PjGH
	oIoBuDxcoXkHNswj8xjiLsHiJ556mjzYsfjAxbDMnRZxf6enealnVAtRoo9dEPps5Lnq/u5tKV68y
	HhrYc1LiOP5GqOEM4f29H+ZTVlUc4QaM1nrByQK3zGUUMmLD6ZC+rc+1EyHjohKtS+mnbfSrLS6gx
	3pDYoI4HoGvGy9oQKBQEV2woHSiLZxmV0IghZdRNAkKUrgSV5VF9RRX2bQ+rJct9Snc2Xnq8wyoN0
	wz+FIAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMJs-00000001srq-3GQE;
	Wed, 07 Oct 2026 07:44:08 +0000
Received: from out-11.mta1.migadu.com ([2001:41d0:203:375::b] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMJn-00000001snr-2UaT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:44:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=bjOOpGQalIV2u3GzuAco4r3khbtIp5Sk4WKZwpv659A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791359041; v=1; x=1791963841;
 b=EAb2NEU4kcntnF0HNhYzons5qDfod7RZ4elFnlzWpnZRc5vUNtW3yeHPBYqPBaFNmOc2vVFc
 avPPq532zD/r0QtF2jOmiSNO+yxJch+m94n8JL+btsTkROAee4ti0aNqBQYniuQv/eWfn7rZtNC
 3QiOYsTHuQuTsVdvv+/GVqns=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c64450ccc961372e;
	Wed, 07 Oct 2026 07:44:01 +0000
X-Mizu-Trace-ID: c64450ccc961372e
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 3/3] KVM: arm64: selftests: Test a timer set past the counter's wrap
Date: Wed,  7 Oct 2026 08:43:43 +0100
Message-Id: <20261007074343.324269-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261007074343.324269-1-fuad.tabba@linux.dev>
References: <20261007074343.324269-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_004403_782470_04C008A6 
X-CRM114-Status: GOOD (  11.73  )
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

Program an unmasked timer whose cval sits within long_wait_ms of the
counter's wrap while the guest's counter is at wait_ms, and expect no
interrupt. The guest's counter can't reach it, but a host that applies
the timer's offset by adding it to cval wraps the sum into the past,
and the timer fires at once. The one existing case with a cval past the
wrap, in the sanity checks, runs with the timer masked, so it gets no
interrupt either way.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../kvm/arm64/arch_timer_edge_cases.c         | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index d9c9377a63256..d46799ff91dc1 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -787,6 +787,30 @@ static void test_timers_in_the_past(enum arch_timer timer)
 	}
 }
 
+/*
+ * A cval within long_wait_ms of the counter's wrap while the counter sits at
+ * wait_ms: a deadline further away than the counter can reach. Unmasked, so
+ * an early ISTATUS shows up as an IRQ.
+ */
+static void test_timers_past_counter_wrap(enum arch_timer timer)
+{
+	u64 cval = -msec_to_cycles(test_args.long_wait_ms);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sleep_method); i++) {
+		sleep_method_t sm = sleep_method[i];
+
+		local_irq_disable();
+		set_counter(timer, msec_to_cycles(test_args.wait_ms));
+		set_cval_irq(timer, cval, CTL_ENABLE);
+		sm(timer, msecs_to_usecs(test_args.wait_ms) + TIMEOUT_NO_IRQ_US);
+		local_irq_enable();
+		isb();
+		assert_irqs_handled(0);
+		timer_set_ctl(timer, CTL_IMASK);
+	}
+}
+
 static void test_long_timer_delays(enum arch_timer timer)
 {
 	s32 tval = (s32)msec_to_cycles(test_args.long_wait_ms);
@@ -806,6 +830,7 @@ static void guest_run_iteration(enum arch_timer timer)
 	test_basic_functionality(timer);
 	test_timers_sanity_checks(timer);
 
+	test_timers_past_counter_wrap(timer);
 	test_timers_above_tval_max(timer);
 	test_timers_in_the_past(timer);
 
-- 
2.39.5


