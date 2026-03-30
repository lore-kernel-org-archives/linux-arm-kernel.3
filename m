Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C223FB3D1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxVCxS3KsrL7X9+TLUafohMnmgl8E7kaA4sFH55EiJk=; b=N8A0LYz0SeYFZkSlZJtkUjBMbr
	T0Hlcz3TKWY0/rpUuojxicyGbOtvKBw70EAG8VQIaWJcdJUtoZX+aRSunQYuGBgF4sEzDq4ZPk04h
	Q4ajCW41YG4dRioM9cKpcfhOnF+iHMHh1wlGHpVDN0SF9KS3eaRyaEpwv7awskSF9Xky9IQclNdVd
	/fvac1RWT2c0EiN/l8dERkrrXl0kGtOInad6V/ES6Q71xkyAM1pYzimCYSXf6NhJhYegwMqytRm1t
	M0YkFpCLLVJUJIuaAI5wH634exNsmE2aUsr00UG8RLwo3XbaLJXtav2Bpynz6eNb+n2JhNcQGl+Mq
	n7HYPfBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AHT-0000000B7AW-3ID7;
	Mon, 30 Mar 2026 10:55:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AHR-0000000B79j-1npB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:55:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso36978135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 03:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774868135; x=1775472935; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IxVCxS3KsrL7X9+TLUafohMnmgl8E7kaA4sFH55EiJk=;
        b=mY+TafgMxDFHH8PEGebqWNFK6QjGijrq+4zVgiwR6wXP2VaVsygbEFsM+Di4fNHZbe
         5Yg0Gjk67AZu6UM5dBBRO2T6KTFBc7qNFsGVI3IFPRZvR0tUH6XJS9YlNyU2T5H0Ye86
         pHtkCr7uWlW169ze0Vka6VcBm5SflFy8arpaJHJsbphysogixXN5WFLye9IL3Na6iQeM
         TdgsFpkXiOlo8ZxI6hJcPDUXEmRRRJiJi4sEHsGdr6xZhEt3foNmhUIUxX+tuEPH4ZSq
         4F/Mm1NaaMqzLDPAwL0/gfXjWL2wjUHJkdrznjJ0aAlN4b8QtJaWARHM24UGHEHsUvsF
         7a4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868135; x=1775472935;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxVCxS3KsrL7X9+TLUafohMnmgl8E7kaA4sFH55EiJk=;
        b=qWJBZSQkVJ7EBL4LB3Pp8FitFUbRyP4AsoGd3u9xR+2Q2PiMKHlBpZ12E3AXyuWZJg
         C2jFbU7XbZuPpxYt1xA0NUxST+bNNA1pVl/s6enb5AdJxpa57O7Fxjme7Gc1Ffg4WFdG
         F9CXxLILAtlaRwvysdd6cIfwchDjZfnugtiAWLMc+c9hRglrtQlEkgM5w9fiwaAhZcI/
         YFIwdCQavfhcqSSBs3l7r8GtNiS2cZZ5DMtFQ//x+GLH8Ysg8/bWQibllbMEFmSJDyXl
         daNPmEhVtIzYrejGHttV9dsFsD+kt0j9VbW0+0h/iMZdPT4VWHOant2fLPc0H/+X4Dxw
         uqYA==
X-Forwarded-Encrypted: i=1; AJvYcCV+Zg73IH7Glo2rT24U4/80/TG/ILIDumZsKVMxwtiyz+loScgDGcmBs8PVk+4XkXpSvneaSqZQQ39TsjR65QHH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8+mQqyWOTIaahSU6EraL1X/+fYE+OKPc3KFgMoqgRCf5GUrOe
	oFxfth3+fnFoDiVwSugUxVDtK4ZCKBlZFTEcEuRK+skE17RVexC4xWGpAdnXb3gpRXg=
X-Gm-Gg: ATEYQzxwGZ3QEgt1K5CkpwoDtQcMdd2M6zd+S0sQtHI9QKkT3EyDUbFX0/vrgECDuP6
	AzLlD5bEeJEWDGSmAbRq2D5H+Vkj5JW/mBVRIGWlqduub4hmNxZnFPChZH5cX2PNGb58it3VlEX
	r9/MD/r1rnRid9jSOL3s3N2fkNEaOG1RpLtv1rzmNIGBavTniB/K6ZO4PtWeR7Tlr+egPI8kOId
	Vu/eouV9McjlQEpo8lxh4cH4srg+ZTBcm6mfD/0xYkflvsA6L3dXcPxR6VgMn2dZpu2ZXaxifnd
	XDNiHFIEYOuEDZfP/AzLuagZD5B8BLJCCXdYY4U+yr4OiQU8OwAesLlAM7hsHV88QVak4Ejw02M
	BjDX2riovyVeKBysaO21UrYG4dgiDjsanfgox5L/ZnW5S5ZVMKWd9JOt2blDtiL4Kwc+a69EdTF
	B6NPEw/9WOKzI82WEqBaZ+joeubTug
X-Received: by 2002:a05:600c:4e08:b0:487:1fb4:7b3 with SMTP id 5b1f17b1804b1-48727ef0cc2mr216860995e9.23.1774868135275;
        Mon, 30 Mar 2026 03:55:35 -0700 (PDT)
Received: from draszik.lan ([212.129.78.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48730629033sm164969365e9.6.2026.03.30.03.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:55:34 -0700 (PDT)
Message-ID: <9f9d400b84512be41d47099d916338be5662061e.camel@linaro.org>
Subject: Re: [PATCH v8 07/10] pmdomain: samsung: add support for
 google,gs101-pd
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, Will McVicker	 <willmcvicker@google.com>,
 kernel-team@android.com, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org, Marek Szyprowski
 <m.szyprowski@samsung.com>
Date: Mon, 30 Mar 2026 11:55:30 +0100
In-Reply-To: <177409897341.266364.10743294916208405425.b4-review@b4>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
	 <20260318-gs101-pd-v8-7-241523460b10@linaro.org>
	 <177409897341.266364.10743294916208405425.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_035537_487187_5A3B2015 
X-CRM114-Status: GOOD (  15.83  )
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

On Sat, 2026-03-21 at 14:16 +0100, Krzysztof Kozlowski wrote:
> On Wed, 18 Mar 2026 15:27:52 +0000, Andr=C3=A9 Draszik <andre.draszik@lin=
aro.org> wrote:
> > On Google gs101, direct mmio register access to the PMU registers
> > doesn't work and access must happen via a regmap created by the PMU
> > driver instead.
> >=20
> > Add a flag to the device match data to denote this case, and obtain
> > the regmap using the parent node in DT if true, while keeping to use
> > the traditional direct mmio regmap otherwise.
> >=20
> > Additionally, the status is just one bit on gs101.
> >=20
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> There are few reviews from Sashiko which seem legitimate. Please check
> them. If they are false positives, just reply that you carefully went
> through them.

Thanks for pointing out Sashiko, seems like a useful tool! I'll go
through it.

A.

