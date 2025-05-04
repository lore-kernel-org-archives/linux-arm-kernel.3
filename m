Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A74C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 21:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3o7+bYMOsXfcZBnpC2w64bwfJxJV6GwRFk1jFm33gOo=; b=D215vfrbnhDZoHnIWFXFNHsnox
	ibgzSrIu/eXUtqUj56tdVz23seeDDmKkply1CmCg2q01gO7kju8ReXFEUrvw1XnyvdDwwJj8Ew2wi
	CsLUK34w3GqlX+H7GZX/37HUjPW+l8Czf2AwFu8hEiGim4I1bB+6CCd+36HzaUZWlM05viBWnf/wv
	3CxFO5ipnZRSG6W2OZCMOQhqi/9mzXxN6x3zzDdIgB6fPmyfUObnstMKPlsYAe1Gzaiqkhx5kBA+C
	ZOR7Xhzyp/Q61MWN+oIII0OIziraUGK/YtmzQnSMiiX6ZqYYLv3eszzwg6WqVxakk8NBuv2sOWmJ7
	d9vC6mjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgXf-00000005xLO-2Ev0;
	Sun, 04 May 2025 21:06:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgVN-00000005x6Z-1DuC;
	Sun, 04 May 2025 21:04:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2295d78b45cso49780595ad.0;
        Sun, 04 May 2025 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746392648; x=1746997448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3o7+bYMOsXfcZBnpC2w64bwfJxJV6GwRFk1jFm33gOo=;
        b=Shu0HDBhMRpBGQbNzt00u9ZOwONYHrEs56mYO9EyUDFXZ9D9/Y6bsqNvQT+3LzgMea
         owJArJPQT09jW3SdXzYlvGylXni4qCTaskkJ85/toIL0iQOKVbHzu/a90D5KGNhlZERH
         22W0TZoabXQ4dsXagmbUHTOMHFqp9/4f7UvztXi7XS/BAJ8NdqY6Q4/OnE+blnpZ/Cvx
         fGA68VKEZIUj6owomSnw4hO7/U0oCKzC0aDzgVCTh+fYgGiAWQTYWWPEPDGXlQsYe/vn
         3PxxPOfkMzjJ/Hc20y3pKOsC3FpT7A7E4NSUuykln4YnnKZVXnWM8bVgOFfGANefH2Kt
         4Ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392648; x=1746997448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o7+bYMOsXfcZBnpC2w64bwfJxJV6GwRFk1jFm33gOo=;
        b=TbdSQU4/bBAiXyYmCVudFmRp2sY2XtpraPcK7f5vvy8pDhhSQkKhSm62ZKrnybi2Im
         7WQYX52kcTvc6ow2CnLGCEEosXZaHqJuAAAkv9V4rhimo2+84o3dCJAfcdpkhCMnivXX
         DR3S7Xw8h/cmZXCMycKb1QyqpwM7S+k/4VvX7V8CxTq+BnKgbXYiSlqjyzKbe1YVTpvW
         5IhDdWjOSJAXl+6JU4yvtwNcKi0WeH3FPRkCIfoIHtSKPBJthVCY/nlq5KVHiFVmRDG7
         LkR4mafrJTezX9kJJJWtfmm99seNQpo7d6Wj3cIB9w6u1ZWmm7Vky/VdBwFARhoMtrop
         ybbg==
X-Forwarded-Encrypted: i=1; AJvYcCW7rCyT0Xghtea6VtOfN3G8FE6z5qr9kJ6NL5JWAZ/Uq/paw3yPumT2W2fG5DXnows318pIGt2IAJuXmUadtgS+9g==@lists.infradead.org, AJvYcCWj5jI1ITE5yFHsa2C1hjB3rF5kcIjLXW9dBfMu/Opeyoz5qQDHlsr6b4NIPl526l06joiQ4nZFQE+q2xCQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwMQ3K4p/ncX9UdbTdrEZR86RPsWst3e9gmMtNkY1+NdNgqwo7C
	MX4nsDNR0z0azMVaSlo078GeX9slgceKdkSDAOUKbfFE23Dy47uSY//6J+kqufHqKAyW1b7uYIk
	2tCl7XcbBh/10HjwBaupJ9Ssj80LA7Q==
X-Gm-Gg: ASbGnctwrba3gZ4IW6PM74hrH2Neqi7bIDTK41sl0vEXCRti0vmvMEA8qup3oU83l4j
	0I38fuwse5rbwQIeVEwT5L4+wvvD+dflc04fJXk7cVdfdIqd3P1OKKtrMn8ykaveoMlvDsn76zQ
	bMU8+z09QBeaRiqMNbevivebAiBHHbVfKP+Y9wM0deWXK+Cj3Lo1vOiiw=
X-Google-Smtp-Source: AGHT+IHyW0Ndt2dWKLCX5IHkW1ixcqtSrXB9YBoKdwGtqxefF3YX3XxIJcSkkisV04VzYQvQjJESqa/5NELP+RsPwUA=
X-Received: by 2002:a17:903:1107:b0:224:5a8:ba29 with SMTP id
 d9443c01a7336-22e1eaa1038mr72613585ad.43.1746392647862; Sun, 04 May 2025
 14:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250425203118.1444481-1-da@libre.computer> <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
In-Reply-To: <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:03:56 +0200
X-Gm-Features: ATxdqUEuPW-rw5wD2OzNxnpoTVETgPI-7rkDkzV6eL_44Q5_KgcaUYRwZKj6F_M
Message-ID: <CAFBinCBiVQqeYTmR3sj++E8CqQXSMsOzhafAV0JNgDVR9OU7ZA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: neil.armstrong@linaro.org
Cc: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_140409_347775_D3B746C3 
X-CRM114-Status: GOOD (  16.55  )
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

On Mon, Apr 28, 2025 at 9:32=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 25/04/2025 22:31, Da Xue wrote:
> > GXL I2C pins need internal pull-up enabled to operate if there
> > is no external resistor. The pull-up is 60kohms per the datasheet.
> >
> > We should set the bias when i2c pinmux is enabled.
>
> So, yes in some cases when the on-board pull-up is missing, the on-pad
> pull-up is required, but the whole idea was to only add the pull-up prope=
rty
> when needed.
>
> So I know the real motivation is again about the 40pin headers, where
> some applications don't add a pull-up and still want to have i2c working.
For SD/eMMC, SPI and UART we have pull up/down enabled in meson-gxl.dtsi.
I can't recall if I have asked this before: what's the rule (of thumb)
for having bias-pull-up/down vs. bias-disable in .dtsi files?

In the past I had to track down incorrect bias.
It gets especially tricky when we don't have schematics and there's no
u-boot sources available from the vendor (I know, the latter shouldn't
be possible - but that's the world we live in unfortunately).
It means that we can end up with one of four cases for the bias settings:
- there's an actual resistor on the PCB (pulling the pin up/down)
- hardware (SoC) default for the pin
- vendor u-boot configures bias for the pin (but we don't know because
we don't have the sources)
- vendor Linux configures bias for the pin (at least we can dump the
.dtb and hope that the bias setting is in there)

That's why I lean towards having sane defaults in the SoC.dtsi (it
seems that rockchip does the same?).


Best regards,
Martin

