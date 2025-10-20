Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82602CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 18:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LobheSjDQzmXm5jTVKxbVYkJzFJNe2SiM69pvM7Dmgo=; b=YwG8GyrAwkzfPtOghPRWnVCKpE
	/iHjBAA2vyJY5dIfotJrVP/02POu8xhHx1/9NEOsK69Cru3XEUG8L3CL2WladFZkZLQQX7YoBtQE+
	zLVVus/Vh7RACiJmFtDm1CX6I4aUDPgeKCxy/7ydNHuhvTFRexEQxYTfjttN5OGZWZjKuYGZXuwbR
	DVb78V+KK/P4Xts3XMSBeglyBuVN6F1X5zGdeYEwhcG8UrvU3jN/KwkfJu3lmSAsPFjIA+fhu+ePA
	R9/VR8+Y277TOi2OgCM+0MB0r84/wB1zL4YOHecbnRhxP0cCEpNwkQ1Zkeg2+1BtmZIYaBo/3ocXj
	7bupGvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuX9-0000000Ec6L-0fgK;
	Mon, 20 Oct 2025 18:23:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuX6-0000000Ec60-0FcD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 18:23:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso21268405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 11:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760984578; x=1761589378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LobheSjDQzmXm5jTVKxbVYkJzFJNe2SiM69pvM7Dmgo=;
        b=lJdWK68ltZb4R0bzTWgYzRJnTbKQ7gGngEokdjexbYZys4By6Bhp9yueCiAHULY+m9
         0ezx4dIMZjmwHYaY/8Opybw1u89ZwyX+vMYLrgRmyaxg4d6j+gKjsH1iRbjqmMVquyY+
         cysv9OC1oP7AjONDsWkg8PI+1B4ANxYYOytxfxNcj71a5n5uPntFEhkfQ9RHJd/XZJRw
         pvoJ0z5pKD9C05YjLBwh4pc02KV1SBOa8ta+/JYD56m3ACo12DQEYtK6aSUf+e2FnPTL
         y8M2r0N7WhdICdc/GshQ0VVsSLz1vHGuWEG8ixCYfYRs9vTXZBz4m6fQRmVz/VhKXWCM
         xZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760984578; x=1761589378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LobheSjDQzmXm5jTVKxbVYkJzFJNe2SiM69pvM7Dmgo=;
        b=IYUGldivwkD4Q4PyxbS4S4klsbnS/lHdeW076Bvk0svxClDVaJGJQeCUs3R9f+15vY
         buUusV5m282tcq34XhL+HlA+Pp4zkv6QR+teR7H6VC4wP/jiXTScmtGmdUB5Z7G082zW
         Ct4kvrGS/RwpOv282Ugzy7I0FW5Jm6P/F+f052/P3IKYMrqXHmIFG5qlsqK9973qmzrA
         3FsN17BWHYnPD7k2kz/Jq5HYeOq7veMaNvhAVnR5BV9pgXzmXLB0szFUET7BpwG2Ornf
         b25usGxggacFtXlQECVf6n4d+fwRVuJ255iXQA0H4vIw2tCGlZuWfBqdP+QAzViinkk1
         x1ww==
X-Forwarded-Encrypted: i=1; AJvYcCUwwHBt4JzERrdwivvthoSJ1CKIwHET+BvESwF6LsNMmA9qNayqhj6P6rwZoaSjAPclpk+t3rxDOzqj/Zk3Bfjy@lists.infradead.org
X-Gm-Message-State: AOJu0YwpIdCelsVWHwo7+nCZkXfXmGmAv4ZY5b+zl5/Q/s2eSckahE6g
	RC+CCjre59gcTM7dCHg6Z8Tc6G3q8epgrmEFX4aeOK4lZsKJ4O7N0KAO
X-Gm-Gg: ASbGncvjMi791ApPMg0MglQbGg5bBbM1ydHKJhQCTo1/Bff6ln2UZLxQ1Jb8AQNJ0uH
	OKfKSBnLXrXAmmdUJgfSFluUBpKruFnFQ8Po+k4BhQO0X+KgHsiSYOwBHNrxLgiV15eaK06594Y
	qLYNh+3tv+by4A3aGYB2DGQfLpKyaEhuw4nKQzLksBNKuz9zBtS9auCc0eEadRinYU4ElEYJIRf
	CCiXvZwHR4pWFqvKqQNnhQCUU2BF9sHTY8pcXydNfYhiYjvDKGjTGxeyR5XaUZDP2CvXZmd5vKj
	eCquYER6eNUq5sczmKOzE6wjhoY3tXAxDr0YR0cWNariilV9q1t/b5IzWn35ys2moO9zH13PlLk
	QQEXycYwq63NdIWnwp5/hWb8hH34Q3NKc3R+ICAGXmol0yv7TK0GWKVXhuVxnyn55YDvs/LHWP/
	mJ02bp+sK2XPQZxGDEAGNkMXajetLlEmx2LLcp/z+NdGgKNYn84C0di2z2dw==
X-Google-Smtp-Source: AGHT+IH8xdImUVWc08yxtV5+NexJ4U7oKJ1he449w6/L8td0W1j3sEp5QRRipKGJLDowyWmFeCZmFw==
X-Received: by 2002:a05:600c:1f93:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-4711791c66fmr116218965e9.28.1760984577798;
        Mon, 20 Oct 2025 11:22:57 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a96asm16569602f8f.31.2025.10.20.11.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 11:22:57 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum
 rate
Date: Mon, 20 Oct 2025 20:22:55 +0200
Message-ID: <1837721.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <CAGb2v66osdLJa=_nTxz9wppUkxvu2fuS=NgYN8fKOUOLHw6-Ag@mail.gmail.com>
References: <20251020171059.2786070-1-wens@kernel.org> <8591609.T7Z3S40VBb@jernej-laptop>
 <CAGb2v66osdLJa=_nTxz9wppUkxvu2fuS=NgYN8fKOUOLHw6-Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_112300_113010_5B15E5E0 
X-CRM114-Status: GOOD (  23.58  )
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

Dne ponedeljek, 20. oktober 2025 ob 20:09:18 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> On Tue, Oct 21, 2025 at 1:52=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne ponedeljek, 20. oktober 2025 ob 19:10:52 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> > > While the user manual states that the PLL's rate should be between 180
> > > MHz and 3 GHz in the register defninition section, it also says the
> > > actual operating frequency is 22.5792*4 MHz in the PLL features table.
> > >
> > > 22.5792*4 MHz is one of the actual clock rates that we want and is
> > > is available in the SDM table. Lower the minimum clock rate to 90 MHz
> > > so that both rates in the SDM table can be used.
> >
> > So factor of 2 could be missed somewhere?
>=20
> Not sure what you mean? This PLL only gives *4 and *1 outputs.

Right. Nevermind then.

Best regards,
Jernej

>=20
> > >
> > > Fixes: 7cae1e2b5544 ("clk: sunxi-ng: Add support for the A523/T527 CC=
U PLLs")
> > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> >
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Best regards,
> > Jernej
> >
> > > ---
> > >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sun=
xi-ng/ccu-sun55i-a523.c
> > > index acb532f8361b..20dad06b37ca 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > > @@ -300,7 +300,7 @@ static struct ccu_nm pll_audio0_4x_clk =3D {
> > >       .m              =3D _SUNXI_CCU_DIV(16, 6),
> > >       .sdm            =3D _SUNXI_CCU_SDM(pll_audio0_sdm_table, BIT(24=
),
> > >                                        0x178, BIT(31)),
> > > -     .min_rate       =3D 180000000U,
> > > +     .min_rate       =3D 90000000U,
> > >       .max_rate       =3D 3000000000U,
> > >       .common         =3D {
> > >               .reg            =3D 0x078,
> > >
> >
> >
> >
> >
>=20





