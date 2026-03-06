Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD99FCB603
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISTtnZxQZml/VUbaQMgN/rAKYfhBuJPSGaUgT7FyeoU=; b=CvBbI3lvmRD9do8uklUf4dDWgP
	XloMxBod1FXqausN5pj7wTczyFL3wh39kbUqr150qDYRsmp3t5UYGDymwzaozfAzi7jk6i4q+/wqG
	D8IqAY8K442GnrHxInftqDYsvg2RBPShx+l+SWmvBjV3+cKS4+TX3o49g0p3zJ7/Exm94rlQ/8LfR
	83T77zoo65T0QC8cmxE7yIesL0/sutQLFGJV6wDfGCj9pnWIGEu2Q5kf3CBw5HJCVQALk2LMxN8df
	hS5fBmrzR841uoaDHEb4peFd/pmvsbCQGZnMHBGNJbqiyE5MfMrDaXBSL0MOxkzbIO141ZVgjN1ZL
	oLuH7Kfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWI8-00000003vex-3WUa;
	Fri, 06 Mar 2026 14:36:36 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHk-00000003vAM-2Fq9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:13 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4836abfc742so76471035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807770; x=1773412570; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ISTtnZxQZml/VUbaQMgN/rAKYfhBuJPSGaUgT7FyeoU=;
        b=ztsX/2HRazthfsz3/Gy5lP8EP0CIDPEWRG1J1naa18D1UGVzA7cZv1z3mo8j81g7MZ
         hL6Iqw2ke4LZTrBl0osP6aQiVD+vvlBCEabzBm/GIdOUThXBtSubHQf/01bjagYhOxa0
         JJWQL6FJUz45j+bPIhGh5BPgrcycgZIXtfGYmxK+opLC4o1yPKZedzWKO0TouTfTlCEx
         v/vtcZ1X3EgMICj7R9YXuiIA81LKvy8Um4cmALVBe1qKARbN6t2KegE/bGXDaxMaByn5
         rnLJYIAXmlJe0CZIj7FW1aPbZ+z+2AC7fN6ZMuu9XgRl8+hC8usMXNXRX+E1vXEmv8t5
         zq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807770; x=1773412570;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISTtnZxQZml/VUbaQMgN/rAKYfhBuJPSGaUgT7FyeoU=;
        b=eijSikNP6UYgOaDTsQYa8ZAWhi0DFegjRpk9RUqVnEOzQwyMyWF78ZHBHaz7nOOSOe
         qnMuykVkVjphjVncaEB37GHx2EiB3O8RraClpqrukxubz6Rtu4Slu0uIFnqXN+LTYe2a
         CG9/LLfxMGIu5epfzSQa4PTmb0E36c3oElR5ueKoN1ejRF3eQGgfRX29C0TexYNtz90o
         zn7vtMLmSrG+Bs7zolL5KYMfZ3kRThCGiplRIiFzOza1TFTm35ouZ8dFExBv7EybYrCp
         KfZLF88E+kadDrz5Mxe0n0wQD6pfhPHjbdLTs8bY21z+bWmuuZwn3Rt3MKeDWF77XEGO
         tang==
X-Forwarded-Encrypted: i=1; AJvYcCVvYx7hdzUab0Aowx14jFCi6XQuK9LnJyimIzz2zWuOvN+d8F04QoLcJddNhsRzjYqV0XlqLzlv2DxUfeBISgdF@lists.infradead.org
X-Gm-Message-State: AOJu0YzYQ1yWSQJNRWWtMm8BoXbqp3suqFtReOIM+byHEmzLEIkQ+R2f
	tYA6LbjYlr8RF1psL+Hyq/HpBsBABvftXMmusObrB/WVQqP+MMaFHm58w0RNTcE41ePBjXhkyvj
	ccqiCQwQy+Bs1bRtM//DMEQ==
X-Received: from wmbfl21.prod.google.com ([2002:a05:600c:b95:b0:483:6ff0:11a0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e88:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-485269182b5mr44060185e9.6.1772807770415;
 Fri, 06 Mar 2026 06:36:10 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:22 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-19-vdonnefort@google.com>
Subject: [PATCH v13 18/32] tracing: Check for undefined symbols in simple_ring_buffer
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
X-CRM114-CacheID: sfid-20260306_063612_624295_DF9D15F5 
X-CRM114-Status: UNSURE (   7.45  )
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
index d106beca8d7f..3182e1bc1cf7 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -132,4 +132,20 @@ obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
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
2.53.0.473.g4a7958ca14-goog


