Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885A2C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 15:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J64BL22WjRfKK811Ckzq8S42IJIbfd0VtAbWuMwxY04=; b=S7UfkInTcu7vc7
	ZtpQnUMmrLc8JOtWl0E6/6+LTRxnq5JzuVxKhv9FgoA3k4QiLpHzhlXWIloiqEdNjpWUKj0iUyVe/
	XyK4VNYw2nX+Fg34qPhtKnO/cH5t/vyHeFTxYuNitBRpNoY0C0SEApvd1IdEjXsG49X6o8mXszAe1
	e2V7uNWMEJ7c15QCP//hyf0F+YauF0cq/Xl06o5WSlDnDLbkTQE6w4Lo8HgeGGmD5/1I6imFxuOBk
	ELtlz0oFiWHYHx2Vd1AwB+LlR3kAd4vF/wOUm0KtncaIgWUHYkyGQjHJ3pnIYZTAAALQiHSTk/EYh
	LWfEP1X4jEdcRD9NGPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5mVZ-00000001nle-2HT2;
	Sun, 13 Sep 2026 15:52:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5mVY-00000001nlX-1pJm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 15:52:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D442E44928
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 15:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57841F0089F
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 15:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789314763;
	bh=J64BL22WjRfKK811Ckzq8S42IJIbfd0VtAbWuMwxY04=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=WnMqGFnDDFnHlfAReCslPgEvYzB1pDtjLj7mEgkFE4I6gUASFAo3u0ckrUZmGhDYy
	 gVlfUH14BrgNT0TBB1QZuuUSZECSYFtL8PlwxDubxicNJqC8iJmDizon+Uu+TBJIpi
	 /od0RWCSuOu8LOZ1NBdk0J8h1lxyyFNow3UG9BnR76uk31HIe8E6qP3J5NRoiOvyxY
	 5CwLbWSP5QIjFZwPFo45DN7Whc5y4vMVOMOLLirjDu1Tm8cGVd5HFosZtORdTZa4Eb
	 VJdKpbNDf9vxhiT0c4ybTOkAuzb1z+WlAagvUZH8WWhZyVflr1YNfyRDJSsT0ZVdE9
	 7YWgaIJ76z8HQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a30521edd8so4423681fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 08:52:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwci+WcCAsuUav2bTwksOjpEG8hA0KzecrUpVG5UNIJMKSOUSMIHbk0fZaDPbASUfdpr2NrEAznzTyUp020bxUy@lists.infradead.org
X-Gm-Message-State: AFuF++kOjWurDn4RjHTMzDvKTtgbcsHiS7byGzw9b84Bx9ibxuUEQ3N3
	FkjG6csRLeNS/Ggc49j9zRoX86Qq7rC8zACXpCPxNPxxOWFmy+ipyjEEUQpIlSX5AHahUIT7U4p
	WtFAveGXn4hkiPk6aQbgEMWSI4sb7IQs=
X-Received: by 2002:a05:651c:a205:20b0:3a3:61ec:7db5 with SMTP id
 38308e7fff4ca-3a5be1d65e6mr1540031fa.11.1789314761967; Sun, 13 Sep 2026
 08:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260905133452.64544-1-hppiscas@163.com>
In-Reply-To: <20260905133452.64544-1-hppiscas@163.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 13 Sep 2026 23:52:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v65mRj72OrcCqXy3-Yo1UFJsLoeEiB0E_JhbYBuj-e182A@mail.gmail.com>
X-Gm-Features: AcwNN1WDCOy2sNndiTJTzu6mT4VBlt5N2NICbAPIS69BxHec14lNArKCHBdII7k
Message-ID: <CAGb2v65mRj72OrcCqXy3-Yo1UFJsLoeEiB0E_JhbYBuj-e182A@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: a523: Publish the main CCU module alias
To: "hpp.iscas" <hppiscas@163.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Sep 5, 2026 at 9:35=E2=80=AFPM hpp.iscas <hppiscas@163.com> wrote:
>
> The A523 main CCU driver supports module builds and registers an OF
> match table. The table is not exported, leaving the module without an
> alias for its OF device.
>
> Publish the main CCU table without changing clock initialization.
>
> Fixes: 7cae1e2b5544 ("clk: sunxi-ng: Add support for the A523/T527 CCU PL=
Ls")
> Signed-off-by: hpp.iscas <hppiscas@163.com>

This and the patch author needs to be your actual name. Same for your other
patch.

See Documentation/process/submitting-patches.rst

> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index 20dad06..d0c4c70 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -1685,6 +1685,7 @@ static const struct of_device_id sun55i_a523_ccu_id=
s[] =3D {
>         { .compatible =3D "allwinner,sun55i-a523-ccu" },
>         { }
>  };
> +MODULE_DEVICE_TABLE(of, sun55i_a523_ccu_ids);
>
>  static struct platform_driver sun55i_a523_ccu_driver =3D {
>         .probe  =3D sun55i_a523_ccu_probe,
>

