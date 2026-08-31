Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6F8C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pns1MihtwmL9c9kT7PkCbhGsfSXcaatikP6GSVqofzI=; b=skkAGTVJ0/Q2KKEnK2fue+aaWl
	dCn+KCkH8SoBW5vmO1sK//x6TCVHGneadqZMysXmM6tYMcVVSTKDmx5zT9WAPy7MFUZas7asIT0nu
	a7yz96NKXneG6G2l5+MgL51gpY0uplAiqAQenmtozu0Y+ITzxxtXR7dB4ZIVuB7MXzB4gidakfhBy
	9+r8SEjsWyBkwmcxBUslCarQEq6BGkKM+IwBFYkXSvgsZWnJDoALp4RORjtdB76K5CA8uCMRgwduS
	7qUN59/0iMkPjuwvWItF5Mmwa2azeIRc4TLNheEr6W0YpiMMfwzfEsAB01j4jNb4WVDtrH/xtIYto
	lNBiGz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13O0-00000009iNC-2kLz;
	Mon, 31 Aug 2026 14:53:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Ny-00000009iMl-3sbz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 14:53:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETLx52719902
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 14:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pns1MihtwmL9c9kT7PkCbhGs
	fSXcaatikP6GSVqofzI=; b=KnmebIwPGIvQjMQbwb2Ri7O6NXENkpCYU1MPlyg9
	jJm8lPmH6SY8c3U6eEv+DklfaKhiiOrfrdRwbkhb3u5JeBnVkPXRUZdAeqdOUEmn
	rrIxBYaUt8LyOcZqDPrImL+VtZkuuEmSnk/k3YmgAIfgSgXIDCIEgCjsT5Lwt1LT
	vcHYvGF8mB1yV2lMTKO3iQmEaB7uEBcgSU52kzgS56sRjdVrbzSspnkLDV36N9lH
	jqe7IwXuv+vtS8PBnK0n2kQ3Cn3M6rbTnUouN+RW6vKhcdpepvgcyT4dpGfj29Ct
	YjRYa+yTwD44mlT+xll+QwE+jUEY4veN5h05MHv7W24Glw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vahb5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 14:53:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93922c75037so241420185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 07:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188001; x=1788792801; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pns1MihtwmL9c9kT7PkCbhGsfSXcaatikP6GSVqofzI=;
        b=Tx1tHfUxWzNA5ezB3yRpaBWKj6Yq0cy0iIbO3G/eNswjrFbZ6lR36BN2KGdnG2YkbQ
         lWAbBXS5bfFskWH/xX6OjpqGEceYcGrNh9/6LHBFefvuKekIfT/Ff7YOLYc45pdEkRVs
         D+H3XlQ7fDmFYaszUBvox1qRYq+4MgPI6ot2qgGg6l5E/jSsXpeGIk07Xmgj8AvW1mCV
         SUXz+12B7NsXNifkrrQfOhq2lHA+rNAyIgrVGuifEcHqMii3qPGS1S5cicKFhMdBHYT1
         vk31teWb2I8Cm1aENnQ2s2EMV7N0fBcKrUydnr0eP2lUIflzQcj1cEYBnbKkMG5pE7GV
         v+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188001; x=1788792801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pns1MihtwmL9c9kT7PkCbhGsfSXcaatikP6GSVqofzI=;
        b=W7bwKezYTIXuu3Yk1Znl/+uuuJODvat/SvWWFSxxUeqmG9fMt0dEJGkSgv49E7Fw65
         2UCdnyzxiE2cg5J1qiEQ2YAb5RDwQM9Q//35vh251sUBeiNEEbR840VZBXh3Q1tYZ7DJ
         hBDXllIcspL7tE9cQI6pTNuxmotAtDFiBl/8MX1yBMDjjaSZxy3drYiFG5elv0u6GvZ2
         Ge8MNWz+Mh4x7lZ7iOu+6ZUl9t1mzVkY7lKMnfXqQQTp2xpQ+vP268RpdJsQc97a9zPr
         5xMqSNskkfzl5gbUFidmAygiyPMjIGNXUNtnvaqIHp0AlYCjsHbRPdJ9mKD2kQxAOhL8
         s2pA==
X-Forwarded-Encrypted: i=1; AHgh+RqQYCfe/n7Jfp1tKzTiG+KsExy2LuBwu5oIQTnGnp90FajvU3Ihh8z+NNlL1PEfhPJ6mBUvan+oEmsKaW8l3TiO@lists.infradead.org
X-Gm-Message-State: AFuF++nTY+1GUr6Gj9GkhubusRlf69SIT0VkMTYVaKB+pG+fiXnBRUkT
	akJ0BHbgrgtHEfGMiHboB6Ug5oqskK+lRTZP1qYPz9f9jrZ2vgxL+9+yoD3v7KO3GE0iBWtfAvN
	YVUQ6QjZZBSmJ33BlnK7Noq4NGUroKsIJi/nri1kacJFVHxnlvCb1DdZR2jQDPgZB0WY3GLWL+6
	RHlw==
X-Gm-Gg: AR+sD12iwEp+6y9nwAPDPESU0bCqyoZtP/xxnbAg1UFJPFLRErE6rVCu/f7AKO1zHQJ
	2O9ylrIYw+qJpmnTbNkSj8iylu/hX9UL+6p64kVavCYn4hyUaANuEGdJXMsXd3ZjhMxmo/H6/1G
	yrlAjBogDWnNWsaSBuVW7wKkxniqqUgfKmu3wT8ozYmPbVgcIFdiBK/ouaJXT1lqi/cM6gJpSQq
	dBawVxUZyzLhQnkc4o/6mD2Ce8cesNECot1TKnj/uARadNbD2XQKrhFrT79Vz0o678YqOS6l1a3
	MNDR03C1IVJ/k5HKlulVBz4wDTr6Cii0clVDaPTayPdhbPP8WZ6Qds0wOKtx90mtfRMSygQryNg
	xV9ODk27KNkUquA==
X-Received: by 2002:a05:620a:678c:b0:939:4a47:932b with SMTP id af79cd13be357-9394a47946fmr18915585a.36.1788188000869;
        Mon, 31 Aug 2026 07:53:20 -0700 (PDT)
X-Received: by 2002:a05:620a:678c:b0:939:4a47:932b with SMTP id af79cd13be357-9394a47946fmr18907885a.36.1788188000170;
        Mon, 31 Aug 2026 07:53:20 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2e6e8sm25248955f8f.32.2026.08.31.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:53:19 -0700 (PDT)
Date: Mon, 31 Aug 2026 16:53:18 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>
Subject: Re: [PATCH net v2] net: stmmac: re-apply taprio offload in
 __stmmac_open()
Message-ID: <apWVXj8eGhckxhMD@lore-desk>
References: <20260829-stmmac-est-reapply-after-open-v2-1-5e5ccb185e92@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uy84GhePRTg6nSKL"
Content-Disposition: inline
In-Reply-To: <20260829-stmmac-est-reapply-after-open-v2-1-5e5ccb185e92@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOCBTYWx0ZWRfXxiQ61GXzJ3HS
 Dw6p6jm5/aY0yDqZWSAW8hm6CH/JKmTt7bkw9/+Ow+B6cZneP5+f/4Cnb61NiaeJZSJIUS5CxuY
 pvW3BxkV2DRoK43ccUITwpqHUaAnt3JwRPJ/oHcvkpvR53xn1f87cSso1+ZgpPjIEw1RN6DbFzl
 6RipgGAal+GNU9GLcBG5bLDR21hGsw3j4kvc8ojQSQuSVXlSvQxQT58+DPMe12nE5Yp+BhI2fN7
 QDIwgVl54FFXGE3Z9yVh2TiBp6YIilewupOXLScAOZSOkTvviWRoaGbSfcRmRQVf74uCrCkJDVG
 5AT/QOlsiMKYVHJaMJK1wm8qX7yM9NzfYNgB1lGN41Pn8iiRQAifHP3BcoqV6GKTG7SG8eQsuJw
 8qR1PWTkG1RfAc0O3qF+crhtkrDLcLrS/oTc4Smej7GZz0Lfia0LPTVWX27BzY9Oo8TBVCvwTPR
 vdvnlFjMec8sXbniPKQ==
X-Authority-Analysis: v=2.4 cv=YYmNIQRf c=1 sm=1 tr=0 ts=6a959562 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=JpBpa1p7AAAA:8 a=YmQodEPVK1i-oBXoWTAA:9
 a=CjuIK1q_8ugA:10 a=OdBlZyHpQ6Ekdqw2xb0A:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=YCh05so4W2E6r1tszMC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOCBTYWx0ZWRfX9ZE+dkqew0ES
 Dcs2/gLA8YmXVuWGVu71KEr51fOK8r7p2XCmJgIiKFOrZofi3+nF4KAuK3fGfyil6U71dlbt2wt
 u4yURXdnh3giC9IXER4+RziAUD2mS2U=
X-Proofpoint-GUID: RicaOnNnLBlqofolOCL6pIk60MywCgRj
X-Proofpoint-ORIG-GUID: RicaOnNnLBlqofolOCL6pIk60MywCgRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_075322_981158_7B963851 
X-CRM114-Status: GOOD (  32.20  )
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

--Uy84GhePRTg6nSKL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The core soft reset issued in stmmac_init_dma_engine() clears the
> MTL_EST registers, but nothing re-applies the taprio offload after it:
> priv->est->enable stays true while the hardware EST block is left
> disabled. The TX/XDP paths then keep dropping frames larger than
> priv->est->max_sdu[] and taprio is reported as offloaded, although the
> EST block is not programmed.
>=20
> Re-apply the taprio offload in __stmmac_open() after PTP is up. The
> base time is recomputed from the reserved base time and the current PTP
> time, since the timestamp counter has been re-initialized and the
> previously programmed base time is stale.
> Introduce the stmmac_setup_est utility routine.
>=20
> Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler AP=
I")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rename stmmac_est_reconfigure() in stmmac_setup_est().
> - Rely on stmmac_setup_est() in tc_taprio_configure().
> - Link to v1: https://lore.kernel.org/r/20260825-stmmac-est-reapply-after=
-open-v1-1-dfa80735e0a1@oss.qualcomm.com

I will fix the issues reported by the following sashiko's report in v3.
https://sashiko.dev/#/patchset/20260829-stmmac-est-reapply-after-open-v2-1-=
5e5ccb185e92%40oss.qualcomm.com

Regards,
Lorenzo

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  | 33 +++++++++++++++++=
++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  |  2 ++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 16 +++++++++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 26 ++----------------
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 27 ++++++-----------=
--
>  5 files changed, 59 insertions(+), 45 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/n=
et/ethernet/stmicro/stmmac/stmmac_est.c
> index afc516059b89..bbebd33c8a88 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
> @@ -80,6 +80,39 @@ static int est_configure(struct stmmac_priv *priv, str=
uct stmmac_est *cfg,
>  	return 0;
>  }
> =20
> +int stmmac_setup_est(struct stmmac_priv *priv)
> +{
> +	struct timespec64 current_time, time;
> +	ktime_t current_time_ns, basetime;
> +	u64 cycle_time;
> +	int err;
> +
> +	mutex_lock(&priv->est_lock);
> +
> +	priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
> +	current_time_ns =3D timespec64_to_ktime(current_time);
> +
> +	time.tv_nsec =3D priv->est->btr_reserve[0];
> +	time.tv_sec =3D priv->est->btr_reserve[1];
> +	basetime =3D timespec64_to_ktime(time);
> +
> +	cycle_time =3D (u64)priv->est->ctr[1] * NSEC_PER_SEC + priv->est->ctr[0=
];
> +
> +	time =3D stmmac_calc_tas_basetime(basetime, current_time_ns, cycle_time=
);
> +	priv->est->btr[0] =3D (u32)time.tv_nsec;
> +	priv->est->btr[1] =3D (u32)time.tv_sec;
> +
> +	err =3D stmmac_est_configure(priv, priv, priv->est,
> +				   priv->plat->clk_ptp_rate);
> +
> +	mutex_unlock(&priv->est_lock);
> +
> +	if (err)
> +		netdev_err(priv->dev, "failed to re-configure EST\n");
> +
> +	return err;
> +}
> +
>  static void est_irq_status(struct stmmac_priv *priv, struct net_device *=
dev,
>  			   struct stmmac_extra_stats *x, u32 txqcnt)
>  {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h b/drivers/n=
et/ethernet/stmicro/stmmac/stmmac_est.h
> index f70221c9c84a..f620d3331c2c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
> @@ -65,3 +65,5 @@
>  #define EST_GCL_DATA			0x00000034
> =20
>  extern const struct stmmac_est_ops dwmac510_est_ops;
> +
> +int stmmac_setup_est(struct stmmac_priv *priv);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index d576059c04df..b30036428188 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -48,6 +48,7 @@
>  #include "stmmac_ptp.h"
>  #include "stmmac_fpe.h"
>  #include "stmmac.h"
> +#include "stmmac_est.h"
>  #include "stmmac_pcs.h"
>  #include "stmmac_xdp.h"
>  #include <linux/reset.h>
> @@ -4153,11 +4154,22 @@ static int __stmmac_open(struct net_device *dev,
>  	ret =3D stmmac_hw_setup(dev);
>  	if (ret < 0) {
>  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
> -		goto init_error;
> +		return ret;
>  	}
> =20
>  	stmmac_setup_ptp(priv);
> =20
> +	/* The core soft reset in stmmac_hw_setup() clears the MTL_EST
> +	 * registers, so re-apply the taprio offload after PTP is up.
> +	 */
> +	if (priv->est && priv->est->enable) {
> +		ret =3D stmmac_setup_est(priv);
> +		if (ret < 0) {
> +			priv->est->enable =3D false;
> +			return ret;
> +		}
> +	}
> +
>  	stmmac_init_coalesce(priv);
> =20
>  	phylink_start(priv->phylink);
> @@ -4181,7 +4193,7 @@ static int __stmmac_open(struct net_device *dev,
>  		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
> =20
>  	stmmac_release_ptp(priv);
> -init_error:
> +
>  	return ret;
>  }
> =20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/n=
et/ethernet/stmicro/stmmac/stmmac_ptp.c
> index 960249960004..917ef7ddcae6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> @@ -8,6 +8,7 @@
>    Author: Rayagond Kokatanur <rayagond@vayavyalabs.com>
>  ************************************************************************=
*******/
>  #include "stmmac.h"
> +#include "stmmac_est.h"
>  #include "stmmac_ptp.h"
> =20
>  #define PTP_SAFE_TIME_OFFSET_NS	500000
> @@ -55,7 +56,6 @@ static int stmmac_adjust_time(struct ptp_clock_info *pt=
p, s64 delta)
>  	u32 quotient, reminder;
>  	int neg_adj =3D 0;
>  	bool xmac, est_rst =3D false;
> -	int ret;
> =20
>  	xmac =3D dwmac_is_xmac(priv->plat->core_type);
> =20
> @@ -84,30 +84,8 @@ static int stmmac_adjust_time(struct ptp_clock_info *p=
tp, s64 delta)
> =20
>  	/* Calculate new basetime and re-configured EST after PTP time adjust. =
*/
>  	if (est_rst) {
> -		struct timespec64 current_time, time;
> -		ktime_t current_time_ns, basetime;
> -		u64 cycle_time;
> -
> -		mutex_lock(&priv->est_lock);
> -		priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
> -		current_time_ns =3D timespec64_to_ktime(current_time);
> -		time.tv_nsec =3D priv->est->btr_reserve[0];
> -		time.tv_sec =3D priv->est->btr_reserve[1];
> -		basetime =3D timespec64_to_ktime(time);
> -		cycle_time =3D (u64)priv->est->ctr[1] * NSEC_PER_SEC +
> -			     priv->est->ctr[0];
> -		time =3D stmmac_calc_tas_basetime(basetime,
> -						current_time_ns,
> -						cycle_time);
> -
> -		priv->est->btr[0] =3D (u32)time.tv_nsec;
> -		priv->est->btr[1] =3D (u32)time.tv_sec;
>  		priv->est->enable =3D true;
> -		ret =3D stmmac_est_configure(priv, priv, priv->est,
> -					   priv->plat->clk_ptp_rate);
> -		mutex_unlock(&priv->est_lock);
> -		if (ret)
> -			netdev_err(priv->dev, "failed to configure EST\n");
> +		stmmac_setup_est(priv);
>  	}
> =20
>  	return 0;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/ne=
t/ethernet/stmicro/stmmac/stmmac_tc.c
> index 14cabe76e53e..b41df317d73c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -10,6 +10,7 @@
>  #include "dwmac4.h"
>  #include "dwmac5.h"
>  #include "stmmac.h"
> +#include "stmmac_est.h"
> =20
>  static void tc_fill_all_pass_entry(struct stmmac_tc_entry *entry)
>  {
> @@ -968,8 +969,7 @@ static int tc_taprio_configure(struct stmmac_priv *pr=
iv,
>  {
>  	u32 size, wid =3D priv->dma_cap.estwid, dep =3D priv->dma_cap.estdep;
>  	struct netlink_ext_ack *extack =3D qopt->mqprio.extack;
> -	struct timespec64 time, current_time, qopt_time;
> -	ktime_t current_time_ns;
> +	struct timespec64 time;
>  	int i, ret =3D 0;
>  	u64 ctr;
> =20
> @@ -1069,34 +1069,23 @@ static int tc_taprio_configure(struct stmmac_priv=
 *priv,
>  	}
> =20
>  	mutex_lock(&priv->est_lock);
> -	/* Adjust for real system time */
> -	priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
> -	current_time_ns =3D timespec64_to_ktime(current_time);
> -	time =3D stmmac_calc_tas_basetime(qopt->base_time, current_time_ns,
> -					qopt->cycle_time);
> -
> -	priv->est->btr[0] =3D (u32)time.tv_nsec;
> -	priv->est->btr[1] =3D (u32)time.tv_sec;
> =20
> -	qopt_time =3D ktime_to_timespec64(qopt->base_time);
> -	priv->est->btr_reserve[0] =3D (u32)qopt_time.tv_nsec;
> -	priv->est->btr_reserve[1] =3D (u32)qopt_time.tv_sec;
> +	time =3D ktime_to_timespec64(qopt->base_time);
> +	priv->est->btr_reserve[0] =3D (u32)time.tv_nsec;
> +	priv->est->btr_reserve[1] =3D (u32)time.tv_sec;
> =20
>  	ctr =3D qopt->cycle_time;
>  	priv->est->ctr[0] =3D do_div(ctr, NSEC_PER_SEC);
>  	priv->est->ctr[1] =3D (u32)ctr;
> =20
>  	priv->est->ter =3D qopt->cycle_time_extension;
> -
>  	tc_taprio_map_maxsdu_txq(priv, qopt);
> =20
> -	ret =3D stmmac_est_configure(priv, priv, priv->est,
> -				   priv->plat->clk_ptp_rate);
>  	mutex_unlock(&priv->est_lock);
> -	if (ret) {
> -		netdev_err(priv->dev, "failed to configure EST\n");
> +
> +	ret =3D stmmac_setup_est(priv);
> +	if (ret)
>  		goto disable;
> -	}
> =20
>  	ret =3D stmmac_fpe_map_preemption_class(priv, priv->dev, extack,
>  					      qopt->mqprio.preemptible_tcs);
>=20
> ---
> base-commit: 2188569e7e1b0bc3f3b557dc97ab7a02befc11c8
> change-id: 20260824-stmmac-est-reapply-after-open-181d70a15eb6
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--Uy84GhePRTg6nSKL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapWVXgAKCRA6cBh0uS2t
rGF0AQCSnwsBWdnSzufaq5R1abu0d2fGGSiKKrl9kADSv+NHNgEA0wYvVZyHdWvj
MTdgO1rqKsSBHvbiUAeHVXpdJxuDGQA=
=u2qb
-----END PGP SIGNATURE-----

--Uy84GhePRTg6nSKL--

