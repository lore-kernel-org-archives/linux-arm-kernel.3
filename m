Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D2ACA1019
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDv0YkWfgMrbAykmYhgPc5757sIuuDQeVA6MDv7fwBM=; b=tAbosCFeS9uYRtJSghvFqg3MLn
	TPzWi0XpmXcQAQR6/NF6R5OMIERbZB9Dc2XpeQRFwukNk+FXQiYoPqpsNbfYHbP2eqTABZVe+yb6d
	eyikivnUFEN/iy/7JypCTOiORFz/MZIVMMj7ph3M+seC0QRMdWW6flAhpT9qI0126HKy734c1OL1a
	IgCIHDKFxlCPoKXKl/EjObK3PCmOpCb2FwuE00b2SbNFZHy9Vs2cPSSw2JHFYAAzCYL964Hnhzh32
	R3cWS8lJhs9Q26+MwjTIZNo03JWTyPmSDADj8pZMMNGo9V5vmhjQmMoXPCxkTsGw7nG8DzaXGqauQ
	MwPMlCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uturh-00000007dQT-0Lcu;
	Wed, 03 Sep 2025 21:18:01 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utq65-0000000715Y-3CoC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 16:12:34 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55f74c6d316so10924e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756915952; x=1757520752; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDv0YkWfgMrbAykmYhgPc5757sIuuDQeVA6MDv7fwBM=;
        b=RpgSpKNeqr1kWrTBjLJbUagm+NRT3p4zyqAF1h0rqX+WKugJGw8PcJqeDwPZYGgAQL
         OsBYW8tbL898aOCQ9/7DPpaV2BvVFHMcEFGFhXawXX09pv+xOuk9nROggr1M02if+ZEX
         z2wPrmy6/KPozCLDZE70iqtt17Mbn8G32nGy/SoYAod2xEQZg1SN47n7yye3hWCBKR9x
         MX3qTGK/DQhKlIdlTFVKP4iLHhk8CK9NOvIR3sN5CVoWF5VaMqb0fdYB5Roj1hNPQyXY
         d3soQvyLjR5niyWUCF0ltLm3K1kOBmIFyNp1tLmJxTOdRSevbnDVAFUQ4HvqapQb5yHL
         RQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915952; x=1757520752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDv0YkWfgMrbAykmYhgPc5757sIuuDQeVA6MDv7fwBM=;
        b=nFwGdEts2QVUWevAdwCJU3IjGXdiOemGujoS22zJdDQ5ymNNwzB3YzJ3qf1RY1Szxz
         U/VepJo7vyrL0jrZXfvR6igTjREmVqpUPieYpY5b8m+y+duxTEEflu2WcKW6Mo9xw/y2
         zf+A8cNdObFrtGTuUlFsZHfkZO3sgNMF6kUw2Dfz29nGARK8RV6zJeiwAhejTROSdbaV
         DkMz5g89+SPhHNGKz7yFPt9UWwHO8XL/s12ICAt+3sNxv0I6klWB35Ru+xatDy1a5Ktc
         5Ur7XJ8eRNJSlYZkcdU25GdPxvPkbvHmKtbKbguVKz7Y8HlT3mciODtfF2QyncrbH36t
         +wEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbc+8kvLKCPxhG3Lxks2ngpeCS34GYDVBgaLBDC52uYpdHLOoiq+NgsOEVW84z2z4tvoAUIydBZMqx9lbYIRNv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1Kjn+TxkQUL3bHkr0NpCM7JVYUgjV4T5MzvHojxfSsmH24OvE
	4M30uP2vgh48a2ntzXQOzokPU9r08ysbUGm7XtcRvXUvFw2QBdjEe+QgtaEda3xBo4QjGIEwVDD
	6xyYc3mdjHwZ9xGrQve8ywP5t7w3xFg81HcUATbN7Iw==
X-Gm-Gg: ASbGncvXyI1MmE1AHqngJWEMUV4Nw/j6ZL2BjGt2LJ2uLony0xHNtIdT70PnME9Rey8
	yX2887vNrAZYt2icJOQqT+4mAQgpAFFDcKG6C4kEwWIfL5xznuuWTSGUxcaIj1vOwuNqA836ETl
	VuCSDR3HPLtopbOjn6QpVBlzRmQ3xwqbZyCR11Ou4cU5AFCPaib1ToW3DCgBxuaFwpKSIm24ozz
	WD2TG2cdeSREye0vOYi0BYzYx2gN0V4+wb6VwU=
X-Google-Smtp-Source: AGHT+IG9kbY2aWTL+bQ4CXwiiutR8P33iBoPBAGU9ej78mB+Iz64u9wBkzKBXujWDJSkJohiCiXP1iFkD6uUx+YHjIw=
X-Received: by 2002:a05:6512:4608:b0:55f:67d5:938e with SMTP id
 2adb3069b0e04-55f7094f818mr4090090e87.39.1756915951790; Wed, 03 Sep 2025
 09:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-5-356b4b1d5110@linaro.org> <aLhhpiVpGscOFydS@black.igk.intel.com>
In-Reply-To: <aLhhpiVpGscOFydS@black.igk.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 18:12:20 +0200
X-Gm-Features: Ac12FXyZAxIt_WffCZOnIM4e2vN_EwG-wp8GqcwHD84BnpN3MJueeTCK3eA5rqA
Message-ID: <CAMRc=Mfk9yBSkMQj_egtfNQ8=A+mvyqqy+_KM690GCV-Sts0Lg@mail.gmail.com>
Subject: Re: [PATCH RESEND 05/14] gpio: ts4800: use generic device properties
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_091233_815152_F95ED5DD 
X-CRM114-Status: GOOD (  14.16  )
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

On Wed, Sep 3, 2025 at 5:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Aug 25, 2025 at 11:48:46AM +0200, Bartosz Golaszewski wrote:
> >
> > Avoid pulling in linux/of.h by using the generic device properties.
>
> ...
>
> > -     retval =3D of_property_read_u32(node, "ngpios", &ngpios);
> > +     retval =3D device_property_read_u32(dev, "ngpios", &ngpios);
> >       if (retval =3D=3D -EINVAL)
> >               ngpios =3D DEFAULT_PIN_NUMBER;
> >       else if (retval)
>
> Don't we have a method in GPIOLIB that does this (can be called explicitl=
y by the drivers)?
>

Sure but we don't have the same behavior in GPIO core, we don't know
what DEFAULT_PIN_NUMBER is. I can't test this functionally so don't
want to change semantics.

Bart

