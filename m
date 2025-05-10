Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C14C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=; b=bo3sE8dZEul40Gr03IhS5mF5lT
	5mq0etunpmFiFx9QCSDTQr9TvkuzbB7N1gnHtPODbFQHz8bHxiFoKg0iEJu5z7gfwvI2t2wj38gTO
	TpeBDNG/FBMMQcewvwCph6QHT4L58iMF/lyKjth0GnxgCCKLjQS5mTJL9KF4qt0toUVZW4526a0iN
	o6Sct8exT4f2yACBcen8qYvL9/b9iUpeKjeevD3KYn1Fyo+IgxNSvftlJuqiwd+KJU4Upj/fehmmV
	3aWNeJ2ZAkAud44jthsaSDHZ65wZ1BmZJ7Ve83NC1PSbTyO3TStqbwmiiFvtWLvWHN4KRcCbUllm/
	NFF9ov4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlxa-000000065DN-2lfx;
	Sat, 10 May 2025 15:17:54 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlrU-0000000644S-0r0V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:11:37 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-74019695377so2332563b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889895; x=1747494695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=cfpI+hotDtJ1XLBKjtPhbTtkSAninPIq7kWgNoKhbKn6t33TmQE/haRjbVLWFYjVWd
         pM5CPzKMrXc0ZIwU7TvvuHTc2SN7RB6bLZQ0UoDOWJShC91vH1OYKrgk7UFQHzEE9KLH
         PndhglpPPBHrBNeF92/cAFKywRynoQ7sEJ38AYz2k+iiAmxu7Prm6SYbWp+GEIFBy583
         B7IC1Y7CMNZ+V56DSPqYkZGGPT928bL6hn6J0J+JS+aOh1F8FCkR5YDcFB4yQqn7Gqyb
         iJNoE7S/hHzTS4WKP4P+GaotEAtLwIW/xEIwGxuOZ9mKgyfqYz3m/b+lIjx2Bz61C1ra
         9qUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889895; x=1747494695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=jZZ/OOHomg/Q6pKq01J8rz+HAHPedpuWuWxdPUPiPE+ZiidT4y55SZfbk2tbc03W0D
         4l/9cNiuq0JxKSENzD6xdfKfWcuRPgPZVOzEkCraEIzmQ5+4FoFHH9AI9wcNnVzQoGj9
         lY9ldjbUReVJni+4jh4RRCUKGz7YvwpShDsWU3mJ2QBADe5j6f20iDMYXJ3yQUBsxuI4
         3OuwH7P0fgzgURkkekkQOHfhDB2X4p4A1hq581RVSOUFXwF5g11b6iH7NjLDhT5kMJ8F
         irxO4Y2GENjwa8Ou9CnGLUE32tnnJb+hHNvkqEX7D+79QS241MzNvt6GyEFbidGum8LS
         3oRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUobnVChM+gx5tjCiwNt/1fkYW1Bl53AAZfDrda2JrZNbGLZ691LchAgET16jW5pUvxcwTJk8dVgWFIS11IrY2v@lists.infradead.org
X-Gm-Message-State: AOJu0YywR+4l5wkyrVeVQ/RQ/Qfuwpml5a9ToiMBXtEg0BZqYYam0ERH
	GHKK3NKa8Sgf5g54tnJtL7WIMUH1JWDeZ9RjWRT0YW4e1VfBwv0k
X-Gm-Gg: ASbGnculpAMutF1pgMp2IZnXpmm2bq2WdLW2LDfRV4JrMkW+kZoq0ANrBG55s6KxXP5
	57Fe7UiyJvCpkihN/4ktskme41RwY9NyPOl+ZrA7cYQFzxwPBpbeTN67TMJ3FiwZ2nhCQDiIwqi
	BVvdvHkRjkDibznAmfp6LR46YY04FPe72xKPr4tLn0s1/FwLAB88tSZC7Sh0bOkWuCgtg7p8B9m
	iKsTdLsfrXTVEYOiMHNhaAS/gkzxV74Vfdp8lSKaTAMhDdlIy8MMh5ncSlNvQaHw56vPjHwLJkB
	Y1WYucH/f5gs9t/z5Wlm71qDTYidYgDoVBwXJIqVoWUKdwN6jqApBg==
X-Google-Smtp-Source: AGHT+IEpcdU2W03L+ngH4AWr9L0lLRQkWIUU5gRbEMYis7/i7CZr5CfIxvk9oscXP6NkX/AWz9ny+Q==
X-Received: by 2002:a05:6a21:6485:b0:1f5:8605:9530 with SMTP id adf61e73a8af0-215abc1734amr10948928637.28.1746889895444;
        Sat, 10 May 2025 08:11:35 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:35 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:43 +0800
Subject: [PATCH v7 02/21] drivers/perf: apple_m1: Only init PMUv3 remap
 when EL2 is available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-2-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=Qn+UBxFKpVtKUsbAnfhiKrUYfNaGPfBOlGOEhF8eJS8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yav9dcem4A4esX8WAldqGX7YwMpYCRI7OOn
 3K7b8i2BX6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smgAKCRABygi3psUI
 JLe1EACLtRiC5KVJXJwXQjR6Xb90p8ucZZefv3oZsoNIBadLSFhJ8NJIXGk6/RcQiTB76WSWRcM
 O7VXYLdMVE3s1XAlg6KISddaztrqNc+lUCiBvAjp+GYPw/QArSfcSa77jH5cON9XvFq7BjlI+CD
 balJfX5gfKBehIBeNZUbVanuqxvDgPe5kND2ER40WAJXclW+kF52eBtHXkrVsZHBtjxUv4RrlHA
 4yV8pXtk0qXOyu5xrmr8Zb2fBHFbKznsWfFPGjFSMPNXnWN3kwbYrenSr+c4QbXFb5iSh9ssH1c
 pdkij9B4LovNDVzSOF0mGaAxnPPAl08EcQfDMiMEvLm8U6xuxiVEZsBIB2UmUhuTEn0NQ7GWKM/
 PxxG6Mr7pjzpNxy5h8Yu++0Hu4PVC63qyBIyrmeO+FsZisAbij38AacFSCC1b1p+phPN2eCkpef
 XFFgjfTIsFf9wO+4wIbD3QB90583LrpNsQ5YOLLLZxH8+WX8s2RF1/rWPfOqw9e7TmZHV8mvbff
 D8LIYSW6VSYlBUwuG74drWhuvONC55Oxy8nd7JdAhRaKCDwQf8No+mnMl32+2Ow6wfwyAxZLR7G
 jFCr3J4Trd25S7w+Ywugz4Vq2q2LjkHr9JqZvfAyIVW/FqtN7wF+Mj3QjnuVEvSmqni/HEMed4J
 0qIAWTXJlqHHgXg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081136_247754_86086BD6 
X-CRM114-Status: GOOD (  13.02  )
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

Skip initialization of PMUv3 remap when EL2 is not available.
Initialization is harmless in EL1 but it is still a weird thing to do.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index df9a28ba69dcfad6f33a0d18b620276b910a36ca..b800da3f7f61ffa972fcab5f24b42127f2c55ac6 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -646,8 +646,10 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-	m1_pmu_init_pmceid(cpu_pmu);
+	if (is_hyp_mode_available()) {
+		cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
+		m1_pmu_init_pmceid(cpu_pmu);
+	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;

-- 
2.49.0


