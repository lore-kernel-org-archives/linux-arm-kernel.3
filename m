Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01349C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 10:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amWbxwyASZoUP07CpGcLTUSUvzxbgFk3ulFVLl61SIw=; b=cR5NeFsiPJylXW/iwm4rK1zfAR
	rfNJq4FXxpcgYNGipQDoR4mlKkWn7fMDuwMnciD8PMRvijjshW1INYtx+246XXXJk0kQ7niha/elE
	UteH5KrhmQHJD+8Q1VHZn2dGsPFUrWLw9VGNwKpy/8HDH0nRoudn03n1l8Sv0AEItv+NT3E+xElUy
	EkZ15XJMc+wz6ZxMrBz+U5MTbb2mzP2zrn6qzk5cMMz3mwAFVd3l5i7OlPOYhbBrOav+Pldcmpa0Q
	Z6CPoXAnhn2VChJGn+I8ywbavDEGTam3ere/n9n9Yk4pVGMzt8xlmnrRiOgY7QFxbXxZVfX6zkogI
	91S01QzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN86k-0000000FHk2-1IoI;
	Thu, 05 Jun 2025 10:46:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7y6-0000000FGas-27zG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749119825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=amWbxwyASZoUP07CpGcLTUSUvzxbgFk3ulFVLl61SIw=;
	b=UTymobA//7uaLtfb6rnDnsv8gwpp5qU2qGzy477UKT0kzJE7DisA37fLpDpj/YlxKLf5W+
	LkEZ0B0tOckpREKLrXvSiyKXQ+P0vuMjsULmQTYBlBfWNO2jN5YH6XtfHbXqj5UA4nl8fg
	36uETqcXLGDChLzqFzT/tBP6vixXbOs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-xNavLuWqOuyejGc9J4a0lw-1; Thu, 05 Jun 2025 06:37:04 -0400
X-MC-Unique: xNavLuWqOuyejGc9J4a0lw-1
X-Mimecast-MFC-AGG-ID: xNavLuWqOuyejGc9J4a0lw_1749119823
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-442dc702850so4787405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 03:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119823; x=1749724623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amWbxwyASZoUP07CpGcLTUSUvzxbgFk3ulFVLl61SIw=;
        b=GzJ+32qt/PNHP8bc9HmV4Uk2hxOcWx6+V9mXFRyrL824dVqftZf4cAYyS7M88uoD7c
         Uv/BfyYHEEtleqknbPjEGZhI9UAUwUnCqqYcRZyFWgklaToTssNEjWk69eFGXRKsXgvM
         6q7oLIhuk2P48b9iDTqDwsJTsyfIptXPeBHeumsynKqqE26d6/FsoiPyU9lpHv98+D5t
         Q1yU8h8PtpUsZhLH+pT3fIdS83xtWp3Gi4LBtkhxhX3HXGuiwZIzFurmnQNrBCt4Sxbq
         zWU2vYNdlbYTz7eZs4J94LjdRkBI5uhzwS461tuRmNxUSxBR/6YgM9q7sxJHCJcQRtdu
         JEkw==
X-Forwarded-Encrypted: i=1; AJvYcCW9VlyEn11rI5k6g467HYPJ2iyVpMMpy+VVAal84EysKVRoiAyAbEQlMaSm4TnokisDOUTJwsf3uG//ByqE0bVQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0QydLbUTUxxm3NLOEXbqeEr3bP4iOAviJy72kRHGM8raSHwG9
	a/ophNa4hCzlhJVEs53M9tktzrvZOiHnzq5OnssyiwwiVS1JiHkAia/7v19jBlzsvMRxwg5Pal4
	JZG4TMravVa3AXAFBx+HzDukSZuN6sypbNuVV57IJdrQrqLZ7FyxwKb22Eez+sY0NQ/lgnUO9dl
	o+
X-Gm-Gg: ASbGnctqfEEVbbgXSaXfOVWt4RQPMsJYTrL0bL/YNPLmcZFLfy8G9tgsLBMdtGdbits
	PQRZqLfJMqsm6bkFz7xWBtDG523PvYyXBqPakga0WC3Rk0nR2QdkFcgy4Mp3N0aVmbjDy+Yolyx
	dln9/aw52XlghHvu16WNaq5Z3rydIS6vGCOuq+8t/mnENfFRIjnu9mgsHHQcpNBEf7+lMHmR/zU
	zpTlCjMkAp+UE0rITtsFSEha02hI+1dpvHdJvVt5fpUosAQujVfY1RJfuafMOMQMAVTzsaJ0pKk
	BNbxYYvPrqO6OVSoIH8VnZaPI44xBrx4JpcDFHOOjct7W9X/VbLjJUQn8sG7BBzRtTJOCpUQrg=
	=
X-Received: by 2002:a05:600c:3b2a:b0:450:d5c8:29ae with SMTP id 5b1f17b1804b1-451f0a72e7bmr51415245e9.1.1749119823020;
        Thu, 05 Jun 2025 03:37:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmtZcZkRv3ekScQM6gx63V+kNA53R9LzjK0Zl5xkWmfvukrEiqxBs91K876Y3Lvx+XWubrwg==
X-Received: by 2002:a05:600c:3b2a:b0:450:d5c8:29ae with SMTP id 5b1f17b1804b1-451f0a72e7bmr51414985e9.1.1749119822583;
        Thu, 05 Jun 2025 03:37:02 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8311ae6sm14105175e9.2.2025.06.05.03.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:37:02 -0700 (PDT)
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
Subject: [PATCH v3 4/4] KVM: arm64: selftests: arch_timer_edge_cases - determine effective counter width
Date: Thu,  5 Jun 2025 12:36:13 +0200
Message-ID: <20250605103613.14544-5-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605103613.14544-1-sebott@redhat.com>
References: <20250605103613.14544-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N2j1lKr5AOAQzE2qseQSRzIgM7QWUvX0BBvdp5JRPvc_1749119823
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_033706_634614_E0034F82 
X-CRM114-Status: GOOD (  14.97  )
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

Note that the following subtest only worked since the counter initialized
with CVAL_MAX would instantly overflow (which is no longer the case):

	test_set_cnt_after_cval_no_irq(timer, 0, DEF_CNT, CVAL_MAX, sm);

To fix this we could swap CVAL_MAX for 0 here but since that is already
done by test_move_counters_behind_timers() let's remove that subtest.

Link: https://lore.kernel.org/kvmarm/ac1de1d2-ef2b-d439-dc48-8615e121b07b@redhat.com
Link: https://amperecomputing.com/assets/AmpereOne_Developer_ER_v0_80_20240823_28945022f4.pdf
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 .../kvm/arm64/arch_timer_edge_cases.c         | 27 ++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index be8bbedc933b..b4d22b3ab7cc 100644
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


