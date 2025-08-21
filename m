Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD09CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 10:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXmeaJhI9e99CmL9wkkDfiednrjI4qTS7gtaFJx7Vrs=; b=plRCK7a0bt1PlGFfD3OuyyQVca
	yh59+b4ytn8np0x/Uy/aKdHMN60cMFONwlg+B9T7sJujXb79BmgjCsKOg2UEszUmaYYBCyquBx0B9
	AMyk+7QaX0bx+/FZ0E6HsHLEmpQw/yJynOThE5uzxZ4Un8peVCtoin4ZdwDVPjV8ltXbofT0D4UrQ
	Dmu502R+62HgVXev8Ji2c2774jwuaK6m3tfPpToz4PnYaIsW3JNOzl9HPkeABTTWDrtwoQD33wkpK
	G972EWWl/gilL5C0k6vZCc+qssXancCpOy2Rou4/QMmq0ecgeMOdMeS3Q78M2/c5A7p4q/KpcHtcz
	s5c74iVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2Rb-0000000GZlw-1rgm;
	Thu, 21 Aug 2025 10:22:55 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0Rl-0000000GCm0-4BtM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:59 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a256a20fcso3517965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764096; x=1756368896; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lXmeaJhI9e99CmL9wkkDfiednrjI4qTS7gtaFJx7Vrs=;
        b=bxBfy/Y6nzz+sjUEynHlYNHlts0S1KeHZ4vcVUi+niP6KH2nc3Lv37tS0jYo5cCNJw
         IrY0wbIyCrM5LDkve98w5nimDwbfuXKuXQVXHO9xWWxNGU+DMgfSCoAlHyGCFuskerA5
         8rdnMMDv00Vff884kahR5Ks34QwdIuNrrOVmS3GQm5SDBa+tA2kDsBICrnIM7AoxWXj+
         O1zmYwqEqZWyrGH6uxKx9W5V7mN2ZEAQovGeVqc9GeyGg5sWBc3Qozje2T/4mxo8kepj
         HZj4SI2HSDVEQUULGI/vXo0QZGa0/GTgwCIaA7J/MDARdjwyqtcEuKUCPNKH4/GZ16bU
         gPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764096; x=1756368896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXmeaJhI9e99CmL9wkkDfiednrjI4qTS7gtaFJx7Vrs=;
        b=MAcxZDoxYNuufPWIU8u6V3Gy+CAPsE7MNbPKuJXcfC+EG9UOU14l5GVD+2VlVPaDdY
         IGX4Jz2klFbRGzYdl6329kTPSmhY7S7l8qZXXr2/H7VdF/CgX8wC1OG9+62Bs/nR5fiS
         UyHmJm/EFDxP5SLudzvfFVFSOuTWqtgBdjeAeVC/CukxuEgVTyyCbJvZRTuOeiGGubpF
         ivb9cajIy1iDzPEAyRC2uhpPA45cRpxu6VDHjk6A5Rye166l65DZbAkqg6MTkWye1CJ5
         QkOaGQbKZmNig1Rks6TYam24B27Blxl4fSlqALmUvJ6TGGSqrkcstOYdShnqHW9O3KBv
         ynXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDjn7VdrMOkami//IG1TLytLQZeLZDN1s5q80qps4fG5WNcjLZrWM5a8IKe9n0scI1Zj0oa7wuOYrxoLRlSef6@lists.infradead.org
X-Gm-Message-State: AOJu0YznbAV19lbjp4jdQ7Am3ZluMyaU9PsGfn52L0RXADqE+vb/mlX7
	GytRA50c7YHLsKyMv7T1STVWqLC6wh9pIbEPBm0L3RAnOCt/kOkEyvsJcQvxSFImVoM8yTQ2p/4
	1+CB5/UNo6D824xjLroM29g==
X-Google-Smtp-Source: AGHT+IHVkLSbuPXaBGbeYxLB8Apzj2J/LjIQ1ACzqcVV+IhVmKpANZi8n0fKVREaY1XDOmHvrY0P+LX9S3g8rjan
X-Received: from wmcn3-n2.prod.google.com ([2002:a05:600c:c0c3:20b0:45b:4777:8063])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a46:b0:45b:47e1:ef79 with SMTP id 5b1f17b1804b1-45b4d869ceemr12017085e9.36.1755764096134;
 Thu, 21 Aug 2025 01:14:56 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:14:12 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-25-vdonnefort@google.com>
Subject: [PATCH v6 24/24] tracing: selftests: Add pKVM trace remote tests
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
X-CRM114-CacheID: sfid-20250821_011458_042715_4FE59AD4 
X-CRM114-Status: UNSURE (   8.18  )
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
2.51.0.rc2.233.g662b1ed5c5-goog


