Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A657E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 22:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bS1hvfaKylLHS7jj/oKkEYDNADp1T2afpk8Swl56rFM=; b=1G8Cu++VhBGtcOGr7kRcPkE9y+
	MtP9HiRfH74Vc88RK0PQrj4MXvkZ869V2EyWanP3XGBQH0ucSv50ltHeSm7VJOnkpQldNwBuxn3E3
	usWKLp3DlznceMYdq9FX2UYEsuMaQQCmoE/NLm8WIwe0+0rVOUP/g7CWv2XH8gI7AjeYy9Gdo3gqQ
	Ur6BU4Mb2XgpLts0KMOn7eJ3k88H25KPf43GJ2bpoHGdynRuj9wbReaeuHNc0fQFP9gvvfJbJG7gT
	5P56I397kOsWrNtIo/gohA/Q/FrBCkrE0POEbG8LBRcztBK2kEdanp2yeOFOGQmUmyo/MXrZtHuSv
	NDbwPjbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK3FB-00000004Vpl-410u;
	Sat, 07 Dec 2024 22:25:45 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK3E9-00000004VjT-3oM8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 22:24:43 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-29e70c9dc72so1832531fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 14:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733610280; x=1734215080; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bS1hvfaKylLHS7jj/oKkEYDNADp1T2afpk8Swl56rFM=;
        b=nsjQPNBulGXWmujR49Ay/HFC3aidvMbNRLYmaAV/JGiUypOHeQf+AiUP6UPuXe0zlL
         dUAIrUo/EmsWsEXmRBkoYNRgu1HTkafuAWzq0TQDNtX7VTmOWMgw+rNoPTc7+RG6B7X3
         KxFcn3KViJV7X6/HBg2+wGFlkJz9ZKgWYWj7fjoOGIGRegaw6kI937VqwJP66Tlmjlmr
         Pr68gzYjqU0P/QSo9EE0lZQKWQ8lW+KZQmqRyeP58DY++3isx44560aVJIRuXy7nouYE
         eOykNUpugTVMRJJfZ4nUANS+kXRsP+nvo3PXWmUczP0ZTzQfD6nEgJiNBk9ku/t9HbHw
         MKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733610280; x=1734215080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bS1hvfaKylLHS7jj/oKkEYDNADp1T2afpk8Swl56rFM=;
        b=d4JjazEOPiaMDdmDBIOLZrHAIxsoovZzTu0SN0z/tRYmr9KPfcD+yUbaMH2R2d/xQM
         VGm0CHooQYVzSpOVXOwAzpUWlvozJcYDwC208FFON3jAR6izBk761++/tAjXRx7U8yj3
         G2iGapo1GkbjTkjK1QMc2yj/wMUsqL+VgvznD0px4QtEHLYshy2+bnbA+ZX6J9hhcsQm
         TI7H69zN3C8adQuvZcYPe4Zs7ijrQzbZD+zMfZRREUlLBuUlA+q4qu1e55Lvx20Ktbg3
         Il579JH8uBZfVlxbKYqwVVo79VqX2EJ/ghS40qRXezbFFLT4Mt3jCzEzCWlDvp8rIxAD
         9M+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXw88P1LAOkZk/XB+AlU7DN9WqeuTu4Cdip6GbJ8frSALp/qm/xEzcd8+CHLgI2KXdLKz/8TCmAOt6A3HpjVln+@lists.infradead.org
X-Gm-Message-State: AOJu0YwsLRQWR1CYi4mTaPUO+SteGVH98E6Z8hhvXJMWMEbMCU8QMama
	iMrn8rNyI7FssqOfFetUW4nnOTwTTvWNYVV5dQYzFt0aorouf5fyGY1Z1YlqgMgmeGM3AFv1rMg
	icZIjFJxaufBMPkUZXa3sTqyECf2Ndu2+L2QP/A==
X-Gm-Gg: ASbGncuyTI1n70IwvCvIS404O53CjfdTvtiqqZRII9FeHKSuJbfYNoYbvai07yaD0jZ
	rU8NCD18V+SROeCNZ8Y/vyHbHtSRbeDY=
X-Google-Smtp-Source: AGHT+IH7dpjGK8nTZ9EvDFkMr9yeFM4lyfcPUg1SR244FGu9JUs01IRhEHCG1lRzya39HH/6fRYzq1Ljlzi0KVwXmPY=
X-Received: by 2002:a05:6871:216:b0:29e:74a0:e03f with SMTP id
 586e51a60fabf-29f73330a9bmr4017020fac.24.1733610280730; Sat, 07 Dec 2024
 14:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
 <20241203-gs101-phy-lanes-orientation-dts-v2-4-1412783a6b01@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-4-1412783a6b01@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 7 Dec 2024 22:24:30 +0000
Message-ID: <CADrjBPpC-qo22ZH1s=KoRgnnj6g90N6ADvU=HkRPJmwOBYAXoA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 TCPCi
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_142441_972512_9DD7C63C 
X-CRM114-Status: GOOD (  11.95  )
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

On Tue, 3 Dec 2024 at 12:40, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> On Pixel 6 (and Pro), a max77759 companion PMIC for USB Type-C
> applications is used, which contains four functional blocks (at
> distinct I2C addresses):
>   * top (including GPIO)
>   * charger
>   * fuel gauge
>   * TCPCi
>
> While in the same package, TCPCi and Fuel Gauge have separate I2C
> addresses, interrupt lines and interrupt status registers and can be
> treated independently.
>
> The TCPCi is required to detect and handle connector orientation in
> Pixel's USB PHY driver, and to configure the USB controller's role
> (host vs device).
>
> This change adds the TCPCi part as it can be independent and doesn't
> need a top-level MFD.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Notes on testing:

Verified that type-c orientation notifications are sent to usb phy
driver and that Pixel is enumerated as a USB device with both cable
orientations

[..]

