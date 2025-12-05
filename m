Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDF3D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 03:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WezX6hNbQA28AqxZ2YLg6gysDGXXgYStXFDCsVPlTbo=; b=dPGd5KQvNVPHy3jfNgx1feuQW2
	x+z1aHloznzTkeAK1Hd83FZzBPM+AUoUF51qCRQxe4C5kmYYtTZec+G5g1HV5RsP+BulAcmMrXPgI
	JsNqq38yHchk0gLzAv8SzYZlb71iY57H/4NZeB+ag/4NiPqWi7CiuLI8FGZEsxIt/ac74CLklweoF
	B4btTxdCqXKDd8Rp6B7w0bXCuei/AkjRSf3BFsUQS31zcewNbNPYhUpl5s7PR6mXA8C/vfbUKIBA+
	Swm6qbPu7QaBlrXEXnQoIYSnTffaPXre9B87lpUejKxu0WSY3EjqgwiparVSwme6rk/PiTR+xHifF
	EWjR4s/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRMr9-00000008zAb-3e2a;
	Fri, 05 Dec 2025 03:51:43 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRMr6-00000008z9o-1Phu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 03:51:41 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7ade456b6abso1489882b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 19:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764906699; x=1765511499; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WezX6hNbQA28AqxZ2YLg6gysDGXXgYStXFDCsVPlTbo=;
        b=uce0GEnnXeRRyzhUxW6eC051a9b7fWRwf8JeHnqTLefY9qoS21iPHs7Kq0B21XzabS
         bC5wqtlhXWgad+anzDV5rPrMMFM9qrymIquMOuZDBKndq5VjXvzC1eUnudzGad8lGPpj
         /4v+U3nes5M3wfnjjJV14CGzUQ7dw1xrjibMk/CjrdKxz7+ymGDcY8AmVxcxP0CGgBZf
         KBXCwwzu8qdiBlrChCR+6uAAZovLQGV0peHJxhXfGCUf/K9yIhQbOIMPcpo6Urzg/zGo
         II3hTZilgD9PPbj3SmEgcZQDLB/iWOHIyzZldL+rtrjlgiCC8NGOOgLui8Vm/c4g5Mvr
         XSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764906699; x=1765511499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WezX6hNbQA28AqxZ2YLg6gysDGXXgYStXFDCsVPlTbo=;
        b=ewKVpeEXOKJQpsl1dBnWul3+0/4HBva3iVWuP2JAHaPRRjExgYVi7R25+IXjvxmZmZ
         u+OcI2MU0mY3jmQ1cA40pgqIqtilySD2wm19wP55Vk9RnUZIHfC7pgoT4CW9+G9kjIQJ
         fTCrzp8IZGFS71IwklIQ9Mtf6+Q5H3v9UZWidcv6cBeomE/jobNSAIl4MBiPWE3x4pb5
         aQG8c7duV8F0sHuU50Fc44sAlfPY3a8ygaSv8N7DG2F77NPAdnx3x6Db+1RM6tA1kQDn
         /XwKh5yJSEvASHo46mJitwyKFCaQ/QzaR2bO8UK5dRPsD/S3P5YMCZkL3dhc0d0pX7un
         3dXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWNDIsSUFzS4vxWOPsc51itajWrL2jINGKuijW0JLr/Xtvuc50vtTTaDOUiabgd9hSDcVi9APEA5g2/KGnUkRn@lists.infradead.org
X-Gm-Message-State: AOJu0YwKnGBDfDTBnyTN6tIlEcr6TcxlIk+M5RutGrWg/ZPcAIiStByo
	ZdVrJxV/4GCTRnxAOQX7iKVlMHX+p/ZxNmmmIx45EXbmx09Y8L9O3gSAVTpn9oEbGZEkrWn+DET
	qdS842SsnAGYVpk6Txetv8mgwURwIFdpoXiaTIhc2
X-Gm-Gg: ASbGncstxAhgnTMvopae7p86KGq4a9XqRWhU8dSp948Tun+tVM0y5qjNsZotVy48M5+
	0iH8jjilPQdxLFsai24omv4TIrnirxm9/twp/fiSvfHYqmHnoYub49XBnWUH+1ULm3cNL/IhguY
	6BE09BJUbbhueNfCaSb5j7gnl8z/x8MBOrgxCYFaiGwvxg/oS9FmXSmRtK3QPO9fRLT8CaZEh+Q
	/6H59iDRIe14QJFI9gZLvWOkVYVn2d5TJGmhp6JJEIoemhtHNt2aAd4p5XWhZ8p47NPR9Hxui6l
	eRoi25N9gIbz7gGMryiA/gDox/Y/
X-Google-Smtp-Source: AGHT+IH7GWuDo91VkkxlEQ1I2pmrwkMqe1WpyJDLcRf2GJbb70zopeBu3Xn1bmW37Gs5MbOfJb8chhFABiGk+XWPpXI=
X-Received: by 2002:a05:7022:3841:b0:11b:c1fb:89a with SMTP id
 a92af1059eb24-11df0c3d70fmr6132695c88.32.1764906698269; Thu, 04 Dec 2025
 19:51:38 -0800 (PST)
MIME-Version: 1.0
References: <20251121-phyb4-v7-0-df644fa62180@google.com> <20251121-phyb4-v7-2-df644fa62180@google.com>
 <CADrjBPpLn9qzg1y5_c_0CYL2U8p6taMWtPOw5RykAO4=4uNeUA@mail.gmail.com> <1a53d473-fc13-4ac5-ba52-4701d95e3073@kernel.org>
In-Reply-To: <1a53d473-fc13-4ac5-ba52-4701d95e3073@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Thu, 4 Dec 2025 19:51:01 -0800
X-Gm-Features: AWmQ_bkI3gBipBfIh3J4uywjnOrs9760E4xYx1DdnhCprCkAyhSf6HmOxRGOWVk
Message-ID: <CA+zupgw4_o7Po_Zw1qT13YU=PGXoJ_RAPKiAwFpt6RRyO14OAA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] phy: Add Google Tensor SoC USB PHY driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_195140_444848_65790ABD 
X-CRM114-Status: GOOD (  21.77  )
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

On Sat, Nov 22, 2025 at 4:49=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 22/11/2025 13:48, Peter Griffin wrote:
> > Hi Roy,
> >
> > On Fri, 21 Nov 2025 at 08:56, Roy Luo <royluo@google.com> wrote:
> >>
> >> Support the USB PHY found on Google Tensor G5 (Laguna). This
> >> particular USB PHY supports both high-speed and super-speed
> >> operations, and is integrated with the SNPS DWC3 controller that's
> >> also on the SoC. This initial patch specifically adds functionality
> >> for high-speed.
> >>
> >> Co-developed-by: Joy Chakraborty <joychakr@google.com>
> >> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> >> Co-developed-by: Naveen Kumar <mnkumar@google.com>
> >> Signed-off-by: Naveen Kumar <mnkumar@google.com>
> >> Signed-off-by: Roy Luo <royluo@google.com>
> >> ---
> >>  drivers/phy/Kconfig          |  13 ++
> >>  drivers/phy/Makefile         |   1 +
> >>  drivers/phy/phy-google-usb.c | 292 ++++++++++++++++++++++++++++++++++=
+++++++++
> >
> > Please add this new file to Tensor SoC MAINTAINERS entry so it's
> > easier to review future patches.
> >
> >>  3 files changed, 306 insertions(+)
> >>
> >> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> >> index 678dd0452f0aa0597773433f04d2a9ba77474d2a..af14ec74542a9879c856de=
e8236753990fdf3705 100644
> >> --- a/drivers/phy/Kconfig
> >> +++ b/drivers/phy/Kconfig
> >> @@ -101,6 +101,19 @@ config PHY_NXP_PTN3222
> >>           schemes. It supports all three USB 2.0 data rates: Low Speed=
, Full
> >>           Speed and High Speed.
> >>
> >> +config PHY_GOOGLE_USB
> >> +       tristate "Google Tensor SoC USB PHY driver"
> >> +       depends on HAS_IOMEM
> >> +       depends on OF
> >> +       depends on TYPEC
> >
> > Add COMPILE_TEST for build testing.
>
> ... and this probably should depend on your ARCH_xxx || COMPILE_TEST
>
> Same for USB DWC driver.
>
>
> Best regards,
> Krzysztof

Peter and Krzysztof,

Thanks for the review and ack to all the comments.
Sending out a new version.

Thanks,
Roy Luo

