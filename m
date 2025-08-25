Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC1DCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJ6AWb1IvRBO6bay4aNSpk7sMubJEIQ+ss4WOdc9//U=; b=swIz9A9Pz92f8QD/M/5gaaR8bM
	PncPDLI/05ER9/d+h5mdyol6NrVe3B8dXJfEQ+VUyp7fcbLrT/r0T5FL9OSP6MT6joFzda9uJwUiM
	VmDysyEMHSWOMFFHdyrlQbUiIZ2odZlDgwAexsZNsGyOBMne2dW46ghTzeEGWmOpuPlboXggKKePo
	UW31qnw0Kia/9B7JHbPcPbTWBeDCaf3SavcDiBshHJuaDs68LZMevWIUa0QVjLorCeuJEaqGgpn+D
	2W2NLrH0s6rW68rCF7UjU19aEO0HbqmRUj+nkp3IQleQnIB9tkhyzEqUdqE3dPm2h8gLkqAlBdfKY
	akz7qynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWgU-00000007yHC-0WOK;
	Mon, 25 Aug 2025 12:52:26 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTzy-00000007aBE-42Vd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 10:00:24 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55ce521f77bso4667678e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756116021; x=1756720821; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ6AWb1IvRBO6bay4aNSpk7sMubJEIQ+ss4WOdc9//U=;
        b=dekoDHOnO3uJTKn/bY+Jg4Yn4btK5YSt5PYonCkAouaB4hHIbAaRD95sbOLsXdk56O
         ygPFy+iBz/F/LNaKi884GEWMH5hRbbKn1xznt05bJxCcXp1KkCIlffhMS/XPYvkye7fZ
         4EbMHgyo3MlpnbMWjvOtxjyorZrs4P5SgH6XGLDosF5OCwaMbtXgkf28D5THFfUKpQrk
         uzO588ApkQZLCkEFTSqkf5qz+Xso07BuOgpWKdZq8g3AkOJ/2EBI4NZ2BCfl7R1tZzdi
         TvCqIMwBOgZ/P2NN9LWNw6E8VKytfgRIaDpo1OqrxIGzT3veAXfah6Kb1u5ojHfW0fCK
         oGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116021; x=1756720821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJ6AWb1IvRBO6bay4aNSpk7sMubJEIQ+ss4WOdc9//U=;
        b=CgNvgQqF0k1AzILFGQQI3tI6Lk+3Tjsoy8qPlUSF56iwBh2Hn6Nw4xJmRk3nuYiDyP
         7MNc46kdbNXIJL1BJXsN5/MzTLzRZRlvtgzaO8igbcwI3ZXAJYpwzRUlp0Vc8FSSvVUt
         d3XB3FYOpuvXk5tT2l+M8J7vqsUQIijngMVu/pUvMDQT4wsDYEDuf94KkbHlJwUIIJsp
         72HWqq0DX2Glz+FjeNUHem6y11H+cJqDFe07qaAqwKfl/qExlFVIMVZRJg7mLnGO/yoZ
         CbkIvSzBegyS7OjG+wqD/zQpRiu9ZKrcEQUaWpAfMFLeI528avOKGOpgrXwECTMKoUKf
         UA/w==
X-Forwarded-Encrypted: i=1; AJvYcCWmpe+FuWhswzTeIadOsJctXjKiBEJWv7wGi4TyHqlIIszTEsUQXA6kiSgIWEeJYifqSn0ytmb+D3Mw/qzn+XvZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxlbQS7Odl98DVexav1sObhUz2z91aZ9YFZQcRR/DLO6qsWggiM
	2p78VcYdjgw6eFvdYd+4UVSr5zoQXRAaEjCHFMpugbf3CRCBV/T+IQJrmXMGZAVBhvajHDP6OaN
	S+tuipEsWKrOWnAUc9ToeiCrdZ7LWq5DKcOcL7MhtYw==
X-Gm-Gg: ASbGncsb73d7A1ctA3kWU+33U5HqDcTt8nxpFxq9n5fM8n+gJEdywXv050Z0hACkLiF
	4t7R/ms80CcfKIVzBMCvN1ss1ywZZ43mCyPssSOUKfwJzWKP/rKcm9rVBGWP1WiVtN2qXQ+pWps
	urPdxBvbqkeSR6KMe/XhhQv8HxobNZ3fJ+Hz724rxX6jiqLdN7tvkhDtNY6bBiCddT8AIc+46XF
	Ap/oaLi0rPcMKNjgHyNM3fbOACXycKuylisb9ek23zybH81Cw==
X-Google-Smtp-Source: AGHT+IEm/27Fjesp8I1iWaRVfRS4o6ubuyYXLf3VGmJD68g+F+2NqcP7oTbMplKzgA4i6aEsqRoV/RmDLiZU7vv5W1M=
X-Received: by 2002:a05:6512:260a:b0:55c:c9d5:d341 with SMTP id
 2adb3069b0e04-55f0c6f6e83mr2791627e87.4.1756116020888; Mon, 25 Aug 2025
 03:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 12:00:09 +0200
X-Gm-Features: Ac12FXzlFRD8xnoHzxDbgloRnldi4vgsYITe61pwJ6-xPGt6zuFYA_t_OLE3l4w
Message-ID: <CAMRc=MeUuHMjvKtsK+oC2L0VPRBY=dbiJetzX8D+pBrxFNZ3=Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250825_030023_001248_091A8906 
X-CRM114-Status: GOOD (  17.17  )
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

On Mon, Aug 25, 2025 at 11:48=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> Resending due to some patches missing in lore.
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

