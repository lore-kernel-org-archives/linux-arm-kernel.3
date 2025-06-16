Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB7BC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 02:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=; b=xjtc6gQ9QdL0f1v930BL4nxcfO
	+9hMcLejGBd3xwmF0ss8DFi8nNj3qNkIK7i3B6ymVwFTbNvnkyO9F7UMVQQ6CVaL6Qz0Wc0ATT+v+
	Ufh1BH7qJXe0KT96dZTyPwgdFmwGm9M3Cim5BioPErULkquPP0z2ZvzL+OrYdkjTX5TEoupaIgfkm
	CD32kGDGnbtSDHkFjVvMzmfy5cu2QxKGJDt80OPPihFUOobGlJw44lOF0V62vWcVWRrvHid5pHQ8k
	Dd3hb1CAJQPAUy1iV5fD4KEL+AEaAN1IA4hhABrFdm9qEPNcKTFuYRM9qkgDt5N+mo3eN7MFJSSCy
	F8QAg3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzGo-000000038Bg-27sG;
	Mon, 16 Jun 2025 02:08:22 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyie-000000034OH-0nAU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:33:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2349f096605so51014735ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037583; x=1750642383; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=aNVOHWzChmli1w+cafoagwBTitdohbGydtO4dAhYdtWGqG1ULuLM8sDmnE1ce0/n3U
         OrDGS1l/360qwpJL8QFWnRDQ4Xd639UaTodBd+GRFCknYt916fAFspoNZR0uS57Afm3r
         VPekMsqL39nIEpbohX9/1zrQgvFK4MzCuBQkW9sYmG8HUNzY1PGBbx3G7b5wJdW4ugza
         5242xHh9PL6kMZzt9Wvu7iFZc9Mq8XeGbhHuGrnDp/Vvn3xLFdHbxAppZMyTIFYX4ZQR
         uDZoNWjrbIn6GzUXr5e9iQ+Xq8x74Xiwbh6NuKqc2FRPq621jsSNDgehFg5DR7CdJeu2
         JVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037583; x=1750642383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=b+htqGA1JBenk5kZ0soX5ABhI/NeBfoiql6knPJ6NmulfWwOjrJwwKC5TcXRtDuGGd
         3YCdPPSI27NTV/lnKCs0zYXpZvnduvG1bsMZzfMqdjk2D59FbFAiJUaJa/tbnCt9JPNK
         l7/DgOpsUoZBnWa5c42ALnkSBcTmF6ZBrS2GkeX8dc+j7t0NbWagQsbbZe+t43e+7R7G
         Tyz/ivNxGoREaw2XwxhSp2jq98venReiie1vwfUKO35rQXwED2l+OktzLvOEhVdiT6Tt
         5c7DvXpa5MtSfdMroGtYOudme8aRIN1XeIK+ZOdKENqQS8Y1MU276UvcOhJn9alL/+N6
         f+rg==
X-Forwarded-Encrypted: i=1; AJvYcCW9dWGfsHbU4DNnQYQa+GY+tu+NARoPjYppTPz7oKIPfv0TvDDdiPyUEJVWT7uQaeDsTg+cNXTTw5cMLDY/+AVT@lists.infradead.org
X-Gm-Message-State: AOJu0YzY6w2HMhPoo/DAaaG/5YBu9ItegZ1M52D7ipzbJT1l5r4yfuXK
	wPNAzhzzRWJ5MvhrPsAOvxLenx8t42aD9Z2C5+fzuU3a69UtQ3zqBTXgeHSOcQ==
X-Gm-Gg: ASbGncudZq1qhDw5YLI4JtdX3HM+WHIRLrwDYVY022HhrjlxurkQrvwkfhMfoqt8+5e
	UVuAITQFpRtAeZ3TuJ+XfY6h71bSNwIDJBsNIlykHaC3rH7PVAeFD/ti+SzNtvy7uB/+5YdKa9F
	8csGu0V63g8DX5TEm9jKv5Cb5jpt5X1UkrTkR4scNkr4PZom1IXSsJKyaQeARu1RoHL+cieBclR
	klbPKkKn4IvqZ8lpxwjoyfQXOrxLWOV9mTqeXh9tvKDqhNLq3UZuCwCVa3t7abJ09kLgWYYdGUu
	EaEVq0us8Owj8gDgKogTRNpSqSLcG6vRtPDCySEL6eRfm07XzarJJRmyp2vzCDA8vDFDFOEcEtK
	HzAU=
X-Google-Smtp-Source: AGHT+IHy5nCDE1jMX7dMgjCgj5ZwKnKsJR/VWO4k4I2j18iZ2axryYBEpSYK4EN4u1t6tFlZ5HxWEQ==
X-Received: by 2002:a17:902:d4d0:b0:234:db06:ac0 with SMTP id d9443c01a7336-2366b3c3cdfmr109470005ad.45.1750037583466;
        Sun, 15 Jun 2025 18:33:03 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:03 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:04 +0800
Subject: [PATCH RESEND v7 15/21] arm64: dts: apple: t7001: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-15-df2778a44d5c@gmail.com>
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
 h=from:subject:message-id; bh=/9xxkCL20iFcrQUCvIdlPD0ncxR9ZewCh+wmud58YcU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QZpSWBg9FmOWqt9e7BiOBFKGpVIwwMNXVdK
 GuwMCEHNzWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GQAKCRABygi3psUI
 JLsGD/9JnFPs1MyeLJm+POWVDjv5F+a9vNpJm+yuO6KNRP3rMfGemcqezgPw6r82s9a9QAcmcUS
 e9y9eIc3jEPXvPnb2XwasUfsWUc9La8BY0JBh6GW/GqxNZq74k7cUmx0GNAPnYMJguKJ9MaM/uS
 mYdSEQQwx0zF08zdCF+TIhcCCNV44HRmJcQho1WGks4mDBTT2pEWHuL9brJMwc7AOz5Y4YZD6P2
 1gdjivU/DRiq0T0xRviM8dN/PZkIaVlv3L4YtV2BNAFNySn5wik/fqc+3rFnK2DdXk+7vtcOAnS
 5t0PhyZG+KQ4h/sZx0iwVGrboOo6zYDaEZIIdMAxvwCXu4Qu24YjG2Qs7kJdv4KlT5/3UUkKNAK
 Ur0BRsQFuoRo1JQrifvrBR96VYsHOEy7If8PnROIJc0IwW19rLa401EuLK5g95gDipM01PHb9hI
 T8vZVxw2I6dx4Vwpm0FQ+voSuuoQFPXBppxWn8bl7I5nL8goEG/ZaNuihoBClKlBm2J3ZX6M87C
 SUdxvoHcw2TwtmhQWD+JG18vepSqXUFzm3qVprjqsrToYX5PjV3utlEUDnde29w831RCSbQ3gea
 uEBEYrke286hIdZ7BREvxU7ByuQq0lDsn0zWnBbVecYLqaeXRx9nJpaxdS9puvs+OqbbuosOwEg
 q9i+h135Fi5iKiw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183304_234917_479AAF3A 
X-CRM114-Status: UNSURE (   9.03  )
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

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index 8e2c67e19c4167fc6639458ce79588e153336603..fca0a100dfd7b29086735d36fec0db51144da456 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -183,6 +183,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.49.0


