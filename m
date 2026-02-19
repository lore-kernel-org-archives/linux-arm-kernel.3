Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF633E9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wD6LPWf1rq+248KhxWwP0GcpeSFjPhgsN1twvSzFVPg=; b=3znli3QFKPXZguX5r00I56rN3g
	3baReIuptnbfcGDljQIZkpBYLjl6/mLnvJxCwwf1d0Fyphn85U5IvTGPNFpplspkQsaF9gqACHMjH
	O0Y9TCNCp17SoB0nAvTgIUesF6bIgRJWiH7z9kL30Pu8D2pegIDraf+ILTyUJKmF6L9ycPpbelodr
	+UYjK6n0lwSKZ55kyXvxdPTBikJfkSNRevb81fj4KF9R0a3NF5Ss4tdb6wD4rda2JKUT17KPVQIZ/
	x3pI1U6xzccLsm+h6MLClZGiRN58bxSwBeoh8F/3IOzqrf6Qg/m6SGNJFHTyE4L2O+KNLWeyFFMqn
	QdOIg7xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5ZV-0000000BVP0-3nAe;
	Thu, 19 Feb 2026 15:04:05 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Z9-0000000BUtb-1Hpv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:45 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4836cd6dfe6so9387565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513420; x=1772118220; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wD6LPWf1rq+248KhxWwP0GcpeSFjPhgsN1twvSzFVPg=;
        b=ZoulWWeXJFmQC2FcD1/ihrFjinXkpZvWPtp9qf9OdZiurB9v92E4JVp1fW6P7n0P4i
         3BNcOU12NGZDfurbwUy3mcU247ndqILBQcp5x1byGsincn4LmsgQOrWrIjXXaOlnvhPy
         QxhLkJCHMhvOko0ZVkBD0WpwbrN26Q9lAiop6wV5qpNj/muuTVc38jY/bOoKsbO11JB+
         qIUEpqekWZn7mVtzgNgDjb6U1Q7SIc0jws6DwcfIwOLWKWSVsmPdHv2zTXUZ8oT9hgar
         ushMBerhmYsPZGLIkf70wJl1bB+qd7djyI4KB2qfXjVPhNGawBhvVLgyRfNjqW5I7y/S
         wXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513420; x=1772118220;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wD6LPWf1rq+248KhxWwP0GcpeSFjPhgsN1twvSzFVPg=;
        b=lV+QypPvyE0vHKKOll2NwWHN6TWCrQkGwvIu1rOYswVnPFr3z7apwCA6YuyEMKCi90
         KmuOmb6FXR6bHenER8NUWHkk7IOjwzeLEDxVHf29GJC1shIX0PoMx6Br4MLUndnx7ylV
         pD1dfk6+2s4kAoXzrW0OQDz63GEKW9rQzoSjIGSUZ/l/FCKL1FDQ10BIWfJnGOYvcQf2
         0E6qKBWXgem0lvqPGmd1clB1l9FWs+SNAnKRy4+LwxLymZLwvxh3r9aZVW3vZxEI6VkL
         JG/nySDLINBHLR6PGf8Bz+paTXoK6emaCHPPA909jVlfK3ZWvSzrcvOzDuIzI7tqyx04
         zWxw==
X-Forwarded-Encrypted: i=1; AJvYcCWbcuDhkvGp2xlvG9bAU07SbOorRBSoMrC1lLxMv1XhNN8WJ0RITbjgKfuui3BlXqR0yQwdY9UjO7GF5Au3psQ9@lists.infradead.org
X-Gm-Message-State: AOJu0YxsVp3BPMX+QznxTsYMAqGXV+nC0P7pu+fFksSr0pOD3ZjO1bUF
	FnlYS9Z86JOly8zzjZMUnGbsC24ed1/7mnQeqdcbShSVm2TssDh6KJr4RMcaBSMpmHZBSvVPpMn
	2uyh3JuUtzn9nc6Ag5dGzkw==
X-Received: from wmxb5-n2.prod.google.com ([2002:a05:600d:8445:20b0:483:43dc:999f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4443:b0:47e:e952:86c9 with SMTP id 5b1f17b1804b1-48379b318bamr268163575e9.0.1771513419651;
 Thu, 19 Feb 2026 07:03:39 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:55 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-19-vdonnefort@google.com>
Subject: [PATCH v12 18/30] tracing: Check for undefined symbols in simple_ring_buffer
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
X-CRM114-CacheID: sfid-20260219_070343_458348_53946A63 
X-CRM114-Status: UNSURE (   8.19  )
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
2.53.0.335.g19a08e0c02-goog


