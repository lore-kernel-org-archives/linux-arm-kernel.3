Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677F3C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 22:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebKDhKAhgud2bnS39ZCHaxinRFvr6zWcjZYPy1ikOOE=; b=BTlNeObXhjwfnuRXSNvk0YAhTQ
	lu0/vGUn9HbnLufd8KJ5tvjzLwn2tUTLQGKTJSyyu4f93n9aevzfevhJI4vWGMHvg7FF06hI/Krid
	IuQgItD0yOZ/4qa9IX3eiPWiYMDNuMSdOvgIcsx27O3s7LKOgEYTcVoqCA1qqAQN2wsdg4pl3FUFg
	qvjGzGJCq+sWCtO/ZRsUuO5mgDQZW/A4wtvOBpUQUx1KGm+geEnNF0/fYJ4zn99ali66dDveK01MN
	t5iokuyoLTy+NoiyRELQKPfr0XdL4SJgp3zYDXlcX3etNPf1Q5LXICU4DDM+zFVVXOC8O5JU3ALah
	EKEDa//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ppm-00000000VVF-1Is7;
	Sun, 20 Sep 2026 22:16:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ppl-00000000VV9-32p1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 22:16:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AF514478D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 22:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0306A1F008A0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789942589;
	bh=ebKDhKAhgud2bnS39ZCHaxinRFvr6zWcjZYPy1ikOOE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Yq9WVFPs+jqy/pjJBlh2QI/tgJFpFIS6b6e05Igu+4qP3Gy6LvWdo3kJmjl0DZH9p
	 jEE5RqyWaSfQiM3Aky8eaEROjlFpleYUS0gAtq9+Y3qMWvKzR1Eogz4ikHuTUTIb5g
	 yaXe5/nYNVYfd+nfimQTzhKPRT7RVpq6quNXhYjyDNR6xfW90k6MsGV9uygJFl9Ab0
	 dpZDxLUTj/Ow98i4gcjjZL9awJy42OH9fnWtGEARiUZtnQ+jpyj2nVboSpIDgymHM8
	 5YjHBT5c23zDGei+wDWAkIvM0JjT22xo0ThJbcV165tHIxA4B2cNWiVfxCk5l3i20N
	 4Oh3cBLsp91aw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so2744412e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 15:16:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw88F06rqhEABnKqt1Z5E8OGn286IScgJi7gjpglAPF6ZHVwuNbngTjM6t9IxKHfTKjL84gxPyhkfiJVQm5S7BA@lists.infradead.org
X-Gm-Message-State: AFuF++l3gz9WjPlXR34ZGH4S+VzIiMG8PJf4v8GHRIYm1ISRAMokyj4d
	f1pWfDq/St4ArfyXg3iDpvRmnG3m1mHbjOm5a9gLT7fmaliQGfZx+UgGnuhBaV9LmI2fanhuBx7
	HLA2I2PwCxcFX2fwhCTsAGRRdsP7Icz0=
X-Received: by 2002:a05:6512:1293:b0:5b4:ab7a:8275 with SMTP id
 2adb3069b0e04-5b8c17f5ea5mr2698722e87.3.1789942587664; Sun, 20 Sep 2026
 15:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260915080501.329424-1-mehmet.fide@gmail.com> <CAMRc=MdmqkG02q=4_wJAVjeBzP_8KqQWNx6cBaL=FUTn_wxw-Q@mail.gmail.com>
In-Reply-To: <CAMRc=MdmqkG02q=4_wJAVjeBzP_8KqQWNx6cBaL=FUTn_wxw-Q@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:16:15 +0200
X-Gmail-Original-Message-ID: <CAD++jLmrxraJUDbRvixcrkMc_foxERA1hRavx5eSRcf9r0_FHw@mail.gmail.com>
X-Gm-Features: AcwNN1X7pTA7qBrMe4T51xXoaKqZZVpzO_aXkfOtaHIdAuBs1L1sA2lNLANIGoo
Message-ID: <CAD++jLmrxraJUDbRvixcrkMc_foxERA1hRavx5eSRcf9r0_FHw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] gpio: mmio: report the line direction on chips
 without direction registers
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Mehmet Fide <mehmet.fide@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mehmet Fide <mehmet.fide@screeningeagle.com>
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

On Wed, Sep 16, 2026 at 11:42=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Tue, 15 Sep 2026 10:04:57 +0200, Mehmet Fide <mehmet.fide@gmail.com> s=
aid:
> >
> > On trees: Linus offered to take patch 2 through pinctrl, and patch 1 is
> > pinctrl as well. Patch 4 gives wrong answers without patch 2 (an
> > undecoded pad register would seed every requested line as an output), s=
o
> > I would rather the two pinctrl patches land first or in the same cycle
> > as the two gpio patches, whichever way you two prefer to split it.
> >
>
> Linus can put the first two on an immutable branch for me to pull.

OK then I applied those two patches here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Dib-gpio-dir-imx

Then merged that into my "devel" branch for v7.4.

So you can pull that and apply the rest on top.

Yours,
Linus Walleij

