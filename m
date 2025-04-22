Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3381C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05bSEWwjsFQoObkjxJQo+JCFAb3Ry4oW7GBGxZnV2N0=; b=lYRCEtfTxuTycGPr/aPTZZRPTZ
	emQlZZqCeqP9Ce/Uk0ikjbznsaAFIngBJxmWYkvAxaR3ChQFnxFAtxMaFP3ylIjqs8RvibH6SOqPC
	B+IU4bapY5FHn7DYQ44dSwc5JKeEaV5rLY2d3m/xACnI4nMEGT4eLpDRWaLMvIq+DvcdqLnaSt9mc
	OpYh5YENNa6PtRfEXoZu3oTXzvKFRQdepK2j/UjqeByOoZAiXySHzIM7rlErynile4CnSpLClxheg
	0BRH/gRbLWJXDMP/INyPTJG/TbtRgPhYkoj1f79zfsfn7cHNr1Y5LWyP0uolKHM0Y06M3Ob1oHLN7
	935/9OoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Civ-000000076KS-1A34;
	Tue, 22 Apr 2025 12:27:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BrV-00000006x77-1w2b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso42517105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321544; x=1745926344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05bSEWwjsFQoObkjxJQo+JCFAb3Ry4oW7GBGxZnV2N0=;
        b=rWy+aLhfITkSpdqzaWng29QpxRptW6emtOuL6EBFyYqC4AHrG+o386UGgbLLuX40jL
         CSC0ho5accW9v/o7emc17Xap7l9DhhvdmjPfwXHg0wzjmULbZ+zonGehER28IwC1aLwY
         /Z72tZQIWwLiwiQB0Zgd+exInLl9sp/O2p1HzSa5n+YjziEFAwvGfERTu1LfguNg/vcv
         DxyK/nbbFFTIOAW9dM4mLOTbVBXR0NnphcP2o5EJEYZDv9px2mnmW0UZ7vEcKvaEGJ1w
         XipnSxPplO8hLl1ccXo5N+XE0aUXWRRcuWRfb76O6FaZrB0LrdMRDkEAhcmz51SVvHnE
         RubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321544; x=1745926344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05bSEWwjsFQoObkjxJQo+JCFAb3Ry4oW7GBGxZnV2N0=;
        b=RqA/F8gVy2CCE2YKEaQyfzFz7epzND7cTscfapbzPufkD398mPqWq2SZwJGD1Qrgom
         WeaG/MXwgkD2TRF2hBfB7mGbJI7myBgc1ZVezH0yI5fRvTZ/W12UC2gwDOp6Tq1I0Ju9
         4YRQgF4RQkFgSQjCVx13Xg+tzq+R4g15jq+WJx+Glr7HQSZ4sSS2I7kN3vA4/278d+WV
         2AaRRNzgEDXi0RtCpMpUnNy7mMCeZjvfn5UIFltU4t1gwLKhhRLgIh2YO7fQO9XU9TZ3
         30bHoWsIXdW1gWiRpjKkY3QeSuXAL004+sxSLdjSVvA3u5qVDiXMM0MmQEIPPWafhFJ3
         zDGw==
X-Forwarded-Encrypted: i=1; AJvYcCWe+vhx2SOJyb+GwFRBZY7qPNQRQ74PbEjjwmsT9mwio2hiwFPwygEE/32ANOwAiI73YPuxaqbhtB+mbAkyZ24v@lists.infradead.org
X-Gm-Message-State: AOJu0YyZOlLPsHWTZzRGddwkFSpjYeinbF6enDXxnhL6JLPUYCzqTxn/
	MNaOewhClIo3LKyBysuEG74Pwc2VzEpwp/3proTwVWsNhaO92LKrZaMGJTv8tO0=
X-Gm-Gg: ASbGnctPwlMrWu/OjK8ZNRR+FiEUfGbtueiJAFLWbj4DuYqevGk797E+QHfAvA9N+HK
	4ekfDWAkBwxalilfpjIud8K0xq4Ck9ablc0L58vLg0ZQ6y4laJo28GkqB89YG6a1HBFonVnbfx9
	WhumZe8LI2O3vNrWKnHRNe+0jbEUrx82VN4iwEqC5thMCrX6V6vPZBG4/Zq7B1k9grD424EOetU
	oOxRRoWBGHKWziarIlCG3JPQMNhkJQhRClJlPZRO3AAtsa59qMWf/wlsDNS+JjOQAx5w/WsmE7v
	cKNXoPoDLGzCbmWzfsW+FpHY3iv9rDs/ItIAUaS714YwmmhYk/ro
X-Google-Smtp-Source: AGHT+IGsfI8qZKkHCIu00QTSDHfliRxo6YWhSw3Jfq+3jp8jtX+qjyzyKnnSEeessnTrVraohm79QQ==
X-Received: by 2002:a05:600c:3d08:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-4406aba7ecdmr157805795e9.15.1745321543774;
        Tue, 22 Apr 2025 04:32:23 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:23 -0700 (PDT)
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
Subject: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
Date: Tue, 22 Apr 2025 14:31:51 +0300
Message-ID: <20250422113156.575971-10-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_043225_497209_F3AD3CEB 
X-CRM114-Status: UNSURE (   9.88  )
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

Add function to register irq info into kmemdump.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/irqnr.h | 1 +
 kernel/irq/irqdesc.c  | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/linux/irqnr.h b/include/linux/irqnr.h
index e97206c721a0..136f0572ad78 100644
--- a/include/linux/irqnr.h
+++ b/include/linux/irqnr.h
@@ -9,6 +9,7 @@ unsigned int irq_get_nr_irqs(void) __pure;
 unsigned int irq_set_nr_irqs(unsigned int nr);
 extern struct irq_desc *irq_to_desc(unsigned int irq);
 unsigned int irq_get_next_irq(unsigned int offset);
+void irq_kmemdump_register(void);
 
 #define for_each_irq_desc(irq, desc)                                      \
 	for (unsigned int __nr_irqs__ = irq_get_nr_irqs(); __nr_irqs__;   \
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 287830739783..ae29165b1f1f 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -12,6 +12,7 @@
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/kernel_stat.h>
+#include <linux/kmemdump.h>
 #include <linux/maple_tree.h>
 #include <linux/irqdomain.h>
 #include <linux/sysfs.h>
@@ -164,6 +165,12 @@ unsigned int irq_set_nr_irqs(unsigned int nr)
 }
 EXPORT_SYMBOL_GPL(irq_set_nr_irqs);
 
+void irq_kmemdump_register(void)
+{
+	kmemdump_register("irq", (void *)&nr_irqs, sizeof(nr_irqs));
+}
+EXPORT_SYMBOL_GPL(irq_kmemdump_register);
+
 static DEFINE_MUTEX(sparse_irq_lock);
 static struct maple_tree sparse_irqs = MTREE_INIT_EXT(sparse_irqs,
 					MT_FLAGS_ALLOC_RANGE |
-- 
2.43.0


