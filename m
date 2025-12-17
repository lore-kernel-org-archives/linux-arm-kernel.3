Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F189D65C7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5cND4kPk2t5DX6paIOqq4zpW3qf1DLe+UW4i1yJRWA=; b=XcdHHKeo/H21Cb9DjzgwWTlGum
	cgyNFceJboDyAeUqAbBwwAm/L8JJfNWVnBQBUX51Xt1gBHEg+z0GmgB5C+nv1sgm4M5793jTkZT2y
	OhWstHyvni33JIMzIZa8MnTDnUMH7e2tevu2xaElhb6sDOPvPAZR7rKlOjXL9ymBFYlWkHKECxIIj
	JNRJSeZo1PAt7hOD2rKMbHJRBgWAsv3WOEX5f/ov7/Jm0GOY+c79Kqs88WWckwPeS/ZOZlMH3TZSS
	6TeSj8k4TCirPObig+5WEYaOWXWZkK3RrQjGQAfLFPOf3EyOUpnVaZPELtLIXLegfX/6Stp5P/K52
	gK8QhSCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLA-000000075Lw-221d;
	Wed, 17 Dec 2025 16:25:28 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuL6-000000075Gm-2aRw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:25:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a0fe77d141so40056705ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988724; x=1766593524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5cND4kPk2t5DX6paIOqq4zpW3qf1DLe+UW4i1yJRWA=;
        b=eXO3TmQ/AOJxAHTSHN9i0DP1mTyQle8+Qks7Et2bdoecuoQaugYpnmfOqFOsMOn16B
         0JZ9P8lRt2k0QA1nTtpzVKC53YVJuEmDYPtPJsumFLF+jIzU7aHeuLujygc2vfNJUuQD
         JHeYvn9LJI52br7lrnAMw+CMDdyFmxTZEwWsFwp4fUygQ7jUKNcuCyjrTy6ZMs5761e8
         Hss2TxmfiXzG/htvKcSTkuY/29wDv+SFZHOZhyy4nKhRBjxdSeBiYQOpFvQ6oC8v25hr
         nwXnICFDpmJdotaAAKKOLZsQRgvUNLYZd1feWg0aphJuHGhgj6RCQlQOJuT9x38ZRTsc
         CrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988724; x=1766593524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G5cND4kPk2t5DX6paIOqq4zpW3qf1DLe+UW4i1yJRWA=;
        b=p/lAK8S8OrQkZISeOZIkma7jquFaPEEmcD7WTsPvhe6K7Puu4h4GhLSP4nAlIlWNKA
         cAy2tEQYkADzhK7j9574MZrxFVl8kD/6A7/GJCzpc7kMIfSz3m0MwtKSpTTFcP3ZJnpZ
         uHbPmMArnYhQnIqIFnHtI7VuzNdG0svn+Ouk36U3CZHyLK9HdGxSKyBEoAQ+eiX56aT0
         FfzrlAmPIuUcnBpWXqNAraj/GrwOc19fkoskqphTIMlDoXGO9Jwi8BcfAepgEjf+ajs1
         zSfAJvbgXBtCtINvbVFQBetXw6tVYVKTXITm+3V8bSMlbamGdWCe7STM3Gu4Q3XGneLV
         ZROw==
X-Forwarded-Encrypted: i=1; AJvYcCXfUnM+AhwYj5rlIhTFbT6Le3FymW7FYlUaqs3zCMivM/Sb9vmzbgqwZ5uka1juiRkaubidQ+tmY+NRgzrZTgS2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp7w2//QC0ZU3+sdS0tBwVqkkQ47hD6ch3CQn8QtriBMY35qJj
	gGZkxKebQ4nchYpNiALBlEAwQ7Sd4+G4n0Cu8ubO2e/fHg1Y984MlwWW
X-Gm-Gg: AY/fxX6COMv4aUO4Zke+rR0vFn42mgmZ0XMn69O0y1yatOntb/yjLfoy8+TRbveAo4e
	8mK6DW4HtqgmzyF2ecAGjT8bM5IyEpaaXOMpaP5MBNjBxpwyi9PU4eGuydvf1G2CCAeGKbMmWHY
	2FFfm/RlsgTGkYbwq0qpLXgngarkfuB+hHYkjHyzQWRe+Pyn5iBQSbN/7Dw7DVrznODdD5Hx8ww
	GrsI30tr62fmE+Nw6qPrW4os9hxHXqBASrpLKQiRGxtZlZPi+NarP9pIttCZJPMxLkMk//AkRmD
	2JDGzHHtZftYa/DewtaKqQzxWNZcd3YsY7Z8S/i1vqVcAvtBIjUS6sxBE5FLcYjqEQtq/o3rbcy
	kb6jHBvsctM30qSOOVetg4b2mZdwQmG5T17ecj7KCIKW2iKzz4V6F1FAnkixpKmG4XNU4G7CcMB
	CD3c+9HwUaWexW
X-Google-Smtp-Source: AGHT+IFZoc6y1b1pXP5cQ0PFfnGzbWz6vwnhHPvENZwP09tZuV+Gdcyz37t9lePCfwf5hB/837//4w==
X-Received: by 2002:a17:902:ef07:b0:29f:1fb:730d with SMTP id d9443c01a7336-29f26d2fb39mr203552795ad.25.1765988723895;
        Wed, 17 Dec 2025 08:25:23 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:23 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:27 +0800
Subject: [PATCH v9 14/21] arm64: dts: apple: t7000: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-14-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=xASpZevNHcaVzYbv63kfOr+Ypk6TFwui56ogxDHDMcc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlCfqtnj3K7LLG1583f9fJoNwcOfr9dxkt87
 NMURcTfSY6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQgAKCRABygi3psUI
 JJ4oD/9wGXL0RPwz7RwA+udXKga6NOZMvPE6AWK2GLo+Q54NI8kf4ppSwtCkcXeBXP11SmVFDi1
 VHlNNMEA+MMbnwVnX++oHN7jkn2Ag0KGIPzLKzRiFBMID/Hz3XAN0qSstl+LGSIAQZWfa5JG9hW
 aDby8qRg8x0AvST6KJdgK6thxZbTponO5XTFoH4+kdU7YsPKN7paZodsc8aB3zi4rIeuLNejFFU
 OwNTRNwa6KaRFg/VbEnIswe14p06hGMqczn+pdw0KaSOVNFfUApQC6Ts6yOY6mhL4xU+jIJCLV8
 KEXN936EuEJUIjwaCizOwol06/GXwPQ32GGcN3HXdljSy1YDYgrVc+MCLQnWmJ+C0E4SvPLl9+G
 1kd4HV8OzPLcYpDEAJLsa3pBMXtF2pqLC4KuFIK4rzo+tifUWci3D6ugxXzYCe1uoTndGmf81Ia
 XNCc8TKqz2yueBPl08DjmJWWKCQ20tIthfhmegmGvFn6a990QC3VsGqU9mmlmpwytBr4KiRrRN/
 CC9Gy1T4CBSASNdHO+WyV/Wa8WhtFliLJ2kASnpd5rbGLk8qVIqRvV24wf8IGt4l4r6k2bzc2Mc
 rKENc69LVKhwX/UMU9aNd+zFdWv2nE4jclbhgNQK6Jjsr0Ol7B2MZlAoaBvM53PrteYke4CSfra
 nWAG6vi3ijyme7A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082524_666672_225561C4 
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

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 0342455d344474d34f7924a089bf5f5915e68d55..a416cf8204173d4e45eb7baab42302eefd0e55ab 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -282,6 +282,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t7000-pmgr.dtsi"

-- 
2.52.0


