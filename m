Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A1BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npDsCsbC8yB4lDdI+t7kw9s48Aia79Vp0ui0m6EisQ0=; b=bfZM6u4twxmli21am8LbDVQyZD
	VX/PfzNdffjjouWHWD2OELJvUjeWi3sDSYbADXROaDq01MaT8KKCyRMyuXl0YPAvsae40rZ8e4sx/
	xfsSOPROLFX4SsPzXC7YfMfy3bLKgrPow/vMvpa9WX/LGpNA4OFMfB8b7h9qk5IQA9+YaPcnfi/qV
	AGswjgw/sihU8lUdcDlBO5yv9fBGBHMqQL+UpkcZCjfRPMzV3SrZz2qXGsHSgOHkbsHvN8wxwnMMV
	9zpQ08u8usHrjlvswu9y7ZbZamK2s8KZZepTktQM+c9diJ5PirFSAVOcbsg8Tk/cV3HEJpbKJzZ90
	n/jzVVjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIfI-0000000Dfm7-2GuO;
	Thu, 19 Jun 2025 17:03:04 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGLa-0000000DI6G-49sC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 14:34:36 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5532a30ac45so712594e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 07:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750343671; x=1750948471; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npDsCsbC8yB4lDdI+t7kw9s48Aia79Vp0ui0m6EisQ0=;
        b=vzWmuBhYKACmRuCRNM97Na0A9jWfGpATeSdWR9LH+haZNkUWK2cvQQ6A+u2fVqil1F
         ao5CG8dVltf1CGdEvPIaEsuPNpJD20LNslqfp8Lh9LMkzAHDTdPMTm9BDHDjWnlBEFEm
         Z5+xhqWbO72/1j6u7eBGBKKxN4HBj4c3zxaj/NwI6NuObs/K+aTa8gRWYG34sU85Kxw1
         lhGgkiZt1a4A5rYbuuwx3MmmNKwjOuYs4YHnkIX7sFSDpihX+WE4HJdf/RER/0NwLcR5
         NUStiBP6Wm2iTdewvitxQeB2QJ8zQER4zkrS6tC8CWdIxlwrITfBwA8xUuYCCcQPht1q
         Exsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343671; x=1750948471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npDsCsbC8yB4lDdI+t7kw9s48Aia79Vp0ui0m6EisQ0=;
        b=RfM/0H2R3j/OyCaHXlpzaohlGa1rw1am3Wu07hRePGugOPiHlWPIE8anUo0vS2/QH9
         oh1IulES53Y6uPAT1iEdrUwIK6UXHBwlDgUiWAQ5NIgJgZq++uyF9vmHJFfEJJxMHm0I
         sen+2tCrXxzL3+7ixXWkmSN/Zgou8SwdT1gJzATkmB5tCCBRa7UtRsj+116Y+G100wab
         iwp4ijDDTrOjBmS6WUFeXl40Vl6jc+kVfNWzahdAjY8Vh6bH0QHak20TDKGncCJ9nzdL
         zZgu8cTUWeQ0dxTcipAKImDLJePbRopgi8zHkYHgHm6uugjwFEvNQGJiAOqSdMGC2Ko1
         8gig==
X-Forwarded-Encrypted: i=1; AJvYcCXfMIS2s4yXzNRUMBjgWY5jBXbeRcDPqEuu50PyQRzeIKDow1FDfGdvUhhMpVNomXz2Ac0B/77Kub2eTGEzIs7t@lists.infradead.org
X-Gm-Message-State: AOJu0Yxumsg28mwUaPQcTN5BPg3rlbnkHRwhMz2uRNEfxPmNNjF1l/xF
	j37otBs4TayQMBg5BsgL9/yfz+0Vi+TBOFXZZye4l9DrmxA0EuhIwHI5GD9M73q6nPtLcyoOMf8
	FU3YvtdFsSTiPAPAu46WnNoQVkf5ZMcrbj9dyG1jnfw==
X-Gm-Gg: ASbGncsTg9agXnQGHehV75OauSYlmVycb+YghBECbU6JbnR2lTs+uDTrUJVxSAPIykj
	tMObm+I2DgVkgCUQnpgRZTmf4yjMFcGMdxck4+lzzi5WVbqjNYoTr3dqMlW+xoQC4XmM6g1b+jx
	ADBvPgcbAFYCnfj6CjL8vHknWj+E1nX3WOvk/YhUNKfCby441YHhVcmWwHJGCcDFW0hkiYKXu4E
	SQ=
X-Google-Smtp-Source: AGHT+IGTg4fC3jUJFCbywRZz/VrLdnK1jrWH+Rcuacnc6SmvAw8kjD4XHlxnLFwvrsW49l4uIWj+tyHjhyD2bODyADw=
X-Received: by 2002:a05:6512:3090:b0:553:cc61:170d with SMTP id
 2adb3069b0e04-553d97f06f4mr1085732e87.21.1750343670809; Thu, 19 Jun 2025
 07:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-9-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-9-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 16:34:19 +0200
X-Gm-Features: AX0GCFubK_DwyskV-8MDyKBHZbV9NQDViI1V1zsdGePHy5OXUt193JhwAEyCNeE
Message-ID: <CAMRc=MembHffEuLYhg6-GN9fRA2Sk5WUCsZdLOTKNtdJYqPkRw@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] gpio: reg: use new GPIO line value setter callbacks
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_073435_261778_D1846855 
X-CRM114-Status: GOOD (  10.85  )
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

On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Ah dang it, this is still not enough as there are users under
arch/arm/ that scoop out the gpio_chip and call its set_multiple()
callback directly. Next week, I'll just apply other patches from that
series and resend this one corrected separately.

Bartosz

