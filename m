Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B09DC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43dwDfmrGoNVQcXDC2wAL8Jp+SeF4PP+nL7X5CzoIgA=; b=syXRby2MEQ6d51zQMBWh0EBQOc
	jYDVZn+kWUTFtsRO62UYEdcTf7o1G/l0IEmZRINM4HuXWy0+XkCrruQQEwZxbqYxMVZF3CP4i5sQP
	YfDXEN5k2rVUpX1y6wP49/lF3jKEfHlPM7iTrJxT/vjX7K/V0z+sVwslXx+wrGIkl8YzArJIlaKlV
	dmwbsDKrDY0za8YWtGoY0LgQla2wkcMaMTOx+f01cWOcAdeNFbE7L9nMkWVUHZEEwHzFoN/bn9Vfv
	VLKknptmO+LIMUfCN9oP8DolCyJK2/hzB11KmJ5GtBDV/MDlEnmp/PVDVnq4U2Zxgij0xP0cdwSCr
	pqq2brPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewNm-00000007aPu-3ZXY;
	Thu, 24 Jul 2025 13:53:14 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetn1-00000007IXA-25qs;
	Thu, 24 Jul 2025 11:07:08 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so200896866b.1;
        Thu, 24 Jul 2025 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355226; x=1753960026; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43dwDfmrGoNVQcXDC2wAL8Jp+SeF4PP+nL7X5CzoIgA=;
        b=cMFq6/CdaQ65PWT/Av3EVjWKgLom51G2bgbt8Tg/ymy17XgH5ZJSG1SLyK1qJPENiF
         sN8sV+9e4cCnU7K6k1vWWiBK1gAFIoctopBTFtI9kL9dygbLIYsfdvT9eNcBcxEn9QVC
         g8c55/9tTKTGEAO2zUfdjZnJjhvXmvOb+vl9whhkKb5xgRnkWuB5fsqKiJ+Vf8qG4Tsb
         PyUWdkAWACs/rHeEZdESD2hEyCDTbjnNJYtmKPwvyhmDJDLncdFgNUnuJ2/99KBaKtNR
         jqn+zmnHI6yW/wqEJwwW2OgA1sU24ydS2JUJ08lrNj0WAtTwPsb1ZFa/GXBrEUE6zf9V
         3wlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355226; x=1753960026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43dwDfmrGoNVQcXDC2wAL8Jp+SeF4PP+nL7X5CzoIgA=;
        b=bJEzjvThaCaDGkgTzo2bDZ6ETcR3Y5o6EbtRE1ngE6eL6wq6iPz3jq5OBLJBNR4JpN
         ybd6Azur8aRonSxKzV2IfgTFd0lqgVHSDo5YfiW6LLrL1RHM8yUgFCN0iYB/VHSS7qJy
         6SC09pfmBRTLIKxMhhA92AAuzx5Yev5FH4ULVZB+ReRzd3gxG5gjh3wQ96Oam2uHUMjo
         6cnTGYy1f6I94IavC0Ledsafmm2soWJeuCWx5NIYmwMeTb4US3LYqJEm3lQGgV0AVmxJ
         mO7cwseM49JnF/PAZ4ViIvKUaE4lpfpTqtd2aiY+fSKVv1UqJ8EdflTj8WGg9ImykGAL
         4Rrg==
X-Forwarded-Encrypted: i=1; AJvYcCUamgBU8Vi+TD2xasUJx7qfjzjg0KHg4ML8TcCavC3k/bkCN82xt+ciPHaoGsQ1Pdu3PUI8kq3gWSq4gqvL8yyC@lists.infradead.org, AJvYcCXg/Et7GTRL4tDZt0piKOnReGkFpNUfISqwrc4uCCw9O2EaJiuEA6QcYHCsqk0IF5OeF9oaUs+AH8MvMKPnsy0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNABvb/2UDfU3xlvGiffkpMef0YfLer8jV8pKqGZBuqvRtz8dv
	Eu9Wj/eOnm9U30g/IS5k3IBb+7Z0/xvpMq5k8KH5DrAqb5rGOETZPLt+00Rc9hjyc6wghkYzvsh
	p1HJXsEemmRm2fRWJCBHO2zPMoMhoAJo=
X-Gm-Gg: ASbGncs8kmfokaXPkNtBcfUnDOFM9NX8wmuv2CMQZK8xKmidAaArrIeXboOzRcf6km9
	uqdCQKYuDLTV7uYjuuxVOHXBjN8WbcVCMxMBg4p1Xw7yOkSIato4MUqhe4CA83Ar3akF47fc/r+
	SIt9RJr0zXWjabfuBsqLjFGDS85J7M6D6Il6H3morr6ekLyqxBKKT22UJwTn3qHXv43UNFquRNU
	XKkIvVceg==
X-Google-Smtp-Source: AGHT+IEQNn6mc1SbQNgvNLpYIewbgmuOfADdxy4q8WVZzoOl9KNmTiYVcFlWZZpZmc6xxLaaxaSRyyOaGbD95ShsFlU=
X-Received: by 2002:a17:906:4785:b0:ae6:c334:af3a with SMTP id
 a640c23a62f3a-af4c1e266admr182496066b.6.1753355225671; Thu, 24 Jul 2025
 04:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-7-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-7-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:06:29 +0200
X-Gm-Features: Ac12FXwnivN4zoY_g5_4Ly7908cvVHMEFQ3vZsc8P3-b_-oZW11Scn4jIzuxtTQ
Message-ID: <CAHp75VcLaVsztRtiwUkNZJRGwd5+T-x3t2VGog=0E82D3U-qLw@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] pinctrl: keembay: release allocated memory in
 detach path
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_040707_540104_5F400E77 
X-CRM114-Status: GOOD (  13.98  )
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

On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Unlike all the other allocations in this driver, the memory for storing
> the pin function descriptions allocated with kcalloc() and later resized
> with krealloc() is never freed. Use devres like elsewhere to handle
> that.
>
> Note: the logic in this module is pretty convoluted and could probably
> use some revisiting, we should probably be able to calculate the exact
> amount of memory needed in advance or even skip the allocation
> alltogether and just add each function to the radix tree separately.

altogether

...

>         /* Reallocate memory based on actual number of functions */
> -       new_funcs =3D krealloc(keembay_funcs, kpc->nfuncs * sizeof(*new_f=
uncs), GFP_KERNEL);
> +       new_funcs =3D devm_krealloc(kpc->dev, keembay_funcs,
> +                                 kpc->nfuncs * sizeof(*new_funcs), GFP_K=
ERNEL);
>         if (!new_funcs) {

krealloc_array() ?

--=20
With Best Regards,
Andy Shevchenko

