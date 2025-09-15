Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A021CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WwEFBivcQFPvdJ+vG/cDspUtw0KZYVXb0gEbIG01PM=; b=UsjGVy6e+K1zeS/6hYxmDWuBTT
	MxXgEZ3tSMD+gGCqylHiaiuaQtChj0HP3zTvH5FmRDbg1/Dk476Ml963PuJQMAzlDUR9ms0uvQ5du
	VIveyPTlp1HL9dRhGP+Pse0IZcu74zBP8KHRmWHP2EvIQ5QhyF/LouxBgX4ElHmuVEG3LX9G7dr7x
	7slOGksDGb+zeRD9ukpHWMhx6mq+NaEPXAS1fHuQZEH1GiyOEH3Hh3G6h0DbMCsNv33GEBeg0OMXq
	t9axRPDpPYAWXyyHPO5w1vlhoXMwuQdznbsIMJ07oyJUThDvBsBuYw7m2hXvk48tFsexzF3mCyzcc
	mtsII3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9FE-00000004Jjl-0MZB;
	Mon, 15 Sep 2025 13:27:48 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9FB-00000004JiN-0uoX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:27:47 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-336dc57f562so34761361fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757942863; x=1758547663; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WwEFBivcQFPvdJ+vG/cDspUtw0KZYVXb0gEbIG01PM=;
        b=IW7YHhyK1+AU1gucedwJyfbvTPp8C5u181RWKyTLbKOQ+mtvdAGqlIeqGvNcVgNyRy
         lTgYzwmWbVSGJlux4yayboWqcJlJpJkk6aJVZ8igLtkcYT3XxqO3PdVShyD97OfItTnZ
         4Udc/Xzmtch+g6imdhptDSVIoQYGBXBWRR1mcCmiNI5pQ4XIqoHbt9vEfk2pBxJQhHv8
         dlPxYVCxiEx2r1ZkIxtJYC46wogL1tJ/Wl5YkTiMpnhck17FO1WY9f72EIeNx3JilYAV
         FppFWjxn0OZAdnM6CwnTfRBJ9xZMBv+gyeoUnIkzyoTjc64VaohUSH2R7HmKz2droZWp
         4IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757942863; x=1758547663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WwEFBivcQFPvdJ+vG/cDspUtw0KZYVXb0gEbIG01PM=;
        b=SY7pPuGvt2/iLJ8ZUCkjcGhAjbFO5XpB95oG15zjWIkvvbH8udlMrhPAXmv/aTBxmR
         LvKXe/yeQEgU5eTMZkcFBccNh1pfWXxvezi/bnZuCTiQblCkwvyP6ySr5Yvi9DjWUhhZ
         4SeS20iYFHz99R4GV8ae1gEmsa4vws2Ir3vMCVpgE2mAHGNc01K4aFULCGp5w4hoj5Mc
         iEXfU6kdcNZtIf0xKRyDhqGXZmsK4rNu8IUNWnkk0EGpBnA1Wu7h/jlb5azzVeXaJLkD
         vUYg/ayQ8KgplW5wLdpnAn5AU+v5NHKtN1dHeXJKJmhfDggJAcGV5z7Lix5+1SQfb46h
         V06w==
X-Gm-Message-State: AOJu0YyDaZtQ4f0pncw89cFkMMD+vw58TlNTETelgaReIn07Nnw97r/b
	OoMbv2JTfgKPqXAG459CAscMX+mWlETHC+LMpxmdsZ6GeHKyzcG7A4PrI35c4QguY+/YFsmBUxl
	fAiAg6Ji7O3P6JJXoz7/TKGpq7mKv6+pJBXma96TI4g==
X-Gm-Gg: ASbGncv/RWkSmlvuWyk2ovITTJJttIfSil9f9HmupyxuLiWhC0jcGRUlUy7+b6jLyG/
	FYSPXw2ARJ7eNBmp4nY6vjbPElG1USXk/2x1XLGnt4J47EdZTQ2CzU8jYy0zs6h7serLx/KkjMC
	91VWcj3vnod6JJmYxSJLxWXMJ3qefJinvmGj4NQWn6kLMAX5TQEBP6wZ2csKwvZ+Jpqf5CbsqXq
	BBw4StG7SLDPtAm0wQJpnEX8CwU
X-Google-Smtp-Source: AGHT+IFgfjmqMYnXOIaWipd/39zNflboRpCuHneAYznmUhdiyLjY2HbEympVHUYJ5CPB0u2c+tTL66iGf/QFYqj40GI=
X-Received: by 2002:a05:651c:40c1:b0:337:f40b:ceff with SMTP id
 38308e7fff4ca-34e2b95873cmr28261471fa.0.1757942863077; Mon, 15 Sep 2025
 06:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250915091007.28438-1-brgl@bgdev.pl>
In-Reply-To: <20250915091007.28438-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Sep 2025 15:27:31 +0200
X-Gm-Features: Ac12FXyYyzxwYwBXKfmLtOHF2Eq5B6VfMoLEYuKJNeHENi3UziVmtNkXhN3IsyU
Message-ID: <CACRpkdaBDoED+maFVbiENcOruCCtmRe=wDfkRtthuqqrQoY-FQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: fix the debugfs helper stub
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_062745_265186_161E235E 
X-CRM114-Status: GOOD (  10.40  )
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

On Mon, Sep 15, 2025 at 11:10=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Commit ddeb66d2cb10 ("gpio: nomadik: don't print out global GPIO numbers
> in debugfs callbacks") failed to also update the stub of the debugfs
> helper for !CONFIG_DEBUG_FS. Fix the resulting build failure.
>
> Fixes: ddeb66d2cb10 ("gpio: nomadik: don't print out global GPIO numbers =
in debugfs callbacks")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509132232.12viPUPB-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

