Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931BDD116FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SzM9KLgL2lNiqGPyjU/uTvcU4SeOJpnexCrssRjDMk=; b=TQIDxvJR3O1J6You+vUam+BNFt
	G6G9tYTfTCS4lF9tzlUZrz6dNSOBmwLdXH6+7ID/NDrITyQeJrbds/jI2kMbXJfbX2+iUe+Dh5/IX
	KyGZ7t/tMr3vrZG9v13SOCjRMy+ws2/KuEkEXy27YAm245eiIacPxWLXSw3ka7aJARa/7ESy4WR92
	iSk8sIHQqliBDbWddO+iaNIzIgyvDPVWnhE0US45jYGf3m62D6CehvyuSq8sYVIqWOezKmLH0rWWN
	1pj8jXd5fuekbqe7ynFiByRNKOGUoroKZQhVQOrkyunHvVV1QIgsD+joxrm96y8cSkrxpEqh3R4Cw
	TxLJ7cgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMpA-0000000595L-1pfX;
	Tue, 02 Dec 2025 09:37:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMol-000000058XP-1kpr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 02 Dec 2025 09:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+SzM9KLgL2lNiqGPyjU/uTvcU4SeOJpnexCrssRjDMk=; b=jepHdcO8muJq5dcZQK66qDlzuo
	uJZJqEz90AS/RyfaRDsM598+g/8ACf1uDgWPm6APlItS6Kz5A0Ia0na4kbiluzvMyssaPPrHWhf/Q
	dqljWzNi0zQu/Z5sB1uCIIf5aLniyZIZRWAxdMMuefgQVQmabQxidhVP/7ujD2H72wOG8SqGNiNad
	5w/LhAntQK74yLQmAzv13NNwpw8yqyhzLyYEWyWdteh1yFMMiBnmB4DNn3kpN3kdDIF6AxSCtQ2pm
	BxFx8XwZhqHT1CgiL8x285RT0mBPaep3NViF2Eay63rx8nefGMniqZZcXNJPppU80ySdakKO96rwd
	HszpyeUw==;
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLx8-0000000HaMk-2wne
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:41:45 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b73586b1195so661124566b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668221; x=1765273021; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+SzM9KLgL2lNiqGPyjU/uTvcU4SeOJpnexCrssRjDMk=;
        b=aLvcVFM4/G4/I0xsJcOxhwSpoTE98VinB27O//0drnG6VLPEKfsEWllmA9ArJaGGG7
         jxU7vP4WlSsTaq46S6YZnZKhNLjmMWgC5YvugSHLF53e1i0CLUzCU4ipuAbAtaS9Hcfu
         aFswOPld7r5uQG+Q5ubDoucSe0Tu/HJ17QI1m8PTuVQ2RGNY8FByCjrRRrASG0iwnAMk
         kiw8KyMz3nTO2ML8fsCmN4TCJKWftWfP2A1yXC7yF9oRIjxYRrYbjJF7M+8HlKtTqy7E
         gRwNomwUF6ZJ1sj6FZ31uVj93glJIlIMOvGkS+127deT0ZrhVrbAXxIyANdyf9+66FsK
         J3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668221; x=1765273021;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+SzM9KLgL2lNiqGPyjU/uTvcU4SeOJpnexCrssRjDMk=;
        b=uDoujnmQ+7B0CNRIWxYvZzmjCZoxYY/qgipyYLBcwcs8iByv532rLxnV3I67k57s62
         7ycnO50nxIPodzlYRAbmvqssaPqmGPo93k02BtAr+z5Dmf2pFE1Z4i0qOP4hrnLrnBbC
         9rTRUmXgxZAcR1uTI3azOe+rp41SF7P+dOqfxOTCFjk1cO+IDVnbJVHJw73mzcfyJq68
         F1DcTxfkeKgzBxutd9c3HOJOeqKkSmSkXmTZCaWvh9Q9qHaomJ7eq8+4sMZ7yqdvLLuh
         fhv9PtCu2UwcvX2EKjB9zPLqbwg2oPo/VeInLu+OD3t23Z19qxRqXOoHMPk8G8UJAmBO
         RBkg==
X-Forwarded-Encrypted: i=1; AJvYcCWxGtylt+axV45XoztGwqELXG5EMW/EIp4TfV4aowVNhkyysgafXq7uumgaze0bZ7XpsfDvua09qs+LF+q+u1YI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2Ivz5vIAr5hqMRlCbs7y1sHpuPmZi8uKoYH/N3Adauv3PBofE
	cHVM2pYsT60HnG4mcHHXmOc7+JOKvCJVGHQtQdckKbMGhKwpzPvXDJ+wL4Weo71Li8Xb3mNbY5N
	rXvhGbL5DB7sJ88vB9w/3ZQ==
X-Google-Smtp-Source: AGHT+IHvb3xnp0JFd6fDTPTjFHfgzvMoOO5D/uqUHZuJommh44ByPSgz4fUGk8BxStO8hqDOnZDIAusho37QJVIV
X-Received: from ejcst12.prod.google.com ([2002:a17:907:c08c:b0:b73:3b4b:d5ce])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6eaa:b0:b71:854:4e49 with SMTP id a640c23a62f3a-b767189cf54mr4813189466b.56.1764668220623;
 Tue, 02 Dec 2025 01:37:00 -0800 (PST)
Date: Tue,  2 Dec 2025 09:36:23 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-31-vdonnefort@google.com>
Subject: [PATCH v9 30/30] tracing: selftests: Add hypervisor trace remote tests
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
X-CRM114-CacheID: sfid-20251202_084142_872307_FE6F1C93 
X-CRM114-Status: UNSURE (   8.48  )
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
2.52.0.107.ga0afd4fd5b-goog


