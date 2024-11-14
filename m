Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDADD6A22D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FENYyNK4vC//y2A9AUuY/xTIkgQJ19w0WgQKxb08jVc=; b=AW0xIl7E2kf+5almJ7lUzzRBYu
	nQEGAwWGormFtscPGcqBESNpZAFHWFdrxB6KLFaa3yuGQ3K8ZMqKEHpkWQCy2uonndAF0BcgKFqPk
	wqK9ODq188J8BCOxgRVErDdlPZhdfdd+uOSQ5zSUiqAGibjks7QtPRZzCXM52D0vUVeohnYlAsnQ/
	rYO8PDzszOkGxPTdx35TcCVB7p8eIcenT31JKpcTb3kWR1U5Mt1CZKpdSdXZp+OosmevieW1EU++Z
	FHEdxHi9E6Txh95AQdvjwCTYgjfHH95Gr2srO9b9MwOcT9N6EGC6jAnZ3zHodWo0uGpIqoI5wDbA4
	WnIrKLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgui-00000000ozu-3aXz;
	Thu, 14 Nov 2024 20:58:04 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgtn-00000000okA-0MIi;
	Thu, 14 Nov 2024 20:57:08 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-460e6d331d6so6510101cf.2;
        Thu, 14 Nov 2024 12:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731617825; x=1732222625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FENYyNK4vC//y2A9AUuY/xTIkgQJ19w0WgQKxb08jVc=;
        b=CsfI2sSfOjWzrSuqvvM3Cn7lJxQ9Tb4/BZ0sqsv1wLCguIaQEiSR7y7nM4+uO/X7BW
         WbRJLwl0yFhJla19I0tML/grQXAFMzPX+yH7pxq3Pv7GTaFU39ypTvj7jMUn26VgzS6f
         tm/H7BFC+HYXGr64B9QiTCfMEIJk34lQh2FIjbJrMau2mdAovR5IWfB8JRG4OIXmUe6z
         8uyiGbopu5xl24vuwpJiA2S4NxSOdmcvXFkPzMgV5J7CjxprjiNJfKxDiI9KyZp1tIUi
         SYjQam3mUV1F/sKOR70fPGjt9lnCqgM5A8G676iSKwjBVPQhOpSW/GyP3A/BfCxgmqEs
         GoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731617825; x=1732222625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FENYyNK4vC//y2A9AUuY/xTIkgQJ19w0WgQKxb08jVc=;
        b=wPN3JH9TcIxFiYEoF8E/4DYS5dMHsnoAgoWmndj6lrEfuaAD9pmLlvD2i+Zjd8s+1t
         tfFrzs+kYDfpW1AS86Q/8x00wsQE78/aIxFMeYs7U8w15ZdSvZjCbCkfLU4xs49cgkRe
         Sr64+nFeL6jTmHIc9Dh8O9LRBlik/eVnQ14tglSs+8BLj7tPYLOTpEDQ541gYI2f4wb5
         LRXTQGjQiZCxl+RImG5pdZ/WYu7q3yd5T6kwg8cIyn+ePgyR1+g7BJ+sV5Nwvi6a93aF
         ZeQNS2ZLzsRl5JN7sOIozEJcjCp1rXDlc0utftcApHbdY3jgE8qu3HR78u9I240H3e2Q
         BMYg==
X-Forwarded-Encrypted: i=1; AJvYcCVPc0czl6c+aus+bJ+Lbo8NzJrtYliv7tyDt/qnDHK0L1rjSGhA4TPs49rbx3zpCZ9OzhQMNuUt/hCcg/gKMYI2@lists.infradead.org, AJvYcCWbNHJKaPJ4zpst+N533BvvXFMFeSHbHeifqVA8UeAIf03OHlnrzaWtrKkxjhxMZ/vlJgEwLfJkwn+7UYAyJXg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyO3joO/iAmvNBF3Kbj3l3dtj51M8ri7bfKsxeB87vm2WHhDMCX
	7hK+Vk3R34a1vRndFup8v+ZYmGOF2ynt017n9TRGjCZ/5r9Zf5UG9gcOYojORcqfJHhmkGZIdja
	6K6IduHUZoVd79OyIo33fhMAwZpo=
X-Google-Smtp-Source: AGHT+IGIofF+jHyf1Q1A5YmkDMwujZlkcq6NnhCTWVq9V58kJK2WdBuo4vqtDJAoF6p75Moc+Y23OIWYQYIEYzK+XIc=
X-Received: by 2002:a05:622a:1c06:b0:461:2150:d59f with SMTP id
 d75a77b69052e-46363debe66mr3045871cf.8.1731617825253; Thu, 14 Nov 2024
 12:57:05 -0800 (PST)
MIME-Version: 1.0
References: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
 <20241107211428.32273-3-jiashengjiangcool@gmail.com> <zd5673eo7kqwg67lsy6h3m4zdpmgp5xzhr355ialwx6zhdopfb@7x3v5b747sqn>
In-Reply-To: <zd5673eo7kqwg67lsy6h3m4zdpmgp5xzhr355ialwx6zhdopfb@7x3v5b747sqn>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Thu, 14 Nov 2024 15:56:54 -0500
Message-ID: <CANeGvZVibHOsqdD+zw_u2yswJdvUu=Ssep9eWeAOcqmg6J-zqg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] i2c: rk3x: Add check for clk_enable()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: dianders@chromium.org, rmk@dyn-67.arm.linux.org.uk, max.schwarz@online.de, 
	david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, wsa@kernel.org, 
	manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_125707_121388_B95405E2 
X-CRM114-Status: GOOD (  20.52  )
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

On Wed, Nov 13, 2024 at 5:24=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Jiasheng,
>
> On Thu, Nov 07, 2024 at 09:14:28PM +0000, Jiasheng Jiang wrote:
> > Add check for the return value of clk_enable() in order to catch the
> > potential exception. Moreover, convert the return type of
>
> It's more an "unlikely exception" rather than a "potential
> exeption".
>
> > rk3x_i2c_adapt_div() into int and add the check.
>
> ...
>
> >  static u32 rk3x_i2c_func(struct i2c_adapter *adap)
> > @@ -1365,9 +1389,12 @@ static int rk3x_i2c_probe(struct platform_device=
 *pdev)
> >       }
> >
> >       clk_rate =3D clk_get_rate(i2c->clk);
> > -     rk3x_i2c_adapt_div(i2c, clk_rate);
> > +     ret =3D rk3x_i2c_adapt_div(i2c, clk_rate);
> >       clk_disable(i2c->clk);
>
> you can't disable a clock that has failed to enable, right?
>
> BTW, although I like this patch (or at least I don't dislike), I
> still want to check whether it's wanted or not.
>
> Andi
>

Thank you for your advice. I have carefully reviewed the patch.
There are two clocks: "i2c->clk" and "i2c->pclk".
The "i2c->clk" is enabled and disabled in rk3x_i2c_probe(),
while the "i2c->pclk" is managed within rk3x_i2c_adapt_div().
Thus, the "i2c->clk" has already been enabled at this point.

-Jiasheng


> >
> > +     if (ret)
> > +             goto err_clk_notifier;
> > +
> >       ret =3D i2c_add_adapter(&i2c->adap);
> >       if (ret < 0)
> >               goto err_clk_notifier;
> > --
> > 2.25.1
> >

