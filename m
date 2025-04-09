Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746CCC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hW0uMB23s6rTN+79K6wuOhxoVdGvng8abYobjgd2dY0=; b=H6QS2jVxcMb4SADdNPwizCTh60
	5AdIIJYEIk++vpbYeWK8Vaz1PtTsQ2HnRgCmyUvbdtU9BHSaH1w9M+wdjR5AGnW9cKt3W9LGCt237
	Gujoe1cZgsUY62CjonhM6qqbm97vUsKu8jdaGJbjadUc7uJasEf8AKyWCODZ+RSx5cHn2XrH6osq2
	dpEfAAZChAH0w49km+pOzkr8FLdgktoME8yTRyc1G0cCmeFTG/mEdEiK+d2hYQLEUB9X+SstTUnn+
	+4BAp6diuoGWuEjFha6nJ+WfDRHkM+J2UZ+iqr9YcyEvk8qChkWIH4Hgu6bCvNTNJ8QUrqAVTWoBM
	hK1m3bIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UqJ-00000007C2d-2lte;
	Wed, 09 Apr 2025 12:47:47 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UoX-00000007Bqe-1bY7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:45:58 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2243803b776so94035905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744202757; x=1744807557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hW0uMB23s6rTN+79K6wuOhxoVdGvng8abYobjgd2dY0=;
        b=dDrgxBSztybArz2l7yuny0YJl+6BHFe6wH/TFWMXGfucOKWJRImptFPvg4rwQ2ahGd
         9IIT/ZwVvd157mioyw4DRlf5tv+M5kW1A3EEKj/M7b8aBKVqFuV2GuOoXaDKhCdmUZ6N
         aEm+A+8Xro+bYuUUfWh00L3KS60ohSiVpZytKf+CFpoxFuUyt1QR78EtSq92tnm4jnnj
         AObZrdV5dzVinEenEsxZ6qPEAcdlwpVpqochhVxO+6BHv30/Hc+PInc/mY5Z5DaNf+w6
         d+QjtkNSICngo7zKrBvyWeE8+Ll/pBQdbq9QjrD//G5nlT9/BSNXOjbk7Ruv1TThrZ8y
         fv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744202757; x=1744807557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hW0uMB23s6rTN+79K6wuOhxoVdGvng8abYobjgd2dY0=;
        b=eQQsZ8rPcCt5c4E78x1JcBBdsdXNZL/6oh6VLbqgRS6TlkCnuLAGOlj+lU6jtf70SU
         x1EXXjdVVo46g99DrCVn50H3z3EeweWGlrA/Bxf7LEDMKfMAILbhOqtHCvbsqrNtgEEi
         d3ECSANBgk5qgcr5/ASu7X0A4PSMX84/Xb+cFQPyqIceYz6sa+eSVunfxkbFnMqmm2d5
         W2BciFTBe9YlP5uCzwip1GEBloexYgwx8aFG3PiZFaK2ruKgOzQ2yct4c62DtqFZf/oy
         VigMuSruHqc/GiaJRFRwD4OCSrrTQj5b4ao/rI5S9pFaj6kJHPtL3DIO6qgtMLo9YuDW
         uRwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYizUEcViU6t8w0ZRdWBzff9r7Yy31bUFtN8SwJkkvh8ic7W5vYRO6jumVuT6bi1UWjHu48wRVtkfNKW6mZAdy@lists.infradead.org
X-Gm-Message-State: AOJu0YzLx9j2UAY66bOSrg2bxfswyP5GB8EysciuprGQXWKBc26ueHJH
	S/1TJ0vSK8+l2PMLpzcsx2ADaJ/OXuoHiaYuwm+CKIvzkT21cYjW
X-Gm-Gg: ASbGncsP0YFPqSCkq09kuuyMXhhxQx3YTFWbZ+9+QJUuDGPG1ZzeBUQXS9gkVJHgcGK
	+FzGCUpVi9uuPHmWYPo9dFprIB2Okb3d1sjOPrbdC9uB9W1JPBJjroizSY1SQX2mserLOl2+ddA
	W1MUqCd5hEmu7pzODYHOpH1277I83Ze0vwn8fmQrS4cPgI/zCywuY1A9Eqduos9Bw723VC6Yoyy
	nIeuegKrAbKCI0LYTuLO8n2pa1hbGYhstSrzA7DdYkQ3Dv4fvLZOJ2QF5QZlhWjosq66+oEswC5
	XGsGnTzCy16UVWKwwesDklukWU901gF8I2AazDDipyUT1PoLiJSLaE9Gk22ZVpPrNKQ=
X-Google-Smtp-Source: AGHT+IGmBiCflS+dqQ9MaoOZ8ceeMEIKcTocd1UAk+LlHaQn3WAQwStGaWQzSH4vbgk2NAKmvL6ilg==
X-Received: by 2002:a17:902:ecce:b0:220:d078:eb33 with SMTP id d9443c01a7336-22ac2a1df21mr41865715ad.36.1744202756563;
        Wed, 09 Apr 2025 05:45:56 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c971e4sm10531465ad.136.2025.04.09.05.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 05:45:56 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: sven@svenpeter.dev,
	j@jannau.net,
	alyssa@rosenzweig.io,
	neal@gompa.dev,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2 2/2] cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
Date: Wed,  9 Apr 2025 20:45:42 +0800
Message-Id: <20250409124542.47166-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_054557_419961_CC3E1421 
X-CRM114-Status: GOOD (  12.59  )
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

cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
in the policy->cpus mask. scpi_cpufreq_get_rate() does not check for
this case, which results in a NULL pointer dereference.

Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Use `if (unlikely(!policy))` instead of `if (!policy)`

 drivers/cpufreq/scpi-cpufreq.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
index 17cda84f00df..dcbb0ae7dd47 100644
--- a/drivers/cpufreq/scpi-cpufreq.c
+++ b/drivers/cpufreq/scpi-cpufreq.c
@@ -29,9 +29,16 @@ static struct scpi_ops *scpi_ops;
 
 static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
-	struct scpi_data *priv = policy->driver_data;
-	unsigned long rate = clk_get_rate(priv->clk);
+	struct cpufreq_policy *policy;
+	struct scpi_data *priv;
+	unsigned long rate;
+
+	policy = cpufreq_cpu_get_raw(cpu);
+	if (unlikely(!policy))
+		return 0;
+
+	priv = policy->driver_data;
+	rate = clk_get_rate(priv->clk);
 
 	return rate / 1000;
 }
-- 
2.34.1


