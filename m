Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B0CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmSrMGoeJhjCv4GCZAjjQS+ND2LDsdDEjRLwJnkiGJQ=; b=v98I4h69wpPVAokzaUlRQfbA0o
	jfCR1qdl1ZbjxibKpL0YyMTjhnomskxOvEOG4ZwBDOT7gSfvUuskGelUfGY1IfhYRbQfS3fPmtzH7
	ZQGkGQySzzYzhZa+Iy+ITR3uL79XQF9U4DXanppo2mqLRlVi6tH1og7/OibAy1uontREJtIruE6Sg
	OXTwkjELAL/tZI2uVcgpt6JeePP6Hoqlyw9nFkrltySCGRXsaXNsTKOMXEbjTsDq2WZPF8Lk6eeMp
	yG1PtWFqq1nihIb+Aol7iSvxg2NfiFr9YKuINgeWelQET2yRIRyhzjRkneh7FuqOVWNRVJiWwx8oR
	pgnFt/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2caX-00000008WZJ-3pZ1;
	Wed, 09 Apr 2025 21:04:01 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB1-00000008SdV-0Cel
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-abec8b750ebso21682966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231057; x=1744835857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmSrMGoeJhjCv4GCZAjjQS+ND2LDsdDEjRLwJnkiGJQ=;
        b=Qz+xXsOE10f2dOGHNHlauz8vfO9rVWKr/EUYFBKBRt/WV0VEwpTNuGm3VWBfS9Cf2b
         3yS3PnwYdzMgronwTGBgQXIZRfiNUmdAHxsEy5RL0T3SScXmeBIa1FWoBrNh5whBuygM
         LlMS7lj2i0VA/H//KEWkD65sXyi1PwNOfSBR+BB4Kf7mNg1fJ47szsMN6VYLjN1yafo4
         oHdVAAAOh3Qa3L3L6iteN22DVUrHLwkxMKX2OsZ+ShLIKfmLQ/JH60Xd4HLxlU6LyPuW
         UnMte6bfFqly5jQmqtaypV5pxijEnbgNN5FUB4+Upv5gKsxAxR6LDq1+fM1ZI0xWmV4a
         CGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231057; x=1744835857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmSrMGoeJhjCv4GCZAjjQS+ND2LDsdDEjRLwJnkiGJQ=;
        b=syV0Whc4JpfBM7LbROjFFgJTRfo3TEkA44i2/O2bqXMV+BlLYp9OgPURklBJ9/9zJd
         LnDFqccW28zajfa0XG5yiBRY1rscbRXAo+MWtgYmamFGJqfS8akAVIFd9quqVCQShkiw
         5ImA+QqvRkK7bC9KLYn4OezkedaxudUiqYlH4klo0uq04GM4TQ8/m4XI95k9Lp9aPbJq
         2ogOYUuDKQIboSYpii8xJnpe9HAAmPY8SwNipjdsENmKT5k45wXCO9Y17hr0sgVguK3t
         6jAIJIHSVzU+t4IMn1WxYcd09v+LbfCzmtv6TQPFn/IVbiZpwjaPxostj/POeAni6pDa
         kZYg==
X-Forwarded-Encrypted: i=1; AJvYcCXnrTarvvNpECbACPLyoLhnXHc2i96APqEX0QBFGhR4wNSFn1TvgqhSk8Rs4UmmBDrRIrKQppHYMdzV/WadzL9y@lists.infradead.org
X-Gm-Message-State: AOJu0YzYYvr7H6EXKZzH6M9SSQVn0ntOot4+uGJ2doY8xOK5dPd5dj8f
	HtYSYqkZuZx9Zfxz1H6vtWj9398nnVoz+hWMDtWqROAjVsKo8DwaEa8BrbgRi94=
X-Gm-Gg: ASbGncvko1CxQ2rYKeVDMw3iuc3k50/aGqZebEWjSerFPbmzv3WqrB2dtZ0iCAwNT0c
	KMJq4NoSeG+lxz3StL/YtqkNtbDTXUCeFKi/ZKTwYJVkwevD5atx0lawbhK8Xye+0t+o3dSjfGp
	twxmDo9cMcO9NVLKlj+w4Gjg9cx+s6bBrhFGMRPY6JgDaG9nZdS/Ba+gu9e2+4M8Kav5IIG8Ir8
	hvfpQ00XidI+T64LTbsmYzW9NdleezaYLhTVC9L3UMhuRZcQR5KHMLRboOCX++vvTrOmryphKP7
	DdqyID7v5MDhXMkAUWLQYHdDdtNMD5HVREC8l9K1a9LCf2hX252c+H1LcZar/UX2mJVjrejhLBz
	amN2b10XawLA9mkljmlEL8Y25RtV3CYHBUxdp9Q==
X-Google-Smtp-Source: AGHT+IEguQmAOmJYZ1+smy8DhSOYym4o75iF/puDiUuMJfxajIedLWJgLrYqcjqdKMU+je2OXAl/OA==
X-Received: by 2002:a17:907:968b:b0:abf:7453:1f1a with SMTP id a640c23a62f3a-acabd2594d9mr9093966b.36.1744231057321;
        Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:36 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:36 +0100
Subject: [PATCH v4 15/32] mfd: sec-irq: s2dos05 doesn't support interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-15-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133739_086295_825CF85F 
X-CRM114-Status: GOOD (  16.35  )
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

The commit bf231e5febcf ("mfd: sec-core: Add support for the Samsung
s2dos05") adding s2dos05 support didn't add anything related to IRQ
support, so I assume this works without IRQs.

Rather than printing a warning message in sec_irq_init() due to the
missing IRQ number, or returning an error due to a missing irq chip
regmap, just return early explicitly.

This will become particularly important once errors from sec_irq_init()
aren't ignored anymore in an upcoming patch and helps the reader of
this code while reasoning about what the intention might be here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-irq.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 340f5f14eba3fad3b25935803dd33e91f7ec6629..79b4f74b05a24e413a84ff8c0b16156a828310e5 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -452,16 +452,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	int type = sec_pmic->device_type;
 	const struct regmap_irq_chip *sec_irq_chip;
 
-	if (!sec_pmic->irq) {
-		dev_warn(sec_pmic->dev,
-			 "No interrupt specified, no interrupts\n");
-		return 0;
-	}
-
 	switch (type) {
 	case S5M8767X:
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
+	case S2DOS05:
+		return 0;
 	case S2MPA01:
 		sec_irq_chip = &s2mps14_irq_chip;
 		break;
@@ -492,6 +488,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 				     sec_pmic->device_type);
 	}
 
+	if (!sec_pmic->irq) {
+		dev_warn(sec_pmic->dev,
+			 "No interrupt specified, no interrupts\n");
+		return 0;
+	}
+
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);

-- 
2.49.0.604.gff1f9ca942-goog


