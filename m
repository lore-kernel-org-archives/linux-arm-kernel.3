Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31417CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 19:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixgp0grp21H2AsoUs2fpv0iJHrH7SDIdhzu9KNRECUs=; b=Ysz31/5nOvhWHx7Qye1VJPUzMa
	IdX1vLsfcKvONatYl3ljQfYsCaw9E0IMMSkIhUmz6JWyL1BnR3c1OzD9Ecbi5bp5CrGakTk0OPBYu
	CmaG1L52utvHMI+NuJnC1NFSj3iFG3Wc8nNvuU2Cyu0wvTwt7QVD0mn/wU9EVtvVofM4v+HHMymdm
	4A5K/LFkoDOq2dgVmv8c6YMv8C8hvGagIHlGNTrsQHqX90W60fdbPXIgGXaastMO70Z2NcA2WPEqf
	tx4a3it1A3P8lSCECy+/BPf2eHfePKTUu7iwg6KxBcQpOagPqMdZkzHfiufLCAiPdW+4ogd+OXlaZ
	ZUMDof1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuyBO-00000008KPR-3vQI;
	Sat, 06 Sep 2025 19:02:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxn1-00000008Ghn-0xsR;
	Sat, 06 Sep 2025 18:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ixgp0grp21H2AsoUs2fpv0iJHrH7SDIdhzu9KNRECUs=; b=zUfL4s8U0K9Q2MHNMM7l5z2A3k
	HSGFJ9vEoXv7ibDwXsOiPVKUCFvVWIbJ9iF4P0Ekkwdc8o879WQskezT8MWsqZGbwYcVVXuPnYiho
	WVciJJuqRAwj9WK/qdKky1pIzSfAkWqbWVySteyWQVBR1ni9v8Q4mkct4H6a5zuJ0Im+9Qb+Ormlv
	OglT+cTJHqa5SwMH+c3tdAIIpP6cgRhg+9+sdveb42AuA0fla1kJy6JesNwCJGdlcogGnzeWg4nnt
	j5wWodQiCGrnYN/fWLF6w+sIq5XxS+yk8IP7iZDQj6XyvSVdfig2z/fe/s71nI6A266E3w521EAsn
	jot+Zmdg==;
Received: from i53875a53.versanet.de ([83.135.90.83] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uuxms-0006t1-Id; Sat, 06 Sep 2025 20:37:22 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 2/2] PM / devfreq: rockchip-dfi: add support for LPDDR5
Date: Sat, 06 Sep 2025 20:37:21 +0200
Message-ID: <14289002.RDIVbhacDa@diego>
In-Reply-To: <20250530-rk3588-dfi-improvements-v1-2-6e077c243a95@collabora.com>
References: <20250530-rk3588-dfi-improvements-v1-0-6e077c243a95@collabora.com>
 <20250530-rk3588-dfi-improvements-v1-2-6e077c243a95@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_113731_300422_3C650782 
X-CRM114-Status: GOOD (  25.89  )
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

Am Freitag, 30. Mai 2025, 15:38:09 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Nicolas Frattaroli:
> The Rockchip RK3588 SoC can also support LPDDR5 memory. This type of
> memory needs some special case handling in the rockchip-dfi driver.
>=20
> Add support for it in rockchip-dfi, as well as the needed GRF register
> definitions.
>=20
> This has been tested as returning both the right cycle count and
> bandwidth on a LPDDR5 board where the CKR bit is 1. I couldn't test
> whether the values are correct on a system where CKR is 0, as I'm not
> savvy enough with the Rockchip tooling to know whether this can be set
> in the DDR init blob.
>=20
> Downstream has some special case handling for a hardware version where
> not just the control bits differ, but also the register. Since I don't
> know whether that hardware version is in any production silicon, it's
> left unimplemented for now, with an error message urging users to report
> if they have such a system.
>=20
> There is a slight change of behaviour for non-LPDDR5 systems: instead of
> writing 0 as the control flags to the control register and pretending
> everything is alright if the memory type is unknown, we now explicitly
> return an error.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

header additions
Acked-by: Heiko Stuebner <heiko@sntech.de>

> diff --git a/include/soc/rockchip/rk3588_grf.h b/include/soc/rockchip/rk3=
588_grf.h
> index 630b35a550640e57f1b5a50dfbe362653a7cbcc1..02a7b2432d9942e15a77424c4=
4fefec189faaa33 100644
> --- a/include/soc/rockchip/rk3588_grf.h
> +++ b/include/soc/rockchip/rk3588_grf.h
> @@ -12,7 +12,11 @@
>  #define RK3588_PMUGRF_OS_REG3_DRAMTYPE_INFO_V3		GENMASK(13, 12)
>  #define RK3588_PMUGRF_OS_REG3_SYSREG_VERSION		GENMASK(31, 28)
> =20
> -#define RK3588_PMUGRF_OS_REG4           0x210
> -#define RK3588_PMUGRF_OS_REG5           0x214
> +#define RK3588_PMUGRF_OS_REG4				0x210
> +#define RK3588_PMUGRF_OS_REG5				0x214
> +#define RK3588_PMUGRF_OS_REG6				0x218
> +#define RK3588_PMUGRF_OS_REG6_LP5_BANK_MODE		GENMASK(2, 1)
> +/* Whether the LPDDR5 is in 2:1 (=3D 0) or 4:1 (=3D 1) CKR a.k.a. DQS mo=
de */
> +#define RK3588_PMUGRF_OS_REG6_LP5_CKR			BIT(0)
> =20
>  #endif /* __SOC_RK3588_GRF_H */
> diff --git a/include/soc/rockchip/rockchip_grf.h b/include/soc/rockchip/r=
ockchip_grf.h
> index e46fd72aea8d1f649768a3269b85176dacceef0e..41c7bb26fd5387df85e5b5818=
6b67bf74706f360 100644
> --- a/include/soc/rockchip/rockchip_grf.h
> +++ b/include/soc/rockchip/rockchip_grf.h
> @@ -13,6 +13,7 @@ enum {
>  	ROCKCHIP_DDRTYPE_LPDDR3	=3D 6,
>  	ROCKCHIP_DDRTYPE_LPDDR4	=3D 7,
>  	ROCKCHIP_DDRTYPE_LPDDR4X =3D 8,
> +	ROCKCHIP_DDRTYPE_LPDDR5	=3D 9,
>  };
> =20
>  #endif /* __SOC_ROCKCHIP_GRF_H */
>=20
>=20





