Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F53D2AB1F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxEtYMLSB1QX4C5qcE83rstSx0FEcAVbxyG1Gu9/c1s=; b=0yVRBbDwf5kTtohftF1ywB3b/Z
	WMAj1tlKjgH6OVyZokbaJ8fVkZ+y+m0YGmWWUQWipaZ6nZv/9B9cgm/poMF4hDhokN468NMpZoqtF
	ljrGoniUEkYGY3+ryTbUFnFEFDewOf9W9gYqyaYhiSEo4Z+PxkxbAXH2vtiUz45tnrRZuVgdQp/bN
	7lmmibxUtXvTJ2Z44koREAfioANrCCrT9ysSO/f9leGjVFc9571k7BnCT62izrOzATUXkfZU4SR0S
	xF0UQeBhjScNhLAhmbmWtb/DRqCqNVtp3ZkJZggzVZmbWMBvfu2ErrybhRsiRINJaR+HawOlzZDO4
	5afW3uJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kC5-0000000ED3O-1LL5;
	Tue, 29 Oct 2024 11:15:25 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqH-0000000E7E7-0NFK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:52:54 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so8220551e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199171; x=1730803971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxEtYMLSB1QX4C5qcE83rstSx0FEcAVbxyG1Gu9/c1s=;
        b=R5Q/a1iEaLPxgsVKbnWU5WgMws3vd6CRff5aZ57MItHo2Nl3pL77raH/jZeGEF1ROV
         RGGThB8DrnQSdzQhz3iXzpkrMm75AawUDfCvR/CDY5wi5Ax4VUGcZ19ru3IsytsB/C1W
         0X9OK66tdj8Y+/HEeUImsR0ef96UYWbPNbvH316HpQL10qtHHFv6m23nd36s82ta4Co5
         K8AguwiAS2V8SNN7EOcUIitASNwYVenJ11FPQxlqJIXiD7S+5lB42U4XCBr547AoEupW
         5RsXjHcH9Y06xVj5grFDC8x8H0vTC1gzIJttBzGCmzKlRViw4ImFAv2N89lIp5FIgwos
         S3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199171; x=1730803971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxEtYMLSB1QX4C5qcE83rstSx0FEcAVbxyG1Gu9/c1s=;
        b=Fm/GgebD6zQFJsJ2KC2FHs96aBlsagaLo1oluqOGJVIR8T1sr2Zw8PAKcPsheciknI
         oYkQ7aXfMAZhH3l0RXGs6BlK6/g3Lfu2Mcit9lUsOVcbJC49lXANeqbhUzaV45Qt86nq
         K8qQY0LXPIFch45SDPkmP/DTp3I/N9ZMfy603Y+40xDRyZHI1VdNWCPF+VD7ZGolaciD
         VTKgLZT6vOrE1izR3edoSlNXSKbFjQqh3BkqDvF2uMYk7hFpPMmL/LSb7XB4wmlWBWhm
         1jJ9+j2fb8AhJ644Q47JbjD3RLKfGbfXqLhi33LIRlQl9Al+YR9X7ZMuuC1SRlIZB93r
         bIgw==
X-Gm-Message-State: AOJu0YyTLG7rwUxwO/u+yZiLYGSID8f4A1FgDflkBQy67PDfJ83pia5I
	zXNlRnsLN6yFZ0qwcesDbrGFbjSieoNT1eDm2ri4N6NmktLh2UOOK23hGlSNUyQ=
X-Google-Smtp-Source: AGHT+IG8wqLvl/74zfQu1AsovVWvKhyDOxgS68ymugVtQXnP4D9gfxPQaaqzIINEiXO/D6a/IaB5TQ==
X-Received: by 2002:a05:6512:31d3:b0:539:8fbd:5218 with SMTP id 2adb3069b0e04-53b34a3515fmr9748104e87.56.1730199171163;
        Tue, 29 Oct 2024 03:52:51 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:52:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:43 +0100
Subject: [PATCH RFC v2 03/28] ARM: entry: Skip ret_slow_syscall label
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-3-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035253_218678_FD8547F1 
X-CRM114-Status: GOOD (  11.05  )
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

Don't introduce this extra label anymore now that we have
a clearly defined entry point for ret_to_user.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index f379c852dcb7..2f93c2f6d5b8 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -102,7 +102,6 @@ ENDPROC(ret_fast_syscall)
  * do_work_pending() will update this state if necessary.
  */
 ENTRY(ret_to_user)
-ret_slow_syscall:
 #if IS_ENABLED(CONFIG_DEBUG_RSEQ)
 	/* do_rseq_syscall needs interrupts enabled. */
 	enable_irq_notrace			@ enable interrupts
@@ -136,7 +135,7 @@ ENTRY(ret_from_fork)
 	badrne	lr, 1f
 	retne	r5
 1:	get_thread_info tsk
-	b	ret_slow_syscall
+	b	ret_to_user
 ENDPROC(ret_from_fork)
 
 /*=============================================================================
@@ -310,13 +309,13 @@ __sys_trace_return_nosave:
 	enable_irq_notrace
 	mov	r0, sp
 	bl	syscall_trace_exit
-	b	ret_slow_syscall
+	b	ret_to_user
 
 __sys_trace_return:
 	str	r0, [sp, #S_R0 + S_OFF]!	@ save returned r0
 	mov	r0, sp
 	bl	syscall_trace_exit
-	b	ret_slow_syscall
+	b	ret_to_user
 
 	.macro	syscall_table_start, sym
 	.equ	__sys_nr, 0

-- 
2.46.2


