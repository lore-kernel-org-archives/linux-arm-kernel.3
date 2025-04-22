Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44599C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DfqYDfj9raOo/s9JE1ASnrO01HBkLknRT/HL1x4c2o=; b=vu+DA7jVoG0rR9Q+mZeE/4wePv
	1b5etngyQgBnTJUeXIoM5i9fHpO9Jd72kUYxacksE13PJxFRSfZo8FceLiH+h9rq/99AAyvUvwQXf
	N5k54Mj/lGnr/P+6IVdqnjM/pijzoVe6aCz8mADrCwB6yKoLkQJIAIYXBo+tKRC+O2ZYDaSOSIb+U
	vBm3bl81z7N+82ZIFMjeF4DxKsCwT+RrGFggjzWHzNzufpKxtpoGZFMI4oWZaMLD7HCEwQqoGXY8y
	5XtCULQdpxDH9gTCPSSTBmmSzjJnub0vG39phyHP8ip35uIJDDAvO38W3N3Sq+BlHKw+wdylUY7Uh
	UnrMuAFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CfE-000000075dv-1SHE;
	Tue, 22 Apr 2025 12:23:48 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BrT-00000006x6U-3nOh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so28249275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321542; x=1745926342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DfqYDfj9raOo/s9JE1ASnrO01HBkLknRT/HL1x4c2o=;
        b=TZ3ns6idnYiqhGnaUt2b3bkoHlvYSsTLHpApVzqnI9BVZaFXGAfuRW1GJOGXBHa36Q
         dzI1ZVUuILhlf8/1soi1MRmj76LlEjuLPDEN77+qKwKqd6tDlqoXMa9b5Zgibk1B5jzF
         c4kaD0DbfnuVehFgjYq2h0rjHioXOJpq4RE+ZOmHqxkBqO7Ik6RLeDvzn5NYiP5CJ/qq
         2rm7JjpBPZOjfjpJbHOgtEPdcaej6f9AyG7qZm4KC+w4LFgE7BmuAAC0NGuDpLp6w/M/
         Ubo3LI9wmKMnXbuOM7YLLffO+eW9MT8CXdwFPkRyzzRZZjtiLk0azAH1Pf/klSmV+i3t
         YFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321542; x=1745926342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DfqYDfj9raOo/s9JE1ASnrO01HBkLknRT/HL1x4c2o=;
        b=XpqxHMi1HxADY0PYvX0F08H62lHyYNkDt84EtxsEAC38dl2R9iblQc9h3MUbpWBGYD
         hVusOjDfA78nqKxupvL7IXIxD1CD5XLvcBqzGFz+IfpFv8gSSDCxJPfPkA0TXyySrne7
         pK2wGGSy1gkeaA50/ykm/QmdtuOOeaqjFyyx2atQzKZzgpMoENrpQaCLuqkfQcKSAy4O
         JD/kGIPIJR9BaFck9V2DP/6swLMuQOs+R8V5QPnTZjcUgO3vHEOm8KZulQSrPn5Py5xh
         fSPvDo5hnvwAo+Q41HNamGK/LZYFu5riSoAS4Cw+vV5Z5wKtRrTjN28fGs87l2BEKsqr
         cn0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUf0A9t3YrORsKFfLEs2LsuI5wJUOXwLFd0hhR18VsxXeOfblZYEurp85h+C4Eta0swX+08A6xJzlbsJopDugzN@lists.infradead.org
X-Gm-Message-State: AOJu0YwQRFkCIaEU1ZYG/c8Pikch7LNVGYB9BdT7zEqm2Npsl+5NjtX3
	uy3sBQHlvGDDI2JOGRiMUf/UikgYI6LANYweR2RoZhaO3YqkRetySaDJT8pFZQk=
X-Gm-Gg: ASbGncuV6qCCAheZv+3RE+AwAnn5hw4cAxzSrPudTo1T2R+VptE4wCfFPx2vNwTTZRh
	Qi9wc0yao42pC5488QbSArsJ01mK2+p9sIiDi3mRo9LhxG0E67XnBebVej/jn1GzRMG7zOJAyyF
	KqbMRlh+wfNyk43j6oUMmH3hMo7+YTKiUxPWkyAkgV3LFuL2TeBkmtUQpOV3CKwWLsSf0/6g0BR
	4B8qU/5IjwO4zMN56S6ulNXhNIip84Ys+mEQmteC+qPRABlFrnRat+N+q40wmqQnZ5bTy/Hf6et
	fh3DVqqSNV5/0DeJZcsufMaulwXcUwiv2qvLKUdWsFRabZN9sTrM
X-Google-Smtp-Source: AGHT+IHQ0JeqIGFr8hzfLBxr8juIP8XPWd5UgKDKwG2qIdIH6DudpvZkIFykrGXg9swWfTEAHGdAgw==
X-Received: by 2002:a05:600c:1c8f:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-4406ac21897mr105942885e9.33.1745321542268;
        Tue, 22 Apr 2025 04:32:22 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:21 -0700 (PDT)
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
Subject: [RFC][PATCH 08/14] kmemdump: coreimage: add kmsg registration
Date: Tue, 22 Apr 2025 14:31:50 +0300
Message-ID: <20250422113156.575971-9-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_043223_942979_1F13A656 
X-CRM114-Status: UNSURE (   9.30  )
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

Register log buffer into kmemdump coreimage

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/debug/kmemdump_coreimage.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
index 59630adf5dd2..077b65cae4cb 100644
--- a/drivers/debug/kmemdump_coreimage.c
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -3,6 +3,7 @@
 #include <linux/init.h>
 #include <linux/elfcore.h>
 #include <linux/kmemdump.h>
+#include <linux/kmsg_dump.h>
 #include <linux/utsname.h>
 #include <linux/sched/stat.h>
 #include <linux/vmcore_info.h>
@@ -71,6 +72,8 @@ void register_coreinfo(void)
 			  sizeof(cpumask_t));
 	kmemdump_register("jiffies", (void *)&jiffies_64,
 			  sizeof(jiffies_64));
+
+	kmsg_kmemdump_register();
 }
 
 static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
-- 
2.43.0


