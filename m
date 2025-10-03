Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B32DCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UM3bjOGfRXsiIqNoVQZ3XTLMtvfmMCHhcAES2xrn08=; b=KwaENedp/oYuoXOCscCXpHgEoa
	Y333UkVdB6KXQ2Jg4qDemE39A2mHe4Fk2UUBvHd8QCgW8wIaqCtbVqVms8AKf2J1swSiKE5EUr8/l
	RQTU9taRuiYGpqoGfTIGeFMRsbhl9Fxqkf8ya+KuJL4XDDu16JY4hCGE1wKZyZxuZpBGnJXmK8osF
	LkqPjuHamcn5CD+os620v5RD5f/qy5HjWgpNou3b/WT2zsVlgRovMXaIZFBLMwSPfF5/MpyNPt1jo
	+81HLVMKSw9UR3JLuS8UqTzsQe0weU2PM83dRSQsl1UNmKa7sqi/qJzKnwIzH7JQGUh0V3PrX9rZd
	z4kz2zwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g11-0000000CRbc-3c52;
	Fri, 03 Oct 2025 13:40:07 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0L-0000000CQYb-3OaD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:29 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-46e41c32209so9806685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498763; x=1760103563; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9UM3bjOGfRXsiIqNoVQZ3XTLMtvfmMCHhcAES2xrn08=;
        b=atg4HcXEre1ErAi5D8wQAvZBxHgMAfx/h6t6jSPdS+czI8SMeMFOvj4Ifl9CP370XZ
         M2jyaLa40iJfOG2SBsyZclQJdQVrAUTkmc6xmubwkAAXohQS+zyoXXZGaW0m/c9BbmTo
         efM3ekPLxO4uPb7v/3XC4f2d9AqTDwTyFwu2D8+QYjlcRqD7GvW7mMvUzYshUikRY4kZ
         Uug+8YYiNNBsPNhBd94CZO6VhMEjyAQswKJ6VaAKs6/r79HP8gAnGUTwWdLiyhyuL3g4
         iQf52lpbt98eytZve1QSSgc+fW9pfw0u1TCpG0cWKa1mkPXCkX+fAyoOVOqgUJEGPI1a
         PDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498763; x=1760103563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9UM3bjOGfRXsiIqNoVQZ3XTLMtvfmMCHhcAES2xrn08=;
        b=KcWgSEsYfRAe2Et2AN4xExxTgbNHbBBHXTuptR8gEmVW/J8BZsTy0EoveJZhFz7NC1
         VAXEpu5W37bd9UGoOcV6IE1PAfa778gemwr16Psy19bXSaESfNqfhXoGaC0mPGR2he15
         A3ohKpS+hYmv8yGyT4Hm64SynFldsH9do0zIF+A/1MQTUn0NrACJIJ86Ej/58pIDo9yR
         Ra4huj4Vj/jl46NfzOv20x8CkN1zDkhidpvU6aB1Eb1zRx3k3q0Fqe0eKvI13L0CYrsD
         6+9LN1ihZo/QHlPcD5lZ92UHeKE66K1phuLOWB3x2A3zoYXq0yfj/rFS4cY9GObsdYEe
         tNOw==
X-Forwarded-Encrypted: i=1; AJvYcCX9TV19MNcSYPKDJgVvwarAc5jDsUevcNELoZE5FllSSYMLueuF23FFR+EIIZLA/+L5rWCFKKk4tlicK0pbGyPx@lists.infradead.org
X-Gm-Message-State: AOJu0YyW73vC2uTJEcrySNx9IYaLbC3SiNHa5+ZtqVvxyKFcV7zEFDG5
	TRAXhL8uFQ+EUzkSYevawfcGXDl+XuWXWeo8z/Tdtli8EpbkniOYrIdDCAdFYUffZKXyeVlOU6J
	d3ZIoIHb3yLNsJCK95VJ14w==
X-Google-Smtp-Source: AGHT+IH69tFTi6ZXKv+400BRPyLOvUgxD9vIa5eZfePSc6PtEn5y2PQMqER0DyOBvI5qOTvfVEhXP1sn9nPiGRc7
X-Received: from wmco6.prod.google.com ([2002:a05:600c:a306:b0:45d:cfa4:ce0d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4447:b0:46e:3dad:31ea with SMTP id 5b1f17b1804b1-46e7113ceddmr26045525e9.17.1759498763415;
 Fri, 03 Oct 2025 06:39:23 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:25 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-29-vdonnefort@google.com>
Subject: [PATCH v7 28/28] tracing: selftests: Add pKVM trace remote tests
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_063925_951456_2B225A4F 
X-CRM114-Status: UNSURE (   8.84  )
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

Run the trace remote selftests with the pKVM trace remote "hypervisor".

Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/buffer_size.tc b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/buffer_size.tc
new file mode 100644
index 000000000000..2de07e4d72fe
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/buffer_size.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test pkvm hypervisor trace buffer size
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/buffer_size.tc
+
+set -e
+setup_remote "hypervisor"
+test_buffer_size
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/reset.tc b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/reset.tc
new file mode 100644
index 000000000000..48afc51627e8
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/reset.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test pkvm hypervisor trace buffer reset
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/reset.tc
+
+set -e
+setup_remote "hypervisor"
+test_reset
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace.tc b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace.tc
index 49dca7c3861a..00aed1c2e650 100644
--- a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace.tc
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace.tc
@@ -1,9 +1,10 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
-# description: Test pkvm hypervisor tracing pipe
+# description: Test pkvm hypervisor non-consuming trace read
+# requires: remotes/hypervisor/write_event
 
 SOURCE_REMOTE_TEST=1
-. $TEST_DIR/remotes/trace_pipe.tc
+. $TEST_DIR/remotes/trace.tc
 
 set -e
 setup_remote "hypervisor"
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace_pipe.tc
new file mode 100644
index 000000000000..b63339aca380
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace_pipe.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test pkvm hypervisor consuming trace read
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/trace_pipe.tc
+
+set -e
+setup_remote "hypervisor"
+test_trace_pipe
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/unloading.tc b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/unloading.tc
new file mode 100644
index 000000000000..eb1640a927cc
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/unloading.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test pkvm hypervisor trace buffer unloading
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/unloading.tc
+
+set -e
+setup_remote "hypervisor"
+test_unloading
-- 
2.51.0.618.g983fd99d29-goog


