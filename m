Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE11E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZm9XMFo/ciEBfGF3Y+lnkNF8U3UY3ReBsxl649KajQ=; b=tX9Spd0Okl/fCOXPK5QRvt3FD4
	//O2paFXP84+Piy3pYYcaEkyMYb5SwyFald3WAZ3rXAO+2tAKJxaRSfBc2dYO4MvB0Jsn7WKBklq2
	uXCiySr68bWrAva+qdf4aR3z1TmrqwMiRNDLVQdzlGzhUW2SS1UsS9GRfG0W5vanioAhXNLTnAQZm
	rQGu5O4N9g2rwTfTS+fBzTsxWOHQlZjdq2Sqdm8yECwQQkfljpL8k6HMs1apa9BR/qpREE0Mrtc24
	WWdS065EhOkp5kEqWIntJAWgzz99pvIM/dunrozzDBPworeXxQP6eTN1SL8ZunKgAS0XwWmiBb2eN
	YyphK8VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBGb-00000005NeO-0ZQ4;
	Tue, 07 Jan 2025 15:13:13 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBFL-00000005NJS-0Cm9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 15:11:59 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54024ecc33dso1901790e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 07:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736262713; x=1736867513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZm9XMFo/ciEBfGF3Y+lnkNF8U3UY3ReBsxl649KajQ=;
        b=YMvoMJd/aEfbTw7iWP9p7E+qMmBc0beUc7trBtPZngVUJgN2ulQ+Wa3xi7+I3XLrsY
         TjWqRWJnB3NaAK/0nYm081v+/bn+1InJ6bPxUeJ7L7qkAMBqJR+WHkO+bPtv/i/IoVQB
         ZdM2Dv6GlX71iBjiP867Wdid3M3wmg79cQsM3cy8eaZ9UyVDjLBPsbjBDi9VwQPTSc6D
         X09M44xC+bTMO9/egNOEi1EWk2tWUteQvrmZdU9cWVB8XroHtXPVI4Ne1isecdcCrTMm
         ZWvr7Sa6BCvsR/L9gycwrL/eqBGzOCpokdTYSLFBtb6+CuzwOhiylAKhBAK1fhS2MfIg
         VvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736262713; x=1736867513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZm9XMFo/ciEBfGF3Y+lnkNF8U3UY3ReBsxl649KajQ=;
        b=wIIhR5mMMJJqgLGYfmeNJdEEpiwsS9xVpG+Ni3zgVzKS3FMiZPcBIPp2p/e3k7jE8p
         4buwkYl8DNDaybPm9nh8BQu9qXJCMpq86YZMRCl5HZDiIyCJvZOBKd5LMAoPsaW4NRV5
         D299sq79jc5/1Fif1dVq3XvX2voX5gUC508rkJFgpjZf8aEcF3N1tp0GB0WO0tZGwiOg
         Acyk3n3Ic7Ib/YWPfrL9dklCYYUjIvOpJ9nNEN2C7J1Nm08UUhB5nvhNIVAMWRE9/425
         2FyuVdiric7Jb+FpsQrX67cQKOowhvgluB6nX2V6176t1WM7Dug0AqjhlE3+nUi4RiwI
         j3Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUz0X5gi1913dwL6l7KWJRtyK7+qT8wm6/oEnvumGMcpWo9bNZfd5SvTDLL0I/frvuaiptrWkE8moItJNK2YNnH@lists.infradead.org
X-Gm-Message-State: AOJu0YyqUO8DAHS5qRakwsVUJSU1TLdhGhHU1vrw0usN4J7TX0ZnWR/t
	/VfC2anqmzI6ECiZsn5b4aF0o1v8tpPstqAbovRFpxz4Lo2pIzP9/dnSMbg91cMGsdh9wbbxo4X
	8Bk4FR3RKx+cAJzWsbz7aLyTXldNxqSX1rUD/ww==
X-Gm-Gg: ASbGncsL4RDocn7Icn6ptPkzGKti7M5Fua+I44dRAUxOEq7KJeAXgNmS/m+N6ieCj7v
	60jntZ0DCIGhLbUCyZIT3rGlXhRf/X3R5vifJ
X-Google-Smtp-Source: AGHT+IFehNeFi1I1U8aRoGxDWj9mUKo0jrkw2SzoaqZnp8E335DNw61G6ky+He7/h1LD9gQ8ZxOLYHtYW+T3a9Y3M0g=
X-Received: by 2002:a05:6512:33d1:b0:540:17ac:b374 with SMTP id
 2adb3069b0e04-54229540453mr15473106e87.25.1736262712723; Tue, 07 Jan 2025
 07:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
 <CACRpkdZy7HgkT-FFJh=ubXhdcBRa-vbaNmHC32E3djZdHnwdYg@mail.gmail.com> <47ca3129-245f-481f-9ca1-ed9d8db6e990@collabora.com>
In-Reply-To: <47ca3129-245f-481f-9ca1-ed9d8db6e990@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jan 2025 16:11:41 +0100
Message-ID: <CACRpkdarstoQW+ZBi+MWxEff_=h8bPo9+fwy=LW2uhWRuQ6YSQ@mail.gmail.com>
Subject: Re: [PATCH] v1 pinctrl: mtk-eint: add eint new design for mt8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com, 
	sean.wang@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_071155_096309_568FFCA8 
X-CRM114-Status: GOOD (  17.08  )
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

On Thu, Dec 19, 2024 at 1:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> Il 17/12/24 14:45, Linus Walleij ha scritto:
> > Hi Chang,
> >
> > thanks for your patch!
> >
> > On Tue, Dec 3, 2024 at 2:13=E2=80=AFPM chang hao <ot_chhao.chang@mediat=
ek.com> wrote:
> >
> >> From: Chhao Chang <ot_chhao.chang@mediatek.com>
> >>
> >> Change 1: change EINT from 1 address to 5 addresses,
> >> Eint number is stored on each base.
> >> Change 2: Compatible with 1 address design
> >>
> >> Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>
> >
> > This patch looks good to me, as preparation for mt8196,
> > but can one of the Mediatek experts please
> > review it? If nothing happens I will just apply it I guess...
> >
>
> Linus, that's something like the fourth time that he pushes variations of=
 this
> patch which do break all MediaTek SoCs in a way or another, leaving only =
MT8196
> hopefully-functional.

That's unfortunate, and I see there is some annoyance building
up.

The maintainers are here to protect the code and the change
would have anyway just been reverted soon if it breaks stuff.

How can we get this contribution on a better path?

Chhao: maybe you can split your idea into smaller changes
that can be reviewed and tested one by one?

Yours,
Linus Walleij

