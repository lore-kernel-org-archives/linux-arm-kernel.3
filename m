Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFD7C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CZG/M9udoL/6ITBTvAzkp9kaJCKtk/wbKte22WkTiI=; b=bs0WgrIWNGh3F+cHL5LtIFoRLc
	gSfGvHOlrqLO2tn8H7oK7lnzH+32V4Jt0lN8RFOn9lcSIgliFxdrxF79L8TRW2JuNfTZWST0CVK+N
	osCNf2d/4H5o5dD6Hn3QubX9ZPF99CdZHCLZkzR3NtYPcTmEIiRbxhr5fIaSREybxLkWy2j3344pl
	5hW+I8J6mUdAX2kzoM3Xr6kL2RDNfc1KflDkrDgcbs8G3/5Men9zpqfOIlWzr9JDJ4EUfvc5Ms3ZX
	6jLqhHGk7EjFwep61BxHlbwGIOtg0lQCT8RTnwQyTdnWyZYiUd90egZ0eq0v6X80w2LEz6+rS1Xsf
	tTmvTOYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvmt-00000003cxw-3sVF;
	Fri, 16 May 2025 14:11:47 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvJ7-00000003Xtw-4Ab3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:41:03 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43cec217977so12545375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402860; x=1748007660; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CZG/M9udoL/6ITBTvAzkp9kaJCKtk/wbKte22WkTiI=;
        b=tWPJO5upCcc+9333zahG1E5VpTn7kA5ZCmZ9GEe18WI6KA7YUZdmVQiYLUY80VRIsj
         KtUwCAifT5pG0uWmzDE3dmg8HqPhrY+IzY9Rwq0q6qZfCnsz0S1bCwgz3kGs5/C1Y8hV
         3Ww+w2HeQfc5TRl/hH4XRJsz137gXjL3FnTw9CXwSaLekM//B1pNOF/jP4W5z6ajjob2
         mji8xhaK3JoiM/P/fsC2RttZAm6a4Iq9akksbpqubEUWZ4JNrNyPf/5+ngyQF2BzhHlt
         bODYFS6j/uE3zllMzJm85uRVMdcmGfsAMVGxHrlJ1CYYnqiToGKbloIYIr/w0daafwGJ
         YENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402860; x=1748007660;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/CZG/M9udoL/6ITBTvAzkp9kaJCKtk/wbKte22WkTiI=;
        b=mzeOp5T3xX9KG8tvyCyMv5BjaG3ucY8uEsKoxjU8HCrEaHGmJ1K6iO/v1rJCJuo5Nf
         HlSH9Kddt63SptLvME7yMiFV+R+Q8KLU8U4COdkCQLMzEk7xyL8kMRpjCCOXw5AhhfCQ
         GJFLhNfuC2B2ekEHB5zE+QmgB/+JU/WpcYqtswiBpx4PQ6/WniRgdrs5QkNhm0ZgTrKN
         Ao/NwK84BuMoFiCNQHMnMorfb9/Oq63xnKGFnIyjZc/6mKgsVR1nSUsJ14KRqTGhyN9D
         +/MRiB3SzBJCj3kRFzodD1DOUEgpM1W6fI5seVKH/mMsOjpULas0nA5la4Zl9LL8oC1v
         pc3w==
X-Forwarded-Encrypted: i=1; AJvYcCW64XE5M15SmZrCCFV0HdGGhrLITS8UkSL0dPjF1FqnzhvZkqBXlYgM4a2IGJIIA3Bqh+eozSqzQFd/7Xgx9DNT@lists.infradead.org
X-Gm-Message-State: AOJu0YxD3QJjPlztCVMs2NWxmMugmurjWgE6CX1DmtkIynl5+L1XfSlq
	24+vy3nVM1eEFKthlbjqD/qgPST9uxJzFCNsgj26at/drQESF2sj2ly8AZkHyCBaeadj66KKP+o
	53qU3rmd/pwDkSfg6eafe/g==
X-Google-Smtp-Source: AGHT+IFmCUr9TTt3q0ScKQbNlGA2kldElMEmGgUhWM5ki5iG13VQEOpV9idvmUymy+nrLiyBs1jUYWF7uKdlvNF9
X-Received: from wmbes7.prod.google.com ([2002:a05:600c:8107:b0:43d:9035:df36])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6296:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-442fefee254mr27261565e9.12.1747402860332;
 Fri, 16 May 2025 06:41:00 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:20 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-15-vdonnefort@google.com>
Subject: [PATCH v5 14/25] tracing: Check for undefined symbols in simple_ring_buffer
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
X-CRM114-CacheID: sfid-20250516_064102_033570_1D5B170B 
X-CRM114-Status: UNSURE (   7.51  )
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

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 8f5e194eba71..eb7b70fd5ccd 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -114,4 +114,20 @@ obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
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
2.49.0.1101.gccaa498523-goog


