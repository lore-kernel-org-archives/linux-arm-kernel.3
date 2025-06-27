Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045EEC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=totF/N0o3eF/DAQAGujOwbAUfvbVdfGY/Qpe6oziQJ0=; b=VGUAcKx+jpTRqL658i4OKvfois
	TeHfVAq9JUjVkhqYDE0dDA47C2GxuK8C//NXTK3/p9/JeR1JR8tEPWgs47wDhvXauyy4snDTQTSNg
	krH/5pw72GzUgfC+2BszqLTRdaxrF+7+uLixnRWQZsoIFy42wFsLap4ykvD8Cueu18ETaoJYpBx7k
	ZxxqYQJDTPFI8ZISId/HBXHp5RJGkJyqcWw0rv3YTITLONYz7LRABWSOZ7f7QSjPPZbPgyMn5DDUp
	pwFs0HOo/BpkVEMttxl5ZLSud+CK8UnyLBl0BBoVlVTIfTpIK3w9iA/BsEZxHZxqRiLuGWR/FjTxd
	7LHIEs7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9hr-0000000ErCE-3Yjk;
	Fri, 27 Jun 2025 14:05:31 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV993-0000000EmOW-3RCU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:29:34 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-60c51860bf5so3357696a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751030972; x=1751635772; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=totF/N0o3eF/DAQAGujOwbAUfvbVdfGY/Qpe6oziQJ0=;
        b=UGip3iSS9urGwh1BSfu7KgO/1dmXRJ7PJ0q9TDuMrRvGBiGZ1OGNwklMGflDm5iqTm
         SZDIfDZFAjrEz7kikUiaydJ3DfWCs9eNPcHBozFbvXroAE/ZPoLf+KOcMUHQRY2f7UZK
         TStU0wiY1hG+n3/qOnZ7GmXNbBP67/EuRYvegUfLorxYahwiGV4/1hPm8THWu/k/qrHs
         fCpqrg9UGGywW+eZNyVqYyWwH7jG+H5gAWQlqKcGcL1oTaVV56dcw+R5zdamC4/kkXSI
         aAaEGEW/jqIUk30ybUHSUoIqdI+EZIyoXhT418wjgkrZjyL24Nay4RfDewlM62ROxppb
         5pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030972; x=1751635772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=totF/N0o3eF/DAQAGujOwbAUfvbVdfGY/Qpe6oziQJ0=;
        b=M49h/JZ5rjw0TKmkTcvTcqvhwpoqJl9x6sDAY/YCaQ8d4LgXFrLyhCnMazDOrglibq
         zDb9qtRlD0jhhVGNN07LGdPDY8YxgXZmJnIPsg+kjhHdgHo/wUARpwBkedJWXiQszRzc
         UAOdJF/nkOY5W9WFohO7EC6Jp+ezpVVQi1YzNhl2GlBwSM/0leVkjoz8xjIB3a4OBnuz
         6eCXfa5u7X7hSn18RI+14w3iqCLWCqhCoAVioOHmoEtkcCeo7nP+ly3pVya97TjSWWka
         wF18OC0AGhHdUTHdjrrxnYAeqI1SBQ8PWWcC1tzHwacv27xm3jc+OjSbulVmwxp5Eb5l
         Pm4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2OS4nvATK0i9GCJjj6ouJAWifUyagE7B1xK76xrb78UumOom9n/PuYci3Uxf2Tq8C1hmlWwqassuxs1W6xVlX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5Q3YmccULvUVyt5g74myDSITMb/NZMd++59KPuZtpXHahfJaL
	VixXSdTg7m0tGbMSOhQVAceUueqrOlatiPjeYLbrUbj209QztAoR0w7hFLwvYGm9Rcg=
X-Gm-Gg: ASbGnct/02FTMzuCwCds3EPkc2/Ra1OUPio/RgcXglJNfdEv0xISsnh7sHpdEhqUiqF
	0W2p78M9GKgE+4w7tClWT4b5ZNSKsw7pMsoW+UYo/Lhpj2cGpnQuCRlZHryDDMbxodxi5YY4eqf
	8KWE9Wv31EtMZUgP7i2EpLN5VHfVfn/G01jtBrBbQsQHzOSjxSn89NVyZayCVhQ6y2olwVkh78Y
	qaSpADRkwTC+IRIMZM4yJ9G4H0tf4aVXZ0RQaGBdUA0H3TgvlvaJ8ODWHg9vzpskRTj0ReaLZuv
	FjiEQ9zscmBj8N1gUh5jS3CIULZzTMcoUaAVuvt6MSiLAzEoZW9+fJfKyzFk/iyVdXKm3gAt7lx
	yKJtuP5AWA1gNTjJM+By3vYDAvrdRhRV/NG+l4r7bITOLLQ==
X-Google-Smtp-Source: AGHT+IFqqEN1CabLkuRpa4qT0ns50eEJVky5F6nDsnGYV38k/xhyp5qqKgZNhwr44qSRdsoEwoz0Ew==
X-Received: by 2002:a05:6402:3124:b0:60c:68bc:7fca with SMTP id 4fb4d7f45d1cf-60c88e72e9bmr2087602a12.27.1751030972308;
        Fri, 27 Jun 2025 06:29:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c82908297sm1462702a12.26.2025.06.27.06.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:29:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Jun 2025 14:29:30 +0100
Subject: [PATCH 1/3] arm64: defconfig: enable Samsung PMIC over ACPM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-gs101-reboot3-v1-1-c3ae49657b1f@linaro.org>
References: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
In-Reply-To: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_062933_856144_241115F0 
X-CRM114-Status: UNSURE (   9.78  )
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

Enable the Samsung s2mpg1x driver as this is used by the gs101-oriole
and gs101-raven (Google Pixel 6 and Pixel 6 Pro) boards.

It communicates over ACPM instead of I2C, hence the additional
defconfig item.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a86cab889eac60256b28619b2cd2703765b081ee..557b592821d5d1fe8a5fab0619967e4f98894bc1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -775,6 +775,7 @@ CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RK8XX_SPI=y
+CONFIG_MFD_SEC_ACPM=m
 CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_SL28CPLD=y
 CONFIG_RZ_MTU3=y

-- 
2.50.0.727.gbf7dc18ff4-goog


