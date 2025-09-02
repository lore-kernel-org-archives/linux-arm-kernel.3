Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAFBCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sgn/vJYsBdxnr7Nj+togafj+OMxwmvaU1XUkgIJUYhQ=; b=yDE26VXu6xK813u5usbpV5RSqa
	4C81jpK4oP3R3c0UGODVpd0qthRPjeKtWPaQTqhCbWNpJAIg+FV7bYXuNPwtvlZ0swOjykSpb2b6K
	OtvQ9uAftlTH7Vza+MYvg2eQclyvMjcGOUxPIdV2ZaN1TaGxf7goIb5tnNOS/4aMGMFahGuFKA99s
	oBtrZnrmIDx4qv/PtBsuEZXz+y1RzeO5HlBuyOTX2IiWzTc8nbom+ge1y8C9/B/bJlLbYkrMgtjoq
	vdQMqwOI+6QuQDlso0QXFUhai5+z8v3qwsURfF5g687vtrl6wN8LnXGggH9Q6PhAnt417trNllICY
	aesEf01Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ8X-0000000HGLf-2KFK;
	Tue, 02 Sep 2025 12:29:21 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNK2-0000000GNXM-327S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:29:04 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5607c2f1598so1395345e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756805341; x=1757410141; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sgn/vJYsBdxnr7Nj+togafj+OMxwmvaU1XUkgIJUYhQ=;
        b=Uqht7nPpK2Swp2lGcvjGjYFLlioE/BMlWK87+zsWXKRV8ryH60Qt/kJAqoEQ8dtI/D
         6BuNwsKMOmuDgINpIVmCWt1WaQEUa8BdB7p1rYjzbAh0n5hXBm1vKs5qlvblr0lIRDrF
         g54skrRuIxpEJycvtj9rbLpeld1fIHmJRt+s0Ur9EzB9BuabT1fDYJcLdELPPqhcz60k
         Va1rSJTCm5T6jXCPWzGctsBHOSgbHLiPxOnZhOncSCmMaFh96C0drxBe1JmuIU0ux1UR
         F1vFhnqF2arorYLY1Yag7kgCC4WYldJ4QXVIzZItVN7kotUURbe6Zpa+6a2Jrg1lIQjk
         L75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805341; x=1757410141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sgn/vJYsBdxnr7Nj+togafj+OMxwmvaU1XUkgIJUYhQ=;
        b=cTw42f8TIXtLXXDfEobRTEpCsPFOb4O1J0DNHFwxQdAf4lOOG46yDL49Ry0JU9kCQ6
         8uZd4SbIN+KKRLrTAxf7vwQfgSdQyddFEMMqTAFVrR7nf+1g8001snlEC81SopYM1Xr4
         tAc4s1XI46qd7ZBDE/KxRFHZkuyrxhrOHoqEWa9vAuNou1urjfQJlRZcv2gPqWMylndA
         DA2nSGhZkJNgyo4chh6JSgJBX0RlKwMBmZ6DzHYGX6daql9za3h7NzAeeOAq0LjEJ+P6
         ToSGe71anz+LUecGwfPm1iNI3GqV+wNIsEd9JVvlK91N2GzCwd1rDND8lXqKTbOS/J4Y
         6T+g==
X-Gm-Message-State: AOJu0YxIVHkMa5TduXByDBRl9v+6UsbydPv4QJ6zftzArk5GGHWsKrIc
	ZUDauy+7Kr92Fj3oUgDj9+kgZJto6qaUlz1fJXjgmHHzOoTopuKX0f5It04syc6TYACjuSjtOJO
	kFAo6+KlnY+C70rame3yzJn5VoUI7txcXLgix/jXZcw==
X-Gm-Gg: ASbGncsIksOz/psDXKjJ3Q0UAeRQyigO6ie77jq7eJiTw/Inw4fa7Z+L5emjRTNqPY9
	9t3SvWQSEyviElyYBTXE3aeCneH8xir1laOO7EywkBEN8SfN6tjcSghnk7OXiWf/Jzc9jgGAviM
	0RL8uKf2GV4zzIs8aOt1Nvn99B4YDqtmbvwGhT9Kfsu9y71/0KGJECW33orpyU7hCT0oXpDQ3b/
	QJJJUPgmdTmZAwyx/PshxI8IfvTGx+ZqtZftvH5eyZxUurMYw==
X-Google-Smtp-Source: AGHT+IEbZleDaAu1wkbBHOjnlGL8C0lL2XvTBcBG1o0Yu7ShYVTEpic0xTaWFK07gn8fwR7JGIFClShl9m8jNgG1o5M=
X-Received: by 2002:a05:6512:680b:b0:55f:4e62:f0ca with SMTP id
 2adb3069b0e04-55f708db56bmr2636846e87.29.1756805340472; Tue, 02 Sep 2025
 02:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org>
In-Reply-To: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 11:28:49 +0200
X-Gm-Features: Ac12FXwyTg5R9QK3KWUxLTr3m9eLRisbXrlkPr4WlpAVjY7_RF2FsWzkYU59lb4
Message-ID: <CAMRc=Md+2_3w5kdaUF9-nGdHv9C+tGRfN9TTu6E4+hSdFbwGBQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] mfd: vexpress: convert the driver to using the new
 generic GPIO chip API
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Pawel Moll <pawel.moll@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_022902_999899_2BD316B7 
X-CRM114-Status: GOOD (  18.67  )
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

On Mon, Aug 11, 2025 at 3:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> This converts the vexpress-sysreg MFD driver to using the new generic
> GPIO interface but first fixes an issue with an unchecked return value
> of devm_gpiochio_add_data().
>
> Lee: Please, create an immutable branch containing these commits after
> you pick them up, as I'd like to merge it into the GPIO tree and remove
> the legacy interface in this cycle.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (2):
>       mfd: vexpress-sysreg: check the return value of devm_gpiochip_add_d=
ata()
>       mfd: vexpress-sysreg: use new generic GPIO chip API
>
>  drivers/mfd/vexpress-sysreg.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250728-gpio-mmio-mfd-conv-d27c2cfbccfe
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

It's been almost a month, so gentle ping.

Bart

