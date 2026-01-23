Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB519D778B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIOjdspmv4mVKi5jWqfseDeXVzFTwtYPpKoKsC16Joc=; b=joUsn9SBrV4RhmZu8ZxkgRssJY
	sCod3vg4i4qG/vxxtx78V2S35YBrN0gYtHKj7XyBENaGBcgieCh/nbzkJagBQBwRl2+QAXFzIO42i
	sx33ny4tLZUibGMZp5t3UNqv/3E3P0pz7lA1DzJLK/JjFSA9I8Ov18NjjZEg/wSbDpaCOaATFqb+1
	ulS3A/i/wo/dpYLYvBeKqJ0sDH9vz75AZyuq59qzD1EVm+wBli2WqbxXAr6XxaEEZeITVg+7Rvk8A
	lFDaS12KoLVbf+b6zMf975Pr00C9wv9okQSU6ZFmH89mAb41Uw40L5GyBQ+JWxL1IlJmhuP+2Qe+W
	aktVtoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMoV-00000009QLF-0YJ4;
	Fri, 23 Jan 2026 19:27:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMoS-00000009QKV-3E9N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:27:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB26743AF3
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 19:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B18FC19425
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 19:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769196439;
	bh=pIOjdspmv4mVKi5jWqfseDeXVzFTwtYPpKoKsC16Joc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZHnmOeOYRdh1IBJMz8YI6GASYt6es1tB5i3Utnma3wd0m9eb9pSB1pl/unxMCpCda
	 ym0d0c5EPQRTQLS88HWNTlL7LnEE/rrlDJnWw2f2nJYB12uQcC5Dvc4NpJH0b3X6Wv
	 22uA83fwgn62Z/5az8/HNo3Pt5pIdwknQvkA1jNT0/pJnViudxrEnhDI3yOPh0jJOP
	 q1HV8xe9ymGJWeUXHYFd1I0WprLVeySEe2D0ublqs7CTL29VHjPZ8+qMMLJTYgw3Ty
	 e/bWNk40/mQ8pX642IBjwph2LW1uXuBqydTb5oytTC4xkSmSXAchk4TdV7C61x2cM2
	 jenPu/PTcjHZQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-385baa8afaaso22119811fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 11:27:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtT3r506nM4zjIXlg2/SZQAHDn/d77HTNRqo5cE49B95FOkZiFQRbodrAWua/q+f7HsBYiya9KDZaMTkrUNTgs@lists.infradead.org
X-Gm-Message-State: AOJu0YxNDau0r05iWQZMWWmx+n6wPqGwGYw7cFqezr5XNFAN4SUE0xuK
	3LbliSjrvciKVS08ZOUCH4CPKELNB54FnThAzno29l6lawVTVSNpSqa5PS+uEskXRixsHc8lm51
	IisVOq+u0wMcfIinWOzk13axfTDCzBnVpyFSPNUVA1Q==
X-Received: by 2002:a2e:a884:0:b0:383:1704:2203 with SMTP id
 38308e7fff4ca-385e1bbf407mr7131441fa.27.1769196438100; Fri, 23 Jan 2026
 11:27:18 -0800 (PST)
MIME-Version: 1.0
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <aWGSQYCXP4R08koQ@venus> <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
 <447e8d5a-916b-4d58-b39c-3467c152379c@arm.com>
In-Reply-To: <447e8d5a-916b-4d58-b39c-3467c152379c@arm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 23 Jan 2026 20:27:06 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md0h5b=N9CqV-9L9sOtCNbiL1-y6RE0x4+w9HYXE8=pEQ@mail.gmail.com>
X-Gm-Features: AZwV_QjQbGS9oFegdz7_zzo5pejoUBgMNWZYbLLOHYRKiiTOeEXbzmNqH6cpZ_E
Message-ID: <CAMRc=Md0h5b=N9CqV-9L9sOtCNbiL1-y6RE0x4+w9HYXE8=pEQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_112720_834206_BF53FD43 
X-CRM114-Status: GOOD (  16.93  )
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

On Fri, Jan 23, 2026 at 2:27=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> >>
> >> It's not a big issue for the hdmirx driver specifically, but I wonder
> >> how many more (less often tested) rockchip drivers use GPIOs from thei=
r
> >> IRQ handler.
>
> Yeah, seems this finally reached my distro kernel and now the kernel log
> on one of my boards is totally flooded from gpio_ir_recv_irq()
> (legitimately) calling gpio_get_value()... that's not really OK :/
>

This has always been a sleeping driver. The driver does not know the
firmware configuration it'll be passed and - as I explained above -
depending on the lookup flags, we may call .direction_output() and
descend into pinctrl which uses mutexes. Ideally, we'd make
GPIO-facing pinctrl operations not sleeping but this is a long-time
project and quite complex. Telling the GPIO core that it cannot sleep
is simply incorrect - even if it worked for this particular use-case -
and has an impact on paths we're choosing.

Can the GPIO reading in the gpio-ir-recv driver be done from a
high-priority workqueue by any chance? Or can we make it a threaded
interrupt?

Bartosz

