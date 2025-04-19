Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC53C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 22:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQ5CSP2wGdcgzWF//+b4znU12TMJTdW+6/VKhNWGia4=; b=tTk5B755+yfirkl1sCpVvBuKx0
	zax7OIenTLZofrp8/Tmm+Ypm5Pe7xPFflINxkTS+L3CNzvKgIMWPmA5cwz7rSDkV+Jfwt/LBnKw5g
	S6BwjYitWCR01VteK8kxfCWfirRqDdH4BzfvTSAKEsHxaX3K2k74px1ir8Dsak3SXGjZMY4dCgKst
	Da0w/397pUL1mwgAf/fvQpnlJuiYXyDFXIK8j6Me2jRGdJthPKe2bkWryg1dxKMteyyeTo/2iCHGq
	QOstAJ23gAJlYHthZ84utDK/jji+TlKhtJ26AaMEvAhulwbxxCKigx/upRE1IDPxNTwXZdkSKKFxT
	kgq9OL4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Gqn-00000001tfm-0QE5;
	Sat, 19 Apr 2025 22:39:53 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Gn1-00000001sfy-470H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:01 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54af20849adso2805346e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102158; x=1745706958; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQ5CSP2wGdcgzWF//+b4znU12TMJTdW+6/VKhNWGia4=;
        b=TH6wNGacWfWA/2G2uLr+ruIOzRloEYHfXEj3voPZu8KUm4pgF92P4ArwfPDFSQsQYT
         qvbEOvXsUvxfwa7fLq7WC28q6oZC/3viC3/9gJQjaZ+zirBy0/PxWzLsl8+WTePymVhG
         zCVLaVIFynaWq3p5R/hxgJTRcU1nif8NnkijzSUuEExdx1ZxhKve+s3EHWdGIEYuqiye
         rk5PQ7LXBPNd7V0ukFfbi2O6e+pXUdiM8lt56OICcjNiPADiTeJwGZOGvqGMoqPMg0x7
         KmdxTHft2MyUDa2B/OviHeuqFlU+dr5VI3d1g24kO/56Sbm8CvmCg8En8rdxW29iXK0U
         YYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102158; x=1745706958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ5CSP2wGdcgzWF//+b4znU12TMJTdW+6/VKhNWGia4=;
        b=ED3DwJ+3srVvKWbc1OAEDE9RNKHBhZbkw0rWcn9BEURMmlNccPfq4kq7d5ALZepmve
         fvcIfARyesoC5CHXZQyD7oSKCDtUHajHp5AlZjABQ507VlayV5Y07x/5ILZISmHo1UaY
         GW0j3/Wtfcy84xSG8vjm5zsMGg0a4mO+6jfAYp/uU0wyHTBpWz1SKZzTYGDa6VwHYzBI
         JWV+bcE7xbO7iXMnMryw3i2miDQWOIYATSFSdwUCSv9ifP5SlPoirtnFJz5AW0uLR/n1
         cgSu8KVsAFVFhwZ5grHcfqe/UOBCQxXFrkA6rsMDR/YuIBd9w87NFJfipIvO555cldfU
         T+jA==
X-Gm-Message-State: AOJu0YwBKaBVi5bogzSJCYmqzxGNJfCER4EuFdkR2QqIBl19Blqq06GV
	bkPWZ0QUobLWBRdj4ljroxdbrnfIlBH+CrWCSmllGbHW/yctqd0ZFGNUkxORKoI=
X-Gm-Gg: ASbGncuBxwOL/ZZ1alp8j9nH7DGm1jOZdaAEleTwevNjmWZyIIZRwFD5c4LbjExSsRa
	8wHzObWALoRjQBGMmELt+LbXc/gBLIDlLxSkwlCOWosc7PfX0UQNzS9YutQcR7dN4Y3dEapIDa3
	y8TteQjw/41YsSUe+L85HAdae4aSxmKvI0oQc7CvOTlWfspm4E9T8y3GaFR/OZq/OeInIrxENe9
	sTtqvnhSBTIEaL+Z6155W8TqqIkyvN6Wt2qmqYSHj7Cu9fn8V62J7STazWo508RVEVjqQMc+x+a
	fIyPSA1BQt0QFRvoPboE3gYXnEHzNCpcan7gkNoGLZ66JH7/gtQ=
X-Google-Smtp-Source: AGHT+IGLMvDVq11ln0AcImjW5loG4OTpHEIEWmQKeTgHMYpB1Kkl5IPq2/e++cLfj64OrAhwHsThtw==
X-Received: by 2002:a05:6512:3d29:b0:54d:6c14:3caf with SMTP id 2adb3069b0e04-54d6e780055mr1794485e87.11.1745102158136;
        Sat, 19 Apr 2025 15:35:58 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:35:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:48 +0200
Subject: [PATCH v6 01/31] ARM: Prepare includes for generic entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-1-95f1fcdfeeb2@linaro.org>
References: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
In-Reply-To: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_153600_023799_6DB84CE6 
X-CRM114-Status: GOOD (  14.79  )
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

The generic entry code needs a static inline function for
regs_irq_disabled() so add this, in further requires the signature
of on_thread_stack() to be __always_inline so add this as
well.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/ptrace.h     | 5 +++++
 arch/arm/include/asm/stacktrace.h | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/ptrace.h b/arch/arm/include/asm/ptrace.h
index 6eb311fb2da06fa393f8be7caec8d997637a88b2..a01c66f0ad907882af2a383e53de8aca68c551e5 100644
--- a/arch/arm/include/asm/ptrace.h
+++ b/arch/arm/include/asm/ptrace.h
@@ -52,6 +52,11 @@ struct svc_pt_regs {
 #define fast_interrupts_enabled(regs) \
 	(!((regs)->ARM_cpsr & PSR_F_BIT))
 
+static inline int regs_irqs_disabled(struct pt_regs *regs)
+{
+	return !interrupts_enabled(regs);
+}
+
 /* Are the current registers suitable for user mode?
  * (used to maintain security in signal handlers)
  */
diff --git a/arch/arm/include/asm/stacktrace.h b/arch/arm/include/asm/stacktrace.h
index f80a85b091d6c4ff365e15ae7100af1c3aed597f..815b5f256af164daa053f3bfd6cb2f54042a8d2b 100644
--- a/arch/arm/include/asm/stacktrace.h
+++ b/arch/arm/include/asm/stacktrace.h
@@ -26,7 +26,7 @@ struct stackframe {
 #endif
 };
 
-static inline bool on_thread_stack(void)
+static __always_inline bool on_thread_stack(void)
 {
 	unsigned long delta = current_stack_pointer ^ (unsigned long)current->stack;
 

-- 
2.49.0


