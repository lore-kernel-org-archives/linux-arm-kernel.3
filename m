Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C19E9E319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 14:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYxQt2OGcmdSWshE3/Ad5apdbgodHOqiD6B7wlmUAZ4=; b=puW3gYGbvZHmk++ExdTtbBlTG6
	LzriWzJ9jWrO7TGiPk7QL9BJZST2+sWY+VZmdn8lR8zKTYO6UR/U/IF+0lLGudots08ef6VcTn4O6
	GZDHsgjUDCiNLA/2aH/pTCzSqQLXuy7ylcpLgoczTv7/p6b27KfzFfMi99vbevhdgGOpoTGCj9uKJ
	iebVloFjpQ9LXxKPZLlFu/JDy5lsx70En7n3+jzGLDy8rAauAQt78OcSI/WYtNaEX5K0npEqkGXJg
	4BND+K4FZEW0eoueDZ4CzZdP4mwigUO6lRTtH4d9Ui9au8g9o4IjN4pYN8R/Fyts2tcMwNoVFt+yk
	q1mQsAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqBRu-00000000k2q-0YTs;
	Wed, 11 Feb 2026 14:44:14 +0000
Received: from mx-relay27-hz2.antispameurope.com ([94.100.136.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqBRo-00000000k2V-0RB4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 14:44:12 +0000
ARC-Authentication-Results: i=1; mx-gate27-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=yYxQt2OGcmdSWshE3/Ad5apdbgodHOqiD6B7wlmUAZ4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770821033;
 b=stKpsJFdLiKup+Zrcd+VJhgtHD77mj7tv2IewlW6dCJFLwGe2Ndz7vYe/v9wZEok1Pq1+r4q
 pbfGBJXSAQaoVZdUfDlTY7AnMhk1s74AbTuUD9jHjbm7TlznRdsBaX7ktrPGaDrYRHM9ndpqvXj
 j33VeW8pjR21i0q3kOdMYdNziSMPd3gPsnt8YPHSGkEyQSfSErbVuRUhR0z/rIe25RyUaQRMmqf
 HB5N582jrIe/qbUqvKjEQIjdN3ExhGIsqgysvEv6NoHzv6RuTE6wR2R0w1qz2PDkFzlrMe7tJIq
 71vNtQSNV0US9JTByYXrqwY+yXAYReigmlxSlJ4OiXC0A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770821033;
 b=gOANeUtIGErLM0Ff3j3mOyuogRjBUdanh7aV2KfozZ8YGdvxSsREOlyhR4aMswBzaV5Y3QxS
 KkCHHoMTdMK23l2E/+n3dSoJOtGI053vONyYIZqejuTCrHUuhOfZgbki/6leNXJcB5CuLqSqXZr
 YI/qU19/UIiIqz6NBwkGmUK5NrCHRUahWfupZTEfVXBJvk+ONY5vmdJ+TeGhVh9oqHBjDHCKfw2
 67SqEzFtIyBbLZ8n6VGipfrGjJkxmYsC7uJSNBoVpNraZ4MigmD25xWbQDUPQDrZ6CCd0KUCCXz
 cPOJEBEfZosO9MEG8+KBnDiKQCmrMNU+TUkct/C6upG5A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay27-hz2.antispameurope.com;
 Wed, 11 Feb 2026 15:43:53 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7AD175A12E1;
	Wed, 11 Feb 2026 15:43:34 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org,
 rafael@kernel.org, hanguidong02@gmail.com, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] clk: scu/imx8qxp: do not register driver in probe()
Date: Wed, 11 Feb 2026 15:43:34 +0100
Message-ID: <10809444.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260211142321.55404-1-dakr@kernel.org>
References: <20260211142321.55404-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay27-hz2.antispameurope.com with 4fB1QH3NLmz2Nm8r
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 8e7c20d949661fe4b3ede5b8a28db6ab
X-cloud-security: scantime:2.326
DKIM-Signature: a=rsa-sha256;
 bh=yYxQt2OGcmdSWshE3/Ad5apdbgodHOqiD6B7wlmUAZ4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770821033; v=1;
 b=V4x2tmZbLOoRgKqA7mvMnWILlHepZh37arhzafFf7LgCf4po1XKu1bm9kdlrcn/hbqvWPmJf
 r/eU2leS+9aCxpU3k7ssNsC9TbTKoMfZ+Rxiw0l4RJ5QLMIXJejuALb7FdXf6aIZGg3vDDM8E/t
 m8aNseo0PC2FuL19rX1X3Vn5I8F80ki/dG4e0CGqwxOTFZi2m9LGchK1dz3JVdQTq47UvDWTOBc
 Xx46rMI4mIpTqTaLdmXepsh70UdnI94VsqpW1NDsW5LvXaj/t1nu1yUaHl9BnzWPxFuhGbvsCus
 AoyC6CMzsJs05ucPzdx8DzK5PSvsGlSwwquCpEvpH262Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_064408_588487_B6BE2872 
X-CRM114-Status: GOOD (  27.70  )
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

Hi Danilo,

Am Mittwoch, 11. Februar 2026, 15:23:16 CET schrieb Danilo Krummrich:
> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> called from IMX driver's probe() callbacks.
>=20
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
>=20
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> device_lock for driver_match_device()") leading to a deadlock condition
> described in [1].
>=20
> Additionally, nothing seems to unregister the imx_clk_scu_driver once
> the corresponding driver module is unloaded, which leaves the
> driver-core with a dangling pointer.
>=20
> Hence, register the imx_clk_scu_driver from module_init() and unregister
> it in module_exit().
>=20
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_d=
evice()")
> Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as mod=
ules")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/=
 [1]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks for the patch.
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/MBa8x

> ---
> I plan to send the driver-core PR for 7.0-rc1 soon, which will also conta=
in
> commit dc23806a7c47 ("driver core: enforce device_lock for
> driver_match_device()").
>=20
> It also contains an IOMMU commit similar to this one:
> https://patch.msgid.link/20260121141215.29658-1-dakr@kernel.org
>=20
> The commit was originally scheduled for 6.19-rc7, but was deferred to 7.0=
=2Drc1 in
> case more of those cases pop up (which now happened).
> ---
>  drivers/clk/imx/clk-imx8qxp.c | 24 +++++++++++++++++++++++-
>  drivers/clk/imx/clk-scu.c     | 12 +++++++++++-
>  drivers/clk/imx/clk-scu.h     |  2 ++
>  3 files changed, 36 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> index 3ae162625bb1..d89a2f40771e 100644
> --- a/drivers/clk/imx/clk-imx8qxp.c
> +++ b/drivers/clk/imx/clk-imx8qxp.c
> @@ -346,7 +346,29 @@ static struct platform_driver imx8qxp_clk_driver =3D=
 {
>  	},
>  	.probe =3D imx8qxp_clk_probe,
>  };
> -module_platform_driver(imx8qxp_clk_driver);
> +
> +static int __init imx8qxp_init(void)
> +{
> +	int ret;
> +
> +	ret =3D platform_driver_register(&imx8qxp_clk_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D imx_clk_scu_module_init();
> +	if (ret)
> +		platform_driver_unregister(&imx8qxp_clk_driver);
> +
> +	return ret;
> +}
> +module_init(imx8qxp_init);
> +
> +static void __exit imx8qxp_exit(void)
> +{
> +	imx_clk_scu_module_exit();
> +	platform_driver_unregister(&imx8qxp_clk_driver);
> +}
> +module_exit(imx8qxp_exit);
> =20
>  MODULE_AUTHOR("Aisheng Dong <aisheng.dong@nxp.com>");
>  MODULE_DESCRIPTION("NXP i.MX8QXP clock driver");
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index 34c9dc1fb20e..c90d21e05f91 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -191,6 +191,16 @@ static bool imx_scu_clk_is_valid(u32 rsrc_id)
>  	return p !=3D NULL;
>  }
> =20
> +int __init imx_clk_scu_module_init(void)
> +{
> +	return platform_driver_register(&imx_clk_scu_driver);
> +}
> +
> +void __exit imx_clk_scu_module_exit(void)
> +{
> +	return platform_driver_unregister(&imx_clk_scu_driver);
> +}
> +
>  int imx_clk_scu_init(struct device_node *np,
>  		     const struct imx_clk_scu_rsrc_table *data)
>  {
> @@ -215,7 +225,7 @@ int imx_clk_scu_init(struct device_node *np,
>  		rsrc_table =3D data;
>  	}
> =20
> -	return platform_driver_register(&imx_clk_scu_driver);
> +	return 0;
>  }
> =20
>  /*
> diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
> index af7b697f51ca..ca82f2cce897 100644
> --- a/drivers/clk/imx/clk-scu.h
> +++ b/drivers/clk/imx/clk-scu.h
> @@ -25,6 +25,8 @@ extern const struct imx_clk_scu_rsrc_table imx_clk_scu_=
rsrc_imx8dxl;
>  extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qxp;
>  extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qm;
> =20
> +int __init imx_clk_scu_module_init(void);
> +void __exit imx_clk_scu_module_exit(void);
>  int imx_clk_scu_init(struct device_node *np,
>  		     const struct imx_clk_scu_rsrc_table *data);
>  struct clk_hw *imx_scu_of_clk_src_get(struct of_phandle_args *clkspec,
>=20
> base-commit: 192c0159402e6bfbe13de6f8379546943297783d
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



