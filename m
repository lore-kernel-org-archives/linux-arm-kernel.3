Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95536CF65DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YywhJHdQmzvLYqPf/VNWfmyvJv23Am2v8tnakAtmlS0=; b=lTLeZHdxBekZzvHzBXaqpbgNLU
	LNTO1FWWLG9z+zMdi5cJ/L59wYx5p+iFSHWCmYY4GK+H+rZ+XJAzWLoQXV7IRFKYhdqTsyBmR5zmh
	jOcZpGbn+7tcemN/9rrb0iS0wOHselHRs9xCQuWrnJP2Sf+V0Fik7CjAcT+6/6kP1VEHO+bxgoTQB
	qyJ+EiQMMEhBXnOtNR+MzzcA80kOnBPvU5Ml3T/QUq1+caAu86UylBpFBt5pyXkykUD7IB2d14zi0
	9foFy/Te1XszHUJ8gNmnbi+Uelqx5J1Ka2uWzsvy2afubRzoJlnsBHcZSyPXkhTTUxVFIevFAQDuA
	Qi+DQnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5s-0000000CK46-2Peh;
	Mon, 26 Jan 2026 10:45:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5M-0000000CJUj-28DN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:45 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47ee056e5cfso35413765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424282; x=1770029082; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YywhJHdQmzvLYqPf/VNWfmyvJv23Am2v8tnakAtmlS0=;
        b=ubmT5CrJcS1Qusz0IARX7ye4nM1C+CgzONwGKgqwtacEOJgVOr0M+f6LEp16NnWPEn
         JQcRFqc8737SLcsDg1WAaIeTjSST5a/yVT05sHciGyC1Yww930nEORdIOKo3tlatMkB+
         tGgyoJFrC9DQxGb+kBVnE05VmYvp6J13Phx9i+93F41AE58HVu80jgUjazhcgZ66WnP/
         Sco+ROdmYTXAvDaI2PKJaTR0h6Gt6nKHzF89g66ls7g7BzXx58plVeRkie/f6pmiLehF
         SbId7gx8XWFa64LExmb3hI+IlfrtRMCV2sTDdtIWgkKQjR+MCGD1uszdsYoSHXavXFYl
         eXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424282; x=1770029082;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YywhJHdQmzvLYqPf/VNWfmyvJv23Am2v8tnakAtmlS0=;
        b=vj5bOIR0sne/iFV24Ar7VL/b1GAkMmhlNBKGKUvTdbd8aA9dZRphuLHQdMh1R1IA7H
         BjWTd/cR9ALxG9sbx9+jvQgzSKfY84q09Elo9F4qED33bCnkJ37Xo3fgCIIhJk/5VVIr
         NInCFArXJze626S3vvSIXapLZxvyuoupJ4LGNskB8ELX7XhYxcDHQzffoJ8d3CokleJi
         vLMNin9lHvM7tnty77AaaIe0wdfgV3r7IcFjAq0vbPXVWMYgTzrHT99OFxnKcwqUz6ko
         7EwJmQGvc/X/gaCXS01zUaHoTSK+6wGZJX3JrlU66kE/zKw2Q9xa4Rm+mt8sI2YQvHfN
         HC0g==
X-Forwarded-Encrypted: i=1; AJvYcCWc4kJMAKgF5sadfT81b5IjJoN81XqNPB46dkpfn5bs8snbzkyTb1UvoBKUpcXZBQEL054fF+0ePDcjfB+Ets99@lists.infradead.org
X-Gm-Message-State: AOJu0YzB7I1eBzVrLIjfiwXg1LZ3MXfACDe3izr2Sm420Yie6dg0daSJ
	g0TBB1UyEKW9NIkb/o2QSiI1LtXuXkxFEenp7R8qF7STKbxuP1s9UzCkxDJ9hyXgjl3TWOKx+OF
	HljY2yeplIraor9CKkkjonw==
X-Received: from wmkg7.prod.google.com ([2002:a7b:c4c7:0:b0:477:5a4b:d57f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5395:b0:47e:e20e:bb9c with SMTP id 5b1f17b1804b1-4805cd40991mr56788285e9.8.1769424282193;
 Mon, 26 Jan 2026 02:44:42 -0800 (PST)
Date: Mon, 26 Jan 2026 10:44:07 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-19-vdonnefort@google.com>
Subject: [PATCH v10 18/30] tracing: Check for undefined symbols in simple_ring_buffer
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
X-CRM114-CacheID: sfid-20260126_024444_653774_2CF8830E 
X-CRM114-Status: UNSURE (   7.95  )
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
2.52.0.457.g6b5491de43-goog


