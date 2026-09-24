Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2E4C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5W1e+57WPZC5ylekLTUke1/q6aLnHyh/qcUsGkQ31Y=; b=KlFUI2iIbOvik0wRwp1hL9PsRD
	eanxC/EYuE9dTqvHxsZfq4Ok5fynDL2V8AFq4EdJN5sYTLqzPx0zAwKhXStzPLvE5nP37oR4wOyeG
	jtXyN+1uaZJHIB1tFDNxipscZ0ruRFZqlZySRG4p81w89UClPkegRQAsF7Ai0dVo8XfDMR2g/vlWy
	voEGA2Fv8Emzeuha9cnUpPIH3dlKAUuGJfxRvuy3DytwwtSJdKB2VOfQzha4kdnczFx3SazyUesZh
	coC0S39cMddZSoDK6udDxJEe76WA5YxMLSb3++5IdevcnJguFocZd6voVUbjQPI7vujlE9kHT7/2q
	jmk0yHIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nHm-0000000Bklp-0Rk1;
	Thu, 24 Sep 2026 17:31:06 +0000
Received: from mail-ot1-x348.google.com ([2607:f8b0:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGQ-0000000Bjrc-3jyg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:47 +0000
Received: by mail-ot1-x348.google.com with SMTP id 46e09a7af769-80621978fddso9785a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270980; x=1790875780; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5W1e+57WPZC5ylekLTUke1/q6aLnHyh/qcUsGkQ31Y=;
        b=tHM6SOQ6aFxNKlRW3BZZmXcRTPRpDZKp9IIaSUukC5GdTS3SiszkSPcn0yrMHqwl6/
         7fMMp5NWuci+KaIKCJVq2MVIkE26RUgPKTmrK+7duFMm3KgN7ZKXQQUpS/+6CPlvmbb3
         3ON5VC9whcMiyYpGBOxdMkcui15+qsUQKoRKUNMxWd24+xhsdXJAHLz6cEV3mMNKiL1e
         UOApb/wcmyNCNd6aMNhFhqibDsfjUF/F7LlkFjzDQrjRpnjNKC5T+sHAZ6g1YmIbRhV9
         d1OIWqkGjSaNqP4jHRRdvGWSwiQz3KKwADt0eMT9b/Lnm+vDfbjQlihcL8r2OU+gHv4o
         W8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270980; x=1790875780;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5W1e+57WPZC5ylekLTUke1/q6aLnHyh/qcUsGkQ31Y=;
        b=QmLyFbXzeZNLlMHXEfDAU3TIkNbepmC0PYZpMv9o5YI9be98B7e1m3b3Tp/VPPgvRC
         P0hIY/VYQ/81OB00XGrgn6qK1QFtBLRc1XZaGyvlgQv7TRwAfcp8cLw428defIFi8Pdo
         yQJkuk9MXRpWDiRuLXAUhJbqdaNPtZ6WvS8lix1OUCTXyzSDABgFEyENv/Amha7kwnss
         L4EQikLLpK9A7zOslU5RBx9cA5FGEwVsfHlJ5n26LyPDCqyrJfSVOs83ZnRgeunKFpRP
         /dbUtNhfHHHQG8hCr8QBg0ewsgQMJwjbWEzqzR4sMomI8CXfdizeWCr7MPK2pwTzTQwA
         XsRw==
X-Forwarded-Encrypted: i=1; AKwUvBwpJWi7pZXUIhm5oIctEEsJ6z6iIT9BAwfH9PgN6ExvwI/UAMKIYv86qu5rAlykQcXabKAfZXl+z1/ItDanqBsZ@lists.infradead.org
X-Gm-Message-State: AFuF++lyPGcoyoP9JFcIBiPskzd6NvvU9KShqcOBw5ffpwzYjjHRhgC2
	f1zE1cYzcXEZxxGfyrsxF7HZuap1XYvVkvvOYS4lY6k+uVe0irSAfnekGG06M2hV8ZrnTzRbrS9
	xGOKgzTW5bcZmWRCToGjHu6T+/A==
X-Received: from iljv7.prod.google.com ([2002:a05:6e02:13c7:b0:50c:1029:973d])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4703:b0:4bb:5ceb:47e9 with SMTP id 5614622812f47-4d72ac46b14mr3160836b6e.37.1790270979881;
 Thu, 24 Sep 2026 10:29:39 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:13 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-8-coltonlewis@google.com>
Subject: [PATCH v9 07/22] perf: arm_pmuv3: Allocate counter indices from high
 to low
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_102942_990525_904A3897 
X-CRM114-Status: GOOD (  15.67  )
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

To minimize collisions between host and guest counters, allocate host
counters from high to low. How the pivot HPMN is defined to partition
the counters gives the guest the low index counters.

Verify both the upper odd counter and lower even counter are present in
cpuc->cntr_mask when allocating 64-bit chained events so that an odd
HPMN boundary does not leak a guest counter into a host chained pair.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index c15a34684137a..4fcdae8021a56 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -958,10 +958,12 @@ static int armv8pmu_get_single_idx(struct pmu_hw_events *cpuc,
 {
 	int idx;
 
-	for_each_set_bit(idx, cpuc->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
-		if (!test_and_set_bit(idx, cpuc->used_mask))
+	for (idx = ARMV8_PMU_MAX_GENERAL_COUNTERS - 1; idx >= 0; idx--) {
+		if (test_bit(idx, cpuc->cntr_mask) &&
+		    !test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
+
 	return -EAGAIN;
 }
 
@@ -974,17 +976,22 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
 	 * Chaining requires two consecutive event counters, where
 	 * the lower idx must be even.
 	 */
-	for_each_set_bit(idx, cpuc->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
+	for (idx = ARMV8_PMU_MAX_GENERAL_COUNTERS - 1; idx >= 0; idx--) {
 		if (!(idx & 0x1))
 			continue;
-		if (!test_and_set_bit(idx, cpuc->used_mask)) {
-			/* Check if the preceding even counter is available */
-			if (!test_and_set_bit(idx - 1, cpuc->used_mask))
-				return idx;
-			/* Release the Odd counter */
-			clear_bit(idx, cpuc->used_mask);
+
+		if (test_bit(idx, cpuc->cntr_mask) &&
+		    test_bit(idx - 1, cpuc->cntr_mask)) {
+			if (!test_and_set_bit(idx, cpuc->used_mask)) {
+				/* Check if the preceding even counter is available */
+				if (!test_and_set_bit(idx - 1, cpuc->used_mask))
+					return idx;
+				/* Release the Odd counter */
+				clear_bit(idx, cpuc->used_mask);
+			}
 		}
 	}
+
 	return -EAGAIN;
 }
 
-- 
2.56.0.rc1.310.g51773c2048-goog


