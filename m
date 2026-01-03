Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92C4FA3750
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 11:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmnAKAfv29ulmMb0BC0UKs0MVt+IkK2zMRYsdR6rhaE=; b=wPdsa9YGByl9W5kjlJ8UmFsBUx
	lIiUANX2UzIMLz2AauHM09+mcbupQso3OLXMEp75q7S4VxQ6Bga7u4c2nv66Pg9zuNVbCxrXbuOYC
	HILrMsiI10k0YjU2O/TLze0cSyI6HX3J6P0IWtXKdLKML/jVkxHEU15b+fb7hBJA8zpzoN//dyxKP
	eP8/1WWRHZH7o+ilGYstJ2Sw8NrqZsaORrIlqxzfrxeyqyclssPFFofEttLsm39+nyflmZGwTKxsw
	gdT5XoL0085G1f0U5EgP/kqhpCqJnKnhUCn44/89+n4xcXQYZ2auXlUIq0eVYlukjV4rQ2cp0YPUB
	jy1CP4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc0Fd-00000009Kvr-0oHu;
	Sat, 03 Jan 2026 11:56:57 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc0Fa-00000009Kv7-3qlu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 11:56:56 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-64d80a47491so1342856a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 03:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767441413; x=1768046213; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmnAKAfv29ulmMb0BC0UKs0MVt+IkK2zMRYsdR6rhaE=;
        b=SPiPNadf66kJfrnPFE2V3qjm5DTW3Jua9WbbxBs35oTU0QWzLjmvXlUzhoW2+jxRQb
         hZfSG+yjPPbXalW7FRiwICp/6eHycXb51dmjLiKxs9qwEzPbrC/96KRSV1+sgYcSHBNn
         LaequKQurdS8kNC5hIebSbYiCIV22jxKj5pK2pBlp+qUXgalCik7s0UqR2iE6n2fhZIe
         bZwV+jEOK0bgToK6ztf+5I5ulWZf2fKDwIx4M4EJk6xq0V4hVSTFLpR3dbFRT62y/k+p
         fjnInigklixCQ50NUBw9dNB4jr8Kb5qeeWb2jdWHtA51T9V62R2F/v0wWPM9QAI3O9A4
         vrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767441413; x=1768046213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gmnAKAfv29ulmMb0BC0UKs0MVt+IkK2zMRYsdR6rhaE=;
        b=B3iqTqgHnGn6SJYDRX0sS6z/qz309BE9oX1HwvWFSBxju3nEUrgRfeSQxXPhNfabf0
         8jBgt/HoFHPB7ULdJ5bOKsccWHNtfnLMCFbilZPQ1Q1NGon7ZZNtQm68Jx5HYbhsJwbo
         YupBhZwnveat9bVGeSaCIiHUTIVk3Gdu+shn5X/gkqLMUNoW/CNbebz0FWzPTrvCzp/o
         0DqKP5817ikAU5lFNW5pGDvcHAYXSOBqZ0woKLmPBFJVad3hJnGoA6W3xvFX4yf7+iCV
         IEtwDaM1/Agjxb9898Fm7STqXMydlUrmBx4wvSyDkLhh+jj7+P2Uh4D/qusUaUVEfJid
         cmBg==
X-Forwarded-Encrypted: i=1; AJvYcCUz3SGADKiHRt3q90IxnW9SWmiWPpHrjIayD+odegUlKu3XCzrC2/0MmMl/y5rKplqT/JTKIoivbf6xd15bDJkS@lists.infradead.org
X-Gm-Message-State: AOJu0YyOB9CKP/1X6GnZVFquujWCLN+yg68k8Wqq+DIb57FYgH27ujWO
	SgQlYxl61tMJtACBKhDnV1pJ8JxtJPnwiHWAwHBfSqxkTPUK5uXGnW0ApMythR5DfjgDzNb0bEO
	Cbv/Fd6Yq4gTztenYGbv6T6fuzwiMVrU=
X-Gm-Gg: AY/fxX6gozCAwUFH23hW+jbsN+OrubIknM373efO1W49zNOJHndS7BXG5fQpcBfhNN8
	tHKbCrunX+5M8rGzDTe8CIXHv2HCHNo474uqQ0Itme5BUgYI2OB6y65guGL28k0a/idT4weHU3I
	WD+o6ADcVpKOo/5NkUzQJL0NRKy2Sq7eXxun0XgKJYhOxbnz/fXnyk5qLW5n9ya6Fm0ohPDzju3
	7MkZYsEDWGDKgxYvzVp41/RAOf1McB+zZLcoclD6L3B1rudo4f3YLAD+BHETV8PDqw=
X-Google-Smtp-Source: AGHT+IF2b3MvhL62iZeikJ+ttx+pza0Q8AuLmmDSQvLMMwKTmV2H/BFIvhu8dzQh+T0cfdAPWyIo8+97JC3VbvgZOtQ=
X-Received: by 2002:a05:6402:2750:b0:64d:4149:4924 with SMTP id
 4fb4d7f45d1cf-64fd4929c52mr2235323a12.4.1767441412727; Sat, 03 Jan 2026
 03:56:52 -0800 (PST)
MIME-Version: 1.0
References: <20260103052506.6743-1-linux.amoon@gmail.com> <1802774.yIU609i1g2@diego>
In-Reply-To: <1802774.yIU609i1g2@diego>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 3 Jan 2026 17:26:37 +0530
X-Gm-Features: AQt7F2ro1kfUI7JqsGT_zw2XVqyjk2_hY7-ZX3rtcNoyAWEVImrlYTmVULYv9uo
Message-ID: <CANAwSgR5RxmeUA-XdTCD5tr9SjPt4EqdH0W305tzsgh+73F7bw@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: rk3x: Add support for SCL output enable debounce
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	David Wu <david.wu@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_035654_996151_476EF777 
X-CRM114-Status: GOOD (  18.74  )
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

Hi Heiko,

Thanks for your review comment.

On Sat, 3 Jan 2026 at 16:09, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Am Samstag, 3. Januar 2026, 06:25:04 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Anand Moon:
> > From: David Wu <david.wu@rock-chips.com>
> >
> > As per the RK3399 and RK3588 datasheets Rockchip I2C controllers featur=
e
> > a SCL_OE_DB register (0x24). This register is used to configure the
> > debounce time for the SCL output enable signal, which helps prevent
> > glitches and ensures timing compliance during bus handover or slave clo=
ck
> > stretching.
> >
> > Introduce a 'has_scl_oe_debounce' flag to rk3x_i2c_soc_data to
> > distinguish between hardware versions. For supported SoCs, calculate
> > the debounce counter dynamically based on the current clock rate
> > and program it during divider adaptation.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > Signed-off-by: David Wu <david.wu@rock-chips.com>
>
> Signed-off-by lines are in the wrong order.
>
> Original author first, then yours as you're the one handling
> the patch last.
>
Ok, I will fix this in the next version, with a new feedback,
>
> Also, does this fix a problem for you, or is this more a case of
> "this looks useful"?
>
Actually, I am investigating a boot reset issue on the Radxa Rock 5B,
Specifically related to the fusb302 Type-C driver. So I was looking for
type-c fusb302 module to communicate with the I2C protocol.
I submitted small changes for this, waiting for feedback

> Thanks
> Heiko

Thanks
-Anand

