Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C31C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=; b=RmlzLkMUL3XMFo0jwGaHy6EyCo
	gV26LRb/smQVAuMGaakry5n8IPHw9YwqjsMBf7xynQx2a1kfqPqLhXUdtZuyIOOyu4mRFKVeGEDrQ
	WGs6KjLqnZ3G7xVX8R3lFQsgzG7nauE+tj3JeAxhxKsbNFozbTL4vsMItozFOLpMhG1u6o4mE8hY9
	npPR0opVIqL+NHqT05iCr/G2IkGNEPLonww8ZohCCFMQk1kd7nQVoFbE6tPJtHr4lo/LmTPxAW88B
	8a7bZVqt56lJKtKd9SA3aw0NwvRyVLJbtmOX9xRIZzGRD5oKM5JwyyejP0nFstjJIvsarLvr5VSJd
	Eti9dhpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eu2-0000000GR6a-2sU5;
	Mon, 07 Apr 2025 05:20:10 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eO4-0000000GMu6-1Jx8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:47:09 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-224191d92e4so34159835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001227; x=1744606027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=B4TMPQwXdFleDdBPa+1LYebyrXoNzv8A54S3/KLT6HUmeaaaM8yzONnnaf7Nm8AdQ3
         aPfXgxzhpbxHPD7S3Mq+wPFuvy/zLjLpvDoD9oZd+7kbWh7++ZBYPM9tGIFpjcB3b7UE
         4gOo67jS08XnE1fS8VCF9PVD2mOg7vuu9eiJUC60FimD6j93zPTBUoyHl5KLeOSeVHsY
         w63dmHyrhQ3gMjlJSBUCGZTZTpJeUFK3hXgQiEx2F9ltuNJiWz3DMPZF+2M0JU4aEpru
         3HWbdBGvyANtL5XSLMhyffCUQEX4g7opXPpfwMy/GJqGkkrotR6YGTzpioYEK79RZJCk
         94Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001227; x=1744606027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=vT2LZcRfEHbFy/QBqt4mpWad+GsBoOprvE7IjcLFgQnWz3Uu8m7wzZYZbtd8duKOFw
         ONiUvTTHedfwHaYHP+ugKSla5qSB/k0YoAuecWmYEqOom88e71Eqin0r0K+2hbQw5ywM
         k/OgdR6/JfpgEOKmh6P35449cUWbY3BH1SfTstb4uAqjcGh4lEF5qxIc3WawXIi7oa2B
         jciAXUXiFKaTcF1aUv4JDvrpPFgxDkXgqWcpTGLPgloSqiHajcl+AVJR56YDzZBQV1fc
         OhJJp9j/lx5s7lJ01BJuriNvRwmbhMzSsSTlVaYEGeDDOUKhOPt2UdiS0dH9fsKUFJco
         9yVA==
X-Forwarded-Encrypted: i=1; AJvYcCV0GBWBsz06+WiqHdT1ak5AKln+7BrM37/qlapNKbVEOcCcBGSuTe0vzkEN2UPROkvdw5dPzwpeu1kVWMBWE3Wk@lists.infradead.org
X-Gm-Message-State: AOJu0Yynfri51waVmfaTzF8w1cQQiA4HWGpKLuHj3+l915+j6LJ6wrk8
	ktmqzzVWR7Ya5TMxfS6KwCdq+jzf+soIPBuBBHzl2HUvLcjjEWvP
X-Gm-Gg: ASbGncsqYyOKIPj2zRSsGhyxBWG6STJnmbmZr729yosRpju2UBdNZOiwqD5RGhdEugZ
	FazKy4kuE2lrJypYHdamh3Q8ulHJ6W9hCMjccg5It9RXo+RPfkf4sq7vN6K91bH1mqdO33fIX5D
	n9eFId9n/fZimGP8fK+B+riHeDAnhR40P6onn4resSuTqPPmJViPeJPUGvFRjj9M+bubkgs49jl
	5y4hxL6VhSQQ29JvgC0i53GPm1DIGjKGiLLlfhJwfkcaopdcp0OgHSBX4NbLJ1OGlRURn7zcQki
	VmO6hhiCTWpKuTiyRtJF9Yf1olAiTmHrK7xdlQv5X45SCps=
X-Google-Smtp-Source: AGHT+IE+DE3EWv1aKlh94Bz8JA4seu3KmM9WM0s08sjhFrEsGSmGeJUNiSmwpLsmoUUQY8pv5LSvsw==
X-Received: by 2002:a17:902:d489:b0:223:4341:a994 with SMTP id d9443c01a7336-22a8a045de7mr125661005ad.9.1744001227288;
        Sun, 06 Apr 2025 21:47:07 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:47:06 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:28 +0800
Subject: [PATCH v6 19/21] arm64: dts: apple: t8011: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-19-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZNIQgw4HnW0u/JgkpB+HMZ3DOfGGfZVMtPocokF3spo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iIDBYKpxvsCOwL2YFra0cWiIJPhOHO7+VIH
 kzb6LTpKzuJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYiAAKCRABygi3psUI
 JA7ED/4qJeX7OAK2IxaDn3lKAvbwATBH3e9eb6/T4aEt3yPf2dphL2hEPRe308zOPQgjxDdRwgu
 VTbRUMG44ch6lWi1op3uRNWG5Hz+C1dfV/gPmJ5PcBJEIup+xYIgSQSV/v6I11H7oODuzcnwFSU
 p2SrthI0VbLdpX0U2QevBc/Q4NYvFtcijRssy6a+MaBIW1WeoPBm2QUDj/H4rlKLJQ607KSwIaP
 uNdX+P2cXjJj0wErJyWbSEQqgm+MWYiOS6TGIZSn3YaS4Kw8yTG3wlQIF6+Ei9E6hulkfzabyrl
 Co0dT0cXQXCfLI1vmpGLgbUohPBf3EOTmJe/6dUfWTmdrf06Vh5lCAzLU1Ks+EHDSk92ayMh4tJ
 STPc0re8YtkTUPG6N3tYltGJTWJPS5gUniPl6qugSHTXJF4eEvj443FAqNVrKVy8N6PJIVvFkox
 jWa04QGoA9EKGADBWqNfe1K92iCaTeMfXHoucWH1Dd7qKZ3dnCXzspLX5Eo2gszqq2ffsDqHZnw
 9jOhf7wJVt+OJEguvxiRMZ+kMeVSKIrjTlkQmTY3J1B6vxr/Iz+zZn8pJkA1DSSfbzMXRWhm+bj
 BSeIWwWnW5nonD49y54h1L1tjgV2r01C6ZxqsCSlCnlqtWFgM33gsodoOgIfl00spTbTaKNamdu
 kvcREvQW2nhXT/w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214708_380656_75F6DEE8 
X-CRM114-Status: UNSURE (   9.08  )
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


