Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BE2C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1M03uqUJX0kuAkqVXmzpq08Mjp3bxAKOr4K6xCx7KU=; b=WEneSIE1H0tBmmOoSZNL7nEOyt
	jmP6eyjAFzkGVybT1iQYOuwfj00t29WoOhrKcTTGyJMLJafx/ouEFtVFiUNQe7X0T0Brx7zlwWmVg
	hYOwdXNvvZsJvjpFARfz6FQhi2so5C1X8De7qzceyuGSLhGImAhDcXuHKtdNIuVZj9SFZ/LBlz97t
	zjdInrmYyh1qVhN7Fyd5tRFr810HQ3sWYEEm+DGnhFxIlS+rv5xCoxDM3FzFB8FVunIkHxs8r3JTP
	ai7B09VGYCfRoTmB9XdYsBnzpJR7ftrwSXpY2wnUQxcMIOgU7Z+oopFxgKtCSeJcKx2HaHFCwF4k4
	iZ0HVA0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuog-0000000E8wz-39Qn;
	Wed, 15 Jul 2026 08:18:06 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuod-0000000E8vn-3JGP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:18:05 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-69c20ba892eso547927a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784103482; cv=none;
        d=google.com; s=arc-20260327;
        b=F934HlVsvXkJNbqrilGoAZxdVduvcQZbLU5KCbWVM3zO+mgK2YTVApjgjBFDmoQp19
         GW5decXiE8lTXehzvPWHLu9MmtXscg+UXekg1MFB260cyVuDOCTMkKuXy2aLRuLuoyRB
         Ojo8cINfswVKGTtEbZhYr1wA1jcfu/wJUpOGDUuJb2U3752AlwiPWJcoWYYOS3Bm9OnD
         aaREsJmn07pdmPKfLg4Z4FCUpJh5U2fSE0mJznf5mDXLVQL+9pJ15mwzdBMohjP8agkR
         RcFMjAcqH+SHvfW5Ch+INOclQ72ppSFoFq2C/dcJHE/CYnUrXDmFDORZ3H4SS66EI6+x
         n7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D1M03uqUJX0kuAkqVXmzpq08Mjp3bxAKOr4K6xCx7KU=;
        fh=pLddK+TuFBCFioFzZlfY1SO4OTcotdBcukRJwFE2JII=;
        b=V/wpqR0ak8I85wt3OV9zOKKbkoB42CJSy0h14uhrAVc2dfa7zv5hpdGkYkUvDeRavJ
         BAD2Y7b6ww6Ddk80m8sKDH/ppVfjJz/b5MqUS5nbsXAUicrX4P5ylxCIoSgcVbhZq9KU
         zjoHIFwewX6Dqrjn0TIRYfjBIoTpq598xrTToPlJ0fbEY27I8/iUPSsAik0GL1CGdCXT
         mPJ2wtqPAJoaeUgShex9MkuumTm6qA5klrCoE7SgBIM7ZTg11pOpdB9LgF0ueyDz+mkn
         rWoqKp52lK1xK722XfbwYJ43eMM6vTaNqDYSE1XgarA60hhTLvB1TeOvcydWF6fKdQ9P
         MP9Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784103482; x=1784708282; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D1M03uqUJX0kuAkqVXmzpq08Mjp3bxAKOr4K6xCx7KU=;
        b=fKWC+lqqONs44YM5V30IYbZ6XslaJK49EvFaO4hUdZ6ChsP6NlLNm8KpuDXcuwj2T+
         9xPQAPuZnS+9Y3WWhxdVe8Zv/LwDkUvvlmJ9lfHorwRrDWGlrU1PFHUfatarlB5zTr+Q
         u0oJUByMdNwxjuOtyAvFnQLHoYR8QRBA1svAnvn+9IggRVVoLL/8mGVDrVXTICR0L8i4
         ciZhrSO/WG+axUy7pXqdBGBAhK5LfCB4LSCKwm66up4HjhaI5iKtjjgOmiVW0UCOvFL9
         sgLol9xPmIUUxm92vXyY/rIUDaDNys2fkJ2cJ+eTIjzudp3BtGIEurBYkNKMNHNQs67r
         3IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784103482; x=1784708282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1M03uqUJX0kuAkqVXmzpq08Mjp3bxAKOr4K6xCx7KU=;
        b=oyv0i989Wj3IvZaAfrVceg8af5n3q6z7i8TEyQImaPjraAau8dtT8PSdrjjePyMRBs
         uW5O6POVSk8xdV6b8moguFwMLhJoTfvPfgqzjixQbNOeYmlqnYjoNnPR0ynyztPs2g0B
         YDMLyYQ8pmSKHpfm7cT96FD9YsZIiYDs88gLil47L5bFoR3YclV5TGPFO25/+E3yMhle
         Vb1aAqOVUwa+xYQ55eG3USIAKfk/sqXnk4RFcuMeuuv/b1bQim91RPXS0IUVDEjYQ+Ch
         RnnM5MMN89RZwcsJohNx+EEDO8PSBdd7ADd94PnGb8svAJhTb0yGaNATZVCwQrqLKck2
         6a8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrGjkdz3yo3WKLvG/kvApd45qEWOsqSp5KxavDR18TwVJscre2VNSeAyKu5BdXRhNNsmr0mBpNUS4xN7DCS3/vX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7vJZ2DudPbylpHPG4yY3IYbkH5oVrssWNj9ChyxS/0V9Tt6ZS
	yMpH1GHPTWlNn2qJvYobmO4UDxcenHdLBhQfuu+FmjptPHsRaHdV13ngFIIAnHc32WPUfr+XurV
	dX0HG0yF4HF7D2QsQ0ofHa9byMbZB4nU=
X-Gm-Gg: AfdE7cl+SSOGGO2N4pYn2WonZ+PVirUFSdsIfcc889V6Lqj/vgStobkYzo94KfQPBtk
	mcWTS/devzyVmxwjYICGGmqidwYG0fxgf+OnlsOrTq0kdgz9icjSyUDoE0l1wIHljmzhVX5lt3C
	yUBY3g906ArpyzHnU54+zUWoZ8ISYvdG5n2vhFh3DXMMYfX3JAIhEUFnj9dn0MkzUzgZKTsbvBs
	n0wE/BVbDMUp2bqbU59ToQ9G7pzwXcqnBO5BoqNfohmRtm8M5exW2Dud5+JLVAkomTWxVR8s26F
	raarU0k6674=
X-Received: by 2002:a17:907:d587:b0:c12:58c0:db2 with SMTP id
 a640c23a62f3a-c15fe781907mr1024570366b.18.1784103481564; Wed, 15 Jul 2026
 01:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-2-coiaprant@gmail.com>
 <dc21b2fc-ae11-4fde-a5b9-09e2c6bee5c9@bootlin.com>
In-Reply-To: <dc21b2fc-ae11-4fde-a5b9-09e2c6bee5c9@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 15 Jul 2026 16:17:50 +0800
X-Gm-Features: AUfX_mxch48mUromtsSVd92z4I08mky6NZMzT4EVIwR-2P4_-bFyj_YHpBs-rv8
Message-ID: <CALj3r0gWyfHHp0S4=71M1-TjgHKcgGax4Lr0DzPi37Q69-iCwA@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] net: stmmac: move XPCS lifetime management to
 platform drivers
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, robh@kernel.org, krzk+dt@kernel.org, 
	heiko@sntech.de, netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, Christian Marangi <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_011803_854427_0A3445D5 
X-CRM114-Status: GOOD (  20.25  )
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

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B47=
=E6=9C=8815=E6=97=A5=E5=91=A8=E4=B8=89 15:31=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> +Christian
>
> On 7/14/26 21:08, Coia Prant wrote:
> > The current XPCS creation logic in stmmac_pcs_setup() is problematic
> > for several reasons.
> >
> > First, if a device tree specifies a "pcs-handle" but no select_pcs()
> > callback is provided by the platform driver, the created XPCS is never
> > used. The phylink framework requires select_pcs() to actually return
> > the PCS to the core, so the pcs-handle property becomes effectively
> > useless without the matching callback. This is confusing for developers
> > who expect that specifying a pcs-handle in their device tree should be
> > sufficient to enable the PCS.
>
> I think Christian's work on fwnode PCS would help a lot with that PCS
> handling in stmmac:
>
> https://lore.kernel.org/netdev/20260618125752.1223-1-ansuelsmth@gmail.com=
/
>
> I don't know when Christian plans to iterate, it could be worth using
> that new fwnode mechanism here ?
>
> Maxime

Hi Maxime,

Thanks for pointing me to Christian's work. This looks like a
much-needed improvement.

I actually spent all night debugging call traces caused by the current
stmmac PCS lifetime management, and it was not a pleasant experience.
The code feels like accumulated technical debt that should be cleaned
up.

Regarding timeline: since Christian's series is still in RFC with an
uncertain merge date, I'd prefer to keep this series as-is for now, as
it solves the problem for Rockchip and has already started receiving
review feedback. Once Christian's fwnode PCS work lands in net-next,
I'm happy to rebase and convert the Rockchip glue driver to the new
interface.

One thing I'd really like to see: the ability to specify the logical
MII port instance via something like:

    pcs-handle =3D <&pcs MII_PortX>;

That would make the DT binding much cleaner and more flexible for
multi-port configurations.

Thanks,
Coia

