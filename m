Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E14DE9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jAHB+s4HI+rlHZ3mnIB6UI4woeuqj9h766h+D/K5JA=; b=zhBw1H1rG0b/GWdtUMopepEby0
	atJXUvskjoFjIn+ZPFUsSE5OKdl2K6wlygCGu/2KhCk94RgP7gOQyETzbfDa4d9qvTQnyCzuBxhAc
	KVG+eRXwca840oxI4+1gQSpg21DVBj/IBnIz8DUXZS+SCrQd27lYIqfAhIKIyjYKswA7TZR6piNVp
	Tnlyd3pGfOSBdildRNUhLWVcD8BN33Pad6LUAzGIsuip29zOiq0QuHjStbscBifr/k1FMAJVZRF+G
	SSxoIN2aqdHdmD125YbDPaEqOQ4/dB/3eTRB3Tm5AHdqez2CfFD1iQjMwdyoJoi2/d7XSQ2ZMExvs
	aFoeZnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5aC-0000000BWD6-3HSB;
	Thu, 19 Feb 2026 15:04:48 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5ZR-0000000BVHB-1iPj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:04:11 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4839fc4cef6so5874325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513439; x=1772118239; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6jAHB+s4HI+rlHZ3mnIB6UI4woeuqj9h766h+D/K5JA=;
        b=qhDZBXKfcgS9U6wKmU8Dv5fI/fjdzVt5slELIysMXicbCIieM5bVgyOCQzT2iSgweu
         4tnZxDilEa2bxUwVoKw2J/bJj/SmCZEdWhnoic5tXadOCrndi5eXd22tNni6wvemcXMU
         gqCh9tN7vUKgzh3QXU67tdqw6HEPUvaFF1xCCzksrJmJ156YftiueDEZbHT1cRpgfS3J
         /1jj+bVWQ/PqH59+m4n0E9a4yYZzZ4Rle6xejVXhqw1u+CEZFIqopq0t+OGoep+Lotj1
         71zd1sZg1E/yB729/Hi/oH3BfVBkZcRKCFXr2AEooYl03hfzmRUbfRvx6GbvbDHu+bRf
         wCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513439; x=1772118239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6jAHB+s4HI+rlHZ3mnIB6UI4woeuqj9h766h+D/K5JA=;
        b=HZNUk8T9xRG5Q0G7i+agv0V4FjpFdPZgC4ZunTQwTENp9h/imsp2Vr+bLkrWStM8SM
         u9JITO4IxyS4PL7NpVU+GRz2SH9Wy3c1dyxDjLDdr+RpkAWH6nZ9iacB2uI5lron/Jbg
         /0HC2Sql0rj3decPAgl7xfdzZWMnfcVXY5/0qjONIg62OIpsGim5FZEH2fmRozUo/cSm
         jYNsUAZW7H/+l2GNsjTYk8arJeTPjk5ytb9x13/bF18fpC4/XI4fpe5ND4QaP4vJooX0
         RPyrImE2eSIDzqgOynDQzSwFszxgL8OkLRYT21jrJ0OInkUX9uMPB7zXSLBNeVsFbwg6
         XHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEPur5OEBrEkt+UtMoAxfJIC7YRB2pFvdDuKjxMI+9zUgNBbK/od8e/agos2+J+EANf/tCrCvsNXCZU+LJXXs5@lists.infradead.org
X-Gm-Message-State: AOJu0YxVN2t3z7QAI9rv8tegh9naeFnD+RnJvWj4c+G4nI6hJgKOsOu9
	cRYjmWGOQL2xX/mX20H9xzLKzOyuTdl8NJTwRDtXvmhduHicrSpjCh5sQij2wC9qbJJ4GxqudOo
	YsMhRKpnzRB7gn0YSVpOtgQ==
X-Received: from wmbdr17.prod.google.com ([2002:a05:600c:6091:b0:480:4a03:7b73])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6d55:b0:483:722c:a3d1 with SMTP id 5b1f17b1804b1-483a00b0a8dmr29071135e9.16.1771513438181;
 Thu, 19 Feb 2026 07:03:58 -0800 (PST)
Date: Thu, 19 Feb 2026 15:03:06 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-30-vdonnefort@google.com>
Subject: [PATCH v12 29/30] KVM: arm64: Add selftest event support to nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20260219_070401_509563_C06DF313 
X-CRM114-Status: GOOD (  10.52  )
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
2.53.0.335.g19a08e0c02-goog


