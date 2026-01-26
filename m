Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353BCCF65D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NT+CpEP6PzXqQH6e99olRbkgz8yl4Nh6CScVnzMBNjw=; b=hjlSvolmiy2kUjzcVhcoAjzIto
	jZc7KCQXxKZNZ8oEQI9fJNNLf/Css4QyD//A6m2tyzIOpl708Rsz5QCh80emJFbpZ+LefX28VjilX
	gP+U+r9nWmhdjUSFLsC+l/Xa30XAqgMxPXXwcFoJc4T2GcPPaH46FWd4myX5j3RAA++FjyO672Xvk
	Q3O6HaHYCCvwAVSOWWdG6+xn37+Ioh55IG/fezTRNB7/SuRiRMloBW1IYFhwwzSmg5xJAsZHQt7OA
	5RvYsZLWX466Xj4JTkDbPAhLsIIVHO7HG8uHBPa4vtdHdif7ICOk2omKmN43vpWcVA+vCYyegu+0k
	FcCoAjlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK72-0000000CLMj-2MCH;
	Mon, 26 Jan 2026 10:46:31 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5Y-0000000CJhS-0oDh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:58 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4803a72daaeso33071255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424292; x=1770029092; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NT+CpEP6PzXqQH6e99olRbkgz8yl4Nh6CScVnzMBNjw=;
        b=uVCh1XtYdkNca6Nmd2wxJB04j8/Sdyc+gje5LhhmHoCUX/lgFhughuVDAQw5ObqWd6
         MmptI+xPODKVJShiA/oUIbyH2LKSmtpSKK08DmBtVlN383507rH6k/umKZdkUTia85V+
         kPdbjFTBIRjx1iD5xAturz3GzOmVaH9qgw4tHmf3+SInbJ0E+YCSNqcQUOh/ZjlicFt9
         53mGQwlRB+pbwcunO+XAMDJl0+3qF+3oDaNaMwUbXcxhw2a8t3lrO+J2+za5xd6lEwNP
         OVEpRJ6ODHWX/DS8nFzxnGRyeCX6wEEbQCu/VtFhhiYyWQnfwUzczIw4T6e75CuJoknO
         k1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424292; x=1770029092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NT+CpEP6PzXqQH6e99olRbkgz8yl4Nh6CScVnzMBNjw=;
        b=L82eVQ+YtI1LjK1SEVtPUZjJRqOGSB/aDVNTNIzNfWifMk0d0p+dYVZ2glhCvIe+ek
         pXlxVuvEWIUWMilZAIX5O6QWB3z8vZIkw334zbOdqrOi5zy4Jy8bEOEUj58p0Zz/EihX
         JX+ZaEqcqfQYS8rPQ4X6XM+c0D71UVDa98iETJPNcUAmzZpa1XhhNataSx5BERaqCWCE
         xSmGXwKfm8eU1SrnzcVLbcMpQKSfiFymP9lYHGj7+/LHFiDjt7/J4WZONSdAMuxG9jWf
         nHDlyDzXWvXsk+J5DPQ9SjESpvPRYCZvJvgLoUcR1I7td/9rrudLo5xZ3tCaKTIfXfKo
         jVdA==
X-Forwarded-Encrypted: i=1; AJvYcCV7xAsRWI5aBFzBMMscZ0jaKy4VETHzD2qX4SAaA6mN2SnwYgvuKW6KpHXvrpy3pC/Tes3WRcdFWfqr4HiuO/zO@lists.infradead.org
X-Gm-Message-State: AOJu0YyKShggqnj3J/z/jBmfihn/UxuXtLLVDfnmAlUJ5r9sFPK10SMT
	P2Fxfn0BFDzmARXEwTbQ8h8gl5HKNZIrzVQQUlSGW9kl3BsNyzz23wPlBbDJJ2k8HouNh5iORxX
	vu8L6XVmXBXvqz4FEDrRejQ==
X-Received: from wmcv18.prod.google.com ([2002:a05:600c:4292:b0:47e:e776:2495])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b6a:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-4805cd0e356mr65382385e9.2.1769424292276;
 Mon, 26 Jan 2026 02:44:52 -0800 (PST)
Date: Mon, 26 Jan 2026 10:44:18 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-30-vdonnefort@google.com>
Subject: [PATCH v10 29/30] KVM: arm64: Add selftest event support to nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20260126_024456_324214_C888509C 
X-CRM114-Status: GOOD (  10.59  )
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

Add a selftest event that can be triggered from a `write_event` tracefs
file. This intends to be used by trace remote selftests.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index f8fa556ec3e1..c045c074614b 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -96,6 +96,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___tracing_update_clock,
 	__KVM_HOST_SMCCC_FUNC___tracing_reset,
 	__KVM_HOST_SMCCC_FUNC___tracing_enable_event,
+	__KVM_HOST_SMCCC_FUNC___tracing_write_event,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
index 221a1dacb2f0..743c49bd878f 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -46,4 +46,15 @@ HYP_EVENT(hyp_exit,
 	),
 	HE_PRINTK("reason=%s vcpu=%d", __hyp_enter_exit_reason_str(__entry->reason), __entry->vcpu)
 );
+
+HYP_EVENT(selftest,
+	HE_PROTO(u64 id),
+	HE_STRUCT(
+		he_field(u64, id)
+	),
+	HE_ASSIGN(
+		__entry->id = id;
+	),
+	RE_PRINTK("id=%llu", __entry->id)
+);
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index e1d4a53260ff..5655c1690f4a 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -643,6 +643,13 @@ static void handle___tracing_enable_event(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __tracing_enable_event(id, enable);
 }
 
+static void handle___tracing_write_event(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u64, id, host_ctxt, 1);
+
+	trace_selftest(id);
+}
+
 typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
@@ -691,6 +698,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__tracing_update_clock),
 	HANDLE_FUNC(__tracing_reset),
 	HANDLE_FUNC(__tracing_enable_event),
+	HANDLE_FUNC(__tracing_write_event),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 1ad6a55ba95c..c1e28f6581ab 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -348,8 +348,30 @@ static int hyp_trace_clock_show(struct seq_file *m, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(hyp_trace_clock);
 
+static ssize_t hyp_trace_write_event_write(struct file *f, const char __user *ubuf,
+					   size_t cnt, loff_t *pos)
+{
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul_from_user(ubuf, cnt, 10, &val);
+	if (ret)
+		return ret;
+
+	kvm_call_hyp_nvhe(__tracing_write_event, val);
+
+	return cnt;
+}
+
+static const struct file_operations hyp_trace_write_event_fops = {
+	.write	= hyp_trace_write_event_write,
+};
+
 static int hyp_trace_init_tracefs(struct dentry *d, void *priv)
 {
+	if (!tracefs_create_file("write_event", 0200, d, NULL, &hyp_trace_write_event_fops))
+		return -ENOMEM;
+
 	return tracefs_create_file("trace_clock", 0440, d, NULL, &hyp_trace_clock_fops) ?
 		0 : -ENOMEM;
 }
-- 
2.52.0.457.g6b5491de43-goog


