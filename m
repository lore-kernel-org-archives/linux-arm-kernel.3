Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD91C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIYwhtEw1euleTwTcbZCNX9K84qUUjXQZZcm3DuTqE0=; b=R/ZpfhWpkxZEMu3eg34WZ9a+WR
	Edgu4mFd7r6shbGi/ufIbFycyANossWBV4bM6mEf4of0US5xwUhrEfGcNEKpti10skNiAyrCIavOx
	/8cmn+15WTMWKWAZns5XF1stVmCqnC6YkHL2/oIxufkP/HLmkGI+sBXgIBrhFfel6oUZlQfIIvdhH
	NN8lFAVgEh5yktyzsmPnTvjnCJu8jq71iQc6/eRxHFWIUk8QYd1WzKaYEohlWvy/6pbB/nn1EsHt6
	Iclwgd8hZF0pjFkG77UjdVxHaqiXsZP52YbwWDl790Xk8Vd0KaDOLC6rbQCVh1y6sGL+D3weERWyR
	DfShlAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txj4u-0000000AViD-0v1I;
	Thu, 27 Mar 2025 08:59:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txj2b-0000000AVLW-3dbp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 08:56:47 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39149bccb69so581725f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 01:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743065804; x=1743670604; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FIYwhtEw1euleTwTcbZCNX9K84qUUjXQZZcm3DuTqE0=;
        b=XDqYIfsQLL7wpFZExAh1qoam+4gyR6CsbI36WOJDSYIk4KgiyjMZdtqlyeZxnBMO/l
         YRgR0jkwsWCd8tjOouKyoaQjpc/PY02TXzVLMNSczR9STxa1RF4qvndux6h3WTqYy4iI
         xnnguIhBAGs1U0cCCr7JFvDBim+4juAfzxZGv/T1I64EIMAN8yOoCqqldjzmoKjNolV4
         16HP0HdVFyo+wsGUAxEOlO58hCWAys5FaENv4iq4S9lu8hD1ifFTZbBf1I0F3/BIW8us
         7EYe6CnWQDv7Z7jbAORIEpTcH11wd7MSsAgeppPdWMmDIKkFUjTUXQvt6tuk4qRk0nkF
         978g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065804; x=1743670604;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FIYwhtEw1euleTwTcbZCNX9K84qUUjXQZZcm3DuTqE0=;
        b=vrJZPE3dWTCiAxUKw2mGmQmxbVIzPozfbGDrUIxVQL0zcN7zOxJC+/sXSJssW9paWf
         HDCCmfhcFqM7I6riMdJBOO1KM4wGj8+caIs4bxwCCt1aYoSG2wofn6+3phGcS/PnA9+1
         UfRO/lgeggZEhDlB46e6sNPo48nXV9hFHiJGovDJ2Ev62DlxoMB65rR+76+UO2bZ7BdG
         4JTT6SOxV45bE3NKDalaM/ceZcgPHPlD7ozYMGmih+CKioBu4GGL3qsVKyozyyA/9y49
         TtIyDQ0N6P+bj4ydgkKF8IcWDvV1WuCEoDKTOBVhMeIvSlk2DXcNz31mkReLJjJDGK+t
         3eNw==
X-Forwarded-Encrypted: i=1; AJvYcCVDEjCot5wENjnXT0GR6mVcjoXRLKWArvo18WNbkVZI5OEFe0jUbVU+oKGYxzuzhPt+1yAb0yIgmplEcEdVJDUt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0Bzd1UysXwOOoJ6vr7/Pd/DQo4fpxD2rr+Qk+H8oSaucuRbdy
	zzT6WlXZn4Nr8samnwrncoatYdo507EiXniAMKIjwCyclmPWd/Kd30nzI5sptQ4=
X-Gm-Gg: ASbGncuQ68EQqPCwIPKjEw7W4dhsZrGkor2PYJE3yDEXe27WfWtcwUnVJPsKq56Mqxb
	uCPVJQXggTgHYpZ9BvkxIfriLdrBFWrN8fVcEmP/ewp2fCQNkZKebK+3orHYoN9SVXCtXGGj0KJ
	9X1OmrMbTshCdJjlMvCTtdKJvLE0MhRqucjecssA7u7eRvyGy0GNcZXyeh0trF3FOpxCqT+q1Np
	yVHSj5npK9lIR8vMGKfRR0QIlJ8ya/xi22I/bcz0awVqHpNvO6JaIYZP5X70lXUMSAR26cwHWOg
	vjTZ1UafcR6r28XeZ1Kvrl3BLxzdnpaGdXC+m5/WIQb9aX7l3g==
X-Google-Smtp-Source: AGHT+IFYnqDl6ib4NKqjPWss5rPeynt8Vendp/W2yLiXx4uK7gmEAWHDdxKjvkNq1tkjNGSpWl64yQ==
X-Received: by 2002:a5d:59a7:0:b0:38d:eb33:79c2 with SMTP id ffacd0b85a97d-39ad174e4famr1984580f8f.32.1743065803956;
        Thu, 27 Mar 2025 01:56:43 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82f1bb80sm30629875e9.28.2025.03.27.01.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 01:56:43 -0700 (PDT)
Message-ID: <62bf00c37566964d6be794ed12a34cd057d9bb1d.camel@linaro.org>
Subject: Re: [PATCH 11/34] defconfigs: rename CONFIG_MFD_SEC_CORE to
 CONFIG_MFD_SEC_I2C
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
Date: Thu, 27 Mar 2025 08:56:41 +0000
In-Reply-To: <b733eff2-171e-4ab6-8546-565d87d5ba84@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-11-d08943702707@linaro.org>
	 <b733eff2-171e-4ab6-8546-565d87d5ba84@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_015645_911923_DE2665DD 
X-CRM114-Status: GOOD (  15.34  )
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

On Wed, 2025-03-26 at 08:16 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > We are adding support for Samsung PMICs that aren't using I2C and
> > therefore had to rename the Kconfig symbol.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0arch/arm/configs/exynos_defconfig=C2=A0=C2=A0 | 2 +-
> > =C2=A0arch/arm/configs/multi_v7_defconfig | 2 +-
> > =C2=A0arch/arm/configs/pxa_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 =
+-
> > =C2=A0arch/arm64/configs/defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
> > =C2=A04 files changed, 4 insertions(+), 4 deletions(-)
> defconfigs go separate tree, so this must not be in the middle of the
> patchset. Bisectability, as for defconfig, is anyway broken in previous
> change, so no benefit of putting this in the middle anyway.

OK. Should it still be part of this series, e.g. at the start, after
the binding changes, or a completely separate stand-alone patch with
a reference to this series?

Cheers,
Andre'


