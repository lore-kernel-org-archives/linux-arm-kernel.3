Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B4DFCB601
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBnYryU8DAHWNMJIKaPrPbk+603MWk0xgkkJlIYXdOA=; b=rL+sg/W3u56rGgkRl/Vg/qgrGl
	U7JXVDZcKNlKJdrjIyAGI1mc/AxggRkiv5fKgMe4lAgf2fJzdmC4GkYFLCoWpNWvjejm27Sz4SBvF
	rf5cl9p7gpnYcVYnVD1Bx0aHvmaS/ZtgA+cPzT26b2jncfLImutDy2ngvc4KL0moQc8czjbb6Maq+
	c6o8CxVQb1Sl6xQBfKwLk9n4GfanWQTkpEEDZLUbPE6B9eVeYWZji0gjiSsPmo3qOVhVU061KxTM3
	5ECWiZvxB5FhcZ9gzrLpvzND4RRgJo7WDQsHt6l5oUdInT40ZxEaq57llGFHkPGuaUMSSXIupvMWY
	jKCW/1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWIe-00000003wIM-07rZ;
	Fri, 06 Mar 2026 14:37:08 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHw-00000003vNg-0qIT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:28 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4836cf00787so96818685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807782; x=1773412582; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VBnYryU8DAHWNMJIKaPrPbk+603MWk0xgkkJlIYXdOA=;
        b=g1ezDQoXj8xyKycR0smCq1h/+N6XzpF25B5RjNfexpGuvVGVl0+IU75x4I55SjuSNa
         6mZKnNt0RkeaNxrDy6X3npFN57ZRiMbgrYmfL/Q03W91QsIskIE2xgF3IDRyIcV0hr5Q
         xzzbFA+TQLw7s/7MAQZhAEYO2qBEaeXYpfX5QnW418i9nitmWFCx51IIjAs3K6h5PXOq
         761H5/0kxWzsVYLFV57ENOpqvdcoz5ltfyFXCWgskY+XtpQELkQrnyiBChSRGTSqXtUe
         B2s1/hUYFlCkA5kfTr9gTbPURvBEATSzV1IfbB2opzN6In0cga30949MyZbOFmMlxu0D
         aIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807782; x=1773412582;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBnYryU8DAHWNMJIKaPrPbk+603MWk0xgkkJlIYXdOA=;
        b=c3AgklpHQFje7ebHHxNlwFxn634wlNLGFK8YOwVLp+YWkAalIbFleTi9mNFWB5ovbJ
         G9ef/V3NR/G8TIwgmbvYPGzi4o1/KrhHv8htH8wtwCVE7GMJyzHXU6tuhY5jltUQkwtx
         lZq5QcS3XrQlU0WMEe56zCUGNb7GZlZcKjYDAEiQ5V2j+beGOyLp62ZmWjFnfpYsYwl/
         eD1VobgmNGx4OQSV1sR9St6FRT8ZWnp+PibFUDqP3ZerAmeFFzuUqx5Wi5rq89HqbaTH
         wviGt7Hdzx4mnI8aUo2DI+96Q/rJVCQdu8rYu1RGe4bVtXpcia5EDZFQemdXti2DwDUj
         G+MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmlREigJk7Dal72slmLmJoVQVg2qiKXh9FWCNXsgrJ2w1duFLQEYK0rh8UR0N7Kg8q9HSYJmHCmMLrttFiLEk+@lists.infradead.org
X-Gm-Message-State: AOJu0YyDMYunnGEEXKOttDgIlFKKlvcTiKJC+qPp0T/HRNp+rnofCLcn
	gFUn9/TNCltSpcjy7yG0FNNEZftcHyXpUVKcHHs7Pvp0I6nXA3crjP7Bnx7dRNdRs0NPgf4aCCr
	tINNtmPYZpOJGwdgA+KUo7g==
X-Received: from wmna22.prod.google.com ([2002:a05:600c:696:b0:480:2051:60e1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc4:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-4852671c9a6mr36238685e9.5.1772807782036;
 Fri, 06 Mar 2026 06:36:22 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:33 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-30-vdonnefort@google.com>
Subject: [PATCH v13 29/32] KVM: arm64: Add selftest event support to nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20260306_063624_355350_FB417536 
X-CRM114-Status: UNSURE (   9.99  )
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

Add a selftest event that can be triggered from a `write_event` tracefs
file. This intends to be used by trace remote selftests.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 47d250436f8c..c8eb992d3ac8 100644
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
index 547d63679022..eff9cb208627 100644
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
2.53.0.473.g4a7958ca14-goog


