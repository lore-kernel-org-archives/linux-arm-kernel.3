Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A207E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 00:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oAv3GTMkxd/jMIXCz20Wp217o/Cl+peGPs01Gj4JL4=; b=Xy9vpoLkQXbjj026Qct8UTQzB9
	m1GJiQRfRVR46d7Ia2Z0MaY6vsX/Xba64ctAk80ssky3Un+PDMFwOUKpI/SEw15fjFS9fNhVN8D2t
	jnDYDXpEEWs1XFCzGlnuVoQDc7clwak5arHZAP/0L9647My3tS6zeMnpkXB6Vw/WSIwsF/FWzdXQ8
	o9/wfUvMXCEpa7uJhw0pBCMD5egxAMgwz1lcu1oY7AnF8UsotJApwz4YwAKlKUpfKeYInVTCnSGbS
	PJ5lJdwM7E3x4bNEvIH83LzW9t+5/mULfEsaF0Zx3ewt3rY+tND3Yge/Ge+VN5Gip/txTHnIYtLE+
	KR1vvUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVtK-0000000BnL2-3CGU;
	Fri, 03 Jan 2025 00:50:19 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVs5-0000000BnDr-3LeT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 00:49:03 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-304d9a1f198so7522851fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 16:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735865340; x=1736470140; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oAv3GTMkxd/jMIXCz20Wp217o/Cl+peGPs01Gj4JL4=;
        b=w86eWTwlXXYKuLnJ+GxGBfH/dTRNoiK8rtsj9Ytf52woHhWwoQSy08e64EoUNkvnSQ
         VqlisdquTXze43n8rZD+TOb/IdSWdX+RhsYymQHhuNqWjWovo1mZ3oBcL/vdUdoFEkcO
         coYUamoEPaGGHBYq5C2UY4lKnN5JA+6rWH69N+53/uD/R8yQeshbOCs3fkjwlKOV2VI4
         r8C52Zm/YE9a+RiqoaUyp4zx1Dk9GQLhAMx11zLVcKI87S+xUOLfc65Tz3ya0HBPpFeB
         2tv15MGAMdJ5kAfnz76lc3UryHKflOeEwf8PtnMamadNqB2WTqdZq5NfXrvCCVaiCs7E
         VdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735865340; x=1736470140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oAv3GTMkxd/jMIXCz20Wp217o/Cl+peGPs01Gj4JL4=;
        b=dfKdZ8Y3jCgrZDsAmMj0VHP0jRVElIOicxj3VXgv766jaOn4QjdU9SEUDi9beeiu/r
         NBQY3viqajlqBf/c3mtIUFZA+KOmz//7rOWWm7YputA4sPV+TjE4zgHhmviVinn3fTF/
         F3SbO2KClQB4xxLCu1O1vf0ak919x0frDGDJaqKI+HwGjbWNME8qFlZB2azsRj+g11OT
         THmjbNOQAtW2h2d3sqWBFUr2h5Z7nk1hxzJdDQPggoy5cUrkrS9w6UOu0e7/PKt1KrW4
         omgHJa+cfyylKbNZxvbQV6nyAnEAvQmB2w41sn7/91V8F81AL4v+z8RLQMCjgVbgI3I0
         Df6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/ALEzYXciGMNq/ZphOq3tWUSUH7BvoWQK4vADVRzMWXwXlIPcUhw7gBSqNg2BUSYTsL+xjIPg0KvEvKMpq9k@lists.infradead.org
X-Gm-Message-State: AOJu0YxE0aW0TptZgYNz4udOHXA0HaUxaKaVQn52RxMNSES6g6LlgB6C
	jaaJuC4zcIHsdSBFoa9IWQ4TjA7w5erXsD219Wfbf4qmKbUSpPwgbQFTzQt9Ha3XU+GYpNhnmwQ
	XATp4ewbzFzXE5utSITiVk22hAd/a07Kod0rAvLKUnMDtzhA+
X-Gm-Gg: ASbGncvidOcB3BOzySnwGzTPpwyMB7BCLCCA2gi/0dOVaJT7BQOq6A8n0VuePrC/KaD
	ncAKM+llGe/xxCaSmZ80f3ZHRLjMagMZg6S82
X-Google-Smtp-Source: AGHT+IFXWQX/f1UhbssTBaD9+6l52DI5X3zlRf2eEh5tClnlyupd1zkpxFpa6GGZ03maQWFsWSTLszFhw8NtRp5I7TQ=
X-Received: by 2002:a05:6512:3b1e:b0:542:2a20:e695 with SMTP id
 2adb3069b0e04-5422a20e76emr11167945e87.9.1735865339817; Thu, 02 Jan 2025
 16:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20241231133106.136237-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241231133106.136237-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Jan 2025 01:48:47 +0100
Message-ID: <CACRpkdaW9gCY760dbMohLesLgNTKTjD7m5jGLqi9nvUwu7hmhQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.14
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_164901_855203_70A36500 
X-CRM114-Status: UNSURE (   6.58  )
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

On Tue, Dec 31, 2024 at 2:31=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Fixes for old issues, not critical, so not worth current RC.

Pulled in for v6.14! Thanks Krzysztof!

Yours,
Linus Walleij

