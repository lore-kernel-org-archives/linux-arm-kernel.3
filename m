Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971BBC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 13:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftN/XcZ/dByaEVn0cn0BMSamQ3LUIZlb3wXtmtnhPG8=; b=mzmwtF4DqywVkOtX8y7xrfMJ/H
	5gi/mxxmWkjBgDG0vhPxrWQHLaC6md7bvimvNuGLnCZ16PZAFTYdxbo0Z3mL2+r4zkOnU+dSi2jb5
	liqFXM956lnIV+lhTyLKrbjeEWydOlopacimEogYWOuSEc4YBO5lKL5UM4MNL5fNnjyPUrQsb9/qn
	8HrEKnueAR7A8ms4lArAP+C+Lwu3M65kwMBAg1nxtd0mTm0xYDoADvXDTq6LLMFCnVvD4Y/eOJnd8
	BDBVzri5jMXr8UzSUNbYUAW+ItNpOtY3cq+mBXwhbNg4Qk+NS+FuKvS+VOVtBu4HtFTljT9I4yxvI
	ipcc7ArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivOV-0000000AYkg-1biJ;
	Mon, 04 Aug 2025 13:38:27 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiv0t-0000000AVWv-1XCD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 13:14:04 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-61557997574so6582039a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 06:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754313242; x=1754918042; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftN/XcZ/dByaEVn0cn0BMSamQ3LUIZlb3wXtmtnhPG8=;
        b=VwMOpZFzqP9v3Ylm21NlS+OMsC9/OtdNl3EXa2zYoHDPlREwEtYKebLSL2yg195k6G
         gEPKkkH1IMG6SNqFz5DzoD5iTTu1yJPq2uyYxBlaDEhw9h8p9lmoqaS/iUmis60FPHek
         L5xh74CtVrRYvfRqwHEAqL2JNoen0anr1E2+BYI/h7hfoA8bbMgQTx1ajXo5E/HrbiQ6
         9+DjMEIjxzTNHhO+f8csx4VBX4tu80jxsiQt4ujQuf+IZTZScD8AhJb+NctL8jFVF2Ff
         Phg+vxd6gjSGOZwnx5tRU8lkYY7G+Ek7eoQMqU0uAlHuKAJBaWHYb35IHAMTaKCwj9NO
         JNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754313242; x=1754918042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftN/XcZ/dByaEVn0cn0BMSamQ3LUIZlb3wXtmtnhPG8=;
        b=nty2AwgxabhKcGfL4kOlwEsRV+9qo15Wbz6oCg5FrFna2KgmiT4Vekt713W1knG9Zb
         o1TyG+mPXAHy3ybx6vb9pjf0iRC/7IuyGIJkRMJb1JTQR9UOkPw5XVnHON6t3ZFxpdj3
         BFxj/c09mCM8HmjduwWJg1cKAK/AvTdG9/k3oBZtlAVEasiM+v6KiYTt1q49FwLyMwCb
         HjSZgDMRH0B92N8k+CEyjguGElX6fSJ8MU/RJybC95cEf//HdydpyAtzBeWv3d28krZj
         zas7oWpCS7fvjTFhxS26M1wqR800+FsLI88AP3F8SiKd1iss6u5AfDvTjaeLDvoxo29n
         XKxw==
X-Forwarded-Encrypted: i=1; AJvYcCXXydXUGViH8vmj2rHQ083dKXNmr5p0mUVIw9SGkJVSYAyLzjVRISCBPZYJ3+DSFTcQNWjdR/8bea4FBoDvfBz7@lists.infradead.org
X-Gm-Message-State: AOJu0YyqrqwLcL4mZES9AmOhkh0oG5dVz1T34y4PFRnx5GXcT2EdKT0G
	oowClupcy+mmicbZDcb0IF0NM0L3PIFsgTkEOSrPTSqbhF0BrHQxoVx+LC/vAZa6X/Yie/Xlp2K
	68P28dTSYSmfsnU7lvq0bl1GX6gxxOn0=
X-Gm-Gg: ASbGncu+7Erf7DqxMlcXtV9ehS0Q8yaCXUxgO/X6Q4VVctM/VegyE0E8M3lS9+ZaVgl
	OrCpTHb9YWgldIj0RgOwYfOkmhvjIq9MnU5Er3iCrtVgb3zyOxpJD134CCSwyaRHGr0cCwDgpKJ
	8XFRL1xqKuYL5jwgwlzU7YKHgWNTuu11hiXs6eZz1sEmUznmsr5qzVez9IrSSyttiWmv945X2TD
	+BZXo+CHw==
X-Google-Smtp-Source: AGHT+IGBeqfw3fvLlvAcAw3BpTqiuPXA4J2h3pDCZNywn5w7ddqZQES72AmoaGsmtljDcMeac00/ZeSQ68zvdeoNgFE=
X-Received: by 2002:a17:907:1c12:b0:ad8:a04e:dbd9 with SMTP id
 a640c23a62f3a-af940187873mr985057066b.31.1754313241498; Mon, 04 Aug 2025
 06:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250804100219.63325-1-varshini.rajendran@microchip.com> <20250804100219.63325-8-varshini.rajendran@microchip.com>
In-Reply-To: <20250804100219.63325-8-varshini.rajendran@microchip.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Aug 2025 15:13:24 +0200
X-Gm-Features: Ac12FXyCmSYVvYJxjx9xn913aCGsLi-yBSTMjwEVe7Qv7e6k9dvmsncWqL8ALhk
Message-ID: <CAHp75VeGbB6kJF879LmDu9X1kcNydhSZo=h4wyUeVHw_WWKBew@mail.gmail.com>
Subject: Re: [PATCH 07/15] iio: adc: at91-sama5d2_adc: add temp init function
 as callback
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: eugen.hristev@linaro.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, srini@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_061403_401503_6145A23A 
X-CRM114-Status: GOOD (  10.81  )
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

On Mon, Aug 4, 2025 at 12:03=E2=80=AFPM Varshini Rajendran
<varshini.rajendran@microchip.com> wrote:
>
> Adding the temperature sensor init function as a callback function.
> The temperature sensor initialisation sequence is handled differently
> for each platform. The same is added to the platform data of the
> corresponding device. This allows us to handle new devices like
> sama7d65.

...

> +struct at91_adc_state;
> +static int at91_adc_temp_sensor_init(struct at91_adc_state *st,
> +                                    struct device *dev);

Isn't it possible to avoid forward declaration for the function?

--=20
With Best Regards,
Andy Shevchenko

