Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD60E9B356
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30ZhZdfmrtOcFuubwwqepnxzvYFJYqa0s1UQWQJqRVU=; b=saVHm65GL8HE75MDnY0+bcVpvZ
	NrZpSwvXfkNxGjLREzzbLZX/EjPw1Vl2SwjjQwslOuMo4s1RXIyVke/FFNN1m4QXOtbul2fR8sdIq
	YYqE2FrMSnA/fj7Ig3vjSxszK/BC02dyrcE3fTQh5B8ZuBRIvzR+RpfTaHuhOeD/b/s2ZONZhjvTE
	XSIb7WXOk5Ut651bXnwKsHv4Sub86sUOqUx2Bi6goFIzBR4wuNK/WYmD1P/pB9l+NpL/xU3j4+eXN
	N0QWPerXMIyR6IH6pZ2oyllKMHuJ9HE8oeb7HUKFIHMU2SRHG1QWkHnJkYOu+RuYYvfNxV9gUpF3K
	xKxFxFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0X5-0000000Chr2-0gCg;
	Mon, 02 Mar 2026 10:29:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0X1-0000000Cho5-2sCA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14A06444EA;
	Mon,  2 Mar 2026 10:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F7FC2BCB4;
	Mon,  2 Mar 2026 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772447383;
	bh=Ng7f/Ng6zPtl5KJt5T+b4Vt/9C+9LhrfLa105ysMhuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tRwvCyZRWxv+iGnya9B6PWlERKEUfX3O6CY9qp238BwpoQbp2+MX/RhNMnKj006bs
	 7ntRFGCuPMR9hgqzvOamQBkzFXCROfSnLoWCCk2t82/eOfQ4li2M1jR+Hf3UgXevHI
	 m9ucWmISeXnWNM/06QXoFM+zo9shtVc2QTr6cTc9VMI/RCHQhmt7i5+FHrqimcxYXF
	 7qB+HJCZU676s360UlzYojgHFJwlSjOYM5Kawfyma6B54JEaD7k0EJEmZS4BKaH8qp
	 iRNQoPZJ8d+OULg9Devt1bTO+XsWl/HjDNReOtHzIaTGAegbvxsu7TWq0bpDrS5iaN
	 FQAWhwf4wW24w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx0Wz-0000000FBCc-02BJ;
	Mon, 02 Mar 2026 10:29:41 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 4/5] clocksource/drivers/arm_arch_timer: Expose a direct accessor for the virtual counter
Date: Mon,  2 Mar 2026 10:29:36 +0000
Message-ID: <20260302102937.1516059-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302102937.1516059-1-maz@kernel.org>
References: <20260302102937.1516059-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_022943_779369_3873FA9D 
X-CRM114-Status: GOOD (  12.81  )
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

We allow access to the architected counter via arch_timer_read_counter().
However, this accessor can either be the virtual or the physical
view of the counter, depending on how the kernel has been booted.

At the same time, we have some architectural features (such as WFIT,
WFET) that rely on the virtual counter, and nothing else.

If implementations were perfect, we'd rely on reading CNTVCT_EL0,
and be done with it. However, we have a bunch of broken implementations
in the wild, which rely on preemption being disabled and other
costly workarounds.

In order to provide decent performance on non-broken HW while still
supporting the legacy horrors, expose arch_timer_read_vcounter() as
a new helper that hides this complexity. Obviously, this is simply
a global alias of arch_counter_get_cntvct().

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer.c | 2 ++
 include/clocksource/arm_arch_timer.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index ee21804d6613c..6fcd9afad38c2 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -137,6 +137,8 @@ static notrace u64 arch_counter_get_cntvct(void)
 u64 (*arch_timer_read_counter)(void) __ro_after_init = arch_counter_get_cntvct;
 EXPORT_SYMBOL_GPL(arch_timer_read_counter);
 
+u64 arch_timer_read_vcounter(void) __attribute__((alias("arch_counter_get_cntvct")));
+
 static u64 arch_counter_read(struct clocksource *cs)
 {
 	return arch_timer_read_counter();
diff --git a/include/clocksource/arm_arch_timer.h b/include/clocksource/arm_arch_timer.h
index 2eda895f19f54..587314e584839 100644
--- a/include/clocksource/arm_arch_timer.h
+++ b/include/clocksource/arm_arch_timer.h
@@ -88,6 +88,7 @@ struct arch_timer_mem {
 
 extern u32 arch_timer_get_rate(void);
 extern u64 (*arch_timer_read_counter)(void);
+extern u64 arch_timer_read_vcounter(void);
 extern struct arch_timer_kvm_info *arch_timer_get_kvm_info(void);
 extern bool arch_timer_evtstrm_available(void);
 
-- 
2.47.3


