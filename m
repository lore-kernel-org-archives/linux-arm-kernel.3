Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313CFC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64ebY0cPXav0ihOCjI5v6o2sTgtjyxjpauAoewNWoww=; b=S8nBu6V9J0MXxxB7GCMPeE+j5d
	0DuVspR3eNqrA56mvdT9qWOsnGAF1wjDkn8R9CcsMFA4LBKtsogCZRV1MDG5nlA/IEVaJdOBI4ccl
	slyEAbnnUIzFfzyh8Kwm6Ujls1kieYRqk55DZ+3kLYyQ66Ep40UUWNgXcOpe5mx/QQxOxw0IcuNvn
	cwV4c5eZ89Xj16dlUOezwJ3YsGwVI9DN5tKQqQjPPfvfvHrzQIhD3bG0Ur+FxKN7TQvErvttuO8sZ
	DEJGjtY7tbp1nPm8rwnOV7Gp53VJvsiTBJ0bKLb6RrUWUrhFct1LpRAaFifItFCAx3ucAcNgX0Uud
	3c5U5OWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ckl-000000076jC-3rO2;
	Tue, 22 Apr 2025 12:29:31 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BrW-00000006x7e-35Ci
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf680d351so34780825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321545; x=1745926345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64ebY0cPXav0ihOCjI5v6o2sTgtjyxjpauAoewNWoww=;
        b=J3Jm/D+ql/8FHSHs4FPixFWbYYQtVCYao167OzQAYEEAnqhx1DZ2A58wOb5vm7nAks
         NiiUrEvYijIRKGBI/3EnLNJwRgf8NN4M3SptJiqYFh7weRJ8iGlu4JrZfED78APe7NeK
         CfIQ9968qtuMCR5XX0ho/h80GsE+p1nr93rPVxaloPXWpfQkHbyHfAb3YFPe4EvlqsC2
         Xl2zbZ4fmdmWyd3aVJFbJGxjGR9dGrl900Me86E5Mayu/DS1zQqsapKbMTgkl0guTyLX
         KfIsJZ5KW+CLY2I/JN922x0MSW/zJrBheU+bl0thzjcuBxjpZHwAQGWaLPc7p6rVvpAt
         PQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321545; x=1745926345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64ebY0cPXav0ihOCjI5v6o2sTgtjyxjpauAoewNWoww=;
        b=dledFr0VCLomR3fJ6wk7kZundNtPNI17xBknqwfE19ETg2x4T4zgtQlqjTdBtqAKM3
         mXoQb9xB7YGWtCjueNCyadHpGKRJpC1pGhO+ipzxwnk3++oA1xZlq/Rv3NO6XX3pDdW9
         wL5VALCZj+3fv9U9/WTneIfnZNVo3V5aRbBV1C1UyAIiCj6pH4bMc/n/Ur6L0xlzlP5O
         ucgMazrk4IfCkFGXkNio5ll2SVbbLuKUrxSEVNiMNRhsw6v0o85TX7oKKMJTB2SKY2CC
         mWsxmkTqBiP4HjWfaAGDqt8nv3loNiY8LkoICWUXJYRisQv33uAF4oxSkFhoweRjF7/L
         HKEg==
X-Forwarded-Encrypted: i=1; AJvYcCXLpGBCbktszCTlVTsGJwpgDwndSoyXj1KuCSXP4sOudsVP83ErXNISeJEf3Edg9Azc1B46Bxu3QXxBq7ukb6gp@lists.infradead.org
X-Gm-Message-State: AOJu0YwBFO1DtRx8/bvuY2SQyENgBj/nw+/I9VSZbIgiQOh1tBQ4sDM+
	WHEyy90on/Ud6w7gf24WiqznQKVgVfJkxkgDzTSDlkzF2LYdosdj2Wj3uZAPyGs=
X-Gm-Gg: ASbGncsW/QLI/HwVlMlJi5N3h9guTcOba9ezb5z6H2fN5BsfrzBOS8sNka3xVWdDIKU
	PTl+8FAtS+CJ+dAzh4/Y8dgv3SgtHGcBg4U04L9ng2+ATzojwkbbvXoiqw+vvsqhSz+M4Hb64z1
	8FHhVDvNUNmUjr7jKNbPov63nzjDRgewen9DYv00r5beZEBHf/4ufmcypF5RVbzUt8QYzNF0AeR
	ogQ7pZn5GPILlxVgG54R9q2wAw83bdi+VUaHJ5j1DdoqpvgTqlKeYWOVMrFUcV2VExZedcnHkKJ
	1qFRLtzalBQNWu1ryMNlw8Q/PrXmNhS3kylRWjcPVx0zVNZVdE2O
X-Google-Smtp-Source: AGHT+IEyDv+QP1EWTmSMHRE/uIeHGYYUBcOw1Q2Wl1sMO2LldMVdHnU9NCNTqj9cN7+ATDWFNxMd8Q==
X-Received: by 2002:a05:600c:4c96:b0:43d:fa5f:7d04 with SMTP id 5b1f17b1804b1-440697e1215mr95282895e9.16.1745321545291;
        Tue, 22 Apr 2025 04:32:25 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:24 -0700 (PDT)
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
Subject: [RFC][PATCH 10/14] kmemdump: coreimage: add irq registration
Date: Tue, 22 Apr 2025 14:31:52 +0300
Message-ID: <20250422113156.575971-11-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_043226_772915_A0E5B366 
X-CRM114-Status: UNSURE (   9.32  )
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

Register irq info into kmemdump

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/debug/kmemdump_coreimage.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
index 077b65cae4cb..2144edcc6157 100644
--- a/drivers/debug/kmemdump_coreimage.c
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -2,6 +2,7 @@
 
 #include <linux/init.h>
 #include <linux/elfcore.h>
+#include <linux/irqnr.h>
 #include <linux/kmemdump.h>
 #include <linux/kmsg_dump.h>
 #include <linux/utsname.h>
@@ -74,6 +75,7 @@ void register_coreinfo(void)
 			  sizeof(jiffies_64));
 
 	kmsg_kmemdump_register();
+	irq_kmemdump_register();
 }
 
 static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
-- 
2.43.0


