Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FD9C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwmcdLotwKHbSyuTnYS6H751riUvBNfPKy6nA7rv0do=; b=Xq6pejk0ei1B8Ws9Vzss5XNGci
	iesEnMWoLL3unzuDBgXGK+DsbFIZyknp8zydUWfpE8OqIJ0vYkooIO3JLHNyEiBt83fxidgOvPckb
	UO83sYnKFqTBUhjsxSQzSnm1ACZwbYTsGrRIiMJdGylJHMEWQPPNSkoD3XCuFopXMYPmmYYUjAoRh
	WLZlu0vrdJFaAOTGDWNO7At3887NssJySTWrR15FHuaMcPBC0LSxOFoxx4fQ8o3mxcEzMGtxZahEw
	7yxJBem6JSZqFy8PnXrCkz7xS/ytlWD3K35UaT9KRae/2NMqJN0JtX+h41oZr2+/+6JjEA+5U63H4
	OPvvrJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ykh-0000000APZc-3mwH;
	Wed, 23 Apr 2025 11:58:55 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XoE-0000000AFHa-3R4V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 10:58:31 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54b166fa41bso6861819e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 03:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745405909; x=1746010709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwmcdLotwKHbSyuTnYS6H751riUvBNfPKy6nA7rv0do=;
        b=r6RCaTFuogyuJQYZCEZP+VNZGoqFtCalPxgoT2goBPhKU5h8VoGy2zC9A01pukl0Ji
         bvY7KLGkwLUdvWBmG1bcpjEea48Mr9oGE3c1ePgX9kwDOorLonujCgkiBb6FVPkVywY6
         5GzownfW1my83arCL1B/X0w+2ZS8IumSiy0DS8lUFZSNwYzA0VPw1vFaAXAxq97LVRxb
         Rgm19lckbv2cBXFwoSKg37Npt6IUy/Z9HnYTWIiwpAiScw1l0DO8ibpgGVddmVXTXEcX
         sx7sYiB41FZZWVQ17dzOOWA56j006bdOlN7juFlugE0wZphfgH+aFcDcmo5NCYo1oO8C
         maTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405909; x=1746010709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwmcdLotwKHbSyuTnYS6H751riUvBNfPKy6nA7rv0do=;
        b=UzJbuGOVn8shNqUPSSKQE9rQG9d7Zt+Fh1l9GOGk/JO3iS0n7dqni2zvVSrRckDxOr
         QucYkSWwzJaqWv3Mh1RLhP/KDr7rKBdnxmU5WsCLJNdgp8ZoUdIOkreIM2UqPv8NYXXM
         DRvfEodmw7zIWcqQ/1FO6ZzTSbX0fJe5vwTDjHhvl2yaxrANsduNv3OQx1YjH21VBoIy
         CPG2JJLUmnyDxdtV94gS0vWLTSHlEN9GRr23u9GYiDN/B24w4pRg5R4WFg5TfOVvdxva
         jxLgLElWoiRzhlId+yBs3SWCGZ+loFgfe64rCv5ZxtQJYSnUFb+reRNRXABl2ltFhcxu
         jooQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJq8BPsqf898mgCUK2qhYrmKFLU56Jx8ZA4gUYGhw1FQ2iJJFWlAgAxBMhu2z9vCaWOHdQW0Aotm1y8J4jWagY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw08xQVqc4LYWq9BBicXNMY7F6St1/HK/0Y+0S9vqBpxyhWuBZD
	Mn4cF7DlKUexAPKqmN+cMN7wA2lpotnwstTbnPghW6njlpDNB7BtuRC5sFqyZdKV/AbcXNgVO9y
	dSpD1DB+/jJnKkNpnbFB55AnLshePsMLimHNutA==
X-Gm-Gg: ASbGncscVe0YtGaKnFd9MEM00W7dFQT9TNoKbBtEhGAVknSkT21p9Ags3oHJ3QK0gvj
	4k/yVb5qjF3HTZ6Cm8NRnUfywHwnULflc1LiR37PCMNiTFxw6lxUQ3Xk4Fmeb36S9vS2fQM4N6c
	m2cxOm8R1AClcy4TctX4267G7LQ5PNNZGr
X-Google-Smtp-Source: AGHT+IEjS24jEIugO55xavRjGHILXYER6m4q0amlIjqOd7Xvxl7wCjNSGFGR0t0e9qberyDj3AV0pmDzW61zJwcHqaE=
X-Received: by 2002:a05:6512:ba8:b0:549:6cac:6717 with SMTP id
 2adb3069b0e04-54d6e6629b6mr4831840e87.53.1745405909021; Wed, 23 Apr 2025
 03:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 12:58:18 +0200
X-Gm-Features: ATxdqUGeqKFeiJHfrdFM-E1Ot1VyXqrfMLSq32rxhf_gi-bzXxhhSJyFayC6FXQ
Message-ID: <CACRpkdYVf9C+QZjFZZ9J96FRtoS8mowzyrmCcYmvV2uGTgcmzw@mail.gmail.com>
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters - part 2 for v6.16
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_035830_868271_4700EA78 
X-CRM114-Status: GOOD (  10.06  )
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

On Wed, Apr 23, 2025 at 9:15=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> another round of GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for your persistant effort in fixing this!!

Yours,
Linus Walleij

