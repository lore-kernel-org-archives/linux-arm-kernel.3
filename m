Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289CAC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUz46dv/HPNmmRvM6Il6GhBzQK5zF9Q9c+15wuOarxk=; b=BEdxIjANVoYCZYkFGFN8llXtwu
	KI/KOgM8FYdiV5VqVp91sC7r6rOaS3oGlmIOXkDoXalcbxs4rgGPNcARKfP6D7wTk9PzQLVznPTF2
	qB1t8eBk/QjZ1Fqn0r7E3UYP+8/mz8qCb+/WEW1JmobpCABsV+CZGpkRcaQY1sBm9xzk212kDsAic
	e+IrCckz81+Z0AXAecgqKlZBjNe0cWJIdMPBqedhiVw7F1ruCLOMKOKiwGtzckBGq1iNO8jmBdsuO
	pJgZ9s+iov47hnujKktDNHnr3MotZL4B87MK1uV+QU9wXnHhj+DNZ4q8+PTSovW3Q3mEtLyy40eHm
	j8UuIaTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBVl-0000000Cbnl-0Jbv;
	Thu, 19 Jun 2025 09:24:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAkT-0000000CRsL-3d53
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 08:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KUz46dv/HPNmmRvM6Il6GhBzQK5zF9Q9c+15wuOarxk=; b=Jyd100MnOh7ElioRegHXsqJfwG
	E/FQ5VfCiTXsnD6ys0QhTjF9c8qwrC7a2UGQyYHiqcLFcl17WcOOmfV0C6wX5sEIML1cb7CL2osal
	Zxk1S+jksrpSdXh+2usJ8R6U/fl6db6yn5LFC7XXCqGc7OCI/K9gliWuR+ksVXlqQ/JkCCfoODaMn
	7NoeEiAwqrCD2PU9L7GxBaqauwHGUKIYSMlUPw+5DU56DUPChvcQK/C7W8NkoNe16Ck9D+lP0axFG
	gm23rz3cXfcgB5C2ksjXRd0J+yIS1hxYUPRRFihUpdPiByT8Pt3NTUb9AIdkE1kgn/0EZNNcrFBJX
	Ln5XUisw==;
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAkR-00000004Nv2-26Zh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:35:53 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-553b6a349ccso497105e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322149; x=1750926949; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUz46dv/HPNmmRvM6Il6GhBzQK5zF9Q9c+15wuOarxk=;
        b=z1/nCRRUPNjCeodQi81zt50zoiN6k4ldjrdYaYh+MLRJI0xFSxPAkGKRnQvWedJIEH
         ggTgtItvheMWbNf4+E6lwrX257psbqzEIyyfgVbxl9xPo7ZajhYBbTWYFKhf3wizKEuj
         TRKpLqBp4pPkxLQXd6FrElsj1mUGnTAk3i7mRPuQmldxEbuXew8HovDzS4ppQcHnI5EM
         aCJa4JKHXAYusHB+xJ9NMzhf9QP/0sQbf6ffqEjkyeEq2UmzI/7jBr+m4oXfXROdF/S0
         XmFcgzWbNR18dvjn4aeko609C2d5Gb5VStK5TDKeWegd93kdZ1xsraLk3mOtoYzZ12uD
         YdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322149; x=1750926949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUz46dv/HPNmmRvM6Il6GhBzQK5zF9Q9c+15wuOarxk=;
        b=fQAg4NGlwResTN5fgeRCC/JiFJB1wov7NAY78MbOYK0GaNx3Jsxl/tqsUw1OAjIXJZ
         Yt6nNcGt40dPme/oeh0fG2tWn+0tJCjNXlQEForh/x4RqSOSQCsNGueehEVPwYr9n/xn
         uadnTPofY44FOnm3CPhTlIiH7MzXGHjaoQ8P1AfcD9bcojv3zdnpLasDo/OL2FfURK3N
         I7ezIKgeRIaDKENuwB6jWV71n9YRTbK1RTiUafbzVbR2vWhXmknyyI4jfFwKQGRFXert
         wMy3m64ZfWW7m/uoCQAg56H4cPvrV4rzpwaUzjgKFnuztEa4WQG3q2IFuPlcXNCAVApL
         04KQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9NySrOO1ltZxn81turce6XmDIrgbaIP6Oy+45jZk2Slra1QSIJEniJoCPsJ7Dpatgm0v9/rxblk3lUS5dlhMt@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg9EpYKIDMLekl9ADa8ClY3TavkYiiKZPH+/Aowpjgp/c8YUNB
	uH9tnVMaxnMavVfysGAN7XuNKs/3NwRqjY+H7/Sddhi/RRZLVU5/HjcoYZRHxoJ+hMBBFvdQOkS
	nHhpDiNCXA7rYN+JJF8jn53TSmTdBl+xaCWjwcctIMw==
X-Gm-Gg: ASbGncuJcNCgJzahtBOHpsxvU3I4z1pLz9c953tnAREir4cYq9A8DUafoH8x+fr1IhT
	1JcZPckIc9K8KCSKel/lh7d0QhFRzlXw/J40IBxvlQzEUj4uqdxS3kQQNjU3m16hMk91r7VDylt
	ZAIAuiIXZdGNhWzkhvFSmOd6hTG0zj07Y39MG+I7mJmvqoMeFhCgTNGjeY2mswnRXxJxT5QYZYH
	KQ=
X-Google-Smtp-Source: AGHT+IH8gdDhvgqHv68xYgng8lKIS2cL5/HDET6GaBoi/sUwyPhdyhtejDnh77c/sFHn8pTtyC9K0nsXpo0/Zf7DZT0=
X-Received: by 2002:a05:6512:3e24:b0:553:291f:92d with SMTP id
 2adb3069b0e04-553b6f74d65mr6198225e87.57.1750322148760; Thu, 19 Jun 2025
 01:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-4-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-4-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:35:37 +0200
X-Gm-Features: AX0GCFsIiQS81dI7axg97KmA9gzmGEG_3kUmqhJIMLm18HQZTbPd7_8gMWe8jkc
Message-ID: <CAMRc=MdhuQJvTwQRoXxCVa+AOt3ryYrXG1ECsqYwDKqFfAnWEw@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] gpio: pl061: use new GPIO line value setter callbacks
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
X-CRM114-CacheID: sfid-20250619_093551_721326_34276007 
X-CRM114-Status: GOOD (  10.11  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

