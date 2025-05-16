Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C5AC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7GVxU0/r+w5zLWT8gZSbiy4WliZZRj39MPigOv2RvQ=; b=44qkp7olvMWHWQXUnHbX6PRxO8
	XYs8zZFw7v7UOb/u/8J3kdoGDzuxGPEKnlP2y0NK69Cxywi4GiOUCEZw62J0775ZEGc7cxBDQpRhE
	ML8PxdkvOPaiHJWMGPT8ihefruxRAK+NsqB6JWOVS/knCoHlVRMh7AKn+c9T4JICGhJQcTTBSvkpK
	tj3LbTMMAUNFPwp7q8IwTZVRZFoJSb36bAcsevBcOTbuLDna99osEiv0v6+RMrDtV8FVyize6K20Q
	bJLJnTmJZsfiIGIL07393wW2I4+5kM/3VdQWys/Ks6x6ZPKPgG5ew7ymGEHq4S0u+gHxDaByiEUsK
	nKtgP8/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFw8y-00000003gFZ-46ME;
	Fri, 16 May 2025 14:34:36 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvJR-00000003Y10-3rGM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:41:23 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a35c86b338so764355f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402880; x=1748007680; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7GVxU0/r+w5zLWT8gZSbiy4WliZZRj39MPigOv2RvQ=;
        b=DkbkjhjI0r52npZU7BwcTVd6ZZwnEpxRFyebUVw8pA2U04494seae3DFwvS3C1CXuX
         irRQo934W6dzYP14GbPa7LA6HehCUkyG4jcxcnqsA//XMJudkY/ZIENqi5iBs69nTqAv
         Bimd3N8WotcE/nD200TbdYhdsjBR28lCncH526BthX+DOKDZ5SbKp9Gl/9syfv8UkF5m
         RCBEgCPdMkHHVsvjQpJVgjh78clDhV7hW7EOYVmWOXapU54O/kTXkZXVuHXvlQ8D3Ufr
         FgG7hvY1XRpvKyhieFxgtvTBY3cABy0/4CDfn19foc3RTVCjAZchNmsVB57BpEJCLsQG
         Lj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402880; x=1748007680;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7GVxU0/r+w5zLWT8gZSbiy4WliZZRj39MPigOv2RvQ=;
        b=hCEMBlXUENvfUJMzz3zzB2KehgQJptz5X9ALVGMV19+uz6ojXzMV2uiZlN09NICIRW
         a9VQFgQma8A18Jz0tQcVTvOlXXAxILkFnii1Jb0pM/K27KSHA9d0JOiDlY48LTxaD89T
         2Sz/TaWr7HuGkoV6YP/y9E59FYLE2WHyfdoyaoe3sVUn+3v9sFgYoOMFXbhWGax8ZbtM
         REcLFrkG/sS09/Uc05irYRlmh61a4HhIJgDjZGtkW7sFgS5I9E+NaZ3Bp8g4/0Cjx9G8
         ISaUCQ3f/SVxwpY8YPkUYadEo5rJYjDi5N4ZJPZgDakZMS2j1D16avEUP516zfN54RsN
         vyLA==
X-Forwarded-Encrypted: i=1; AJvYcCXCXlcw7ZRhs/J77LKyNOcNRNnjXAM6RaRWTiQnpjYvgkEmazQwCxRi8+YPDI29mAR3Is/2eLTJeRC+wL03cFM0@lists.infradead.org
X-Gm-Message-State: AOJu0YwyIZnIQmc54lQ3kPoGqIu09dfDWhmfG8j5MDSaUlfbeKZsfbe1
	yPdan1YURUBnDGd+lt87XIAmK2x8f+oVRXzXVMRwVsrT79AcwYGZH+AMdv8wOzNTwrR3TNIyWwJ
	s3IywgFdMXNJjE4FSUc1dXA==
X-Google-Smtp-Source: AGHT+IF5jgzJGfaBS/UHJ3X8WaZX+60Zli0llPdcw+b0LDQXYJrpjyQFz+/w5KLRHR1Rt2m4D1p45WOPNgP2H7ul
X-Received: from wmbhg17.prod.google.com ([2002:a05:600c:5391:b0:43d:58c9:bb51])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2289:b0:3a0:bcb1:fc02 with SMTP id ffacd0b85a97d-3a35c84ae4dmr3449099f8f.54.1747402880322;
 Fri, 16 May 2025 06:41:20 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:31 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-26-vdonnefort@google.com>
Subject: [PATCH v5 25/25] tracing: selftests: Add pKVM trace remote tests
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_064121_975790_F89A768B 
X-CRM114-Status: UNSURE (   7.56  )
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
index 000000000000..383ef7a84274
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/buffer_size.tc
@@ -0,0 +1,10 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test pkvm hypervisor tracing buffer size
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/buffer_size.tc
+
+set -e
+setup_remote "hypervisor"
+test_buffer_size
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/reset.tc b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/reset.tc
new file mode 100644
index 000000000000..679e31257d0b
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/reset.tc
@@ -0,0 +1,10 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test pkvm hypervisor tracing reset
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/reset.tc
+
+set -e
+setup_remote "hypervisor"
+test_reset
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace_pipe.tc
new file mode 100644
index 000000000000..4c77431e884f
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace_pipe.tc
@@ -0,0 +1,10 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test pkvm hypervisor tracing pipe
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/trace_pipe.tc
+
+set -e
+setup_remote "hypervisor"
+test_trace_pipe
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/unloading.tc b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/unloading.tc
new file mode 100644
index 000000000000..059c7ad1c008
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/unloading.tc
@@ -0,0 +1,10 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test pkvm hypervisor tracing buffer unloading
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/unloading.tc
+
+set -e
+setup_remote "hypervisor"
+test_unloading
-- 
2.49.0.1101.gccaa498523-goog


