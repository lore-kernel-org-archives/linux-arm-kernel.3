Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75833CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGqVXPX174dI1TmkMpyvoDpe58SAFIHrUIhMpLUiKvg=; b=AnWZ6xZVsQ8MRBKNi6fYTbIvxj
	LgUo9gzSqldwjgKKNXp2cI5aXpl+QSteuFLYU8VbAK+7MvEmBp4yKRqrL71dWwhDRergdLdWE5DRa
	Gww5Pod0t1yEpbxMxdtBbWYAFKNf7apjQX7Y6FLpBLpJnmYHCBJ4bfXAisMJD5LhZy2atj0nEeMsz
	0lvTGxj722DF9rB0j9F0MkVXOW7YxA7YDNr2NU3Y/6fnQMxsD2hrIySz44aPK4IbXKXEyr5Slv9DG
	IjxCCmF94ycdawg0wnvNBJYZJgMCpMxWNdAI01WZyFC0x02L3Ni46V3Fl2vHBKXATYgpxkaivKGUU
	ESqmSVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmsm-00000005yWu-1zDc;
	Fri, 31 Oct 2025 11:01:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmse-00000005yUx-2wwM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:01:17 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3637d6e9923so19787101fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 04:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761908475; x=1762513275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGqVXPX174dI1TmkMpyvoDpe58SAFIHrUIhMpLUiKvg=;
        b=M88TUy9nHijnLQ3yUzEfcp9UBhbwUoLt/p5YxM5xXuZj0dzQOX/bBPsDcPC2rchSGB
         Mw89NoxAb/jTz9CqHBPfzKRKY6Kpvz4S2/9BcNa0/SlD3WWZnvmZGXbxPGjgm7kHCcS5
         JpG+sl7tgnrFTOFRfTmBVjXfoW0hcKiJ0nOWEe9QvaptYOCS6xM3qgQPzacYUyBCNj0f
         VMuctliSzqJxhHy9lSLINM1d0YGvomWfgi9wqUe51O5Pg+vppPhnWTAo4FUDonmoKkVk
         6UNr3MspwYKE8HCDUn9guAVF92h/1xjbWJblNgc0bxKOnDlbFya9IDfUpPa6frIRKad+
         0YMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761908475; x=1762513275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGqVXPX174dI1TmkMpyvoDpe58SAFIHrUIhMpLUiKvg=;
        b=tN6nfXJZ4Nuu/xf68fY/rrie1BCAXOVVzClgVvnSbS1yKS7gM0MdZUBJyZy011evUY
         jVsqj2jCxRjEGiYkfRRuziLy0oaOawJDGNdIMtzVxFWgrmV7NJr/e3Jd4N+oNYvZotpN
         PeZQfdJl09zz9P3fFT+gtEvdRd/PXuqq4m4wbY0V9lvgh4SN4rDqSIfCq1ef57NksHlz
         gG7lF2hOqql2VC1DiWiA4MWQKhjRbJJqwB4pskXvbqD9VAtBigS6G6oDre0kl5MGJVJi
         K7tqg8o406u6q/14AyOJ3y+LlReAhEEjnXcCmdAHnYkQv1Pz9p02N19pE601fDoda0Yz
         2wRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVShbePvmMFXuhPHCnhOBXvD/hB590Ueb4XXhss1r5q5r6he77qeObr4aq66RadqarKnEAp+x2CGg4Zyaf8OyzH@lists.infradead.org
X-Gm-Message-State: AOJu0YxDtGjimKN7o72GivDsGtQuMtcV5Usby3jj4j/FlTUjyCcF0HJi
	+3+2OW5NAWJEFReY1djhyjhzH6y4rf04Zr9q7QPdTGTHiHc2djL2Yddjq+XY94kXSXuLlC/xih9
	2ew+v
X-Gm-Gg: ASbGncsatMboNWKRBPJ741AXyKAxkZHVi1sz5LZuANk1rrpsaN1fE0yxKL6q90gyCJv
	cCvSqG2eIQByWYYzFTOUm47OQBXC+rq8tMBpf310ig+vFoiW0ClrYLItWpUubYZVMgB2kK8Sqnh
	WjLD6NnEZ5VzkmPjeUjMQwuP7W42LaJQI0GEAD6POflf/r6DGA7ABd1OToUL4QjgTZ3LZudCayk
	g0JGJdNTvvTnTQqah54q7oNyoBKSH3I5y8Zc37xRbUbUH9f9fUX9KQBlQk82ldBX7b8xn5Wvw1n
	iq0EBgZcja/fzZ6gsk2RBnFenbyCV8Hy1Z6GNtg7gkHDyFDUiG77m1haGBa2Oc77YUqmTIn2sBg
	tTzFmHxADAV7q0VezM9FbYAy5GFU4QnpGYkCgrzOaHi9s14c1UTt1jFlr0/0I2mlBLPMo5a9nxM
	jye3uyPg34PV1Pu6yRXDNVxrQ8BQa6bZGcJOjv/nEe7HqfVLx/+KvUXF/pmkSr
X-Google-Smtp-Source: AGHT+IEJlHlKeVgDybBDloCVX/b/55G16rZzd9wktKjKbh8UnSTpKxD5S3XdnZkoiLNP4Lmabyt7SQ==
X-Received: by 2002:a05:6512:3c92:b0:590:6e62:10ca with SMTP id 2adb3069b0e04-5941d57f50fmr1302080e87.57.1761908474417;
        Fri, 31 Oct 2025 04:01:14 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5bbaa9sm432721e87.77.2025.10.31.04.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:01:13 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v3 1/2] smp: Introduce a helper function to check for pending IPIs
Date: Fri, 31 Oct 2025 12:00:57 +0100
Message-ID: <20251031110106.62394-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031110106.62394-1-ulf.hansson@linaro.org>
References: <20251031110106.62394-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_040116_780776_CB653737 
X-CRM114-Status: GOOD (  18.75  )
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

When governors used during cpuidle try to find the most optimal idle state
for a CPU or a group of CPUs, they are known to quite often fail. One
reason for this is, that they are not taking into account whether there has
been an IPI scheduled for any of the CPUs that are affected by the selected
idle state.

To enable pending IPIs to be taken into account for cpuidle decisions,
introduce a new helper function, cpus_peek_for_pending_ipi().

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- Renamed the helper function and updated its description.
	- Updated the commit message.

Changes in v2:
	- Implemented a common function, rather than making it arch-specific. As
	suggested by Thomas and Marc.
	- Renamed the function to indicate that it doesn't provide correctness.
	- Clarified function description and commit message.

---
 include/linux/smp.h |  5 +++++
 kernel/smp.c        | 24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/linux/smp.h b/include/linux/smp.h
index 18e9c918325e..91d0ecf3b8d3 100644
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -168,6 +168,7 @@ int smp_call_function_any(const struct cpumask *mask,
 
 void kick_all_cpus_sync(void);
 void wake_up_all_idle_cpus(void);
+bool cpus_peek_for_pending_ipi(const struct cpumask *mask);
 
 /*
  * Generic and arch helpers
@@ -216,6 +217,10 @@ smp_call_function_any(const struct cpumask *mask, smp_call_func_t func,
 
 static inline void kick_all_cpus_sync(void) {  }
 static inline void wake_up_all_idle_cpus(void) {  }
+static inline bool cpus_peek_for_pending_ipi(const struct cpumask *mask)
+{
+	return false;
+}
 
 #define setup_max_cpus 0
 
diff --git a/kernel/smp.c b/kernel/smp.c
index 02f52291fae4..4533e666152c 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -1087,6 +1087,30 @@ void wake_up_all_idle_cpus(void)
 }
 EXPORT_SYMBOL_GPL(wake_up_all_idle_cpus);
 
+/**
+ * cpus_peek_for_pending_ipi - Check for pending IPI for CPUs
+ * @mask: The CPU mask for the CPUs to check.
+ *
+ * This function walks through the @mask to check if there are any pending IPIs
+ * scheduled, for any of the CPUs in the @mask.
+ *
+ * It's important for the caller to know that this function does not guarantee
+ * correctness. It provides a snapshot, while being as lightweight as possible.
+ *
+ * Returns true if there is a pending IPI scheduled and false otherwise.
+ */
+bool cpus_peek_for_pending_ipi(const struct cpumask *mask)
+{
+	unsigned int cpu;
+
+	for_each_cpu(cpu, mask) {
+		if (!llist_empty(per_cpu_ptr(&call_single_queue, cpu)))
+			return true;
+	}
+
+        return false;
+}
+
 /**
  * struct smp_call_on_cpu_struct - Call a function on a specific CPU
  * @work: &work_struct
-- 
2.43.0


