Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA89CCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIuzqBUK9QgwPsg6n9bFE9jwVKo5Xpv1ngyFRL9o1JY=; b=Pyuz78T2PQLvSJUGujm/P5zO1M
	17EP3suQpZQRi5OH7vXC7Cy1PLDMrn7Smgh5MMQSktWO5xgVpcAW/vsPj/D5niUMIr0kjLjyX3jol
	ZTqHFdeWcS6+6S6G3DwndidIVYUNiGrRnDPqZ8E/9yCBWJyUYfaj/R5Zg359Aa2YSnQfvUOtFl8mX
	KpU9qqdnBnIioN/z3RUTu5Cnd5JtXwqlurLcI3tLNTgymdn30K3xGawMDnTGMShQhm5yRZuUOO8ur
	oQYw+8402zyhIrryuHQ92VM9RnbHRlYPlMxA+6z86mcf9p26RzxxAkjtfd5DgSMDUAxU0a6E/6c4s
	KrDmqxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMp8-0000000592X-3vLX;
	Tue, 02 Dec 2025 09:37:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoj-000000058V5-3taO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 02 Dec 2025 09:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VIuzqBUK9QgwPsg6n9bFE9jwVKo5Xpv1ngyFRL9o1JY=; b=Ll5uvujoosroFStRSLTr/ZOWMA
	68yTDpcI3DIAriHi8bwfK5bSMF+9+TQt9br6oXnuZyL08lZfIsM9eHfi+7htRKwrNJ64sxOZI0xWP
	4Yvo/b+xGzV1oIEAFDsAHeyE7i9tgDRlQ//666rZZb3v1GPm7jwI87nFyrDp3US4M0JvXj0tzdRm6
	zBwlPccJFFyILI0FhKHfAlIloPj1aqo42Mx4WBGgVphJaV7oW67W677p9g14IdMz7cMhp5HSKu8KJ
	qs/4+0eX6iV9KQsNCrgW64emonxP54kWuVbYA/cmWYuLax2nzGEglqdqLSSPVgdBsKfsMI3Igzr35
	2Y174OjA==;
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLx8-0000000HaMf-0JK7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:41:44 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-6450f3e7e71so4410402a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668220; x=1765273020; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIuzqBUK9QgwPsg6n9bFE9jwVKo5Xpv1ngyFRL9o1JY=;
        b=g5vPYYr0SxGEOTA/qormQDwHPDQHL0nkYhpiau8PF4O4miM+Luc0sSysRm8vyuObtL
         wXp9ywWKtMzHWnWsz8nIKhiNpTxT/X077chS5mQepHO/clF3ftni2k4puczyXDOjIm10
         B6n5eV9iwuFf1Lxiy9UzAwg5vnbDCMRxayv9bTDOXNagZJ8U3NovFlqwfmuxtYTiJuyZ
         +mjEbXTPLmWu7OSPEY//NLDORyOzd+70zEAxs6lLpY1Pxf8+WIRoh8aIjW1FOpL1S+A1
         P6PVagCYqZ0sZ0V3udUNk4gI5wiXBtOLbOu8NU6GJSYM2BtkQ2zYjbr5o+GGLv61GWs9
         ELyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668220; x=1765273020;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VIuzqBUK9QgwPsg6n9bFE9jwVKo5Xpv1ngyFRL9o1JY=;
        b=e0bAbCJmuEX8BbHcLjHKYkwekhowa0sRwgAaCJxragUucULaGlxBZTQGz0W8LzpgGt
         ypL3MMapE6njh+T9qOI0VLuoPXS2NLcFmk7XQwT1ixHYGFs3xnzlkW9QsOEI8z9Az1RN
         viUzv0aoeCjl76pgpthszmtw73+A7z7FpX4qLw4EyX1BWI7livjEUG3pi2rFNs7atr8u
         ty8DaIuP4VECJi8/uIOdhdO6e4x1LK91CVDJHiq05N9y0tvu/hBUhqRjVcb5MnK4rehH
         pswQowXsvJwaN88nYU4aOH984l2Ky6ZgBtJNoYdN5MzMD9aUhTzFAdpE1W6Gs+IBMEz6
         pFHg==
X-Forwarded-Encrypted: i=1; AJvYcCVc+KEkR93WFbzrMzMMQ8L0iKw3acb8FwSypzaJNnI25sLaS6VUrXgkxAzqoCpgojzBS34/NJbHI39EOiVa/3/G@lists.infradead.org
X-Gm-Message-State: AOJu0Ywos3OXBz5QUoxOIh39046jg+ZsBdtoUCwsnz51vED6phoBSpAe
	VqSXvXiyUYJbjho0r/Ra7XLhSvoUA7MMmTkLMYEG4kb8jUC2krKxNFJx73Y3yXz7LCYaGE9iyVT
	wCc4dAFS5hpTFzR+CDkBdQw==
X-Google-Smtp-Source: AGHT+IEM7X8A+Hr+6Paat0E8X6JUwIYRBH+lXGFDjpwXPF4BN9qe9YEMSyyUdVnl+6EQi5h0wYtY5MMHF1nWX41O
X-Received: from ejcss8.prod.google.com ([2002:a17:907:c008:b0:b6d:76e0:3c6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e8d:b0:b6d:7f84:633 with SMTP id a640c23a62f3a-b76c53c0c18mr3398928066b.20.1764668219620;
 Tue, 02 Dec 2025 01:36:59 -0800 (PST)
Date: Tue,  2 Dec 2025 09:36:22 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-30-vdonnefort@google.com>
Subject: [PATCH v9 29/30] KVM: arm64: Add selftest event support to nVHE/pKVM hyp
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
X-CRM114-CacheID: sfid-20251202_084142_353495_ADA45A17 
X-CRM114-Status: GOOD (  10.68  )
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
index 37c015b54ff6..e2de7ad64938 100644
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
index 268b3cd7a1b2..c276fd28e0bf 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -42,4 +42,15 @@ HYP_EVENT(hyp_exit,
 	),
 	HE_PRINTK("reason=%s", __hyp_enter_exit_reason_str(__entry->reason))
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
index ffda4850022f..13a6c5c4fabd 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -641,6 +641,15 @@ static void handle___tracing_enable_event(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __tracing_enable_event(id, enable);
 }
 
+static void handle___tracing_write_event(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u64, id, host_ctxt, 1);
+
+	trace_selftest(id);
+
+	cpu_reg(host_ctxt, 1) = 0;
+}
+
 typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
@@ -689,6 +698,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__tracing_update_clock),
 	HANDLE_FUNC(__tracing_reset),
 	HANDLE_FUNC(__tracing_enable_event),
+	HANDLE_FUNC(__tracing_write_event),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 1ad6a55ba95c..7b537222f364 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -348,8 +348,32 @@ static int hyp_trace_clock_show(struct seq_file *m, void *v)
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
+	ret = kvm_call_hyp_nvhe(__tracing_write_event, val);
+	if (ret)
+		return ret;
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
2.52.0.107.ga0afd4fd5b-goog


