Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8EAC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ut7kgm3lbIbgif0w1qtAKfZwX8AzmJ0SyvmVTj0gdA=; b=tActSSQvg5cOVtY24bFo6S55y3
	AKgRKt7pxL4u5sc2rcYUpfqsJJg5zq+/s5lbbDBUHV+u1W116JLkvOnVCSZlzuqAou3+vvGz3hkkE
	Szri7KT7WNey3Pl3z9qvyyCNOFGXoSKnt8WAxS008bMCs6GLTaZl6usIiEkZ8ypiaaz5cf92b5UVp
	oqLgzpx6W8DFckxtGKeRh+Ouk+qR3blEhPhRTE5fPfoHa4IL+pMzI0AqpehcuExl7DGu/t9TWrFDr
	dkzIIgwiYgYE6zpNA+If5ObV/Q/2NpzBWA4PPuJK3EONPi26jkhGLLk5JQDW67xusZgZRVQzB4Imo
	g6AZuFvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jeI-00000008Xr1-0JA3;
	Wed, 16 Sep 2026 07:01:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jeE-00000008Xq0-3qBW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:01:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68qXa1955922
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 07:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Ut7kgm3lbIbgif0w1qtAKfZ
	wX8AzmJ0SyvmVTj0gdA=; b=bWMyIdc1uc9hXJVKe6ZNjVUgWVVhrdlwyggBXLCu
	8Kec5D51yYBYDR/RNHQXVGOtgTZMcyBsEtUzxZYUh/KTZzTpqf5GyiO+n7yzeGAo
	z34c39SWYjY7uVEsA4e+YfLRQOMxdO5XUOEemw75NpETLdhekixFXAAxRWpoP8jp
	yCXAq3GL8FV1NDi0pIq3TcN1qaPa+ZdT7Gli+FRte3GfXTuL1PdlFTyV4Qt1Y0zv
	MfTFO5K4zAccldwD48CSX2coflm5RF1CMwL9yc/H3l3dHSj5soWM9fgq31L4T6Qh
	WrrkpucoQ2iY6V3l/HAwb8je7Ir91nE0PcTyoiiLaVeTpw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdyw9x8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 07:01:35 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79129463b7cso4725549137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789542095; x=1790146895; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Ut7kgm3lbIbgif0w1qtAKfZwX8AzmJ0SyvmVTj0gdA=;
        b=TBeIwTE/dwX2LpG3SJ9WIXqXA9HVKfOt68tE15QG2sUNXxLp5X47dGiM5tdF10W+mW
         rx3T6zImTWD0waSOolTKtv27T0uhzolCJT3Dr9n8Y6lZuG9CBNBYtBbJo8SoCv4CRSzS
         oxxOwH4TMmcMx2A9yqfHhbL+ea88DKh3J7TSzrZQkMzwJuw076/CT8hHZo1av65RO/dh
         2+C15ZJT6c9pY3IBtMFvZmhb0aM2IWaqvctPGyf93TgF9rHB0YKDcR0IY0FHdAJEkCGa
         mgGfqIFvsoPin21fdwi7wa6OUP31knDzr0CFaBnqc/1cb+QHf/CaU702W8mBfbC0R7+Q
         lKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789542095; x=1790146895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ut7kgm3lbIbgif0w1qtAKfZwX8AzmJ0SyvmVTj0gdA=;
        b=KJrTa+E+V1Wp/qiupuMUZiHS+hWic9F0qGcxsDdfZVgyUBX8g0Sv5KOczIdFnrVWa4
         qHg/gGOTvRifTwxtejldELan2djX9wBZx0G9w+ZuCi/SDlREB4olBT7JvxkRw7MxB3HX
         FKd84jYg3M98kK8hp6PFlIR5nvzY6JUoRpGTDvbYEjfQSg8jiVtF4aNgv0e+DM1tLA/8
         r+L4dIC9Wf25SMxgmHxF9gfFR5FdmcvSPgA5oIlbnV3ZmeUHlwSpjqyJSdOuu/5orbe1
         uVc5EuNPHQTBK2YjKd85cf3wPMPEJ5s7eyPSwEjq9tX+ilibK7FEGB9nKCWP7rir/1uE
         IZQg==
X-Forwarded-Encrypted: i=1; AKwUvBzLWXuqKgbIJfk1vMbun8tVyhAaN0Q11RmEix2KqpGBLGGqYAXXrTmsipzBNHffe3eMzP90L1gZPVx8gokHEHsy@lists.infradead.org
X-Gm-Message-State: AFuF++kOSWw0CmOYvbTgKeGzbZmYBUjwfMvaIBa9fTOW6pJoaFcTGtuP
	evmVSuWd2hhScEoWELhjyPYIrKKoj0vR24jqAoOTNrWlU5JsvUGxJNP0a1x9G9bwx+howrP551X
	c28SLGCf04b5QjHNUagaMestDtMbwyeYJNXOBbtwXrhYP1WA2OER6Xz5LamO5n63J6obdoNrnpI
	IHgQ==
X-Gm-Gg: AYBFou2hsoflGlsIMYMroqZIevAC4VTm9uY96uvNwQ04JiUbSk7ldOfpvAHM1R/kqxp
	khDNW+3IXbqDQ28vI2g+G/0+bbwkYptpCyUhFujmrkNHRZyODk/uWB5mjb6sUkaQV8o5PfGosTx
	ZUs0kX40jUatmEo2gxDaXWcnlIuY1OQWG6XbuCklpCf76h/eAYAJyrInEjwPEAyF8rDiJVJQI/y
	W5ZJ9wPKrJGTj1d9fO5LYNRSZqlJUOvPQLtyBsoryIiO+gnGdsRESpwJpjVzNh7d5ILqkyx6NI6
	liiqsqkkVYGM9LDYBUL9LOwrf1g5I92GhwH1ATj/Q64HkX/+pmS/kBWBODK08fL1+D5b68E228Q
	0TgKDpSo0J9u7Tw==
X-Received: by 2002:a05:6102:41a2:b0:79b:1b6c:4f66 with SMTP id ada2fe7eead31-7a0247f043cmr1487036137.1.1789542094498;
        Wed, 16 Sep 2026 00:01:34 -0700 (PDT)
X-Received: by 2002:a05:6102:41a2:b0:79b:1b6c:4f66 with SMTP id ada2fe7eead31-7a0247f043cmr1486975137.1.1789542093963;
        Wed, 16 Sep 2026 00:01:33 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ed292fc12sm34571555e9.15.2026.09.16.00.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:01:33 -0700 (PDT)
Date: Wed, 16 Sep 2026 09:01:32 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: mediatek: fix PPE resource leak on remove
Message-ID: <aqo-zBZDb0v_20w9@lore-desk>
References: <20260916051618.2904439-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JPSBXS7aDo/qX3Vv"
Content-Disposition: inline
In-Reply-To: <20260916051618.2904439-1-lgs201920130244@gmail.com>
X-Proofpoint-GUID: TlrWY_AVIQza6GeG1QHitBPSLEnCCLIT
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa3ecf cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fix1ya3lApHd03os7AAA:9 a=CjuIK1q_8ugA:10
 a=NtCxNmvqVL2YQJkQa48A:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA4OSBTYWx0ZWRfX5Zlu1XKkitF7
 5RJ2OClCHEsdLyQaAp6Ac1cxTxAsPJA8zguUS5RH3qIKLeyGW7US01LGqWKwWyt2zxnz6m60COx
 MFl7EnVp4n3se2CEVHi7nrysrLQU5RCBsTUhDH9G4NpPdPsmo859b3XdPcH1C+4xw0JQTXvl5iX
 iS1V7ByVKc5gBuZDpKYREaowmuYSf0x5MNNL60fQonrMSubltZgZ40Wmj+P2n9QtQG3M6hAF8e/
 faT1ZF7RfU6Eab0bo0IM3Bg7rB7gV64+xupmeUSXf/q55/OQFk6D4q15heSe8Ae0G1F/5BuKaM8
 CmyPBAD+I31awvIRtO9utwF9fY8i7allY0LeYvB0lyiwxqfhvIIlEXS1bzZfex7VL+7NorySyx9
 E4i2myJalk13m77zMV+Rys67KpGcTb4GhEpHOuYMFuANww3cnpipmPVbKf7UtYdAPvpOb+lWZEA
 qOfEHZzoISFKtQJLRMw==
X-Proofpoint-ORIG-GUID: TlrWY_AVIQza6GeG1QHitBPSLEnCCLIT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA4OSBTYWx0ZWRfXwznFnTZsNbYN
 GFjsY1SWgI/y9YTpNxzWdG+dRFnEJqtb+c7um0yTHWlY3bD6Vd+ajZRH0MkEFfzg/iQs3fXJjIq
 Aidx9GiQ/l1yPwAp/H00juk8ZidSGJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_000138_962217_947089B7 
X-CRM114-Status: GOOD (  20.23  )
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

--JPSBXS7aDo/qX3Vv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mtk_ppe_init() initializes the l2_flows rhashtable for each PPE
> instance.
>=20
> The probe failure path releases these resources with
> mtk_ppe_deinit(). However, after a successful probe, mtk_remove()
> tears down the network devices without calling mtk_ppe_deinit(),
> leaving the PPE rhashtable resources allocated.
>=20
> Call mtk_ppe_deinit() during device removal before freeing the network
> devices.
>=20
> This issue was found by manual code inspection.
>=20
> Fixes: 33fc42de3327 ("net: ethernet: mtk_eth_soc: support creating mac ad=
dress based offload entries")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.c
> index be3bd025c41a..04d0a1eec4cf 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -5394,6 +5394,7 @@ static void mtk_remove(struct platform_device *pdev)
> =20
>  	netif_napi_del(&eth->tx_napi);
>  	netif_napi_del(&eth->rx_napi);
> +	mtk_ppe_deinit(eth);
>  	mtk_cleanup(eth);
>  	free_netdev(eth->dummy_dev);
>  	mtk_mdio_cleanup(eth);
> --=20
> 2.43.0
>=20
>=20

--JPSBXS7aDo/qX3Vv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqo+zAAKCRA6cBh0uS2t
rFAWAP9S+DvP3rvVFwcvFbsCuUr8lmqmNv6uJJcrmYWW6kMSmgEA2kxhcWJU0SBx
j5014OQKU1hwFlulxNmz3jzfj8R4dgw=
=eEvR
-----END PGP SIGNATURE-----

--JPSBXS7aDo/qX3Vv--

