Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F02CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09DtYv4WNzf78Fw81VXM88NLotx0thkz5LaiABUFgy0=; b=uAj94jr+mK2MXss0wrG2sK2yUy
	0PW/GV7WXizHCieOyW52rJ+0tc0JqqKVIgMVqjpyV6ht/H13yQh7HGPa9QiOtjwG49iQkyQ7tTeyV
	rI1gciBrhnMLr2PrAWNhifq9JnknrLq4vRVFczROhFqJbj2sCAlvu4gfvlKH2WeM9OzhSVcWm6+K8
	UmYt03lNsmg9ATri3wfwEBHQ4LNfxT78f5GuerqBZXalGxky60aYN1ejEV4xalT8LB4Rb1TM9DEOX
	FlkLlnZo68zX2rbPPpx6UVzyv4Y39vvbtN4puyJiqhURCJ7Mip5zj3266cpL5em9amfpYK2sU7SSw
	ajxClbHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWgU-00000007yHM-2pH3;
	Mon, 25 Aug 2025 12:52:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqU5R-00000007acH-1aag
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 10:06:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45a1b004954so32740385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 03:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756116360; x=1756721160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09DtYv4WNzf78Fw81VXM88NLotx0thkz5LaiABUFgy0=;
        b=jXympdlrl65Hw9zG270q6J7qmJJ17kqd2vrH3MIdmK3e/U8V8Hx1ANM3WnVkyLCBCq
         z1I9F0qUavXHAiipbtfCiuEQlSLPomwvNGOhXLahR3O0Vmb5CM7Om39EZKteltL14hSj
         s2kvTyji5ah44ER9mbnnJLWDUXZfcM6uEl9qz9K7u4wxKZNl4Fur6zGa5jAHdGz3q8a4
         0op7wfUp6HcqFesKkPMAomt/E0iX4qM2Sug1Esan6gIwRJv/MzdovouQq01YKFknzjDd
         f7kUbbBp1Yq4cNOCBrUn0zmy1bFuQ+ufcZfpn5E1XtwLxb0IS6BmA0tYgrYIM/84kcdN
         Ps/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116360; x=1756721160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09DtYv4WNzf78Fw81VXM88NLotx0thkz5LaiABUFgy0=;
        b=X5bN6pMnhIe3RpYjZFr56XoLLbSg/i6wLfnNwnzyvPy9Fu3DMyk+NW78LkYvf2FToJ
         KMHjqqVh0C/jNkiy2VyO7x/kGk/ycXxUi4xKLNPg3XD94/+OBuWAsctHXjCZRHkRCQQz
         xqqSGKjBcF3A+XQhVAh4BbapUwy2JnHjuNW7AZ3I6L8WbqOSkupAIJobwGFXn5mv/uEy
         AtM/inJ7I904EqpUYfbX9slmIkeTM56zpVMaJOaIjv1yaUxrXKF+NCxM4tSP/DjvGRWT
         QjseqKqoopUAQM1yC+gZAjoQl9932L9nPP6lPie4t/bDLRoasyOC4kiXRkDB74JSOQVV
         /l7g==
X-Forwarded-Encrypted: i=1; AJvYcCWjLdTQP0ClhE4Ne3cZnnHmlAl+zQzCebfH4aaHTmTRRdFiO39TWLVwvAM0Kix2KpwkJXPEKvrvLHAIYKWilBgy@lists.infradead.org
X-Gm-Message-State: AOJu0YygdvMC4RibEX24TG3y6uJ/Yi/1enSQ0h6oxsBhzP33bAh9+rXS
	+LUeLKn4LYLbLZTS/0xfWdvdiJbM+m5Eyy/sGYlr19VeSwu+LvHNjpYAr1TZ590f3k0=
X-Gm-Gg: ASbGncu6K9/85jo6GjgpyC0HB2DZ8Wt0ctVkf4Hh1OV9x3AXCZ2ncdi/TH81XXvor96
	MN85kknqjjsrU2Y4tbnmOA+f97yU4RiRJGeXJ8kv+WASmi9jtjRb3rKdPpQOA4rF4wihJx9v4xL
	9ZQ6YGrXu6T63ZP0tHQ5jfkLCgvmLZtomHN1XzDAA1bD5QLoFjqCutfGJIGxT0s8uV7TofUvZIr
	bQ5yswiBHTyqmdYpQ23u+X617xntAVcbOtx+KH+dJe0Oig7ReakgCYseRhRGuUFz2w+8Il0XV4X
	xoRNPyi5LSLHmv4+lkbRmwa9GfoMqS5afu3XUuliZR3T0GvUTuHCSlip4NLIXqU3R70f1bQYhlx
	NWbKLSsu8TrRyjb3nkLTAQQYr5NJFu8sF560=
X-Google-Smtp-Source: AGHT+IHtwUobtrBAAUNAESRarPU1shgTUZThuJWfmTXbgJ1FgKhgwZ2puOsxCchkyUiwhnhMSjawnA==
X-Received: by 2002:a05:600c:19cb:b0:458:6733:fb5c with SMTP id 5b1f17b1804b1-45b517d2751mr91939255e9.28.1756116359732;
        Mon, 25 Aug 2025 03:05:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5753ae41sm102900375e9.9.2025.08.25.03.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:05:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Yang Shen <shenyang39@huawei.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org
Subject: Re: [PATCH RESEND 00/14] gpio: replace legacy bgpio_init() with its modernized alternative
Date: Mon, 25 Aug 2025 12:05:58 +0200
Message-ID: <175611634833.31529.17151272315395600143.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_030601_428070_842BCEFB 
X-CRM114-Status: GOOD (  11.58  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 25 Aug 2025 11:48:41 +0200, Bartosz Golaszewski wrote:
> Resending due to some patches missing in lore.
> 
> This is the first round of GPIO driver conversions to using the
> modernized variant of the gpio-mmio API.
> 
> While at it: sprinkle in some additional tweaks and refactoring.
> 
> [...]

Applied, thanks!

[01/14] gpio: generic: provide to_gpio_generic_chip()
        https://git.kernel.org/brgl/linux/c/6e376f245f19feeadddafb2c3fa5fbd6469ecdfe
[02/14] gpio: generic: provide helpers for reading and writing registers
        https://git.kernel.org/brgl/linux/c/16397871b6e35fa46a2bec27b3558f93b050c6fc
[03/14] gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR flag
        https://git.kernel.org/brgl/linux/c/13ba232ed8455a5decb187d509a0d326fd326b19
[04/14] gpio: ts4800: remove the unnecessary call to platform_set_drvdata()
        https://git.kernel.org/brgl/linux/c/d6307707d50b468d614a80daf60ead8b7036f156
[05/14] gpio: ts4800: use generic device properties
        https://git.kernel.org/brgl/linux/c/8a8e9a1a9272f262699960ca2782de87ea69dd32
[06/14] gpio: ts4800: use dev_err_probe()
        https://git.kernel.org/brgl/linux/c/ac1eca3ab9fc4d17b59da12597c671df7739f934
[07/14] gpio: ts4800: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/9215a4fb59425588233d3362e886dc156c1739af
[08/14] gpio: loongson-64bit: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/4ba2193ce0b94c28ec2095a1bb79353c82214d35
[09/14] gpio: dwapb: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/84bebb7e7ed000a2c4786094698536a3a3f67083
[10/14] gpio: amdpt: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/728e0ca4e196d65e00775ea3f7a49ce008fbd3a7
[11/14] gpio: rda: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/ebd63ab0f20f4e1960191da6989797ac78fedc4c
[12/14] gpio: grgpio: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/67e4be48f409ba70738eef3c195a81455f526f83
[13/14] gpio: mpc8xxx: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/90ab7050358ffd3311c23b1697df2ba3c8f840c6
[14/14] gpio: ge: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/56f548840ed90c30269f29c3bdf6037a8a9414a6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

