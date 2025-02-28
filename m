Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D280C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZTBMAhg1wwruL3kSpjABOucD/sYIlHMkHK5KyQVOFfg=; b=4pPwaNooXMyt3m
	8KS7QsJdwGAtcfuDV2qCqYHKFK2Ujdxg/J1WAm5wxzHBC4C1BpD0M30AfyB0puVrluKPSlpnVdWVc
	+Ja5quzAsID0UJiXNNXqzRg2Eujbi+/Yhat6zF8r6VQuvVbA/LIbsTlRD7rCMyLIviS/QDEVcOiWn
	vK0o30ZohFAkeC0eBov6Q/g67KDCh2mAISAYHTfQ/P6lfPY5Dwa5kCWgNNAMsJ5o/UY8cs/udO7QL
	ja3OheR9vg+3CcQjg4LFXYvXgWXWD/CtKVYAG7ErhF+oV6cjOl1lNC5MJBsDEPUujn6XlGevY7OeI
	kxZCNjdJht9WH5hSUSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrkm-00000009h7x-37MR;
	Fri, 28 Feb 2025 04:13:36 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrjE-00000009gie-0FGK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:12:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2234e4b079cso31328425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715919; x=1741320719; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTBMAhg1wwruL3kSpjABOucD/sYIlHMkHK5KyQVOFfg=;
        b=ZFGekHjEByg35FtZU8ACCBWPA7krPMmPpy6umliAKlQfrdHec8CGxR/fT6A1k5qEFs
         5rhp3ybxlZSCIRnhTYUOV3PzoSWAs26kIWBZge7MCu3WWh+6LQCAZbujlOB58R5fYgen
         c/UDT/yEXjv5Ckyn+K2+LzXNXKCKaAeS2JOXgzOSgymKwUO2oiUPihgfYZeAlF9XeoNE
         H1LVXjg5gUZLlj1b+xup4FIBZfdbqU0ARsdZgkaaT7mYFF4kzVtLKZTXjR8TEy2bzaa7
         e314bsxv9QUtEEvH3vcxAT6ie7uThuZ45TaOB0Jp0n76Jjp5VjlmlnoadT83I34yqZLZ
         THwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715919; x=1741320719;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTBMAhg1wwruL3kSpjABOucD/sYIlHMkHK5KyQVOFfg=;
        b=Or/V5rfgVCmEV84gBxnZaI8OD3rRgDYyI2MbgLMEUmBMw849s9wlcrxdvxnANimw6y
         1JRofDj1q9iojHjONPBCVQecYW3esdqtC1PUdEiYbh6mXaparyWpLJx0YbU28PCOelv/
         KHGK8yP4AXER5YuMnKGA/U5qYBSd5yGvSAF18p1Vy20lPsJZHF3889DVUNROxXOWod91
         0/nX6IIWgBuXMuCR8bGeOyOmHY52aMVJhU0IebqIn12teJVuzykmJaqzm5FPPh2B8oX5
         4mFqLoC969r/8EgTdlG2UIbBZfqLwUtLIvUQePvQzqDej33qOSpc4QFAenznDX7PVu91
         Eg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXV09NX1jcWhZl/HvYTkvqIvh3zHT/I0AEx2G4xMtjVmKHJwgXj6loNygsiFW60ZDjfCT1YSTc+I7BpNIoETuvm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3xafNEzdGBgFlURC66DlAdK4OtNd9/Q7iAI+u9zIJrkWrdCNA
	FvZ4SJJ7CRBEphi+86fw25X61SiV1fLcBQuxJXpqyM5qSyYFS9kr
X-Gm-Gg: ASbGncv+ObNCnFWyXPo2LblEreSs5ea8GYgjBn6u6B3W2sp0s8dElsWzsr03Feq2E1n
	41rDNK62vyiLsJ+kvF+1jJlM9fl1slaxPvQjA+JrsqsPsdix610bxavqsyJm8lBRvBD5rC1yyNC
	zSWchL3v3jk+CNwUWY2uqPre8Iue5hsyAL01F3JzclF3Yy/QlATzEGQfcyOCcZmN4j41zScblM4
	7BeXvO7+la4cE/WokTx7k8hRhlW9qnvJkP+L8QL3QYrgCAcRwVYoq7apDxhkSwBibK6bubXBCGj
	ivLPNbiT/sU6jZ9UBDzoSF6T9pI=
X-Google-Smtp-Source: AGHT+IHq8gmcOMDqOVdo+g9rZYBeIqtfOK2M/L9LkF65xTdSYF8sFK11DHNEV2+dC1CJPZQwQ22d2Q==
X-Received: by 2002:a05:6a20:72a8:b0:1f2:f1aa:3322 with SMTP id adf61e73a8af0-1f2f4c9c65amr3182429637.1.1740715918611;
        Thu, 27 Feb 2025 20:11:58 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:11:58 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v5 00/11] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Fri, 28 Feb 2025 12:06:40 +0800
Message-Id: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFA2wWcC/3XOQQrCMBCF4atI1kaaTGJSV95DXIzpRAO2Da0Gp
 fTupoIQBZdv4PuZiY00BBrZbjWxgVIYQ9/lodcr5i7YnYmHJm8mK6krKQTHGK/EXWzvXKNGaBB
 qZYFlEAfy4fGOHY55X8J464fnu53Ecv1kZJlJglfcW2e8RCeMgv25xXDduL5lSybJksIXlZlac
 4KtqEGStb8U/lPI9ETGW2yoscL/UlVS9UXV8rB3WJHSQhkq6TzPL8KfZVRVAQAA
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2472; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ooSMmw30cz5D27+zRI7E0aoCWg0Pk9onv0uZIC+J8nc=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTd4UpjDk1D6VVhs32o2fr75EqGV7oPNKd8wU
 jpFbOIUVN2JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3eAAKCRABygi3psUI
 JEeyEACvfwlc5UHSrdYuhJ5H0m86mSEx4innOuKs7G+tgX+cWzTzuhKzZuGgUjitXKURzePB0Y1
 SqIcgFQqu3nQxSbGkWJCS0f7kfgGAKoZiYmpoMoQUka280whTaxNUdS0gx8E41ostYPwy0usSJa
 5EHfq30oztKI5FCmXpk3GMpezzRt5W9mcLB5Glor8S0HaP9qNdVEaxAk6Id7D6C/jLKT3P6CK5X
 IFLJ3Z1PpGBQ0St8zWoRNckb7d1h5pL+Kqg6QoKLKSw7npbFkEtb1nuSiTQKyncJGXXw93ph/hr
 v6UR+egVn30ZXCBnb2Oy2N58MYgIssdkBn5Emy2Ei+/CnFtAl0zchqOjdMkWCFFCz5QN/4Yrkhp
 O34aTlM9oUi7ZmdLuU2A/5S7gnvDZ9ldGqdMI/l9f8LVAjOmIpwmSLs+QoYZJYG+O9hFxzLISg0
 vTnH2ct5JUDox8rjr7bx5HzgsdFq0++LT8WWDDX6ubs3IFNYhlGxYNVYO1Yc8phJeS7S39D0qEP
 sc/T0igR6f2uMWUMTKzgnI0NIy5klNVLQEwxR/2jUs/KIQeYSSDTb2jcSUzCREGntEcDPzCWonk
 k3drxmbFlpc4NLMJV5KbvJlcFiIgOSbUAbYbgUtsHHUSn4UC2hZOPGbzaW9a75oW+X1ILrOXLcP
 1SRUVXuAvJ8+10Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_201200_101381_6A855926 
X-CRM114-Status: GOOD (  11.81  )
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

This series adds support for the CPU PMU in the older Apple A7-A11, T2
SoCs. These PMUs may have a different event layout, less counters, or
deliver their interrupts via IRQ instead of a FIQ. Since some of those
older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
be enabled by the driver where applicable.

Patch 1 adds the DT bindings.
Patch 2-6 prepares the driver to allow adding support for those 
older SoCs.
Patch 7-11 adds support for the older SoCs.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v5:
- Slightly change "drivers/perf: apple_m1: Add Apple A11 Support", to keep things in
chronological order.
- Link to v4: https://lore.kernel.org/r/20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com

Changes in v4:
- Support per-implementation event attr group
- Fix Apple A7 event attr groups
- Link to v3: https://lore.kernel.org/r/20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com

Changes in v3:
- Configure PMC8 and PMC9 for 32-bit EL0
- Remove redundant _common suffix from shared functions
- Link to v2: https://lore.kernel.org/r/20250213-apple-cpmu-v2-0-87b361932e88@gmail.com

Changes in v2:
- Remove unused flags parameter from apple_pmu_init_common()
- Link to v1: https://lore.kernel.org/r/20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com

---
Nick Chan (11):
      dt-bindings: arm: pmu: Add Apple A7-A11, T2 SoC CPU PMU compatibles
      drivers/perf: apple_m1: Support per-implementation event tables
      drivers/perf: apple_m1: Support a per-implementation number of counters
      drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
      drivers/perf: apple_m1: Support per-implementation PMU startup
      drivers/perf: apple_m1: Support per-implementation event attr group
      drivers/perf: apple_m1: Add Apple A7 support
      drivers/perf: apple_m1: Add Apple A8/A8X support
      drivers/perf: apple_m1: Add A9/A9X support
      drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
      drivers/perf: apple_m1: Add Apple A11 Support

 Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
 arch/arm64/include/asm/apple_m1_pmu.h          |   3 +
 drivers/perf/apple_m1_cpu_pmu.c                | 801 ++++++++++++++++++++++++-
 3 files changed, 777 insertions(+), 33 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


