Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166C6CEBF9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 02:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nYyWY2TGtfq9g9njXBwfNvKTwM7Y4XVBx38hReH0kU=; b=LbdSsCLj8bbzIrhoujExa9NHnI
	wvG4K2GB2SnQIDJSQH2ySN7ku7YOAL8vXjmeXHgFDl8mQup7tqfgruCftDyrTA5vhcQWR2aTedImw
	nTGfgYV96vujdAVI5qPcfhYnyFDqAjh/3hzYZAtxoJjV9WGTwXwNTUFx2djAxiP16lCFqAu+Kjn2B
	EGVcCZAS3oxnweQ8hmENHBeSa4ycqM5RV0NMIEyLoosIYNxfzfknEsWUifASjpWJndqzAqKPNxWiE
	ko7b7VY7knVeqh2DdqtZOQV+eCvECm0fp4r4CNCCFqiABvxek9M9Ed5tU8A4jZTOJbAoQVyHqMznA
	dXlN/7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBoe-0000000HFyh-1v20;
	Tue, 18 Nov 2025 02:51:36 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBoZ-0000000HFrs-1Ign
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 02:51:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2984dfae043so47037055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 18:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434290; x=1764039090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nYyWY2TGtfq9g9njXBwfNvKTwM7Y4XVBx38hReH0kU=;
        b=UmwfSDcS2D8zgV4CWEH3Xej5Dk2B1EIDjPKaFUlbPCBBY3u583FUY/025Jw+IlbCi5
         wrmSoa7VqZVi5nvyb73/hr/Fp2zFMiO8cd31+2M+g1lirFYcVLlEapbotcZKv5E7v6lY
         UrY6fIBffmM/cV++r5XeuEcwlASA7KTtDKBwL2d8vTAwnqC2TdB9NyAL1JA+IZVLHJi7
         z0+uiDBRWOoqZ/V2c9bYBH0HcLD5scqv+Z588Ziu8FMTMA/7YLLyRAtPAmd1xATnvm1m
         py75Z0zPS6+ZBDmss4uve76XyO7qqDzV1XjkOPAL3xAzM/wF3v/1inhfpaXA/eCImFdT
         kSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434290; x=1764039090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5nYyWY2TGtfq9g9njXBwfNvKTwM7Y4XVBx38hReH0kU=;
        b=L1jx4xbz4u6RZVsiog80oMT+TNk6TtbjJyYiCPoj4d+rZhZ9PlBuJIEYPBKX0g2crF
         HTjUjo/0ORP6D932oEsTw/EcLEov+L3XhltxIkaeopwtMH8oTkBFh3jJuN7r+iQZe0jB
         AkKLVRzOIrEUGJtsr+xuurjXElVsqcBEn0Y2BrKNFbyLvFzH+t8157qY9VbrM4ZA0THq
         d6eHSwuKMHWHPCc0uVIsTmDXQ/TFZsEZ3h3DI0clrsOMLjCODeERc2sN6/CBkByfmNVJ
         XsTFZRYxyhoxxQepTQohzsfbKwX/vmodT5j7KOdvuBmAsOG5i/dR9RPhlRGaVKkyIBde
         wciQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfTWKeErbFt4g/EyHi+CiGX0Quw/hlfWsPIKklHIVrxW4pxYZ26uZdMoO1QA0LfF2/LXe3snqUFR7litf2IMvh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0hJWWkCAUvLW67wa8t6TXTyrbN7FrarKs7hQh3w5vg649plYZ
	HVfjv609juuzwC7AgRFUmGrgzX84x6VI6lLyNCakgCM2cRLI39x4O3/ihsnyDgR5VNU=
X-Gm-Gg: ASbGncsSkhIXldedwBDBytOtTQQM9g8Nk2WX3/xulqvRRXNciAGWgTueU+liNJU1EcA
	V3wBxV1yvSrhNpH7BVpqI7gnwvrbrb5yTZOu3Ag1P4BdThg+p5v+EVuyb+gquiJ6xg2X9ZDgJUW
	JB3eJZTSgsRZQz4ZWstyGuJhsL64F6A0Fj/z33qSyp+hRprPSHI9VbSrV7+Y7eTD1PD2tWNIg4v
	y0/HC9jEHvfQt8TwCNj9VnsTvyKzjxyESFS/3ZiHCbwEZBgJ93elekAhOOM2PQXGO2Q8QXYRdfk
	pUMDBDeb7gKy7ntDI6FgNidbN0yq87VVe9T1cediXakTRu714tliB60J9WKTOrjrNDP/ali08Cl
	lG0JJAz9Slcr4pHq9ibSZwrqXtQwE/yuKipoyTpIzRYKl/7cGl60rxrzvX/2q1cVYaSqk0Jxt9p
	v/Fn9mCsVV7TSRgTSYNz9z06Ww/Jwc2Ur4Vg==
X-Google-Smtp-Source: AGHT+IEMHfTR95UbanA62fl6Lb5xKnkuHEFGjCY9sBUiiwSPhLsMAn/FbJIuDYjKBwm1CvRaJJMcQg==
X-Received: by 2002:a17:902:e947:b0:295:7b8c:6622 with SMTP id d9443c01a7336-2986a6b8751mr177078655ad.11.1763434290379;
        Mon, 17 Nov 2025 18:51:30 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.51.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:51:29 -0800 (PST)
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
Subject: [PATCH v2 7/8] riscv: smp: kgdb: Use NMI for CPU roundup
Date: Tue, 18 Nov 2025 10:50:14 +0800
Message-Id: <20251118025015.42491-8-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251118025015.42491-1-cuiyunhui@bytedance.com>
References: <20251118025015.42491-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_185132_290354_8C894C7A 
X-CRM114-Status: GOOD (  11.39  )
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

Use NMI for kgdb CPU roundup if RISC-V SSE NMI is available.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/smp.c                | 5 ++++-
 drivers/firmware/riscv/riscv_sse_nmi.c | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 26083fe0a5df6..b1cefb2b0b8c2 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -382,7 +382,10 @@ void kgdb_roundup_cpus(void)
 		if (cpu == this_cpu)
 			continue;
 
-		send_ipi_single(cpu, IPI_KGDB_ROUNDUP);
+		if (!nmi_support())
+			send_ipi_single(cpu, IPI_KGDB_ROUNDUP);
+		else
+			send_nmi_single(cpu, LOCAL_NMI_KGDB);
 	}
 }
 #endif
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index cac940b7e8773..5035d4ec485f6 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -3,6 +3,7 @@
 #define pr_fmt(fmt) "SSE NMI: " fmt
 
 #include <linux/atomic.h>
+#include <linux/kgdb.h>
 #include <linux/nmi.h>
 #include <linux/riscv_sbi_sse.h>
 #include <linux/riscv_sse_nmi.h>
@@ -58,6 +59,7 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
 	NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
 	NMI_HANDLE(LOCAL_NMI_BACKTRACE, nmi_cpu_backtrace, regs);
+	NMI_HANDLE(LOCAL_NMI_KGDB, kgdb_nmicallback, cpu, regs);
 
 	atomic_set(&local_nmi_arg, LOCAL_NMI_NONE);
 
-- 
2.39.5


