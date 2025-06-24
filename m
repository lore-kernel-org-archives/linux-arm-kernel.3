Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07559C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 23:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=; b=P/G6DZ++nHeXDNE3R2xR0BLila
	v8F/sytgjpc23r6CDekHuH6qv0c1FYGYs+mr3Eh5qUE9sECbljRZrgyvWioT97ZKbKnOk2GZhrnim
	ZeU3gp6I3uLOthofkXUxfDTKcp3a6A48lbNkxVq2YDWt/9YDiRkLiOOqdiQc7VYZ4L04kLriAgsLf
	u2zf1rNAawEmzJKqkhPw5j93ERrR8DLDw/DBZq+V71ggwFwYtcw3hvhL10E6blH2SVAtPJjwpKyEJ
	Oe8D20cmxhdzGsDC9DSq9zcfWsqqOh2VjXN2bgce2sxIWyHsGM7p9tCeHHuCaHLTVuP30yVAx1Flo
	cW2ozM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUCkp-000000073z2-0arN;
	Tue, 24 Jun 2025 23:08:39 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9aX-00000006eF9-2KG3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 19:45:50 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-32addf54a01so8793321fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 12:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794348; x=1751399148; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
        b=XHbr9nuIaLN2eaq2Y/2kxvWhi/I0ASKijX88YHMLprHCJ4LjWGI45GE1svYrWDkt1h
         UpjmwjZ91shXMNfgIR/TOJZCRhuNySR96n5mA92xXQludYIIkNZo0CXLy1wEiMitlVBd
         jd+QlDd/a/zYktDtCxzUVJ8kLRH2Gyf2vrkvI5R/tQ1fQMN32s/5Goyld9GZSiOSBCTq
         T4loNiUmtWJCZzUfodYW/w4UuEi1/Vq7UptGm8KNYFlXaTgG4lj/dsYMnMSLo2efRgfz
         IjXBCDykQ+LqtZMpBliDMB3PXOLV/xp1hGQe1I+++lGBp9Iox+ikOS29QZF8jRynEjrZ
         NTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794348; x=1751399148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGEnlzNr9Zb878AZa1b7vvDvLKPv+xFVLBc4sy4VEnE=;
        b=meuVpYkf+B8k+B6x7DG2w1lkBmTj+i4N1A9Gjor1AYTOb+pe69IVnStuHKMlkQqYct
         8JO6PyGQmEUlcMxg3fo3cmv5W8v/fIcStmF8hk7ZtcC9Y3Pym2xdeLo+HnRZpLwv+++k
         KyAoaPAxO/qHCtUZdStNCcpF+LL69DWXePUSiuQOOdqFMHYKyZ1Z+uKOJwhKr70BO8AC
         p5L6XfsqESO+64BWifpKJliGDemC7Tfeqsb0Qh34Qkn20QpN4LnUFqWHKsO1uiz0C2rt
         5Tnx8OLLkt94GMh8aAWBzu/uocM2jloC3GjU4JWpYkRhNZpPe7WId8KKWKi8NBy3gP0n
         Tw2A==
X-Forwarded-Encrypted: i=1; AJvYcCWhuVNUo9QnZSYsebi8uq9NsZkXOiePp5Ck0bQz4Fh+C0tp8RZq/pVJsbU6MK3lo+LeSa1IofOGMJDAcuQGsw+r@lists.infradead.org
X-Gm-Message-State: AOJu0YwGEGxXgQNpxObBL0Vbozc1T+lSobUCiArjUJknFE0G0ZUGlEt2
	rDjsEGAtDjHineYo0GPFP2k71m/NIcEggMgPBCSxOcxio1dwlbTlC1RF4RqRELTvnAmIk8IDu15
	y6g5qLxg+B1+zwQQfw739C4uCIOJ0QLSC7EHvtg5K8Q==
X-Gm-Gg: ASbGncs3q+iJL1jN5N5R9pv/3UByhibqJ7iukp0Pd5/cGUaR/3f+4DxHdJu1rsPuNy+
	EN8S1dLGHY4mpohTyZuJtp7hyiVFTwNT5DVIVjTXYZqYAiJtI/LYBgVZ67GlPW4fjZKGjpYafii
	0NNzFnz4+0u9SM5GxhEPMVmX0lAPfkyMoVQ2egbtpBFLgDhRDi7j9Y4Q==
X-Google-Smtp-Source: AGHT+IFmqiLtBv2UOTh1D8iZHZIySmZyFDbcKWQIsCqDE3SSo4mBAPZZgwKH6/ZLVohgVWg9CA+g75neATAOTu7gWuo=
X-Received: by 2002:a2e:a7c1:0:b0:32c:a006:29d5 with SMTP id
 38308e7fff4ca-32cc6432fc5mr199911fa.9.1750794347783; Tue, 24 Jun 2025
 12:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-4-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-4-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:45:36 +0200
X-Gm-Features: AX0GCFuxMgt5rF_SL0XMbgco8X42yBA-5q-4FLSXTx6fBKQwC2WxaI2emdRh8Cc
Message-ID: <CACRpkdYTQywBeO_NSdjHZFAc3GizCpM9bSU2W+o59vtkp=Cf8g@mail.gmail.com>
Subject: Re: [PATCH RFT 4/6] ARM: omap1: ams-delta: use generic device
 properties for gpio-mmio
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_124549_590605_E084A757 
X-CRM114-Status: GOOD (  13.70  )
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

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The two latch GPIO devices in ams-delta are registered with struct
> bgpio_pdata passed as platform_data to the gpio-mmio driver. We want to
> remove the bgpio_pdata from the kernel and the gpio-mmio driver is now
> also able to get the relevant values from the software node. Set up
> device properties and switch to using platform_device_info to register
> the devices as platform_add_devices() doesn't allow us to pass device
> properties to the driver model.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

