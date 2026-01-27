Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65198D2F031
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 13:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75PQCFMMISya6miWyFTo5NFlD+yMTmEC4MBoTSgZA6E=; b=wxbJvrBV5oWMkbiLpGarhvm17O
	G/GVmlPzCTXAjmLsUKUW8N8n38qLRX96wl+fxWj4yqUbQtny7HQefcZy5Y6IJdSeSiO1P3YblPp0u
	RXQTGU7SvwQuE0nz0GvFvzEnLACWxY5P+bBe5vW7JfZhSuiik0rXGjkVeP1K1DRiU0iX5doLOH2Ed
	YUiRe90YCY8fGIEjP1GBc1EGLX41zORlZ7CDNkbKhh0Y9iRflKJUUQqMWjYjG696gi+cMS6kKUUoy
	cJpxGZSWPuFj9YHWY8K1Rbxa4jqYBIvv3q65qR2lT7/2/L+pg2J8ai/ptZhksMXrycREPLvFSBpyg
	qILRR2OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjZR-0000000ELTU-44FV;
	Tue, 27 Jan 2026 13:57:29 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjZP-0000000ELSr-1XFB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 13:57:29 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5635f3eff8aso1277605e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 05:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769522246; x=1770127046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75PQCFMMISya6miWyFTo5NFlD+yMTmEC4MBoTSgZA6E=;
        b=KQHtn2BUQmkmcLurwdcm9NjVq29clDw3WqTgGD0Ibpetj+XL5ui4cuIYasRFWFNF31
         TmE/EKs229niPSBptCDdOVTpP8YiOa0tg2I8RhE+5Tq4EWyi9LMW3bn80ulqpZr52lad
         ox/R4PDKwElBYMjQ/w+rjkUFcMGH2OyWrUdxsHdizDmcWybSGjdHnvxZvg77caYguB2R
         pOzb6u9p8qESEIv1i0mtY0a+r2plaldStk5OrqRmQ7/Qf2BOVtPWvatdb6brJqYYRKzi
         UKGG2W+V62uV+y4gBqdlSnEFyjVGqIfuHp9wQW/7siRLC6i7fk/hVR+SElmkSTJodBDO
         cKEw==
X-Forwarded-Encrypted: i=1; AJvYcCWR/ZuRt7Uzq7QEvKKdwByo1065FXNFPQzBWNFxE4aIN2GSzeOAgqQWwbDdFoBMv/OUS4d6xNOv76D1uWHfHIbw@lists.infradead.org
X-Gm-Message-State: AOJu0YxpZqKAjQoeI0hWndo+nE3d3SqIgekBgXieRKF28tQlH5R1DGmv
	PtvulXOv66jNHCpvxiHahEa95B3qIJgyMmhbOoL8FNrylqyWas1hUySM5uvSA0fW
X-Gm-Gg: AZuq6aKN0V6almCEtLXU+skiqWneNNvQdjGk4i75dTVDFm71zmA5wwO7a33UYJObZ3s
	dQhq0FgoFDg1VPARHX33xuOV5FGZ6VpIPlDTwpoBtArFTFClDrQjrbwRWdT20f1sgZZrG4c6I2g
	2WQ1zHiU9nY+jFCkj9KIktkCBz05LdmXetlkIfHD1jxffVR2FM2sz5M8RlEvwqZmu5mJa/1DXfp
	fgFUIcKFL/6v7XIZGRA44511QKWRpLBDhJ3wXd4U5UjhfOpfaNuqAXcBD5d+3ZkhTRi8pBhhWz+
	yGwWVAZQfaSphIyBumDnwnEP+9TWQn01PVnYpLLmcSxLCcFxfNxyRyvZNrUpD9TqFLLULGfAs8S
	yuiKQi7ewioDYXW0u2DWZa2ZY6oUdg24abJdK/iZ4DrNo75zHKsSUiMRHS9o2INIuaH5NmjK6Zr
	yhAK8w0ouH/6+dGjKqGSmV1NEC6v1dR/5vyDU33p9WqIZqKYCxg4QLaLGkonhOrag=
X-Received: by 2002:a05:6122:8c12:b0:559:5dbe:fe29 with SMTP id 71dfb90a1353d-566794c400cmr411183e0c.2.1769522245324;
        Tue, 27 Jan 2026 05:57:25 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fa632e3sm2272441e0c.4.2026.01.27.05.57.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:57:24 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56638fca064so1417599e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 05:57:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNDlm5QyAHoCOY9ImCs7PXUB8leNiUG2e1A7TDPGyWP0uk1GJm6nezURLBtJqxsCAuNcn+AwHstOT9qCXE6bXS@lists.infradead.org
X-Received: by 2002:a05:6122:78b:b0:563:8339:6201 with SMTP id
 71dfb90a1353d-566795e7f59mr418577e0c.17.1769522244153; Tue, 27 Jan 2026
 05:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk> <CA+V-a8t5RKY9vyFDg0V3AWcBovBdWbcvqdPeiPYmHRA8v2=UGQ@mail.gmail.com>
In-Reply-To: <CA+V-a8t5RKY9vyFDg0V3AWcBovBdWbcvqdPeiPYmHRA8v2=UGQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jan 2026 14:57:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOMMyYrbPr8H3O+oj7QeGg324jXdV1QUaUhQF4sxTyfg@mail.gmail.com>
X-Gm-Features: AZwV_QgbBo9gCTeM_9WEMxs9EnfZIFfAoe0fWXmaoPkXJK4PoXh0OCn_st1Xl0A
Message-ID: <CAMuHMdXOMMyYrbPr8H3O+oj7QeGg324jXdV1QUaUhQF4sxTyfg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: stmmac: Preserve bootloader MAC address
 across unconditional reset
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_055727_415271_631CB0B3 
X-CRM114-Status: GOOD (  21.27  )
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

Hi Prabhakar,

On Tue, 27 Jan 2026 at 14:39, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Jan 26, 2026 at 6:11=E2=80=AFPM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Mon, Jan 26, 2026 at 05:25:03PM +0000, Prabhakar wrote:
> > where "local-mac-address" states the MAC address to be used for eth0,
> > as specified by the boot loader.
> >
> Thanks for the pointer, I will use the above-mentioned method with
> which we won't be needing this patch on the RZ/T2H platform.

This should already work out-of-the-box, as
arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi already has:

    aliases {
            ethernet3 =3D &gmac1;
            ethernet2 =3D &gmac2;

So just make sure to set the "eth2addr" and "eth3addr" environment
variables in U-Boot.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

