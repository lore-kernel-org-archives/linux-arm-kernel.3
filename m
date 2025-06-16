Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC41C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 02:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=; b=LklGITT5gu1K99MV5Tl5HXFvcn
	dgR8Su/bUWqr5dKFdH+iMlO1pz9cDXI7yAAq+CvmIWzeXW6LpiDXPeFxlyKgejFKwZs2DYJ06mHRs
	AbomiEVZSuYYhQ9vwKSheG5zwa7xAnpyZPGrvSiYKWmFi6+yiaQDMikO2kPr0VKh9SoGNyStWw4bR
	KG3aRS4vhy/B+d56BzvRvBf9Mow2lLjqoYRGFKeJfWd1oFS54CmIww17WYq7JPh/wKvzcWRNk4S/S
	6WqghAe7GaFFx5lklbuLd1pvYDyh3rAVYbgY3rOpj6+60XPkOg9cE2mOOfDZppOyw9dCwffPHs7Ag
	ojEVEJcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzPY-000000038mF-06hf;
	Mon, 16 Jun 2025 02:17:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyir-000000034R1-1swH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:33:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23633a6ac50so54518685ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037597; x=1750642397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=ZaZVd96XuKor9Ny6aHUlvgCV7eYb1X4GyGQKASerFXC8RLUBR18Yxifn+JcfuLX35+
         5zDWH2roJJeiGdesr4ZVbWcrdP7idk/fTz/EpoJuMG4ge0sczUhIyB4BKuQ1dIAvtBoH
         jRFZLp/k/pj8M7FkqXbbRdOCWseHYtYjcC51e9i4caon8c0vEkcmXsxS/mAV2oopdy0j
         i7/hL+9N6x3Hm1SCoC6TuJRP9iThTByG5E+H2KA0NNY5pxvy9ZLZ8TR+M5be5Zv1k9HZ
         S+yU3dIed6J7FHcBas1xvfDbQBVlI1+/++MGVjvLmb5azyZ7PXaFyfSRQ8IgFcy6FHQx
         ewEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037597; x=1750642397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=D7QhGqsGSk0LiiZ6QdU9k6mK7UX3WEpcgk7VLImLaTi5R1DPnZ7VoVqUOKo1GxGmGX
         wd/CZ7JOWbr3PKevnjybdWbH6hO5rXcEpiINXcykipqp0ABzPZPOdt7XYIooIsXt7908
         kXrsUW1mlI+XGh02m5ETxOfxr1t1x/sqHkLUm3ovGXh1KeOKDWobHN6yKgzkJK3/1iPJ
         vaDAQCME6EfKYF9C9LfZTc52fLixzH0T3DfqBTVmz1TYM2MkIG7d4LKiNVFOL0NeESdE
         qtR/x1M/74YLHpX0e3sjQvFY7Ivza4q4LwcCVAyBlLb45WsTx6bcxfdNJb1WCuY1Jk1l
         qnEA==
X-Forwarded-Encrypted: i=1; AJvYcCUIh0sFgq9f+B1DM2csTCXFv1veLZLuOuZap0W/ArVm/wrWudae//M+nXZ4kazRbYyVxQ3jOjfaVCkNqNPHKfgt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6cyfJFwm77G4/LolyVlcfgFRQd4h1NGNa8KrgMfCl9/y4sTdC
	u2ZFjokc5M93JbN2aUtS+BqolakIfMsQbyndW5rTH6t1Gr6eyDn3kLlD
X-Gm-Gg: ASbGncsrq51/8DUlSW8nehFGhw1KZEekKXgzZXRpSEq95ZSWopxSd+kgRBjT7zriE6R
	l/CJoTtguoTVjgHAKSPz2o07wiIxU4S1VZmhjutjZk41oAxIypPHfrqqOh3dtiMCRtKiO5oqNIQ
	kOi13KC3JTmfYsQV5Y2WRhSEUB5KGyppW0E2mKGpkKtN5JZiwk5lsBouDSN2urZ/75cpgZoj2vu
	o9koCVSxDwkzN/ULADSJZG7aIj9MXJ8eYAVobBZl18AOKw/tKnZe9Cm9ttPmPurrCUjhEdnb5hb
	55r/jvEK3hMxXtESvCWeTqNsaoUVIHJihU3QmVmKDax2pOYYcRBAcScLx2OnCISxjGdZgCcwYxf
	j9NV7Bl/DBJTOJA==
X-Google-Smtp-Source: AGHT+IFC4kmacTH0NlpuXw2+AHIez/RWDk16sXkzaRQ7d+t9yRZVbTRSeBAnjLskCJcp8Tm9FYJVhg==
X-Received: by 2002:a17:902:f786:b0:234:986c:66d4 with SMTP id d9443c01a7336-2366b3df1bbmr107762165ad.26.1750037596711;
        Sun, 15 Jun 2025 18:33:16 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:16 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:08 +0800
Subject: [PATCH RESEND v7 19/21] arm64: dts: apple: t8011: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-19-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZNIQgw4HnW0u/JgkpB+HMZ3DOfGGfZVMtPocokF3spo=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QZWdhHDCiZqkvL5f6HSoNB9nSWhxYFVv8Y9
 Q5y9dGYYNmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GQAKCRABygi3psUI
 JAywD/4t8Ntu1bnuUwZ9C2UgMJtMiWBnFnEccj46criNwf2bRK91G23yflsorhR+WyOJlvMVPUx
 BWM09BOztn1FDKIKjQEz15R083BGOlEC2TVI6oxhGiuDYmyG1WQBugsOcNsi8ZLs5kZuUZYsd3y
 0gdo6r5UCozs8OU0Bp0YLJ2BZoansPF7XfL1Fr0yz4FI1ukV7e2Jdhv4bpd70CU2ihw34FajulR
 AVzrNQi/ZYuuFGMbZaAk1ON/lYxjffEWyBkZIbbFgN3x0doi+M4PdtImZde5KQJq2ApUhzsFPzz
 HuhngbjIs2sGlUBwE1dWAvPYF8tsagQ1Myx/vgdDBUGMdvbXEeg3oHmHJY1BI4yC5e/8jvZ1y+1
 c2p5K53d/aGrFGYpXzDtyekmmo5nLkGX4oz/vFvyx//ItHiO5UdAQZLn2soaZuef+6/AGk3u5tm
 udgh4C+WqOh1lIuqX+FkYDzM20877vZFN76TJxN9Sh+RLHZOM4MsCzBVS8LDNoSEaomATSLDbKD
 1fQ/6TrTFedYy6fooLi5kumNKnBo96jAMl7i/s4OKSq64X0LyWzRZrtJrphOt7+OP0XnW+b5iCk
 8KWusZYlyiJBFKXCvHZqyWqBXHUy5c9PMfbE0VuNUMOtFH8Zb9sjetrwYiJrRdXo7XqFePFWKCS
 uqNAR3lt5xMOQEA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183317_492043_3299B9E8 
X-CRM114-Status: UNSURE (   8.93  )
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

Add CPU PMU nodse for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 5b280c896b760dc8b759bf38dae79060e34dfc19..7fb3ab738f67583d9a19a542bf36ab2806268d55 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -237,6 +237,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t8011-pmgr.dtsi"

-- 
2.49.0


