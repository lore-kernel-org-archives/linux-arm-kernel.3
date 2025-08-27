Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34534CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Oe8mL8TjjkGnR2jG5Rxs9VLauseuU6oqwYerqQXRro=; b=FzWVFyMi27uUTMJF/153RLXZA8
	Q/+EhFXCmlne8KDhsW+h6NCGqDiYgdvgBj7Tx0qxul0xsHTFsiXjvG3vdzWTHNN+U1cm3Ul+kZtIO
	YWHSbV3+SnyEqGi5K1unD0g4T0xsP0dSHC0zLXA6fte+buegkcDXNLMUZc48ZiaHtCa5/g2aBdjaT
	PwxkNFzNwETHsyGyUDTHQKyuuUE6eexN9LUG52jlgCPMxaCPJ0hrKQKH0qF4xSwpY+LnjQ0CuiBSS
	Yi9Ztfob9yKR5Oz2mFCtOAs801ASAIlyH0MLjO8FuKccN9Y8Fw7PgUE0tWgS7Eq8s4uSDEerdjIp6
	kXDBiGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLc4-0000000GZTS-16FZ;
	Wed, 27 Aug 2025 19:15:16 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJII-0000000GDGT-2QDc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:46:43 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f4345cfd3so58337e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756313200; x=1756918000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Oe8mL8TjjkGnR2jG5Rxs9VLauseuU6oqwYerqQXRro=;
        b=TUP0t8Y3oQ0YpICiFeXB7Ac8CnKUCt3KjonqFtL7zq1EY8XIhJVJ2v0awG3lJvA/rt
         R1xDLCJYM516fObvCJsV5ojrP9R9JkY1z/PqePuopqYHuSjuL9GlESH+xRHb1V+CERUz
         Py/IpgexMAzGA0h4dXNUYde5ffO7Ww/U3gi0rK1rjZ4/QRPbi+t/zC2PdCE7E2tVcrk6
         e3MkeZzNncfDK1zNpMZvyURKrVRIYPiVZVSpaAlqN/T80hXFFOy8rQZ2V1iIXnBI3BKr
         DJh2OWCNPzk83TCb7GmAshcGJ0cKWuXkz224Xkmpij7FbMQYpRghgSVzAyfXqxCsVkWl
         hcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756313200; x=1756918000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Oe8mL8TjjkGnR2jG5Rxs9VLauseuU6oqwYerqQXRro=;
        b=lxJyRyd8AKpyTFuwfMYMbJpLMEZEbUdxdRsKg16h+YYrDXqT+yf9JHWnq03ZUxxCvH
         8zgkfqrv8XU8Z8QnCK8LFsrg5+O8+hdq2yFXGBzpDTiK2y1GpEKmIk0HOxQ+gArggDxh
         K/24yU3s0ltX08h0L1zFygO5+NSuFZx3RWopFWa+TN25fI7T5KJDcGLyiz3/l9JWfa0I
         fuBT8nMNBoqPuESFbUnA79SsrThMV1KNEgep+By0gqCpPpPhdp8T2d81zydRCPrtx9GC
         ua8v/fEz43nTJrad+oh+jCOruyj6klP+ZIhJwmSBPyYWhLZSzW1VDu2gzgkwk0Hf1hZG
         rwbg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ9F/mRl4C3QvQSut2QmE1Br7NzFMAjPhT/hqf7+ABlNP7TOVNL4ySr9Px8q9avL8cHBcJCmYwOtiQ2ABpV3bV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq2AMd9SOcI70apLQnEqY4QGknkWrv3/P67LYPjETRPlu0xeVN
	SHVWXynSTftbgjBbb7wQg84onAZOe5Q6OCpXTO/Qg+BVcb8QmAoNlgiCZmTkCcgFXUPGu3hbCQV
	9vvol7wgd8+2cJTNeq7Zdw1KSY8OEyYs2LREgDiP6zA==
X-Gm-Gg: ASbGncuQa8+QQqHAWKmMYo++7SM9b9x690xii0u3OGhEJlD95jNVfKpBGdpm1vScwJu
	LAyjeYvjK5LpmKy1D97HNeJMkES+ugiISnd9DQ2+JmTt/oYaAeCRQgluUM8HXssE7lTPGRg+PI7
	SywfbFKptJiq39cRWaqH6g4oIo6G7pc7hzsP1l6PFW72Gwnl3Zyl92yvQ07iJ6kFIM49OUL4ihZ
	USlDoZWGog+5S1qhnuMbkqhSjgpsIem9ZVNnrQWVIsMJcJL3w==
X-Google-Smtp-Source: AGHT+IH2vScJrK3ld667OkWoypLYcKly6TqnbjFjPvpTB4KCLVEthUMwQrvNGz6iiIbdkdd5rCAEnq3AM7MI6KeEyo4=
X-Received: by 2002:a05:6512:138c:b0:553:2969:1d6d with SMTP id
 2adb3069b0e04-55f4f4c6a98mr2026962e87.13.1756313200214; Wed, 27 Aug 2025
 09:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
 <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk> <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
 <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk>
In-Reply-To: <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Aug 2025 18:46:28 +0200
X-Gm-Features: Ac12FXzUBjVjZcm1OFCa8B8Pt22rGMmSNEEFj8GwunzU7aycJyqw28vaNlWwNSA
Message-ID: <CAMRc=MdKgqa+vjhHvD2+Tjw5NwBtFv-0aUivi5UuEQd+n4KxmA@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_094642_615161_E218CBE6 
X-CRM114-Status: GOOD (  18.61  )
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

On Wed, Aug 27, 2025 at 12:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Tue, Aug 26, 2025 at 08:19:37PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Aug 20, 2025 at 8:41=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> > > On Wed, Aug 20, 2025 at 09:12:49AM +0200, Linus Walleij wrote:
>
> > > > The qualcomm 32bit platforms fail in next anyway so I dropped the p=
atches
> > > > for now.
>
> > > FWIW the i.MX8MP also seems to have been broken by this:
>
> > I can't test it unfortunately - would you mind sharing some info on
> > what's failing exactly?
>
> I've just got the log I linked above.

So, I've been looking at this bisect email and clicking the links to
LAVA jobs and I can't find anything. Does it fail to build? Fail at
run-time? I'm not sure how to read this.

Bart

