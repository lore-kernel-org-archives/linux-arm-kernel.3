Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4284CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 11:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjNP63G+fAyAyGQb7WUecVf9CDYMikWqHRq+/UjXZxI=; b=PVKJYe1GtAebbMs5FD1xtkeUib
	1XSU7jbdSlyT8pksCtp88p1WhjFMjMLBylooc5zLGK9W6xwKas85kJzgoXBrRGH9RxsW1u3Xj132X
	NN9pr0plSMIR6r+jNIakDB2+zdgxaina1jjhnMgFVqz5e81zpKYk40Vl86VleAP7FiYx3J1si2USC
	qOg8lLY6y5WylmU8SjjSgqbQRZeX0WOECIDexOVagvh/3ujLbyMhZWjet1WNSuQVQY+HGIZYQUYMN
	6xxkCZNLvh105czRt9L8/SflGRCwcRO1HpKnFNi47731oH9vdnT4It+X7LPkRVI/JiDgu1xjUMDe/
	rUiuNs6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kPy-0000000HWsQ-3Qre;
	Mon, 07 Apr 2025 11:13:30 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kH9-0000000HUdK-1Vjk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 11:04:24 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so3535643f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 04:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744023861; x=1744628661; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bjNP63G+fAyAyGQb7WUecVf9CDYMikWqHRq+/UjXZxI=;
        b=TrLJY2d/tF2PAGfozMx94nRCJSc2+OEpOc7Rb5Z1zhCDgdIhNabdAubmqz9c5RxtYB
         hNr/sNOEEsSE7SSZQkM7M0NOmtnKaPX11TmCw3grPDpk4DpkQOfUN0hpHvDmSIERaoWe
         TQ6nBzdG70lDqe5CnbYQcTDRAFYBFeO4oehM03dq50lbThJW3Ave5jf89lh56B7TjUbv
         c/xhlIU616aac2PoheafE5XUghqWCpbNmyewnll3T9hWx1FXdyeg7VnxJa1iz6WsYF0Z
         aP811UHASXaqrE0fACkfsETfFBcmnFmt3AAhfbC5fPrlJZ7LB9P2fwQBtVmPdAcX1Ex5
         Ep/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744023861; x=1744628661;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bjNP63G+fAyAyGQb7WUecVf9CDYMikWqHRq+/UjXZxI=;
        b=FtZNUnrp6U3+HCF4wnNWKxvanq4omj4vDv6OXGCiEuLv0vF0uMMII/mFzZkqZL0Ovm
         k+rR/19f+3tjhp1XE/cLPKwTL+jcbYhfsk3Hjhc/EAdDS7PJp5YplWOn9iQldm4xOttj
         5b+F87/dpRNbZa/yGTqiP/HvMDatgA18/d3/cpdpHxhGzC2OVoHU9c6w5tTBE59DKB7Z
         vblC8G4MXP+hbEQnCbu3+dml4U5UjE8L191OWvMvq4JzX4UiXvg/uXakIEz23lqR19VT
         +hSvYaAyOxYQSJ9cFrj5H6/YVFfF2MOzVMzXepaCaIi4Zw/QpVlGBssJ0fxP/Xaee1XL
         LrIg==
X-Forwarded-Encrypted: i=1; AJvYcCUVeRu01VJ0lX5GzmJldxAr/2clLlic+wvdZv9JH5OWXZRQNq1h+2MQB/EkPtV+B5onqgcJ38dppaPohTeu2ist@lists.infradead.org
X-Gm-Message-State: AOJu0Yw51zCQ28aLSNN7hOOEyO36/p5AlpHSK2sQKBvQWdb59gHs1gOZ
	hRR6VUyQpWE2du1y7KYdWZ2Xj7pJr0d6vlr1hfcMjhh9sTNNRp/qTi9RkrlkzaA=
X-Gm-Gg: ASbGnctgCEhSbXgyFdJlgokfHppTTeXp4TAGm4Nvvl6l0CatYfLDBfRs9mrRyCFkA90
	+oGDmXWQnr7ote+ogbWjat9L1fIPE/A5Ng0SF8c0R8QEMDyGO7UHfq10UpzCSxTXAQbhQxHR6SN
	lOkHjN40EqqNqK1+jdX2n60TJJoWppWiJYufZs86ngGpaUtN2w9GzOyJaClMsSWh05rmPFzRYjn
	Cs//uR5IEBKt1OgiMiFW8OHXRImncF0Yv4k+RzYQnV2YXn7cD2fmAdOeCamfReoa/A4hPSKHDjG
	ACzFT4+Wprya0bD+3jLSqYxd9JJdcTkR0DvknYefdSfm1133lg==
X-Google-Smtp-Source: AGHT+IE98q/exAYcbXtaZDbUrx+IuA1N3tIoGfV9NOXz2xzrCG0lt2xc3oN4y/3w/IH6VurA5lmsRg==
X-Received: by 2002:a05:6000:430c:b0:391:47d8:de2d with SMTP id ffacd0b85a97d-39cba93382fmr10043977f8f.23.1744023861560;
        Mon, 07 Apr 2025 04:04:21 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795205sm130230235e9.30.2025.04.07.04.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:04:21 -0700 (PDT)
Message-ID: <819718d731bc1496a75ebd0a4076d88273b21229.camel@linaro.org>
Subject: Re: [PATCH v3 25/32] rtc: s5m: cache value of
 platform_get_device_id() during probe
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Mon, 07 Apr 2025 12:04:19 +0100
In-Reply-To: <b68110b8-fd16-454f-9b59-a89c028ff92d@kernel.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250403-s2mpg10-v3-25-b542b3505e68@linaro.org>
	 <b68110b8-fd16-454f-9b59-a89c028ff92d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_040423_416881_5871DC03 
X-CRM114-Status: GOOD (  17.22  )
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

On Sun, 2025-04-06 at 20:29 +0200, Krzysztof Kozlowski wrote:
> On 03/04/2025 10:59, Andr=C3=A9 Draszik wrote:
> > platform_get_device_id() is called mulitple times during probe. This
> > makes the code harder to read than necessary.
> >=20
> > Just get the ID once, which also trims the lengths of the lines
> > involved.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/rtc/rtc-s5m.c | 8 +++++---
> > =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
> > index db5c9b641277213aa1371776c63e2eda3f223465..53c76b0e4253a9ba225c3c7=
23d35d9182d071607 100644
> > --- a/drivers/rtc/rtc-s5m.c
> > +++ b/drivers/rtc/rtc-s5m.c
> > @@ -637,6 +637,8 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info=
 *info)
> > =C2=A0static int s5m_rtc_probe(struct platform_device *pdev)
> > =C2=A0{
> > =C2=A0	struct sec_pmic_dev *s5m87xx =3D dev_get_drvdata(pdev->dev.paren=
t);
> > +	const struct platform_device_id	* const id =3D
> > +		platform_get_device_id(pdev);
>=20
>=20
> If doing this, why not storing here driver data, so the enum type?

Good point, thanks Krzysztof

Cheers,
Andr=C3=A9



