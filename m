Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA828CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 15:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WWayxFmkMisVE6Y9kvigFg2uNGk2FXDKQVXpWrzd7w=; b=xVssL6LOv9q16eoWJzudODI2Pw
	MvSM8uBmLRp+TkjhohTBLJfRYD9LvxSH12xgrk58GDRDLj4sZRPa5Q+OZCtb0FbthsrJ+SqVrNyNr
	nUv323QYKHw5u/Q15zx6G78xis533jmULD7yU1s+25hRqx3+C0rRUVOa1gqb1d6VUMrJvP6+Cx178
	ygt/yWVL/HTDZwMgl2Msvz209WnogHvSK7/rHdKqeTyQ+sDRaEiizwMS28ZQXgr6dtiJ00uspNh5d
	bnfwnk80Eq/rdKGCNSIwrlMF0FtaIodP+Gq6k7iYTy9gBJeUFcbmHznTkztAOHAh+6fj1d9SL5bTg
	QWkD3VQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUSk-00000008Ce4-2Pa0;
	Mon, 11 Aug 2025 15:29:26 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT0u-00000007uMI-3ukv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:56:38 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76be8e4b59aso3637827b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920596; x=1755525396; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WWayxFmkMisVE6Y9kvigFg2uNGk2FXDKQVXpWrzd7w=;
        b=heleHmAnW8Ows0pNvbq8gV2fpKqSP36zbPyeD5HjCNh/e0k1WzNWGv1LQ+8W4h/7VO
         k/ny7HEALJU8HY0URaLnuOXYdrjzjLQqCmfJl0qaBNiloaYmZOXIvpQ2DALDmZIV+ibC
         GcV417ccxwqwac0pV1tKMCmZrEAzX5L/PAxMcG0s7HvdnNjXKXg/stxhq6QOUcIrh1uc
         nzoUqeaP76MdV5VqHKPp0qL18CKbQNXM8KTqD/GpJmetgvG8yQH10HEEE9bLkt/ENnR0
         31agyufoanGQ62IRpRqbKt21SPDExEcHS/mhrQBBHvkQX5mZLsYcfozLGOixStmcn4il
         Qjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920596; x=1755525396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WWayxFmkMisVE6Y9kvigFg2uNGk2FXDKQVXpWrzd7w=;
        b=kuspYxJyOjCuCpKCtDGjqbpLrR13VWul0+UE8fH2dySK9cJEpKzEMw3MXO2MGMcFbk
         s9z8vKuTBB8LliVPGTIZL4WG0PlK0SSSWLRFKVCzPK4+aZHKXbLcsbs0edGxOp4sNvPy
         RN/6niMM34+Odbih9t+rrioWl6EpBD00xcruVz09khNv5eMEd1ifYiGGK8O+TVAwh43N
         CGds8cC37ombvj3Fzecf2KF762XDCuZu93nlxdPtcJS+o1XHtwJIB68nRkHi2730HXu+
         0kHgcIK9cZ3tSZmyy9kAl2bT7fMf52+Iurs1gTl2MXc/CwnYz0phVfOMqwpunyxve5G6
         BfLg==
X-Forwarded-Encrypted: i=1; AJvYcCXpSyP+vCfX2UaO0HzTcqv6n6uPUADCa/A2s9VoQHwceoiF+P703bDySD8TMrpQD/lVStK/qCzWJnNnq+J3EYgk@lists.infradead.org
X-Gm-Message-State: AOJu0YxW9bujE13NvG+kyFbTHcaYMC1hOcR2bINX7dKM2b1+kZ57yhVO
	b4UjOOjVvcIIq4WztqO6eX2v8sO3nwX7aXckUPV1AW0IGLuGlSTlZHkt
X-Gm-Gg: ASbGncvHZc+coX609A3HuTq2Tfy7Fc1hiuh+TC6UE+qRkRM92NL7RbGDsGbHEGSwVFK
	euH2CDnUg1M1HreDpuWvfGFRdn9aBFZ4+e1YC8U/xtfa/tnFjP+QU1yiY3PMCVECcYYJiqlJRwC
	0YcuvIzxYEoKX5oLGCnjZCdcw5rzXu4Vs8RTCXibEbDtanTnIzWgElETo7onJFumwyGsD4zvG3K
	3OgHub2sXMowMrrjphT96pinvVho1vHr7u+S2kME4OBvP/6U0X0l2wXWTGoxVfKn9EKb/+/OksI
	ZEbIiyh9401hFDN60ZBvxdpqvoFidz8jVbKdSrPYrU9VJO9fK56ccoZwEybApO44hxH7bXwrEhd
	4GRx4jW0g6djRhIl8ddaxI4dwkTm8ejkUt5D6U6YRULK4QOM=
X-Google-Smtp-Source: AGHT+IFC9+qMduLHx/kv62D+AKLjqQXtPAZ8B1dS/GnXuolXkXGHpFTgCxFdBl8TxomEObWkWY+B9A==
X-Received: by 2002:a05:6a20:6a0a:b0:240:1b13:45a0 with SMTP id adf61e73a8af0-240550164c8mr20469672637.2.1754920596054;
        Mon, 11 Aug 2025 06:56:36 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:35 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:48 +0800
Subject: [PATCH v8 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-16-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=9j5ZxyjZdsR30i5iMe1iTApH7z3PUuNFKUIRS/3pejQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZDVrNuz5z60KZnXAYs/bnoyBxXv1eeWTkKF
 o1AgDuC4XOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QwAKCRABygi3psUI
 JG0lD/sErM1lA3FS2AYeWQcYwHpgGj06MMxXl7uhvrRUfD5DT8FY/nhs6Cul1JDBSFjRzxd1eyj
 L2q8j875i3cnzub4cIsb7fQ8O1JqjgUB+5a1/4EzXbxZLW6WigUX/DKvZTwe+aO/fdVnNcbfa4E
 fmYdy22zICmiXJdXQ+Lf1rz9oUHEk9bs/w3+tyapZ6yxucM3Os9USjHDWhmYRvBYWF8Qg8kD9dD
 epbcvIcChhNT/y/nSRiXGIuQ+TMXOFACA3mE5sd3ZNkYLurUqoL6DcVj70vOSZcJDsuuMIRDH1s
 LvZUOl4ORicfJpniakAJFpl8s9bYQG91R1OL+VjGSjEOCd41A2lITp6PWh4142P5cHh3qzLjUQ8
 lDmo3HK6lvbRTIEHdyn2xDBREiK9HFqrpsyoIsXErliFprlbN/3r90Hn5tbZBXJ61T3/jN86QlG
 F0VcRmEBvbbl8caYC+06LAc55pk4N0QXnZJZ6lEjavir3NRBhqUUxSN0dQDI6heIn5lkX9fLAVu
 MU3Hk7/qMi5u9C4v/iSuUWhlKCh6p8LjzD8tHwpYkoyMRy+U0Du9R46AGdO+jf6QttdE6F0mvHM
 VwMHUfWhXXdC3mVV5YJrJRCxqTs2SMW5PlLYEFbedo4QJo+JaQnVy2rt/mTYfZf760g9850JXdb
 povlWWmtFl8dRtw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065636_989179_414D6199 
X-CRM114-Status: GOOD (  10.26  )
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

Add CPU PMU nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 09db4ed64054aefe5b8f8298553d87fe5514e81a..bdb66f7e0de43a6a751af37c9ceabba44ef907d6 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -180,6 +180,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 76 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 79 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s800-0-3-pmgr.dtsi"

-- 
2.50.1


