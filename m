Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963FCD58E7D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 08:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9PttO+DsOQ4IfjyBkw4K8QMocRbbjrmHypk7fmZKMw=; b=GP3gWZG/1xhaCI9TMCeYXSIbQA
	o2Gs4nYfEZbblRbpqGyh8XpRSQW2BxlaOh9MriQftfY8lDWXMPdciKyZwlniQPRsI0PO8G6oES4/d
	Df3PIY+w20xPieGuXaXmdgLO8cBORZ0zMeQLleFwQTWREtGEAVJkxKEvAKGDOWY4SnFAkDXcopMzQ
	y1fsuCYB/vONPJqRxVQASpFbdeLBlyjleUuTN5WEPswacQqChtGSL3yCOa+Nuk5WRaWExexOb6aVf
	izUIRtSEjnFOaSOtmfLHj92u7wjKB+u35/Dlj/lRLUDio2fkIOB+IbJwu4PSE1dDob//cTGiVI9un
	2riCRwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyhe-0000000CWNL-3P0c;
	Mon, 02 Mar 2026 08:32:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyhd-0000000CWNC-2hfo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 08:32:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F7FC60018
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 08:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB613C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 08:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772440351;
	bh=K9PttO+DsOQ4IfjyBkw4K8QMocRbbjrmHypk7fmZKMw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PQe61Ug3ZavnRImXrsLH+1Fikmeed951TWdXfXunIEoh8CM5bsgR8Ikul2AZVVNGg
	 Tgu/v20AeRVpbmCYH+7PXAajkVIFTlNMT0WbwTGsrfxDRTzcbmCBNtqaHo3miIDbGs
	 ZJlPjbOHIiujLYbuEbqT3LvSUB/wrBqDCMaI1dabt6+TIObnR6bM/bLykm+/jChrwf
	 jE7gbAMAdayceL0erzoUwToMU0e0l4w7J+p+OcpnDFqma4KhUZZ7TxmR4HxcZsng97
	 xqYcVbHjMkAE/44rO9dSDf8+XVTmDV7oxIvbwusOw5HET08Tzg+ORs95zDNt397GW3
	 aee0n/C6d9izQ==
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12732e6a123so4873675c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 00:32:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfMcmVuMNEFvXH7SXvP7biqvfxXR2OyZkJalEc9+ymWjdmMOvjzRZ1gBX70l4zPEycPoHPXZL5esBnmRvqTiBI@lists.infradead.org
X-Gm-Message-State: AOJu0YwSfAOLYl9QeTAmajEr1yU5G/fsibwjTyOyRkMWViIBF4+qJ8Hp
	1p/z5ln3dqWmBox4/QBA0gwO+l5mxeXE2oxRFs2xcSM2OC9tU7ooHcZbv6S8XokxT2sGHmeMbrM
	ookctJnF0Zqwv9maphPhhZrZk/4CvVdhA+NLUezhtEw==
X-Received: by 2002:a05:7022:ea48:20b0:127:9c17:985a with SMTP id
 a92af1059eb24-1279c1798bfmr1713176c88.5.1772440351223; Mon, 02 Mar 2026
 00:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com> <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com>
In-Reply-To: <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 2 Mar 2026 09:32:15 +0100
X-Gmail-Original-Message-ID: <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
X-Gm-Features: AaiRm51iq8ZjzU7QM8JcGyVZhGJ_5IzqG8SaybThwCwM5_ZyOCcQpJBUfsUFGw0
Message-ID: <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Feb 12, 2026 at 12:46=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> On Thu, Feb 12, 2026, at 12:25, Bartosz Golaszewski wrote:
> > Currently the board file for Nokia 770 creates dummy software nodes not
> > attached in any way to the actual GPIO controller devices and uses the
> > fact that GPIOLIB matching swnode's name to the GPIO chip's label durin=
g
> > software node lookup. This behavior is wrong and we want to remove it.
> > To that end, we need to first convert all existing users to creating
> > actual fwnode links.
> >
> > Create real software nodes for GPIO controllers on OMAP16xx and
> > reference them from the software nodes in the nokia board file.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Aaro, Janusz: Can you please pick it up for v7.1?

Bart

