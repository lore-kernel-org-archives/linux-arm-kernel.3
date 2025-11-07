Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BF0CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbzgYWavEDkucaAQHkJWm/yuhE4r5kJ12caCWyV8SCQ=; b=utslqWrfV4yfFYcmHAIRG7SoKV
	IRpavtVnrjuzB0xofLlU8CYe0qFVuZUh/Buv4D4xMtJ/cO338n7ib7TpgHhhqPTNfYqXLwXVAf/sr
	+HuUyjOsBGnQ7x5rKV2x23HbmXPvhmljm6GMHpE7rN1ipHon3A2HATGIXwbm1BaO76hgHAO0ZDyID
	CI75X4NPHdRw39Z5ciPIhzYfz1KW3NvdQXdDY6xap+Zy1HV/e4/aIdTJWMxLaLH+Nb3SLi8X09+CB
	0DjuGPHikyTibAahNfvfVrxsJMJbyJBumju2ydzBRJGd6aug0Roy/dFzIaFgKfVunc5ppeRYcSr8X
	1OY7knpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIx3-0000000Gzsa-2iLi;
	Fri, 07 Nov 2025 09:40:13 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIw9-0000000Gyjz-0zgX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:39:30 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4775d8428e8so4007525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508354; x=1763113154; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XbzgYWavEDkucaAQHkJWm/yuhE4r5kJ12caCWyV8SCQ=;
        b=INf6FAKXFPkvUsrbZ+btm1dtcWdK2bj1xgoxF/xqU6nv7KhMv2KmaezIm/X9TlXAWW
         HBAzc2wa9lTu0RS/r8qhGUxFbdycmK8hkCGucVH8I2D9z8o2qPbr5pSUMv0K4uAyLibJ
         +fZuBmc11ttBn4es4uv1r9831GmRKbMleYVEzZJ0rbo6qZLJAvBpQuwVlZYCljU1lisS
         IHTNNt5/ud+xgBsqGdaoBZTx7Ci3qwin0rUtMZghD8Pn/I1DzAaEuPEQa1pG8lU98koh
         SoDh0+6XwoD6uwbwwafxhjZU6GYIyA0WiJ8Gwb5axfig39jnUvgXPqX59+FJms0pXgU0
         XW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508354; x=1763113154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XbzgYWavEDkucaAQHkJWm/yuhE4r5kJ12caCWyV8SCQ=;
        b=lEZEWaZ5nuqDum26g2Vqn58EhhJpRTlAvEK00w8NIIlTRLdKWaGWzAZlejlNDgXF0A
         Dscc7J0gMfUh7bfX5NxgHSHwi1j/4AcANxS5IYdmwAfEezhIfRK5S46eQh+g8TVBQNiP
         J0tr/w5VOG9oGhx+Ao5rK1YoktpqczkHNZTg1V1MePvoqb9k4ZWwsE4LeelCUWRoz4cZ
         H1zIUaYqncE6RczUKalffgu4I6catQmG7jiIrY/EjlQMSEcmUQi9Xfj8FF7/D0MrZMDN
         SgxTshnHQ96njQsE0Stosgo7sC3fPluKPdSZNr/V7thrieLs3Fqqzj7yxI3Z+0sWx4/F
         ikgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzc4H3J4MMwX+AgnF60CrvdSSw/IhkpOGkNcgkqe/e2J6tHN5S9Nmn+cJmZ2t9qfpwk4WrdQbN8GDJytZc1MY2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6uSHIMTJPNSiw6otmDQoPJeHJVI2fb1oIhvNbu1AtUmAH5xMs
	IIvarWVe/633HxBEi3WHUxpKa6sIRgSQZpKhjn13gxnKf/oAsVLzO2JNiEwDxAWlRipj+Juk5YT
	OkJQKLgimtwPY0uZFf6tLOA==
X-Google-Smtp-Source: AGHT+IF60dCQJ41NPrptxy3Gj7Wrk7uExuUAy3Aow0y9dEr8CGkC0R5jKhv9OaLVv5BJbKI98weG92o8nKAmsyEF
X-Received: from wmdb6-n1.prod.google.com ([2002:a05:600d:486:10b0:46e:37d6:c1a6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:468f:b0:46e:32a5:bd8d with SMTP id 5b1f17b1804b1-4776bc89facmr19293645e9.3.1762508354525;
 Fri, 07 Nov 2025 01:39:14 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:40 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-29-vdonnefort@google.com>
Subject: [PATCH v8 28/28] tracing: selftests: Add pKVM trace remote tests
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
X-CRM114-CacheID: sfid-20251107_013917_596390_27C429F1 
X-CRM114-Status: UNSURE (   8.54  )
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
2.51.2.1041.gc1ab5b90ca-goog


