Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BC2E9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8HAfsDbzjcEm8omLFyotBep6HDlIYV4sfcPciyFXCw=; b=IbkKleZeytTRiDL20ZjMq8qyZW
	wJemDzP9BvDGwx28c6zni5gThCoS/2ZyIom2ZS6a7JcCmi49wn31GS4JIHMBkTzR8uYhIMQzySpD9
	BLg/wnQBG7s+Xisc08WQBbmCCqL88aoSUOw7naugNVm4mEmzVHYqIo/8quJbGARtFU5zzXjbMm7BH
	0x3lh21gPnP6LavwZi6TYNNoO7sTZ/RwL8swC5xwe2MAzBCuGjJjcxCr8u1ueQeTeJsunAZQ2zVUv
	Bo7e8HMVMYqTyWnLQCcItphtibkRWvwPX36zLuXHwCUnLV2Dra5+b+LqoxoQ/njXyRzqQD6NyXD6M
	IQHJhPWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5aE-0000000BWFN-2HOK;
	Thu, 19 Feb 2026 15:04:50 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5ZS-0000000BVIq-1Lav
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:04:13 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4836fbfa35cso6491025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513440; x=1772118240; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B8HAfsDbzjcEm8omLFyotBep6HDlIYV4sfcPciyFXCw=;
        b=mOpdbFFpMJuMok0UxK3e2E4b9ZaO9lYfv5DW+3Gnto4yNrv6p+2jqCH1pnhSYpNxh2
         EoRegCSOHisKAaYeXRvvpe/sEhp1Pufh9SuvxhdHf+znkaWhkW1fDvgHSc2Vdf2TLIM2
         L7vGCj6OkCaRTmunjJV0UD/FCudb5bBkTtaGVVp5DLxwbFue579YXcIspkYNwh+g2xej
         w1cL8z+AEdbJcHJ0H9/vl+gMAbEGufWVFi65TUyxGHLaWN7j+pnuQhvUzI5GjmshwZdX
         KBBN7Fqlq4VvkipMbJpZMBoKr2m/SuU/O2l6k0XFhUdH4I/bMgwbL4AClnqVjYtyK6iQ
         NvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513440; x=1772118240;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8HAfsDbzjcEm8omLFyotBep6HDlIYV4sfcPciyFXCw=;
        b=D+iTrKHr8xJAwwdSO83+l/SOwGHu0RmpjMZIhPxBiEaRrvVoemrgZP95PkQlgzWnga
         u/6HzHqA7TZ8TqucO87qhktCCejO3KgEGQTJECQw4DJDfWcvwygSy9RVKGyw4wkQYi37
         h4yn/X7FtmO7RiBxc2OtVO6B5FQ3pAzHyAAWz92fFyd98Lz/pVXnwaB9yO2i0ah5RXGY
         3H93RfDtTo1akBmLeZkmn+9zz/Xa/HN2Ka52uW1YUJek+Fiw/CvfybApfDTP0cP45WR4
         gs1n7Kzbagtc5RGTlBYi+9o/X5v3Aw+hldPk6gywPOtV/JwjofldkpRrzTqb7L4/T8fr
         MO9g==
X-Forwarded-Encrypted: i=1; AJvYcCW6DZio16m5ysFTbMclenEtRu1aZc3k4b8O179H2nropxAQWBJpaZGPGTdGvualzO91wNjxr7y2Rw6xXEzLiWA6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy1CU/6nv9EJPvui6KbxkJaVRkkLzmOeS94/nRjntGGu+2nstH
	7rpZF1ncMqlP+1Br1wgVA2+CunDXxv9Uuo0aklVKbrUTQrSnv9GQEnZVX+xbYFEkhOWtpkeWzER
	5tuagheWW1GQESrVCfOl49w==
X-Received: from wmjq15.prod.google.com ([2002:a7b:ce8f:0:b0:480:4a03:7b63])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3485:b0:47e:e9c9:23bc with SMTP id 5b1f17b1804b1-4839e669135mr40605035e9.30.1771513439603;
 Thu, 19 Feb 2026 07:03:59 -0800 (PST)
Date: Thu, 19 Feb 2026 15:03:07 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-31-vdonnefort@google.com>
Subject: [PATCH v12 30/30] tracing: selftests: Add hypervisor trace remote tests
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
X-CRM114-CacheID: sfid-20260219_070402_425149_E0FC0207 
X-CRM114-Status: UNSURE (   8.55  )
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
2.53.0.335.g19a08e0c02-goog


