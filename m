Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B47CAC588
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7IroGFfuMHil+70rPWoixnASrFWM1LVOm0U4Tub+go=; b=24DFNy5oDGRA0sHMEi2uWNWfsy
	WbZBY2vGfLva1AFBpZfDsHbkAuh9qjbPGD7rTLn+bXczjpwIMkWic+suOg97GFYkeHweUGZwS79Tm
	C/YrWZ4KKGPoZKGG9B47M/Edz2nfrnHsohf+fWPlRzlvb4rYQEGUlyH8J3tNWF+SRcf5l/Dnx3wHt
	dU69WiYHOr1Sey0kDOFEziAcqiYTtcjPN59SWMA8e3EId5ebAXLAxru4BggijH2jtclRtNobRSCFP
	9G1FEsKUBZ+9xFttw72zpbq0kVKoywvlrCH/FLF2c5tc+uYx6fLg6gG3eRl9K1P/sP3lyE9XDkt8w
	44dBk17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvabn-0000000GqL3-3ra4;
	Mon, 08 Sep 2025 12:04:31 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYg4-0000000GDgY-1hYT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:00:49 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b4c72885c8bso3399789a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325648; x=1757930448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7IroGFfuMHil+70rPWoixnASrFWM1LVOm0U4Tub+go=;
        b=LFXVRrwdRUuT98O0jVcstoK2ojVi4Gt/Ld+2eiNN4d+AVksnxhBkqlMjEKJZ8L4liM
         l5rFImvf5oT6lPlOQLc2lfXSMlWnrc3mEdJlMmKSBiv4Zj8mnQ0Sv9D8M8l8oZAK+PER
         0RUJkXAPYObc/0Xbnn3dcWqveMPMNxa1DYl8xdRW3KQTTQenvIdmoYMgfPzHjZ3U8cxi
         DB7gMYIRZtkMaTQzycmTbwhepTizLeu2L/OBJzOHZZroOdyDT4mMDyHQqLD0TVukYSqk
         5dkJpTvZ3Tq8oa+aggFRWcdfBsKf01/ebwFOASFXfszgKOrTCaOWniz8FTBPu3YH4FSP
         T6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325648; x=1757930448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7IroGFfuMHil+70rPWoixnASrFWM1LVOm0U4Tub+go=;
        b=BZQFoFzHbZdU4NLu0dgF6S2YSkJI6t58N0Cp192cgWxCEM79mj9eMzFUWlkT+qyVNX
         U9VYCoVDyqNph5OaWwSamK7f0VXOc8OqEGyb+QEXl3w3WfPP9oqCzCDLNE8nepRL3W1P
         wH1kYW7o41uAW249UllF0WoCliFmLIF8PTYZqyNAbZLcgSDx9uLBFU7qo9OfImQ1XXfI
         JRMEVJvWrXgVi0Uw3NN9Z143Q8fnJ0Hr9oZTgBu7w1+ArU/ZbHye5uANR4cnXU+sfPTU
         grwGcA4kzxFrk4xYd/Rym2gvTUMJegh/3LuTKsC+KYnGJWjCtq0WRpkZswl6ZVRWvRYk
         /PVw==
X-Forwarded-Encrypted: i=1; AJvYcCUf0Kb58AV/xooLZuf3JaYjJawh7iKIjB6aJDQX4G2RIjeIgcfWOBE8OJiYjR5zyUbhvx0dHx3JcQLNy+7tcney@lists.infradead.org
X-Gm-Message-State: AOJu0YzhliME9Hhgz1auzxyEAQUQAbwl23VrOielAvNn2ApxkYYWMnMK
	zHz0EsIrglTJROpaYj5K+563zTdoy7aSSTYl29Tywo/S5CF7VtCti/09
X-Gm-Gg: ASbGnctE4TRGQ86t+VA+B/jh2KDMxaGq4NQ8PXqlT+g40F5+j7sUnaaVZsvE50gou30
	Bdq9exJuSlEXuqKrVTqfDEG9bROeFUw9beUpxOrYPxB24egl8UnAk9Xe8IMF7IS2dc4xZ1YxEpb
	eoAQuMsLNBaCGX26IKp1p2+VvqFMovHd1+8KFNpxH4GH5XJUjBQRr3j50jlmnd3IlhieNxGizJj
	D7xYY670mKJ8DnzwJ5AcnXPavNm7R2Bn29DTFoLP/gB56rZbXW9/YMALP63G/aMMBShbzi7NgN0
	B6qhwgkKHQiDlDu6qhcvonRrO/AUFAOqgqB/9p4RjJrqValCYi5xH8CX9xO1bVE8sNv6VqIfY+r
	GU/6yaJ40540h7Lpw5VZUBr80tFdmWM+Hy4ZP8w==
X-Google-Smtp-Source: AGHT+IFsPZJGbWQibtI69hZHXu8fKVk5G6jBIPDZggi8j75kOe9U45Z2azxmFroNNw3gmJ/V7Ni/Eg==
X-Received: by 2002:a17:902:ec90:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-2516fdc7190mr101918085ad.18.1757325647510;
        Mon, 08 Sep 2025 03:00:47 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:00:47 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:25 +0800
Subject: [PATCH RESEND v8 01/21] dt-bindings: arm: pmu: Add Apple A7-A11
 SoC CPU PMU compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-1-d83b4544dc14@gmail.com>
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
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=octx4ZTnNO/R4DCoPqgavGVNNjwOBSkdB0RJJeuCRxU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlChNFI3mthcIeTlCYyHJhPM7C5e6BjzCC1N
 tL6LoHRUq2JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pQgAKCRABygi3psUI
 JNUTD/0YnBxui5mvov2K8mWd9O1tHzRdmwtmrjY7djVyJI5LorUssKVMdKsrPFSkBwwilP42wqq
 KKLZwunYeSkkC+QRtBrgWnK0Dnk0V4GgAx0Zxz/5R2K8Tb8HWN/Tl/Wp8OYPmBZig9UosPdVLT0
 tRZQo+1EhuMsr6WGqsGVDG16LP7rlqmBK2+yipL7LBZgGNM9DP6VUR3NZ1ji794Bo/zvxWPK6S2
 2INBnCWOCPmbj3Y7ucHBjqQ5Wqo6s+ZUWDmPAt5qty6Pi9rS4IdDUHQd8RNiDCRse+HWqaMWuPH
 VdlCbRmMSZWzkRtNamANXo/d4ByNcC9mmGlpx3GQa2scfPhATeFipJwNm9WqwRdxswkqGUUiyqm
 Eu62wk88oVRSdAJxJUtHZ3iiTlbnkWpc7w3sXb5U941oBDcAhCbbdqVVXGBeDMJY7l27HOK/INi
 Pkm8Ji+xmY3aKOh4ccjw4oYiIZ7A3OZrzCK/Gsfj/eecxPlR84cu2i8OqqRtvficgTiIih+ULMU
 VvDtFCWNaGNn7OoObj93WI5B9VWzWi6s7SmA/cSe9sQ1gsoRO6Idfb/fIkQGZjSNorSbmiTeYRY
 SfbZuf+0pflYNFivXnZu0AlkZdhHQQIMJPDgL5Z2QkDvIvMjALrX28eDsTFmA2b0PDHgiyZvNyp
 /OYG76R7YW+Sz8A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030048_447618_40BB50D7 
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

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 295963a3cae799a54560557137dd6b3cf4bd00f9..3726e1b78c42f150cf1dc68a6b3aa3541517c311 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.51.0


