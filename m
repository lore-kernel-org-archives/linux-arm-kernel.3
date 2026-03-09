Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1593F4180F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsVePr8Brwc4uqDNMxUsa63z10B8xk0sNAC+har7PuE=; b=jaKGl4h1gaH32Qzkk/rrwVkZ+G
	zgmh1hGZvG93sG3kwM9IfditQYjW0If2L0Qf7L7MKKN3DOlGxcojnTFodhvoilN5AvgUyKW5TzOD+
	VPb2xfHuLAdSGAWY1Z3PjWCNbR3haRk8G5+eZn3mz6N9/bwIj/0b3vQMYmXNYrfnpbpxlY5rJaDgi
	CTTeePeyMNnNUyGTGTrST8r1GXcGc1AA/vNToTJ32PwgB95f0OsLw3j/52hWKP91moYjWeDeSgzYn
	bop329JfCvyg7MEJPuOxledNyttGpZeU7sxInJcPSY1JdEs3Iv4PyM4Ynv+D07pNvVTANRg0BNrCw
	wEsnAUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdRy-00000007iVi-3lCm;
	Mon, 09 Mar 2026 16:27:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdRF-00000007hUX-1rPK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Mar 2026 16:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QsVePr8Brwc4uqDNMxUsa63z10B8xk0sNAC+har7PuE=; b=VI2eU6TmnmvNkCzoSyMJPcvFyP
	Ar0w1kMab1FjAr6e7PpSSEYdB3YDyQtbbYvdq7ZwPmRxPLg7amv+Og5xON48PJcvTo99za0PUXAZV
	ZnoZznPnQlqTA0CmwsScC4ACor8TzMSD+8gFD3gS+1hi7SVb7nioPt06hXAWtumlJ0zKecBwd49WJ
	uQUOgmQbvhec343GY8bUGY+Yj6fwGXygM2CAhMIxIo6xkF5yb2ipsXEou8oYL0v4l08RF9qLnKM8g
	H8rH4wXQQXN+HsSLjw61sRyj7g8T+DSJVKacQLh32BIsACNWnktZseQ7HRGnl3oKeX3c6H1pDmgZu
	6jsZVG2A==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdRC-0000000Cew8-1wLf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:36 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4853efceaddso6562065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073592; x=1773678392; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QsVePr8Brwc4uqDNMxUsa63z10B8xk0sNAC+har7PuE=;
        b=OlxHFOc2NlDH7JMuV++AHYWYWLQI5LmLrukIf0bgrBbAuk/SzFoVkTbeDLwVnIAGHs
         LOu7CCM+1WYiICdPjFB5R8cudC85znOyKEKM4q2r4p0Fg7TKBNosXwvImGYqlx12pfKO
         HZ9jLn2SoXLGGUEIAPVOLcoaeXHieHek66UJ0U3tG9n2Nw/jckD/VSy5FElB60JieF/+
         hYlObiB01dDk3zvJ3x32nva/djTdG+PI1i/1NKpYVnKxcvKPZWBwLxVzjEmsNGrpG4Bd
         MXW/9aQ8sMs6dXZZVqABzTWAH9Z4wha4jP8BK8YaXEmsfhNsYrVnsTraF7MRIGFFqTjF
         S72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073592; x=1773678392;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QsVePr8Brwc4uqDNMxUsa63z10B8xk0sNAC+har7PuE=;
        b=Cb9/A/ri6trsW0N1NPI3QUV73NFnKv/MNj5k6aW9GmVO5h/TH1Khhq1uLW3hEjh8Pb
         UMgQpoDRX3XO29CItbkHWYvbrukQXO4PyJXv57slTGdfQFffbJVjkImxF8YiFr9OCuFC
         Zc1ukVfBB9admeAi30Zs79L+Cd1lJas+yZeGytB59zYyiw97xRhhghVQEgBras+/YqeS
         +vu4b9lqyj3ayM7SrSlpJYK4xg5HbM5FbLI6lTyx7KLtuUDp3AThFw2wHx5aZa12Pu0v
         Eqb+tx9aGp7MxNO2esnfFl5AISw7NRBTFwUVttXkQvL5TLsWcWblyCBHdzkqfEbtLO/7
         FLHw==
X-Forwarded-Encrypted: i=1; AJvYcCXa/YbIFnnJoHfQMkGkZNzTq/rBu8d2tO9eTgZjAnfsVAJgMPPtkIxfhDfbhmjVViSuMFeHRgxQxaTSGjoKquJU@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv/0nsvys9Yb0AxILcnCV7FxAN9TxN1zmxV4BECxUdRrUOGtsK
	8QxV3NPnlHvfldew16IXyyUHzU0ZNmG0f1tFk9La1T1TrCzjBcxXGjURlUTxSVtQWv5caDE4RmH
	AgDTW0NC7YlUIA8/CnNy7fg==
X-Received: from wmfq22.prod.google.com ([2002:a05:600c:2e56:b0:485:318b:96c6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b13:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-48526969359mr225784865e9.19.1773073591541;
 Mon, 09 Mar 2026 09:26:31 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:25:16 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-31-vdonnefort@google.com>
Subject: [PATCH v14 30/30] tracing: selftests: Add hypervisor trace remote tests
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
X-CRM114-CacheID: sfid-20260309_162634_553166_3880EF52 
X-CRM114-Status: UNSURE (   8.60  )
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

Run the trace remote selftests with the trace remote 'hypervisor', This
trace remote is most likely created when the arm64 KVM nVHE/pKVM
hypervisor is in use.

Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc
new file mode 100644
index 000000000000..64bf859d6406
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor trace buffer size
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/buffer_size.tc
+
+set -e
+setup_remote "hypervisor"
+test_buffer_size
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc
new file mode 100644
index 000000000000..7fe3b09b34e3
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor trace buffer reset
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/reset.tc
+
+set -e
+setup_remote "hypervisor"
+test_reset
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc
new file mode 100644
index 000000000000..b937c19ca7f9
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor non-consuming trace read
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/trace.tc
+
+set -e
+setup_remote "hypervisor"
+test_trace
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc
new file mode 100644
index 000000000000..66aa1b76c147
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor consuming trace read
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/trace_pipe.tc
+
+set -e
+setup_remote "hypervisor"
+test_trace_pipe
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc
new file mode 100644
index 000000000000..1dafde3414ab
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor trace buffer unloading
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/unloading.tc
+
+set -e
+setup_remote "hypervisor"
+test_unloading
-- 
2.53.0.473.g4a7958ca14-goog


