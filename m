Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6728BC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 01:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYLyecdN8PG1dIKA7P3TjdSo4FSHEY1UF26fpLNtgEE=; b=l/0NjPUAbmsnc9OgWQbjKwsxnz
	dhhrTXTeJ3uq6XJ6OZoGm3QCKUPrdET0DQtLbMqu/oO61e5SELP7km+XebA1f72omuNL/1brsho4r
	U6250uWJIajCFeLcq1lPZUG1Wmp1ZPyNX4Q4xokeqiEO8mRkCLL0PFe0Mk1EgK8MwL5wQYYPe00Do
	MIQ1ZFNEDhOMSQ5qeVtG89fb9QVipQ4nRy6TkPdPQ+iG94J0vz/KBfdB5nU8pJL8H/6sI7ea2CJis
	YPLj/amn2pECe84nCgufKA7GlPbQj95YVPzLQCRu1iejoAP2b/fRFVnJAhF8/fDkYrfL5l7wjiYyP
	cmnACkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyv1-000000036ZV-1GRb;
	Mon, 16 Jun 2025 01:45:51 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyi7-000000034FI-0Wqg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:32:32 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b1ff9b276c2so2514839a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037550; x=1750642350; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYLyecdN8PG1dIKA7P3TjdSo4FSHEY1UF26fpLNtgEE=;
        b=aOa9Mwi4Sy50R3NF6NDMuvtQqRgwfAGNYRFbbiizle7PKcKtZVbvcsFU4Yj6QEG0wl
         LnYNei7ddrb3SP5N+R9WUQi5N/PQywOHzCcXjkp2R8XHZXylkFYH5SLEvEElonAorD+3
         40G9W3bPOnAE2tv0Ph+bp5/mxm2lvaEW8Z3ujQpPdtrOlvsechA762CPMeEP7rcpGvJb
         N+KzIYUteRpsildWI73BEIQEJn8iUJCn/xDj+a7+blUxc4qANojWky02ANvoKROlQrNC
         QQz1/13XENOPEG9CduELggs59+xHV3avsBogfeX6I3xQS7pOl60tdTkI+D4aP5Cowedm
         XJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037550; x=1750642350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYLyecdN8PG1dIKA7P3TjdSo4FSHEY1UF26fpLNtgEE=;
        b=ovGacbR3serRa7Dy+DD6nTL3XfZB4PAOx4If7vG1OYfmn0q2KdH1XnxJ9w6cyf5pKu
         V9XiFfyWCffg1YfnfN/JhZoiknAagL2Sx4YH8YJ7fBio8Xet4qW65HtY9y7B7mPoaOrm
         G35raRfvyUPo7Jvrunj3+fMknL5gKk+uNDFbBT4P8y3wuXRgoqmqqtTglL6ZVK1h/gXs
         0qsO7F0gerqOgsrPB/apkAtPRYY10GqlY/zPYLBDKfqThztxoO+y54O34YSkGkDVNaZn
         9C/R6hfXnaUd/iVhMcRv/HYVMme1A1nOeWu7+vut2yNgeC8uwbszX2jETY/pTs7g5rcY
         TBng==
X-Forwarded-Encrypted: i=1; AJvYcCWSNKjmUbN1rjA+KLM1JSiEVtUoEXHeJo6iexUOUzscZczPERtXcHXtPWgtYtS9jr9IPop5LjEDOSVpYRRoIeMJ@lists.infradead.org
X-Gm-Message-State: AOJu0YykoCIm1c/Rr6GIKW1tsR6LcROAnqcWD1QJU3bcEL8Ym90LVUCR
	2ggXO73AzhBVNiKzm7qWBqFb9a/8oHjd9MGmhzNcast4LllY7EDv/rvW
X-Gm-Gg: ASbGncsh+U1RMcJH/PT0WG+HIX3j8VbhFSpgs0BwY/3WiUL3mcSptIPSJZju8l+Xhx3
	qXSTgqr5f+AP3efunJSJgDVnwqQhB2KVwDoYg3F0jJhXiwc9qB2o8zg1BhFO+jV6pL52A7+1MUr
	bLf4p41TOtooS546gYATY2u3AY5JTTbJbIyS1tUd7NxZsGeIgQjkSm1gwGSNbHs7GuHvq8M1UzC
	rUVh9JhzQh9kewXDZwGqrL30kUfo4f7ZQ1coy+qlW3o4TCn5TiWJbr5+/8+uzZJalv+w9Lt4XNm
	q6WUXoa21z4ZQPudvMaouH4KauG1lBFBCVJA5iU1UbLP/slKWsbgbtDOJoI4iuqzXdlbBDRL1wD
	QcZg=
X-Google-Smtp-Source: AGHT+IGJJ404MdhopvAsklaW2cdxTGKo+Ijhaz9bo4QVbFD74MouB0Uh+CgOTxR63fmMk/rMOpxDPQ==
X-Received: by 2002:a17:903:40d2:b0:234:b41e:378f with SMTP id d9443c01a7336-2366b32ce2emr119407695ad.15.1750037550343;
        Sun, 15 Jun 2025 18:32:30 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:30 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:54 +0800
Subject: [PATCH RESEND v7 05/21] drivers/perf: apple_m1: Support
 configuring counters for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-5-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=4vsiGjbxOOsY3kUJRZG60u58GR8XjzbCD4n5XW1wFKA=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QXpl0G9A8y6Clm896pAqkSYfH2CNDTrdpBa
 6NDMkfcay+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FwAKCRABygi3psUI
 JFJQD/9lj2VhihWbCDTG7QEYwecH/qMCAlVbYPTHDaCCsRIM/0V2cdwEPObj9l5MTiRZEBHn3XO
 8EzB0wArSxElfGNXA06UML/X48GClRu7iJ85hcHhuIx16Va8AmRiivOG2aerFJtJeEPWt2QSy8z
 9qZ89fT6D9reastcBEaUAK1fhzZShJFvC14d6oXF3+6vtv42eUNO6fuXa6kqkoJ2AnV7iZANrhw
 TwhduTT5F+LVZ+SRUtgeh8RDt3RY07TY/z9XskHku1dQ+1d4w/+3IqtyM1LpdoodMtTy8PB+bzw
 JjhluCWSaCEvRT+4YOXTaTEHLmZkwWeLbgvo198EVSeg1MGCjyWuf7WcbQ7Ml4f7eUvcEcpYNt8
 6QOLDFMNiYWNZUBjjneIkjovBVves5XZaJtorPv180klZaJtw1uANhAayh0ZvtZYB4alYHigNjs
 dhGl5mhUuUrIwt+TRsj1dxMXI4w/FunF1Cn2C3Hu93iqTVRMCOGQyDkgI3jL1BYQMaU/PFKvCsi
 Injkb/kfVNODwy8gAEs4Cas6gJxsTY4XPVrVQyLWO7WvDS90GkHuHRqIrF4P1xqr+LLrWaLVgIj
 zf2+nFLaEEcMLy1R4gIlpLEtrVEBUBNkYmhXVez8l5zL2nyeLLFMeJ994BsTfdtyW6ukC6SByjl
 cwB4rQU7i8OYMTw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183231_168026_62A02BD9 
X-CRM114-Status: GOOD (  11.62  )
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
index 02e05d05851f739b985bf416f1aa3baeafd691dc..6e238043e0dc2360c4fd507dc6a0eb7e055d2d6f 100644
--- a/arch/arm64/include/asm/apple_m1_pmu.h
+++ b/arch/arm64/include/asm/apple_m1_pmu.h
@@ -38,8 +38,11 @@
 
 #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
 #define SYS_IMP_APL_PMCR1_EL12	sys_reg(3, 1, 15, 7, 2)
+#define PMCR1_COUNT_A32_EL0_0_7	GENMASK(7, 0)
 #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
 #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
+#define PMCR1_COUNT_A64_EL3_0_7	GENMASK(31, 24)
+#define PMCR1_COUNT_A32_EL0_8_9	GENMASK(33, 32)
 #define PMCR1_COUNT_A64_EL0_8_9	GENMASK(41, 40)
 #define PMCR1_COUNT_A64_EL1_8_9	GENMASK(49, 48)
 
diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 35a34eca403384c4908c2bba2f8186ea854d63bf..6736909a7df672a08938a392d450dc9b5b7bce9e 100644
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
2.49.0


