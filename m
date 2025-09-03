Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67075CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXuAsC4/EYitpuT7j2ogEhP8VRvM8f6E0D+ICyRlOQs=; b=XulFZJjQrqLnAsGWPqAysLH0WL
	O3bwCO2ssABSRM9d6ml3AdNpx+tXC1aFWoKIPFKYmoHsLIaaS+V5B8wf3focJ6G4pxTBojW9Qts8l
	3a/UDvh7jlZx0fg4VG/dACyu6/l6boZvft64tfJt1H5424zIjb5E+RgNUSR9vUqiTP3oI4bzj66sZ
	kxx+32SH/2YM7IuyUlgqRDCNbRWSTgeV6fAmeYpIOEK+FBAtROFUYoVJ3mcg3ckFCHJUdwtLS/Uo5
	xfOAcNtyUSMDdd8cByo0nFEDs8rcDiH33JUMXPULFJ422NDpS1xebluwiIltED0OUSSzJMWZ8omw8
	y4/uZFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkKJ-000000061zs-3xIs;
	Wed, 03 Sep 2025 10:02:51 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjER-00000005l6d-0YH1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:52:44 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b0413cda0dbso67364766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756889561; x=1757494361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXuAsC4/EYitpuT7j2ogEhP8VRvM8f6E0D+ICyRlOQs=;
        b=QIESrbqLqCMW7GHhiAeCs9IsYyiiY1Oewlx2Fzu5d+H2ozMJMyRDM7faFefr59c0n8
         O8JBGYWExKPfgaGw20UVJOx+OpGH5h8DhW+beh+M+2ihirzYyJwmselkkaSY7igx2kLY
         AfoJfzWtEXyeAW3MEaLlyaVFq9FmzEDVgpYtIKTQwM1cm7/zpcUP5TuBZK0aNlydXLH2
         unmzw0RKU0luaUSXAZGYmLWWUbNHECucbqClsAXpz9c+/VCyjvmrBJWKM//uKfHJUPep
         gFP3/tZ1h6Ps3WdapuVg3Jo607eymne4G8kCGr+bm5kLRf9p/Gj0f5OrIW+BLbfcR5KI
         SDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756889561; x=1757494361;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXuAsC4/EYitpuT7j2ogEhP8VRvM8f6E0D+ICyRlOQs=;
        b=QRnCM5ktTPWeoXXU5ASN46AkDQN0iXJYjLSMWhmrtLlJn8lAoeiJslm/xjIAnuZlSi
         gn2RqPk583uI5+40DLoWtAEUGpJt3+z7igsyzJeMFFL+Q1Hb3NzNOost1wCBXKak8udj
         65a2EiYNA5nNapbeQZ5e+mZXSjzoDRTEfRVoz8m+LB+YCF/vrPhGf+P6+IlORI26nuVR
         rp+KPyeXlb6kSYL61N8T8chi/X7iCXr6MtLTg7zCGdWCIX3CPGIc5yCNXvuxd34AX42O
         IhM81QjASdvA8L2Hn6Lc/4nF9CL9WNnisM8/jZwnmhf4DvyuBXGWQML22+JNvE1ojxdm
         bjgA==
X-Forwarded-Encrypted: i=1; AJvYcCVdOiM81hhVNEQr9z8lkH8dE1Dy5aoLq0Rn6ofh9slMXqhQdTpF4vlgzo/sTSk2xaZOtMTOpaHNrcCwKIR8Um3k@lists.infradead.org
X-Gm-Message-State: AOJu0YwjZYm6xy95DlqGwmsTRav2zFgLeMUFzT23glONEmWR6dQYJsud
	19UGC4lw0Do4e7xpVV72sfIhbmGZjPboFeojeOPPm8LO3Jf7+EEA6jlnYCs/q/cg+zM=
X-Gm-Gg: ASbGnctJgtCnaELEIoK29bTkiztGRuic0m23AxEHSLf9BXOZoUJcFmZ7cCHfgn6o/23
	7Q7Ph8jh6FoiA7Jxa+CQPW+yVbqI28A2GuWH05zrcpQ1cooeXrE5Xb8UzI7gSWRRxlzwTwrCXBA
	yK+62hTdTDl/p9VdDgVQieakq3d/RdSf1TFQCzoLT3mJX6FeCtFiFpThS6vEm88iF531P1Zw8CX
	J+7irZzWnG/pZYdRx++L9ut/cdIc5+cwCjlLCgJzbZt5mzYLsf4pPnLUv2uo0Qg4T+c9rpJI8WI
	pw7hlHz86rrou7c1zNr0HkChxptZuh6D5KcvdTJndkuPm5spLtjomrQkpdUwXrD3gmkaI/do79x
	mj3HhENFK8BCdn3LZyBV4dYkl9GwL6DJdmm6MUZ8=
X-Google-Smtp-Source: AGHT+IF79RuXHW2pwxOc2+riBp+Wf+b0VTzVijhXxVtt7yjNxZVsCII4hmqvTw9cMwLtHMrwtHfYWQ==
X-Received: by 2002:a17:907:1c25:b0:b04:53be:7652 with SMTP id a640c23a62f3a-b0453be78a7mr304851666b.8.1756889561565;
        Wed, 03 Sep 2025 01:52:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046eb335f5sm53713366b.28.2025.09.03.01.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:52:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250819131641.86520-2-krzysztof.kozlowski@linaro.org>
References: <20250819131641.86520-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos8895: Minor whitespace cleanup
Message-Id: <175688956033.32106.10753846034561344868.b4-ty@linaro.org>
Date: Wed, 03 Sep 2025 10:52:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_015243_191543_2F9E0ABC 
X-CRM114-Status: UNSURE (   7.30  )
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


On Tue, 19 Aug 2025 15:16:42 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos8895: Minor whitespace cleanup
      https://git.kernel.org/krzk/linux/c/045bf0f825cf8dd53468e70fa494b06aa17e2d33

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


