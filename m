Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D574AE77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wd/OIh9+XuLROZNqgy3qFc0I67rLSdyN4Q7q2BFezNE=; b=L9/uKfiS5otX4ARBM4crmkXpG9
	pXx877GHLHcYwavCHwa4iroLWKd0CccWsmwoA5+rEOcBTFaM2o+kc+N6kE5S0VSSVbnqyUoei4qrV
	UIslXfadbHyzVRAZL3X51M2r+doSl47G1w/vL6mURB26E5sat2/Nbt9EfwNFhpsQoxc1TyxecMEfo
	1JUXu2VJbjEnTqqMJR2JiDU/vHFpi+/g/uWzZArq/Fj/TtLtGcogegMg9xqYuG6p/KGrlsyE7DINp
	hSZ1/Gb6/LSY26EX0MweqysBrnz7MTPfHLaMvmg/XSk/YLqUYexo5IYL1a3yWO82BdUSGCKCW4OkJ
	t+2+rAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBMy-00000005PE1-4832;
	Tue, 07 Jan 2025 15:19:49 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBLj-00000005Owy-48Vo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 15:18:36 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30227c56b11so177058531fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 07:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736263110; x=1736867910; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wd/OIh9+XuLROZNqgy3qFc0I67rLSdyN4Q7q2BFezNE=;
        b=QDW2YrlWd+zy8ID0M0YN2WQHHC1mN+Fqhzj9w+m75Lax3hEzZHJTJT+HuUQ8YGvPI2
         oiXmjLUNkx5IosdDjPzP9G/dAACasa5rCrEux1zlQKPmIl9hYp6xbM56qJcDYbi9vO4M
         xdCnG7W14snS9/TlwbjWLaoD9XCCEH3qllBeeRv1i3ckNDAwSBERWn7Y1zBaSTvMPWJi
         3dPVDPt5D8xAAo+g3bH5/SzBOudLmZeterHcQZDu54alAbfZH/A48kbs1B5uqdb1gH3Z
         EY00TRnFyzainFRRVQYZiS+1Gmh7VF2yq5g4Qx9RiKcMylmKl98LyHiNd5hHoAzmBsDr
         bDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736263110; x=1736867910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wd/OIh9+XuLROZNqgy3qFc0I67rLSdyN4Q7q2BFezNE=;
        b=HG6FqSGlKPxZYftyRYM6W0I2no/nKAhXIFFSgGrfvA6IBh9vYtuhH/pz+ZRr0nrhMy
         5PM/ZnGOS2oqZiNA6ADC3weXEhd2yV+Ipm5mPJ8HthqeORjhglSsfFaEol8An8XLD8wq
         sj82XGajndVWK3VBOzlCE5M0VOHoFMuT8IoyJzHdvl0FutEHcbb35Kzdbi7JQLpOzoQa
         /t9fniyDf5U9g7XjOUG9JzV4DGGfEW2J4yd9u59PlaO3KNwUEAegajc5hV50AThTV6Bl
         p6qJZWVwoPasJ/mG1fLECdFA/2ayiS6A40ORrUm4tv0jYyNSoUcYCvN/uvBmvwLXo9Pl
         LZ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxhnjVof2ZjCGccdyxmOKzbDr1uK1fKihga+O6WLmn+9BGpfUtUFcneTCycMSw+JiKOfLQuU2jLD56qD+N49JH@lists.infradead.org
X-Gm-Message-State: AOJu0YxkdyhItMD42e+HGfOdGeRf7D3qwCD2hk9Yn1rUoWBcnqoRHj8b
	9gFRkfHpW7NGLKNIjlYY3+DcTtxRWOaJwaHvgbwzf+RqYepkVpSqP7Q939HCY0hxnfjCNMFSDJl
	SObACbitoK27rGowm0DPrPkdrdDeX9iW2pSyykdm3cT+78IQT
X-Gm-Gg: ASbGncuhVBaXt6erRgKZKBQxR2NlpOJeXegQB9n1ZuRsrVoCd0yt97CwGrODjzfTdY2
	xJXuY2RdSlPMb/29jcOlfR1fYia5FIOzeT6FP
X-Google-Smtp-Source: AGHT+IFfSJ/IVHhrJ2qR+8hDDFjdqdHa8DoOmF81YVHP8qeEB0D4AktjBUg7IrZZHNZ63UvWGjpkKeBdKSBO3q3o3/Q=
X-Received: by 2002:a05:6512:3b08:b0:53e:39c2:f02b with SMTP id
 2adb3069b0e04-54229562a86mr17756761e87.42.1736263109745; Tue, 07 Jan 2025
 07:18:29 -0800 (PST)
MIME-Version: 1.0
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com> <20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com>
In-Reply-To: <20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jan 2025 16:18:18 +0100
Message-ID: <CACRpkdYrUDK9RsJ0VzksUNAyZ=grdQLAkMN1_BjeqQumY8bjSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pinctrl: pinconf-generic: Add API for pinmux
 propertity in DTS file
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_071832_032855_EBA17C2B 
X-CRM114-Status: GOOD (  10.74  )
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

On Thu, Dec 26, 2024 at 8:57=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> When describing pin mux func through pinmux propertity,
> a standard API is added for support. The pinmux contains pin
> identification and mux values, which can include multiple
> pins. And groups configuration use other word. DTS such as:
>
> func-name {
>         group_alias: group-name{
>                 pinmux=3D <pin_id << 8 | mux_value)>,
>                         <pin_id << 8 | mux_value)>;
>                 bias-pull-up;
>                 drive-strength-microamp =3D <4000>;
>         };
> };
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

There are some build errors, but I really like the path taken with
the utility function here!

Yours,
Linus Walleij

