Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D525C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=; b=A7IRkjRb+AmRF/kCEGjurVAE6D
	8ctg/yPV1qBq8wCm4+boIqxf1jsoM5Ad0662GWmTpD5Vq7F99UN4URcU8BxZH9KTEGkOcQORndj9B
	UZawiZbSbA7T30OR1iQBp28hGGtALcICOcOYnOg5vbIN6cpc7JEiiKLiiXXzBXwENeklCjjXrKKl3
	PRz1NZmlUs8f0EnWBYp2Kre6v3d+ZyiGdRy2U2Rc7ubsFf6hjvQ/5vDcm1IvX1dtbuvvNH0VfXyWU
	QSyb/MyruQkLRZiklmy3pj/lssbqCz6RcKUfNtG25tZgD1vU2eaon/QAmaxtswB3Ku+fNz2gis+HY
	7gmDDqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwpC-0000000FBFP-2Ete;
	Fri, 14 Feb 2025 14:37:50 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwiI-0000000F9oI-07DE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:30:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-220f4dd756eso11059745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 06:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543441; x=1740148241; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=;
        b=DQPXgOxMHaYLEzScEaZdHm0bhb0JxqmcVdhciwS5Bbf1dtCP/pGajLzMWGjuwy3ZSB
         VGDPPydxP2Zu7dK1VFaZYZ+srn7aZi+IKDLXT0At+ERkt3H9Su/cXNvnsxu3xntnGZWy
         +Xzlbsl7iBblAT/D9JNjrth2OyG9LOEnjC5pRj2ll5NDkqYZTH1xnuyLoQvrrDotRYWq
         V8D8RCGHV9MAep5HAlowjOrDIxQAfSvm+xnImRMaBfgqmd4aXUuh0lEErwadH/sLLoFT
         QaKvi/SMpdquipvXWDu3Lug/X/GpJd88lOainVPeIjk1xigJ9/Z2wi9c3zzODv3oIw5U
         F5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543441; x=1740148241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=;
        b=igfrO8XhjdKGMAOadMZYoNN/HPeZX9bMQGHdAZJT/TFTDc3TvBHRoDKh4kOQEHCYtw
         IBkc812hu0wHY+G6UFEt2RldgLC3JL+3oN2j2jgsUhiuJxN5ztk+YtRMJJ/o7sbkAatA
         /7eg99yZM6hVS9+jktJUXYuympLPV2bs1UVZ7MxG3Vo9ppvb/PmbhiUuRPBBa5lfCXPJ
         Wv0aJ4MMfOgMnfl9zCc3Y6T9InYnLtbqqTqNXwnP8VE/2vygLkjqC0SztGu9mQd6VQNk
         KHnE7tihcg6UT53KY754f0JdyiFnlOytF4wLXOSYl6+dfN4mq1DTvmCDPvdxwkW8BxyE
         hklg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ327XtolIGVNn49fa+YkopHNbvzrUA0xMiQCkan5vPV7F2rsReDbqQz4j3UoUPdZG0rD2nYODMwjmkhsAUyvf@lists.infradead.org
X-Gm-Message-State: AOJu0YxGtUeBSVgO2wCylX1yEfmMRujgmE5y6Gf3wND6BKZUYJ6Y/wA3
	lt3tRe+bgmSstb7qUMrRXIy8I6In3OzjYeQTPsNS70WmJOPaVfMo
X-Gm-Gg: ASbGncvVxENIYSlbUpFFJtAtLYrdylK9sl416AS/WrOonjqmL9T7GIOa73B1Ozcaf0G
	3P7mzVmUs6IKPoTGXaxX4c2WjlVdAHUg/umWTMOilW/KTGv62Es5ApVXjAo2xvubmew5Bs/h6M1
	lp5Mz8mlje7SeubxDpZSW2QZGmm0oyDvEFWmYoyCoOui7NRvYSRHwSbYCgB9cYR91fW4xZqxqpT
	cyoU84/ptWYDhVWBgXrWns7bq5TJ1zSe4RtEx32mg6IYxiU90Gs3sp32j93GiJrMJ8oqPv0/oRE
	OsMA8Z7KDje/z3d3rA==
X-Google-Smtp-Source: AGHT+IHItG+fJEC1v2jw86RiUwqBiXRX/eR8U/klOPF6QDGyKbVKG1IeHvzHzNB21irjeh1NLw3AzQ==
X-Received: by 2002:a17:902:ecd2:b0:220:e04e:7213 with SMTP id d9443c01a7336-220e04e74a5mr92641655ad.25.1739543441461;
        Fri, 14 Feb 2025 06:30:41 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:40 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 14 Feb 2025 22:28:30 +0800
Subject: [PATCH v4 04/11] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-apple-cpmu-v4-4-ffca0e45147e@gmail.com>
References: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
In-Reply-To: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2104; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=JtntoT+/7KJ8q2fmzw/EEFzk/pZROlC/KV344Upuyvg=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1OAVGEnzQZGgBLLYROuakeok8cZ6GoDeANer
 886jpv7ZkmJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TgAAKCRABygi3psUI
 JNQrD/9f269MjZYrwrUDFvUQJBrF2mmUvB+bgJ2lDAEEgy0lfcigPi/R5ir83D7epKRHh1as4PO
 3fNnv7iguos1pG5k7ymSqV1wn45aTo1XwJwt23CmijRdhuZoytqDk9VoC7EcYF07Iqo12PaTbuh
 6to9jSyEgfsw32TzrO3eousDXWR8Sl2w4tx8ejVqwqBnLFcuzm/NEIwcAsPZjdU1nikKTMK+2GJ
 NXQ4lngoEJKdNnbi6kIdFos+BRDe/5T8iWq/juGbhxMWwfWeMzpBFFMybJrxiIDi4sZgQQyRFvU
 moSHV8rLeYaSwvYovYJsTDnZvqk78Ig5tCPnZ0fRkJHrg+3TtYdIvtSu5kygB17dWg8CHO32ZPW
 pyuIwcbTRShMMEcr4U5RKjbi7xchiiP8PLcdUZ3/F3iQe69QEkwGh9BOeMLOXVrU7GfAlvN9OT7
 e3HhlsfI3/h12xxUUX2Ws2AUBufWGAX312kaBzw75olaqaI31x6vaQGreCawbR32c1qqBK3e+xF
 pNCYzioKnd9Mv2SvsLc8xNFiIWNYN7d5fUOjnhT5oElfeY+aKcfRTpDqq071JkeqRPpIRDiMlpD
 FUsXRsY2iYVOJzcYH3b1E955q0IT1/RNf3HGaFBAfDmLzfMDMLe8PdGAvE4HSsEbtrx/yFTwFR+
 1PXCB7zP7CCaCyA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_063042_061226_E0043B23 
X-CRM114-Status: GOOD (  11.93  )
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

Add support for configuring counters for 32-bit EL0 to allow adding support
for implementations with 32-bit EL0.

For documentation purposes, also add the bitmask for configuring counters
for 64-bit EL3.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/include/asm/apple_m1_pmu.h | 3 +++
 drivers/perf/apple_m1_cpu_pmu.c       | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/apple_m1_pmu.h b/arch/arm64/include/asm/apple_m1_pmu.h
index 99483b19b99fca38483faad443ad4bcf4b85ef63..75be4b4c71f167a6874e22b38dc7c0bf30d25a47 100644
--- a/arch/arm64/include/asm/apple_m1_pmu.h
+++ b/arch/arm64/include/asm/apple_m1_pmu.h
@@ -37,8 +37,11 @@
 #define PMCR0_PMI_ENABLE_8_9	GENMASK(45, 44)
 
 #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
+#define PMCR1_COUNT_A32_EL0_0_7	GENMASK(7, 0)
 #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
 #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
+#define PMCR1_COUNT_A64_EL3_0_7	GENMASK(31, 24)
+#define PMCR1_COUNT_A32_EL0_8_9	GENMASK(33, 32)
 #define PMCR1_COUNT_A64_EL0_8_9	GENMASK(41, 40)
 #define PMCR1_COUNT_A64_EL1_8_9	GENMASK(49, 48)
 
diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index bf397fd81230007dcf52888f148e3158dc02e29d..73ba9861a15ff931b5e388b6d809dedb140e2292 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -335,10 +335,16 @@ static void m1_pmu_configure_counter(unsigned int index, u8 event,
 	case 0 ... 7:
 		user_bit = BIT(get_bit_offset(index, PMCR1_COUNT_A64_EL0_0_7));
 		kernel_bit = BIT(get_bit_offset(index, PMCR1_COUNT_A64_EL1_0_7));
+
+		if (system_supports_32bit_el0())
+			user_bit |= BIT(get_bit_offset(index, PMCR1_COUNT_A32_EL0_0_7));
 		break;
 	case 8 ... 9:
 		user_bit = BIT(get_bit_offset(index - 8, PMCR1_COUNT_A64_EL0_8_9));
 		kernel_bit = BIT(get_bit_offset(index - 8, PMCR1_COUNT_A64_EL1_8_9));
+
+		if (system_supports_32bit_el0())
+			user_bit |= BIT(get_bit_offset(index - 8, PMCR1_COUNT_A32_EL0_8_9));
 		break;
 	default:
 		BUG();

-- 
2.48.1


