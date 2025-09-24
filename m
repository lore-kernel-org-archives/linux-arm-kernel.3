Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C41CAC5B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5s4FpMZhs2JDSa9c1gCTflWw3s59360Z3ANCY77Ti6w=; b=TqKkeZ+b7Vs6PsyNBNXm6hgHS6
	Yp2/mbxGW0u/mji/a/6nThzw4Gln/3msni5HCZFPEhrNQEnaT2Too7fKShnUV+P62aHbaJctujXU5
	A0M7Q+kR5ZmVd3o2qfNcpwjYsvAyC4gLIMXK0/RJaWCEeo/NYX9tW9qvXHq1U69VTZteXGGDa55jX
	fYq2RryHK2sZhtHbtKJ5CBPJC2c8oDoklKw0bu10lj05apiiC92DXrPJhf+HT5tV8w1NbAmESJ7Ho
	k4hlcC4I1Mj6PRpgvD7v26j1Bbt1iUI/h5Dr0ZG1cgbmz0hXuIaImXH+VkDTtoifFYBbGdssngGmy
	ssCDPBkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1R9N-000000015aX-1spP;
	Wed, 24 Sep 2025 15:11:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1R9H-000000015TE-3EUA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:11:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e1cf9fbe6so23581515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726674; x=1759331474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5s4FpMZhs2JDSa9c1gCTflWw3s59360Z3ANCY77Ti6w=;
        b=EIxUNGIVCC5+gd6fqU2zFvLUWwOKAtOkf0g0xyMk78OL7T9spQMrIqW1DGI9K0Kwne
         e3FG70Xi1/P5rCpJEYcsPkv3j2GQFgtpxwITAdE/s/mWoR5RqilSgtGy/1NiskqoS20r
         KJknYmasKYn24rbdxZUOF7ed7qu1Sgst7EdgzOCtkNHjRmrKEgMktPHjm2AYftg6kU8f
         icM794zZfcKbdG7332oUtk07FUOmsDJg3cceofmeEYWyRkgIgfXs5QIxM1I3mrxRrMir
         fzyeQV9wK4DVd1WHmXCZmTfP4DV5C+lpJctV77HQxYFETxV3X8Jif2plnHCcSzj0qOoZ
         E4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726674; x=1759331474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5s4FpMZhs2JDSa9c1gCTflWw3s59360Z3ANCY77Ti6w=;
        b=amA0lGwPASK8I7FXNLIxVR/UJINTtUhoLXUlwmCr7DdoPW2oLzKgtfRNerNYDtZmkv
         IqNZK6zGRyTLCEY1lRKVQuBYFW4x3OXnYsNic+AZ3ua0opnkS8O7jnY02TY48hdSowyX
         b/vYU8ozXDYhTiR1bDwSXKo1cdllpL5ie1jufRJHkhC75BjDGKV6QyCnB06nP7FIHXO3
         myRmCqdl4oP04/9iebnbSab45Kq6C4iqC+lW950iJMp0677mCdkitsP8k45U4ZhNTuuw
         gDQ5QjnrI0Ok3LkxpEmmJ8Gcb1iP9xS1VWSj+dJ3ysXK9hgdMvmo8ShggcZCZyY7zJtB
         hOLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpcFypzdIdcp87cAlieo/3EmScALSkbINxX0yum4H6HmT0zHeiQKgk5d++qjsDk0lL8EqZvtYBig4UZXraFDmb@lists.infradead.org
X-Gm-Message-State: AOJu0Yys7frmMnvFUbB4hT1wNyXkNuk75CcVJFhS0LLPu4qUbtlVFICY
	1oJIlCOnoKOZv2CbgfSDpCjjiWw1yAIhReHExO4fsckki47oyaEU/d8t+jgzYfArmPI=
X-Gm-Gg: ASbGnctvuXoy4Vz1vzOgUsMokF+zZhjhS2ONfj+317lfjvtMzA2HoJwYhV0ZagWfnMq
	+fs8dTfysVFt8298yZuRRgLbRCHRP+xPTNWQ4S216p4bUPr8rxk2QawUGNVSXyW3LPsHWHsSo5p
	6c7EW1abxs10jZIb+tM2nSEj9fAAPd2BFK6+0FIxJ4OrJOaxtk07Z3Pu+LdSpY9oA8Ve7bY2+Wb
	GmLFb+Vx+rptn5DKmkXdKJtErkp+zM7r/ussDCHAwg+UheGY5M0Zi0//g92bVdRO1JrUt7biNyj
	5yLS54KRzE+n75rdKNo0v40k5okkVzajoDQDvhrw2mEYgj14ssAXpIOp+LUDhyBl+yfwh5Ec0yK
	xyhTlwTQeWsEUfW5YKnMT0dLAYepqNDfcczKiPDN4YIBiczQvGh4I3HbRNLUOu3jJISkFAWD+bA
	I=
X-Google-Smtp-Source: AGHT+IHqxep/cc4oLyuE3HkDZXgTyzUFzuxNas67CCOIgFLvhkPXSKwzO0M1vA4oarAwjHeMAdt19w==
X-Received: by 2002:a05:600c:46cc:b0:45d:7d88:edcd with SMTP id 5b1f17b1804b1-46e32a030cbmr2096795e9.30.1758726673765;
        Wed, 24 Sep 2025 08:11:13 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a7c8531sm36045145e9.0.2025.09.24.08.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:11:13 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 24 Sep 2025 15:11:04 +0000
Subject: [PATCH v5 5/5] arm64: defconfig: enable Exynos ACPM clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-acpm-clk-v5-5-4cca1fadd00d@linaro.org>
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
In-Reply-To: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726668; l=946;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=xIpVlqe4DgqHRCmW3A7H3ri8twq/hpgQwg/JQ3/NwCA=;
 b=T1W9QO6+wC3/3UAC8KME30JBVVpkIcd/QWetlJFmV0a29DJ0ch+9QIyJk/3CeLRIN/rq+eDDL
 Wp7i7Gau7g5C0/rIp8NH9P+T+1wyVZVtps9in7VOZIRgtRa7ujunkW0
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_081115_842240_844A8A77 
X-CRM114-Status: GOOD (  10.19  )
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

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..646097e94efe7f1a18fb59d5b6dfc6268be91383 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

-- 
2.51.0.536.g15c5d4f767-goog


