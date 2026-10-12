Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54962CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1DLHRcFWGRMXj45+dEiiprV4k2SPY5qTAHRqmLZ7S0=; b=TV/Px1eWKLf3Aa8hbyTVjLcrM+
	lsCdydwiYm+o5RIREI7ZK8cdAB+CpTCYBGzpSBNsP1nXfO03ftTz7ea5qgzcTxmBCZ53JutaKTUKu
	nkqbxvdifLYkhQwgbuWcOTf64d6m/52xnDz+rAYkl5DnDGq2JV3aAab28TC5yvLLdXx7k2xtsUNjo
	kkDhWE3I64U2/D4ur1KuxprHwK8kD0t4vzVR+po0GW6N9RXg32S44WaDECac3QMn47RxmcdQR9YYs
	lvKhOfXnUeVSjTwQqk8YSebTzs2qDCBmU72LOOr+PRhSENWuyikWfDZzc8LUI9uDRyMV9uFTEyuCb
	y2c7uQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCIa-0000000A3Vy-29vd;
	Mon, 12 Oct 2026 09:26:24 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCIW-0000000A3Td-3Uf8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:26:22 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so11644461fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 02:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797178; cv=none;
        d=google.com; s=arc-20260327;
        b=F12PaQlF2ZQ+Vh2Lot7vbbHwV0l80irv4sxsopojHx/RA/k392+FsdP8xTH7jVAk/m
         k0986qjqTvHoQaU3s8jnigr5fHjIXj0Ds4qELjsOkD+kKib2lPaueCtRNno9Q7NscQ5u
         K/2wbt31F9Jl0I3T7P9QDcxG4w9rLZNbtnACSdH+40i0VRFMVpzC81j0YMtQk/ypn07P
         FZO8HUKpl0WalQCRG+i7TqfvJIjfH6oUPbi7DZ/R5585qTT3SIdIqwQa1phSkas0U8qx
         cC4EGp5CdtUMZgXO/DkJM5MUTIAQ0HcRkdVLjykHPvLKLoz75lTvHTRWGrgnvC8e6gWV
         1vPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1DLHRcFWGRMXj45+dEiiprV4k2SPY5qTAHRqmLZ7S0=;
        fh=HNrp2XVE9cdmun2nkEi3T6HQdW0zGLXPnx9FZBbl6cw=;
        b=T0WWnFRxdc5+XjwkuDl1EUwq1SCBXLFOGbka4tD+N0q6B9q+eiGc6089kit93bkaZ/
         3YVy6+9J3K78TkdJSlgx33WB79AMCXA+9KuJ8m+61I86ksgej+eMc6HrtukI82QzecLf
         cQQtvyIg+BF9hY0YgfULBWAmup8e3KrZwLkr7rhrhuZ00w8Z+HiweFkT8TGb7DfOLOig
         tkeKk3WmwGfVu6ozMUlLVHeTc0kNoHr4hJR6I3RYrA5BtJgmogReq0aGUXW/ElupTebn
         ibydiIDWfC4gF4itLoDCrgv7W3R1GH5Biz7bHL5tr7VmWVtYIgxLiEVZ3EbvFEDlE0pa
         FpWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797178; x=1792401978; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1DLHRcFWGRMXj45+dEiiprV4k2SPY5qTAHRqmLZ7S0=;
        b=U5SLEUJT885x2DefXnAsn6qMoA5gCCFQVqCis2tpRwXKWqQKtEXen3hbf5SKt/bXQe
         T93e/0zxjTERDbZlX4e+74Msos/LzOUt1y04zoJwbi9e0hiHXa8rFAN7FobWkisxkroH
         ULaErBG+4UcFJtp/nb+4nkHj32YilhFxfo08iq+isqwltKq+0mEHbkcMPIq3bWAUrRQd
         hvyiCLYTmKQfY8eaPaB0Su7R+woQAeQqsPmsdbUQf8Kzbr7oWtKT39AYeoKsUtNM6kfL
         lDQgnFG5s/gPXovMW+Asv1vfP8AJCVAhDgJcpmkkd+zXfYDMmD0g4MrzhFL3wOewl/6c
         RvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797178; x=1792401978;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1DLHRcFWGRMXj45+dEiiprV4k2SPY5qTAHRqmLZ7S0=;
        b=rHimC6n2UACM/9M7M6lTfof/SpGPvG6fIVyYgd4PepgCiN3mjue5v+aZdudcQJcXI4
         8RvfuD6tzO06/0vSbrp+NDtna4RG2zLoudbYbD7FOQgEFHRB0toc79UA0aqVbC4FSBZC
         CLMjdhkXVSoTwGZlUoDBOscm+MK1VF9gRrPlm0ZAhzjmgCDATqVsWj2xhUqIxhQM6904
         HYFcFPs7BaULH7PIl6Js2noGTFM6czrQ4ILQqhZwoci7StN4EQoQlU41BFNCBV3YH8LP
         5D19CFeLXutWKWmNe3ZpJsSSujxGdqGyC24/n7NUhPorGWm92ojIhUG8gaboHQPE+Fco
         EWkw==
X-Forwarded-Encrypted: i=1; AKwUvBxMRxDwOMnvAyN5jxyQae6s/imoXrMkVbEtldrmmvhdovJifzdtC3fIXaxHuRWHZ8CGRWPJP8Qo1IHQ2wJiaBqG@lists.infradead.org
X-Gm-Message-State: AFq9FYIvd9B5A0FZMQFhhXhNuEEZpl8jLNnd5AGtCxs8ck6N5VOAWOns
	Om+6eFbkM8k1lCAPtWzNUxZWQ839rLwOMrKkpKZWmraVnnIYJf2208cuIzyqapka4YhHM7n8TCq
	P/S4i9smCeK1paX3hzmq8HqqNYl+2br0=
X-Gm-Gg: AYBFou2GdY3OFPxra/PsbXNvVaLdd+HhxMn/RBR6/F2r/fY8VOoHwzEhrLTAG+gor4f
	UH1j5zj8XWLy/66DmJrGOUUzyPNfVczCAjF/nVCqBWohnKVJRYz5IMppeSNwq5jwsfT1qniH9W9
	riHvFDmuZQHV+QQYCnBhOSKiYhoVJkfg9EPv5sRDtrinujTvntRlz8bQiDmKtvtOiHqInO9DXrj
	zZyf0OMGh49/alZUmq/Shngc1L0z4XhEz8xTESlKvfMQLr4CzeYPGkN/JQ3z4YHEwvGeOISfJ/Z
	p3sVa7fB1oFdTQGqHbUffAkRAg4VpQvHuuBrlemr1CnNSL1uPvU0BbK6NgGpU6+s5x3bfheG+eD
	QKKy50BS4gd7LmBmSjcOLIsZMgRFD/sUXa+vyPurSrAWZyvNXDTLxUax2TaiOT56FQeAhkRfSEi
	zsrnI+kXyjyjOVyZmQLqrriW/xeHhNyALLCSaz4DbD
X-Received: by 2002:a2e:b888:0:b0:3a9:9b74:b035 with SMTP id
 38308e7fff4ca-3a9c5352a7dmr19646981fa.10.1791797178338; Mon, 12 Oct 2026
 02:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-6-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-6-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:25:41 +0300
X-Gm-Features: AclHuK9GwblMnTPQvaiV3jDrr3vRaqwQVyHQB-cZx-ew8f4fHdAz2Ca3vyaKuZQ
Message-ID: <CAHp75VcadkqzMxShq1PLzqgNZypB+vqr3a_m1utu-NOx39iK1g@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] gpio: mxc: replace of_device_is_compatible()
 with hwdata flags
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_022620_896909_93780997 
X-CRM114-Status: GOOD (  12.79  )
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

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

>
> Replace the runtime of_device_is_compatible() check for "fsl,imx7d-gpio"
> with a flags field in mxc_gpio_hwdata to move the power-off capability
> from a per-instance bool populated at probe time to static per-compatible
> data.
>
> Introduce MXC_GPIO_HAS_POWER_OFF and a dedicated imx7d_gpio_hwdata
> instance that carries it, along with a mxc_gpio_has_power_off() helper
> that replaces every former port->power_off test.
>
> While at it, factor the register offsets shared by imx35 and imx7d into
> a MXC_GPIO_HW_DATA_COMMON macro to avoid duplicating twelve identical
> initializers.

...

>  struct mxc_gpio_hwdata {
>         unsigned dr_reg;

>         unsigned high_level;
>         unsigned rise_edge;
>         unsigned fall_edge;
> +       unsigned int flags;

Obviously you need another precursor patch to move from 'unsigned' to
'unsigned int' in the whole driver.

>  };

...

> +#define MXC_GPIO_HW_DATA_COMMON        \
> +       .dr_reg         =3D 0x00, \
> +       .gdir_reg       =3D 0x04, \
> +       .psr_reg        =3D 0x08, \
> +       .icr1_reg       =3D 0x0c, \
> +       .icr2_reg       =3D 0x10, \
> +       .imr_reg        =3D 0x14, \
> +       .isr_reg        =3D 0x18, \
> +       .edge_sel_reg   =3D 0x1c, \
> +       .low_level      =3D 0x00, \
> +       .high_level     =3D 0x01, \
> +       .rise_edge      =3D 0x02, \
> +       .fall_edge      =3D 0x03

Why?! Just to save a few lines? This makes it harder to follow the data par=
t.

--=20
With Best Regards,
Andy Shevchenko

