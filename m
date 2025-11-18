Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CB4CEBF9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 02:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk19cubzYI59vS2m7ARmuI6dwPXbjagJNzaP0UWxsjY=; b=auxscOBOkvHzp8azz4tFB3boCD
	U9mN8qsTUfbIK6+9pR1S5vWzbYJYsktvQv9ALJeRxDPAOBAr4rOcelEHwTvVW0U5kjkzYAMOwSg/l
	4TGZQTHUIlErPAlFuHZmNJazEZZVAqchNpI0gdw+0uWvSr5tqTLYMZ7lyGHhIMuOODw9lhPAHXEdo
	fbmC87R7To5kjDAqU1SO2tvPbSXwVO9y8xsJbbgN0/X4HPn9b5ffwoRTpYMibM07cmsLqMZ1XZ0LU
	eOt/8LgCN/0ZybX7mhdlVmp3JzeEs40fbfljvFbWgtB8Svm+a+rcDCNGfWiug0DG5Hi+D789Zz+Rl
	8g8htSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBo3-0000000HFWW-26r1;
	Tue, 18 Nov 2025 02:50:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBo0-0000000HFTU-0VNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 02:50:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2955623e6faso46215285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 18:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434255; x=1764039055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yk19cubzYI59vS2m7ARmuI6dwPXbjagJNzaP0UWxsjY=;
        b=jnhC9rwnHxoHPh/5B6vSWkDKhSUIbpaB8Pu3vv4ID60IwFs1VxIZQ86/RIcJfTtlQ+
         AcitfzcmqVGW3+qhfvOdD7ZF0Y+Jb3+HIkEMvZ/l9p1jgp3Dmmx/Fxbi0PbvucUNfFI8
         XjQw4vWWbK4/35XVixddr+kkIh+x0nEEwKCDQdsKvIFJW7jDl91uHWKVLIwteHGV41GV
         1Q3xq0jW8C4vkwdj5RNgM4yXDL2dWCfdnKep9IyuLX352YbFXedYdnKm14p1dH5qTsbb
         FBPhqtaNlj4ckJLuxB5VQYI8s49FpgX4DjAbXt3I1cNw1G9XVUqxQyJpxOUQsE+YGa0V
         VeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434255; x=1764039055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yk19cubzYI59vS2m7ARmuI6dwPXbjagJNzaP0UWxsjY=;
        b=OICGCtQQxJTOA/6yDtXb7GGjjIbqSrwCNpk682AUGw8nNitHHDX70Ogb4Br9u3Te+A
         IqFcB6/gLmlofpKyWuBePq0QT5A32Mez76twV8j0Q+1hWOLvCrpCONEakbShDAdB5YBD
         X5UPPp+u0AHC5jYVRyHZlhubC8PO4Y0xjvMsH4ytwRK2o1S5v9n3MbNxkWEGJljBf1p8
         IfQaOgTuRfFv850jeHI/RqFxgBCU47D192jRZKD+hMdGMUOowuIwmpxyjBrVfrIRiEa1
         pQ9QbRHmYZdn0NjNKVsh/gyP4p5EmC5uWK2s8KB8Yh6fQl4EvNFj2ZuGNb8jiwhBRRdG
         WWZw==
X-Forwarded-Encrypted: i=1; AJvYcCUjeAgJskkiIE0auL6m7u/Fzx5ag0c/aD967L/f7zsBxuPrf2tQMJPm6Uh10oZiTXqa2qso/BBwo5RYSKm9XI7C@lists.infradead.org
X-Gm-Message-State: AOJu0YzkY/qwqU1AMfBrH4QQHQP8MCa1k0aCRvNo+6SP24R3EuKu1NKA
	Yfgc+Rs3gBWW3LC6FwJSZRbh8Ixa4HIie3m0x3EQghB72yQmXwD+o6qnnRUVyL11uy8=
X-Gm-Gg: ASbGncuUVTWj4FuPQVbEmpHBVW84gDRRJRpqf2TiTw0SwAZHbi5h8chnJVJpmWzF64R
	jhZDar1e24n4Ayqr/bcvgmKNYWMpSMWXvEmUYjV9uDtMXCXzhTNIoL7ifBoUiAE+JX8ZPbd6upA
	Hkbzolq/C+u3DFwELkmkm7/z5IZSlY69CdVMNpbQKqSxN4oENWsQkFY17TDBMpU1x2DzQbgQ6gE
	8ifv/C/CIseHybs7BRoPVa5U1OMSJBdSW59joVKShRC9RmFYYaP66pyKLS3NPsDBmAfF5DZ9NBw
	oVJwr2lYVcOzzsMI0LOAofnKbIeAflGk/mrK2UmdxqRhWuUjZyWEg/cggFFJE+ZjityLT5dNSFQ
	C8VH/xFaWwoUKq5SWRHXTfzBWJjh8mB7BDDloxeHJ6BJElMy82owQgkw0b4xExR5p5REHDlufzi
	dl8lv3t6dzoezl/BJzGiEW2b2SxzHCJwHCcA==
X-Google-Smtp-Source: AGHT+IGDZAMo0ZQv0dHXusB9vvga1W8EiCZHdD/dMDMq4XG4NK+75rIo7LnojyDw0hkA9sDDjE1JTA==
X-Received: by 2002:a17:903:4b07:b0:295:9627:8cbd with SMTP id d9443c01a7336-2986a73b6bamr160750285ad.33.1763434255050;
        Mon, 17 Nov 2025 18:50:55 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.50.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:50:54 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	kees@kernel.org,
	tglx@linutronix.de,
	viresh.kumar@linaro.org,
	boqun.feng@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	cleger@rivosinc.com,
	atishp@rivosinc.com,
	ajones@ventanamicro.com
Subject: [PATCH v2 3/8] smp: move num_other_online_cpus() into smp.h
Date: Tue, 18 Nov 2025 10:50:10 +0800
Message-Id: <20251118025015.42491-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251118025015.42491-1-cuiyunhui@bytedance.com>
References: <20251118025015.42491-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_185056_167722_F3F6C84D 
X-CRM114-Status: GOOD (  11.30  )
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

Remove duplicate definitions from arm64/riscv, add unified
implementation in smp.h.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/arm64/kernel/smp.c | 11 -----------
 arch/riscv/kernel/smp.c | 11 -----------
 include/linux/smp.h     | 11 +++++++++++
 3 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 68cea3a4a35ca..2d1e7839dc9b0 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1171,17 +1171,6 @@ void tick_broadcast(const struct cpumask *mask)
 }
 #endif
 
-/*
- * The number of CPUs online, not counting this CPU (which may not be
- * fully online and so not counted in num_online_cpus()).
- */
-static inline unsigned int num_other_online_cpus(void)
-{
-	unsigned int this_cpu_online = cpu_online(smp_processor_id());
-
-	return num_online_cpus() - this_cpu_online;
-}
-
 void smp_send_stop(void)
 {
 	static unsigned long stop_in_progress;
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 9dbcb9a06a96d..669325e68a21a 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -272,17 +272,6 @@ void smp_send_stop(void)
 }
 
 #ifdef CONFIG_KEXEC_CORE
-/*
- * The number of CPUs online, not counting this CPU (which may not be
- * fully online and so not counted in num_online_cpus()).
- */
-static inline unsigned int num_other_online_cpus(void)
-{
-	unsigned int this_cpu_online = cpu_online(smp_processor_id());
-
-	return num_online_cpus() - this_cpu_online;
-}
-
 void crash_smp_send_stop(void)
 {
 	static int cpus_stopped;
diff --git a/include/linux/smp.h b/include/linux/smp.h
index 18e9c918325e5..5300c5c14232b 100644
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -275,6 +275,17 @@ static inline int get_boot_cpu_id(void)
 #define get_cpu()		({ preempt_disable(); __smp_processor_id(); })
 #define put_cpu()		preempt_enable()
 
+/*
+ * The number of CPUs online, not counting this CPU (which may not be
+ * fully online and so not counted in num_online_cpus()).
+ */
+static inline unsigned int num_other_online_cpus(void)
+{
+	unsigned int this_cpu_online = cpu_online(smp_processor_id());
+
+	return num_online_cpus() - this_cpu_online;
+}
+
 /*
  * Callback to arch code if there's nosmp or maxcpus=0 on the
  * boot command line:
-- 
2.39.5


