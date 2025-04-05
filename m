Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6E8C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 13:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeyhOisvFTXUdAkk7e1xdxJ99H2lpRMgdiRUA+fOjh0=; b=3hnYsFqSS60QXTqf6abyG0+ywI
	B1/3If4G5SWIXB0/TpAzrLOMnQwVYIPxEHd5CMSTuF53HTnxtJewppxjVzJNZKahizVAN5ngUVykn
	XrkxMN28ly2Za2xi/hq9jPMnCBgeJrOSv0Rw79ALdGwyqudW534Q9IP1/iLXPRhbnVXied1GVJNZv
	cWAdkCbHmFB3J5GdmjObbvZpefeEDVolBQrQ5ww77ZptTFdINmZNNhFwpxfxcfe1y5InvyV+eBdtQ
	jrFIJI4efJkcf2B1lwBBdvRzwHq8Skrpz6swEmZ3dntfW+1hXCso4ytayCMLTsO2X+4tTjkQJkPk1
	050lhivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u13xm-0000000E1oD-1hVm;
	Sat, 05 Apr 2025 13:53:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u13vj-0000000E1b2-2oSO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 13:51:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d0618746bso20442815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Apr 2025 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743861086; x=1744465886; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JeyhOisvFTXUdAkk7e1xdxJ99H2lpRMgdiRUA+fOjh0=;
        b=JEA+VnSVvWxtTw5trqqNMq64GvWHDcKcoMq+/BOH9k2IEeC7MMPkdFH3DyzVVKd+uq
         jDR74pO0iggy61nYrfZBA3dhSkmhJSvVW4lTIUYlW6Qpdcp01aFAWIvdKYKcYOha4LHZ
         hnVI1mbR6VAQ1U6Z9M8i8vkwRRUNwt/TsUpm8LXX4/Ko+Rr5eEdcjl6W92dg1zEZd5xS
         rmAI4AybkmrxTS91waccVphDDqiGbbNENt8clYRHSuoMlx8Vw7BIaPHTesNZHU98g+TH
         hWuUZ1TGNEvx8Su7/anTs7qlQzFb2l6qhcTn57J4eN7upzSpqVsJjl/WM0hK/LKXB8ku
         TWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743861086; x=1744465886;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JeyhOisvFTXUdAkk7e1xdxJ99H2lpRMgdiRUA+fOjh0=;
        b=B5sjcNr3DgNE7bx/DWKe/12nfxo6rymhQ5rB6dC4CHhQIFbsuQ5Vbmg8c+DEzgx8Da
         jcLLNG2PrzGopx4fRjtC4J4wmgX0yEQ6aPhU2RFdMmHa0py4/DQ/XHEnwTk7HjBvqdw/
         ZLScYnmzuC91NU9b43TnV1cFL33Jrzi3Qto6TqSdBCcCqfiPhxRW3yXIFKQLsAroEMNc
         tITvRuIz1LXUuaAMpdKDkLEpUIPZVx+IcxGIVkGJaE7CoQM0JxnoJjnOc9jXPR7+C/5O
         FBBRqgNGUGd3kVRIQTlzQzFNvHwG7oB+Lf4ITvljQXV5P9se3Nx26DYT/dprABRzBPTY
         J7TA==
X-Forwarded-Encrypted: i=1; AJvYcCXLMlntDyvSDLRP2aEdXFwDXqaeD6uXrMbfXDUKq8RPgI70H3zyv+Ii9INHBKSqi39p4LvVcdVg5t5vfGC4jva9@lists.infradead.org
X-Gm-Message-State: AOJu0YzlKjBG4jwJyVcsA6btivFG1rd72SY3u8OxuluCtdqbd715ySai
	oQc6MhQ/RsoSwTrl/RvXiBMkt6V0LSdlMP//jBbXGrpNc0emf4jA+NZksgGszEQ=
X-Gm-Gg: ASbGnctnMAEHWy97dgR8kw2AfQeJPxvZI3SJhLMrmqEo0PjLkSnWdr0fR9JAT40AgpP
	7Pc8IzJRyolujkgnrX4mRX29IU/4StePjXHOLKXv9weiuiKzbWctWhsJcHS1KSsqvKud6j+h/V8
	pBhCVpvnpAGWnVg5WA6DcZhygqGkWzIxksEPIhWYsCEft2luHGnLf+yw/pv+omEGH6VPWSKZou+
	hhQnn+UOmgGBcpWI0TfzQAMFzrWW74E+9dr4ij0EMvUdD9vS7pTKAUfEiD5B49AVy75V9wyTTdQ
	9eVUm6UXUgNBeozrrIx75antwZ+iPc6U7CWX4Rm704p5Lx+b
X-Google-Smtp-Source: AGHT+IE02LC/xEXo48knWnsG4VHZcnXuNsYnZ3C2c3XXP9CR527du7gAFHHDdb3MD7dDyrR4ZPrhVA==
X-Received: by 2002:a05:600c:224c:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-43ed382b5d7mr37310605e9.2.1743861086018;
        Sat, 05 Apr 2025 06:51:26 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364a0c7sm73335975e9.29.2025.04.05.06.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:51:25 -0700 (PDT)
Message-ID: <75f5948d8a34f20d70050c938bff5422b08e37c8.camel@linaro.org>
Subject: Re: [PATCH v3 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 05 Apr 2025 14:51:26 +0100
In-Reply-To: <20250404094354.GG43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250404094354.GG43241@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_065127_711566_D5E80E17 
X-CRM114-Status: GOOD (  15.17  )
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

On Fri, 2025-04-04 at 10:43 +0100, Lee Jones wrote:
> On Thu, 03 Apr 2025, Andr=C3=A9 Draszik wrote:
>=20
> > This series adds initial support for the Samsung S2MPG10 PMIC using the
> > MFD framework. This is a PMIC for mobile applications and is used on
> > the Google Pixel 6 and 6 Pro (oriole / raven).
>=20
> Okay, review complete.
>=20
> If I didn't comment on a patch, it means I didn't see any issues with it.
>=20
> However, saying that, it doesn't mean I won't spot something next time.=
=C2=A0 :)

Thanks Lee, I appreciate the time you took to look at these!

Cheers,
Andre'


