Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30D9C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roh28ZHZlzmyIxiIaWM61lfqv9feWcpiDK1S0QOohw0=; b=ATdJNngSAgu1sEuKqTPVX9M6We
	WC3YWPE+QHtiIO+esclVmcM03gZqSSy6+ChPZsNIC30mjXKZDTlQxGGQe8eZV0iSbZmen8qOvhFS9
	a6VavcTrUNkvezUb1eV8mFY7/OLej+AKcn/2rwkSbQIs68XbxQRUSAt81FyuN+caMg6fX22VQxHlF
	OyV4Y3QImh6c2mCLuzOlgfWOlP2ee4CgDqHnwLYhm/cjR4oDupN+mHncVZrn0W4UZlJf4SLpVZm2h
	6JCkP/6SvbzYeGuSq12qcbEfm5uXmlA0r9arF5+HOL2ivJTCm5TgpgMYp16FYIWfjFiZsJhRd2MjZ
	SX7Ils2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBsL-0000000CfA7-1xZh;
	Thu, 19 Jun 2025 09:48:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSB1Y-0000000CVQc-2d3N;
	Thu, 19 Jun 2025 08:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=roh28ZHZlzmyIxiIaWM61lfqv9feWcpiDK1S0QOohw0=; b=NNdidGsjFAloDLykgzJ+rXflzt
	hHoxaZBRaIkmbi8B95jk6fpWNR+yl0/uAzdXOHZYbbyRV/zTzdgTDv3GIWeoYDIyvAiTj3iQpHXNN
	eKbxKsk/rD7qZvXpcJtLJT4CYQJje7c+bVGv3/P1H1i5udyq2S05tU7EUWviqmrdZU+517j0fNg70
	0phjPvUGZHy9ehi2Eph0/7tkIE7B7ep2Jz2xODTiEak1RHcdB61Eevyv/Petq0hnE2tOtfRp8U8rg
	LM2keIuyMlU4ONGcDTWCDRwDYj9JV9VTpwJ174txSoWCDjPHUGf8p5GyHo/+WfFWXndCjAnDqm6bz
	oYZcHTxA==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSB1J-00078r-Q2; Thu, 19 Jun 2025 10:53:17 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
Date: Thu, 19 Jun 2025 10:53:17 +0200
Message-ID: <2628868.NgBsaNRSFp@phil>
In-Reply-To: <CAMRc=MdkDF_HjRvCvUdKueRgNYDxe=aeGeWAw9bBgnAZ=kxZAA@mail.gmail.com>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
 <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
 <CAMRc=MdkDF_HjRvCvUdKueRgNYDxe=aeGeWAw9bBgnAZ=kxZAA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_015332_678895_1F671DD5 
X-CRM114-Status: GOOD (  11.66  )
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

Am Donnerstag, 19. Juni 2025, 10:36:06 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Bartosz Golaszewski:
> On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The lines on this chip are input-only. GPIO core can handle the missing
> > .set() callback so there's no need to implement a dummy here. Drop it.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>=20
> Baolin Wang <baolin.wang@linux.alibaba.com>

I think re-adding that trailer broke - missing the Acked/Reviewed part.



