Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B0CCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 20:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9ttC13+Szmw2q5jUZhmuOOwnwu09uPEZ6e3y79ttiA=; b=pSY9BVKlE03HU7gg5el906Dghw
	jLDEo9hHn8APTpO+5uAoUCDRnflTu5pF1FeUSdOCvMTIdnzFDlwIDgDN7ARbwNfm9lOIzDRAzqzCX
	Q/GvwTsZGuLVHT8NcDu4uvuIQA2DU0Q5kVcfcNijve9hLZjoSQYL/Qs9h2TmeCO2eduCeYvibisms
	31FrpfYxpOFVWNxCUBtW2j3Hm/Bp5maDSSiOUejKU0E3m1oG1mqUzG09oVZFetEVS0nw82Nvlf+Y6
	uGq4agrAwBBL54aqg2TkIT7SYJ2U87G7mMXqkSDvgkL17dhoiQN2QZnr0srnT3Svbp/9RcymcWLGK
	O7sxzWWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNlK-0000000ABlE-2Fxr;
	Thu, 01 Oct 2026 20:52:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNlI-0000000ABky-1W46
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 20:52:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8ACD060534
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 20:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C201F00899
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 20:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790887935;
	bh=q9ttC13+Szmw2q5jUZhmuOOwnwu09uPEZ6e3y79ttiA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Xf6brGexee1jd+IvaGPNkVrQy2PKgADseSQpBcrVIUySxZEOoK+mUTJJ8dFVoK/FD
	 xDfepoA02FoD1kqrELvMAkNMx2YzlS8445JeyM5t2P7RzT1qe6FWWFp9OGfYYHazmS
	 QE/zmoCILsspP0+qkz7sG/9pLu79ypqesVEaqXp83dGUyPpWDEJTNVq35Qp8X0WuK8
	 7vlgM+W4cZB4rCFXOaI+di92p/5bAOohYDBo1jWKBks9KO2PjqaZGYzEhhZslPSHBB
	 m7cvQffYCsoAYVyXD3XD7ehB6OhlOn8u8Dy+u0OG5SWJiGnugM1gDa+bXp92AJw0Pd
	 tJ2BvXaszahTA==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a64d20990fso67898541fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 13:52:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwNqUEbzNB+x3FRnrS2g52qi339LKdI2Fo8b6fL3BPTdhE9gskK9sK5CAcL8yP4/ovufLdz5hkcXrtDZK560pGH@lists.infradead.org
X-Gm-Message-State: AFq9FYLSf92Y/9/Kh3na9pNDaZ8QRByyhHdTIbG8FGB2uPaZOajjnf4N
	U8afMFMPfUq72PwIFfcamH1yp4KC2aRlE3PpFnbOB7D78B9yikc7AET2mE2w4YepnphD+1wDfWP
	iWwf5Q25xFgglO+rEX+komypT4kBoaFg=
X-Received: by 2002:a05:651c:2115:b0:3a6:6011:fc98 with SMTP id
 38308e7fff4ca-3a8877f67f7mr1329021fa.26.1790887933882; Thu, 01 Oct 2026
 13:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com> <20260930092020.1047221-3-y-abhilashchandra@ti.com>
In-Reply-To: <20260930092020.1047221-3-y-abhilashchandra@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 22:52:02 +0200
X-Gmail-Original-Message-ID: <CAD++jLm462gGw38acBk1VzwKZq0WE6xfFUKoMsoiVxy4iqfEtg@mail.gmail.com>
X-Gm-Features: AclHuK9E9lhAW9EXXB412B7L3puPb3e0XQeQk3VcMKZ_aaAndt5SX5qECoYPyw8
Message-ID: <CAD++jLm462gGw38acBk1VzwKZq0WE6xfFUKoMsoiVxy4iqfEtg@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: ti: Add TDA54 pin controller driver
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, 
	vigneshr@ti.com, kristo@kernel.org, brgl@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, afd@ti.com, 
	u-kumar1@ti.com
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Yemike,

thanks for your patch!

On Wed, Sep 30, 2026 at 11:21=E2=80=AFAM Yemike Abhilash Chandra
<y-abhilashchandra@ti.com> wrote:

> The TDA54 pin controller splits the pad configuration across two register=
s:
> PADCFGA holds the mux mode and the functional pin configuration, PADCFGB
> holds the wakeup and retention configuration. The controller also support=
s
> two proxy addressing regions and claiming of registers. A register claime=
d
> through proxy 1 becomes read-only at proxy 0 and can only be written
> through proxy 1.
>
> Add support for the pin controller in the TI TDA54 SoC.
>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Overall this looks pretty nice.

Check the Sashiko reviews, there is always something
interesting there.

> +config PINCTRL_TDA54
> +       tristate "TI TDA54 pinctrl driver"
> +       depends on OF && (ARCH_K3 || COMPILE_TEST)
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF

Just

select GENERIC_PINCTRL

and you get all three.

> +static int tda54_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                               struct device_node *np,
> +                               struct pinctrl_map **maps,
> +                               unsigned int *num_maps)

What is so unique here that you need your own node to map function?

Can't you use pinctrl_generic_pinmux_dt_node_to_map()?

Please consult the code in drivers/pinctrl/pinctrl-generic.c.

Yours,
Linus Walleij

