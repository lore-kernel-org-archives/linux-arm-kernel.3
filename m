Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB5BF55132
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWY0RhWYxBeweq9ZFjqm2zYDGXfcdNn569zDXOr+GZM=; b=q3tGDLgMEyn0zYFgragTgqfkbr
	c2sslWpBVCGdeZIfc3XTPZtddhNCECpMcrFZZgcdN3dAcigiw0YTodUAGNnMltHggJkSnwtbPeIcu
	/ZW+HDZhaMUWIwtc/H5SpPgm3thTfB1ZqzQ8GXObtwTc+hXfx0/kOpoxVAT4rbXw35oXqNP2vXB3q
	4V4cJtTeSWpE3QcCi10d6awHJgdSFGaOqBrnnLdzFUeSHuEdJubwoiaup0j3hSAABVebw58W7H8wh
	8wwGFYi+AjuoGq7faPdwSz1Kr7zg/Nd8+KG0IGWK2y9gzD6XyU90LDp1aFBtOCkXBlfFltcmUh8wh
	+jmtrxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzAXI-00000005qoi-2chZ;
	Sun, 08 Mar 2026 09:34:56 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzAXE-00000005qoL-2vyC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 09:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nWY0RhWYxBeweq9ZFjqm2zYDGXfcdNn569zDXOr+GZM=; b=JShlkZ3WLUaKolnrYBZ4rCSwHa
	qgdPYjX3PkQ+TczOyLuXO0qDXUn4IjSuTWUsZsR+Y5/6gxXA3d0O/1X8NXT2vEYuQwJtlsxo6/z/b
	LtFZ77iQ0nwln898csXoan08KaHGYmQeNYPBEaLp0lR6v4uYWNhVc5X1T3eX2ek0ut4UrYp5eGd8v
	YRWzUnvvBH/kpyG8zCdQsiUNfcklDivFx55E2Prj2h7GomJXpcBdHujV0FCdWpe1o0v7uMmrnX6AH
	uuCE96AcfgevpLWcFJkh6dq+ChRA4iFh+wnRDh6k/c8RK9Jt0kSCcNWJJ2noARZSVZT4a1QPTx5l0
	ojkT5hOQ==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1vzAXA-0000000DFw8-3cn8;
	Sun, 08 Mar 2026 10:34:49 +0100
Date: Sun, 8 Mar 2026 10:34:38 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: Implement gpiochip::get_direction()
Message-ID: <3x55nsighrqdo7al2n5imlov5yoti6z7jxrj7yieeghyqkllvb@akbuob4n37pq>
References: <20260224092419.1275016-1-wens@kernel.org>
 <CAD++jLnKxDi1GCp94zAUKhwBvQwVAdT8bgNyw5XM2+PTOhxq1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnKxDi1GCp94zAUKhwBvQwVAdT8bgNyw5XM2+PTOhxq1Q@mail.gmail.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_013453_080583_AA768BC2 
X-CRM114-Status: GOOD (  17.30  )
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

On Tue, Feb 24, 2026 at 10:52:23AM +0100, Linus Walleij wrote:
> On Tue, Feb 24, 2026 at 10:24 AM Chen-Yu Tsai <wens@kernel.org> wrote:
> 
> > After commit 471e998c0e31 ("gpiolib: remove redundant callback check"),
> > a warning will be printed if the gpio driver does not implement this
> > callback. The warning was added in commit e623c4303ed1 ("gpiolib:
> > sanitize the return value of gpio_chip::get_direction()"), but was
> > masked by the "redundant" check.
> >
> > The warning can be triggered by any action that calls the callback,
> > such as dumping the GPIO state from /sys/kernel/debug/gpio.
> >
> > Implement it for the sunxi driver. This is simply a matter of reading
> > out the mux value from the registers, then checking if it is one of
> > the GPIO functions and which direction it is.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Pulled out v1 of my tree and put in this one instead!
>

Please do not merge the correction yet. As I was pointed out by Jernej
Skrabec the solution is faulty and just cover the issue. I will provide
proper solution as soon as I find it.

Michal Piekos

> Yours,
> Linus Walleij
> 

