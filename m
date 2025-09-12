Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487DCCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRFg2hFdscTgaOHG8cpymzmUrui3DhwhCxVktuuhhLc=; b=Zym/IPTGvPSuFgLQU6TrXWLz8W
	oipyd+hAldxcbLz6umKJb9WBioON9qPz+t/4YvWbCATlcd3w4gMpY/CJUV5s8vwX5Bo1566lW4P54
	qFy0maezW5LhBdr0IwtaB7vPi3g9zR68uQA2hAGf3ujKfazYBVBajijlaSRgHNopVxf5D1oxLlLB5
	Uk37CT2Kw7bmUaKvk+lnL7dUV06B2gVSm+rSEl8vuPYQkGslgE6fn9D6nzJdQqbq7Fqv6pAzgLqtP
	PPO5BaE1FpvKjovofNdZlK+sqAD83H5Qc795BqSs4FMQ7KaVnf7q+Z91c+Z/mHJ2WGEFuj7J9ObKT
	jWvFJDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5QO-0000000A8hP-1fY6;
	Fri, 12 Sep 2025 15:10:56 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5QM-0000000A8dp-0PJc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:10:55 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6241ab7fc41so860308d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689853; x=1758294653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRFg2hFdscTgaOHG8cpymzmUrui3DhwhCxVktuuhhLc=;
        b=Zx37Yb0Hz1uhpaF21W5MsXXh1abSR0atzbVRZuRfoCFP8z9i7OG6/CEtBHdhenoZdq
         jp+UYMvsP2XWTVKyXDniVjERGmG6TZOOGvtEbUsgX2B2TZwFDN8cFaEo78SlQ0XEn1Mx
         JIWnX221GxykV9SD2Wiw1cCxp4QoeocFrroEMsY1e/v8EMvl8n7zSZeTTYyJxdAE0hbO
         05MUCTnWIgFuOzJm3GGjVEp+AfnnPBSJ8Bja1UwpXnLcb5wS6diB7LixFgGW2FoqIQQG
         Om3RCOwOJH2cOAFcgGBcOGSbXLDVDZt03QeD04wnJ7LnAFWIG8LRZhHcXY+gG7K+hIq5
         BxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689853; x=1758294653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRFg2hFdscTgaOHG8cpymzmUrui3DhwhCxVktuuhhLc=;
        b=ab579SP8Ayy3Lc6im9qInFegqxgOH/QOOKRbHmuBA/NxJLbV48Vxy3tLMkkrYA3jdm
         ikHg9wGaxxB6/FNxCi6O46Q85PuPQe/Peo34peo8L2qd75IA0YaUPk8LwGeNnw5q4l71
         Fb2XnysqYYT76uDd3bBmgFR6XXkE3zVd92VLDIRkxz5tJLxkwolc+smVJyQkZYJN/Ipa
         jIyvo3nRMAgv5DU//f4fo4zP71V0oDMZ0xUZQo/NXBpdZl82E4kLR8u8LswGbXkB76gl
         snWM3FgvUf3hiTfdPIkJ9gg6wKW9V7SXdturhRNO2J9sA7BM6JyCUAi90frf6ctQ3hKD
         rhHw==
X-Forwarded-Encrypted: i=1; AJvYcCU/BGMg2wEmBbgWu31Ct6nOO55bBIZYefpmtmw2qpPWnpn6Ht+Fm7eZx+EG+W3VxdiFTItf+y92X4lsFQSJBKPk@lists.infradead.org
X-Gm-Message-State: AOJu0YxqI8snsW1PXmc+awGoOSqNRwyCqXCA//sF+V1QXnWaviWtc3Y2
	5b3EET9ywbBjm1D568Udqs/+6s5vh26ZjXjNuRlZvIev9cqof0AKVwfw98CN17EmYJA=
X-Gm-Gg: ASbGnct7tfJdtVHiD+DZcKydXZBR+Yb9Hm3q9LK790Op/f0KuEqVpZU3bAIheQt1f8d
	pDylj3Y/Y1OHSr7yXvaHvGM2ix+l2dhIs+bY9z/QKE6JOfhCmaoQoSmubP8nkmGGYAgnJQI7tvY
	rPENrgwkHHHiNVQQmpOlvWTVKxY9RGp2rn2IdNtfoXl+m6ju7o1ty0k53nuJ8GliLn7/+hR2q3m
	LEffiHO2mOhEBtsca8wLtMfOr2aYgjNYyIgMSu4kVWUmblyy7GUVvq+A8RBl78OHdmq2ihxF71u
	vy55wZKXpbLqbJ4RA1fZ/M7mQWE4x5HM8bJ6rZJ3ttPO2XyDdwfwj8gQCFOhtPkhCCL1EaQXGP4
	jmS++vbixwcHZxR2H7VyHRFQlLj3KvRDOUg==
X-Google-Smtp-Source: AGHT+IGA3TFT+vemEd/ubQxEEhLwHcx7hg7Tn+5tAGBp/Y4gBcPvEFcB1itw15g/ByzT4/+eDheVvA==
X-Received: by 2002:a53:84c7:0:b0:626:d26c:cca3 with SMTP id 956f58d0204a3-62714ee78ffmr2387133d50.0.1757689852988;
        Fri, 12 Sep 2025 08:10:52 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:52 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 12/16] printk: Register information into Kmemdump
Date: Fri, 12 Sep 2025 18:08:51 +0300
Message-ID: <20250912150855.2901211-13-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081054_161073_1FEE8FB3 
X-CRM114-Status: GOOD (  12.54  )
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

Kmemdump requires the prb, data, descriptors and info.
Add it inside the log_buf_vmcoreinfo_setup()

In the case when the log buffer is dynamically replaced by a runtime
allocated version, call kmemdump to register the data but call unregister
to remove the old registered data first.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/printk/printk.c | 47 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5aee9ffb16b9..f75489fd82df 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -49,6 +49,7 @@
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
 #include <linux/panic.h>
+#include <linux/kmemdump.h>
 
 #include <linux/uaccess.h>
 #include <asm/sections.h>
@@ -964,6 +965,43 @@ const struct file_operations kmsg_fops = {
 };
 
 #ifdef CONFIG_VMCORE_INFO
+static void log_buf_vmcoreinfo_kmemdump_update(void *data, size_t data_size,
+					       void *descs, size_t descs_size,
+					       void *infos, size_t infos_size)
+{
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_data);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_data,
+			     (void *)data, data_size);
+
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_descs);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_descs,
+			     (void *)descs, descs_size);
+
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_infos);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_infos,
+			     (void *)infos, infos_size);
+}
+
+static void log_buf_vmcoreinfo_kmemdump(void)
+{
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb,
+			     (void *)&prb, sizeof(prb));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_descs,
+			     (void *)&_printk_rb_static_descs,
+			     sizeof(_printk_rb_static_descs));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_infos,
+			     (void *)&_printk_rb_static_infos,
+			     sizeof(_printk_rb_static_infos));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_prb_data,
+			     (void *)&__log_buf, __LOG_BUF_LEN);
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_printk_rb_static,
+			     (void *)&printk_rb_static,
+			     sizeof(printk_rb_static));
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_printk_rb_dynamic,
+			     (void *)&printk_rb_dynamic,
+			     sizeof(printk_rb_dynamic));
+}
+
 /*
  * This appends the listed symbols to /proc/vmcore
  *
@@ -1029,6 +1067,8 @@ void log_buf_vmcoreinfo_setup(void)
 
 	VMCOREINFO_STRUCT_SIZE(latched_seq);
 	VMCOREINFO_OFFSET(latched_seq, val);
+
+	log_buf_vmcoreinfo_kmemdump();
 }
 #endif
 
@@ -1214,6 +1254,11 @@ void __init setup_log_buf(int early)
 		 new_descs, ilog2(new_descs_count),
 		 new_infos);
 
+#ifdef CONFIG_VMCORE_INFO
+	log_buf_vmcoreinfo_kmemdump_update(new_log_buf, new_log_buf_len,
+					   new_descs, new_descs_size,
+					   new_infos, new_infos_size);
+#endif
 	local_irq_save(flags);
 
 	log_buf_len = new_log_buf_len;
@@ -1257,8 +1302,10 @@ void __init setup_log_buf(int early)
 	return;
 
 err_free_descs:
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_descs);
 	memblock_free(new_descs, new_descs_size);
 err_free_log_buf:
+	kmemdump_unregister(KMEMDUMP_ID_COREIMAGE_prb_data);
 	memblock_free(new_log_buf, new_log_buf_len);
 out:
 	print_log_buf_usage_stats();
-- 
2.43.0


