Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036A8C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvmS58q+1N4NLUDG3LIuB02O70ZoHihiBJ1Y750u6aM=; b=JELpskmqpGOc/GYIrN8IKaCL5I
	qAXCLrKP6zlGwxBfSV7qmPspk9Yey6MMKNr3o3rBquPZs+yCqNXTDgJpMk31zhU33a3bZ5fD1SGXU
	3G7BQc+kA6otS8vzESGv0uBajFJg2D6+5u7VARbqGPMsxYbfRlUG7jqHb3BpdLRxzhnjOqf+VllAU
	J9Km+E40cfmpM2m0ZaSP1byYpokFhBfz6g05n8HxhL99Da8oOp/L+ZFi/xP9Yojomru7wFgIXpqgw
	vvukZ9ZBEkOUKIhv/PmMlIUK5qOR3wTYO/AbMr4549mPz8ateXUBWxxu5spyCMLz/+vBodPHIIlmc
	ha+i6UAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CoU-0000000780N-1Qlt;
	Tue, 22 Apr 2025 12:33:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Brb-00000006x9m-32WI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so57784405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321550; x=1745926350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvmS58q+1N4NLUDG3LIuB02O70ZoHihiBJ1Y750u6aM=;
        b=kb9QfYOEaLfRtFYNZry4IIvF7dlkTDqRbz3f08y4amxJh1yW630Jzecb5tL1jmfFDT
         m7PC8YeljGStFutsbmRH9d2+Nmr41WXl+89v3GzRkcV/ZRdjmJvAstWAYmbx3s8GD7bv
         PqZoVpLXhP9FZAVGjViwSYw98dclz7utErpO9qVpCKFdsTp6QV19+RIta2YaFhT6xWjJ
         y/KIFXoPiInKKEgdw9zmVlJLfVtQF6W+w4DSqmzQaCH1A4aQb3S0MffRSWPKnOF24BJF
         3fgBbxCZP1D/5k75kEclK7cj+kbWdv5/epzsHWbH6Bfz2Qa47fsjOOWEOEjKyjBgPSdu
         wu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321550; x=1745926350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvmS58q+1N4NLUDG3LIuB02O70ZoHihiBJ1Y750u6aM=;
        b=j7xH/A1wY26+2DHh748c9ekycbeSPJ+UMRvcdQHoydGSNOK9yx7X2MXVoX9duMo3Od
         RvNUYdoNbGq+gyX8sBSoFEtjGN+InlG/wbOgkAHIeZPjoXTJRZeMvpYRrdpB2t4DqP0D
         EZC6dws5C35Lx2n0RQQ3/NdaG8FKBeMjk33uEOpwZNN3TcX6Zh2PsAaWtM+/4nqE34ps
         zdLRn8yFHTtvV8PtHCCIZKMbVyn323cXEuWSSGixz0dAoIskEQLLXZSpMTePA+GfEXv9
         M5UnMOJ5dhBPywxJiHtwNIIIxLjflp5Z098LfX08z4D21ew6rYHglnbeojV7Q2K4f/Hj
         kKYw==
X-Forwarded-Encrypted: i=1; AJvYcCXKZJyGwNrmWibsXZOrSAsRYZCBa2rkHV1wtQUDqKDXbZhmU+v1wt83KK54zEGAAYB7rRdjfwqweEbDewOSQhYL@lists.infradead.org
X-Gm-Message-State: AOJu0YwY/6wdLkWfKkhBSeaq/ATtqN7D1ZMCeW4dWMg05iH+A5YIiUby
	JsIAL9RnMh7XGOkPzTf19NDb2eo3ccO846CBa8mxPYC/f64o1lCx/NG81WUrmDA=
X-Gm-Gg: ASbGnctlntZNM5qhsbfBoEZmgwflMxC+SK0lwmiUO8ChWrrsW+4aSaPlYLbc/PGg+WO
	kHFVM3vr6MpR0nSyI7SnTghvPIfHTFrfcULSod4Ierz97qqncU40UnEd1ADdH1DkUKnXEi3WT9Z
	KuHqApJZNkQVSK2dusqUnMoyZ12lCF4uN0o6EgHdjmqAIcIs9mIlNQKFOXewz6BOOL0AWShOMag
	l21Ld7h0V0xD0DXgyl57mVXMx+0eMmCXuqM2cO4loIJtz9gkOpFPu7uiX/g4xgqlPlZlTDjJo58
	NonEnzIQ3VygpR63DXP5GfNP1/ON/8NSYN2gJehrBOH6YjWpVPlA
X-Google-Smtp-Source: AGHT+IEGyrx2mGjKmUnsFcIC3SpcjXAJAkCfqaXdm/X2mvwM46sWClIbCzBR8wdxshvHGYRPAtMSRQ==
X-Received: by 2002:a05:600c:1e15:b0:43d:82c:2b23 with SMTP id 5b1f17b1804b1-4406abfaae3mr114731845e9.23.1745321549987;
        Tue, 22 Apr 2025 04:32:29 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:29 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 13/14] sched: add sched_kmemdump_register
Date: Tue, 22 Apr 2025 14:31:55 +0300
Message-ID: <20250422113156.575971-14-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_043231_766172_5E9D6E08 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

Add function to register scheduler info into kmemdump

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/sched.h | 1 +
 kernel/sched/core.c   | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 9c15365a30c0..441f5a6099f6 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1820,6 +1820,7 @@ extern int cpuset_cpumask_can_shrink(const struct cpumask *cur, const struct cpu
 extern int task_can_attach(struct task_struct *p);
 extern int dl_bw_alloc(int cpu, u64 dl_bw);
 extern void dl_bw_free(int cpu, u64 dl_bw);
+extern void sched_kmemdump_register(void);
 #ifdef CONFIG_SMP
 
 /* do_set_cpus_allowed() - consider using set_cpus_allowed_ptr() instead */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 00ea6f31973c..8615fd02d4db 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -66,6 +66,7 @@
 #include <linux/vtime.h>
 #include <linux/wait_api.h>
 #include <linux/workqueue_api.h>
+#include <linux/kmemdump.h>
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_GENERIC_ENTRY
@@ -8672,6 +8673,12 @@ void __init sched_init(void)
 	scheduler_running = 1;
 }
 
+void sched_kmemdump_register(void)
+{
+	kmemdump_register("runqueues", (void *)&runqueues, sizeof(runqueues));
+}
+EXPORT_SYMBOL_GPL(sched_kmemdump_register);
+
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 
 void __might_sleep(const char *file, int line)
-- 
2.43.0


