Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CC6D2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 12:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZp2uYJnywwdgCrteoAFDiLSewAt3VeOOdwmUlnDeGY=; b=x68Ad3OY9Wrg9rZH1onYuHLr+F
	5fIqowrl99wGVJmmnvyKV9uu5LjCYucrJuKUyTTk9GLxCmKu08V0OuVQZtxjnBQUtAb0XPcbS8C6S
	PC+DePr8933XkIBso05r5qUiGgq28YfwYyCEYRXE+4Yon68qceGYigopITG4QenegT0p2xuET00mz
	mWGYBEv39Kv12xig1y64HONbus6e3cKkjlRW1mipZj+YE3QUUvI+HaX0F8nC4pAKj4nELRqqkjRCg
	wdKmbYSF33oCWqIAgYP+snVwLGO7BXUgfySjFaSjFWcXZqH8QVXu0ZlBfEcCyo2ADUnKBBbg4ZEVG
	KdhEt+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdiR-000000076Cq-1H0E;
	Tue, 13 Jan 2026 12:41:43 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdiO-000000076Bh-23Xq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 12:41:41 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-12056277571so8890385c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 04:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768308099; x=1768912899; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZp2uYJnywwdgCrteoAFDiLSewAt3VeOOdwmUlnDeGY=;
        b=D/KPODYSxzKykIpPTl01raR15VP2SSUxjFfYpESmotWHu54VZicx9iMpbO1d1PaaxQ
         J+Q2pKJkug1Lc6cDdWRee0uj4rBPXthQGZzrQyMzF0XzsD9BpmoqPZnBOSj62mLmPnlr
         597YvoXfNOEJTA0bDX5JyVeXi6aNGxno5CjK5zRai0Fnxg6bHlzeO//aovqJZ+jcghjb
         +jeKuoYy/LjbqX506kyomlHheQqmE0Bslt82ECBrn2Z+P+oTdWiOwrdwGINMYcwGErQ/
         NO5/V+GzXkRhnzO2r7mjqXLglV1disI8VuGyy0rPuUf76C+CZHnWdqM28TwMQgA+55Lg
         +TLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768308099; x=1768912899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZp2uYJnywwdgCrteoAFDiLSewAt3VeOOdwmUlnDeGY=;
        b=BLkN/s4TagS2Z6cGoNC1nTu+8iLOf6RnHf+uKU+OSbSKUHhyJdIeI1wn7zMY/A9JPN
         3Bz8d11kP53kQpBHdCCRYrK35NpUP10uKHqnn2/9Dt3/GXqaHnBwkmv8w4tm3kK/XQy4
         tvyIR17Z57/b9kS/AH4feaeN/q2sbfOM+QHbUzTVQe1dDV4djrOm7didLG8DjmWvOf/9
         s27EkTY2Gj92Yc9C5jT5epCWdB4tj4ADsCIzm8rEoAj0BWYEMB/wtjh8bSIpUyYuOd9b
         65ZYYkVYr/Nv9DQV9yIX/NmPPkBfVlDHVDzxcaJzjsGghB5kwElFHS6vq7iJh6BE4m72
         HOfA==
X-Forwarded-Encrypted: i=1; AJvYcCWdMMlX49VKtu1lyE3zXI5yuv6z3p/BswjET11r4Y22rbT9bEu7Su1NOCJwN2Qi0jJ4wP/lCWdN09Xin8ENAawT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy208HDfzdwT8NedoqYqERuH4oBDthFhzouzy/ffBZPP+k3hGy9
	3BxUfBjlaOg1Kf3sGYhX/WCI4fljn1Q5+m6PpI5C3TJRX+PhEeNkre/ucL03wH/QRii7eFLWqvZ
	qJst0qEDgirqd4D3rnEZi9f8lna3HD5o=
X-Gm-Gg: AY/fxX5VVLoye/6KewjTLbsifQVoK+b9tDtgHKgFEiyYqgZWYxLFfn21pv/p/E31ny+
	fPM4e8Tay613vcIErrdtacCnWU2w4loug93WmgNim9D81ziHdQVWNYPbg8MGIiJ0n+lfVDZpk6p
	AOgyPwI5CG+iVKwR8B2yDt0XJfqyz4ALbjFG28zTF1WqPGLB/+J0dlrniUQx71/qsqoWjdy8SX9
	oU8oU5syP+ZwdctClzLuO+D6yGQ/xWglk0pkTjJJiIzc0lCkHQz8ESzSl08KdFdkCOLAC2qloqW
	MOafcORCJHvsVy5O9bprVwIitHlQVJ9NTbr8uh5/3bRnd1Qi603qVq6J1TSldG2JIpg2kJP0XTy
	LqG60wy9NKA==
X-Google-Smtp-Source: AGHT+IGGt6V7Yz/k3MX0rPgRyPdKkJZSuXllz3mGtUOW76DiNPwxTi0xi3pikWRgsy1R8i1Svd5yXzdLFe/FFbB/yvQ=
X-Received: by 2002:a05:7022:6b8a:b0:11e:3e9:3e9e with SMTP id
 a92af1059eb24-121f8b9b014mr22821460c88.49.1768308099357; Tue, 13 Jan 2026
 04:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20260113-v6-18-topic-clk-fracn-gppll-v1-0-166e674aabf1@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v1-2-166e674aabf1@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v1-2-166e674aabf1@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 14:44:07 +0200
X-Gm-Features: AZwV_Qiv0PmBxqAtHJLJya0dhZuXAfB0G9BuxIA4zBO7u9IIMz-d50P0kVBVrtg
Message-ID: <CAEnQRZBfVjX=vpzrU9sQuOmZGt-NY0P6dt1dZpciLVFa3w2bSA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_044140_529234_809473A2 
X-CRM114-Status: GOOD (  15.96  )
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

On Tue, Jan 13, 2026 at 2:29=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Some parallel panels have a pixelclk of 24.19 MHz. Add support for
> 241.90 MHz so a by 10 divider can be used to derive the exact pixelclk.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-frac=
n-gppll.c
> index 579f76494eb041dfba58b8cd10eb2453a0ec4178..eb3d5e3c53946f3caf83bcff6=
54c6481611375e3 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -89,7 +89,8 @@ static const struct imx_fracn_gppll_rate_table fracn_tb=
l[] =3D {
>         PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
>         PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
>         PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
> -       PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12)
> +       PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),
> +       PLL_FRACN_GP(241900000U, 201, 584, 1000, 0, 20)

Can you please end this line with a comma so that next addition at the end =
of
the array will create a simpler diff?

Look for example at int_tbl array in the same file.

thanks,
Daniel.

