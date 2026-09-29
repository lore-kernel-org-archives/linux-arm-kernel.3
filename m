Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C384C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIGmr+KvNWef7LSTquglUqpdDXRoxpli+2obPHQ+hnQ=; b=N5nwgWYe14dpdWrtCkex2ddfrq
	56igBQv1yl8W81ArGiudSEqWX1v5QMxGyH5oEM3V5ufhtoOx4LPguFBfoqEAwhqIEmMrHksdfXkGW
	FxkLmme15TTb/1Rkj1nmSE2PdrZiQXvQepPPdQZKl8YmNPnCzAX7zCtrKESc+e8gs9ELI9jTzsH4f
	A5BlUUd/Ah8b9ElpHwIIOcGlYwejr1eWbZ/eG74RGUpUpAdz9gHZxdkkfkPblMZFtYBjHNjxX67dx
	gc/7+6dD+gG/uJOYYlBEn39VT9vyEXkZ8GqwOhzwlb6Yj1SqelzlGOdRcJroyYtj8TcXI+35HCRf7
	2MaMTG2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRzM-00000002Yss-1yae;
	Tue, 29 Sep 2026 07:10:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRzK-00000002YsT-2AIH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:10:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Kg43241645
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 07:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tIGmr+KvNWef7LSTquglUqpd
	DXRoxpli+2obPHQ+hnQ=; b=DX6ZhtWica0BFeSKF1fZplVB4QfjMX01tZgHePdy
	t3r/iZdKeFHh4IrRNDnIQMwftXwKLEQZjxikUDgxG2nlrj44mNp/neBgKluoSK4n
	YtXToHMDRDx9vNoFsNi221QOLAcLQymvX0tDG8hvfyR+Ul1SZ9dWYdjBCTQGWfSt
	OwSRzKUjfltDm94Qr/yWp1kUooYDOyGP2Pw/LPYC9DqpJhZjhLf8KVp+wfdHLsQH
	y+rYKkXGG4Selym37s8n+V9MrPU7KO0tjpvbhON5pfr+5nMe/x1zRFtDoMQchEPr
	HN8VqHm5rbQKj7pJF9xiqSPZ2vbUS6Rad9sCMkJp9dVI2g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144sn1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 07:10:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91430af782dso87406996d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790665853; x=1791270653; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tIGmr+KvNWef7LSTquglUqpdDXRoxpli+2obPHQ+hnQ=;
        b=Ve6QIGN4jxSn1RBLuzJmbC8h894kZ/kdksfrOBKVJ5h/eievuRQRcZAOwVYxjBYttM
         AV92g+fFo4AH520zyudO1eFMPwsad+o2dFZr+aEt4p6rCbdtTQUVuuVVsm1jHpKPwQ7n
         h8+B907NqwZFygpss9LGPk3JSEeqnmqtrA55pOTrTcv5eGUdJ+Twp5MmpcUw7+r15yVn
         otiAmBn35xL7nm2Os2HoEXKfzgGdBwISym0lvAft1F0xIPthJpBhVIoV5En0RIWxpvKt
         GRgdc3KzqvEmPIvyp1W5zgo0Q7hs6Qb7eon04rzOPojkdqay401RsV9ey1WQ0ctxo30a
         gjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665853; x=1791270653;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tIGmr+KvNWef7LSTquglUqpdDXRoxpli+2obPHQ+hnQ=;
        b=B1RMTm2kYVKVz4xv3wtQ596yCxa7cOmDs7mhEARyAvtwad/K1zHLT42EbgspU8jc8o
         bJmzbZyGGIGZX8qhyfVo/lKrlpO9AEnzg3MgVN/eutoSOGJ4ML/zI1cUAJo/sDKCGSVk
         tG5UuU1O+BoPWojnLQIz26IzBYi26zkn0BXIs6jLKtQiMmw9dbyIijLgSYz0Wvu9otYb
         eogTOnys/sd5b9YKM3Y/WWfbk8wcyuSjSBuyhi21tIks77hstiCz1sdFSj6IQfSR56Gu
         iSCrciTqlb3Z7VHL7Bal4IP327NQbSWBoGmEYh1bMwJtVrw/Sl/nEkk4L40NgI2hajhE
         WQ2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwuuu9uhLll6BI0wrD+zftBJuvH2iZyzi+xvcKYpOwn+nsE6agDXxGAN2rv8kA39uAWxIN0+kB7vlkbBA98K/66@lists.infradead.org
X-Gm-Message-State: AFuF++mp+ovzbIZASJDX/JjXZ4/TOhbhLbG1BEinJAimzsQMhCuNbYm8
	VqjvywaPaprKHCJlZce7ieqLLICLojOQBRCDziX3oZi00+DmGNHzvqF4APa9yYBFMW7TAwUD3F9
	MzjSA3+VAOOm/8O8Sayc5QyG3pDr+D6g0TU+8x7S/6w+kOFycl+4E+Phl5xYP5hbmzgguXB2J1z
	1hNQ==
X-Gm-Gg: AYBFou31flIN+11IHGd0bVH5/NgL5vSZVigLPCDJr1EN79qnkj2zsjB0sqbBRRnPkAB
	O8CG/lXsCkzx66clHyR0MLRsSZY8Ptapijz32i5WiDTBw53BKzMdzM6o1FDQRCeg/vWkF+BJiLS
	jrQI2oyAZDW/Pw4L6mk0a6GZWwg/Svt4cWRCtLpBKIpKedvPnS+fjjo8J2J9ugBqEJX9llXvmDM
	3yfaD4JLlcsusxja2GiZubTbB1TsVBd+y1rkBj2aXM6z+B+kNpgv5A0lw+wsMNNavSNW7uFTaNz
	t7dw278yZXsYVptlkgOLY1vYVfSzA8Th8hVNsTD0T9zIv+QsXf0E9aKItbc56av2zNNkcvgJXfv
	DnjKjALVr48cxSQ==
X-Received: by 2002:a05:620a:2586:b0:93b:d7a0:d9e2 with SMTP id af79cd13be357-93c43d43f47mr2464692685a.60.1790665852304;
        Tue, 29 Sep 2026 00:10:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:93b:d7a0:d9e2 with SMTP id af79cd13be357-93c43d43f47mr2464687985a.60.1790665851689;
        Tue, 29 Sep 2026 00:10:51 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5056b1bsm1729250f8f.17.2026.09.29.00.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:10:50 -0700 (PDT)
Date: Tue, 29 Sep 2026 09:10:49 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
        davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolai Buchwitz <nb@tipi-net.de>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        thomas.petazzoni@bootlin.com,
        Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: Introduce a helper to check
 RSS support
Message-ID: <artkeRrj8cIntC5Q@lore-desk>
References: <20260928145043.1228968-1-maxime.chevallier@bootlin.com>
 <20260928145043.1228968-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4AbA0v2YJAqeW/6p"
Content-Disposition: inline
In-Reply-To: <20260928145043.1228968-2-maxime.chevallier@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyOCBTYWx0ZWRfX4HVkmK07qnYv
 kn95PdoLaGpzkbj/HvNIJq5kI/ADMfZjCtJiHYt2nqijvNzedgNfEC6no0Y1/lEg6AGmNfQyDLy
 WugEisorydZuJWda0vXq8SCr01Cr4D0gyTgDrOJl3zV8Z7klna0iNIjk/tRxx7qstkFhxCIhhzp
 qyRTUuDCU2DmDrReFRhD2SZLxpLHSvR8z+8O+YyFYHeU9p3a8oXwD08NffbJH20mBxDlobvDlpi
 ii5PQb8ZWYQk9L8SSiNyO1OMLZSUSnH156goGE8mtWIlPFTVIyLuKnMPKIOQWtb0lew3vJpGjxT
 3zTE/tFMJ2SRxHcMNJeqPBakn1oYjdIp3rm3QaZ8NkPVGanF0F2ZGusL4CtNLfdcZXMyqw1GSoe
 7eqEqkGke1CodzoIW3lU0KorAN58+S+wXdMlW+wgQc7gm/CFs33cLv9O/VeKr07BIgaCNi5hfrN
 FWYzRPGcOeVe3SuIZig==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb647d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=dmaecK2fVo5vuBnwg-kA:9 a=CjuIK1q_8ugA:10
 a=9DQBYnkIQOUhDWc-jbMA:9 a=1HOtulTD9v-eNWfpl4qZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: iMDrfYnFsetDAWYb82md_92i0nE0I2Qa
X-Proofpoint-GUID: iMDrfYnFsetDAWYb82md_92i0nE0I2Qa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyOCBTYWx0ZWRfX61R3Dh8wrTrM
 EGumI5thAkAvEpAYNJ3BRljH/kshGUI5FVyEVxL5xIIPLnshrU6GE6QF5Ojb74EMULVcrlDEe+6
 4UqnsrPxXK6HdWrbo1+WO78CzjQeqLw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_001054_677506_F68E5E70 
X-CRM114-Status: GOOD (  26.19  )
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

--4AbA0v2YJAqeW/6p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The RSS feature is only available in stmmac if the hardware reports it
> through the DMA caps and if the platform glue sets rss_en.
>=20
> Introduce a helper that checks both.
>=20
> For now, no platform sets rss_en, but there's interest in the topic so
> leave the door open instead of dropping the feature altogether.
>=20
> No functional changes intended.
>=20
> Suggested-by: Nicolai Buchwitz <nb@tipi-net.de>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 5 +++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/e=
thernet/stmicro/stmmac/stmmac.h
> index 7582fca63741..e2873d46e049 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -433,6 +433,11 @@ struct timespec64 stmmac_calc_tas_basetime(ktime_t o=
ld_base_time,
>  					   ktime_t current_time,
>  					   u64 cycle_time);
> =20
> +static inline bool stmmac_rss_is_supported(const struct stmmac_priv *pri=
v)
> +{
> +	return priv->dma_cap.rssen && priv->plat->rss_en;
> +}
> +
>  #if IS_ENABLED(CONFIG_STMMAC_SELFTESTS)
>  void stmmac_selftest_run(struct net_device *dev,
>  			 struct ethtool_test *etest, u64 *buf);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 4dee3542df3b..08feb18d62ba 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3538,7 +3538,7 @@ static void stmmac_mac_config_rx_queues_routing(str=
uct stmmac_priv *priv)
> =20
>  static void stmmac_mac_config_rss(struct stmmac_priv *priv)
>  {
> -	if (!priv->dma_cap.rssen || !priv->plat->rss_en) {
> +	if (!stmmac_rss_is_supported(priv)) {
>  		priv->rss.enable =3D false;
>  		return;
>  	}
> @@ -8037,7 +8037,7 @@ static int __stmmac_dvr_probe(struct device *device,
>  	for (i =3D 0; i < ARRAY_SIZE(priv->rss.table); i++)
>  		priv->rss.table[i] =3D ethtool_rxfh_indir_default(i, rxq);
> =20
> -	if (priv->dma_cap.rssen && priv->plat->rss_en)
> +	if (stmmac_rss_is_supported(priv))
>  		ndev->features |=3D NETIF_F_RXHASH;
> =20
>  	ndev->vlan_features |=3D ndev->features;
> --=20
> 2.55.0
>=20
>=20

--4AbA0v2YJAqeW/6p
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCartkeQAKCRA6cBh0uS2t
rKlgAP9BrJf6LgP4y529UEKl/BwyjNkwWuBoOJca9HEjS70dawD/W/Zd/sqjZ93X
o19uP0B7YwHzyKwrFC+mqd5ths/LnQA=
=Wv2k
-----END PGP SIGNATURE-----

--4AbA0v2YJAqeW/6p--

