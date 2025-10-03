Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8284CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hihU1RjeShMW+xMGPqIOaGj65BRsX1zPODZiqAoHCE=; b=lwAfAidMP5hceuppuZcvP5XrRw
	XxqIodpX1xcry4SG0oDaQso98HXYIV/bqCKcLf0FhK//VPSv9r4/vrEkP1YGDv8K6dGkxn9l4HcgL
	OOMu2A4tPZFbCmWSFhwn1eaYgA2+Z2x+pR/zZTEg+B3G3jYJFGzXLrPsmRYEA7TewaiVKuqy/WhlI
	EAmdemVo8LYntUBO5oMFbXMYticGFXcaR0D6i9370KdPXZ4kKkQ9oKGqOcu5fDWZWBtvf7sLYnaMF
	bwZA5490DlPgIpNXRODstopicsrVgLSnDFyQkK3EDS1LkPyOGpOwOENthWZiqAxo1BjCBJiHLE+r9
	LTDGtaRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hJT-0000000CcQo-1N0d;
	Fri, 03 Oct 2025 15:03:15 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hJQ-0000000CcPl-1jt6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 15:03:13 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-57db15eeb11so2755403e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 08:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759503790; x=1760108590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hihU1RjeShMW+xMGPqIOaGj65BRsX1zPODZiqAoHCE=;
        b=kt2jIx/ou3+fEmQna1VbIWiHSYGcm/RiJr8ijcFy2EAJS54iQ8WId2LgScD19E2LMG
         nQGFhkxIi2aBo+1lVFc44FC/IFvAAhWasAWwNzHNf9/Rhu299zj9nM0nxxM7hkanN1OA
         30zvam331dK0xjh6R5l9DiSEU5sGFfzAknNjgvvWEhy5jUvyQzAB3pBq3mo04HILle9p
         +BYVOGAyEPoFh/FyMT8OXXH3YBONwYlKmlrpTBbtADivZzzIC8sbVlcALjsPEIMr2Cad
         I/WVf76H+BmoAwa+dnpEn36HgWKnB2CZ5YsneVAsupw+izylTDNEhTm1WrvwOnpbSboL
         5HiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759503790; x=1760108590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hihU1RjeShMW+xMGPqIOaGj65BRsX1zPODZiqAoHCE=;
        b=Oj+hwP68d5UrYLxtIYmpAf+JDMUuwd/c4GJPrdSgjH6S0LgjGdKWUd+HkKiecviq2j
         nS59C390oZtLxMSHbQSQtzzv9GWAv6U56qHyhWyxtjkoDI/b/Ig3HyKSHvoFBra2y8Xg
         PSx3M/jQ+ArsMEe369GgYXS7kbDffc3iRUVEojvEyn1DM3sAsrjPKAn640l3MFW/VuV9
         z1kACqsPIcME1kvAnDoOTnrV5X7vz7sLBj35j/ny/mLhka3Ki1PVFlVBCvCodcaGByyY
         nmckum3R/E2r4nrkgM9XhVlLaEBYvQb0xQnkmdfvn8B5D3d40kzZKsEaIUjIiwgRlyQz
         CQLA==
X-Forwarded-Encrypted: i=1; AJvYcCVxta+O/cH6FoLeWEWlQHHgv0zq8Yr96mUZEvWji8Zv34yr+RYibda+iFOW/kzRIXWbbzc9IfE/zRptf8DACrzP@lists.infradead.org
X-Gm-Message-State: AOJu0YwxHgTWMDYsy967bPszLelqRQNXUpnaB+CQLGdLY2SnZRbm/yN3
	Lzus0Zjomh3mJGvFR+2hlvelRhWZIf8uZ/il5zq+m6X3FI2Ysq9uY99/LJ9zNJFPNKU=
X-Gm-Gg: ASbGncu94WuFB5+ec6swKwU2zO17Jpl13LOXGHTKy4O3zVhXyxlj3/kBNUeg31FrYzk
	6xagcYzQykDK/PuIez+ae8/4BrzAbTaUBJ5JqaJz+nLVdPxLun+t8/A8nCnze1LozO/PB+Gr6OF
	WTg271yS6NWkSmFSjvjKlPqnIIe7ma4T0ACfGXwzXZKjZAh1fPgWnGaEcgQIhm4YOP+a/XjolOk
	jfsnekIUWVzPaY8NDW93mYD2wb/1g+lsJIcbBfTECpOjxuvMqMotWeHD83TxStnTCSK4FNYqPvH
	+mK10+wlCDOIcR3dugnG0kwkTUuiW/U5dtwpIvTQrzvLb7M91wsdFyWA/ee6W4CjvD/mtTl0Bmo
	9PPWgq3BM9noB40z7MexdOLbrh+ZTZF2TMQaGcnpmr6Fr59iPZfou+sH5HunR2BW7BeCRXBqPgU
	2K1gpfPHRO6nnzHh9paDWliQxS
X-Google-Smtp-Source: AGHT+IHu4PqHQYTqpy6vc1bGma7aV+0D6GP0m2nkuDc3p3Rnn6+vAHAZZGlxtp7LPL+ZjpY/yp6VSw==
X-Received: by 2002:a05:6512:b23:b0:57f:492:3263 with SMTP id 2adb3069b0e04-58cb9f0b45dmr790708e87.1.1759503789674;
        Fri, 03 Oct 2025 08:03:09 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011343b6sm1933369e87.35.2025.10.03.08.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 08:03:09 -0700 (PDT)
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
Subject: [PATCH 1/3] smp: Introduce a weak helper function to check for pending IPIs
Date: Fri,  3 Oct 2025 17:02:43 +0200
Message-ID: <20251003150251.520624-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003150251.520624-1-ulf.hansson@linaro.org>
References: <20251003150251.520624-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_080312_470303_3B715F3F 
X-CRM114-Status: GOOD (  16.20  )
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
let's introduce a new helper function, cpus_has_pending_ipi(). Moreover,
let's use the __weak attribute for the default implementation, to allow
this to be implemented on a per architecture basis.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 include/linux/smp.h |  5 +++++
 kernel/smp.c        | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/linux/smp.h b/include/linux/smp.h
index 18e9c918325e..476186e5e69c 100644
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -168,6 +168,7 @@ int smp_call_function_any(const struct cpumask *mask,
 
 void kick_all_cpus_sync(void);
 void wake_up_all_idle_cpus(void);
+bool cpus_has_pending_ipi(const struct cpumask *mask);
 
 /*
  * Generic and arch helpers
@@ -216,6 +217,10 @@ smp_call_function_any(const struct cpumask *mask, smp_call_func_t func,
 
 static inline void kick_all_cpus_sync(void) {  }
 static inline void wake_up_all_idle_cpus(void) {  }
+static inline bool cpus_has_pending_ipi(const struct cpumask *mask)
+{
+	return false;
+}
 
 #define setup_max_cpus 0
 
diff --git a/kernel/smp.c b/kernel/smp.c
index 56f83aa58ec8..ec524db501b5 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -1088,6 +1088,24 @@ void wake_up_all_idle_cpus(void)
 }
 EXPORT_SYMBOL_GPL(wake_up_all_idle_cpus);
 
+/**
+ * cpus_has_pending_ipi - Check for pending IPIs for CPUs
+ * @mask: The CPU mask for the CPUs to check.
+ *
+ * This function may be overriden by an arch specific implementation, which
+ * should walk through the CPU-mask and check if there are any pending IPIs
+ * being scheduled for any of the CPUs in the CPU-mask.
+ *
+ * Note, the default implementation below doesn't have the capability to check
+ * for IPIs, hence it must return false.
+ *
+ * Returns true if there is a pending IPI scheduled.
+ */
+bool __weak cpus_has_pending_ipi(const struct cpumask *mask)
+{
+	return false;
+}
+
 /**
  * struct smp_call_on_cpu_struct - Call a function on a specific CPU
  * @work: &work_struct
-- 
2.43.0


