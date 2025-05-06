Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7B4C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zaqt2aF+R21ZLRZCmibO0BCKtkQEu5NrJjYtBghM3iU=; b=OJeyn3yr8fJLKaCmYPqNNOGnqX
	YMHPcTyt5kfIhcIuzR9lHjmIXeIjy1OEmGK+6AJNp1u4xmRG1a/zldzHVJh5IfuROB7JNKx1H5bTi
	v/oGiLKrlEY98xul1Nj4KlF7XZQXsbs6BLWkbS6a+1gRJFpidqsFCD4/eOcV0ZCo0zADD6c4qnASN
	BBodROKP8uCa9d7JqgGgdA4urt9PQk6ykTnMxZRGXxpA47JoW0i2GWqx2IP1W/bsLxH6kNVEO5gRY
	Ptb22TOiluZtxciJX13VUFMBTDwa4GIcslwVcQM/UWe+fsSrYTYUkQ8lGJbQSGbiOA7Fzyv1iFGpy
	cos7trfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQiO-0000000DZWP-1cgc;
	Tue, 06 May 2025 22:24:40 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLTx-0000000Ck5o-3pUB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:49:27 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-39c2da64df9so2643187f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550164; x=1747154964; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zaqt2aF+R21ZLRZCmibO0BCKtkQEu5NrJjYtBghM3iU=;
        b=LA1/UoSeOgb5sOrDcXgG4PUMsFmQE4h8hu1X9czMaGuseQ/0786zLs2Ft0RmWNYMMG
         ZP0opTFboGSQvROwOkmr8Xx0yuGh7DtMmUCWXUy984+p8kbtnEjfdC64zlR0Xd4ov1uT
         JxCHh3IeQgl5lE2mpvwnLS2u1Qng4hYiMwlmxWdX8jkKU61WcwLR8uJ9aU5O14HCuwnN
         q1FIn/svEWYfqIuTDVoqGfuoh+zl6vdNMLsNcSh8ynqdB3kvh5Zx7e0C2nlEPIH0tVfw
         HBYuNVflw7iP1W2nSmnErD4JPkhVYzD+UXIYNOE1mFb4ssxHGI7cv5qnnimL/4FW1rhb
         2XIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550164; x=1747154964;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zaqt2aF+R21ZLRZCmibO0BCKtkQEu5NrJjYtBghM3iU=;
        b=VDbjfay1ZFjt5+K+EbImdfCyYY5Cgn9ol4/YxBAq+4pRDVlubkeBYchE+EtgL0dL49
         jekicNzw7A2FY662PDvjYJe21xw1LHZV/y8lGQlfimib4HFojEmcRsPmXfpooIOe17vK
         1qI8Ob4z7ApWZg1t9r0bGcv6nx1qP1B0C+8SPsRZXk9PKezUAwR9t0GpLBAW+uUASW7A
         FZuDAUfGF4YZOxCesMLCnmHUibIGcGHY8RdkzDDAkXkE4dE37rM9NjoJkiw1Di3/lQ+1
         wZ/BY1Lk1cuuHDGbfQe85F7Ip5KAo2vPGcpFhX6U03K7dXRjfS8gOIPOX0E/VsHzgVfm
         V8Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXW6NiTN7BAOF7M1J2vj6SRV0eHFrSxU/hKHGsW0A/wQE4cCm3OOkev/xaUTTfPhf569q4b3er2comd9T1NcGuN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr5YyjdddEvcVx8/JNKwWHSj2lChHyYoF/ETQaXNeGXn30lQ4c
	1RDBjPB3Z6YoynKCt3RWqxMyNcKM3y7sm7+sxtQAno4UVuMQvYYqlHo9aVhhVhF7Ff6PUOiINC+
	H8TdMMwjp/fPgSMVo+w==
X-Google-Smtp-Source: AGHT+IFrqd+H2SeGnXjM2S5QS5+AEOUz3d6c3+Xi+kOr44Ta+o3bbgik0UkwmDoNUTqqJhmyWDUfjboZeaZZM1Ft
X-Received: from wmrm12.prod.google.com ([2002:a05:600c:37cc:b0:440:68cb:bd4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:22c2:b0:3a0:8098:b6c with SMTP id ffacd0b85a97d-3a0b4a186c4mr138331f8f.14.1746550164127;
 Tue, 06 May 2025 09:49:24 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:20 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-25-vdonnefort@google.com>
Subject: [PATCH v4 24/24] tracing: selftests: Add pKVM trace remote tests
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094925_950943_731FE363 
X-CRM114-Status: UNSURE (   7.96  )
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
2.49.0.967.g6a0df3ecc3-goog


