Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2BDC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 10:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVSfEDxnvDA5rGvCvnbh0Gb+paH+zzrZtcmrNCp+8Yc=; b=e6Wy8eoKYwHqtvoHR7TshSsFB8
	rgnlshKaRLq0ZsJzqxU3yUcF7H9/I2P/kFAWxMCcxOtvn9ZQn8mdM3z41t6/2/qLFxJqzBEVFHTwC
	BSMti4aZOElK74ZGVF09EQsRvkzupmtSH0PczqeOINE5WZb3oQ+YyRNlAfwhfiS8/62EBK/Hb9rJj
	yq/NCPstPudtUKt5iYT8sFjqSw7h5bRnOZZFo3N4m7N/FZzBwq1iyCopnrGqXdRCX0VfWUX7AyJQW
	PkLPFcnYm4xagg08GRFQjVgFK52gAFrP/aVOBrTshl7FR6me2sRb/LQj+7r3XN95aelGgjR4gRQje
	MRNTDVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGu2-0000000ESRK-3hqV;
	Fri, 24 Jan 2025 10:27:06 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGsc-0000000ESGg-3Jl5;
	Fri, 24 Jan 2025 10:25:39 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4678664e22fso16458591cf.2;
        Fri, 24 Jan 2025 02:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737714337; x=1738319137; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVSfEDxnvDA5rGvCvnbh0Gb+paH+zzrZtcmrNCp+8Yc=;
        b=ct+mi4973TBPramendlW/HBMCvGZBhMNmWkbABckUI0huDtCct+3rR4RblfQW8b8Zk
         DytcI9iUQHmtXuriVNgnbqW1C9AenuMXQ7rZSV8L9iYH3aZuidAnV7//rV5+ltqAdBqP
         tzIXjsbrrneUaXit1qat9rFsqanB7Xc+P9JdU5LR9b9A4i/0RbkxJjaCY78FOYUDHWl/
         Igi6/3VnUf88ZRoPtxxyUCDtEmL9QEtl1HRuPva+PlAVEvJ2V4/xDuduYYsEktcSAyMr
         WhSM7+/nBhV9sIS1DKQ2Cz8ARMJc1FfihkwR0RWBqUPOypLv02kmZwlnJvDErw7HuqSx
         XKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737714337; x=1738319137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVSfEDxnvDA5rGvCvnbh0Gb+paH+zzrZtcmrNCp+8Yc=;
        b=Rf2dhVwRKS+yVzmteSt+q4s9a4w12e84m6amuba1seQ8TdsDSER7Vi0LUUEpb4mhmU
         gP97epUJ0b0YjHXhpbal2yQyyAGN3SnK4mMsHCWA1nv0SmY1/a+tL7QFh7Nt/WZtsB+e
         01eIs2bF4AKXUVWmkUGTIkynTKERIm0x1vjEQPh//TFR4TFismfL/7hvOeZCcASGwDa4
         IoQVOzkrHNPVAG+pMXkvNTpSb9TZ4iC4r5bVht5GQ8SbJ03Pb1gBZAHjNVTL80DY1wyL
         75/wJ927EREHgKMF8T6XDeigZg7Jdr42lDh4gtOcGI7aHgfHEY3ZB3cjWJV51Gh1ZR/3
         ul/w==
X-Forwarded-Encrypted: i=1; AJvYcCXCfkApyH9EAkkxnQZZNvGvZuAsQc785RiGGa4VDX7dCo//0VSqenVh+up7D2BuCRXCQUNkSCipsOnIvIl88h0=@lists.infradead.org, AJvYcCXlM7u/pPIf62CbMnCFwQXh8xse8cHq8wlSfB7vKqI8OL/bl2PAsJtdBghV7n2Zz3OSVWNhrvMgxMws3VF8TD0x@lists.infradead.org
X-Gm-Message-State: AOJu0YxAxVq1GHNNCkfTY++CKlhJz3qvqacjBlhYTMaGREuR2rYdWhKx
	HBBxmWxNrEO1sjVX5j9WL5fS/gGL6iQ768KzaGwVq7b2S1kh414nO+qWd3UoNbtKazyZfudea4s
	etczWegi76V8XuSS9ov8we+aPlZI=
X-Gm-Gg: ASbGncux9utCvdImHIuIpYQVwejp6RRFHKcwIWMHj5rd2J5cVyNlkvAOzCgz3CwEvB7
	AdRyXLuCO7DP04ZXkpzQiiBgCZG7cxC2GaHg3Cy0vfO/1XGF25FTlHCdwC3adTyLmT4pqkuPe18
	DaJvk+EpUNHT3NS/7LtRI=
X-Google-Smtp-Source: AGHT+IG19zMkzxnogxqTUpCFFCWHU7lU6d2GX59oTfrT4bEh/Qp/+jBldUiAWHgLhmBH9A6JXxMmUJ7olZ5BQkuj30g=
X-Received: by 2002:a05:622a:d4:b0:467:8703:a737 with SMTP id
 d75a77b69052e-46e12a9a34bmr447365691cf.29.1737714337203; Fri, 24 Jan 2025
 02:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
 <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com> <a76f315f023a3f8f5435e0681119b4eb@manjaro.org>
In-Reply-To: <a76f315f023a3f8f5435e0681119b4eb@manjaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 24 Jan 2025 14:25:27 +0400
X-Gm-Features: AWEUYZkJo1DrsP2L7lNkxItCPiQqRHHFgNLzNRHQsNokpADbfabjg0z5a8nFqdE
Message-ID: <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix broken tsadc pinctrl binding
 for rk3588
To: Dragan Simic <dsimic@manjaro.org>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_022538_832535_9A5C8E46 
X-CRM114-Status: GOOD (  32.58  )
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

On Fri, Jan 24, 2025 at 2:06=E2=80=AFPM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Alexey,
>
> On 2025-01-24 09:33, Alexey Charkov wrote:
> > On Fri, Jan 24, 2025 at 9:26=E2=80=AFAM Alexander Shiyan
> > <eagle.alexander923@gmail.com> wrote:
> >>
> >> There is no pinctrl "gpio" and "otpout" (probably designed as
> >> "output")
> >> handling in the tsadc driver.
> >> Let's use proper binding "default" and "sleep".
> >
> > This looks reasonable, however I've tried it on my Radxa Rock 5C and
> > the driver still doesn't claim GPIO0 RK_PA1 even with this change. As
> > a result, a simulated thermal runaway condition (I've changed the
> > tshut temperature to 65000 and tshut mode to 1) doesn't trigger a PMIC
> > reset, even though a direct `gpioset 0 1=3D0` does.
> >
> > Are any additional changes needed to the driver itself?
>
> I've been digging through this patch the whole TSADC/OTP thing in the
> last couple of hours, and AFAIK some parts of the upstream driver are
> still missing, in comparison with the downstream driver.
>
> I've got some small suggestions for the patch itself, but the issue
> you observed is obviously of higher priority, and I've singled it out
> as well while digging through the code.
>
> Could you, please, try the patch below quickly, to see is it going to
> fix the issue you observed?  I've got some "IRL stuff" to take care of
> today, so I can't test it myself, and it would be great to know is it
> the right path to the proper fix.
>
> diff --git i/drivers/thermal/rockchip_thermal.c
> w/drivers/thermal/rockchip_thermal.c
> index f551df48eef9..62f0e14a8d98 100644
> --- i/drivers/thermal/rockchip_thermal.c
> +++ w/drivers/thermal/rockchip_thermal.c
> @@ -1568,6 +1568,11 @@ static int rockchip_thermal_probe(struct
> platform_device *pdev)
>          thermal->chip->initialize(thermal->grf, thermal->regs,
>                                    thermal->tshut_polarity);
>
> +       if (thermal->tshut_mode =3D=3D TSHUT_MODE_GPIO)
> +               pinctrl_select_default_state(dev);
> +       else
> +               pinctrl_select_sleep_state(dev);

I believe no 'else' block is needed here, because if tshut_mode is not
TSHUT_MODE_GPIO then the TSADC doesn't use this pin at all, so there's
no reason for the driver to mess with its pinctrl state. I'd rather
put a mirroring block to put the pin back to its 'sleep' state in the
removal function for the TSHUT_MODE_GPIO case.

Will try and revert.

P.S. Just looked at the downstream driver, and it actually calls
TSHUT_MODE_GPIO TSHUT_MODE_OTP instead, so it seems that "otpout" was
not a typo in the first place. So maybe the right approach here is not
to change the device tree but rather fix the "gpio" / "otpout" pinctrl
state handling in the driver.

Best,
Alexey

