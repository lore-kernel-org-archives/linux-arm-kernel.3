Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2485CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbP6YVAV0u9Pb+chJqYZ5D7bpfxtenGbfwjte3E4IZk=; b=I6+IT3zKxU05nDb5tDTX2pFsFy
	SSHracmEaMT5Hqto6avaQl6gQmjg2S8mBOUg8eMDkaYSgWAN8rKsAE1/KxPhORJDHvrpLH5t9PRKg
	TVx9GsfF0Tua6Ots1xfgeoVlNWg5hcpRE7PNps87R7avlQJ5s9dfmI+VpHzdSOt8DMkJNjbhSCzUC
	kbDUgv1WABSWQlqiK3QW845Z+vXmCFCvOmr0p9OY+4qFzSeB4E0dYDHdg4hvT/sPG6s0ALiK+DNxV
	BlX8HaABaTCIMRmk53X25p/6SGWKt81+99q8KvJNaPbw4PYIrOFFz0koePeMQwE+ff4nJWqBx9Oty
	nSEDViig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaDf-0000000DQpv-1xVT;
	Wed, 05 Nov 2025 09:54:23 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaDd-0000000DQoq-19TB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:54:22 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b6d2f5c0e8eso1254035366b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762336459; x=1762941259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbP6YVAV0u9Pb+chJqYZ5D7bpfxtenGbfwjte3E4IZk=;
        b=ucFC+VpKozA+9TIKVzK9PpMXOxPYPdxtPKb+8fFozLXIfG9FqlNsw3hCkDyflOUxM6
         1812acT2megQI6Qx1EeflmvFy0bWi5jEOErsNBTNtu/wNFKcHkl0ZHd3CfA8NeLpa3xj
         FSYomliuRahv5cQHLeWp1CegYWBSD66Y7rws37IM96gSCCT/GDAikgIQfCiJCZUQQ7LE
         vdxKAi27TbRAlhbpObwI7X9cPaBwGE1a17+8zjcXLkufA1Up+P+7KExSElJWgD3x/6LC
         UWkhTJhy1h31G4qqNucY6NZQQBG5g/Rg4ADW8wqlq/MQvkzDwFoZ0aL+0MfzJdK/eJae
         ADDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762336459; x=1762941259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbP6YVAV0u9Pb+chJqYZ5D7bpfxtenGbfwjte3E4IZk=;
        b=HiLfvCWAydLQxRlONMpzCuzs4wsF4MHhzt6EUw3MeDCGYxaVFnrOeGsqqZHIOgLtSX
         6fr9bGkZt+LTtM+zc8k/azbp8IWd7TfMB2Thvov5HzhbxYU9GdUK76N8ynZfeXvUSYzr
         SphFtUH0U1RAI79pYbW+nbeFqYcZSmRQac4hcesxaSYWbbUSzRythiuqkryYu1bDu/Kr
         pgF9sAloz0IiNZXKSxFh2bIxpaTdlhfSRUOy9vNQ7hrgnnmZDNxyAh3XdCzF/wivXa1J
         G17jRKOVfsksZFAuvK7eVvCIwqUXSpX2XXtev5jqhCl0RQb/fabjXp3sVyH/Ih4c83It
         teEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM6FAr2ahcjoxwRX7f0eqH+h/bOY92v/4rnexjsBPKG+RJ6dWIQy/08G79MndA8xY8Ufy28WLf/DN5ADtXfZ7o@lists.infradead.org
X-Gm-Message-State: AOJu0YyqxN5rWYZPZnyP4JFXgZq1nPpEHAPSHHsgKKo4FObC+RQJhbP7
	xFUQbQ/GiC+1ftto3acOWLLM5bj3+v0pfAYvi01UjmB2/l6s0xRsQ3hb6WAUfcTWQT0=
X-Gm-Gg: ASbGncvKauWOojKJrXYi5NNLoUAMYSzYABDCIdhytyM9N8e0TfDwq+IMznCgRHklo10
	3wrYqhC5YIcMfdrj/jRLy23l0mhvzqGd2evs3GMhYJq7/JU+cVhVb+CEnb7Ifg6iHLcwNTrrxnc
	Kw4nwnJEEyM0fXcrfaGbPLHFV88QrRPlKW01TtmCUEcuJ4vx7G22Gbzfpl+SPpVp9RXQ9BQbJTf
	knfSd9Y6MttMWu4GlGngYsYop3Rdno7oxXMhI5/TQDMvwPtQQ4wI7VXaBAwOcN96eTf7AnW/cAY
	aNj2rCHbOJEbudesLIdxDerH/O2ygwSHsGdwFtm4bOue4cIzkUDo7OfEOAArRBuI1yfTYCM5pzo
	qHM4OzFnTETHorcN9MzJc0XhtYPf3IZwov12vo+oZUvmsU9Qme/rNksntT9C2kQLAp3AN5LvjZv
	lRbG/T1Jfimd5/JPj48Q==
X-Google-Smtp-Source: AGHT+IHZle33T9qlwTRkGN02HpHQkNiMF3U5c+dtAlLNyjo9fOwAHNej00mUS1o+kB31UkvOsNWXkA==
X-Received: by 2002:a17:906:d554:b0:b72:7dbd:3bf with SMTP id a640c23a62f3a-b727dbd0f61mr28623166b.43.1762336459365;
        Wed, 05 Nov 2025 01:54:19 -0800 (PST)
Received: from uffe-tuxpro14.. ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fe37cb9sm442571066b.61.2025.11.05.01.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 01:54:18 -0800 (PST)
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
Subject: [PATCH v4 1/2] smp: Introduce a helper function to check for pending IPIs
Date: Wed,  5 Nov 2025 10:54:07 +0100
Message-ID: <20251105095415.17269-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105095415.17269-1-ulf.hansson@linaro.org>
References: <20251105095415.17269-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_015421_328903_496A3B74 
X-CRM114-Status: GOOD (  19.48  )
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

Changes in v4:
	- Updated the description of the helper function.
	- Fixed whitespace.

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
 kernel/smp.c        | 22 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

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
index 02f52291fae4..f349960f79ca 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -1087,6 +1087,28 @@ void wake_up_all_idle_cpus(void)
 }
 EXPORT_SYMBOL_GPL(wake_up_all_idle_cpus);
 
+/**
+ * cpus_peek_for_pending_ipi - Check for pending IPI for CPUs
+ * @mask: The CPU mask for the CPUs to check.
+ *
+ * This function walks through the @mask to check if there are any pending IPIs
+ * scheduled, for any of the CPUs in the @mask. It does not guarantee
+ * correctness as it only provides a racy snapshot.
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
+	return false;
+}
+
 /**
  * struct smp_call_on_cpu_struct - Call a function on a specific CPU
  * @work: &work_struct
-- 
2.43.0


