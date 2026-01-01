Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73637EEB56D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XIbviOhDk9tWhSGjjMU+OiN82Iat2rqIxD675mZ2oo=; b=qCiFgtUJQHnLRNLYBC7ENllnN5
	An5guK/sRdGw3nscikjeoNT6yqJ5ymJbCaOv0B6osz8JHRd/tlwTwV7oZ5sAvxVkT7u28XcVSCIJo
	0dx1uJ9syndA/eRI/BQKwVtGfxn+5nBbc2iUI4eyQ/Ah+dtIgRzQ0dKwMRrQfHkzIXgKG+e/JH4x2
	jTURdHpKOj0dCt6veB5130B16zCjeialbB50aquXY/G2nmxlyfQGgvw6x3otZv4iyMan4tGgTDOMm
	W/TVPAxgTl72GXpbYDDtW04vdP62qCF2TqNipG2zWoX+DMeYg62HZEY6oPWukc3IqGBZwjsTFTUFt
	uUBTdtjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEas-00000006jUO-2Hi1;
	Thu, 01 Jan 2026 09:03:42 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEaj-00000006jK2-1h5P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:03:39 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so9851924b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258213; x=1767863013; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XIbviOhDk9tWhSGjjMU+OiN82Iat2rqIxD675mZ2oo=;
        b=l4krqnCf2mh+wl3yG3DLEe3QY8F5enHfFbLCcZyjt7heBQR1VcfOuKc02rTUy1IZLO
         Lxjm+ZVyjDcBR/QjlbVr35ZFxoMYdKulcTb6/LRpBUpvvA+ZOVKbwud1CKbboY9l1jAX
         cv+nsXq1Qcpq/93LhbSPlyieu7DzuXS1Xzl9imb6EA4kRU1HUGm93O09/gznzkeEPaER
         WAg9PoEL6eap8DIvak7T8uHWOuezjgFgK8AU50jjs443fa493E12mBDpmAkIun5QbFD1
         9SMBEbpr3kZkU0HOjIYxiAHZV4KVPIlnU+3ZyY1+PtsbylTz5Nj5gsR8u+CjgTd07Ki2
         lXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258213; x=1767863013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0XIbviOhDk9tWhSGjjMU+OiN82Iat2rqIxD675mZ2oo=;
        b=GPg8d0x/5cTpxCrAxQjYpyJJWBXUZT+jXcqUQRfBh/Y0iZHS1CGOe4cNbD74NYTs67
         0Tss2qOsZxXbrJ4hi+yMJzGQBnrNZo59VYajnewVdP/oAJ8sOmcoJ5mpfJoZka7zVh+I
         l7rS0uznv6jZDfwBJcXSD9MmV4GGbEp59my65PEIDv/JdGxqQZ7JDCNpqi9RqIBArXZg
         Xjs7k9A8ufvqIKV4uGsmhWBzQ8U8g9pFbCJgO3OLenREmB3Szwkyd5H8wGh43HPTl6xM
         QQHV371jP0sU2lQCkQ+8ME/xPSrBms0VtldWS5lq1wj3IVkWUNajW1P6DpFUXaEzrba1
         JDzA==
X-Forwarded-Encrypted: i=1; AJvYcCXnHJKsw4udJ/o9cPRGDwDf0WcONAIz0X3mfZODCZndeNxVEsNf3nOfBhM+cVyseV9wL1JHu6sw5fk8k73zShI+@lists.infradead.org
X-Gm-Message-State: AOJu0YzBnuwMwTanJcAJgIPO2XogKCSPFlhkkBAj7W+AE6OlNnypCtVQ
	hYaYhKlDmUiFUKjtFJd/1rbeaoe+NVRoDccI1MA+E1h7U3A4P8bQevnZ
X-Gm-Gg: AY/fxX6stUp2otQTWrUr6qohOv8kxkHFR/YPpP7jrpVf8ojoMPAkQ5TZFkaug3hHsXX
	mTQXtJQKDDh4nCnxr6RrWLJDgDLGMbh0lg/zijv76GNYdwfBK1Wk+f9yMtzbcCOEsnami8L6m3w
	CR+gZybSXtud09vclA1+gvHf3NsPQk/9lh53aBUbBlFrhDEd8a9Y+wivz+zhuqN7awNrJ0hIZtl
	r1v72tcvmtb5ZK1eurqvcms0XohRT9DF7EuG6pmWLCaW4o45Ek93zAu/Xn0M09QZwWjHzYDhBPc
	WfjRnuMM/O66TXnyykED9a582l2Xuao1l7T84+JuH19SQOBYVVomWeoSm1ZzyfpejMsowCsP7Dg
	94RwPn79o63lbFUgvj5IaXAXXm7Zl25y0/+twrCQL6yyDipBbGd/h1baaJh/1ycVpH3NUtPOMqm
	nTC21Cytbuby03
X-Google-Smtp-Source: AGHT+IH4BL4lHRkhONes0fdA+rHZZ+C01+zvYr+yNbWzj90rU1liW8WFWGCqkV1LgfbNxTjIvc81bg==
X-Received: by 2002:a05:6a00:ab0d:b0:7fc:da5:f849 with SMTP id d2e1a72fcca58-7ff6607b356mr29575181b3a.39.1767258212664;
        Thu, 01 Jan 2026 01:03:32 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:32 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:53 +0800
Subject: [PATCH v10 17/21] arm64: dts: apple: s8001: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-17-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=PzJR4btrOIgWAbbA9/PgDRkfL56Q2zFHfShoVsaxiHQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgoK+DoXHphAWKwsrnBV7SEEWyskBmkLmcO0
 34oC6Ola+mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KAAKCRABygi3psUI
 JJlMD/4j+35bm1G+5hjgR8AIua2VY6BzbY7LRgxLVyF+dm2Vb2IetnHbkgyrOHUXp0nZuKUSEzC
 +RVJwzOuM3ayrzUaXl5OmNSiKnLtz67LQA2nKMnITYzfyO1wXuEIcJTqpk9qacP4miFMGeCL4Nb
 LOUwcoH/MqvbQA6VAuYB4tWCSviHOisxqRjv+nS+JUkvBw6ePeF7sjHvOEpdvgNjYpR0JFUs+p1
 yem2nsi+rRGV2z9nBqLu7Os+0IK2Y2QCkTkbTTsfKYMXdqcqGr+E7+Fn8DxOaGEdYg1FF1i4R/p
 Y+z1hpbC3jxKS61EKRrrzztRqYabktsMdcSJRgPuygZfbGabjjjy21gnXDcQqOya8dTEb3Apwun
 4PWNA6mJz1vmDQGwjW4X3oe62Dn92c8TTdz4EUgFNyp9t2VHbyL7KSXlZ6PYBXeXr+ULKXnG1ql
 jXugAiTWcwNkAIIVzFuEXAc/1G7/fQd3RzIedO6pkFEdG3hy/zS932un24FA969+xAYb1vF+vh7
 WAd4R6ByIczyEgvTyOmq4rQq6Z2RV8Q9iLaYsRV4ZciimE0h6eJw5MPy6QjbYQTql0sKttYgAH7
 s94Blmnncp05d2unlK1gK4b04CMteufpf6uOrTLbDQDmnGw0n+tDJm0Na4S7qTWu2XTw9mcwRqZ
 vqTHTsH5+i6w+1w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010333_519746_5EA3F7AB 
X-CRM114-Status: GOOD (  10.15  )
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

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index b5b00dca6ffa4caa1d504860693da001a8ced80e..83c5c479c87fc1ae1bb7c6889aed9a71fb55d29c 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -298,6 +298,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s8001-pmgr.dtsi"

-- 
2.52.0


