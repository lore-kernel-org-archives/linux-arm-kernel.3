Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDDCD29DEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TF3eFYrkHc1cOZLA7Pry0zv5VjtfYubZccA+TeijqI4=; b=NFCYlhPl8vQ+x1unevadFS/7fK
	hZmxr4Uv4suDwzqh8R4EXxbDRYYF0MCpFk2FePfxXrMpYW4DzkN+s24ulnfDrNbJjFNQ2k7HH489o
	fQJBZSY4i9ByrPqa+b02SjtOR9zRhsCxn3JgbPnP77BZztmFi/0ectL+stppU8lQUMLsvCYDHinNf
	7O9ljrTDoIhYU9pQbi+WrgPkmF54Heex/K82BViND5hEMMjs8fQTXkqzCXTKo+w2rXlKwfFUzJXD0
	EDdxiy2byywCQluc6GuYq19sxsEQCrS1RR63fCwhzfuRj80OGCXsZJ6hZY2hKDxQYaYgwejaLUDca
	Man1X5UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaKk-00000006nQt-100L;
	Tue, 13 Jan 2026 09:05:02 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaKh-00000006nQE-3QC5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 09:05:01 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-12332910300so127703c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 01:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768295099; x=1768899899; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TF3eFYrkHc1cOZLA7Pry0zv5VjtfYubZccA+TeijqI4=;
        b=YHO2syyGJ2tJ9RFkemV9ENVGsAFwkf42TJY2tTfItlFKkaJ2WzaN5IMzQfjFqjkz44
         n/nSWphRLKee3KKakGDD6YrYur1jzbyMy8j0eDxGUqj2PwBiYC4UFk01zg6wro0Z8sP4
         0UR8YRJ6tvJSK3fIhjJzDD4Xp3YcD1LVToK0Qo6LO5SdM5ZiCExPZP9W9v/5gacBhV2l
         hAwJzRdPA4EFi06ZlwY3L5oltvWQNpgndIjMzYfACcnw9P96vgdE0sN3qEG8pf4oVdC8
         Pn2pqSpSpr6lKEOHa0pAFq0JuJ2DhHXKryR/ZzSR27ffFdlftizGrf5jK6nQbLWUiTFf
         pLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295099; x=1768899899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TF3eFYrkHc1cOZLA7Pry0zv5VjtfYubZccA+TeijqI4=;
        b=Y6Cj2JYxJraC/IEvhQragiqQta2XVl7UM4HKoZGiP1g7hsWY0hLS+NqjRRIgtVNJLg
         W1izas9QRF+Zlm0PqG/jLDazPOybrRom8G7ceegjSB+ZuXZtKZyQDbHAS6LeSKWijO0u
         wXUqE7gl7SDLAIYlaZI5W1rZSwk29ZUH4X91y6Sq4F1ShNpCbHvLRCKAnXaQ6ElI71c6
         oj4dV2CpB4IIdaBIpnTNg8Q+q5FvSH62gbPvf36H/sDtYn2SZGc6a93ULmtVb5v7tFes
         tT7zLEI7BR3BuLBMAdH+3FDWp1NLtQNuafP8+LqVzi3aAkFLy19iRmX6vPoJmxfYRz4j
         aR9A==
X-Forwarded-Encrypted: i=1; AJvYcCXjKZ3hxedruCBRzZuFNPE5DND0pUydxcPouMkCbZiZO//CsrKqi6DgZ/ZDRSdK0o0mijkNyldHg+NLZRcLk6yl@lists.infradead.org
X-Gm-Message-State: AOJu0YwWkJ4SvQJJX+07rFbVDqZUCpwztDZWOCWEcMtjIJ/N/I9vPvAk
	ii0o1kSvR4q36+NvKRamQri45ZtJ5u4ESaxscjlCQDnmQFLS5MJr3LBrNlM5FTCQj6RHQUtzH9F
	X2ybyslALNDok6xn2bB25+9cUqUQJ0dQ=
X-Gm-Gg: AY/fxX7nZnc6Fehvu2ozpBGdovb0dnJjMYKhZilM+4Y4KL2sihStxZDrZSkY/nA7p1b
	PgJfiVqD2AYNsbXuaR2DsbMPJPAuY2xzTKGMN4+GizlEk6XVH6b+UV9SVSH5GPq7nwV6N3P9Fhx
	9yyFreRYlVh2iWxeiRrh5GSVvBos/C1enbYava1V5d93X9yUWOydTlqKPkLalVnoKDzX5W12p0Q
	AsC2IRPhkmeAIXDI7m/sSn/xQN68ptcabiEbNAlsoHTOaj7rzlG3nyXsM4dLbihT6bYhG5bbMry
	wlioL5abHwRLO7HUWL9YB4cBAT6mR+JTIMf1/ZOkE6u5Wcl3ZIe84GVNbZ9JA/Bt9RC6UvXArzX
	1/Y8OTxIjqQ==
X-Google-Smtp-Source: AGHT+IH1J0toJnhizL3PbL7ktkyTfdnjpbyE1HhT2awO0xq5WfFz2zWAUDP63sX81eGbqeQTkeo9sdBX4290VLvm5yw=
X-Received: by 2002:a05:7022:248e:b0:122:33e:7545 with SMTP id
 a92af1059eb24-122033e7683mr17502402c88.6.1768295098705; Tue, 13 Jan 2026
 01:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com> <20260111-imx952-dts-v2-v2-9-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-9-5773fa57e89e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 11:07:28 +0200
X-Gm-Features: AZwV_Qi865ruliWjfUeM4dFbMw-2xdIzSGSLpHt9sdtKpygo1iYWiegXtWJvoTs
Message-ID: <CAEnQRZBpD67MWk7T4j6RTymGiFJNW5kAs2TMS=BxVTVs7qjUAQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] arm64: dts: imx952-evk: Add flexcan support
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_010459_860080_47E9EC28 
X-CRM114-Status: GOOD (  14.46  )
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

On Sun, Jan 11, 2026 at 2:46=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> Add flexcan support, since flexcan1 share pins with PDM,
> default disable flexcan1.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx952-evk.dts | 45 ++++++++++++++++++++++=
++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx952-evk.dts
> index 21b951a2156414819dfb589e5e7e736e7b1fe48a..bae7b88f8229babc42952b7ab=
beb912cbefc10fd 100644
> --- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
> @@ -64,6 +64,22 @@ linux_cma: linux,cma {
>                 };
>         };
>
> +       flexcan1_phy: can-phy0 {
> +               compatible =3D "nxp,tjr1443";
> +               #phy-cells =3D <0>;
> +               max-bitrate =3D <8000000>;
> +               enable-gpios =3D <&pcal6416 6 GPIO_ACTIVE_HIGH>;
> +               standby-gpios =3D <&pcal6416 5 GPIO_ACTIVE_LOW>;
> +       };
> +
> +       flexcan2_phy: can-phy1 {
> +               compatible =3D "nxp,tjr1443";
> +               #phy-cells =3D <0>;
> +               max-bitrate =3D <8000000>;
> +               enable-gpios =3D <&i2c4_pcal6408 4 GPIO_ACTIVE_HIGH>;
> +               standby-gpios =3D <&i2c4_pcal6408 3 GPIO_ACTIVE_LOW>;
> +       };
> +
>         reg_3p3v: regulator-3p3v {
>                 compatible =3D "regulator-fixed";
>                 regulator-max-microvolt =3D <3300000>;
> @@ -108,6 +124,21 @@ reg_usb_vbus: regulator-vbus {
>
>  };
>
> +/* pin conflict with PDM */
> +&flexcan1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_flexcan1>;
> +       phys =3D <&flexcan1_phy>;
> +       status =3D "disabled";
> +};

So we add this here just for simplicity right? And then enable
flexcan1 in a separate dts?

With this,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

