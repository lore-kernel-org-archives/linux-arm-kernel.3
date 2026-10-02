Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8464CCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2pajeozWoQyPpjiKXh/ib63RkSnF91Fry4CrnLwmA8=; b=lovHXPKbEz9GnKYXvngb/ONubj
	4DWoD5Sh6Yej257LB99WAfflwgz31I3rZ9SAvTmbE5PHsKNot/zsnoCJHWD6denpXXrUejMCVeCEA
	YkiDdz+fRYmbKMUfBT5K66dmsL8/3PUb67G744YPKrDmdR1qfvRcuRLKK3jYjUt7OfPrynbeuKFKo
	hBobC1usVcJ5IEcswk2v/BglBzef+90wsaraGu/UGq9iEtg9bHfOuebFIb9aH0TAcUqskZkjxNhh7
	crMWMWYnElxN9rXj88mnSba5tyC0lmpsY9jBIX/2VDdhFQ7AZzAOf9WN4/mbEzalAdKatTMy432Qq
	h+q25n+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdCK-0000000Ber5-1GpV;
	Fri, 02 Oct 2026 13:21:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdCG-0000000BeqC-3p0R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:21:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692D9ogM1849472
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Oct 2026 13:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e2pajeozWoQyPpjiKXh/ib63
	RkSnF91Fry4CrnLwmA8=; b=a9NdbftjUN29nrjV4nGPZObxiaKQknHrsVyv7gh+
	yskXr2t5Wjywqgbqmm5v5aYLBApndUb6i8pZ9XmeWN8C8PjTIO1/1woFl/mr/6oX
	C0Yc4SNzYHVjOF0JPi4YgYPjkZa5JPjopeJI67hnqxwPoCRp7wI7U9vpRgETikcH
	aLum6qOvMxjAVmbBon8mUZQ1BBrlxTEqB9XQtj+a2VUAzpnyE6n5oNLaOCrtHlJ+
	5kexKoqEQDG09jmJlhxNl9UYBogt5Q4sIqcoDpAWc59VEsatyjYwljB4FwHn0SyJ
	yrBFrgZ3EhI0pk+sJ8o2TX5GaIed4gQ/b7bMpoFP3KwqXA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20sh2egp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 13:21:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988bbb0ed9aso3401890241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 06:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790947267; x=1791552067; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e2pajeozWoQyPpjiKXh/ib63RkSnF91Fry4CrnLwmA8=;
        b=gWXtHIdawFKh4+Ka4KryhKasJudteN3rEqAEy0CRbCCfjOLEwGCfB9y4cM0igTuTFG
         Vjy95FyWMY81Kpjgn8a3Sr3IHw41JbmBmIpazwaBO678Em+Eh5RHMsD796LY85LDx5LO
         T5tOpP+AtPlqRcsoqyzHWqamZcR1SnckY3C4SaeqJJiXnbD7VcyF3LXYHNFYrldMZIXK
         fn19lkAjos5dI0aELWLCgrkHSpL0xR1lGCA5uJBONMvLBObVLig8JX9xUVItOFCD3xoI
         zjQH5sJcx5OIrwICXBKo54Q/R8gXAMHjcWSIVlOeL+7x87LtITW5iB+fbisIf7JIrDJe
         36hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947267; x=1791552067;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2pajeozWoQyPpjiKXh/ib63RkSnF91Fry4CrnLwmA8=;
        b=kHvzWyQ5QkqK6q3fpP3GCXS72jDyzkvVsop3TLq+BzSfn+o0RYpj0hPZWwVer0tw1T
         kmTQG61qBwRczwQdiTCO3PZFsc8LqmRTOxpazCRDaw21LCb+K1uGkBAchU+SkxdPBLc6
         NYQP0sNfUN77yVlfUX2D2MZg1YZwnENAY6WZM9L1wj1DM9fwKvsWSb7bS22Ifwy+UvOH
         0KFcUWLUkeBxo2HesKAkkq+PFwd+5LD5vbrsR0M9eapSramqOswTVqbvvRsqKOgNTvVK
         GvtlLm1X/onh+ZxxX+ci9BXOAXiTMXovgykBgt0ZsOHZq+SA7Qp7lPGX8euNzj3H+SzN
         77DA==
X-Forwarded-Encrypted: i=1; AKwUvBzw30N0urk/1MjXyRLpFfwdQdxpPZv3D6ML+l7EiafAoo/nQQwrJ3Ky5Z/XPVCwCIM40MhFy428R6gd0VVqeSWR@lists.infradead.org
X-Gm-Message-State: AFq9FYKY4rTa2wFTodLivnETxEbxIXQaIpSsB59r4FUgudhtroxTo45I
	p3I/PbrmzgW0DF1SoyvdFePzEFATGT5s3CqtcWx3jfuVElikwKQ+AIgLyMzfmGDkg586YIXQ/50
	16kqfRsCRvj4E6jUoA2fnZTcdOSxov+6ppFIE2DPNNK5lByMA/0au10LegHiSpH4/xOub43jxAe
	v0rQ==
X-Gm-Gg: AYBFou2xLfAJyqpcPQUSVeklngA28/kHd8Zrgl3p48z2/HaG0NZDD3ktAmzCvY8QBvX
	TVukQLNzYk/L2NQoY8sta0waCujZMRQRSn2sGQchl8VxUZUqh9ZXCg8OSqj++m+XNRd+JmJeaWb
	qwa8hiDuwR0KrAxZyX2YBbX6/xytM3VOfLhY3ScKG6C+0BR0AyZ6IFf0edtdY317IkT862JN7Wc
	zbpzP9+Q0nI+cYhzoFI0Iz22UDkDDUSAseGXksd5BrNj3U1ClPkNl4Q09itsGXAQ7uDrcK3ad6D
	b/ONSc5sJQYNeHfv4GRgqtpE60t8dxJoE5RA/JwUdq3HWcRQQoH3h2iHDLoGCH/VbWleBP5GrT9
	S2NAl2bcK/2lZIQ==
X-Received: by 2002:a05:6102:f10:b0:7c2:7a0:ae28 with SMTP id ada2fe7eead31-7c207a0b5bdmr76894137.30.1790947266642;
        Fri, 02 Oct 2026 06:21:06 -0700 (PDT)
X-Received: by 2002:a05:6102:f10:b0:7c2:7a0:ae28 with SMTP id ada2fe7eead31-7c207a0b5bdmr76874137.30.1790947265935;
        Fri, 02 Oct 2026 06:21:05 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff106d8sm53025675e9.3.2026.10.02.06.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:21:04 -0700 (PDT)
Date: Fri, 2 Oct 2026 15:21:04 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: serialize PTP timestamping
 configuration with priv->lock
Message-ID: <ar-vwAy1PRMQMDuR@lore-desk>
References: <20261002-stmmac-hwtstamp-missing-lock-v1-1-189ce151a624@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B7t3o89WLFnL+/xl"
Content-Disposition: inline
In-Reply-To: <20261002-stmmac-hwtstamp-missing-lock-v1-1-189ce151a624@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MyBTYWx0ZWRfX7z3dEbaIS3dy
 Mvlc+OGfIK6sIBXthFzsBqaALFakqd0qudwvVXZ5dLXm9Gk7i0r5AzwEiELKTqH2h0V+PvVJLet
 7I87yQnmCFqsDzh6l9bWBcA28ZWYRKw=
X-Authority-Analysis: v=2.4 cv=IpmL47/g c=1 sm=1 tr=0 ts=6abfafc3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=-_Ip9hOUUtcLEFov2a0A:9 a=CjuIK1q_8ugA:10 a=PTu4yKYEXk-SadUjOcEA:9
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MyBTYWx0ZWRfXzNKFCAmnkqVi
 BFq/phQ9+76HbTw/UPwZZb9SgyPr2+wPfXNdCW9L7iVKAFmZBGsO0C0E8UK1us9KbiLf/xihNue
 8wdggH30/OxJOAC40Ci20RgFVIMr5YIlzLhpVfiAVwko+UTecOnwTiW6AlfVxhkZ6AUf9b3KW6B
 QxhWqPKz/J/OnGuUmRPzUwLXv/Aj0210T7JWbxedVmv+vyeUhHgMOAbrti0+4Z1uzHUByU35lH+
 JMh7xF50WocULohCRjX73xQ0joNi+8uylQeVPqEdTJXSBwyEkC/vRfMl3JceX7TMA5w34oSQtgx
 k7LoehMQ2IEY8ewFEQVYehID6xv5WFUfpS/zHe7idthHML/mQrX5Nb47iGieMnme6VwLtR6EXWy
 13+atwsygV8qonI3dLFn8kFJb2swfxR+8M9+x7wCHcg3YIsO0yboPQbf14Q6Wtw8/Dh2ZVZmesW
 peI49dNnikZ2VLgv4xQ==
X-Proofpoint-GUID: ArSnex5WxL5D8E_g4fpoknzZChF5_Nc5
X-Proofpoint-ORIG-GUID: ArSnex5WxL5D8E_g4fpoknzZChF5_Nc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_062109_072648_6B94D296 
X-CRM114-Status: GOOD (  27.24  )
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

--B7t3o89WLFnL+/xl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> stmmac_dl_ts_coarse_set() runs under devl_lock only while
> stmmac_hwtstamp_set() runs under RTNL. They read/write
> systime_flags/tsfupdt_coarse and run stmmac_config_hw_tstamping().
>=20
> stmmac_dl_ts_coarse_set() snapshots priv->systime_flags, programs
> PTP_TCR, PTP_SSIR and PTP_TAR, and only then publishes tsfupdt_coarse
> and systime_flags. A concurrent stmmac_hwtstamp_set() can read the
> stale tsfupdt_coarse, build fine-mode flags, program PTP_TCR in fine
> mode and set hwts_rx_en.
>=20
> Take priv->lock in both stmmac_dl_ts_coarse_set() and
> stmmac_hwtstamp_set() so the timestamping configuration is updated
> under a single lock.
>=20
> Fixes: 4347287b8627 ("net: stmmac: propagate PTP addend and system time p=
rogramming errors")

I will repost with proper Fixes tag in v2.

Regards,
Lorenzo

> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 43 ++++++++++++++---=
------
>  1 file changed, 27 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9741f97fa37a..a6793054a179 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -685,14 +685,7 @@ static int stmmac_hwtstamp_set(struct net_device *de=
v,
>  	u32 snap_type_sel =3D 0;
>  	u32 ts_master_en =3D 0;
>  	u32 ts_event_en =3D 0;
> -
> -	if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
> -		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping");
> -		priv->hwts_tx_en =3D 0;
> -		priv->hwts_rx_en =3D 0;
> -
> -		return -EOPNOTSUPP;
> -	}
> +	int ret =3D 0;
> =20
>  	if (!netif_running(dev)) {
>  		NL_SET_ERR_MSG_MOD(extack,
> @@ -700,13 +693,23 @@ static int stmmac_hwtstamp_set(struct net_device *d=
ev,
>  		return -ENODEV;
>  	}
> =20
> -	netdev_dbg(priv->dev, "%s config flags:0x%x, tx_type:0x%x, rx_filter:0x=
%x\n",
> -		   __func__, config->flags, config->tx_type, config->rx_filter);
> -
>  	if (config->tx_type !=3D HWTSTAMP_TX_OFF &&
>  	    config->tx_type !=3D HWTSTAMP_TX_ON)
>  		return -ERANGE;
> =20
> +	netdev_dbg(priv->dev, "%s config flags:0x%x, tx_type:0x%x, rx_filter:0x=
%x\n",
> +		   __func__, config->flags, config->tx_type, config->rx_filter);
> +
> +	mutex_lock(&priv->lock);
> +
> +	if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
> +		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping");
> +		priv->hwts_tx_en =3D 0;
> +		priv->hwts_rx_en =3D 0;
> +		ret =3D -EOPNOTSUPP;
> +		goto unlock;
> +	}
> +
>  	if (priv->adv_ts) {
>  		switch (config->rx_filter) {
>  		case HWTSTAMP_FILTER_NONE:
> @@ -829,7 +832,8 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
>  			break;
> =20
>  		default:
> -			return -ERANGE;
> +			ret =3D -ERANGE;
> +			goto unlock;
>  		}
>  	} else {
>  		switch (config->rx_filter) {
> @@ -859,8 +863,10 @@ static int stmmac_hwtstamp_set(struct net_device *de=
v,
>  	stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
> =20
>  	priv->tstamp_config =3D *config;
> +unlock:
> +	mutex_unlock(&priv->lock);
> =20
> -	return 0;
> +	return ret;
>  }
> =20
>  /**
> @@ -7753,9 +7759,12 @@ static int stmmac_dl_ts_coarse_set(struct devlink =
*dl, u32 id,
>  {
>  	struct stmmac_devlink_priv *dl_priv =3D devlink_priv(dl);
>  	struct stmmac_priv *priv =3D dl_priv->stmmac_priv;
> -	u32 systime_flags =3D priv->systime_flags;
> +	u32 systime_flags;
>  	int ret;
> =20
> +	mutex_lock(&priv->lock);
> +
> +	systime_flags =3D priv->systime_flags;
>  	if (ctx->val.vbool)
>  		systime_flags &=3D ~PTP_TCR_TSCFUPDT;
>  	else
> @@ -7768,13 +7777,15 @@ static int stmmac_dl_ts_coarse_set(struct devlink=
 *dl, u32 id,
>  	if (ret) {
>  		NL_SET_ERR_MSG_MOD(extack,
>  				   "failed to reconfigure PTP adjustment");
> -		return ret;
> +		goto unlock;
>  	}
> =20
>  	priv->tsfupdt_coarse =3D ctx->val.vbool;
>  	priv->systime_flags =3D systime_flags;
> +unlock:
> +	mutex_unlock(&priv->lock);
> =20
> -	return 0;
> +	return ret;
>  }
> =20
>  static int stmmac_dl_ts_coarse_get(struct devlink *dl, u32 id,
>=20
> ---
> base-commit: 232d49dd4b40a666283de9e722899f088ed581b2
> change-id: 20261002-stmmac-hwtstamp-missing-lock-b6a7979c643c
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--B7t3o89WLFnL+/xl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCar+vwAAKCRA6cBh0uS2t
rKpRAP9xiTlhpINh0zbVZ7FsOJaz1VGKpFCs9Z+N5bWuXKvLBwD/TT6049wDYnOf
jpvZk0Qguu9eTM/22fErhp9ZPUUozAU=
=EFtC
-----END PGP SIGNATURE-----

--B7t3o89WLFnL+/xl--

