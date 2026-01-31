Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E38D7976B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0jKC8f/iEFEqNg/0cUe99XmInCeV76uXOT4uvAYEUM=; b=REEvlOYWgkU39MEG4Kq5kVbaDa
	oPCT9Nan+jy+9+6i7cWK3ayNj1mUte8kFBU/w1OQ05vjgDQsyAE1dYf1gkGlI21g4wQFRqH8/bQte
	z5Eha4QnNCSI+njiiO0OyeNOc4kqn9ERVgqF9mZLCGWxp1iWBhorNwmays+uhIaTjNIOCcOhvdCAr
	B8A+kiRYx3ZfVSOqeW2VDJrTEskEaqy7/HhU1LrJgkFo6grzF4wp1laGGLPHbDeHxZ5G4KdZH5b/y
	k3NmBrT5EkVLwOTiP/0/y2Np0kkr4g0yoBq7wEvrxV45oMacgozC5Wg4EuzBJZCPmfcSCRo69FPJa
	4TKUDV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB4R-00000002dK9-3SrS;
	Sat, 31 Jan 2026 13:31:27 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2w-00000002c9g-3zPZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47ee432070aso23650825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866190; x=1770470990; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x0jKC8f/iEFEqNg/0cUe99XmInCeV76uXOT4uvAYEUM=;
        b=wAD+hLNfXBPvC244D3PGZkn6bz9EcXgi6LFFcmGwkmgmAyavUw10SSZJ70lVSwWhu1
         6hBI/xmdykehIQiz4Kss+yAgbFAKdXuQbfXMhn/jX0ue7YeXSv3XzypXlPS6A3EFaecg
         30NMi7rwU1A13+feHZbjhiJBzbwuUMAiQbpmij+TvZbdKix+crHNd1Ft13Ck62zYTap9
         Wt5TBYNpH+uoyv8OrJWvgfGXg9Nq2+4a5ifDSNrVZjOR6/xc3IV/xwNOCj7FbgLhnkTT
         uYn6R+SRNWbWplsn+Zu57FaNAvR/oVdkZOXn9z2XXRIXge045urhQM3M/0WVULfIWDsK
         Gs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866190; x=1770470990;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x0jKC8f/iEFEqNg/0cUe99XmInCeV76uXOT4uvAYEUM=;
        b=kCoFaJ8zyrRFWT2uV85pD1iiMS+lW7TAxGcKo6qojIKmwyR/IPh+Tcv0hjMAaD1RVe
         NVdoKoYGx4oiweWSZLE+wmmbDX7ZNdhYf/mkJ/EiTbPuoAiUOJabegp9Q9WfYNXLQeoH
         X6XnlvRESpFS0HT0hFD8dJQ4RQIsWp3Svl29rSQUlAxlZw+FmyBy9hIajq5Iq6KQynjv
         Y2W7NrtWjpt9LV8cbaoQtuDloicdCcYY8YlPVQIu4J/ZXQ2oLofysRi8Zm21IAeQO7r/
         ykY1m7yJ09nCAm+BhNa6nWXblFA4qg/gnLH3LbFzPEqg/5hMUHOKlq41IMYLVxRWpvkj
         QWfA==
X-Forwarded-Encrypted: i=1; AJvYcCVEtJGqEwaFvRuDRb4K1UBBXhpGvMZbEAzduagNQlZdeL3Mx2Wh/UI4lq2jQ1ce3nAi80PEXazSJZ9gXMUbHii2@lists.infradead.org
X-Gm-Message-State: AOJu0YxA9mlCZn9fr2Dx6u9h/PUkmm4aGLjiB4P/ZBt395eGriEHS2b3
	QHEZRaUiNn/tK/nuGyAs+Sode77Q4ucdW7aXuNrBSh297ZjN/Tha21hSNiBqx15hEdlPVGCJT6O
	L03Juy2Zz+fLsNoLo/iw+BA==
X-Received: from wmk26.prod.google.com ([2002:a05:600c:29a:b0:480:4a03:7b5e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4443:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-482db4a317bmr74357055e9.32.1769866190616;
 Sat, 31 Jan 2026 05:29:50 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:48 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-31-vdonnefort@google.com>
Subject: [PATCH v11 30/30] tracing: selftests: Add hypervisor trace remote tests
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
X-CRM114-CacheID: sfid-20260131_052955_034946_5A19C228 
X-CRM114-Status: UNSURE (   7.94  )
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
2.53.0.rc1.225.gd81095ad13-goog


