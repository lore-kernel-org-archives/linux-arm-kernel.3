Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F88E7DEF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DwlNJWcSSWiB1RJVuYLclaV0gPVuBf1c2xRk/9v2KU=; b=RHJbgLxmzqO45WsfvTgawy1G6w
	gbL/fx5XLuGKeLSEeyrbjnBSkVoIN/6J1KWy3snJ8SzXaCD3qu9feGBwozcDX0L7Td6Hln8NdR+Uq
	0w0xCHjLrvYrpEllSrPXrfvLBr3yyn/55zjj/gZmEt+71pEJbOxgxbWd/B6jmfMq8UYxXBgQXOMpT
	oGKHLoQqH+vIwx2iai1PHwdwbN5HrgSZpCL77hrSDjDBnTaQeP+UhC68UxACWcwig1XX5RYoGDFQ9
	/WFkahNT1BBVmdCZLscn6p16gMN06pBR28RI6PfDGeF/j0yPyFQxE3vp8kO8q20BsPMnQfdePE4uB
	KVW27vNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuk1-000000055Ki-0h6c;
	Mon, 02 Feb 2026 14:17:25 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmujy-000000055Jy-49bs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 14:17:24 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82307c6902eso2283474b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 06:17:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770041842; cv=none;
        d=google.com; s=arc-20240605;
        b=INV7GLlTOEik1BHxZNK/wTMguMLGrtYt+c0mW0Jiv99+MJeQSkey8IGYPM2a6r3NZV
         uOihpfcAb221bT9lz4fFLrfr5CoOSC4/sXnKSbxzp78lSpDAUmDdJnGWC/Z4M5YAahe0
         JwlX+LuPKYhPaP2qlRDB5uXs2CbUVpvI0112Iw0ZJAndN2IiYRCwQpqqD5IQttKBZn5v
         bjdqQkPhh/fjcy/GoXsGGGhObukzLj3YaTGFR0uadbcsqz21l0LpWDtIFsOAVn+hqHas
         GvrCd/07DE/cG8mn/3Pd1KqDz4mcpGpZ3DLvUOXOK0f0FWtoha4wnk9GRJUH9132rknd
         pWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6DwlNJWcSSWiB1RJVuYLclaV0gPVuBf1c2xRk/9v2KU=;
        fh=zYK57brWoc12hdKgYH8GULMiBguMzpN5n9be93kPA3Y=;
        b=jV2HcDx72fClwNZZ0sEwfr/PrrKRRYRoTLh/oE9un2w4NBoDiMSrrBtT5lQ6MYOdta
         V4rRjgSaswCl3/Orh7dA2SFylfljiB/2PtR/qqRo2W6f8R0KxUsy9sAHDhNE5saJEJKI
         COMW80lJcYc7JkMkOsqACgCPkqDcMq3wOabOy0+g8WCeLV4KqWl488Hu7wSmhUnFP/le
         NdNK2+WEH3nqHZCjLgIfo/6T68LxCVxiR2LgVfweWqgPdCXyadNYtHFxY8jUJ26hMnWE
         rcb7JKhM7TpNM/cB9fKPqeYQz9oBqpabh18+rPyiVrtt7vcDZlf+uord6mBWWYA36bFG
         c80Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770041842; x=1770646642; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DwlNJWcSSWiB1RJVuYLclaV0gPVuBf1c2xRk/9v2KU=;
        b=OmHvxZzxuAZCRSwlAvEkBsQwxAq8ZlBa092aaikuqe7lIu3xrzYdI2F3un/o060Vgt
         Awzm0+4DdDHPKOepniRxDaS/UIG+x1BNBXexcfwfbWOZcqvSLT/9CtUb2Mv7AqvInmLI
         TpKuj5eIkbY/a5DzkzleZkewMYuNAajbMlO+DEkuFLeA303+Dxh1PogRqlU//S81ZLBV
         tSzIw5KbSfGY8dlO6hoVojGKXfkXGU38hMfR1g43l1ef3BlbETX1oP7ll/xqjqcJt6A4
         mjAdzCP5LWLIyX7apNXI1lO4TUyKgugFgUS5Lxm84xrYzmq4I10ZpdF/bTB9i+ayJk3s
         JUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770041842; x=1770646642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6DwlNJWcSSWiB1RJVuYLclaV0gPVuBf1c2xRk/9v2KU=;
        b=mCzLW9cBE0l6I8kJGmjarl3i2TUnYlUJkdBNfzKamfeae6nCogbQSfeHnAOong5R4Q
         2VH6+MrWPwsxHsInE+OxREiz5FZ7GF8B2IFZyTBeC18IQDybGaXeVYQBsgPOqOItXhrj
         l4dWuTLqT+q1ZJyMMPLTkk+568PeMf6hPQgXVcnWFPN4SeKJI5iCJQw/4oF9DLP5mgxl
         BNtPzn0foertx8kfuNjUUdxFjbIFm41//3j7d6wZI3GmEnBix7MP1Ai9xB+m9IwoPey9
         TLaAugwogXErfHEig4UeZbXqPIezaghP96ij0DxoZIa8Sb+zq3Y6pb+OJDLTDUpvXJ5t
         Kv/A==
X-Forwarded-Encrypted: i=1; AJvYcCVSqZ5k3V2j5uoiFwpk1SaYCVKdBm5GPVM7nHsGLbtxfH5XkdvOVCT715OymnaUVXxoj9Ja8mKFheOjZWyYVi0a@lists.infradead.org
X-Gm-Message-State: AOJu0YySA++vZbv55sorRu6xCNdjvc8FQGOyjzMGCHMn6ZZdGpUErmEW
	t3QG8iwEm8E9JreVdVF5HwVkMjcD50cbR3QYhILgFFUaNl/qns0fEkzcD3lu7/aycDuguvZIMWI
	aclP/VjDXEXvbULbXM3WQ8nnS0dqnCqQ=
X-Gm-Gg: AZuq6aLLM29qYyeToZXKNgDBuuN7M9V/40WlA5JLJxgx8m759bGvF7auLKcGPiZRxke
	WvTTiAYr4ifH+Eiuxj4+Ehjmtu+Pmmp/SwZf9K5FrlvzKaRFwbRoxIC/rUhKKCTNUe6ImGhaQh7
	C4+TmMtROdDvlu0bJUVeNNG9IgWoOu/puepf8TMAi930ooiJJnkyQnL5X4ssXY0Pv2gP4cW81mK
	ZQnRp5HDsUIk3bVOD3jQJDDLwPQPXUpL1MdgX6XkJ5BTDIFFG0UFsL9C5h0Nk3wK9EhxE2EGaTq
	iIE=
X-Received: by 2002:a17:90b:5145:b0:34a:9d9a:3f67 with SMTP id
 98e67ed59e1d1-3543b3eff19mr11142088a91.33.1770041841526; Mon, 02 Feb 2026
 06:17:21 -0800 (PST)
MIME-Version: 1.0
References: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
 <20260131-clk-imx6q-v2-1-70471ddc99e0@gmail.com> <aX4q+W3Sjx5SRHrC@lizhi-Precision-Tower-5810>
 <aYAGMAE7ppXP/lbR@shlinux89>
In-Reply-To: <aYAGMAE7ppXP/lbR@shlinux89>
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 2 Feb 2026 22:17:11 +0800
X-Gm-Features: AZwV_QhoCxlCzLAcnWkBO4ogn0VW2M6mcHRnmBpiFBphn4q3UInMNacf8_hKx4Q
Message-ID: <CAN4SLj3AaM8qiS=DefEWT=EZKQJ6MVa2zEFhU4vgpJZzDBFq7g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Akshay Bhat <akshay.bhat@timesys.com>, 
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_061723_034993_BB76919A 
X-CRM114-Status: GOOD (  22.83  )
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

On Mon, Feb 2, 2026 at 10:03=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Sat, Jan 31, 2026 at 11:16:57AM -0500, Frank Li wrote:
> >On Sat, Jan 31, 2026 at 04:11:34PM +0800, Felix Gu wrote:
> >> The function pll6_bypassed() calls of_parse_phandle_with_args()
> >> but never calls of_node_put() to release the reference, causing
> >> a memory leak.
> >>
> >> Fix this by adding proper cleanup calls on all exit paths.
> >>
> >> Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
> >> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> >> ---
> >>  drivers/clk/imx/clk-imx6q.c | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> >> index bf4c1d9c9928..1d8e8f0891a3 100644
> >> --- a/drivers/clk/imx/clk-imx6q.c
> >> +++ b/drivers/clk/imx/clk-imx6q.c
> >> @@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *nod=
e)
> >>                      return false;
> >>
>
> One more comment:
> Put one line here, "of_node_put", no need duplicate it in below.
Hi Peng,
Thanks for your review.
Frank also mentioned this in V1, but I think it may not be good to use
clkspec.np after calling of_node_put().

Best regards,
Felix Gu
>
> >>              if (clkspec.np =3D=3D node &&
> >> -                clkspec.args[0] =3D=3D IMX6QDL_PLL6_BYPASS)
> >> +                clkspec.args[0] =3D=3D IMX6QDL_PLL6_BYPASS) {
> >> +                    of_node_put(clkspec.np);
>
> Drop this change
>
> >>                      break;
> >> +            }
> >> +            of_node_put(clkspec.np);
>
> Ditto.
>
> Regards,
> Peng
>
> >>      }
> >>
> >>      /* PLL6 bypass is not part of the assigned clock list */
> >> @@ -249,6 +252,7 @@ static bool pll6_bypassed(struct device_node *node=
)
> >>      ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents"=
,
> >>                                       "#clock-cells", index, &clkspec)=
;
> >>
> >
> >If ret is err, clkspec will not touched. So clkspec.np keep old value,
> >of_node_put(clkspec.np) will put twice for previous np.
> >
> >So need add if (ret) check here. Or use difference variable clkspec with
> >init 0.
> >
> >Frank
> >
> >> +    of_node_put(clkspec.np);
> >>      if (clkspec.args[0] !=3D IMX6QDL_CLK_PLL6)
> >>              return true;
> >>
> >>
> >> --
> >> 2.43.0
> >>

