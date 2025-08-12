Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F351C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1mDrWuohEgopTPInI6sA+uoNinbrVfmWIHEgismuPk=; b=o5OSSuums12mRLtscFEQ+J1O6X
	ef4Ghl1rAy+tikiNSIYmb9xoyvvInOmObomz+HdP6MiCyXKymc8MbjREmGpk1FiR3jNLtggHH/rIG
	sZENESjpkAP3dxgAHZXB4gwVDaViTcLweRE8oTNM/6q2SXnHLWwlcpuxpXbGyXMEUCaVKF5L1jJXd
	ItbgNzgFiMskYiqDdhpfGYwaU+4S0/huOqQ46uvYm2PfmwWEaAss/cJV5++TgEpC4T8jtAf1n++NT
	kCxQY0hMGHlVQOdBiiqjKIkpHQhlTIgZOVKsbydTVGA0zLpmq1VgMcs8Nq6z14p+9Renrf4Ypcz6l
	WQPTvvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhs-0000000BHPY-3M70;
	Tue, 12 Aug 2025 16:18:36 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulln3-0000000ASAn-2KdB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:59:34 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-55b8a0f36fcso5628672e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992772; x=1755597572; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1mDrWuohEgopTPInI6sA+uoNinbrVfmWIHEgismuPk=;
        b=O/X6OW4YDdy2bS/kTf5agFiiLySEzSd6ERQ1nL29dPFM2rZeJ8O2vDWrDUzP+vbUOM
         t04RNOfdM2Auc+izotM1oiNCXRqK7Ttlcs+s0KXF8nomQkAHsk7N/fkG1WaruYVfxo/j
         KDMvDP6DfJdDljTD9YKPxGBk4xjmTvI2ZGZcCPALNMMtAmfY4LUlDhsbf75UU08AXe49
         q30MWy6fRC5VtJNLof23Fgq959A5RIyGPaAFtSWq+NGqTInffOPLhW2NSx5xoG0/yTga
         sj1gnjEwnXOueJ4viy8LFBDlG9mtDHY7xjGsohdPTNzFyeVrtWpIgaD4CSYtt5G7pvoN
         yAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992772; x=1755597572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1mDrWuohEgopTPInI6sA+uoNinbrVfmWIHEgismuPk=;
        b=hmTaKKcLNgORroHPX/vAv7FwXp66nrDh5wXcoeYMsx7+yJSZOpB8lZEwe/675D1HVa
         r0HXhFrdIE8OH5i9rfJiYEYceTFnFCtdTQljv1mkaZf4HT7iDTjWLcXjiQu64lINJP3T
         u4tlWv/Ku7ahX7bAhlWovyerd07eZWQ2sURnAU2w1HQVkPOID1QcQDZLj/EHcW4qZHa6
         6EOtWIRjd7nfT+1fIkU7sfVJFIIokGtcsbL/6sk9QrvYQsHxSPbQXUYU5q5rFi1dPIMf
         sDSL4mAVh+CvjNeUiYNOsNOxmQLxrb5Wqu7Qz9zKYz/t/g+kLwIDM9Cz5rU0EAPF44zB
         qtRw==
X-Forwarded-Encrypted: i=1; AJvYcCWI+0IYgtH7qTgBUknGG+8kMFfAwehyFxahmsTgMb3KW2XQYQnnAm+khji27cOeCy5CPLj7y0xsLe9RmyR1jqpg@lists.infradead.org
X-Gm-Message-State: AOJu0YwcH/9G37oLbhLyBkPEoliEqbLPi8KpT2VzeDs37ncVqw04rZcM
	o40PoqACyuFnhZbjKfgNMGoZdtnieKw1hsD2dLPX2sdBr6zeligRkdAyQktulVbCJPnh1iJ8D+U
	Pe910jkKxS08R2vBJ4pc8REp5PLloznVbPHx+Ms1ZbDa3Fek1sAFb
X-Gm-Gg: ASbGncseUMBANHzjw1RafPvCtEY5AfbD89UybM5yNWB/f1DQ/WpBN1ccYJCGkxWs85q
	SmJuKmnLLEz5d+n+c7K/CryafPM8zWbQC79bc8bZD5mA7U4enRQMY85RY2t7AWP7VRqT8bdpNhQ
	Jk4s4O4kXx4/guyK2FrcWIZPRnKKq96cKfi28xY4+KnoWBlHMk8oDwzRZtLI8Run8NAfX15VKWY
	3SrizDSIPY6Ij1Ei5nfMdY2v9iJR6HV1nUi
X-Google-Smtp-Source: AGHT+IF3WgiehWnZQLfMQrcxniMNK/2fuKGhQA/XqVGq1OCbr4PDYFcEG0ahDGLz1N6K7QygM6mYjF0gHE1SQR7cH3A=
X-Received: by 2002:a05:6512:3b07:b0:553:cfa8:dd2d with SMTP id
 2adb3069b0e04-55cd766f8c4mr730147e87.55.1754992771830; Tue, 12 Aug 2025
 02:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:59:18 +0200
X-Gm-Features: Ac12FXytMUHnfMvorE7AaIZ4tQn_RJRgw5kgUrTE9wtdfJEknR5-9y8JUWSkapc
Message-ID: <CAMRc=MdTWpdQp22yf7w5zNhfKBdWKJAX=rvAG-bkYxtCfLSFAg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/14] gpio: replace legacy bgpio_init() with its
 modernized alternative
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025933_599063_EFFD6A23 
X-CRM114-Status: GOOD (  16.87  )
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

On Tue, Aug 12, 2025 at 11:58=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> I hit a network error when sending for the first one, retrying now.
>
> This is the first round of GPIO driver conversions to using the
> modernized variant of the gpio-mmio API.
>
> While at it: sprinkle in some additional tweaks and refactoring.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (14):
>       gpio: generic: provide to_gpio_generic_chip()
>       gpio: generic: provide helpers for reading and writing registers
>       gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR flag
>       gpio: ts4800: remove the unnecessary call to platform_set_drvdata()
>       gpio: ts4800: use generic device properties
>       gpio: ts4800: use dev_err_probe()
>       gpio: ts4800: use new generic GPIO chip API
>       gpio: loongson-64bit: use new generic GPIO chip API
>       gpio: dwapb: use new generic GPIO chip API
>       gpio: amdpt: use new generic GPIO chip API
>       gpio: rda: use new generic GPIO chip API
>       gpio: grgpio: use new generic GPIO chip API
>       gpio: mpc8xxx: use new generic GPIO chip API
>       gpio: ge: use new generic GPIO chip API
>
>  drivers/gpio/gpio-amdpt.c          |  44 +++++-----
>  drivers/gpio/gpio-dwapb.c          | 160 ++++++++++++++++++++-----------=
------
>  drivers/gpio/gpio-ge.c             |  25 ++++--
>  drivers/gpio/gpio-grgpio.c         |  87 ++++++++++----------
>  drivers/gpio/gpio-hisi.c           |   3 +-
>  drivers/gpio/gpio-loongson-64bit.c |  42 +++++-----
>  drivers/gpio/gpio-mpc8xxx.c        | 102 +++++++++++++----------
>  drivers/gpio/gpio-rda.c            |  35 ++++----
>  drivers/gpio/gpio-ts4800.c         |  39 ++++-----
>  include/linux/gpio/generic.h       |  37 +++++++++
>  10 files changed, 337 insertions(+), 237 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250728-gpio-mmio-gpio-conv-623517c3df74
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Sorry for the noise, I'm hitting some SMTP errors with gmail currently. :(

Bartosz

