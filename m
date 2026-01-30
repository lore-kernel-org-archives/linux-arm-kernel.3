Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04328E6BF31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 18:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRzLxy/Thum6f98qlHk0+tRPBb+9BLG/RuelqcCBlLY=; b=HfXKyrAAX6fVXRV7MiNNgugLeT
	tniGISjw/TJzdOU6Zc8sy+S1tqNzCKt4p74FUzc4bnYSTGrVJbvnu6bSkelJ7wcAD2lCcWytfiBS1
	hEUkPXp6VRpyeXLvFpvOMGDyQF38MX2Qs/t9WEyb9RTaOAr9n4tuwT3nJUrYzEsmzyY9sccJuGMBO
	Yr1GEYEbhrltHqOQyx2bJjVrzfu2jytCZPdudeDnckIpGvm+Bhi3wu2XM5NGOeT3kvPOul8Wkl+Wa
	68L92veZ3VO6p62N6qVwkRFdmCLhHWiirFPj7LNlPqQoh6ZgX6VlvE+nKHXQUEB8bjRqOVVffqCwo
	4YenBDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsnw-00000001nzi-0IF6;
	Fri, 30 Jan 2026 18:01:12 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsns-00000001nzH-11N5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 18:01:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a7a94c6d4fso11781855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 10:01:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769796067; cv=none;
        d=google.com; s=arc-20240605;
        b=IyfX2eGQDT02iZnvZ9oWBXZ0o5h9S88mzY7TQ07QJcm7pvFT9xgQFCzt3SydGM8sNr
         /DeLQniV6BeQ31Pz2y0SevxNT2IZY5Z/DEJNPrxQQ+Fl6LBuvXBInCbD1Uj8RLbxdoSU
         Tut1yfBE8KNsrDeEMiROgoWeffy1fWSJMfUX9Y/XbgbvHJZmw404Yitx/ZWhYF4pIE0P
         +c2rZy5uc5Du46l3HSY5hrFdUnPYycqMOF5sam4vG1bSaYwik3s8Q5fSubN6f6/6ZYpg
         E4pagYfxKKWfLI8iQrBTCQ0Ve/JzoEFtp1JwqX/dHbdQ++1WZZYiAfoZKbDM18c8wZ7p
         Dngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zRzLxy/Thum6f98qlHk0+tRPBb+9BLG/RuelqcCBlLY=;
        fh=2BylFtZ3a7elyo9RHUNDjz5JoarK//9CsuxcLl+y3p4=;
        b=EeZ6jQcLbChUC+BzCND1uJ6G5hABAJ240WyGblNSIm+13OGBsH8/vmSVVaznRrGfxI
         pNuBe81tBUtTL04ktXPz1nqPveHDudGDJh1ku1Q0Qd3F1nJa8dsR/ga8rPmT67dNZIRc
         ZHfnD68p2eNJSQlne+FXTFtXdw9sQiage8dXxY7E7Pjn7W0jY7dK/ciFm0gJ+ZjRqfGJ
         kYeqkMngcVf9lfR/bqkc+fpbc96iDDs0134uk9Xn6JJrBsiONGDMHToL4FF1YO/zsIdQ
         YC04F5pJQidbg3L53DgIG2wnIc3qnn53U+WEGIUYZ5C/qhlSlCuzjfFbv8mZtY6fSwa2
         jAug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769796067; x=1770400867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRzLxy/Thum6f98qlHk0+tRPBb+9BLG/RuelqcCBlLY=;
        b=WFCVvrWWsYf3Ehlufypb9oGDPukjNM4P2cAKOVHmHEgrtd2xCRv7lP8P7oSgQ/49+P
         DKzfcBWHyjca430swZM2hUq4CalXg24cZlZHDjei8kQDDEAlMnHO5rtGUIPRh3aTibqE
         0YKbE5jYXJaNdE9cWODW714azIBqJU7c6Cb3mzNnplfO10wjxS2/Muz6R67RlaETXXrB
         1yzTjQ4p/IVY1Cu/rs1JAGb4nxqYLy0YykgEDuKoiOZBcu5FTUhLze6dRnHNtk4lJFZJ
         beNPfWTt6JF1UBWHWsmFmt4qc06Y25v68L+QfAuGornZO3GzuUdbysEpoVpa40fLsGmq
         uO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769796067; x=1770400867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zRzLxy/Thum6f98qlHk0+tRPBb+9BLG/RuelqcCBlLY=;
        b=sZS+cYgZ9Hbo2Pe8r5GQG6U34YjX5ZNcPAwvoTCfHpCMikfNP9qybG6TLYl0vCauro
         MjkTENLBO9kcuZW6MlPhbk76jPG6DZ4Y+A3uZxTKxlVYfeeEC+O7zjPHY+oFJa8ky8f3
         PFjFo3aS/dzvpIBzDAzNzMozfnjoH6SydClnuUqoi5gVb7nZkTgft87Zl7YYwGSeAjHf
         Ew08R+6g6BkO6Gm52PN8dq4pkD6o0fEWBZ2P/AKnSTHGSJk513bNOmXYNTtWLkQ5NmbV
         YjrdhJwZCcUYlhqP51Do+dnMKruCk9AcUnQcv3CgvlnjFyyRidR5+9YJ8GfNsE4GCvtX
         fItQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7ujqd7lSr89W8p5tTk9X4pVRejvGduKsvncFP2Y1AdBKI+TSiir3zyhdN04cQ0Fm7P3hoSGsxmIlE36bdmBmr@lists.infradead.org
X-Gm-Message-State: AOJu0YzWKPh4caaT4WT01wd+ByIv2wkHpTrVjG949f/SxpHmprBU9psT
	gjz8MYyhq+l2Ra2j37r1+qtPaKbT7GQjEvDaKupN0JpRQKADtsWySH6PQaMcCusNvrlTyEGdhye
	tkoa5Nw5kwEa5bge81DUUCSjWPNL1qgg=
X-Gm-Gg: AZuq6aLfNbOUnBFmUWrwuTBK4j+w9u3DpYZPASAb30JVSDZcVdu5wkCWM8XuYA4IdC8
	/H8fvy2DnoP2GUX2SuND32RobDh/IxPvHM83eIsJhmTNV7W+qyZwHZndCl+zNH5yuEPwzLS8Xg0
	s5tmic2tJx1UuCe9HEFMn3FkqqtELhVxDgX2AJ3GyK9gkdX6mczVFeCVUPgoaVRB0xNL09WYs2Q
	6VY61RgXDsJ0LtjnEzsEEcCnIyWyb7p4zO1/5Rz+A5dCJBGrlWf4Dq99rvK6m+t7YlhNzhknPEW
	zYM=
X-Received: by 2002:a17:902:e810:b0:2a8:7814:47cc with SMTP id
 d9443c01a7336-2a8d96a2ba4mr35674015ad.16.1769796067106; Fri, 30 Jan 2026
 10:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com> <aXzsRreLzaCB6cVd@lizhi-Precision-Tower-5810>
In-Reply-To: <aXzsRreLzaCB6cVd@lizhi-Precision-Tower-5810>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 31 Jan 2026 02:00:54 +0800
X-Gm-Features: AZwV_QiFOzZg6P87AjjQNpa0BC_INIoNGOBqDMXaJiczCeTxYqTXqtMAmTPol2g
Message-ID: <CAN4SLj3-0NH232gauZs1+HpL2A0oE-QTh8L8BYgjKAwNVFYi0w@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_100108_291633_29EC579F 
X-CRM114-Status: GOOD (  25.27  )
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

On Sat, Jan 31, 2026 at 1:37=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jan 30, 2026 at 11:56:28PM +0800, Felix Gu wrote:
> > The function pll6_bypassed() calls of_parse_phandle_with_args()
> > but never calls of_node_put() to release the reference, causing
> > a memory leak.
> >
> > Fix this by adding proper cleanup calls on all exit paths.
> >
> > Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> >  drivers/clk/imx/clk-imx6q.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> > index bf4c1d9c9928..1d8e8f0891a3 100644
> > --- a/drivers/clk/imx/clk-imx6q.c
> > +++ b/drivers/clk/imx/clk-imx6q.c
> > @@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *node=
)
> >                       return false;
> >
> >               if (clkspec.np =3D=3D node &&
> > -                 clkspec.args[0] =3D=3D IMX6QDL_PLL6_BYPASS)
> > +                 clkspec.args[0] =3D=3D IMX6QDL_PLL6_BYPASS) {
> > +                     of_node_put(clkspec.np);
> >                       break;
> > +             }
> > +             of_node_put(clkspec.np);
>
>
> I think you put of_node_put() before if branch
I didn't put of_node_put() before if branch is clksepc.np is used in
the if branch.
It maybe not good to use it after calling of_node_put().
>
> rc =3D of_parse_phandle_with_args()
> if (rc < 0)
>         ...
> of_node_put(clkspec.np);
>
>
> There are more places call of_parse_phandle_with_args() without of_node_p=
ut().
Thanks, I missed that, I will fix it in V2.

Best regards,
Felix Gu
>
>
> >       }
> >
> >       /* PLL6 bypass is not part of the assigned clock list */
> > @@ -249,6 +252,7 @@ static bool pll6_bypassed(struct device_node *node)
> >       ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents"=
,
> >                                        "#clock-cells", index, &clkspec)=
;
> >
>
> this one miss check ret;
>
> Frank
> > +     of_node_put(clkspec.np);
> >       if (clkspec.args[0] !=3D IMX6QDL_CLK_PLL6)
> >               return true;
> >
> >
> > ---
> > base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
> > change-id: 20260130-clk-imx6q-9c4b8835fc26
> >
> > Best regards,
> > --
> > Felix Gu <ustc.gu@gmail.com>
> >

