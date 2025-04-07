Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F08C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 22:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1tDFZHNBbzPIiAFt0CAdcD1vY0rtB3dQPVfG0k6uEs=; b=x0W9BqfbzMxBjYtx4/z/Eaxr1x
	xYuttzTa38woDub6fAFm5XibED2Db4kUq/2sO/4KCjK/4EG1tmMaxx1dG/qlcb/KGzGZqAgVGIza1
	llGV6z7VYqeNuso+2PMDpDo2Do8c2fDxEtvILashx7NRwUEyPRjXRq/hkV7QOCPKm/DXs1qfi219r
	RDEOoQKyck8WWjiE50i7U5Zb09mxeq724e7m2gumq5XQt3GqYOHDuYT0N1p0MhO5kEabUdAjquvub
	QlJKItJSVZ9fi9hdcC0GNvtXtDuEL0LGPjP+q9+WSbD2RmahA6WzHY8u4rwqtj3hg/Nv514evPIYg
	mofQDykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vPT-00000002EXG-04uU;
	Mon, 07 Apr 2025 22:57:43 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sA6-00000001pEq-17TR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 19:29:39 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-51eb18130f9so2542540e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 12:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744054177; x=1744658977; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1tDFZHNBbzPIiAFt0CAdcD1vY0rtB3dQPVfG0k6uEs=;
        b=XgCuvWYqoGgvNvOihjM7cwnVJKQaQlBVZWH0qIwOnu/8HyWOFFfr16UX4GxgXUFWat
         WUkMDA5MpntixmjKYt/lPqnXd2ECkR0X6GSZ9ZCWfH4PjVpKLw/8pZ0qej30j1uCJGEw
         11D+Ver1U/0avLWYftWVyi/7H4Ka/Ijd5SEXzrYs9C+zz/2wsTILkx/qqPDWUnHfakW2
         yPnqoWejTan7nzAedFxr7ljFUft1e4RoK5f+urLnQluWWy++ismhzKBU5UxImcHQ5B3o
         2mKhf5q3CUUl4nOgoNGcr8pDoz36KyA8Rd8XCxqFsZZSuMMChkioV/K9orR9xWVskQ9W
         aDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744054177; x=1744658977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1tDFZHNBbzPIiAFt0CAdcD1vY0rtB3dQPVfG0k6uEs=;
        b=G34BT8epVLGzk0aRG1RlmmRH+she/tSHUi2E349MakpA0RXK/10P61dl0Qk3kaeKsB
         rauLRTwvFUeuAb3PV8wOfUpBr9MzrZegiDAzW2mFleA2L46bEEEsajs4czVFM4dvcTgs
         D5GUUBEi886iqLyiRXzFJuXKoEPltf+tTqbU9QsBzLodP8y3J+Hmlt+7Oeqb1vD63UjU
         sCo6hTS64lQ7jWkI40bTkalG+k3gNf+o3wv5NUZGEvywM0YVFcNxyZJ2d9EDOq3MuNGq
         aUYRt9feb6i6uxQzjQ8GOuAWFuU8ksiTuYMfexHeZJLsmRhO4rSXMqsnYNR7C0oSt1Bo
         X1ew==
X-Forwarded-Encrypted: i=1; AJvYcCW+ehoJaKw2FmGNNGQDe0ToxbyIGqFnzJb8SAygKKau1aDYLbJZPpt7u/oNrjo8UvBSs+LMe/6bJlyFqdnmSYgC@lists.infradead.org
X-Gm-Message-State: AOJu0YwrGxBch94dm4jBO+Qvx7jpkA1sKjpEkt84hWcjWsHE9q7avIJe
	7vdeydNpohpAQt57fwWcptVKNzrE1eb4MApHCR2hCBT9ctHRKfEZEHzdWoohCI5p2nXIZfg57yE
	OuOFn91H0G92+dWrkqFppa18m3jk=
X-Gm-Gg: ASbGncvGbV9nEkdnW5uXoM2+4WOp2mWYULSNIqCwVIaWYgyZXkbZxJl8UrfFwX0MhJ8
	kO5joP8mHd/336x8k5DrWqy2pa/i0n/+hIBTBqUBuk+ZfKVtwLVMxwqTEHOx7KhR/b2Um1KPkyQ
	/4lZkfU10aC1OpRKtuKnJ/KPuK/kygDrsmCbPKTYiyHaPzVNVoocg8ETdVBx8=
X-Google-Smtp-Source: AGHT+IEYwC0D9Na6mldavU/SEDxrDLzeYphWLZylO7ms/uvFzvJU3N0fRqytl/SEZKNAWIqjkYg9Mf67iY5tlvf+beE=
X-Received: by 2002:a05:6122:660a:b0:527:67c7:50f with SMTP id
 71dfb90a1353d-52767c70798mr9373242e0c.11.1744054176979; Mon, 07 Apr 2025
 12:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <Z_Qbw0tZ2ktgBf7c@shell.armlinux.org.uk> <E1u1rMq-0013OH-PI@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u1rMq-0013OH-PI@rmk-PC.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Apr 2025 20:29:11 +0100
X-Gm-Features: ATxdqUGJo6rGm-PzdxRM50F_X21bV_9ZjESEtot6xCodMTgbyqFrRYjRDv3xMQ8
Message-ID: <CA+V-a8v02JWb9fKPhRB8vLoA8Kt9h3wnGic8uWZZEc+9eptGpQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: stmmac: provide stmmac_pltfr_find_clk()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_122938_302714_CB96D7A9 
X-CRM114-Status: GOOD (  16.39  )
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

On Mon, Apr 7, 2025 at 7:39=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Provide a generic way to find a clock in the bulk data.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 11 +++++++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h |  3 +++
>  2 files changed, 14 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/driv=
ers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index c73eff6a56b8..43c869f64c39 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -709,6 +709,17 @@ devm_stmmac_probe_config_dt(struct platform_device *=
pdev, u8 *mac)
>  #endif /* CONFIG_OF */
>  EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
>
> +struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
> +                                 const char *name)
> +{
> +       for (int i =3D 0; i < plat_dat->num_clks; i++)
> +               if (strcmp(plat_dat->clks[i].id, name) =3D=3D 0)
> +                       return plat_dat->clks[i].clk;
> +
> +       return NULL;
> +}
> +EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
> +
>  int stmmac_get_platform_resources(struct platform_device *pdev,
>                                   struct stmmac_resources *stmmac_res)
>  {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/driv=
ers/net/ethernet/stmicro/stmmac/stmmac_platform.h
> index 72dc1a32e46d..6e6561e29d6e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
> @@ -14,6 +14,9 @@
>  struct plat_stmmacenet_data *
>  devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac);
>
> +struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
> +                                 const char *name);
> +
>  int stmmac_get_platform_resources(struct platform_device *pdev,
>                                   struct stmmac_resources *stmmac_res);
>
> --
> 2.30.2
>

