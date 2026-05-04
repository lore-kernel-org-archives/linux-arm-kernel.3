Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EFBCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 21:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpZCDOiFD5ADpp1wKWAJRO360JAEeKFaw0Z2nRZPnRE=; b=DXsTJec16z9oB9j2HUsGxXpU3h
	Kw9NW1262uff9meeKtUR7Mo4+MxTA/160Dfj1zssyZ1IfPZmmnmv8bRn3+HfMDUoqSaUof0mcicLn
	/c1COUI/a5QAFI/xHSp/bgEY2qfRKwAf+kRoJhsoBhvazsn3TxIZ5pD/qyRUxqtgPJHN3hR6FyWkq
	BnHl1yIP9/bXgUTT7DLwGqPfV7bWfR+NNwaRxdW7rk7tJd+w3JY7/DpbhWPJH7LlBzY9dQ6LSHvSC
	X84wUPV+YFomfYXOjwh58kHORkGw3dG4qRdc2iqG1gPqnKtd6ncjU9w/mIbYYa+/EHS+k2/vmgYPA
	zK4Cf9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0ga-0000000ELMs-0LTq;
	Mon, 04 May 2026 21:18:40 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gW-0000000ELI9-14QA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 21:18:37 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7dcde7bf859so10210906a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 14:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929514; x=1778534314; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zpZCDOiFD5ADpp1wKWAJRO360JAEeKFaw0Z2nRZPnRE=;
        b=wQouJxyk+gnouHe4gEAjM4NHSEtXjUwC/UHlkV60rEZ3DdxiQC9PzKk2WpQUMpF0bE
         YfGQb//ps0dngx3z94g+pXsXKI6tFNrGK3MYYSRMcXgL5JDL7lekoQ02zMhRxjsGHxkE
         3U8X6VDaQAFjLcLGcHfcmPamtIGmizsCd/brYHaiY1oSTIYR1M9PoTX0ya6AUU1feGyk
         4fGDGRFGFkB/bhZOyFUeMcdMbREJp1Xm4C9GTmp5FYwee0iWFgtZ4u2Q20JzLe9uMpbj
         dm9SJ4Tl901J2NKZC1PS68pqMajXZ2uG8se41xhQPvKHAbDQNb0hFnsY0FM0fqMpsAiu
         54JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929514; x=1778534314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zpZCDOiFD5ADpp1wKWAJRO360JAEeKFaw0Z2nRZPnRE=;
        b=Kx4eKPeutjQwm7aj8qgpSwkwxS+36udlqVksI1g4OSpB9jl8eEeMg2VfMcluh5CSr9
         eF3X28AUohG1VsYaKZwzRgDKwGWQ0pr9PWMw/cczLGwNSWhXO+nJg1T6bjbsTieKKNt5
         9xoN2pJO0sYARb8jQ/POXjwyhrG0uI3S6zGo7ZO+qeayUcsByk841woVt1693gELqwFf
         CCAbeC0YpooLeGh90WwujnvrXCJ7xGmhxuDMLEO/m++ASEuA4W4PfZaHGX49NAvKLkFr
         nnWk42xKWY+J2Uoj4B4XObKe2DnV6RALkDhgED9n0DjZmm/5oYBQErSqJGfauf3kaW9h
         WFoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ejFhBdvrA2/mUx3BS2jL9G/dcbjtKW6ZtavgpguOvs/R122vtUenHXz/Rxxw3g1S1Up6ktuse4QYE7NkHnQ/t@lists.infradead.org
X-Gm-Message-State: AOJu0YyYmoQFlJMvfw9nUyBYchmAKoDMvazfegJBrAsy3Uz7yJfw5/Hh
	MOMhUCviEIMIdxSXaKUZ1XbcpsPe0u6j0se/FyKO7ng/ctDNp+7xKsVDafJYx1bXG/C05nBH4KM
	L1RHcX/4asGiIyiZ0FN1/pcipZA==
X-Received: from ilqa6.prod.google.com ([2002:a05:6e02:1206:b0:4fa:1fcf:cad3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:99b:b0:694:8bfa:7817 with SMTP id 006d021491bc7-69697db8330mr6011884eaf.53.1777929514318;
 Mon, 04 May 2026 14:18:34 -0700 (PDT)
Date: Mon,  4 May 2026 21:17:58 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-6-coltonlewis@google.com>
Subject: [PATCH v7 05/20] perf: arm_pmuv3: Check cntr_mask before using pmccntr
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_141836_316006_9C8A2E76 
X-CRM114-Status: GOOD (  11.59  )
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

Check cntr_mask before using pmccntr to ensure it's available. With a
partitioned PMU, there may be instances where pmccntr is being used by
the guest and will ba absent from cntr_mask.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 1cceb1f614515..7ff3139dda893 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -993,6 +993,9 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 	if (evtype != ARMV8_PMUV3_PERFCTR_CPU_CYCLES)
 		return false;
 
+	if (!test_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask))
+		return false;
+
 	/*
 	 * A CPU_CYCLES event with threshold counting cannot use PMCCNTR_EL0
 	 * since it lacks threshold support.
-- 
2.54.0.545.g6539524ca2-goog


