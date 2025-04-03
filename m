Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6053CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=; b=FjYEEegKWnoime5B4OpmaHMCRG
	aMuKcwSEANMEc8Z1tzc4kS/MnrTUrUYge9E+5TCTzqG4z/lFNvi32UnrRw/ZDJ4NurqT4XhO+27cm
	K2I86DYJQ8VWzSRkZnzRHOvUT2kRv9D4VxhXHI/p/bXuUjO6kpmjDzfkPXG0HEUVHRAKlj6r2Eh4N
	A0/HWaezK82skG6/rqSKVDR1JLhU7CEPwNSJUWMMZdBh5F7c4FqJqQBZo62LrYEGUcgwj6utq8P9M
	V/glPkxAm19U9cdhT7P8OBBd9y2LIOX/rtfj4Cz1cM6qITzWVLagVr5Rg4OKpPtSKw5qnY9bww+Bf
	Cca/12lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GT8-00000008KWu-1Wa0;
	Thu, 03 Apr 2025 09:02:38 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPd-00000008Jev-19Rh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:02 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso1179529a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670740; x=1744275540; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=i/GwqpstNeTCJIduEC8U5hhg8DPaaUd4C2Z5dbFNxRNlIsHpJb2xUuJGh1aYah6zjg
         wrjFMGjFJQTBrQU9lJJ3A2seFSODj/NXFAQiSG/bvKsy4u4V94WsrsGBe65+nlp4Z98v
         R/nc9iEZ1bmlxWA/Ve2eWMuhJQ7zguZSHGdeS7iAp/+CAoIaXb+qIGei5qmk4cbC5UN2
         JcbGkcYXThBc8vrbC0Hd+5EBDXq2/JyHuBuDkqs2i9Zj9el4Zz9ix9mR2fejihQgX3Vt
         E9EePbvkegZ//7y6w8to1RSeFjPuFP5V0jde73CpP1+PnQ5BMACqyNwlMldq4lC0l4XY
         L0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670740; x=1744275540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=D/4+N3RB5FY0ZFXiQnxJwZKrdWuo9l+Yo//pE/kAwcqebnOfnnBDx0aL51a2aoW0Vf
         KP721tzW9EwMlNQ5HebnYGTE3QDfX3k4BfePyEoR+tmKUOL9rrlUYlCqzDAdaM3eZOkU
         /j116rmWFLr3V1h0/lyE7e8LNFAK0xFzFnnZqAH3926LCNJyvC+vGGupoPOAFvsk0X51
         9nBFzef2wsWt5olRksXmQVFr68ZvwaywW8fEJYobAfUUJFXwxZe5ecXp5qasevueRoZM
         HYcvry1COh69N8KdR92bZYUYIQdc8fJuGV+xnype7cquy09gNNB/xHPWN8w85oOPtUHp
         /6Cg==
X-Forwarded-Encrypted: i=1; AJvYcCX7a7srF/Ir6SJwWBaxvfmrDyyEyFrYRs2uZJM+C8v/7HGDm2y6gEKXdn3TX/XkzLR4a1gOy2/WN8h3UNE+X8Q4@lists.infradead.org
X-Gm-Message-State: AOJu0YxM6AjVZMXhDy848lsu9/BuMrs+xaWKLVg3ybHTLEEVdzlChvv7
	UUQ83OeP9uwGheB5XrwW4YeXhakxhNLm9JLXsALg7nbyiobRdOgkxs5T4jg8tvA=
X-Gm-Gg: ASbGncuhsdm7VYeLQvxIFr128Fo0rYanZb24XNN0wkA0RH6T7sceDJOWYf42tRcLrfp
	ixMT++ig/ohqETROOb7OZeKIPz1p81OFaLv+5HsaX4Nm1mgyVOc8ViB7bf2hX5mjf3rwYcyLMCu
	zpALp0SMgmhFgfvzon5hXpKIsf8tAGywPUOPleNJ9Nikf54CY3AbC6JA/48zfAcNJ4YZxiQMmCk
	DLDJVBfkktLPOCNhRl3dHIy0W/vm1HeS7+1yP7m0zStbQsEmbgANZdLOi9yDjzFaWQu0OQBEKGW
	2iEMPScmcn5a9ijxd9lk3IQPfiPcbVvxIC2dSugdscWlQ+BFhQT1M+Osd5hA0/SsaMQWOdLbpvk
	G0TN1UY5bTeHTbuvMX2CwpVXLdgjO
X-Google-Smtp-Source: AGHT+IFpNCgTUy3yn5kNBStSgNtkMlYeVkvi4R54YROwAonbhkdXCkRSsgfQeF745WZBnvMJR3nP5A==
X-Received: by 2002:a05:6402:27cf:b0:5ec:958b:6f5a with SMTP id 4fb4d7f45d1cf-5f08726ef19mr1525065a12.28.1743670739930;
        Thu, 03 Apr 2025 01:58:59 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:58:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:54 +0100
Subject: [PATCH v3 02/32] dt-bindings: clock: samsung,s2mps11: add s2mpg10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-2-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015901_311577_3AA78E39 
X-CRM114-Status: UNSURE (   9.72  )
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

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.49.0.472.ge94155a9ec-goog


