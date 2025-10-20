Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58204CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dIjv4MSR8RQ0lSEv7ckZWWm3B4P0BM3xvQjsLdtr2E=; b=gSmW935vThm+/hvfbKB62Gqinh
	G57NZRpwK1wdwHEHUKhF4dB7tivqdLao69QRGwgLqD51CpIz0ey+5GKubKVD8QQDI+TtCdJCklgXj
	sFsQE8s+yWtCgJP1HWE0rVnGjAZBa/0QZtB/L8KgZPWYpyTuGjfxCBwTANf7R/figZEk6WpxloRGH
	AaOkHuIAwmEz5THJWb+0IYWKfW+jaEUSMT6lU9XW7SqL5kxsLa+Kf/nK9UriIzCQEN/+xu7QwdpHJ
	W4a3ZJbSdOa00NMSSP4LHg5p1uU3vN51MRqkuB27NmJLck3QdKHRGpxEIqHvKubvJX1KKg6CgWL6q
	NMB9T8fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqhe-0000000Dvqb-2Al3;
	Mon, 20 Oct 2025 14:17:38 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqha-0000000Dvnu-2aUp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:17:35 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-362acd22c78so37334041fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 07:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760969853; x=1761574653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dIjv4MSR8RQ0lSEv7ckZWWm3B4P0BM3xvQjsLdtr2E=;
        b=rm1hh2oytTgefiwCGArpWKdX0cEMb8AM9bxhvvaFt1DDOVqoob0YPeZOXl5WaMrB44
         k8LaUenUkjpOR3APDU8SLbliZQCEeDGUZOXw6JXDT4GvKuq2mgvhJZX0LsJ1u8cmAA1A
         7vY7bxCmh1AFNQ7MoqeG8icBEK3gxYCtvBppVl7I+4oNCw3T7KDHuxY0NuQ6gr9u0ag5
         HRuXHd+tkOCscJtugJDKuMiyfQyPEq8Y83+XfNeDp3aKpPF1RQGMKThakz5C6kJ0w3ix
         20u1Buau6UQXpB+VnN/SM/xDIAcDhqqqhMyYMiCB1W1NiP7OcXq79sIZluKm0TSufq+y
         zcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760969853; x=1761574653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dIjv4MSR8RQ0lSEv7ckZWWm3B4P0BM3xvQjsLdtr2E=;
        b=SUBofIwoLCL0rzcgtKgCahqloK7bXRkCvABTM7MB+XexN0PrFUu6+IokSnePds629M
         UlJZVvNfoxpeIwGVBNjrwo8KnNjNaAQMCXuMKtrkJE+9Dxl7RzyVLbYYwRvCAvGIWlUB
         rin664Ul6gQO/GRsSQ90tawWNanTbBoh3u04bGRhzrar1qDm2fWre/QOB5a/ra9hEvRs
         uyOLdkJxlzGOujKM+Pk8EcSP8BLeJ7lIZ1esyddiEMiL7DuXW4BW/lWo5B62XgdWppwW
         k2R8smdUe6XE6e08ONVfVNB8Cw+M4P+l/TQsPvOHnLBlVXdZfrHEbteyzmY4Rl+0ysDn
         mJZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX558UDZin6x6fsTf70EMzRnxjw5xZc8sLIs/KNZemWSLezx05XjxW6R5PUvaGTwtNrNigMnvn3afqw8TqRuFYx@lists.infradead.org
X-Gm-Message-State: AOJu0YzVdwFPphRqofJy8e1QhBegVjtzjrC+W14CZD55jAWE1qS5uzli
	h7nysUym5oPlhFP+lBLhHcK4eGtE/GNHb0BMzt2BEcJq41UVyLbS/u43IkdVBUI+wZQ=
X-Gm-Gg: ASbGncvFIfgdw/pWTDxupiYkakyBsxJat/cyORERKfE1iaYr08P+KxP9eWPEj0VPugc
	eDVy2EdaLnH7ujW3IHJcngye4+BMPIkjDsYv/5n70be3IBPRP6ITM/x6fCYSyMKLum60y0IMnfP
	EhCwf/4Yppo+nyKRXCNwSToPevpsLptRdkxLaTMO1eg8dM6g5fWWdkkwLzNr74GkaBFgRDQc0ZL
	sM1EgwF9bC1HhzcOb6RBK/eEc7jIXNw3bg+W0QpM8jvCNLx+1BfJ3ct04vQUx9bYs+N0Ulgndkt
	gY2523UNPySB9M9WVBRk6UTYRIKI8QE9eBdddGIYamvcFWvnqyGw1DhCwsY2NtCBbFQOP1CnlY8
	L24dDqKrcARObn9pz6IhlDUBAZ02Rlgro2WRUOYRL83ZbDYhM5cra0s7jevf6dmeqOUheX7+MV/
	q0KFjd2FNXPKHuTwLPSR2m8fdhmvUYwxturwXp4w+Lb6OEWGiISw==
X-Google-Smtp-Source: AGHT+IFC52orDQWOlIL6EQhuSMEzlEpPeXgxvFXygwzJXEOK1ypBXTxDyX/2RUJkJkcU3BSkgxWjfw==
X-Received: by 2002:a05:651c:892:b0:36b:b0eb:9d65 with SMTP id 38308e7fff4ca-37797815ebfmr36900691fa.10.1760969852425;
        Mon, 20 Oct 2025 07:17:32 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a950a284sm20797191fa.36.2025.10.20.07.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:17:31 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 1/2] smp: Introduce a helper function to check for pending IPIs
Date: Mon, 20 Oct 2025 16:17:11 +0200
Message-ID: <20251020141718.150919-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020141718.150919-1-ulf.hansson@linaro.org>
References: <20251020141718.150919-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_071734_681302_334C2813 
X-CRM114-Status: GOOD (  19.12  )
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

When governors used during cpuidle, tries to find the most optimal
idlestate for a CPU or a group of CPUs, they are known to quite often fail.
One reason for this, is that we are not taking into account whether there
has been an IPI scheduled for any of the CPUs that are affected by the
selected idlestate.

To enable pending IPIs to be taken into account for cpuidle decisions,
let's introduce a new helper function, cpus_may_have_pending_ipi().

Note that, the implementation is intentionally as lightweight as possible,
in favor of always providing the correct information. For cpuidle decisions
this is good enough.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

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
index 18e9c918325e..093e5458493e 100644
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -168,6 +168,7 @@ int smp_call_function_any(const struct cpumask *mask,
 
 void kick_all_cpus_sync(void);
 void wake_up_all_idle_cpus(void);
+bool cpus_may_have_pending_ipi(const struct cpumask *mask);
 
 /*
  * Generic and arch helpers
@@ -216,6 +217,10 @@ smp_call_function_any(const struct cpumask *mask, smp_call_func_t func,
 
 static inline void kick_all_cpus_sync(void) {  }
 static inline void wake_up_all_idle_cpus(void) {  }
+static inline bool cpus_may_have_pending_ipi(const struct cpumask *mask)
+{
+	return false;
+}
 
 #define setup_max_cpus 0
 
diff --git a/kernel/smp.c b/kernel/smp.c
index 02f52291fae4..775f90790935 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -1087,6 +1087,30 @@ void wake_up_all_idle_cpus(void)
 }
 EXPORT_SYMBOL_GPL(wake_up_all_idle_cpus);
 
+/**
+ * cpus_may_have_pending_ipi - Check for pending IPIs for CPUs
+ * @mask: The CPU mask for the CPUs to check.
+ *
+ * This function walks through the @mask to check if there are any pending IPIs
+ * scheduled, for any of the CPUs in the @mask.
+ *
+ * It's important for the caller to know that this function does not guarantee
+ * correctness, as the intent is to be as lightweight as possible.
+ *
+ * Returns true if there is a pending IPI scheduled and false otherwise.
+ */
+bool cpus_may_have_pending_ipi(const struct cpumask *mask)
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


