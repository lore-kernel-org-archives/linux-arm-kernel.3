Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5AFCCF9E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRzlJtgmeKcllMySQlFgaimNGUEcv2R+GqjiMHEJzN4=; b=OdVJK/lmthGWhcgyo+9g61FBsH
	+HgDrTsQwanfqetR2R6C07edL0oEHo55iZglJ63vG3XVUeWEkwVZDQV3mckAYczbmkIS7J7zYln5D
	55Dird06hLfDqxs2RSGSSDW1zVynZG0b0YG0ef7itY6xZtru6QL/EofqEt9l+FldHuxDNZJPmogsN
	uHR5j6pdYpb6mENn0PCQ/sjCdAsoOohRV4NawVuuTk1lYX90Zax3m7Fws3UJyL+vRo+0SQxCzlSFT
	kBf7xwY2LGDNhsNNONVRfS6L1n8CbgfjMZLWrsN6BAhr2yrLdpXYXftqxM1OqOrO93Tv8ZV/2ZBFQ
	wIrvf/cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBatQ-00000003QQH-19hA;
	Wed, 22 Oct 2025 15:36:52 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBatM-00000003QOn-2gEU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 15:36:50 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59054fc6a45so8065038e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 08:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761147406; x=1761752206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRzlJtgmeKcllMySQlFgaimNGUEcv2R+GqjiMHEJzN4=;
        b=L/i5s9bL28di2kFBM4pXZHQqTLCRLhr4zbMMZJUYz1UPT/SzWguWBVszOZS5y0dd3c
         eIUhGlJdtip1L7w1Yb6/sqOri+5YEUh6oYXYRrMoR8WxmB8oE8dBzeqJA3WbK+q6L2fA
         n6MvAmgQskuz1E5+DnLNPSwxUG5X6Of1k7rbFC+oarkjQlwmZrl+JaIoiWTDD2bU1kve
         86o0fDU7JB71Wdb8xr/3JdNCeuUIzCKqeKQEvhhCVonVgL2wPuYH0dqjVqrZOfOBceK1
         3v9lavnarg5SUZv0hQDpnxSMZ1eqcL4PseVFTNJ+rtqi3ftuvhwWX3tcIFfr6VvzqrCZ
         VMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761147406; x=1761752206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRzlJtgmeKcllMySQlFgaimNGUEcv2R+GqjiMHEJzN4=;
        b=kUH/RapsJgb1m/Wn5S8Vjpl9f/U7FA1XeOpWunfkJ8i7SFHhlydDLRh9qo8pBJZVD0
         yR5CE7anyeOkcenqcx1Y+MawszSVWxsxmdCRUecXfMQEOb11UHlZ7Cuj2hQ9a7M+hD7i
         DnCN+psHIQn75UiAoXH+g4talU7LAiIl4uhJaTNqQoEu25EERO7pb6E4/nU7YE8OObcy
         sXiYe/+FE2jeiUWQR9Ga+BvwQytXQP6q7K0E3tHhjYsVF8xY5InMeCK0bHMzWJKKx3wk
         jUUC03q7nkWGQOuEBTjDNe3r5dQ+vGaRm2KPSQG012MS00dV4RWsLCT9N/mPVAW6154A
         8d8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtkZX8QNpRJjspn+sdBvzxzlqXRk54nNiGzkc/wIa7HgwU4tKayFunQ1ltoDQmQN4Wn486lFzn6J2IbF5JzTHw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7rb7bAoiEunCaM2b81TYZGfOaloJpYAOxx0vG2sC7YOINOp8W
	dC7Z+A95a+byVNY0lmK0iZSQTOR5kDv5gRI0xcp8M/v+JCJw4H4MeSkAccXax5ThQNIbt+Qrypb
	O4+jM6TIpoIXCk6Of8slLsX7O+XHLrTOc+3tkrVGLOw==
X-Gm-Gg: ASbGncvvsnrRWzO47BCDQWNJz9IQ9Vr7CJ56m5gGaCs63im+nxx6Bio8rKgcInDXF3s
	CjsfOjjuen7vWs+J57jCV4TeXkOqbVVhmKohPDH3yaahFSYh3EECcJ6SDHLkrec/6Hl5nmtkUf2
	llz6MxgIcnlJWTwL1CLvmyykBlK1zRDg3WICGCyu963wBQCUAaweCmMxNX59NaeeU6Bezq3Oy9q
	qsgkIxlGbVNCEwkicXJ/qi9iZEtJMgN93x+rETUbuy4KGesB+uryfcIs8AwbBWnQ4DmzOvzKlIS
	nST+ugxfOoCpJ1cpMh3u1KV68hA=
X-Google-Smtp-Source: AGHT+IEi/irswdy4VVxLlO1hAN0Zsc9fjvuDKRe+i2ePli5jYREx+Bc29gt/0YVceCmzNFvpblDZjtrVlJp1Cz69730=
X-Received: by 2002:a05:6512:33d5:b0:58b:151:bc12 with SMTP id
 2adb3069b0e04-591d85a4b54mr8169026e87.51.1761147405947; Wed, 22 Oct 2025
 08:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org> <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
In-Reply-To: <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 17:36:33 +0200
X-Gm-Features: AS18NWDr85-ZpXwSC6o2WrSo4j9nQyRJc99PDFWHduyckze-ToGPJ6wk6IRJ840
Message-ID: <CAMRc=MeSFKRo1rHq5ENzKqws+gOAX=-nCsGtw5MXvsOwJr=XpQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_083649_090319_47F8C0AA 
X-CRM114-Status: GOOD (  14.99  )
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

On Wed, Oct 22, 2025 at 5:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 03:10:40PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
>
> ...
>
> > +static void string_test_strends(struct kunit *test)
> > +{
> > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
> > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
> > +     KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
> > +     KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
> > +     KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
> > +     KUNIT_EXPECT_FALSE(test, strends("", "foo"));
> > +     KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
> > +     KUNIT_EXPECT_TRUE(test, strends("", ""));
> > +}
>
> Have you checked the binary file? If you want this to be properly impleme=
nted,
> generate the suffix. (Actually making the function static inline makes my=
 point
> really visible)
>

Andy, this is bikeshedding. This is literally the least important
piece of this series. It doesn't matter for the big picture whether
this is inlined or not.

Bartosz

