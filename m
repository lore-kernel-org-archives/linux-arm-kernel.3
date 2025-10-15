Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D625ECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19SuM8BkFU86AdrsVL9he5wmDJI8XYP735e24p7BzJE=; b=bMIK+i3qJeImykUUEiz8m6psjC
	koj8FFuDtguocvAHLUVbhxmtNlin4rdgj+BstyzE8Z3HKuGcMTDYNUPeFLxOd25t1EHlcaVMnRJrK
	5GVxzgGfvGP0k9Z+t/r51wbLqUZQ8aAdJ/IkKeeECwg+phrtSqPYgTr6oCtFcFGIaiexvZRR/p0wr
	OJ4SGv75NbUQlJIyhvs/OEAvwRH2dKvP+2cAH5rl1HZOZl9/+tDjpDj0rsl7mKGRz/YBoFIeVw95X
	dXh1+QkFWDsFk34m6SlDWrTjuf4rMc7qeiHGm0o7bI2g8VJ/B4bozEgjJ7GG4L28wkEpIz8ik9MIb
	x/0BELBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cf-00000002tp9-1OJJ;
	Wed, 15 Oct 2025 21:01:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98ca-00000002tll-3OGe
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 21:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=19SuM8BkFU86AdrsVL9he5wmDJI8XYP735e24p7BzJE=; b=jEATrkOGtVfnWeHUon25p3S41R
	G3umtbkXBHyEu8mW5tA4GfBBVM6lZ0OnmjPo2NqXEQ953pBwgBNbREWLamTRaUmECLUD3J65XNpN5
	HBLDCpunuWgyj990RnYIaLJrrN1Tal5UmaGnIAXUh8GSsCLOVOGz7pUs+G2YegNPiP4VV44LekNi+
	N9yocA4AjOK375O0aQ8d5DZC4zCcDzAmPvPGYRpp1w2EBnF5R+RYS9Fuf9BtkXMQ9/EbMkckNR/eO
	HPSgKaQtYRTgLFQjP4DRQ1fyPi6EOxYdv34dLEkIvO995rjMJhj6RfmVbffaMqK++mdk+NXQcDyKR
	47VWx9Fg==;
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cS-00000006G8p-1tmK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:01:16 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-40fd1b17d2bso17901f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 14:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760562066; x=1761166866; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=19SuM8BkFU86AdrsVL9he5wmDJI8XYP735e24p7BzJE=;
        b=UBfgJhUFfyctTfsQk+3e6yKG0ZAHcVJP2GFV/sP/bWV+tyxZ9n01sV2MeCp1pzta1Y
         koEWX20YHwxgYoevFpk5VZAOCjPe1c8VoHYyPIHwwEj0vGt9aVFSMdkemlu4pVTxDq0W
         VqrNEnDCKs/sqfN1MtGoUZ2ILVPU0JFDuOxqlR78SnfmmCcgKp6Ko+Kba9YHgBttzC2F
         unNExhsyh8vf6rLCKsTh+qN/pyKu4gvnV7arXVAHvX/fT6DLB8YjODsT7j/8wPDsELc4
         Cjq5+NeDdQb72nv+ejL6S9iqJ8SATM8IczVSrYgQ91lBooBy4puzqzvNsdaaEbyqn/CC
         DcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760562066; x=1761166866;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19SuM8BkFU86AdrsVL9he5wmDJI8XYP735e24p7BzJE=;
        b=PLyXkCBjZpN8762gzmXd9X7YGf7NogQeGvYLb0QWXToQUT/AtbOwuy8Xc84YvoYL3v
         JbgbdQEBPbfVu6PThoVYLQGXvFYRugRJcYI8hsx+NUwwKFfUo8E5psjrNUlbTxvnMB11
         thNnq3vFx3UFxT4IppJq6O1i4TxxdY1JdSQ+4clgtuv6fk0t8ZsxcRYvuV6cMaV+aOwv
         XuEurDJ3KcY9j5yw6gHm/6lXswGV0a4dwmWIyZgpQcgjyG9jrN4dwtpi3R4AbTTKp4GE
         HdgQrF/fxEBl8vgmrmBvQ13GfMQsKVURlxhqlOpnMshPYTZvqoU85zGiGjJYiLo+on1h
         1e3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2SAnF5fqo3BIV2NtfXxfStiVx5cypz58G9JwpQC7EcgKMLiOVbZZpQZ4Vp7yylNlb4yJ7edxvUSTPUWD47ksR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk4M7v84tbQaO7Gj2i8190i5Kgh0XtMFnJvXmgbdKM7+wekald
	mTKRxkG2BmTCC+Msfct2cPYw/wNey7+UXYKPoL/yvbTfXGSSvLigUDa5HznTipp1l3FcbKcJ7Q=
	=
X-Google-Smtp-Source: AGHT+IFQpVg2U3+T4NvaCVGg+3jjnpHjurMn96RVhjpcDm7JJIbQd5n2ckQZklYZZG14FZbDn1HXPBda
X-Received: from wmbjn22.prod.google.com ([2002:a05:600c:6b16:b0:46f:aa50:d718])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1a8b:b0:425:8bd1:fbb4
 with SMTP id ffacd0b85a97d-4266e7df95cmr20229304f8f.50.1760562065972; Wed, 15
 Oct 2025 14:01:05 -0700 (PDT)
Date: Wed, 15 Oct 2025 22:56:39 +0200
In-Reply-To: <20251015205634.3820870-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20251015205634.3820870-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3253; i=ardb@kernel.org;
 h=from:subject; bh=FjAcGhb6VYi+vJfe2JpmxvHhAqT8SyzVHt/xzyd0TNw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMDV8ejrsz6he2dwTNnrNr5LD+tP1yqof/ebabW69esX
 2+PX2/SUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACaSYsHw369KU8vDXsfq9TfP
 xX7nJbPk247V5Kkv/vbC8eOWHEUvJUaGa8++1bypTZXk3J6btGcxy4fcT2o31pZyl61w259wpsW RBwA=
X-Mailer: git-send-email 2.51.0.869.ge66316f041-goog
Message-ID: <20251015205634.3820870-13-ardb+git@google.com>
Subject: [PATCH v4 resend 4/7] arm64/fpsimd: Permit kernel mode NEON with IRQs off
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Pierre Gondois <Pierre.Gondois@arm.com>, Sami Mujawar <Sami.Mujawar@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_220114_428841_051A1E44 
X-CRM114-Status: GOOD (  20.12  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Currently, may_use_simd() will return false when called from a context
where IRQs are disabled. One notable case where this happens is when
calling the ResetSystem() EFI runtime service from the reboot/poweroff
code path. For this case alone, there is a substantial amount of FP/SIMD
support code to handle the corner case where a EFI runtime service is
invoked with IRQs disabled.

The only reason kernel mode SIMD is not allowed when IRQs are disabled
is that re-enabling softirqs in this case produces a noisy diagnostic
when lockdep is enabled. The warning is valid, in the sense that
delivering pending softirqs over the back of the call to
local_bh_enable() is problematic when IRQs are disabled.

While the API lacks a facility to simply mask and unmask softirqs
without triggering their delivery, disabling softirqs is not needed to
begin with when IRQs are disabled, given that softirqs are only every
taken asynchronously over the back of a hard IRQ.

So dis/enable softirq processing conditionally, based on whether IRQs
are enabled, and relax the check in may_use_simd().

Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/simd.h |  2 +-
 arch/arm64/kernel/fpsimd.c    | 25 +++++++++++++++-----
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
index 8e86c9e70e48..abd642c92f86 100644
--- a/arch/arm64/include/asm/simd.h
+++ b/arch/arm64/include/asm/simd.h
@@ -29,7 +29,7 @@ static __must_check inline bool may_use_simd(void)
 	 */
 	return !WARN_ON(!system_capabilities_finalized()) &&
 	       system_supports_fpsimd() &&
-	       !in_hardirq() && !irqs_disabled() && !in_nmi();
+	       !in_hardirq() && !in_nmi();
 }
 
 #else /* ! CONFIG_KERNEL_MODE_NEON */
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 3d848c89604e..6d956ed23bd2 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -225,10 +225,21 @@ static void fpsimd_bind_task_to_cpu(void);
  */
 static void get_cpu_fpsimd_context(void)
 {
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_bh_disable();
-	else
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
+		/*
+		 * The softirq subsystem lacks a true unmask/mask API, and
+		 * re-enabling softirq processing using local_bh_enable() will
+		 * not only unmask softirqs, it will also result in immediate
+		 * delivery of any pending softirqs.
+		 * This is undesirable when running with IRQs disabled, but in
+		 * that case, there is no need to mask softirqs in the first
+		 * place, so only bother doing so when IRQs are enabled.
+		 */
+		if (!irqs_disabled())
+			local_bh_disable();
+	} else {
 		preempt_disable();
+	}
 }
 
 /*
@@ -240,10 +251,12 @@ static void get_cpu_fpsimd_context(void)
  */
 static void put_cpu_fpsimd_context(void)
 {
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_bh_enable();
-	else
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
+		if (!irqs_disabled())
+			local_bh_enable();
+	} else {
 		preempt_enable();
+	}
 }
 
 unsigned int task_get_vl(const struct task_struct *task, enum vec_type type)
-- 
2.51.0.869.ge66316f041-goog


