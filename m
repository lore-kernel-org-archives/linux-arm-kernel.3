Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B29CD609D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFCCGNoly/ihHw+f0V0Z4F6JNgdV9f0RgxXs1v/pmwo=; b=LTuHoszt/Yox3Zw4iCTK6qqMN8
	DFJDlm6RhR3GOuu8TkjCjydNOxb3T62GchNBmoWFhPZVybFHjyJP2xGd8d15+VZSAvDewiRexwg2I
	7OxdxN1W3uzOIuBsDgU/ux5iy8X71OHMJOxpyxENyghH6IvHNTx04b3auO75e5IzOrIen9j4+MepP
	QTRcvoplWN5KdzOiAJ5OKC70HuCQqoMKAfvV8F6nxelzwPqG7EU4NULlUeGImNiGdOHP5dsp/o78D
	BXXA1pMm3Xxpg3muYNCbTDbqJbRhb3BhD7R3Jw3bF6ve/LfvsGskBFp+XeVP3LcDO2kpESu7uorfi
	9e7NmEjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG1S-0000000CyRc-3Pox;
	Wed, 27 Nov 2024 11:15:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFnn-0000000Cw3b-2OaP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 Nov 2024 11:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sFCCGNoly/ihHw+f0V0Z4F6JNgdV9f0RgxXs1v/pmwo=; b=GMxccAivzQCSbkNapOEz5DeMuT
	nBpkxKEiy3SvxFT43OslhE+u38i1T2YUjkK6bWFiuvDDTYDFprhxKvQVeSXpdBzjk0JWDKCppMwhz
	rBxsNcEZ6e9ud+nG/Il/p92txoWmpelbiLmTg/1QUAhmWRduPKBHmcj51msFYSd26XYpGmCLUJKze
	zztrJxQexX1zaNRPTEsBI1VnAqKgMC9Y+WnQWFlLt+f9FZmt0c1UjvSZnxn8d+eBiMG8qTCFHf3kL
	uKKaVShZq7EbKcL61r8luiGnqSOl7KYJUeyUsvDeGB0VZVuJqloI2Dick9J/aLZmPa2pAC75SKDO/
	74q6BLoA==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFnk-00000001P2g-2zYB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:01:46 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5ced377447bso8944950a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 03:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705302; x=1733310102; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFCCGNoly/ihHw+f0V0Z4F6JNgdV9f0RgxXs1v/pmwo=;
        b=W1yABxk4HKbZafnuQKsOzi4kTC62l87JV08raz+SkGYJV3sJfjgo8VbcrlT35cPHUQ
         C7URF9kDGL2Tojcx5gpAfmQtZSrzD/4H5Fd8C03UrAUGuAcW5IyoWgE6GYh+WdSN04ke
         BnrHkbCyU788szvWGB5MyxcBZXueIX3KcetX+k2Ja9ltV2172MAWEMWDBGtADc7FXpgf
         80m7EeRgDJj8jNQYL3qCscFY8Nt0Mk6Vl7qL6qVuK/xWDLLoVCsBZkeSCGJHpD5rOjrS
         aAt2zAqGcJCBWkqIRabmZfNjG5R90ZnlmPlhVFxypLMpmeMpO4qDxxjtYoX9KIOokljo
         eIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705302; x=1733310102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFCCGNoly/ihHw+f0V0Z4F6JNgdV9f0RgxXs1v/pmwo=;
        b=gx2xv5ZCSdTgTaEBZI9ypjXo8cCpe785lt5nT0nZnP1Uf60WtPkL+XUderKCeZEbct
         +YnIRGSbtQqVbxiBbOXDpuAyd9sw2aDygeGc8u2TE5jFi2qqNpZBeNIQIxDt9tLOGyvX
         ghywf1LWrjpydNSseMsji8ZQE3nM4uka1Ix4hEtutVDnHfecGHaLq+AY1miwU553exgP
         BxvAKtjHL0E6kr+iXxV/l6yldZeBPkjC9CKKd9m6QcrvT5mTvOcK1wl6xIKxySI527y8
         hKLT4sywQA1FFa43ypsCus8ZUQpsM5k9d+ktaKWpLwhY0aWPknhJ3fqgy2FhMydswPMc
         ONgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy4vKkFe8FdDNhh0DJNG6f55vdlOiK2hzAyMzc9dMf4m4lqsqTxBdhHeKf/J3wFzu7qERyA4cnQWnijPMAMYnL@lists.infradead.org
X-Gm-Message-State: AOJu0YwsL55PLrjD3ynSjLwNvA1PEBP/mAxEX7iPdFzSn5f3U5hw7t41
	g1StlxYX0h86O02tdwY832M9YGTI6cwPzPrlsG7We9jBiyXdUJ5NEQ69xGtOKKA=
X-Gm-Gg: ASbGncuclC0yk5Tv2Y4Xpf4hoddDy/0mvlLUqZ4xLTIzYzEN8dW719J+yvsG7L3YYn0
	pDneeiXy5NFDgIEkPhxt3LM8DJ/0Qy4HG3NZORcxyFYEHGUkCkDnsDej0SIA8tBPK/p+7ZDB7Wi
	/OueS4zNzCgkfaERfktSjMlsNHBU72vdYqYTrAPK9ZT58kW8RGTZi8SMKTST+IQ4wOzeSebOrdN
	Hby4MlNIaPcKR/PkCO2UEVo/iSMcXzJBAWLlIN0gVpl72Xtu+xtRLdGfhFvlcq9t+CQe2mbAlfr
	zoiTMcCeHfwntprf7Z3S5QipR53ln223TA==
X-Google-Smtp-Source: AGHT+IGf8PRBbpu00lqdlanskxanZwbdL0mBeUOVNbWHJwrX3n9oj1hwGayugKGWxCGG58SnT8c/lQ==
X-Received: by 2002:a05:6402:2807:b0:5cf:4687:b816 with SMTP id 4fb4d7f45d1cf-5d080c64a93mr2444477a12.31.1732705302188;
        Wed, 27 Nov 2024 03:01:42 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:41 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:41 +0000
Subject: [PATCH 3/6] arm64: dts: exynos: gs101: phy region for
 exynos5-usbdrd is larger
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-3-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_110144_890524_18AFCB7D 
X-CRM114-Status: GOOD (  12.04  )
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

Turns out there are some additional registers in the phy region, update
the DT accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb224a..18d4e7852a1a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1267,7 +1267,7 @@ cmu_hsi0: clock-controller@11000000 {
 
 		usbdrd31_phy: phy@11100000 {
 			compatible = "google,gs101-usb31drd-phy";
-			reg = <0x11100000 0x0100>,
+			reg = <0x11100000 0x0200>,
 			      <0x110f0000 0x0800>,
 			      <0x110e0000 0x2800>;
 			reg-names = "phy", "pcs", "pma";

-- 
2.47.0.338.g60cca15819-goog


