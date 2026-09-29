Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE83C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRA7DODR2959lHEtpusPTNFuptGLf/zMYDjv6njZNl0=; b=nqYcgro9nG71RQRNKMg/GMtMGP
	Ba4wjBY3Di41aPishPxd9GlGvbgQlHnlQ1Rt9oaHlHGoopgGjRJX1iYQvoDqNy48ewzTL3HPgta7b
	e6skg5ifHt9Edqwew4uWSoqcoODU6nVVH8Yp3Whr8H3ByhEHNN2yrb4dSnMGcbb6HCjvrPLlRzt40
	d+rbDPBKqRTuHC54aSjfs0homBKwKosZO9HAnQvuGXLv4oiB6hezeu5sS9dYxbMMwErCSQOQj/nHZ
	vYANPA0YEB/2Jb68+Vok5eao3PybtyxKGQVFGoh8+3RxnEJtaTfmk1nFYToAe5dQRt5OaU5g2sYp0
	fGX3NKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS1y-00000002ZFd-0ZGE;
	Tue, 29 Sep 2026 07:13:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS1v-00000002ZFG-3JMV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:13:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T478YG3643005
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 07:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aRA7DODR2959lHEtpusPTNFu
	ptGLf/zMYDjv6njZNl0=; b=ppg4JIaNJrD60qPhc3j5QQ2Br97bfPxdFzjvjiAH
	wVEg2El/VgB1E8kCP2fxP2I+Bb8VSI6MgatqI5IKjhXWtaeY/LK1d9vYP1KKLmry
	jOZ/m8gusaZI7lLOH9Qv8iDEJfS56NdIbO4fRANNs5+O31eR0EAQGLk1dEEM+w4b
	SoAk2yyRrN5k5eZ1PYf3B2Jz9UYqH4HMzpxe8C9t8u9f54LcBRJw4zMr0FDHjnoX
	BLZZrFNxjAktdirKEzOC3XZWk25lJLXwD2aKr13UFF8Jxo9OGH1aF492qZGEfUqM
	uYy6NVQ5IC5zkBO+dIifZKY1hE5wuLx2L7xPazOfkrTsDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4sqqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 07:13:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c444b438aso834306785a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790666014; x=1791270814; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aRA7DODR2959lHEtpusPTNFuptGLf/zMYDjv6njZNl0=;
        b=AQZtiYeW4wlsFqjRmYzOW47Gab/cOr8wItGhn+RAizGn8LhEdqq4DX5CDdgW5rGCWX
         7PVFjVHzIBdpluafVWj5dp9Oqz0uCenzgaqJMmKFtn6GM3T9QwHpIiNDLqnk3X+ZdMS7
         dUKhMEPRUn2HZ79p62Yggl4my9Ys9nwWpDeouPzl/Gz4+63c6GEWLDrBCBLY0N4pQVVm
         V0BCRWva04iJXsUd+x91X7PWpmagt1dtlEWkz4Ycy2nTq7wI5ZbUjAhtUWt+3xWwCv6J
         kO5Jshs86a2TcxUT7rbmsyoCQCIyTmmXIAnW8Z4Qa9eBcWmjhSylLQu3Hb4anxmV1gyN
         CQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666014; x=1791270814;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRA7DODR2959lHEtpusPTNFuptGLf/zMYDjv6njZNl0=;
        b=ybpdgd2BCsyM2Yh8ypQ4Tb6epkxNdRIQXLNSCIv2KTzBDtMF8YH1g/wvvkCBM4hsud
         6ZIrcP43i8kBcaZ9cvpEtSyQ1x59F2ZO1q7wg7XmxW4AYkmnjjQyb6Qd9EPubODvZTtE
         5bDvFLAHdQT335gY7yUL3c/A0yuSyzOZfs8+B2xt+fZLx+X1nKifW5acUr2LYto1UvNo
         8X4/xjAnQE29CVZ5bb3f5v5SMA6gditw3IbL+cBZfXr9NOgZFW9REXfkueAhrIlMR+Ql
         4uGXEoPvsCl39vpt2Lqxa7S8jnnSJvnFJbNgvcdR3y2A/soOiuj0BDmy1pjJfq0pF+Ej
         zrEQ==
X-Forwarded-Encrypted: i=1; AKwUvBygRHwhlLQkA6gmb7W7FaeFby8Gc52u1q1145jBl81VoXmMpsZeGMCPQEdFpo/RVUZueEG0onYVyPNtr9PofoiZ@lists.infradead.org
X-Gm-Message-State: AFuF++lTie1Me18GhAsr+fv1CrwxgtLK1cUeYMndc5T6F1AyKBbQn/Fd
	raB1uYGB6o1S27dcEJifX5jfXZlLBIuZ6yJ/AmL8wu6/aNMobMx6iWnKbCeNufnYzwpEnQHyKol
	WKfG/+cnP56EL1MdSslIDNCvlSpSZbGRnEosEO8oJsoG9/cLZixqrtWPpCL8v/XSXsg2uREneuX
	/p7g==
X-Gm-Gg: AYBFou0BVaI2qM4XakWtHCKdxaeBEqFlVP1d+9V4i3Th1ZrKYSkFCkqBqtbhNtQwVeI
	EJVd4ZCu8AanacL8wo1tEfLZsB5eSFJ/dYm30yJjLY3LXsJBtTHa2tPbodx7GZuev/23sYLNQVX
	F8rHbvuVyYIeBccfcBrQrMMCtxKkFe84ewcu5FpX4bzjX+AjN3DL5TRJnJXp99TPrc9CQan7AlN
	6GJqdCVnjq3RBOECu+mCnxjJ9beK7ANJrXnhdxtTFzSn7xGkgoDg9fCHihMWNtb8g/kAnnly0h7
	XGhcjfWSl3qTyx0XNo2HsIS2xb12aJ4cHkRfu+P/qwZ13i6Ck6GR/y78SzxQXyYYPR4PRpYUFYv
	1efZi7p+DYPYfcg==
X-Received: by 2002:a05:620a:404d:b0:93b:ee1e:6714 with SMTP id af79cd13be357-93c43d2359dmr2340390585a.60.1790666013992;
        Tue, 29 Sep 2026 00:13:33 -0700 (PDT)
X-Received: by 2002:a05:620a:404d:b0:93b:ee1e:6714 with SMTP id af79cd13be357-93c43d2359dmr2340386485a.60.1790666013318;
        Tue, 29 Sep 2026 00:13:33 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af507f33fsm1745638f8f.24.2026.09.29.00.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:13:32 -0700 (PDT)
Date: Tue, 29 Sep 2026 09:13:31 +0200
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
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Don't set or get RSS
 parameters when not supported
Message-ID: <artlGxdHjIKyuPuP@lore-desk>
References: <20260928145043.1228968-1-maxime.chevallier@bootlin.com>
 <20260928145043.1228968-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UlNQx2lngAS2JeLJ"
Content-Disposition: inline
In-Reply-To: <20260928145043.1228968-3-maxime.chevallier@bootlin.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyOCBTYWx0ZWRfX3PGQcDRetfih
 pEFfrtLJMrvVMThwRfmoOlvgFlu4otC+zsu3OZw14SkPFDztkT+zQdirW/SXRPEqwXZmlIalQBJ
 te87rAvdSsJ5NIITE0Bqq50diuwKsvs=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb651f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=8xPVtbtLPbnhiEF_wpUA:9 a=CjuIK1q_8ugA:10
 a=pZA6dvReJZDbMZWyEwoA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyOCBTYWx0ZWRfXx9ou4tzCIbFi
 XaFps5CLamA+9TDuoysaO5oKKH0dOm4PGU6DyBzCpezEyDTtk7phbhAbUC9zkfykA6cFGo/MeK4
 y73lAZpaO7EeGXdQZ3PfqXzI+a4vDzf6fEZl62omAu+gnnTHWAUmnsFzGMwqK79K2mvLt0Ynx0m
 xwDBYIiYM3zx2C21+EHIhdpiRt+LpYmrW79Mekdwkm6gmK1oGno1oySVcm/6CGZjHHT+A75jqOU
 GPnECd0othYlJDuDGcfyIdJkrTVRRBjU7cU5S80iU/fTOrU1E2uoiupR9danMJdYi8A60+o1VVm
 GuLaXhRWOsMx0zDW6RYWLGAMx48GfJJ2nXl7fAJI2iFk60AX9ZNcHD7tibhUzTUDI8QUNZFEdyI
 xMZnSAsnAf1n3kbERuNUt4ABqHu/CLmWbSdeD8U2pzVPTH3LgKgxPEMO7bjHflDMAWRC+PHKmqV
 IBi3p2dPkwzn2cqOuug==
X-Proofpoint-GUID: bDyKJoYa7IwNenKPU5tm5ep1Yky-hsKv
X-Proofpoint-ORIG-GUID: bDyKJoYa7IwNenKPU5tm5ep1Yky-hsKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_001335_838011_5ED66B10 
X-CRM114-Status: GOOD (  25.30  )
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

--UlNQx2lngAS2JeLJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The RSS kselftests fail on stmmac, and this is partly due to the driver
> reporting bogus data for the RSS ops :
>=20
>  - ethtool -x reports an indirection table and a key while the hardware
>    doesn't have any of that
>  - ethtool -X fails with -EINVAL.
>=20
> Let's return early in the rss ops if we know the hardware and platform
> don't support RSS.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drive=
rs/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 154cc0c7623d..b78dc301d70d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -927,6 +927,9 @@ static u32 stmmac_get_rxfh_key_size(struct net_device=
 *dev)
>  {
>  	struct stmmac_priv *priv =3D netdev_priv(dev);
> =20
> +	if (!stmmac_rss_is_supported(priv))
> +		return 0;
> +
>  	return sizeof(priv->rss.key);
>  }
> =20
> @@ -934,6 +937,9 @@ static u32 stmmac_get_rxfh_indir_size(struct net_devi=
ce *dev)
>  {
>  	struct stmmac_priv *priv =3D netdev_priv(dev);
> =20
> +	if (!stmmac_rss_is_supported(priv))
> +		return 0;
> +
>  	return ARRAY_SIZE(priv->rss.table);
>  }
> =20
> @@ -943,6 +949,9 @@ static int stmmac_get_rxfh(struct net_device *dev,
>  	struct stmmac_priv *priv =3D netdev_priv(dev);
>  	int i;
> =20
> +	if (!stmmac_rss_is_supported(priv))
> +		return -EOPNOTSUPP;
> +
>  	if (rxfh->indir) {
>  		for (i =3D 0; i < ARRAY_SIZE(priv->rss.table); i++)
>  			rxfh->indir[i] =3D priv->rss.table[i];
> @@ -962,6 +971,9 @@ static int stmmac_set_rxfh(struct net_device *dev,
>  	struct stmmac_priv *priv =3D netdev_priv(dev);
>  	int i;
> =20
> +	if (!stmmac_rss_is_supported(priv))
> +		return -EOPNOTSUPP;
> +
>  	if (rxfh->hfunc !=3D ETH_RSS_HASH_NO_CHANGE &&
>  	    rxfh->hfunc !=3D ETH_RSS_HASH_TOP)
>  		return -EOPNOTSUPP;
> --=20
> 2.55.0
>=20
>=20

--UlNQx2lngAS2JeLJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCartlGwAKCRA6cBh0uS2t
rJCeAQCl/sM1/UiVOqNd4jhL5Oy3pU029vOCKWXEOSlJSz+XZgD/d+i/oeT18HiZ
DpFlaHzEx66iglM4gU7yoatpOMjQPwc=
=kiG3
-----END PGP SIGNATURE-----

--UlNQx2lngAS2JeLJ--

