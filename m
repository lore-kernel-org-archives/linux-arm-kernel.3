Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779F0CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QqlXXzI8Au0XTieknIe+lDfj6CC3yKlLay1p36P5BWA=; b=BFwZZtwLywONnIfWLnqL1a2isl
	6MaZjkaGGvZU9sclgBmBSrbY/zEunf2iZ42lQLuUDK5gUV1mU33qAPrqY9MV51y3sa1K8RzhKe2pH
	4nUWu2E5dGURERrzEx+MJlCQs06ZYqxBgyiwL7gvT+fl4Jhkv0PCf+x145TsKO2FF3yOLaya74zsU
	aX7j8U71uGu4OupM/rJgH13QUWs7rKY/023uAB5jN0RiV512Eg7ue58KHUjh64Gz3OmyHl4fzqZlu
	OT8DEib5nO6zNkFn0vs0yY7zaOKD0Tb02Hy7ydvJL+5479walqrjLgrYOfZDTuD83AMoJMnBPOJ1p
	o4Uz3ADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGESF-0000000Bcno-2gqo;
	Tue, 04 Nov 2025 10:39:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGESC-0000000BcnU-2jnV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 10:39:57 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so3121433a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 02:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762252794; x=1762857594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QqlXXzI8Au0XTieknIe+lDfj6CC3yKlLay1p36P5BWA=;
        b=Ap6DdcZ1m7/OIFKV4ih84RkkOHTVZrVjJKlGypEtx756bHxMATXWW8aPv9yL1QwKDB
         JTBlXHAVoFjruxVPKMlus79heC/8q7p/JrfGz0aygc9G1fEBc5+RkqDIeIJZh4PFvgxY
         2yuH45tQOBX/oQqwn9XTerdjgySPqyzdWyVlmoWdordnFCV5JX7TSiQMEqDe1kZuToVu
         reRJPHivwJlpi0OmsqXs4jpbH/JxVnPqoMX7aQTvdACGC1+en5eZ4lXtIu/nHbY13d6i
         C6h70F9QcovgaCjJ/WZrds2GDcFkQfdQJPoJjy0NXXtGjUHNEy6VNxAlWYRY1eviiE9P
         6zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762252794; x=1762857594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqlXXzI8Au0XTieknIe+lDfj6CC3yKlLay1p36P5BWA=;
        b=vU3ZjA3UQgdClyPA28Qfe9NlQnqxTl46NPc0WHzG18r7ZcHqPJucxq2wHIOJsDBa/q
         HCXBcAFtQ6J6palyFdhZ3rCjjdDkaYbzFVP+XsYBeJCS3pbNHAvCT0CPBBAcNpge2aTn
         EeEvW1mI0rDfLDr7aBQ/s4oQ4dI9ImwRyu+PIBZhN429x4yUVjnTOwT9mTzbyUbcol15
         ELIecCo3dzjymxLBuwrbmqL+ZgKJVJ/eG9ywjL/HhN/Uk9G6W54tXvYT/PdwtyKB1p8k
         7aFR1ZdmQnmqOeBsKVHp/orr1KuDzT0Xok2YHBEV8Jcha/LZG9+cpvCmALMrMxbd68RJ
         t46g==
X-Forwarded-Encrypted: i=1; AJvYcCWYaIGxg8baZ5eHQP32rlqeeZ+PlbgRx4ZqKgEjMTsUp+F4lJm/4hh0wKY2qmWs20wtViRKBkDvngR3+EVMHtwH@lists.infradead.org
X-Gm-Message-State: AOJu0YxESevluHKcP96dfATcffVmpjaWh0UQilMxD9cXtIvlvnJ4LmYA
	IXV27C4a83e+JNrfF3pEbtoD5QezJlkH5LO9ymgl2+Z/E3Dd3uOGWYE6GqwadH36bdg=
X-Gm-Gg: ASbGnctAk5VJtKxq8IeEvtUH+nYQS+myDinTdjXi0oxX1Glt/rN+2JyQBnMnxuPmGY8
	8fp2uFTRkD4nBS27T8g9RcMZiXQWQ2Bs+05a6qjmVvaxS/emrZVPsZDpfzX5jJ2VwVAS06GxcRv
	a46QJ/0q0fIVeBK/CrlloQ0Y38evRQkUu42DXRpzE8wUTVY713gKt+IlE5xFuAGwTgcrY9c5Rcq
	MBjKhpBcNOtk9LmgfavxOy32eBB0oniP/6VLtdm9fIXBszxAX+fOeO/whP9ZAqaVjtC+HJdKL/5
	wp5MoGOGcdXBDWB39jF4Kqfns7voNYvdJeN4Ys+Hr/uazgGipquEtHHQdeDb1t+xd7i86nLODxS
	vtaxiakV1LsxR4rzQhLReAtsqYq6AfIm5ZdtCC7K6oK0mB/ET5TlaQkfu/WAzCV8yNTfRF8MQvC
	S3lPM=
X-Google-Smtp-Source: AGHT+IFHdu3jVlRRTgt2EsjZoNbWOzlzZQBq47hjinpGHe0X6AXDR+UMU39LFk/i2FqEqJ1vPcxfFQ==
X-Received: by 2002:a17:907:9628:b0:b6d:62e4:a63a with SMTP id a640c23a62f3a-b70704c3ec7mr1537809466b.40.1762252794102;
        Tue, 04 Nov 2025 02:39:54 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723f6e26e7sm175960366b.41.2025.11.04.02.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:39:53 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH] soc/xilinx: replace use of system_unbound_wq with system_dfl_wq
Date: Tue,  4 Nov 2025 11:39:42 +0100
Message-ID: <20251104103942.96647-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_023956_706589_2445B650 
X-CRM114-Status: GOOD (  14.67  )
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

system_dfl_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/soc/xilinx/zynqmp_power.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index ae59bf16659a..6145c4fe192e 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -82,7 +82,7 @@ static void subsystem_restart_event_callback(const u32 *payload, void *data)
 	memcpy(zynqmp_pm_init_restart_work->args, &payload[0],
 	       sizeof(zynqmp_pm_init_restart_work->args));
 
-	queue_work(system_unbound_wq, &zynqmp_pm_init_restart_work->callback_work);
+	queue_work(system_dfl_wq, &zynqmp_pm_init_restart_work->callback_work);
 }
 
 static void suspend_event_callback(const u32 *payload, void *data)
@@ -95,7 +95,7 @@ static void suspend_event_callback(const u32 *payload, void *data)
 	memcpy(zynqmp_pm_init_suspend_work->args, &payload[1],
 	       sizeof(zynqmp_pm_init_suspend_work->args));
 
-	queue_work(system_unbound_wq, &zynqmp_pm_init_suspend_work->callback_work);
+	queue_work(system_dfl_wq, &zynqmp_pm_init_suspend_work->callback_work);
 }
 
 static irqreturn_t zynqmp_pm_isr(int irq, void *data)
@@ -140,7 +140,7 @@ static void ipi_receive_callback(struct mbox_client *cl, void *data)
 		memcpy(zynqmp_pm_init_suspend_work->args, &payload[1],
 		       sizeof(zynqmp_pm_init_suspend_work->args));
 
-		queue_work(system_unbound_wq,
+		queue_work(system_dfl_wq,
 			   &zynqmp_pm_init_suspend_work->callback_work);
 
 		/* Send NULL message to mbox controller to ack the message */
-- 
2.51.1


