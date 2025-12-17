Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2897CD65C7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XIbviOhDk9tWhSGjjMU+OiN82Iat2rqIxD675mZ2oo=; b=33EbcbWXpeGomgS+UCdklUKU9s
	2rJ/q80ot/Zu73vFPvw2TIRPlm7v/F5u++QE1H3HIdQezm8sNM2/I/ZSNw5XEa19B7Lscasb5jBTp
	ttd5eczK8tGYQIm8941Jd3SXAZ1e7cizOdI5GI6h8NdH5rVU3CqVMH5vdW00jVGgcbQppOR+QDox3
	w3soD8le3FiW2ija4l/+iFooCJTX25m0MedPX12XXCMb8SXzkqwqsVG7ucGs5N+giLZ74aPxIDvaZ
	uGAakotLSQpwxJVpV1MftQhyC7hZhBj7LSLvFjA2xz8waAv3ZS1cfkq+1Fm3XpHSMK9aBSxQLwpdk
	NEwUkuOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLQ-000000075d7-2suB;
	Wed, 17 Dec 2025 16:25:45 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLG-000000075Sx-1cUl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:25:38 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-29f0f875bc5so78958535ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988733; x=1766593533; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XIbviOhDk9tWhSGjjMU+OiN82Iat2rqIxD675mZ2oo=;
        b=euzso0i/JLL9mRQEF+ivlcRJtqK+Dq0N9V74G8YIEAB1Dp02YSjLHRQ1seyF3jL1gr
         TKG6omLsHhTb4irrek6JorTUahvRNvRDWheZLttvgpgaWqJUjENim715wz5LjM6hJACj
         HhVZJ17EUvDEcmwDWNZkzI3rvP7pzYvaXlE+vZUIUwMkbDFGw50EkdmxaLySAL/4qT3s
         IvKCb0ZvTEW5GFieHIHcgSG81Fh+J7ej6R6TzkzNhuS/x89XXCnAS9ygyn+tUezv0ZaW
         CjTmoOiOz111dfwtgCVO0f/jeai/nFm90bO8/gNcbmyXmpxpz1mMocBw2eqzHScY8N1q
         G2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988733; x=1766593533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0XIbviOhDk9tWhSGjjMU+OiN82Iat2rqIxD675mZ2oo=;
        b=nEOhoo+4t2fjm5h1N4XW6+BRbH6IlZt7CfNqLjx/p36vqv2WAyz+a5b+YPHUDGQai2
         BGWqzlupoqM4eWYd9D8RviIrMGVrRYnYk8qo4v0ENnQYy4WdoHd1o48A9FEhQvSfDgH+
         Y/BgU6AihcUNGXW1ZvT5OA5exHEB1fg3H+72JIo9hTAFZNF7s7RqvcG2rCg8pd7ykb9r
         7KFUPVg0GIehJ/BSQw4jFJV3vC3VdpQsZQCfXhj5OrJ6m0oJLu86z5u5yCy9iEQlbBhL
         Y/ZTBUaL62oaBjxC9ReDJJP9EfPBqqToyGcljWyWDugIichW6n6IJrsTNFZ6MjK9AewP
         9XDA==
X-Forwarded-Encrypted: i=1; AJvYcCWdLRhUaOe1Qd0QiHN+vFO931K4P+8Ez4WNE5rmVmgXNFfNb99SFKbtabkV7sjnnvppNLnzTlwHJVfPJSussWZT@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ340crj1yTY2oyruCIBQuGGZd0CaE0X8KrpgRwMI1OUW0JHer
	2Ay5BtbzKIM4hQiSsgUBvFIAeVvOSv6d4oPwQMFwR07kD8e2xsfrH5RJ
X-Gm-Gg: AY/fxX5CYm5CLC+U797U05ZE7fNqacnQnDJDGqfRQ+siKO1BDI9WQ0VIzhnb8MZD+QI
	7CuTIL84lVkwKRRrzdTac2OCRE9ZBHJVm7/rr1JiziD95H8YclTll5WDcIpsscsi2bmgtFqf3SL
	VwYlDBZmSV5Mkz4fDhWx6hQh6OBkfjpNnrV6SLWCYoYQr7oe2gWf1ecLcLkmlSmUh3gB0orQ0vw
	Bdj+WKM9EB9TZHY3vvigNE+UKPnv6Dkn2lvVAdf6/nAb/e4DY1Enm+s11/+g+QhlMoHrMy/lV0d
	z/fKw78lXJmDgwcZtLls5IchRspGeIYgRWoumgxIU+o9SSFJpCPhmdGpdsZdzEIOA6IwYPW6Il8
	CPqU5+BswWv57xuAN+G/QFnjZnlzGggtA6QIj5N10U+R1S5kT+b51pxN8o7/bC3zv+aWAwpxPRf
	Rc5TdihEjAIJdQMxsTrTEGJiM=
X-Google-Smtp-Source: AGHT+IFWcAl2eDJLxZCIcaifcs1mNO/2r3sxH7mEEr1iZiQh6yjVgtkLQjrhGVLNZjs2M6eo4amITw==
X-Received: by 2002:a17:902:db08:b0:2a0:f0e5:9468 with SMTP id d9443c01a7336-2a0f0e597c9mr105953605ad.32.1765988733320;
        Wed, 17 Dec 2025 08:25:33 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:32 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:30 +0800
Subject: [PATCH v9 17/21] arm64: dts: apple: s8001: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-17-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlC18frqHrWhi62ycOZTQzFYElAtT3Uwm0CD
 IaXXMI0j++JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQgAKCRABygi3psUI
 JNATEACn01v27AmuZVEofWUCxDzFsb920+rtnSrQ8l32muph5xC9coNw8T6bCYcDAwiPtDlfs6m
 /4SQvgpQoMAXxUd4HrCz3m8UKruDmVLOed4fFRje/PU18xUyzwWlweBTZDVbZzf5wKvLwTiBFqn
 2epA+tLbEi2kpSoyc59zMYv89FfoAN4EIEeULAePwCeTMxDT+0JCcfcPl+b6CSrzaZgf64SnyAA
 lhHBUIF6tHU9ruCWPqwk5Nrb9SHN1NgxdOC63Vla+HsFYc+GMqawJgvCP5AUiZju6sQfPIdvngD
 4aMSddwWxID9hSD0kwWH7F7RkDD9N1EwJBJR7x7YI4/X1lAgf1REiES5b8A3kB3j8QB/J0cFrFM
 agu/2DGetmXyT5qPZyR9FLV3pOUUZszvmy5Ch4bvWd/aktds4UGJt7HPnyrkJgzGFlMhkfMThjp
 B1+MNLbRG4enS1qpNxIrKN7rWbNnatkHgxbOAFO+RJCyW5ek5w29o5/r442NTNSK/MgK1JB5dxN
 lmQ7qHiJZMjf2DS87FHgvVeNI1KzeJsx19AB/h7vPN92sveEQ0KdQH0Jtx+pOOlhK2yjpP010SP
 bN8kt4pyhSbTGbulgl1ffdEvUgA9OSKgeCdUPI0Qt9oKuzgeDSqtRkg8eCP90fjUX6E/zNiHXcg
 djIbLrDiSNYJvfQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082534_459374_B0BDE1D4 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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


