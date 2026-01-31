Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8219ED7976C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvedzD7+kJrfpkXnSgvR+lwDnj1DXH1BG+s75ebhGeM=; b=ANBxiR4QXcQbLz3cBPLCg52OuR
	UEES1c5ZoXBDOOSDursdennd+sFRNPFUbRQVwlp16gM+NpYzX6VIC2Hx9o5liE95q7NDSjC6T8nhJ
	ZieKQow3MmwhO3UvuXiYnR78fJxqec3lkEXXmLlKPp/1Ho5hgSpQpOTXo8HYyvKKrObVG7lkO7c/j
	rYZn6/vCkL2D9wjK+q1tVMigk7Etrc6Oi81jGjJUN4/ZS/xrk9SxZzhsO9VU2KKwEJpSnsKsprqN2
	lru/SPDJAkqwkIycRpE3TroKxRpKIHNoAATB7Z6KOpyB7XhGxyTEQVtWdk8ohYAh/hQdM2CYkkI/g
	AWqYvy6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB3a-00000002caU-0mgU;
	Sat, 31 Jan 2026 13:30:40 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2i-00000002bxD-0cz5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:41 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47ee1fe7b24so26137715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866178; x=1770470978; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TvedzD7+kJrfpkXnSgvR+lwDnj1DXH1BG+s75ebhGeM=;
        b=18XgXDUg3eP8JP/vx5QS58GxmbCD/ih0TkfmdOPw1SCdgthfyqsAThro0PmnknGu+1
         OPqpyeIQpfvLI6l6uiY7BCeblhPRn+DUp4UDYL3aMDMkATMcbaq7C5STcrp4Dh+VPA15
         3vzRelr8yS67qSC/18SAIxOf4zDqqS3bBB7tyK/K6opo4RA6ThcRRH9YLpYFlSf6RKlT
         6dKlWi6iZVXPInA4s+B4yLM/6+G+vSyf1XOTS3rqcPHepO7QcR04MrPmt1zHHNi0rbbf
         xfxppg0eqYbAH/d69QCuur6KVhsQV03bhjghfdBa4lt4xyUUak9mtX2MLyQwHMmAF3pk
         5XlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866178; x=1770470978;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvedzD7+kJrfpkXnSgvR+lwDnj1DXH1BG+s75ebhGeM=;
        b=hN82TAH+v2pWw+03G7pCJOaVh1zw++IngPQ9NfDT1pvTcZvw37xzCTyr7PT3PR/UkH
         z8YMvCbqjVFSE9n6RArIEN3yodjdxrCKHvAQ8FIGbCh/SNCMEogBlCzVIQtUC5s/J9Zm
         TBhZKY5NQCaq6n7kqk7J2G2jHazmW9HluhiJbJe8PvYw0wY9sXqhoXjOepJVVTB0hBER
         NGVMnyyWQrGl00keSlsCun8b4lA/YQ1dXR0ug/PWr091+kUAzRzADsm71JmQSi6Y1dQg
         8YCaw9/k5CSCwqYhT1aTnUFDxnE7jMZP5J3ZIEW55Tscdhjp87R5RdK581znk7WaB4bK
         QDsg==
X-Forwarded-Encrypted: i=1; AJvYcCU1KvZjprDdVYKRjW50Ptn4VAecf0zd0In68GZ7wjCam2wTj8V0DZ2L7H7rPrDp6Ta3/Q4Pf50IRoysDZVuIQlC@lists.infradead.org
X-Gm-Message-State: AOJu0YyX1U+nDXLUgyBZkulX7DN6BOhqccW/w5U/TNlhBSAu1E6feWwA
	KwNh1pvfzBjJnYSEYCmbDU5mS2OS40sqNipf3Yy++rIr0XUzxhxECjYfaKcilQtfkUHz4I7uiwE
	3mRbKeavon0QTN41CPlbVAQ==
X-Received: from wmpc35.prod.google.com ([2002:a05:600c:4a23:b0:47e:dc0c:276f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8289:b0:480:32da:f338 with SMTP id 5b1f17b1804b1-482db45cb90mr66590785e9.14.1769866178166;
 Sat, 31 Jan 2026 05:29:38 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:36 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-19-vdonnefort@google.com>
Subject: [PATCH v11 18/30] tracing: Check for undefined symbols in simple_ring_buffer
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_052940_204501_D370EF56 
X-CRM114-Status: UNSURE (   7.37  )
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

The simple_ring_buffer implementation must remain simple enough to be
used by the pKVM hypervisor. Prevent the object build if unresolved
symbols are found.

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 9e86c43bf320..9f675d5d27c7 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -131,4 +131,20 @@ obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
 obj-$(CONFIG_SIMPLE_RING_BUFFER) += simple_ring_buffer.o
 obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test.o
 
+#
+# simple_ring_buffer is used by the pKVM hypervisor which does not have access
+# to all kernel symbols. Fail the build if forbidden symbols are found.
+#
+UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov __aeabi_unwind
+UNDEFINED_ALLOWLIST += __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
+UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
+
+quiet_cmd_check_undefined = NM      $<
+      cmd_check_undefined = test -z "`$(NM) -u $< | grep -v $(UNDEFINED_ALLOWLIST)`"
+
+$(obj)/%.o.checked: $(obj)/%.o FORCE
+	$(call if_changed,check_undefined)
+
+always-$(CONFIG_SIMPLE_RING_BUFFER) += simple_ring_buffer.o.checked
+
 libftrace-y := ftrace.o
-- 
2.53.0.rc1.225.gd81095ad13-goog


