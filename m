Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE919F417F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBnYryU8DAHWNMJIKaPrPbk+603MWk0xgkkJlIYXdOA=; b=iMMidxMVLv5JQ0hYAvRi/WOG/r
	/dAsbLb61cVKRqO1iIFAGJJvMQgQJnkStMjUeNenw7GHyfMtbHGRJJvhQRNAdIJxvD0ENqYfgWltH
	bcrTzAikjrwHKTfGWYPXl0a/KmlhHsruIrTY4tldw2jpFl1LvosNz162a2+MDztzZLFtThFbi6ZB+
	Q1IiMmmyvnGW6o0fzNluXzb4aqg7qY1bULXWtuvyH7BDHAx2UmoIC+rfArbu3bc4zxb7vANYwWsaF
	82htJUoFnkeAFOOUZEDuItz5haC8IfjkxZjOfzgg6KFMPeclNswIsXnFXvYISkRcNh8ytIH9g5aE+
	Ve268m4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdRv-00000007iQ1-1eNq;
	Mon, 09 Mar 2026 16:27:19 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdRB-00000007hOD-3tKv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:35 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-661420734b7so5796443a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073591; x=1773678391; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VBnYryU8DAHWNMJIKaPrPbk+603MWk0xgkkJlIYXdOA=;
        b=gIPS446GFbxEHBt/k5dwZUnqRXWujuhPRtWmIesHehc3vlOi/pthOm2qA5PR+AVFzB
         8Io+Ay+yU+MoUFTAextbYUZmlOG5dVjjOkE4qGIMxZ8PJD2Kd7VDd057UJH/Xi3WcGgC
         hy+xMZHXHomZRzzTv6LqbLWeV836MRM1JrNTaAgZRk1PYuifYS+sXR4eR2sXReWnUszK
         JB13h3ofwAhBAhrG6PJ+uIr3iGEottSvrWOtFLQpx1UNos/GtbgtjItamLCVXFwrfXVr
         Jhn+iruzAylpLt1OuPELJzexQjP+tf6UaXTjd0hmpx6eMPmU2w/7fTJcjUINzP7/Rs9+
         /chA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073591; x=1773678391;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBnYryU8DAHWNMJIKaPrPbk+603MWk0xgkkJlIYXdOA=;
        b=Tn2M6JCzFs0iIcQaAgT7UrwvZ7uG97hxWpqwz0m00MoT2b2IhF0+ckqqS0x3m3teb/
         0E3+i02TsFS1ZBoGKlAHL4GvOmwZh7fLUU4COQ6mXPPzm8jxK1JpzJcWlSTQzhxIr5YY
         +4fmRMKWkrZGAG6TXusb6JnL2CTHUC02chr7qb1dW1ykIhb9d1rf/hW19RfpNH5uJ6Oc
         1dJNlTfZW4o7Aaw8RK3E49/jCVluFcAB4W8ao6MBt2irl6GAjEX83a+dgK5AnPpY2VkE
         KDxpyfG1eO2ZgnPaGTHF+E3QR9KhCfgCxXP3IRjKcsZUxbxmgDQrvGNfVjokZPsVB7pY
         9Y7g==
X-Forwarded-Encrypted: i=1; AJvYcCXCcrIZISq0HTDBKf2mc22BK0oV907/al0qZme+A7FC9XBM/xyqyX19rPKCrnNi18tCXAliUkiXDEDcIroP3Mfy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+0+9EnMLzVceyPTIzhyYpJN8aeKCKA+nq+WQXrGtkfRdcWaOO
	Dm3uFgSbh+tw6yAOEGqawvzQz3JwmdqatL4x/1jKFd9D7kbHAOYVxOzLzBdd/Wi3KSsE6+ynvPo
	Qafxg3n1N8Luj7Z2XGlUi9w==
X-Received: from edk15-n1.prod.google.com ([2002:a05:6402:404f:10b0:662:886c:aad8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3494:b0:661:52b5:6b9a with SMTP id 4fb4d7f45d1cf-6619d4ede26mr6783935a12.23.1773073590616;
 Mon, 09 Mar 2026 09:26:30 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:25:15 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-30-vdonnefort@google.com>
Subject: [PATCH v14 29/30] KVM: arm64: Add selftest event support to nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20260309_092634_177077_153502C5 
X-CRM114-Status: GOOD (  10.70  )
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


