Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93EBCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiWd74ZCGfHByAMCCnxU+D58hX3cmoUbDQ+hmZwcLEk=; b=K4GC4+7gOuOIDLQQaQbCyUjZtK
	ACWm/E1mtG79uEYP4DWR5ZmTuJW2K9eiNrcFK1ORCUPaYe6hy4ZgTbUU4R3qNqyb2KxbGSlCLdK95
	S6GlwiOMEQXlNsrLg+4DdJV/qrcYJbigoDtVc068QfZs+TjuqJLUdhpO1LBGVTavA97QRY20cUiGM
	nryCDJQMhlzQNP1rmNd5i9DX3A1m0M/mYYyamLtHrcIK3GSnuMqU0dgJRzZeg5gffxCqxRI4LleWV
	zLAo0UJWsLUcaUSSuss4+UqU3XYu0YM1XXtvzTH1roou4AB+wXCJLA9oLcGrl7fZLxH25tN+JAeWV
	QqDE4+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hJT-0000000CcRM-3opG;
	Fri, 03 Oct 2025 15:03:15 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hJR-0000000CcPq-2fTo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 15:03:14 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso3272737e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759503791; x=1760108591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiWd74ZCGfHByAMCCnxU+D58hX3cmoUbDQ+hmZwcLEk=;
        b=jvJVNXa5wMch/9kbQ48nUfT2P9m1lCNZvbgvcdc2Nt7zcdKGdOIEVYym95kDhHOjMF
         T+GZJyPbPFcqntcHVi3j0uIoxTl6NihotLwHslo2HmlEXaLPZdJ5Ta/JZ/edwEOJGrMU
         xf6nW1ps2Yc+JXksCKYE9HRHeDW6NcmG74TShO0AedJA1NK5ribiRUQ90eCs7EXNh8gS
         sQjfMFQXrXRg1F4nh+0cIM/Ft8pxUkai0Jh4GM8G0k1Xj5K4nDjjl0La4oCrIPEhOaMb
         2s6h+mCia0D3+rKB+mEkKcm99+JkK+yKLpl7fSEVIPIIzJiiSTkjTt0gKW82ChQxzNd3
         1O2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759503791; x=1760108591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiWd74ZCGfHByAMCCnxU+D58hX3cmoUbDQ+hmZwcLEk=;
        b=U0VK7JeZIUUfjWQ+C8fFWi/sual31utyN/TOAo5o/Iu00UdLXvwrkBSg4cDjipo8cg
         CFd/T9ceWSGAmOV+EtEL6p25oR4SPvfeHfvt2gsl6wXd05YUr2NGAW1BkUdGyAZRSJwg
         Lpsds4dJ58EvcxnP6fwRZ8zHN5NXphwc/zVH90Pd4mJyOuZZMWUVKSXMnAU6NsVgRshP
         VXMM+biB6EWeoZ0d/IgU3V2PO5OEKft5dWGH9E9G5qj+3+hYlJ5vdVhDVDV9PiPLpSML
         XraFvKkrTfVmwBNu68nrhCSfc1rgeIn+OAhXRABYCs+tV+vRPFMnFKgvEYMRi2ssvmtH
         Y7fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnMuKfwsy/nHEGyPvGjjfJ90Mx3WlQBo9t/H/bv9njCpKEpJD/dw08LVK+TlXVef99B00igY4K561CKnMWhbBm@lists.infradead.org
X-Gm-Message-State: AOJu0YwpsxeIZXvBK8ean5CBMuGSaUOd3YqSVqst5+ivBx71/CYXgZlc
	y92NaWiPCHUQ/TTwbbrk+eJoPS0iPEDTV8QKVE0fHPV73Ut76a9ONucBrT2cfldRpo0=
X-Gm-Gg: ASbGncubuipM73dJ8a7eMPLqLJEOLkQpE5vWZ3il996U0TRNAM2qLyCXM6AcsGouY4O
	vE2OcrT1rDqOLM9Y0r422C6yVH4WsZx8PC85sYv8OzhcrH53NEG4juOUF4Sg0oOz7/pZ3Z9/GNx
	AV0cmRVI1LQmbvM/rOdTBekdDowEAJC7MqQeOp7JHo3I1U4VNEYNmVno+ELd7Ix6VD8VnS/9BRe
	AXiLiv7LX/QFfR0crvUeCQYfcFIj786eYJmq06HxSkEqx5tvxk7+bY2+ktBFppdU9MqhpVqofQZ
	77p7jrKI08wuej/ebzleGOyeggesoyOIPGW1MEe10DR/V9LDI3OufAUHQTxs7W5VW8ZfjgRGjkA
	3XipxVvsGAOMl3T5XpubNpMvCanoXT2hzUQQ1V1MQG8PsOhbHapnwfdv+ORGJHgxFC7TfPmm27h
	om3vOodCGqbPQ8mhkutKZWQFxc
X-Google-Smtp-Source: AGHT+IGyJEOVsOGaJivQixkkTNrPfM7QlcKiFG+WBD/H9sXsSIxK6ThXRU5bBxi3vw/zF8JXbdqp6Q==
X-Received: by 2002:a05:6512:6193:b0:55f:43ab:b220 with SMTP id 2adb3069b0e04-58cbb4418e8mr977737e87.34.1759503791304;
        Fri, 03 Oct 2025 08:03:11 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011343b6sm1933369e87.35.2025.10.03.08.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 08:03:10 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Maulik Shah <quic_mkshah@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 2/3] arm64: smp: Implement cpus_has_pending_ipi()
Date: Fri,  3 Oct 2025 17:02:44 +0200
Message-ID: <20251003150251.520624-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003150251.520624-1-ulf.hansson@linaro.org>
References: <20251003150251.520624-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_080313_692930_20237FEF 
X-CRM114-Status: GOOD (  13.82  )
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

To add support for keeping track of whether there may be a pending IPI
scheduled for a CPU or a group of CPUs, let's implement
cpus_has_pending_ipi() for arm64.

Note, the implementation is intentionally lightweight and doesn't use any
additional lock. This is good enough for cpuidle based decisions.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 arch/arm64/kernel/smp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 68cea3a4a35c..dd1acfa91d44 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -55,6 +55,8 @@
 
 #include <trace/events/ipi.h>
 
+static DEFINE_PER_CPU(bool, pending_ipi);
+
 /*
  * as from 2.5, kernels no longer have an init_tasks structure
  * so we need some other way of telling a new secondary core
@@ -1012,6 +1014,8 @@ static void do_handle_IPI(int ipinr)
 
 	if ((unsigned)ipinr < NR_IPI)
 		trace_ipi_exit(ipi_types[ipinr]);
+
+	per_cpu(pending_ipi, cpu) = false;
 }
 
 static irqreturn_t ipi_handler(int irq, void *data)
@@ -1024,10 +1028,26 @@ static irqreturn_t ipi_handler(int irq, void *data)
 
 static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
 {
+	unsigned int cpu;
+
+	for_each_cpu(cpu, target)
+		per_cpu(pending_ipi, cpu) = true;
+
 	trace_ipi_raise(target, ipi_types[ipinr]);
 	arm64_send_ipi(target, ipinr);
 }
 
+bool cpus_has_pending_ipi(const struct cpumask *mask)
+{
+	unsigned int cpu;
+
+	for_each_cpu(cpu, mask) {
+		if (per_cpu(pending_ipi, cpu))
+			return true;
+	}
+	return false;
+}
+
 static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
 {
 	if (!system_uses_irq_prio_masking())
-- 
2.43.0


