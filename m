Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A66C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkytsX2493oZhSqMdRdXpM7ssRvUOFLQTqg/Kr4r0k4=; b=S6dm/vmMzq81mHYbKFSn78iCuI
	Eadw+kT23s5FaQM+qa7yLn1+Eh46C6BgB31Rq5NTE0oS7n8bNIK/r9LTLVhFwZ++d9eRTivP3kclD
	53azUcqrXBaev46yIxkg/BUiqDCIF8oO6sp62qsmCt4O4zMlyfsV2ssjFZO3bB00P4ipKSpguK8HZ
	wBjp7hxA+sUhQ4t8wpRyVBC+yLB8L5BWmPfE3hHcEPBv0uNApIutfzDqV8dNPLrdAg456Z3KisCcG
	UILxrdbC7RPSpibdf9AzLomfwXu+q5z7IOMSvXAhAoPUx4HsnUKWa0dhb3ChWMmr3QXLxo5GUBBCm
	fMqn0KBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ShS-0000000Dekm-3Msv;
	Fri, 18 Sep 2026 07:07:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ShQ-0000000Dek3-2SWU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:07:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I60hTC362815
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 07:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AkytsX2493oZhSqMdRdXpM7s
	sRvUOFLQTqg/Kr4r0k4=; b=lM8iLofEdhDCimhKaod0wVawIEDPcSuiJsLG7h+j
	/PvYZxiS0UHvyRoxfBnCuzB0BTgGAHTkzTUbACWDuPzcdC8LpDXU/lJzLiugB2fe
	TuOGJ3KF5HHKSMpeDUQfVtftXat96Zdb7maX1YktqctjvZS9h3skeYOaItvz4EDY
	5jIb879lAn26EsIzxt2Rwyn49YOA4ikuuEX8dWjeUq6uvCannUkdJBqhxsSm+gsb
	owv6b8OEZ4V04IaXUWuHhfTp+O8x5k5CTi0I/1psDZqH2/UePehYTwmwXGV5Rha3
	OMNp0Tfg+CVnGPxYdqNjz5GQcfmBSpki7sNG7jfN6jtCTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6kyyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 07:07:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso85421285a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 00:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789715274; x=1790320074; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AkytsX2493oZhSqMdRdXpM7ssRvUOFLQTqg/Kr4r0k4=;
        b=JCWReYpDd6oy38fr6+I98u+LWR7330sB4woAmvGU46t5af+QHFUPsq7Bfb+O3j0Y35
         szR2V0XmczVMo8RLc9HsGxtty8AmjWkngZ3ZfxtJulrCvcyUrtxMrlSooFftfju/80mH
         8ZCuoPSdEGe8BdL+3YjSTgAliIgzBA9wrp98svCsZ11prNbMq1RbT94VdCb+i/h/Qmwu
         5Ap3hH0ALTduqhbkCrqtORLBt4IphX26TkyZw+k5gdAu0zirUO7wn/IitKAIsN/dFqjl
         vnTGo8dtmf3T6azPiEwADPyex+HMWGHav/JDBeHFFgyAcDfkNNQXdimVi78wjvvII5Je
         fnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715274; x=1790320074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AkytsX2493oZhSqMdRdXpM7ssRvUOFLQTqg/Kr4r0k4=;
        b=IU3akcGITz5R5iDrTbfOcLJ6OLyBj0k4TcE/Vw86aaax7zxrNoUn5sKYTMZRWYStUk
         7+s05V89P7Kj/W5kduiCQ48Pnz0MrQM5EL6TirauwnwIbEZoMl500oY0zqUZL56NLnM+
         cdOQuW4Cd9TpSMgL7pvE3cn9bBotRfh9WJzq8m5b4aCamwinKUU0gANkgP45Dm9CmT3Q
         f70bNNIxbBpi39cyhd7dMdUpaJRvQGpj4fGjtXNdWTWXu/oJqSM5C03TNCLAIl8FgLT5
         iXvBZLrXmIPtaGYd1KHeUGU/fn48eTs4QmHqTwY/fjwpOTyYIGXIpkKUW/FPKy3scj5x
         08NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSNjX4+cgkVnI1QiiqU4vAt1Avn3tkxzpKK7b8EIwtlc8YI9srgH3dyaWkciwgQxeTyomjTluBCQb2skSqkN+C@lists.infradead.org
X-Gm-Message-State: AFuF++mzFjTup/Nog5aK9nRyQ0dxkKH6uYr6SSFOv5SB/8281msRBu7y
	psG/LG2wRPswJ3I33gTdrpBy90EWVj+xsWCBHC5/QDAhhkw+TPpb0MoOa2lSl1MBXAwSn7s7HT9
	y/0+ZWYyoqwQ+ArPD/sLdo07Uv58rYKYbYY+/phGUxVRmIsEycVsTz+HsFGDLOoMEUfdKKCOgvj
	MkNA==
X-Gm-Gg: AYBFou3UV5sotTJ02IDJQXwA+Mj4MD36m8X1zgBYy/95JFz1Qgvdby1BNfZkhg+Jb3v
	WXk9GS7PSE3fMgd4AclDQNSGUoLyV8M+ry+SA5bCy4T6aZmCij5d/fJPaJLDS2tzovHT8Ff5TYc
	0ohntqxA1sgEEHeIZ+j09CujmJJVHFoUAJAdT9Hdrnp2awfE6pdahGpsqBOb/WKEU8z5dseLIwN
	okB85MVVNwwcN0oe/Ce6hN1N15u2GO2ECqXCaSZX60qDwLMxJim03XV7V1sUOMWYXb2oDXbaEYs
	tQvbNPu1enxcdTmRk+AxXwiDqwMDosn7LLaJySdGhY+uTqEW5Z9nxzdSV4jCDYLF1IjMf1NvTRs
	nED9V4aWK05GbOoaOv96u4k6WJ/tYZ5H51bLM6A==
X-Received: by 2002:a05:620a:6012:b0:915:a953:4b9c with SMTP id af79cd13be357-93bdc698a93mr190969185a.3.1789715274383;
        Fri, 18 Sep 2026 00:07:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6012:b0:915:a953:4b9c with SMTP id af79cd13be357-93bdc698a93mr190965285a.3.1789715273806;
        Fri, 18 Sep 2026 00:07:53 -0700 (PDT)
Received: from localhost (77-32-99-124.dyn.eolo.it. [77.32.99.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24034esm161065645e9.15.2026.09.18.00.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:07:52 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:07:50 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Thomas Karpiniec <tom.karpiniec@outlook.com>
Cc: netdev@vger.kernel.org, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Choong Yong Liang <yong.liang.choong@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Coia Prant <coiaprant@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/3] net: stmmac: propagate platform mac_finish
 errors
Message-ID: <aqzjRcKWGBVb2dyg@lore-qca>
References: <SJ2PR11MB8401F5C3A075DE2A0013E063E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
 <SJ2PR11MB8401FFBBECB8FBBA9C002134E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y1ppLvKxKDdIbxN5"
Content-Disposition: inline
In-Reply-To: <SJ2PR11MB8401FFBBECB8FBBA9C002134E4872@SJ2PR11MB8401.namprd11.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA5NSBTYWx0ZWRfXwLXPD9+dWtB4
 hRXbVV8lV3nR6Ys1csahstSqtvltHv8WHKLnpNj1shpG3WT5jiETq1FZIVEhsygCNqSyq9p3FHw
 KodVVYzeU0QYOJz10i+hxxHZvj/UtimTRByT7Kk1I/94FoSJvwbH7uSb/F9B4KPiik0WmJSwH7s
 h08O0YHUNIBYYR5U9bCctthC+V1QIFZzylmev/orY6LKy91iF0BGoEFD4ueGcC3Bf5a+fD+no0Q
 hMRVrQ8In5rVP1nND8l+dduoEyAZyuJDebBIDRonxAHmdy10FDIdWw/0ou9as77zKlJlIWT5SxN
 lZHfziVoyaTTCVx4+LTQtui6tKwZfSM1289ZttFmpUO9PPSHl/9SnI/Yneo2MuLhGIWImJhrhPa
 bz1LJf0XjHiEIXLoHs8RAY2Izu5foQIdfAINQeA8VKMb/vNFdXc2/q2HOGxrhtr6TLZmYv28f/Y
 0SQLLaSV9AefSGtD/Ew==
X-Proofpoint-GUID: jeUmJPcZa9zZKiNiKJRcry0mz--sJjtL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA5NSBTYWx0ZWRfX43AnUl3QN+lP
 3eaAsR5tY6fWkZeLvvt5dspYMFw74BpN/12lhGeNwjjc5mSMlIjHpjBoGpkJzOuXcvPiJcsRmqY
 Rg1JDM842ATsl2FxF7V6O617iVm5Ux4=
X-Proofpoint-ORIG-GUID: jeUmJPcZa9zZKiNiKJRcry0mz--sJjtL
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aace34b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oN7owVyBLNHHe3W6XE6vpg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=9dhsta6yqxhMeNE18noA:9 a=CjuIK1q_8ugA:10
 a=l3wzEGKSjxwMGPmveUEA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_000756_741652_F609B0A6 
X-CRM114-Status: GOOD (  24.37  )
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

--y1ppLvKxKDdIbxN5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Thomas Karpiniec <tom@wendy.sh>
>=20
> stmmac_mac_finish() discards the platform callback's return value and
> always reports success to phylink. For example, the Qualcomm ETHQOS
> callback can return an error from phy_set_mode_ext() if SerDes
> configuration fails. Phylink then treats the interface as successfully
> configured and can report carrier even though the SerDes is not ready.
>=20
> Return the platform callback's result so that phylink can report the
> failure and keep the link down until a subsequent configuration succeeds.
> Keep returning zero when no platform callback is installed.
>=20
> Fixes: e654cfc718d4 ("net: stmmac: configure SerDes on mac_finish")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM sparse
> Signed-off-by: Thomas Karpiniec <tom@wendy.sh>
> Acked-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 1fb5f804ea23..1350e92943ac 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1048,8 +1048,8 @@ static int stmmac_mac_finish(struct phylink_config =
*config, unsigned int mode,
>  	struct stmmac_priv *priv =3D netdev_priv(ndev);
> =20
>  	if (priv->plat->mac_finish)
> -		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
> -				       interface);
> +		return priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
> +					     interface);
> =20
>  	return 0;
>  }
> --=20
> 2.54.0 (Apple Git-157)
>=20
>=20

--y1ppLvKxKDdIbxN5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqzjRQAKCRA6cBh0uS2t
rAQQAP9pZYjJEEjVyy6ZeDwCbVXtT7BVVF5T0zNpP2F2lURjvAD/RWQFaNQLdsGC
gsAp0m8owRMLJRx+SUPf+1FAkHDhMAo=
=GAAQ
-----END PGP SIGNATURE-----

--y1ppLvKxKDdIbxN5--

