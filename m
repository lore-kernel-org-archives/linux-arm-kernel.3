Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF843D7976B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeFGHpGUZmExC+IpkIdtjA9N9gKTbIl9waldaXKaMEk=; b=sFrJjS+iQ+GkzkiC85pFuVX4Gl
	2iEggcbXQrmAi7za5G/kyc9xkP67praoZbSdwY4vDquwVwoQ7C8X/sJVZEtQE+1ILbB1OxEoclqRM
	Z9DQXf/PY6SMp+X2f2cSSSogPg/9PWrxgxNASalSKOyQL9+EM1yVaV2JJ4SuIqfnHwLKJ9PaOAGfM
	JLIy9gWzstDhC2QcUnBccvwuPSpoUayS5ym+KYHWLiCWqtnb5CTZh+AWaOCDxfbK2OMreb3P+3rCL
	iNBXqAASPbTK2jYAmrPiH6+vBnioDS9UG9VJgkytFXoViaH+Ib7NKfeVJW/kqdirRD4921+SfrIsc
	2Sw69dpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB4L-00000002dEj-3KqM;
	Sat, 31 Jan 2026 13:31:21 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2w-00000002c9H-1LgL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:56 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43065ad16a8so2315407f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866189; x=1770470989; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JeFGHpGUZmExC+IpkIdtjA9N9gKTbIl9waldaXKaMEk=;
        b=pRqB1IAWj18KxwiF9Z/2bGY3Yl+1g9Tb2qIY/0t3mgVXZ8JzMVe4+UNkeDXiyj4k2S
         FefFMQTxv4RlqVmGR6p5Qf5SVNpYiqJ0XhGzBhELV/9RXyIu9JwcHsOw3Wx3+R+tzVbk
         0UPz1oHowGYMf/L0+4hMBtmk0xe3pKzXeCNZdWypLiTGJzcY56exo1/b0a68j8JqVmFK
         rcqxtOdbL2eEpMhXxd/sk6AAFA4l9YB9vySMYqyegOLG4E+Y/qhamNYK7PGvR1lg4Yy4
         SrWzTur6jraWkrujzxyjlUUtLjRbKDGrewBZrgTs7lop1Vce23+kpvCxE+RtSIV22fEB
         hcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866189; x=1770470989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JeFGHpGUZmExC+IpkIdtjA9N9gKTbIl9waldaXKaMEk=;
        b=Bl2o465/W7GjTfWmf8CYjffcHDlxlIB/pnPvx84tD7Hh87rpAYZiKL2QqXfNn33f6E
         sm1d0XcLGL5w+QB6iE6aSnDtE+ewUsh4ZnEuqFkG6t55S3XIBbWkLc9rs/rmootGD8gg
         26HZ6oOOe5U22X1ujnP5iraQxh8GSg5W8YbuWFtvz9XqrQOXMBOO5JS7Fji8+rAQN4fX
         s1YCTnX+GNlTe08JMyVCpIosQdQ3RcqleU4MTAnbqwCLjTXeVjDL5n8t4uS15fwMSSAB
         TSwmeAfZWtwezKlzse5AhPN2ILJfe+/M+DzbGVAVDuMkm8/ynj+zwi/OI5GiIFlGY/BQ
         0vsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb52T3DcrGlA3skV9c6/t/IIeShdt9cH9b8+kZdb+aC/R9g7L44jDk2RjKG+9ktrXz4nc0hY05GFCySpcv/6vC@lists.infradead.org
X-Gm-Message-State: AOJu0YzFGYqu0g8869bYgcZw9MXKNcfMK0Fgl0REfMsoKYQ+Yy2BZa6T
	mHkB/S2U0Sa1tzetdEki7PLPoN+4ryvwh1KmFUKiUHyz7/xYfNXSSxtDscIjtF9MOfwxG2Z5aqF
	KO1Jx4wXANItE51awlPa6bg==
X-Received: from wrbfu10.prod.google.com ([2002:a05:6000:25ea:b0:435:c163:9abb])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:420d:b0:435:960c:5286 with SMTP id ffacd0b85a97d-435f3aba816mr8778061f8f.58.1769866189345;
 Sat, 31 Jan 2026 05:29:49 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:47 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-30-vdonnefort@google.com>
Subject: [PATCH v11 29/30] KVM: arm64: Add selftest event support to nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20260131_052954_456280_0ADC556C 
X-CRM114-Status: UNSURE (   9.91  )
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
2.53.0.rc1.225.gd81095ad13-goog


