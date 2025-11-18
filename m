Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A36CEBF9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 02:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pEsD6oo42O0RlVFVHOQlcJ30WTWABpFDF3XeUvqNQ4=; b=QdAo9odOOWxzTe7X2leuGyInwt
	kB2zdESKVvHNkZAjwC3pIu4IpPBjNC4OjzNVvvyt53jTzNVDkW9OJ8YYBVDFdy2c/QbkieTRNcS7F
	aXaiyvN0VzScHX+euKrkRTXlHjswuEcf2Y/5eSetOLXagSwSyejGoB2tNcsp8OxuoVApDy4Juj99o
	UzWWh447BdQrizm4egxWgqJ3CWcdF0TTTMCrXXyl5z1ubp1GmQVoF8Qh/LyYN7HC1ZuT8UEIxJVxY
	ll4vWX3RjPBILUbrAwmm4jZv6vic18bYObUEnIOoCT4N6B7J3ln0WKVMGoW0wz2TD1OlfFFURBE/o
	w4sJ3R7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBot-0000000HGAy-1vkK;
	Tue, 18 Nov 2025 02:51:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBor-0000000HG7X-1ygf
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Nov 2025 02:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=8pEsD6oo42O0RlVFVHOQlcJ30WTWABpFDF3XeUvqNQ4=; b=gSq3UuR9cqG+lakB3NXRSi67zC
	IgkKAyo0psQExr8ZFIZeSR1DaF3R+n68Nzz2NmOU4zixd993Sv1BhByE/4Knx0R9kbxlGf2t70yKD
	/sfhzWu7cCh/5QQYwwpfQ8hzxxgrhg4FJ+EhT3fZWu0o9hPPlGAPNTgp/5NjzSGSJx5x/c6Yn0VkR
	NLOUl+4VMj6m4AFKpVNk5jN+/cefbjtNa9L7mXjpRxcz1zFs0TdnMsBJ7a+jESG+H239EI5ifbfjn
	IFEHPLxcby1d0zQ2DhpDEzbjJYQT1xXLOIWVZzY6rvMTMP6ErDFXyqebLDqWo8yTYin7a7iUXzID1
	Q0Ry8r2Q==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLAxA-00000008eBH-1sYd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 01:56:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-298287a26c3so60827645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 18:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434299; x=1764039099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pEsD6oo42O0RlVFVHOQlcJ30WTWABpFDF3XeUvqNQ4=;
        b=CudhNXUveBhvV70yuOCi5gj7cLzASangLpmMMDGK1ueNNZGu3XKD686tT/yW5gWvEA
         G0X+KSIcm2bfzPgtum1vP2T8u0Mthc410mUA5nckHk43Qj7yGzIuB+w9S2RLX1tXG1oi
         8ZIIXRpW0MMnJvuWip/ApfCPiDNXPzPuNrenhUeNJsnl5Qc0rD7Lvuzuo8kK7+xUreli
         nmzL9CmW4y2v1Pz0bIzO4tqY5p1XWBm6Z4ZALI2NpeR2qAHukoyczTnyG6PvgX5feKAd
         xmUUvXzB3l1EKwsHIE8zyaNw9G3vzEnrVuVMBIO/tWPCDsz556ptGWILRzBS5IZHyEEB
         VT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434299; x=1764039099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8pEsD6oo42O0RlVFVHOQlcJ30WTWABpFDF3XeUvqNQ4=;
        b=dMl+pZmf+o7egWWcOmeDKTiFiKsIc+z28rKkAqMFdmm55i9fuBV5Ee8WdqBF3yC1Oi
         GUscp5b6nRp0YdicvYbDQnmXbVdCK0hbphAsw8R0khOK6XCdNRK7yyXBAI3d/URLthol
         5YhUyQA8llhachOHFPeoLDQF6QxCQOHcd/LP0JMes5d5PPLPcgfDvNTSYJAZT3U4l2tU
         wb4ZZQYSid240E/T3TFQ+X1So58sRuf6ZshWr2uAKbU0q2MR1AMMkdMvxgjGJVgfbzee
         WmX0Ha5/uED+mez/px0a+spUysHW4V2YwkNkQlcgVLqv5svJpAZc1yw0Ziz3zF7dARgK
         JBGg==
X-Forwarded-Encrypted: i=1; AJvYcCUBM9WE3D8ntgAklppgdqoz7Y2QwRx/abIXca+uGiEqV2kIEniWnwmiYxqaKvkQ6zkBEKHrtGC0VO6jQTZvzNJF@lists.infradead.org
X-Gm-Message-State: AOJu0YxsrvS6kW82GOEm8q3u3N842W8hmFQW9FTQLbLe3vrGAalq7HtA
	kWIdlcYE0xYpcp/nUlhGaQbAxs/cleSEKs4UQxhrAmy0t2/IxAA9dPbKhh4S7MDuCCw=
X-Gm-Gg: ASbGnct2nJvrpqwl4GKsDHvYjqTGjaL0fAcygvEab/GsHBtWxMKudP8nBAp6n2yjrqC
	TZo2p0WoVH+UkxXyc/HG3nEdeGLj3AHIssXD7his/UN8m2sr5Bli9qArHv29aQdLfBmj34odYy2
	G0wrnr544cQgJEQFtijwleEeURTWJAqHWPeYMK0yVkaBJUuFxqVU6n8j58rVl8xpqOTeykM8P77
	1g2wXTIfTd/WY1oLO8mqjp9AHBioQG9fewLCioopmMo+8IuIx4A/hIrmHK1YABMBqAgKMaZf2YU
	PFFFUWOKqvYusDB8SOhHGYI+wdjpo2k0vIaZ6Xhl3QIIIpBqEruJa1Hfxwisv/vj8F6QD20Kz6W
	rGmpT4eI2O0sNqqUBKwSkaiw4aIGtAqQQ1Vvrt+EsBXAIbpVEflxUKJu/+DYscshaGHsUAaVrHN
	Vegr0ogPWeKpj/yy1ZEEY0lE6VE9s7MDymZg==
X-Google-Smtp-Source: AGHT+IEujdRH33fbMDGe6RC7S5YBADf9LCNf5v+zfV1QKs6M5jHT8KuwmXDEm96Zsr0CQ6aCRzvaPg==
X-Received: by 2002:a17:903:3b8e:b0:295:19e:487b with SMTP id d9443c01a7336-2986a6bd1f7mr197186615ad.5.1763434299069;
        Mon, 17 Nov 2025 18:51:39 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.51.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:51:38 -0800 (PST)
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
Subject: [PATCH v2 8/8] drivers: firmware: riscv: add unknown nmi support
Date: Tue, 18 Nov 2025 10:50:15 +0800
Message-Id: <20251118025015.42491-9-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251118025015.42491-1-cuiyunhui@bytedance.com>
References: <20251118025015.42491-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_015620_766982_AB0DCDC3 
X-CRM114-Status: GOOD (  15.54  )
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

Register unknown_nmi_handler() as the handler for the UNKNOWN_NMI
event. When the system becomes unresponsive, unknown_nmi_handler()
can be manually triggered, which in turn invokes nmi_panic() to
collect vmcore for root cause analysis.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/sbi.h           |  1 +
 drivers/firmware/riscv/riscv_sse_nmi.c | 68 ++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 874cc1d7603a5..52d3fdf2d4cc1 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -486,6 +486,7 @@ enum sbi_sse_attr_id {
 #define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
 #define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
 #define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
+#define SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI		0xffff0001
 #define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
 
 #define SBI_SSE_EVENT_PLATFORM		BIT(14)
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index 5035d4ec485f6..e895abf583bd5 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -7,6 +7,7 @@
 #include <linux/nmi.h>
 #include <linux/riscv_sbi_sse.h>
 #include <linux/riscv_sse_nmi.h>
+#include <linux/sysctl.h>
 
 #include <asm/irq_regs.h>
 #include <asm/sbi.h>
@@ -16,7 +17,10 @@
 	do { if (type & (mask)) func(__VA_ARGS__); } while (0)
 
 bool nmi_available;
+static int unknown_nmi_panic;
 static struct sse_event *local_nmi_evt;
+static struct sse_event *unknown_nmi_evt;
+static struct ctl_table_header *unknown_nmi_sysctl_header;
 static atomic_t local_nmi_arg = ATOMIC_INIT(LOCAL_NMI_NONE);
 
 bool nmi_support(void)
@@ -51,6 +55,35 @@ void send_nmi_mask(cpumask_t *mask, enum local_nmi_type type)
 		send_nmi_single(cpu, type);
 }
 
+static int __init setup_unknown_nmi_panic(char *str)
+{
+	unknown_nmi_panic = 1;
+	return 1;
+}
+__setup("unknown_nmi_panic", setup_unknown_nmi_panic);
+
+static const struct ctl_table unknown_nmi_table[] = {
+	{
+		.procname       = "unknown_nmi_panic",
+		.data           = &unknown_nmi_panic,
+		.maxlen         = sizeof(bool),
+		.mode           = 0644,
+		.proc_handler   = proc_dobool,
+	},
+};
+
+static int unknown_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
+{
+	pr_emerg("NMI received for unknown on CPU %d.\n", smp_processor_id());
+
+	if (unknown_nmi_panic)
+		nmi_panic(regs, "NMI: Not continuing");
+
+	pr_emerg("Dazed and confused, but trying to continue\n");
+
+	return 0;
+}
+
 static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 {
 	enum local_nmi_type type = atomic_read((atomic_t *)arg);
@@ -66,6 +99,35 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 	return 0;
 }
 
+static int unknown_nmi_init(void)
+{
+	int ret;
+
+	unknown_nmi_evt = sse_event_register(SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI, 0,
+					     unknown_nmi_handler, NULL);
+	if (IS_ERR(unknown_nmi_evt))
+		return PTR_ERR(unknown_nmi_evt);
+
+	ret = sse_event_enable(unknown_nmi_evt);
+	if (ret)
+		goto err_unregister;
+
+	unknown_nmi_sysctl_header = register_sysctl("kernel", unknown_nmi_table);
+	if (!unknown_nmi_sysctl_header) {
+		ret = -ENOMEM;
+		goto err_disable;
+	}
+
+	pr_info("Using SSE for unknown NMI event delivery\n");
+	return 0;
+
+err_disable:
+	sse_event_disable(unknown_nmi_evt);
+err_unregister:
+	sse_event_unregister(unknown_nmi_evt);
+	return ret;
+}
+
 static int __init local_nmi_init(void)
 {
 	int ret;
@@ -98,6 +160,12 @@ static int __init sse_nmi_init(void)
 
 	WRITE_ONCE(nmi_available, true);
 
+	ret = unknown_nmi_init();
+	if (ret) {
+		pr_err("Unknown_nmi_init failed with error %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.39.5


