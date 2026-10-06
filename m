Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205A3CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 12:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbVkivpfpNWaYBFRJqIcd19B3Lm5ZxhVxyxWOYpj9Ho=; b=bzSi9VGU/nbfR2dZyvxe0LNF+6
	T0A7MmmPd8BLpYZ2GRkXK601YQwHisCyj1Iz0peQ2swzhqSRF90Rr2gsTC5DaaU030eRiZxLyKKGj
	a7cpJ9kPA1fhWJoBW2K9o35Jj5BiVzltAdBSm/wBTiAfPf085QCLpn5sT4ekyHDPdk2wM5JQq6RTi
	CpSKhdLyQc8vw16MbiuCxGTcu90WI6Dl4Pvmhs9smBFjUeT8cNS9Phu2erVUOycWGe9iwkKVB8UHW
	TC7PX4dAvx6qI+GKaC3weAxIYNJIqcJACsmpK47cDBQqt0We2+ti+TbkboMIPb5Bg+xQVa/dYOLKm
	cwMljq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4YQ-00000000mvO-1s1I;
	Tue, 06 Oct 2026 12:45:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4YK-00000000muw-3jB5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 12:45:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPSDD1670721
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 12:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FbVkivpfpNWaYBFRJqIcd19B
	3Lm5ZxhVxyxWOYpj9Ho=; b=X0i0QvC8QXXVgdzJ7U0Pc4IcMBBfaO1cACnGnsci
	TuY+KeQFDaaCb5boI+W34cYw7lMduvWiN1SsDQxoj5qnNaladmI6mSA8T2yjZzTr
	YkxXPMASelW6kOIdL9acMJoDJrNuDnIdOIYF9BZO593YVxHY5T1NWkHNB8inCWQk
	T9T5SiiyNrGhQ9Nji6lxk+gKX/52KLUmGXCOSZOdlLGaNuQ4VCh1Hi/GPHO6FmmK
	j/4Jhmp28j+uqwPJ/el1vLaCOu3WJ7H3CU9jz3IalvMQNNaC4AfOv7b8K/3tA1na
	ckgLer7gpI5tIwQhD2xB1HFbA1Byp8Py+PX8EIeaTyadUQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4h6tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 12:45:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7be858243a6so482944137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791290751; x=1791895551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FbVkivpfpNWaYBFRJqIcd19B3Lm5ZxhVxyxWOYpj9Ho=;
        b=gbs2CaGupDYTsLA7Q7nwPNPSgBAb6qYkhbU+Nc4AhVu9lISL8S/lMzIlslc+Q4wdpT
         jK+Gqib1m7uu/DNST3f5I/s6PvPFAsf1qa8fs9Q5fRxhEKi3uvSy4tlbA19IsGmUOa48
         iQBO0pH6cHEzGurd3qvdm8cLGzPs4LEPOa8wH51Ocgl7ZJ6KQkMzZNuj8sb/JqAopg9K
         lWAu2SSzkYyAVlKo8DW6NL3fsKF2t9sxLMgUQ4q1oJoeWKPIpPXGPHwWm4Nq/4LLhp17
         ciXYU5qjNZxnF33AnRDHynokAiLYzv9Kv4g86MUFM3G/PwhECDDzERN+AP+xy0vZgkgR
         opVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791290751; x=1791895551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FbVkivpfpNWaYBFRJqIcd19B3Lm5ZxhVxyxWOYpj9Ho=;
        b=m9LvC+9/0Huig5lsQXtkMCIxnMU6Px8ihB/XfncxRjirTXoe9Q1iv9DgAbA/mVc+XE
         iWKg5Bm9BWlua5toGk7UxvNLhTg41oVEj6Lx5ZNh7018NqUSfF9+RJ0EQPMphNXX7JPI
         yt5MSkj2ToJzkKAjeyVc7lv0Alrnd+SMuq5JAROXDkQ8LDmcZRTwckvbvXVqkJAt8pCP
         lDUXiOFxoOUk62jys2fMjLsL3kPNE+qr9ULQGY1RT+j1cjBRzg6j12cGrlocUpqS8Hvx
         1gY00R+vbBmd6hgie1n9rxM2QS259KoPQtjmmFMn+SSdhOAMeZX8PgQLqdttwbVG1ey/
         Faew==
X-Forwarded-Encrypted: i=1; AKwUvBwt7XdfCVXRBnPOxUo2VZ1NWBz8uqUkMDj67e+2ZYgoaaWQuFP4BjetYttNOXSwBHNTQa3dnsgWhpqC/eLOEKKk@lists.infradead.org
X-Gm-Message-State: AFq9FYLLkeocY7OSODzsBwirbjCpzCbZI23DnVC8Ux2IIhyf1ZO7t0iv
	M5NkB7XRih7z0Kr90xOevooRfm6n3vQP5bhb/R2q1Q5TJJF2iyXUy28ASMr99UTfyHLRiq2XJCx
	0gwH9uOngf5mnDdvGQbtyOIZoYFBgaY3uzoDyCjH6xJQX6qiOOhzLo6Q6flD9OLg3eRluaz+1nu
	HO1nDoJcFmqw==
X-Gm-Gg: AYBFou3xzVSZzL+EglculqySd0rqSzV2wPEzIXr2ZNJ0Dp6jyMY5HkmvgctK97WOrEX
	KXvt07Tmha99l/nMYTThJBU8oeWZdO8txWl2Js20GYCEYYKfHRN0P5rasox9PXgApe06qLw+b54
	fGkBIsr8mO7I6rzHrCxXPCn4HwS8pti9ignfS/kYNDa5+vwR0zGisVtjkHNGHKlk3+PSQwRcXqK
	O/bbE4mjA4VaiDxxwC/fP23xD6z4dagdGJ6VkPvR4KVeprAhcBkTa0UISELdK53QeZXe2W7Qk0C
	uBuYI+iiuBOR8uPUyia+0LH3wKLcYC2fyvoI+ofQme80Arb+KgTK4CYRc3JhNNWOtI1NlE0nHBF
	v0AI+9qlIvzkwQg==
X-Received: by 2002:a05:6102:149c:b0:7a7:ce1f:6b95 with SMTP id ada2fe7eead31-7c877ce24d2mr279230137.2.1791290751004;
        Tue, 06 Oct 2026 05:45:51 -0700 (PDT)
X-Received: by 2002:a05:6102:149c:b0:7a7:ce1f:6b95 with SMTP id ada2fe7eead31-7c877ce24d2mr279212137.2.1791290750344;
        Tue, 06 Oct 2026 05:45:50 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c69afe66bsm4402752f8f.30.2026.10.06.05.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:45:49 -0700 (PDT)
Date: Tue, 6 Oct 2026 14:45:48 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Kory Maincent <kory.maincent@bootlin.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: stmmac: serialize PTP timestamping
 configuration with priv->lock
Message-ID: <asTtfFEiprbiLJA5@lore-desk>
References: <20261005-stmmac-hwtstamp-missing-lock-v2-1-3b3bf4fe3f45@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6hfszCiDjWHCFxZ3"
Content-Disposition: inline
In-Reply-To: <20261005-stmmac-hwtstamp-missing-lock-v2-1-3b3bf4fe3f45@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MCBTYWx0ZWRfX4aLvwAzbiKX5
 3szzIWWz8T5cHEYv52zJ0nH9M37lz+mmW7xNm3F8HnvlwYOY8vZ5vMxu/0Bg8RkcM102tXkOzQ6
 9UNyFdAHZsunICFFT4JXzrDKwgTnmgIs+lgBkwFybCxqpoXGLnyeAoDDy4SAWHjS99iWLNcRmRL
 MLU3H28Ow8pfB5OFgulYOf4JH3x7UzlaYaQXHJmkL6Zv4Khe3KBuIuCD9AZHeT7Gn7XtysufkGH
 /jIts6Lpk815sMFXUNw3lgKcvMcwPqta1FHaVJ7hTVzpFXluAlNHAeMC5Jl+0YtS1AQGd1kl3XO
 dKbG1Gt8Ec2IP63V/i8J9k3teOd2lGdH0wgRJbgH3zDixdQxoHd3xRSg7iZgg2sp6DAsPdS3319
 mqHBmTNilVDgRLdVhm19xCdEqLYb8KiDsqfnPJZU27xJe1+C8iTWT+sLVexWZO2Xo+E38sG4I1q
 09O+La4VpMLqJf2bE1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MCBTYWx0ZWRfX1iCNaGUz1UI7
 NxvtE0rIe/2zYfwzJqHKoM1DQXCx8ZqlDP3hcdkLxkEKHDKaajqTjiaeGLUCcf/1s9Cf/CTCfsO
 i8XM1n/1R72ETs8cSP85b0tPHP6iGQw=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac4ed80 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-_Ip9hOUUtcLEFov2a0A:9 a=CjuIK1q_8ugA:10
 a=QyMo_hAzWTYccEiHbj4A:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: u_-RfkjNgONoRE_Rocqh_y6baW2sMSAA
X-Proofpoint-GUID: u_-RfkjNgONoRE_Rocqh_y6baW2sMSAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_054556_326686_92080FCB 
X-CRM114-Status: GOOD (  28.78  )
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

--6hfszCiDjWHCFxZ3
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
> Fixes: 6920fa0c764d ("net: stmmac: Add a devlink attribute to control tim=
estamping mode")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

I need to rebase this patch in order to fix new conflicts with net tree.

Regards,
Lorenzo

> ---
> Changes in v2:
> - Use proper Fixes tag.
> - Link to v1: https://lore.kernel.org/r/20261002-stmmac-hwtstamp-missing-=
lock-v1-1-189ce151a624@oss.qualcomm.com
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
> base-commit: aaaaf87ea99b8766c9a8aa0e71aa42e6bc8a5320
> change-id: 20261002-stmmac-hwtstamp-missing-lock-b6a7979c643c
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--6hfszCiDjWHCFxZ3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasTtfAAKCRA6cBh0uS2t
rM5NAP9Eza8nyukSl9Qo1CMplJnUvHBmCko08k7lFeliq50iBwD/QJp1fcMk51+3
rSPRkfEo2InsTtqIfLt4rb751iUC7Qc=
=JIfZ
-----END PGP SIGNATURE-----

--6hfszCiDjWHCFxZ3--

