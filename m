Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CB0D73EB5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 18:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCrEKDN74Yg1HcvVzMQvEOY6ZE2OP4wRbYz5bxWYTv4=; b=dKGW3dLYSaAAfKO/7b3HVmONbh
	x2ALvO+7pK0/cp8K/nibKiZ8/IY2g8nAsqc4cyXlGd3XdHWOT0kPrlynnZ63Tu6JZGv/v3Jcljt1/
	FDdHXdGwXojjwHL7lSv8YXGtH+gxIS1+iwOlwJLej+z98R8SR8hM/NGaqGaL1ezgnJ7rg9DNJpz0i
	pcEuEYwvOZ6AMqR6se1xQd2sUZdtmWkTTZW8C2JpDNRneyQv+RNbIHv6gpIwPFq6qkoBwD0ug9IOU
	nYIzB0MQVw8sH4nYXVO+AQoDSJ9qwBsh+JvxvPZ3IGF0Te8zxN+wT89jmRa6wLhzXylFUfkudt4Cw
	VDNAU8dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmFHj-00000002sDS-050J;
	Sat, 31 Jan 2026 18:01:27 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmFHg-00000002sD5-3cmi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 18:01:26 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so1886480a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 10:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769882483; cv=none;
        d=google.com; s=arc-20240605;
        b=iTBFF6bG7PjmOMVcFqILG/YF8ovBNx3Lwxgbrh8YXBYgN6QWgUW7m7LGrIbbMs+SFI
         bVSstf8FlR7i0BFS5w0Bq0fBYuMwhN4VUC/3lLUSau5Ux1n1rM8pehgrMUYmqvcEtf8C
         CuZakV3HyDxMM6y3BtrPayNnL5aIe1LEgybq57Fd8UN/v4SU8x+RcBiISQKFrYaF92ro
         yFSSO/0JGp98S0ddKb5IHOeWl4aZnVAqQ4RsUkSNz536qpLKSFSK5rZMsqBhQdvAWvcq
         wb4T/bAyoNVc0bxb71hHuAX9JgbYAtFIA9JVoxAADSdj0N180Alx+DDoLzkWKoj3ONDd
         oh1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pCrEKDN74Yg1HcvVzMQvEOY6ZE2OP4wRbYz5bxWYTv4=;
        fh=FUex1i2iaLik/qww8bdm9xuBxVsDAETvZl2MVx+vtro=;
        b=L3Md+G4u2kr41juOlyNO1b2AlOQkM5ztYswoPpfTgvzYE3lo/XTibZ5vBMQJL1Qo2K
         C8Q+E3NPFHWOvVxbgB8Ce7Q4E/k7J+qSMTDXyl0ZkZGY6SQAkQwGCuk0vD7GPHvp3Wqt
         JMV7pMqsDhak97NbkOTfCxADXyaAeHwEOgTSHuDlpWDk4l9J79/8mOk6gvgUieiRg3TA
         ttl+hOfdtums+4FNNCs9JnB7dVwL8L1NCHeWF6g+RE9rq+IxjDCOHCpdVZFAIOWiY06B
         zLXEnQ5y/MHS2fqWcQ0QpfuGU4+4CKbaegqGgWe55Z6sNQdwVZhfOvcEpqHJeZD+cERA
         LD0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769882483; x=1770487283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCrEKDN74Yg1HcvVzMQvEOY6ZE2OP4wRbYz5bxWYTv4=;
        b=IQ/Qq83H2/UU3EFF7FNtE5AOI+XxoDzxi+XHCLvtCoshZNgOCirz7mE0CMpTcxPRPM
         td9gl2F6pOnNPo1axd/JjdnXPTjt+DcGMGhUex3WggagUh5G+2Png/q+07G+8rh3tqaz
         3uh6WaId3eTlqxsy0pzzPN0SI+HzmLt2fx6ppuMS7Gc/G5uO1sh0Xtabc+0Gu8/RzuNk
         w8+9qRdhAe6qNIRPSQ36nQV4vQn+dPG+aO3u2aSSu+b/lM+RSWlWjJfmhJxy+hDYqHld
         uP02n+Z40HvW4iuE0b/Asjl6rY++gCB5lqCtxHbaJNRt+BEUUP1Llpzr0FSRbT+IjVl7
         CP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769882483; x=1770487283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pCrEKDN74Yg1HcvVzMQvEOY6ZE2OP4wRbYz5bxWYTv4=;
        b=U5oKVE0ohPszeIsOnMbo+Az9Nxn0i6cYqfXyJpDMzCyr3d3ZZ3+oSK3qROC6+snXeE
         OnpNHDF5axD5NAFJGJdhA+aedxCFOXkf8B8T/z4YQrOuzlVvvOWtW51qK0uIGtamwWnx
         UtzOAJsfQkkkfxad7UGfo31l9AxEgwvakD7UKLOHiD2rcAPMV/mU3BefTR9uWjHwMnCJ
         PrqDRRSTC4Pq6NPrAv1pNdrtfX872QMQaC6ZtXGYlSF3mCTg9GWMBjcBA7G3Y692NJUC
         Mg+YWWqJLIuefTIxnCbDtuwgo+AE69lyLPTv1BrGz6m9HrB72w4E2m2RjlD1pmyTzoRY
         QwEA==
X-Forwarded-Encrypted: i=1; AJvYcCWTYEFI/EPlJxlTVFqsNQ48JEOHtDy312C8EF770TYwu0RJgAG80noNQgHvIHxP357Fx1sQ4DNcYXL9yQqupISC@lists.infradead.org
X-Gm-Message-State: AOJu0YyGClfvG2mFZUoWO+7lzBsR2famf0Z8LNojbKUsIkZ/uiFaYAto
	t5IhGHGxil9YuPsDeWbfa78jofRE43ghqP9nnJY6X7iLLmE7c1kPHQIxazmK+4s0vTKlRnVYP9g
	kRRGoc7Se5UdQ6gVFQ7cJ2/FBlx3DpWk=
X-Gm-Gg: AZuq6aKvpJbzYa8PMVGOlUPDrqTD4BApGxkA4wefwWqNa7JitrvRFRr6H1g7yYTTqDL
	QaaBmzf2ym4cEixOrt3lyjumuIUlm+uVaHGuQU2bvIqz+X3zZkwptYgs1EQIrRC5b5OfQmi8oPU
	hIoXfbKeKayM5mdrd5NMZ2FDZdkVZCA/QyO8CtVAHibH9d17knq3Q/tnZDA0THepTjrVkDAARof
	jg6Y+u5WoadPDDqwaUp9/Zui2q44zfTHHLuSOyMLeN3ZmQCv/rU0fbFTrP32eLMZEyg
X-Received: by 2002:a05:6a20:728a:b0:35d:d477:a7fa with SMTP id
 adf61e73a8af0-392e0052a6bmr6468927637.23.1769882483020; Sat, 31 Jan 2026
 10:01:23 -0800 (PST)
MIME-Version: 1.0
References: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
 <20260131-clk-imx6q-v2-1-70471ddc99e0@gmail.com> <aX4q+W3Sjx5SRHrC@lizhi-Precision-Tower-5810>
In-Reply-To: <aX4q+W3Sjx5SRHrC@lizhi-Precision-Tower-5810>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 1 Feb 2026 02:01:11 +0800
X-Gm-Features: AZwV_QhLWLb-FDStR9zG6fjnRX1upvQjUilJNBF9vy-1P4S-LT2FD_90PT_gXlw
Message-ID: <CAN4SLj0D2PV9vFW4=dAF3ypAtA8JvhJpEut8Aumsx4JaMSEsiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
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
X-CRM114-CacheID: sfid-20260131_100124_930049_BDA33CA8 
X-CRM114-Status: GOOD (  22.41  )
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

On Sun, Feb 1, 2026 at 12:17=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Sat, Jan 31, 2026 at 04:11:34PM +0800, Felix Gu wrote:
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
> If ret is err, clkspec will not touched. So clkspec.np keep old value,
> of_node_put(clkspec.np) will put twice for previous np.
>
> So need add if (ret) check here. Or use difference variable clkspec with
> init 0.
Thanks, I will fix it in v3.

>
> Frank
>
> > +     of_node_put(clkspec.np);
> >       if (clkspec.args[0] !=3D IMX6QDL_CLK_PLL6)
> >               return true;
> >
> >
> > --
> > 2.43.0
> >

Best regards,
Felix Gu

