Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44624C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 14:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unMc8iAgdhI+llHDkqJsAFL7ZbF0O8Lqzu9ojtHqeJA=; b=kS13oow7UXsdqGHlqrO10G4+v8
	JafgHy5KD2sS9rVhOTRzqTQWdlxPfejQn6j8COoF2R2V1sbNrVucloTnj/D37JXWooTzBrmSuOJ3d
	zInYz6+i/bXCdGGQAV5JipnQrQj37yfJ6b/9yoRYDbdWsywKa6DwshoZRsa8tAx7Rk7pIVEhtqcKx
	xgz25aFVTX6uJ4j+6u/YeM81kjpFfCihxV02te+cVHK7JJFjz82sgPBglYu1XvvLekHCH+8eKHEbs
	N8wz8+fVrz1+uxMWQhciAfD90YERUICuT7VIpoxFyMP5fuC436B/vh66AjnsgAQ8vHMwCGG0d8P1d
	cha/Hb2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvOD-0000000Awk4-1opf;
	Tue, 27 May 2025 14:34:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvEc-0000000AvZK-26M2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 14:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748355893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unMc8iAgdhI+llHDkqJsAFL7ZbF0O8Lqzu9ojtHqeJA=;
	b=d4vTrN/l+CNo+5Ckh3rOvsLNvzxQBUoZbEwIghHAN0hdFCu162LqiYYymeaiCSz3pix8oc
	8zQAYTJPLtPwBqI99SucZWyBCVAf8Nckf2Wmelg0PjwQYmSDfR1yRC3fTvm+8YKW6Dh1oe
	r7OMkm3LsRDPBrDMSCy+06G+26fuI3s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-VyvbVfSTOy-smnpa6Utpmw-1; Tue, 27 May 2025 10:24:49 -0400
X-MC-Unique: VyvbVfSTOy-smnpa6Utpmw-1
X-Mimecast-MFC-AGG-ID: VyvbVfSTOy-smnpa6Utpmw_1748355888
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39ee4b91d1cso2066217f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 07:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355888; x=1748960688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unMc8iAgdhI+llHDkqJsAFL7ZbF0O8Lqzu9ojtHqeJA=;
        b=sb7S8kp0jkfkR0roIJj0QuJpws2aC3rIZWh30kuR5NK5KnqKk0Vw6GAaB8FaHQfT7i
         KMdvhsAtQUHxal9ff79OBCcqvUDDJMQeM93gqWemsxCZtAMAxqvjZGDweqG2baJONvix
         wehC7kWFNV9gubiOX6HrXieBGM7DYikl3fHLYgBDTFsdmjc7CWueYNi+rjFnNheclcyV
         p8v9UgNe0nji79uRothD/8TIa0WdK9EZP2Ju1ajsX/ifJLEcjvIKniM9c5XgXBx6gBjP
         CE/8PdxIo87VkNxzvKCBFbYyO92tEHKt6s2SUHWoU0sFkGZ2/VApBl+E4+fDIg8Zf7IW
         CQMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo9Mx5PLHQ2wedRusKxg4iNSwfZtFa/vCG2h2pGb9Jl4Akt1odOdasRWejx2jy53QYemSSqnlhm9+tXge06a0e@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5Ky2PPp6520nTs1wpUN5GEurk7rrEpjxxv/TQhnY9MEn9g7O6
	Snu9cww3+0t52PXN9YXAA8T+u1NHuTFpYaSylpai8mlbq0zmbnuJFRFEN9Bxjtu6sKUfpZaUwL5
	MaFGV8bQm+4uauUfB857BGjvrYBhys/xbA1aMlRVZEilgClyFiHWRXtG74d0XfqhJjgjUJvrd4n
	qF
X-Gm-Gg: ASbGncvtVS5nPUOIv3yNydiF0WpH2TpHwydlmDLikc2up7w33Cy/jmWJ0JPqy+T22L2
	s4+ranKlRfOspCCpbdx0ikh6DWv+jCdhnMBjP7LQrpSRyRFvoc1OIrBiNY42JSJS/7F1MobkgQG
	6xjMAydPIYhw67PqJ0HKs547M2EaGHyjn41ZmuM6DCGAcSilwSm6aa7REC5UiiVRjFsMiPoVPk5
	cD3fk3gLmF27uFHPjHk1ptwaE1PFqk1t6uw8Y0QHKwHC9TfNh4I4yWTA1nZ+S8k33U2R/s4T5Zh
	+Oohm6iERx5HZFH5b7ED7Mgq1MUGyp2IqwJiYZ5QsCTaPqdfzV67uxgDmLTbzz0WJggUKpmNkQ=
	=
X-Received: by 2002:a5d:5f55:0:b0:3a4:e1ea:3b38 with SMTP id ffacd0b85a97d-3a4e5e5d241mr1030437f8f.7.1748355887865;
        Tue, 27 May 2025 07:24:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED6cDk0pjU6x3lxG7ezTVdoW3wzIGaXlNoiosT7cd0gwNQ04WLe8XIloW7vpZA7k37aWMp8g==
X-Received: by 2002:a5d:5f55:0:b0:3a4:e1ea:3b38 with SMTP id ffacd0b85a97d-3a4e5e5d241mr1030399f8f.7.1748355887452;
        Tue, 27 May 2025 07:24:47 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3edcsm278766415e9.20.2025.05.27.07.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:24:47 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Colton Lewis <coltonlewis@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v2 3/3] KVM: arm64: selftests: arch_timer_edge_cases - determine effective counter width
Date: Tue, 27 May 2025 16:24:34 +0200
Message-ID: <20250527142434.25209-4-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527142434.25209-1-sebott@redhat.com>
References: <20250527142434.25209-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KOR1bwR8DCayD8HKiS9ehGd6KUmZZ5YZZtOHK5Fd0Xc_1748355888
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_072454_625960_F6A7A947 
X-CRM114-Status: GOOD (  16.26  )
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

arch_timer_edge_cases uses ~0 as the maximum counter value, however there's
no architectural guarantee that this is valid.

Figure out the effective counter width based on the effective frequency
like it's done by the kernel.

Note that the following subtest only worked since the counter initialized
with CVAL_MAX would instantly overflow (which is no longer the case):

	test_set_cnt_after_cval_no_irq(timer, 0, DEF_CNT, CVAL_MAX, sm);

To fix this we could swap CVAL_MAX for 0 here but since that is already
done by test_move_counters_behind_timers() let's remove that subtest.

This also serves as a workaround for AC03_CPU_14 that led to the
following assertion failure on ampere-one machines:

==== Test Assertion Failure ====
  arm64/arch_timer_edge_cases.c:169: timer_condition == istatus
  pid=11236 tid=11236 errno=4 - Interrupted system call
     1  0x0000000000404ce7: test_run at arch_timer_edge_cases.c:938
     2  0x0000000000401ebb: main at arch_timer_edge_cases.c:1053
     3  0x0000ffff9fa8625b: ?? ??:0
     4  0x0000ffff9fa8633b: ?? ??:0
     5  0x0000000000401fef: _start at ??:?
  0x1 != 0x0 (timer_condition != istatus)

Link: https://lore.kernel.org/kvmarm/ac1de1d2-ef2b-d439-dc48-8615e121b07b@redhat.com
Link: https://amperecomputing.com/assets/AmpereOne_Developer_ER_v0_80_20240823_28945022f4.pdf
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 .../kvm/arm64/arch_timer_edge_cases.c         | 27 ++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index a813b4c6c817..1e3e36d869d4 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -22,7 +22,8 @@
 #include "gic.h"
 #include "vgic.h"
 
-static const uint64_t CVAL_MAX = ~0ULL;
+/* Depends on counter width. */
+static uint64_t CVAL_MAX;
 /* tval is a signed 32-bit int. */
 static const int32_t TVAL_MAX = INT32_MAX;
 static const int32_t TVAL_MIN = INT32_MIN;
@@ -30,8 +31,8 @@ static const int32_t TVAL_MIN = INT32_MIN;
 /* After how much time we say there is no IRQ. */
 static const uint32_t TIMEOUT_NO_IRQ_US = 50000;
 
-/* A nice counter value to use as the starting one for most tests. */
-static const uint64_t DEF_CNT = (CVAL_MAX / 2);
+/* Counter value to use as the starting one for most tests. Set to CVAL_MAX/2 */
+static uint64_t DEF_CNT;
 
 /* Number of runs. */
 static const uint32_t NR_TEST_ITERS_DEF = 5;
@@ -732,12 +733,6 @@ static void test_move_counters_ahead_of_timers(enum arch_timer timer)
 		test_set_cnt_after_tval(timer, 0, tval, (uint64_t) tval + 1,
 					wm);
 	}
-
-	for (i = 0; i < ARRAY_SIZE(sleep_method); i++) {
-		sleep_method_t sm = sleep_method[i];
-
-		test_set_cnt_after_cval_no_irq(timer, 0, DEF_CNT, CVAL_MAX, sm);
-	}
 }
 
 /*
@@ -975,6 +970,8 @@ static void test_vm_create(struct kvm_vm **vm, struct kvm_vcpu **vcpu,
 	test_init_timer_irq(*vm, *vcpu);
 	vgic_v3_setup(*vm, 1, 64);
 	sync_global_to_guest(*vm, test_args);
+	sync_global_to_guest(*vm, CVAL_MAX);
+	sync_global_to_guest(*vm, DEF_CNT);
 }
 
 static void test_print_help(char *name)
@@ -1035,6 +1032,17 @@ static bool parse_args(int argc, char *argv[])
 	return false;
 }
 
+static void set_counter_defaults(void)
+{
+	const uint64_t MIN_ROLLOVER_SECS = 40ULL * 365 * 24 * 3600;
+	uint64_t freq = read_sysreg(CNTFRQ_EL0);
+	uint64_t width = ilog2(MIN_ROLLOVER_SECS * freq);
+
+	width = clamp(width, 56, 64);
+	CVAL_MAX = GENMASK_ULL(width - 1, 0);
+	DEF_CNT = CVAL_MAX / 2;
+}
+
 int main(int argc, char *argv[])
 {
 	struct kvm_vcpu *vcpu;
@@ -1047,6 +1055,7 @@ int main(int argc, char *argv[])
 		exit(KSFT_SKIP);
 
 	sched_getaffinity(0, sizeof(default_cpuset), &default_cpuset);
+	set_counter_defaults();
 
 	if (test_args.test_virtual) {
 		test_vm_create(&vm, &vcpu, VIRTUAL);
-- 
2.49.0


