Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59583C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9mhCj0ekrSAhKxeAdIDKoiXrDacQrSQO5Vuilr0jZM=; b=RDyOH8ihJue45JhgomRunDpH1H
	RygB5PRoV8ifvN56/kMb8EN4Fi+KXMM2iFjzTir+cdx77gBPKkyOMhJFUH/ujJZUEfYwOATvz75hv
	0O8LvdvbnMC/AR8qmRYoBRGNk5Ez7LrX5v/IMPCMN+EDaYW04AHSm5CwHWRJTO632JUn2g3ujCcgt
	Ch0KIAZEcFVZnJoNSvVkZBkhYA28Jr9vtegnMf+iRyjtbcJkvUAC2nWYU+PAmxg7JGUojqQJncKbr
	KRtnaukD93aIBbbGEnbjHs/rr6yA362EvgMDNTjrqaWf7xjgmFiRLvrQkY4X5sm4ZPqDf4nqMdsHJ
	Y3K7q9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Do4-00000007KSE-2nFn;
	Tue, 22 Apr 2025 13:37:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BrV-00000006x7E-3LqP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 11:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=x9mhCj0ekrSAhKxeAdIDKoiXrDacQrSQO5Vuilr0jZM=; b=C2pKWxEwwvJ/A/YLDd+T+XFwEo
	7vKHmWEY6NozkQfIhbyMph07vsuvRsUkAy9a8pG36vRT9JxUQY4TJbT7JIBZgE/06Xk9uJXWTT7/9
	PEyFlUvKDwHm6yeGAlGeappmC4+GcjI+KLNmcNNH5DXea+ckgahHeQPuAE7NO0H0whdYZLQqs8hoL
	NQxcI8nrnQQsr2YD/LUkAnXFaJf4tLWZ0UlW/L04aG2ixnC/jLBRyAjLLQ61QkVuPu8v36vsLASVH
	jCrMqu9XPqlTzUdYK5Pdlmx3rzr+U8dp4JRaw5pE73JBwvb5oiqInmzq7Q9JvPq9nykbzmM2GBXeu
	v7CPrN+A==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BrS-0000000BCJz-44FV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so4014476f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321541; x=1745926341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9mhCj0ekrSAhKxeAdIDKoiXrDacQrSQO5Vuilr0jZM=;
        b=XX80tG146NCMzIfnCl7s1Cy2roJIORrkiuucZDcoiax6yOMRVDwJNCNNIQhMtlbXu5
         HXdE6gVi7Fspa4PVtN7ZtECccqRQquTuOINkn2DbgBsnUmG7zKvtIAWtglXI39PvCI/8
         5MjCpLYdNhuvaTmD/gfe2HLU/99c2f5wkbSCeqIX7CTVN8STyDwtnN8WFKgTRPNfPCZN
         oLUyOpt4zhSOU4yH0LGQ+hUOd0eFbPunVQ2KxV70TOvWWY57BB7ZP2wq7nLwEwxA6/aX
         OAQwCJxv40hPF4LE0fhekm0vvLgECWSmuEqljELpmGu2PUF/2WAg7zKFdttMH0eeFwE3
         CzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321541; x=1745926341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9mhCj0ekrSAhKxeAdIDKoiXrDacQrSQO5Vuilr0jZM=;
        b=TOX8XG5weNOleOvxJUAZY+QUSGOf8wTpTt5vkRJlfaF4ttpXkHYg1v+GkrUS5gVKah
         3VZAI/HlGajqbpmvw83Fl6zVIjLbca7zGw/HtaTsumvwQJp5uunJ3nhgimkT5b/Pi5At
         ZvmfswbA7UyIcumj7wKXX+xItKXFZThw3Rn6PKFuMpx0ozJk+fztnLAimQhRbThu1UTe
         RXxzeHkzIIT9lR93+K8okH+B0jvRiTTbKP+9UFuYGXTHNKZ8thVt2BgTSYsnCQkx+N+i
         3KpChO3RXAlFGIesKUIs2Q32WI9xZXunD+Osk3uuTtFUSr1IO17iIj7YMjUBoBVObb/C
         R1mw==
X-Forwarded-Encrypted: i=1; AJvYcCXkfkwibe6tnvRY0i5uZHu6tGS3z66RX6cYAwQQdVWQ6Bq4fGhfqmCgGLBDBMS/Uj5K0zfrnE5iNKp8jA6zwXfy@lists.infradead.org
X-Gm-Message-State: AOJu0YxV6fzRZA2JKqOxwlw9Bik4aeSUlXXPsYd/MgnoTWwc9JMP9pti
	vUOXnWtpBatgvaGrs5fZ3t0nLGikEhKIBqE+f6qUIY8NLAjKSh9Y3etdKFkKSrQ=
X-Gm-Gg: ASbGnctqk+wC4OFR6bjJWknfYZePsmhMO/TjKAP70ikLYjs0Ku1icYTHhKTgfv/Oad8
	N432GYqMorhQDq9MAgclNalGWYWjuTk1H3yjao3ARfx8xOMzNiKGwxQReEyw6ClQYMW7WTxktXN
	Ci6aHkWE3OQCpfUD0prz9OnEQ9RlsK7DLUPhnUaQ5+jlMummr/T8P+G3wOAgGQS3kY4av1LxATP
	r7/z44GJQoFf2V1TR59ZfNDmkMNyaZbN4k8pFx6qruvKINTwhKFG+Gvh0C7C9SJbpDm988Gi/gl
	Q1yAz94DjZlDQHTuY54ze0EDnRx/orOfsvOG9BKuwTzLuH/V5Jz3
X-Google-Smtp-Source: AGHT+IETnKdGNbtMn7JPOPRBj99xAT5wJXNpOwUNB001P6TYN6eu4ikfra2LHHxXB1sLzvhGYsSz8g==
X-Received: by 2002:a05:6000:1ac9:b0:39b:fa24:950a with SMTP id ffacd0b85a97d-39efbadeb66mr12760697f8f.36.1745321540656;
        Tue, 22 Apr 2025 04:32:20 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:20 -0700 (PDT)
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
Subject: [RFC][PATCH 07/14] printk: add kmsg_kmemdump_register
Date: Tue, 22 Apr 2025 14:31:49 +0300
Message-ID: <20250422113156.575971-8-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_123223_122567_65E20597 
X-CRM114-Status: GOOD (  10.62  )
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

Add kmsg_kmemdump_register, which registers prb, log_buf and infos/descs
to kmemdump.
This will allow kmemdump to be able to dump specific log buffer areas on
demand.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/kmsg_dump.h |  6 ++++++
 kernel/printk/printk.c    | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 6055fc969877..cbe76c94710b 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -80,6 +80,8 @@ int kmsg_dump_register(struct kmsg_dumper *dumper);
 
 int kmsg_dump_unregister(struct kmsg_dumper *dumper);
 
+void kmsg_kmemdump_register(void);
+
 const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason);
 #else
 static inline void kmsg_dump_desc(enum kmsg_dump_reason reason, const char *desc)
@@ -112,6 +114,10 @@ static inline int kmsg_dump_unregister(struct kmsg_dumper *dumper)
 	return -EINVAL;
 }
 
+static inline void kmsg_kmemdump_register(void)
+{
+}
+
 static inline const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason)
 {
 	return "Disabled";
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 057db78876cd..cf4aa86ef7af 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -48,6 +48,7 @@
 #include <linux/sched/clock.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
+#include <linux/kmemdump.h>
 
 #include <linux/uaccess.h>
 #include <asm/sections.h>
@@ -4650,6 +4651,18 @@ int kmsg_dump_register(struct kmsg_dumper *dumper)
 }
 EXPORT_SYMBOL_GPL(kmsg_dump_register);
 
+void kmsg_kmemdump_register(void)
+{
+	kmemdump_register("log_buf", (void *)log_buf_addr_get(), log_buf_len_get());
+	kmemdump_register("prb", (void *)&prb, sizeof(prb));
+	kmemdump_register("prb", (void *)prb, sizeof(*prb));
+	kmemdump_register("prb_descs", (void *)_printk_rb_static_descs,
+			  sizeof(_printk_rb_static_descs));
+	kmemdump_register("prb_infos", (void *)_printk_rb_static_infos,
+			  sizeof(_printk_rb_static_infos));
+}
+EXPORT_SYMBOL_GPL(kmsg_kmemdump_register);
+
 /**
  * kmsg_dump_unregister - unregister a kmsg dumper.
  * @dumper: pointer to the kmsg_dumper structure
-- 
2.43.0


