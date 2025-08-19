Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FB8CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRmcafjLK/bUe3QVBcZSTxEMW/hT2fpAZCLoRLeyHpQ=; b=xxUHRUoqlmGCfArM/1vD/Vpl4n
	HiwCBHJdZStIkQJz6upbhxQ0fpXE17xbAZ1vOgsQPDQW4M81gVjLe9TUCLSmaxyKaoaJ9Zpqw4yli
	cDRT3QDNqyedydRpDBTugGqVwAUqczz+e4DtpsVfQ83yWgX4L+EaL2dw0YeGj9O+aooxzx3YrxNw/
	gJ6R/x2ik1Idx0a+zi9bnmfslL5RjyFgifFQMRzwAyVCEsnaqsNfe+wKTkJlYPD3rCVmi1s0+9FFa
	FwXTPoA+iSG+j01khu+cpCMzgAHHMgzN2tYXPIkYqhRAja0IFC/yCihyJGA47lNQCegMuWABRolRZ
	88VdGEbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQqF-0000000BD7G-2ifk;
	Tue, 19 Aug 2025 18:13:51 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMRR-0000000Abs1-0McA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:31:58 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so2901239b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755610316; x=1756215116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRmcafjLK/bUe3QVBcZSTxEMW/hT2fpAZCLoRLeyHpQ=;
        b=gOeMbibL/ZMo741ttV6MtEVhMHwDovXvWyun01BPvq5AS7P/T9WNJw2gCmbrhelLYu
         pR14eHQudvcW+ey1l9H3vqIVjinS+jdo9n4rwT7nNsS3D5K5j/SwcG0xJZSFTJhnMBLR
         xHhiQZQMCAQxE4IHFic1HVIMBBoj+O6eKNi1uO10Qz0PKzx+DrfIsotgvhD7/sjXB8jf
         0lrMMGUUiLZCw5z1ajZIb67aaE3KEDClGxyGfhpQwRbV4UwkZaA88W76H1aS6jfkqCql
         7Ir+JZ1kovebG5sGisLsXjGgJFxgGpX+EN1R1PMuoohN5wkEm4AYRygaMDqLEDqIvU8B
         lYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755610316; x=1756215116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRmcafjLK/bUe3QVBcZSTxEMW/hT2fpAZCLoRLeyHpQ=;
        b=Nsc6ZiZww6yBqJ9wB/NgVER/FBr05jJjJOFN+yPlUvSmFtxIbTVJcr0qiUcZwxpEbl
         5ejotbjzX3S4vP2jvJAA+FmnB2uNFnYW8/YAMQ/N92Z0hgifoMgVe/qHvx7bHhA8zUPp
         QiG02xCyY77zWuCZReiAKHZPtImAw8piy5vb7DxL5A4K3p+GxMYrVaVFmX59FYHUiVfA
         tnvmrhS1J5riIVZhAFknQTdHSKWKxRnIa4QHYYC4lH0sausKvtJ9Lo4vT8ZsoDK9e19n
         ctQatiKJLR3z1rBki7K14riXf1qK5FlUFp5+w1h1HUPgHzOuxrGhva0lWV2XMq8tP6e7
         sCcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkd781g76o/esjlvugczSSWYHZz5U19QjvDfVHjgn60a4xBZA0yqksvc5/XEs117z2NQ6Zp/ztSiBDJ5Dos9T4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2+pGH/RdwA6eb6rT3LCVGeR74Jniy3Ndq61KqUpwcs1v8H60u
	Nnkzv0pscjR55YGtaRwz5iFR6RVjEU5cjHjnTFpGSy6ah4Ih5NYVu6Qn
X-Gm-Gg: ASbGncueu9+LClXQyrvBReGtYmO3tQDqaghA6Yjaqq6aqTWVeec7Ji2nFh65iIZ8FNS
	4F6gGw8lSbwD5nwjUiHHurdRkPmOYw9EoZYCyWz64Xm3iSvfk0bxqnBT45X2P+WcgOhoTu1D+OX
	7zB3pXio0zRDvxWB4iDS3OcSoNrhb3K6yp26ggGi5K8wfWuE2RzU6RiYPWi1snG1tEpiam1HCH5
	XOD907JVOPDbmyUcG9Hrh5pV0TVg4rW1ti8fG3Fttc01WtxTqSI94EaqOYTxkfd6nBb6Wm044as
	0tujyhW8i8lZJVk+vrh5jUqYEpLaQm9/9SQ7A8o+frGt+i+C/w6yiTAM0ioC2ScMuNnKpWRigV6
	ydO1ZoJoRtggEi18Jh22M8LD8xnPwHUkt4wfvOEqNrhQYMT7H5tdaSfK0aBJZ9RULt/0=
X-Google-Smtp-Source: AGHT+IGHwMFf1Q2ZU3OCGcqXj35XfKNBWk9FMiaKSJAbgclkE6zyl5GtbMaE1KB/or/Tiwr5taj28A==
X-Received: by 2002:a05:6a21:3298:b0:243:78a:8299 with SMTP id adf61e73a8af0-2430d49d8d5mr3621641637.50.1755610315907;
        Tue, 19 Aug 2025 06:31:55 -0700 (PDT)
Received: from fedora.. (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f7cdfsm2517490b3a.63.2025.08.19.06.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:31:55 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: cuiguoqi@kylinos.cn
Cc: akpm@linux-foundation.org,
	bigeasy@linutronix.de,
	catalin.marinas@arm.com,
	clrkwllms@kernel.org,
	farbere@amazon.com,
	feng.tang@linux.alibaba.com,
	guoqi0226@163.com,
	joel.granados@kernel.org,
	john.ogness@linutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	namcao@linutronix.de,
	pmladek@suse.com,
	rostedt@goodmis.org,
	sravankumarlpu@gmail.com,
	takakura@valinux.co.jp,
	tglx@linutronix.de,
	will@kernel.org
Subject: Re: [PATCH] printk: Fix panic log flush to serial console during kdump in PREEMPT_RT kernels
Date: Tue, 19 Aug 2025 13:31:49 +0000
Message-ID: <20250819133149.7452-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250807112247.170127-1-cuiguoqi@kylinos.cn>
References: <20250807112247.170127-1-cuiguoqi@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_063157_123576_8D40194B 
X-CRM114-Status: GOOD (  12.41  )
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

Hi cuiguoqi!

I'm not an expert on the subject, but hope this helps.

On Thu,  7 Aug 2025 19:22:47 +0800, cuiguoqi wrote:
>When a system running a real-time (PREEMPT_RT) kernel panics and triggers kdump,
>the critical log messages (e.g., panic reason, stack traces) may fail to appear
>on the serial console.
>
>When kdump cannot be used properly, serial console logs are crucial,
>whether for diagnosing kdump issues or troubleshooting the underlying problem.

The console not being flushed in the case of kexec should be expected
as described [0]. Its about prioritizing kexec over serial output.

>This issue arises due to synchronization or deferred flushing of the printk buffer
>in real-time contexts, where preemptible console locks or delayed workqueues prevent
>timely log output before kexec transitions to the crash kernel.
>
> /**
>  * kexec_image_info - For debugging output.
>@@ -176,6 +177,9 @@ void machine_kexec(struct kimage *kimage)
> 
> 	pr_info("Bye!\n");
> 
>+	if (IS_ENABLED(CONFIG_PREEMPT_RT) && in_kexec_crash)
>+		console_flush_on_panic(CONSOLE_FLUSH_PENDING);
>+

Calling console_flush_on_panic() while trying to kexec will
reduce its chance of success.

>diff --git a/kernel/panic.c b/kernel/panic.c
>index 72fcbb5..e0ad0df 100644
>--- a/kernel/panic.c
>+++ b/kernel/panic.c
>@@ -437,6 +437,8 @@ void vpanic(const char *fmt, va_list args)
> 	 */
> 	kgdb_panic(buf);
> 
>+	printk_legacy_allow_panic_sync();
>+
> 	/*
> 	 * If we have crashed and we have a crash kernel loaded let it handle
> 	 * everything else.
>@@ -450,8 +452,6 @@ void vpanic(const char *fmt, va_list args)
> 
> 	panic_other_cpus_shutdown(_crash_kexec_post_notifiers);
> 
>-	printk_legacy_allow_panic_sync();
>-

The ordering here should be kept where we don't want CPUs other than
the one panicked flushing legacy consoles.

Sincerely,
Ryo Takakura

[0] https://lore.kernel.org/lkml/847cagmjsx.fsf@jogness.linutronix.de/

