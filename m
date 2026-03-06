Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CA9FCB601
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsVePr8Brwc4uqDNMxUsa63z10B8xk0sNAC+har7PuE=; b=SldVJM880+qlbQZbyRF40sumfe
	NJAVrSS29XP8SdIrAAtjxu4at39VC88QSNq61GRX3nU5wO1/PngQhATx8J//N8B0b4aKgBCuvlaKw
	HlONBTMRfLzCURU1omyt1XyVPCL3VAs86xiJ5DhMrBOxX5gDkUH2ze/mXOxd0QHThGcqIqr+LIBrS
	UjgChA5vAoIkitruxb927dKiNLAhq4dw6q9/zxiIVVkupvQbkQuMpXWldAUC/GtgXTL2EwELkhDcr
	uflKEZ7kWkVqduEEnOenPc/MHQD7BvX4GOyCrHMwa9EJMqs7AKucz4Cv63szVR3AV+NDyxwgZpLwM
	2xnAa2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWIh-00000003wOd-3lKR;
	Fri, 06 Mar 2026 14:37:11 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHy-00000003vPC-084T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:30 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-439ca6a7506so3713076f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807783; x=1773412583; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QsVePr8Brwc4uqDNMxUsa63z10B8xk0sNAC+har7PuE=;
        b=L7TGIPvBsTbRVZT7jY8PWWHFncyUkZFST0Y57SasaxfmKUbhDYoXIxQ3qK7yD5rji+
         A8GIoS0rFL4dIJ8yUCYJ6FGPsDbUpwdkceXX8Tx3Meq0U9C8buQv4+w8p59YSOKnujzh
         BRpFfDAjNEco/bzRMfCFOXjltP0ZkASe43hZcFdw7JYY6eh3/8RbH8OsmE5DDbb6z10r
         6HBgyIxpwdyCIkKyceOiFTeYQWVsrxajN0LkecVGZQicIITnabLcsszCa1l8s7Pxv/rq
         QdoAeqmZB57H2eiNQK6ef/SNHNJx/zEx18aWWebKiPCQIsG0vAxKIiNH7bWH3DC7RhOB
         hi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807783; x=1773412583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QsVePr8Brwc4uqDNMxUsa63z10B8xk0sNAC+har7PuE=;
        b=vpdOX3dPrtoQRkUoZazeS6vmf/9nU3KATNVu4JqW3MAbtWD8ZHmIdZf2QxfyR1LfnN
         mjQt+KTapeQ36MOfZRaKObww65TNK2Ln+eRmpgPjOYTWcIVGDZWp/qw1DySEvaOyIiZ3
         /KCgAYdu27Dc58W36ZsgDRTzMk6PS8f3muUxMU+ejV1KY6DhLpDLs/Y+DGwCxmd0INY5
         Q9uqap0xaL4Nwrwn6ZlQ4gOAMZOejMJzf6HFvjLAIJEXaG77vtmrPOHO+ROhnK3RwhsM
         IkmIGW+6qvTFXDD9WaugLY+BAOWaEDXV6OTGqi+jryNxh71aR8v0wgsMx1yxdm+woI0H
         76Xg==
X-Forwarded-Encrypted: i=1; AJvYcCU0qEjxiyKTya940CcXXB/PUSXxAbmaWBvxtF9NoGFe3HCL19sEvdTaRpUT4ulBNVT0qRgJRzJq071394iE3XF7@lists.infradead.org
X-Gm-Message-State: AOJu0YxrqQH61HmFSkUQiA6Qmk23zhFuqeUHjaoX4SW3QwU4hsUk7XTn
	jICIQXvNWlRFVdsypV2GycvZXV0k3cxH3LurjQ3HSFRxoGiZerzA54+sSVdeFlXUJmep2yPkdjt
	/l7nKW3BDIGxYoqmhgUKt9w==
X-Received: from wrbfn19.prod.google.com ([2002:a05:6000:2893:b0:439:b5ff:8e88])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2681:b0:439:c38e:66cc with SMTP id ffacd0b85a97d-439da88ffdamr3828400f8f.46.1772807783068;
 Fri, 06 Mar 2026 06:36:23 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:34 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-31-vdonnefort@google.com>
Subject: [PATCH v13 30/32] tracing: selftests: Add hypervisor trace remote tests
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
X-CRM114-CacheID: sfid-20260306_063626_231359_17714890 
X-CRM114-Status: UNSURE (   8.02  )
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


