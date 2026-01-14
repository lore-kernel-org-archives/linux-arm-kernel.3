Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1168BD31A2B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XseDb8ZHPBjuoEWbJmFo7HtvNpWYI4+BmzsvRT84Bg=; b=Vx2fC8sv9LCLP+kZ0us23OrZ8A
	UNPS0XzZSOnoG7jxCxZmnBX28E1o8+PqqUsPe9YQqyz3TcZAb77w5rA6/zNRyWcb/htLUCs4ZhZu7
	TWd3KL1eWg24F/fCA7B5BhLOyf/XgxM3kxBXJ4VfHNalwD4NvLlkw5p546QX1USC4bsvgXdtdYjIM
	5MY06TWsG3aAeMK5xpJJA60+olEyvrFQRFaCFEYB6ifICx4yJs8ocr4IqNYCuldGdbp9EFrylDo/x
	q7lFMm6YIZER6jIsyen37qR30QNo/061FaWgFCyREuH7PZj68MRmv1XpY0QErXhUt7IdiW0t7J8oN
	rrcMLGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwh0-00000008Qbz-1H8U;
	Wed, 14 Jan 2026 08:57:30 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwgv-00000008QYM-3iNJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:57:27 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso49381495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 00:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768381044; x=1768985844; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XseDb8ZHPBjuoEWbJmFo7HtvNpWYI4+BmzsvRT84Bg=;
        b=y3hwgja49h4PIE0f8hpCjCGRoACunfKPO61Xy19r8PqQf2YcjJZzgqB3sVhQKgXErN
         +Xq4H98CiY0iViUyGsMaFR23Ovq9ERt0hFKwwXIqvBLvGP01HLSWjuXhWU+B2SlPat8S
         FFxE4JB3ClZ9/2HwlOtq9MnSkknk7FYcjYe1OR/bSPUMSqDaJwaBw4PVn7nAgMkPy+eQ
         yrdHI3NV+WTCKFAFI02qMp/WfnMyxCJn8InPid0IUheQvYRE7qdwTYz1jmmcoBe3DXb9
         kHjQA7mob5W0J3Q+g+P/XkV1QWHBV3dVc7EFqdGW7x6Oin2P/8HwGSH/1D1XLzs8/1o4
         9xUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381044; x=1768985844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0XseDb8ZHPBjuoEWbJmFo7HtvNpWYI4+BmzsvRT84Bg=;
        b=s0cueALLfhqI5Gz0sxgAWK9FRTbbXNjV2mbEaLh333EZ77jFLxhjSV+XeCwRR0WULR
         seUla9PVuRLGee1iPAsZt3GfHJk1EWqfuySy/7QQYcpUHZN5FP5a3dLHdEpHnuwQJWZP
         2WjHZLt5Lq7Ezl9A2ZDUaan7Smo6tFuBtUBjsOlRLFPjmcbzOKGifu/wmStl+s7ZEtRs
         vA9NgSlrOqxI2L5RYyBEwFvccYDhxgcER4txmLw20oJTCNAm3m4pY8wkYQazk3ktbe/a
         xfE0qMT48RkKPAkBdKphMlW1v/31JJKiOwoUm3YVG7a5Ag5SqzQXxMdGgbL1CU3jgnT9
         Gdhg==
X-Forwarded-Encrypted: i=1; AJvYcCV0/xX749L9svC8nkf+JYWuZJPtk0iUDt1JSBnTa2GkH9QgOOKt62S4JQjk/g6Y3vEzrXVtNzpji/nTmP2CEB/s@lists.infradead.org
X-Gm-Message-State: AOJu0YziRoUaJVpbJm46KAHD5UIzFJ5nxDsnBuLWxhjJutz5WvsKWO1F
	sQOoRNZxiYK4hj65OvJK2T3dkQYtD8iq0d0SUmXzlfqBAIB4GZrcudeaivkjfaG7VOM=
X-Gm-Gg: AY/fxX5k1ijAUUeTRlPwce+sbZAAELyiwsHEzqopfasRH5gJhQU/HuOxTJUaT7uz/0T
	4Fzh4HIvKD3afO+i04boOTOH5v0R1Jw6bbd89NIC6M6ovl84lmxWA4ICgPgIVWnCBIDrcxBUhai
	NgTTmVqDW1RdOiVoPTmKAXO0sXGy25CpYBjDOETgXQ4AA7RxpS+ZwRF9oH8wnQOjL2N5APb3jyA
	3KRijAqsBei72DDSOKieDGiR3J0ItoJRV+vHgjIpsLdcfxXyj3JomPGoj/7w466XQHGGSYgPa45
	w5XppXvTXVJj+nXBQDX/3mCqLDY3iiCKZt8GlEEqe5MTHz4r9Mu1zLeqtt+pJWlV97Ry+oSdxJM
	U51Hn3oEmPJOjXtAlRprDwz5tDKaVCSn4BrpK8O6RnqMSw2CWT2k3dVRSVRxulAwlTEqEVjc35z
	o/QZGOMahQcvJ46o4ORhaM
X-Received: by 2002:a05:600c:8b52:b0:47e:e20e:bbbf with SMTP id 5b1f17b1804b1-47ee335646fmr21311365e9.24.1768381043978;
        Wed, 14 Jan 2026 00:57:23 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:db84:c9f1:21bc:dca1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ee563c8bbsm16828795e9.12.2026.01.14.00.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:57:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 09:56:53 +0100
Subject: [PATCH v2 1/2] arm64: dts: amlogic: s4: assign mmc b clock to
 24MHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-amlogic-s4-mmc-fixup-v2-1-7e9ab5f12286@baylibre.com>
References: <20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com>
In-Reply-To: <20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=iD8WQNBzDHgOnkPSBABm76G4IHl7jfO/G08/hDGOQ48=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ1pqfpx3+J/u6VAXTqIHhXnYBGILsIGj6hHZ2
 GgF6YplWniJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWdaagAKCRDm/A8cN/La
 hW0+EACTZGM3OUj+3pT7mr8XHNiVzYYixPyBVwfOOjbaWxQEZ4ifZZe07/d2KGb4RAmGIJS5Hkg
 x0uDV4cHVpSrbCIYmzdwFYljZvuJ8wCjmn69opZO+/q71bmw6KwJkjvIXqnS5LyR7tz8AT/Kve6
 NdGRve3pqgPUeYq/g05Y2CqZuFvYILYn4oRrTVsA+B3WgrMzPZqPNvGDHOOigqxNzOP7lbQlDrf
 nfxIyNLGnyzAGo+D9N5FFJgK+x88bYvGQfpWyb4ZG6H1ROhXSRkiZp1Zhm1kYBCBzrPcyEKcvW2
 pceBzORj5S2db4ELPgC8AVtoDN3TmmFeTtrgdqHiSG/Wx2AJZJVxhZ7+qj41lF/+MEyBSpP7R2c
 I6DGZbxyln58Z9RS9Iuj5X+E6Tp3nAmqmHE8vP3ePvmmy9+sleiJR1LmbSuDreA96uKR5iHpWc8
 xHrmDNCfyw8XQZe3yCDlzi5AHHrYr/mJGzkD1fcwLJxLCv1dm4bLNyu5xcTzVn0W3ZvuOkVr9LY
 FzMc3JfgM20WQcAIMzRz6vBRBdiOl+cbPK4i0hWonzhQ4//Kc6Ilzg1giecRFx8ZHWzmdpDnwgK
 NrlGydXIK/e8GG47fl3OAUlApjMIBejXDm3npc5P9K3MQeergyqqGiwygfJTflppJ87jOQRs4TS
 +XgthRsHN1vVSgw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_005725_970721_9BAA6CC3 
X-CRM114-Status: GOOD (  12.73  )
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

This assumption did hold true until but it now, but it is apparently
not the case with s4. The clock has been reported to provide 1GHz
instead. This is most likely due to how the bootloader is using the MMC
clock on this platform.

Regardless of why the MMC clock rate is 1GHz, if the MMC driver expects
24MHz, the clock should be properly assigned, so assign it.

Reported-by: Nick Xie <nick@khadas.com>
Closes: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/
Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
Tested-by: Nick Xie <nick@khadas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 9d99ed2994df..62538fd9db6b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -838,6 +838,10 @@ sd: mmc@fe08a000 {
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_B>;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B>;
+			assigned-clock-parents = <0>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		emmc: mmc@fe08c000 {

-- 
2.47.3


