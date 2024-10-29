Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BD6D2AB20
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ECqHBAN3rDV9yo1zqeLO+ji9lVIoh6IkMKI7b6YgP4=; b=l5wRA8faf4QX3vL7qOiDtI9X0l
	gxvvldn00fFanqTbBwkPPprC1shE3UMWYgTIQN0ANlLyiEo6zHcbN32Mks7JspjSkhh36xO24n9xZ
	ELwVYyZAGHCeNEgxiwSecKzp+11nu6nbVBkXA2XEdGLYRRVKRg2MEBoXw1S5y6ADkuhzzp6wLuuW3
	zhswGeMd9BmMOrF0eZE0rBTcCioSOzLxeWWkRLmVEAmaAOHOsfhwtQnmLGnJ6aFFSUSQ/uz0yivXV
	fhPPIJrQ0FsxUsTKPgAMhvNqBJHYg7DYlIi0GHVeO82bQllo4ThorPlghJP5Uin3mbEAXT/7e6ND9
	5pqRSSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5k8s-0000000ECPC-05mk;
	Tue, 29 Oct 2024 11:12:06 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqC-0000000E7CL-4Bae
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:52:50 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539fb49c64aso8787724e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199167; x=1730803967; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ECqHBAN3rDV9yo1zqeLO+ji9lVIoh6IkMKI7b6YgP4=;
        b=wdpZ/a5/uj46bApvahjqVx6S2CHPRzkV6bbWLHQDadKVOJZSR2MXR3tfVLOVHsmM0O
         Am4e0eXFL+0nhVMzJzFOAywJ0xc7p0q10qASkaYa2eOhl5Z2PcEyH6eVPdW1tp7KProE
         51dA/nNrZTzn1BRnDMUaJBRofPAofQZ5LjX7OAf2BwpdIFVULz2dBL4g1QxtJfHTXUU/
         6txcAzz09BwZOzvBBrRlCyqJ40PC7+tQYgOAbTf9sj7/AgkO8oljGUFPuo911ezi6d3O
         8N315OXqyuAxCd8RLkNpZrl4EsGBSr4lFpPw76Kz7J4hiRzvqP5u9S54hQWFkaTWouax
         DqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199167; x=1730803967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ECqHBAN3rDV9yo1zqeLO+ji9lVIoh6IkMKI7b6YgP4=;
        b=mlkudchoc0MkGoxlJOW+ZU86Kl7UiJE2VfaZAQ2c0v6gXNBSRatexMYMK5C+nxF5hH
         iG56gldWxzbzevqdATVHQ9Si2d70+SiICWJehqdK3lfFHyIAXbU6lmtS+oXYCzptNPbd
         onsoMervwGQz6Jq3sNcRkNKAsAphJjQdCeHHq+Qh4DlNyzhhee+YlLXKLveczRCgtd8y
         o4VmjVdHQG8cV5Pz6ve7lvbShdtW0a3+09A3JAgU+hidTQb5NL3Z7Sj2wglQFp1NfJGb
         G1aUde3lTrYUeYLIbcIXfqk+xgEyE5Zhve9A5S5sKdpjeP/htNVk3T9edFR+hQQrI93d
         7K6g==
X-Gm-Message-State: AOJu0Yyinx6/SchekF+qcZoIb0VqDGXiVNyzLmFMoluGkBQHA0Woon+J
	qK/0bYhkOEL7nD+izH6ZCkMY/UNm5tHw7tF8U0MQVBLX3C9/wBSuFC/7TWj7yKE=
X-Google-Smtp-Source: AGHT+IFxU85skQ0lHgZfBxehiTWY20leong2ojbAy2znYbSLCYYbTDr3GHQiZv+4b0NSU1Ui/HoHTQ==
X-Received: by 2002:a05:6512:3d8d:b0:536:54ff:51c8 with SMTP id 2adb3069b0e04-53b348cc6e0mr8922755e87.17.1730199167001;
        Tue, 29 Oct 2024 03:52:47 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:52:46 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:41 +0100
Subject: [PATCH RFC v2 01/28] ARM: Prepare includes for generic entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-1-573519abef38@linaro.org>
References: <20241029-arm-generic-entry-v2-0-573519abef38@linaro.org>
In-Reply-To: <20241029-arm-generic-entry-v2-0-573519abef38@linaro.org>
To: Oleg Nesterov <oleg@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, 
 Will Drewry <wad@chromium.org>, Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_035249_085590_1FFFAF38 
X-CRM114-Status: GOOD (  13.91  )
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/ptrace.h     | 5 +++++
 arch/arm/include/asm/stacktrace.h | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/ptrace.h b/arch/arm/include/asm/ptrace.h
index 6eb311fb2da0..a01c66f0ad90 100644
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
index f80a85b091d6..815b5f256af1 100644
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
2.46.2


