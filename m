Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53E3CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLtZQAdEAm9Qpl1KbOMuUjIonMp2MqyrH/XDjYnJ7DA=; b=wFqz+Th1bSo8DMvEe0S0UkL+y0
	uDtVJqTZXrZZu6/8ZatpzYNlKlggGohYZwyLGohCCdymtOneRMXTBLhRGYWlZg6vbG5H6f/MjRdPq
	amAoLb8l1cD2LbnbIRQT0SqNZf4Gl2AJDsxaKd/hdzl/0bqXE24BMrCKyI1ML9SOUdp/bDwrDed6Z
	d6hF8l5ny32ICfoxLLUoB1cC6RqsPhSh/4CqETC6RQXjss63YgVImF660umEDVhG3MOZs7iTdz3Ur
	KvB9IoiUzl2oN5pEl9IBOxEqPIbdO1AmUla5bMReeVgZXcZJZsXTBC2HxYFsNYa/N6rw/dkONTAg3
	QLDGRtvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvabr-0000000GqQ5-0S0M;
	Mon, 08 Sep 2025 12:04:35 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYgM-0000000GDqB-3A12
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:01:07 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b4c3d8bd21eso2595494a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325666; x=1757930466; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLtZQAdEAm9Qpl1KbOMuUjIonMp2MqyrH/XDjYnJ7DA=;
        b=KPneBzU9jT0hM+d8Agn/e4QaET31gukqJP9/LzQHABarPgNmnBsWGrIDkCcF0Qflmh
         kO4trJdiSVeLFIALeaSXbJUF+Cap2WGi3d3BW+DIgmOoF4brWV+O3swK2wtS4Wwohio8
         NQfydVlxMuW74Bpd3s2BfU41bUrnrtPGBFaBXz8pa2l51bmOG0gDVV7XN7GL0ZtUtaMT
         i5cBIEOG3m4ogZbKKO1YxRzisG+qhsuQeB0/VTrUhoiBHx+o5Ab3ToV2PrPJOvWIQN0m
         WRXZaMB7IaVm/apXo40MFlRzhcROCYFHAQJWg1quHhzJK/ysu6qxFtepVTfFiBI8pNsG
         jUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325666; x=1757930466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLtZQAdEAm9Qpl1KbOMuUjIonMp2MqyrH/XDjYnJ7DA=;
        b=V5/toNyTL/WHY0IQxzcit5Lj1A09yJwBmNcLx/txbsrnqddUBPmGSXsX9ecVMuOhXU
         Gbk9YlNfpEqD0besWDeMxRU2kiQOF5RL2IMt/DNqibQrLXFGJ/YgoSn76M9EfqkFHD6j
         uubafhsuIkI5s4BIri9JTBInxDqb8s5zDmvPv/HcZjAnjTotJ3oVuaiFm+RPRYzmYQUV
         dozFWEgciysKOpZtLT4Y/phd/urMzQOYzWC1Sv0xoitMqzy8L15v3qSajLMcgOWYgmyN
         0Wca9JvIfETMz9GjDyejV8AE5uaZExXESuwJt1yKiKM5jwrSJJOtxWeuE3wAF2nSfjuP
         RfxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbDjyfrolcrmTA1KIc1MlGI+H282PrrMKWGDq4OgHLbFE+y67AS12aSrXBb2XYCTLa3uOJmVB9h5wQsrZUIniA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf1D2PzZ5Rom6kIL+FacPzLFvXnDrDkKu+OrJjq56jXDk9NujH
	PRWNcU/PNOXrqRJcjdD1kc3Ng7URKOXWKLPGDgckFWUMZnfSIhIUrqwr
X-Gm-Gg: ASbGnctmF03TIj7rbb8zT0pMqeC0DuoqccgXTMY3IBYrYE+JhPQRAeyc4vEBKKaK/HK
	wentV45fK8B4SKPpZfVD6Th//smqKNMCcCU1A1TPAoaiHqeAS1JpdFZCqmLR76KsX3XbdZS79QI
	56XM8Y6r8EVPgxCDt07viYOWQ7p8tAcI45tYBhpEp/Rw/pBj811pQz8NYw9lNCXsYwHWxwJiR/3
	+kla8odaCBkwi/HT1GpH7sNam45CBfkx2oVjGcFvoA2PIP/5951EeH8DCJyhDPhqEI16pQ1OE1T
	7zTtKgmY29UMz9WMQuU3wi2KTl4gJZQmZ+oBfarkwx3vBRl0a1Cq0aTjEUqYklOFFzBwoaJ+WaN
	nNw7xedLsnpME5g3Whv9xAwWpd52hM//bEiJnaA==
X-Google-Smtp-Source: AGHT+IGWWHiKtpsu2QdAXRL82r5j04D9+oNux4leyEfdfdI4Mn5W+IrDB1mcVdqQVYqmtjY+ExOHSQ==
X-Received: by 2002:a17:903:234a:b0:24b:e55:34b with SMTP id d9443c01a7336-251722922c1mr123807425ad.31.1757325665919;
        Mon, 08 Sep 2025 03:01:05 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:05 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:29 +0800
Subject: [PATCH RESEND v8 05/21] drivers/perf: apple_m1: Support
 configuring counters for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-5-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=C6Dad8JPpdCuqjz4s5GhSEa3XOS5lpXoC8lCTSueqRM=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlD3N+SiZMRkNdtDE0OP5I9wS4J2cex7dpSE
 Foy/InTsRKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pQwAKCRABygi3psUI
 JCWjD/wKCDBrxnc0BnXSw+ySFzk06gEQT9Hag4HuvuMWKisRlL5pPvn9ri0BwkHcfdJ5TlgE2GU
 MFmEaXtrAXUNG8jL3DDiyBpeZWjLiQZo7G5ckwlKp7S6WDdPhzwFlb5TOsHjg8VUWIcf9wJUm6S
 7wwzd23QfpnMP7k7xvALkJ4klG4koXG7ANuGbnSav7Y3cYEF/MgPaTUm4QyZt9pk0S4JZnZkN3d
 x+8UrV/pvBaSa7osMjj1RTU9ZCiQeGrlmfBo94vzdLy0i4oKzEb8RbkqXObHRaU8jc/9wR9a+YD
 y0SIRETKPpwYOxgkDBvhouVh2PSdEdO8DOEMsj7CNCdrdHmKVrzCDPNiAh8rsuZr9Oy/FcYBHDW
 3KQ70JA0oB9I4xFyNBLviFDzWpHAgYqoo5DWGICYAXBRTsx+uGIP+GwKt/PfTrz7qPAhhkRREvr
 lYvPajB2umqznZFQZY8R1bGCnJEyO1qf0JAmj3zOhY/536/hZFcKZfuUvIlQvtBt42g5pExCIB/
 nEMdo5Jbd3O6KU03jndXs5JNcJMKVRaZz2embvJlhy7ksrmAbb3R7MNKnLwAchDndToqG39uxjv
 zQbZ7WCDnPuMTJFCmmoIZ35OhcLCLNBtRcw/T9YbsCXG5QfVcyn8KAhmau/+NxwegBZPke0tG+n
 Ko3+GvN1XAO8cZg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030106_806239_221C064C 
X-CRM114-Status: GOOD (  11.53  )
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

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/include/asm/apple_m1_pmu.h | 2 ++
 drivers/perf/apple_m1_cpu_pmu.c       | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/include/asm/apple_m1_pmu.h b/arch/arm64/include/asm/apple_m1_pmu.h
index 02e05d05851f739b985bf416f1aa3baeafd691dc..8a667e7f07a517419c22a4f930947347be8546f7 100644
--- a/arch/arm64/include/asm/apple_m1_pmu.h
+++ b/arch/arm64/include/asm/apple_m1_pmu.h
@@ -38,8 +38,10 @@
 
 #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
 #define SYS_IMP_APL_PMCR1_EL12	sys_reg(3, 1, 15, 7, 2)
+#define PMCR1_COUNT_A32_EL0_0_7	GENMASK(7, 0)
 #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
 #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
+#define PMCR1_COUNT_A32_EL0_8_9	GENMASK(33, 32)
 #define PMCR1_COUNT_A64_EL0_8_9	GENMASK(41, 40)
 #define PMCR1_COUNT_A64_EL1_8_9	GENMASK(49, 48)
 
diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index b5fe04ef186f04b4af32524fe433afb79979b791..fb2759069fe9e47146f0342fa46e40f3ab836926 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -348,10 +348,16 @@ static void __m1_pmu_configure_event_filter(unsigned int index, bool user,
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
2.51.0


