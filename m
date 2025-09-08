Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD54CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kj7fG7XAER68na8hgLjfPolxfyD9eQkGEiz9N4R6m0U=; b=4lSKNqYQvXH3ndDncNaVyKXBa+
	naw+Tu/eSCnP9p8c8GZO/ZqpAUupvTQnjZcTNOYz1cBYKGUljCaSGOay3bqtcKpqMUPMSDS1qMUgH
	1l2P2L/v9QLCCDnubk55INLPAZmA0gUCsKo9PzKeBHTULvGvFlDVf0J3ILyXnQlnw0ibJ8BlPL64E
	k/99TYHfvCT1sBFLxhe2ZdOkaUp3Y5YKNf1hw8dYaeyM6rRMxBOD1dnhKQQQ5TWEBXQCmz4bxN75D
	B5CAxXMk5J8DKIrKA5Y6+xQPEHe4LDiLmtMZ5tDhHbkbVwMEOB9iWvnAPmj8av7w7NlWU9R3NXM1i
	+6ICPJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvacD-0000000Gr5i-1cVy;
	Mon, 08 Sep 2025 12:04:57 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYhZ-0000000GEWB-1Y91
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:02:22 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso2753834a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325741; x=1757930541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kj7fG7XAER68na8hgLjfPolxfyD9eQkGEiz9N4R6m0U=;
        b=H99d1DfN/aYqafb4JuT4/ZaOZzXiEYCegaVzOxL7leHYaNMyjij4b/DpN1SzkYCa4s
         knnuZK/weGUzh1TLa+HtrB4/8fe2FC0GOc7VsZXT1NtiLojhFHYmiaLiHqiuS9s1ykf0
         tL609hWFcER/3qfv9CDVz5Cxf3roJpqTLIftzf72Q7qA6lWYAQh3cw7TKo5lIRWOBzEV
         pvsQpQp3G20dPCS1pvvwSWsziIlVuuSFRj2Cb7e9kyNekQL3i2c1sX0z/HP9A8YT9nu+
         jn1GDcAky0mm5XpoJrLHTPUAOpYSSU13I5jYUKTfTwLL8GYq3Y4kegQc13OoY3g87Eg6
         zHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325741; x=1757930541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kj7fG7XAER68na8hgLjfPolxfyD9eQkGEiz9N4R6m0U=;
        b=C/3v+aU7igD1/lBk46MyqeaKj+LOHrYsN/NbWLxalrYC4BbO5RUZtWSH7QGFG0sYOD
         UBMLcjdF20plkzS3uWmnmCkicRWPWvXMOriuwWkmRnrON/BNeaqUr2uc1E1zkJ28TyfP
         +a3x6ZE/xbjLasq2dmcQfUcGZmRkMMrA9BbIH9fLlE8n7ye7N1Kmf0cDEYKejcx0VKDc
         E4eP+T8UmzeYuN86C6nnx7PayW/Zm+IV66lmT1S/6Fru7uGme6wHNPWNkw94QA1A4wTQ
         OnuQ5yIfzf3A6NTT9yH5RLhFW7OBQ43RlW6RIcxdnvXWj6dJBLlFSozcaItJ3V3Gni1E
         EgGA==
X-Forwarded-Encrypted: i=1; AJvYcCWglimkgcRFWf1QXn1cFZFplOBY8T84ql/0quFxEw8NTnU6leZZ093BVLyGuvQ+0K7KHVxoV0acQZqzkoRKBXyN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzet/ZRVrOhEaNQDDW51VXHeWgZ308fD9qcoH01Zbq9oNhXk6p4
	+3ZR9fpZrv1mLPf6bGazBIE0HfZKt64bnch5mwH+rmwbncvbWfX1Ghve
X-Gm-Gg: ASbGncvd1LeGhUTzl+hSNf3+e4VsvZ/du789ebMifjQijjLfsjPsO5pmHhfz5xAPB2l
	Rudel0Of7p8Gk4ghCKqf93UPZjHWwi4slMxt/cJKt61vNnoO94Kwjo71J5bc2tssunkgbVTXu+4
	WLZSE9YSS619Rq+BWJ5y4O/5VxLFwW2fSqSk4SKDwTVQo5sMz70vSWrtv1k+QdVwGzFEu1RGjZB
	F73BK647loxAE0ia2+q7XGciVCM+40KTvHuFKzHiNGRNYsZc0FfB8oDHk/J2Yu7VgHvS7DO04uU
	OFDuBt0FieFMzNErEBOzjs6GIOyLac+oVenU7xlUiGIgn8d+DZ4ZjQD5hxxUg7OBSSLbsr5ZOdr
	zDEOssSqwRdiGxbu4dCXyi+ReYF6lzUnQV6X56SBgiB6r6U9h
X-Google-Smtp-Source: AGHT+IFzBnyCeoSUT4/jKqak6Ru0Kvj/hbUWjk5gn0379Y2ihPn96fH4hCkaATJ2yH9Os2NuxascEQ==
X-Received: by 2002:a17:903:1a26:b0:24d:4a96:7b30 with SMTP id d9443c01a7336-25170e41046mr103171265ad.35.1757325740700;
        Mon, 08 Sep 2025 03:02:20 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:02:20 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:45 +0800
Subject: [PATCH RESEND v8 21/21] arm64: dts: apple: t8015: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-21-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=NgiaadnBWzmQWHLVGXTkghr12q4e2Z2pGwu46CpKaLI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlFI+V4GoFFzmg6iekYjO3wUQsQ2NoToVu02
 /eVS2sSy3OJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRQAKCRABygi3psUI
 JAaID/9rrnrkkgZNvzI0FIXkGSX4gBtvI+S+ZUhZpHoHLNx5mYa6SzSgxgGtFVh/RB3Ws6QCf2v
 QGDci6rsLtSmWAjeQ+uCoaMJcuSXbGTSiTxM2apn/N3Qa4oRhy96wHLRUCOq+zCdg9ST0POvKGD
 MU2QrOVTS/xAzulU2W6Veml9cV05aLbPnSgAdmlom+gXmZqWsicFUuun1bQzeP4YNj3tYfN85gL
 Kofv7w0kuwRAr6gePgu0je9RzyJZGzY8PhjJho1XYqKM2sboHNKtJOwjHQaOu9zKp1YysVomMA7
 a7x3EwE1STEqEZK3KFwIHFQvYNzVPSSbZJX2thGtvHTmjmdfgEJN3RoO+6YFRclhBoR3YY5l+Ez
 10S/GLNWdQ7MVEbO4C8mBHFrrc370ZfIoqyP3UgvZZFP5itHr/ByW8ENdblvZRvHL1WeCQKZGQE
 3UdpaW3pj2RP417YZdpur7CQmv8YdTxdj0v6EXOxqE+e+IZMp3Jda2PHs2jWOpFfT2QCRfFeQ/7
 RajECtYAJvCdQpNmkemfRYw+APevsJeyXEQhKifsPYISo2NkHZXg/lBZB7UQDBY5v2KPjf54Jk5
 a6R8wk8dredST8Wb+UBF5e028+i6SkVwrsnKOjn/zcu/fu42nEfKXCQJ4bEBlHwf6eIcMY4iqzH
 DF9ti+Uugiot7DA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030221_410763_ED24F2ED 
X-CRM114-Status: GOOD (  10.24  )
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

Add CPU PMU nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..9bf5157f0e504b7394ef5354411d3d37e8d5760a 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -284,6 +284,18 @@ aic: interrupt-controller@232100000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			power-domains = <&ps_aic>;
+
+			affinities {
+				e-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_E>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
+				};
+
+				p-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_P>;
+					cpus = <&cpu_p0 &cpu_p1>;
+				};
+			};
 		};
 
 		pmgr: power-management@232000000 {
@@ -412,6 +424,18 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu-e {
+		compatible = "apple,mistral-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,monsoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 #include "t8015-pmgr.dtsi"

-- 
2.51.0


