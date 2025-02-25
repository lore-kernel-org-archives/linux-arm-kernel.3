Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D308C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5mhd6DszF79mgTOhWslIzEoODnT/4x94Ab5tm+ZGKw=; b=YQilIfj1YyKsLjILJLRmoi8nsI
	bJnv6KmQ5Ws2RMNxo+ranXUqPMck5PfxykgO/DGw0ceWZK4TalVeJ2d4j2edUf5a31BgvidwEgVWk
	9Dw4RYjJ76NCezdowJsoPdl/Kc8bgU4MQMHBWgniMowTsoKX1AvTkk4z0/yhN31yslUFOCijzWz3k
	uej191lFFSJ+j8yrmiwYwXZD1InAXV1B05KioTaFD70ENd3AJxpquH9GepwVyGvmBPDN9RkKqBCap
	Hv2NSNw8BQMUQkkaay2a1zUSHZSDQR7yIxuWJw3ALU6hs1OzoUbHGtWCMtqcpgA+Iws5qIgD7smJ8
	cUF/qziA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrvz-0000000Gm3g-1a73;
	Tue, 25 Feb 2025 10:13:03 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrea-0000000GhbK-2WRF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:05 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54529e15643so5866981e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477303; x=1741082103; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5mhd6DszF79mgTOhWslIzEoODnT/4x94Ab5tm+ZGKw=;
        b=TCxKM0GECgptn6pj1ir1RnfoAGqfKbc6lkjG7euLKFC4rbxG21tH8kUnkA2AuCN7+V
         rg9+ELSONBrqhumFn5mMBB8Y+Q+QC5TcmulSZ85RA3qX2YpvRxVo4eEBJHmeTxoc+E+1
         hv8ijvaGP0lvW4Mn+ckcviW6H52uN27XSO7RihaGRjKlAyyc5OFi93i7U3g2FZ2XlPMU
         oiSLmU2tkrSD8gT0U0E5kLRONrELoiuVXucga4p0pM5If2wsylZxpgP05rdQDQNmiQ3z
         ttJD6y/1+NvXLZKW2iF7+oQTkK2kpWypQ9oFYHq5sEOKhs8i6BmioG2maqL9sTLCgiyd
         GcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477303; x=1741082103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5mhd6DszF79mgTOhWslIzEoODnT/4x94Ab5tm+ZGKw=;
        b=KZpq/yOChTf/Ju4WAwYAyvgT61cD+y0v6e05ueSC8dzOKbPTQde1iK9MfysdN//TaC
         z0fvBstFAYzfAhQNao4Rbx05avzeHHGMttItTXyPOgpmZ+YIhx5U0wYYJDXDLNAnG0YF
         1NvvBQxUAtX5eKT5a7Fzsb9g5ZeD862Jk6gydObOjRS2fo57To9+Q2hPplWHAdK/FgRc
         h85KZQy1LRLowhOSkgeNosSBpqiIvmAQo6lRb+aKSowMPw0siMFok6cgg5eWdiLMJ25s
         uHCCtFXAvlutDvOVaHvWXGYFDXetnYcyGXzoNk2+9IUY7/Nbvr88bWOJEZvSpWC1nhi+
         mA3g==
X-Gm-Message-State: AOJu0YxoFiHk17e9hZ96JTrg8ZoSK1S7lR5wPjXR6G8o+yA+V09mSn8u
	7/2JJSiUzHBJqYDvmIDP08Xr+U8UL1F2cyolQjsbbj0J0NJWu0mDSFzQQ4ubC34=
X-Gm-Gg: ASbGncvf8XmCaQdTTOQq7NA9EiJESRM79pIj8B67DCcGlgRtyN+3n1S5qqssfHqYqTw
	wjpNLV7PakXYnZky8UxokjjIERJxUsFO7wb+7Jmf1zSCnn0tqayVIQ0MhFJ4pTje8LtlJScgmm+
	UjoQTOffCKKLQmDn3GYO79eijHyTas3/1WH9ptxRDi319o4Qs41p+qeh1WwC0getljvwJGdR/Kr
	75B9icD8tckvZ541SxH/aznZUhZlKQ7SS46qAt+bn68BCItC78614otma0LBNzqT7m929MwWq85
	a5aXpQgHVLphiDuMFVFyHw2quRIo1z6eoxaP
X-Google-Smtp-Source: AGHT+IHxMI3/M9aEsI7YosRrRsIEAAGbkbNTPpvA+15Mry08Go3W+i3rmuxeIPJbQpwMTvgT3L7elQ==
X-Received: by 2002:a05:6512:308f:b0:546:1d8c:60f1 with SMTP id 2adb3069b0e04-546e4662ce7mr8313980e87.15.1740477302668;
        Tue, 25 Feb 2025 01:55:02 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:02 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:54:50 +0100
Subject: [PATCH v5 03/31] ARM: entry: Skip ret_slow_syscall label
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-3-2f02313653e5@linaro.org>
References: <20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org>
In-Reply-To: <20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_015504_660368_3D13BD1E 
X-CRM114-Status: GOOD (  11.09  )
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
index f379c852dcb72fa5e960bba5621cc2152f0df0d3..2f93c2f6d5b8fdf6aaf3dda0192bde144fcf238d 100644
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
2.48.1


