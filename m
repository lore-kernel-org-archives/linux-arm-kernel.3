Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5C9C36011
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9X/DuBUrgqP5lQkVYZuwChO7HhA9i90hGBCovhAIyY=; b=mgn1kd7Sbk1YlgOQwF3uU1iorD
	xxF3g1tfaQxO8//hlPBNkEZ+rChcZGoGwe7z097e5y4g0rFHnk4pNTuRvCQ9EQ2rOZFyHaxxhDF29
	+Gs4XW066VS+gZ0ke2DggAP3YShtD/lF8oGMcOzUdead5zy/ZxEohwAjQdEN89LBEzr3XeyZ4CsGN
	wNb/xgmiUhwOmhImGuzkoIYAEPe7dqEML8NDGwSU6lpD7B9tK8mhrpn8zj3gw04hFkmjqI3UN4v+v
	UdT1dJ0259LJuWZJ/wHDU4xsqvbCl8fce6A8UrZbBB4byzWdgeYKeuSEjIdESZMornQcZbKkiq9VT
	V9JcQIuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAsL-0000000Dd1B-47T7;
	Fri, 28 Mar 2025 14:40:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9x6-0000000DSoQ-30ZG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:40:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so21353565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743169251; x=1743774051; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e9X/DuBUrgqP5lQkVYZuwChO7HhA9i90hGBCovhAIyY=;
        b=mskCh8H6lPKvxGVt6gw3HiyYzDv98wflVFjreVrF6Ol3/XNjRCTqkbX2xeIN/rdeZ5
         dMUBE2dHPQkrPMfxUUb5xwCzNkDglp8HHrIhiJ07itQWM2+fPTp7rXNJeNXsCLEELGo5
         wjo0Ryk25kgjKyjKKNGbUxgipPann9luMw8NXTGVgdXxBrgdFgA45apALZtEKACIO1E3
         hWy6HDGBuW5RqvJb3hZ59AAxkayMQYbZAY7z7xXAluJVdvNAiRUst+ty3oymMyH29XXJ
         leldQOJw+Pnz99f+KvxbEcEhHFAyCASsX77YoTatBNDPRKTZA7gHrWMqErMw/1/3Xrtv
         X9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169251; x=1743774051;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e9X/DuBUrgqP5lQkVYZuwChO7HhA9i90hGBCovhAIyY=;
        b=j7OzSYIPvhtbhWrb+h3uzfeNK4slAtWU0zTg6AVUw1fsAS5Y9Z1bBk7Da1soRWD3yn
         WOPJjuc+sw5+qtoyFKdXEo8I3qF7rDqOiQi1fnD+kUKwY4grmUW+lYAKE8yiK7ekVypz
         YWPPHO3sO1dn8WuywbjMOaq9wzHbAbuXMD5wnJpd4IU4y1UzKfouP4uHKMkA3pl/hOrd
         CbSFnvt1cB/CH+mAV02yjQPOyaHB1/PvKVhig9DO69a7t2AHGhPXTD/kp6zqV04Nc6Nk
         2BkQV02XOEKb/E2JzgVdbUx+84SEdwCbrX4qoEUZ1UL7gXfr8U4aXKTYcbETaWj+NCbj
         eLvg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3b7jfK/wK+b8Y+t+d5HsqRT/SITupeKeyW/BGD82rgCV2BYyRtMT1LWzjiy7MPiZ0XG6LzQ/Lk4yFZ6WT+cb@lists.infradead.org
X-Gm-Message-State: AOJu0YxU8oDAolvnC22cH1gA5oFIHBmovAcdOu+1XTsC9zrOjmOlaBQG
	1M9YbU6mVmnEJ8cgHZbvWQlgpmJIXm+nFFjewtM5MCGzEsUbeI4wHlg00BcsIAc=
X-Gm-Gg: ASbGncuigb/hyKsC/7CI4DDaGprW0IBry3lLnr+FJhxwQCbL2JXUiEFAxVdvH+XT+LE
	Sucbcz5NpxAWMD2IVPqR673YSA1C7vdkhidAtphOI+7mIUFv7EsJjMtnzEEKbgGXf5G2He/RTkV
	5d3qxji8I5IInafIQBJ6zfwtAK84EV86Gm3/gAuXvRdYMGXHIPLjYU1A/zN2ZWPnS4MM6H1m8g+
	U6H74YRbajSSook0VRMglyNUX8xaedXnKwooNuqgqJ7RRo1NQCHfJ13G1T4UwlugFxy2ms/7/Wr
	K1GIl2fS7yUGlIIGatGhuGDoYSHXY/K4eO6GHLWa1GW+gMKu
X-Google-Smtp-Source: AGHT+IHwHjuKaCXwCLJb2L7VuxUBZjvvxP2g/BLNcbOaZ9V7ELDXVBGUe+axHxG86hTFzSZGV12KgQ==
X-Received: by 2002:a05:600c:1ca9:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-43d85098781mr71142935e9.27.1743169250696;
        Fri, 28 Mar 2025 06:40:50 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm27701695e9.28.2025.03.28.06.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:40:50 -0700 (PDT)
Message-ID: <10216af0d2a3c85cba2bba1356a50b488947125d.camel@linaro.org>
Subject: Re: [PATCH v2 00/32] Samsung S2MPG10 PMIC MFD-based drivers
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
	linux-rtc@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Mar 2025 13:40:48 +0000
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_064052_752308_A99E6AD5 
X-CRM114-Status: GOOD (  13.15  )
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

On Fri, 2025-03-28 at 13:28 +0000, Andr=C3=A9 Draszik wrote:
> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).
>=20
> *** dependency note ***
>=20
> To compile, this depends on the Samsung ACPM driver in Linux next with
> the following additional patches:
> https://lore.kernel.org/all/20250321-acpm-atomic-v1-0-fb887bde7e61@linaro=
.org/

There's a v2 of that one:
https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.o=
rg/

other than that, everything else still stands.

> https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.=
org/
> https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@lina=
ro.org/
>=20
> *** dependency note end ***

Cheers,
Andre'


