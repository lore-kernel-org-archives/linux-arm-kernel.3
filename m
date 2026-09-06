Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78B3C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAES5tpI2Om0LxX7UY7ndKBIWV90CK/isHyIRSM50fQ=; b=KBXTkLYdY29C1yDz/Z8WSJrxJo
	1ByBVViq/OO3Tls08s4q8w8Y9gY8AiqUukNyUG8OUH5aJH5945QSI+3sOpA5eHf8839Nk4t14WDUH
	jhhzonfEj/3VtlUIF2eldkeMtlYPpTWf+CXn7GInV33MLEMr5qoXVq92Lg6WkfoPLOVMlY71M8FQZ
	VBV8RMZjnlEbCgCW2IUMnR1EmXFYNZaNpXnx++YtDTmxK4sOceqlpcZgs5KUKB6KzSuUJmC2Yu7ol
	PoYfNHZRZd+4Zo2y5egsO8yLm+SpiTcrONmrgrRexbWewkCbqC4MOgiUCE+hqxIkfjgtud+WtE/gz
	Bz+fAv1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x39vd-00000004vg0-00vD;
	Sun, 06 Sep 2026 10:16:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x39va-00000004veg-0RR4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 10:16:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68600ZT93117389
	for <linux-arm-kernel@lists.infradead.org>; Sun, 6 Sep 2026 10:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RAES5tpI2Om0LxX7UY7ndKBI
	WV90CK/isHyIRSM50fQ=; b=KYH/Lv16SOyT1IcTpvV29LqYbunK9yIig9Smgia+
	SUg7ZYuNtRG8t0eVEavLC27+D4EhX5NcXEFxe2SmJyxlzl5mPLPWT7GptRx1aRQq
	za9+HpkWWW/jyKwRMCVm8s5UD+Rbd5MXxwUxN6vHC+cQNEMUXq1UKm4e61hJxUFv
	p53Lwie5648DnYlU/qjG6jM3udzOpqMrw06fJhT9LA3j2gTHIAzyANgTv8a8PHaT
	PMKz1+zed35eFz1IjuF8g9Xl3bDIkHZLGyiR7uAmDWRRaX64YlwWSZUZjsqNs/xw
	Ingci2jlnKzWUOd7kU2v8uopF4mTs5gpop/ZyISxpXWfVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbf8k793-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 10:16:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d8cdso519171185a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 03:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788689801; x=1789294601; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RAES5tpI2Om0LxX7UY7ndKBIWV90CK/isHyIRSM50fQ=;
        b=Dwl+QUaK1QfsCjanlumfF5HP2Khd1NitX4IpeJYDa8NSkGv3QAewxwT5HsEjv1jLsM
         PUu5BCoSKHRLSM1uxmB1vTTZ3+eLjEXznK+8VuH9ezhNoukGPKHFEGJS29G5BhtUbmJq
         27PV/32ma+xfH6OxVVnw7Y81tt2kifuNjoJP2O8OZhOALMIdH2xTdKMb3eGrqgaLs7mG
         TFyO8lYYJd0jywMPNlZI+H9wxyHAECfGdkHuxXB3O3Y6IXJE5B6aRv83padc/UUoMPVF
         GI7iteLeuKq/45uavhnSHPQZsXtgNA+HW+GTyzQaVqze08Pt7aXc20i6mitKkSkDG7WG
         It1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788689801; x=1789294601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAES5tpI2Om0LxX7UY7ndKBIWV90CK/isHyIRSM50fQ=;
        b=odpLVCIVf4y3Ck9YDk3BHBNW3LHUxqmtgRzCu5H1CM60ybDxFCojWn6xM/uO/DUYHe
         jWfA4tCFiCw/05oyECskLUc1c2q1+gO7s1iF3RI9dOQ2G9/uArNp17yU3bdlwbrq21Hk
         m+buQoXCTS52GKnAHe3nSDlSx5/spc57VDte/DR/iy/LNuBw2stP6N0IRh37Zl346LjF
         7tBnKBjfFodDmlhM4HBT26bsm6FuwB38TbBTIaysnmmi/44Ut1eE3YoIsUos2vrqhMkZ
         qOqUMIlG4RJ9KwKAMqT9RKB2SeEY6WL9H91dhloggvXMtg28VnWQ15g5AhY1Cbx2elKt
         tgzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAfkwmta/CgtIM7kPyYksgt1bBnTHpJqWl5FM1xHggtu/XGl6UTCj+BEXRfFQM1pM1oiYrVJzI25tXoBSQ/h5L@lists.infradead.org
X-Gm-Message-State: AFuF++ki8jKyXfxNJfDAAHmjXqITkn+FDdI2CJM1GQ/+MM56dSvufA+V
	/Al9C6SO55NPqMmSLuqfGz1rf8mBvgeq/pIXlJlO2kIo2+NG8UeionZW+3rl+N54wT4wY2HdWsi
	pzm0PtTKNrZ+ry+pU+WcQ2vCHxYyv/gfyQUZMGN8bq7X//vjyoS8Un8w5KbsR+s6WYOJ5/9akeJ
	YGbVHhDmnuLQ==
X-Gm-Gg: AYBFou1HXJoUuWfjAC67TvfpDPq0Uovtmocbdp9gTrDvATWhGJ5LFwwAcoqNCvBYovo
	xTjmnzMh0gXWg8iXVV2ZatUamY1FbC4Sxeucrz4ifbMZaapoH/ZxI/IV0EpE/ie0alKFRLfdul1
	7ioTYcm+aHioTK5mxWtZMlTaj96HMEdw/6uWC9RKt2zc4i1IF2aTCc1RoN8RtmRz1V+HyBgG+Qy
	TB6iUjyDCmy/pqVORLHdKQa/6YPSw1N6K9/IRHr6AicnzRsIzCLfBOXh6NKjHweGmA8AK7epBiK
	HUjFU9AeR6o1aNofdrsjUviRy/dsfMYr5e+Q10nEKDn9MfG3XWIIr+3Qz+DhSnXeC1CKV8UTbnR
	+/IQpalMhHp6LiA==
X-Received: by 2002:a05:620a:294c:b0:930:f723:35f5 with SMTP id af79cd13be357-939805f1809mr1625300385a.20.1788689801352;
        Sun, 06 Sep 2026 03:16:41 -0700 (PDT)
X-Received: by 2002:a05:620a:294c:b0:930:f723:35f5 with SMTP id af79cd13be357-939805f1809mr1625296685a.20.1788689800828;
        Sun, 06 Sep 2026 03:16:40 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm673032615e9.0.2026.09.06.03.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 03:16:39 -0700 (PDT)
Date: Sun, 6 Sep 2026 12:16:39 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Ding Hui <dinghui1111@163.com>
Cc: andrew@lunn.ch, Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
        "moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
        "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>, dinghui@lixiang.com,
        xiasanbo@lixiang.com, yangchen11@lixiang.com, liuxuanjun@lixiang.com
Subject: Re: [PATCH net-next v2] net: stmmac: fix error path cleanup in DMA
 descriptor ring allocation
Message-ID: <ap09hwoKJjqQWIrB@lore-desk>
References: <20260905154654.1725313-1-dinghui1111@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xWjH8VhHG9dCfn2h"
Content-Disposition: inline
In-Reply-To: <20260905154654.1725313-1-dinghui1111@163.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDExMiBTYWx0ZWRfX83zVSYApd3AW
 9Qj2H1mqN2JNpRnq/6RHhvM3K46fZdFXc39P9kui2sqfNIhAePhh6KsIBJB16z/2dkHPgX1oiFZ
 h5wQO4s22DLoxFS0udO5+B6mXXBLhOg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDExMiBTYWx0ZWRfXy1SRla2c7czd
 4EBdTTdpyOCLPG9TLyGwQ+kxjaQBAUy9GW4TXY5xCtEn5K5cO7e7ZHnr0EC7s+vhvIU5QoPsZHH
 X4s57+62IoBI8ZvKHO6XgNAw9Pn+u0jqyARFbY6XCRv0BSIWHf8EBRuqI59yBCNGct7hdbwKEtA
 Kl7AHy5YrkJ1n8ZZwRF3l+oUxLCEQGwGpHVk3Qudf4aAdKCRHQgZ68LjLdyjEC5pkPcKzb+cU/f
 S736lpvHTiSLH4TlZA2SS8IrZE8nJ0z+v4veYnz5dr0VaxJTtMjE19CGWzvPGTDCcIKheOg0BGZ
 ruQALaod4wHCg/o5GT13KLgbMjaMAkkR4Et5vz9niS5B4lyrDouTRS7w/gSVSXnhXPUcMdq8Q8D
 Y8S0s4z5OP4UCKbaBO/WU4qpuDMxQ8DFhKhfvouLNp+ViM/JhAM2zg6s9LUIpN0WvLLGEixeuzz
 4XIVvDgnrFB0RXiTqzg==
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a9d3d8a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=FvjeeQ-HAAAA:8
 a=OGClekyxBy5Cn5ele3gA:9 a=CjuIK1q_8ugA:10 a=pK0oTnKYjgWuoMMSC_sA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Xg4jrX4_cAy-VDzvcMla:22
X-Proofpoint-GUID: YLuW7glOpRRTcAQSKLBzh64HX2mAZ67D
X-Proofpoint-ORIG-GUID: YLuW7glOpRRTcAQSKLBzh64HX2mAZ67D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_031647_003801_65264B5F 
X-CRM114-Status: GOOD (  25.67  )
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

--xWjH8VhHG9dCfn2h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Ding Hui <dinghui@lixiang.com>

Hi Ding Hui,

just a couple of nits inline.

Regards,
Lorenzo

[...]

>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 59 ++++++++++++++++---
>  1 file changed, 50 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index f2fc89176654..f0e06c011b8d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1728,7 +1728,7 @@ static void stmmac_free_tx_buffer(struct stmmac_pri=
v *priv,
>  					 DMA_TO_DEVICE);
>  	}
> =20

Is it more appropriate to move the tx_q->tx_skbuff_dma check here from
dma_free_tx_skbufs()?

> -	if (tx_q->xdpf[i] &&
> +	if (tx_q->xdpf && tx_q->xdpf[i] &&
>  	    (tx_q->tx_skbuff_dma[i].buf_type =3D=3D STMMAC_TXBUF_T_XDP_TX ||
>  	     tx_q->tx_skbuff_dma[i].buf_type =3D=3D STMMAC_TXBUF_T_XDP_NDO)) {
>  		xdp_return_frame(tx_q->xdpf[i]);
> @@ -1738,7 +1738,7 @@ static void stmmac_free_tx_buffer(struct stmmac_pri=
v *priv,
>  	if (tx_q->tx_skbuff_dma[i].buf_type =3D=3D STMMAC_TXBUF_T_XSK_TX)
>  		tx_q->xsk_frames_done++;
> =20
> -	if (tx_q->tx_skbuff[i] &&
> +	if (tx_q->tx_skbuff && tx_q->tx_skbuff[i] &&
>  	    tx_q->tx_skbuff_dma[i].buf_type =3D=3D STMMAC_TXBUF_T_SKB) {
>  		dev_kfree_skb_any(tx_q->tx_skbuff[i]);
>  		tx_q->tx_skbuff[i] =3D NULL;
> @@ -1761,6 +1761,10 @@ static void dma_free_rx_skbufs(struct stmmac_priv =
*priv,
>  	struct stmmac_rx_queue *rx_q =3D &dma_conf->rx_queue[queue];
>  	int i;
> =20
> +	/* buf_pool may not be allocated if alloc failed early */
> +	if (!rx_q->buf_pool)
> +		return;
> +
>  	for (i =3D 0; i < dma_conf->dma_rx_size; i++)
>  		stmmac_free_rx_buffer(priv, rx_q, i);
>  }
> @@ -1802,6 +1806,10 @@ static void dma_free_rx_xskbufs(struct stmmac_priv=
 *priv,
>  	struct stmmac_rx_queue *rx_q =3D &dma_conf->rx_queue[queue];
>  	int i;
> =20
> +	/* buf_pool may not be allocated if alloc failed early */
> +	if (!rx_q->buf_pool)
> +		return;
> +
>  	for (i =3D 0; i < dma_conf->dma_rx_size; i++) {
>  		struct stmmac_rx_buffer *buf =3D &rx_q->buf_pool[i];
> =20
> @@ -2097,6 +2105,10 @@ static void dma_free_tx_skbufs(struct stmmac_priv =
*priv,
>  	struct stmmac_tx_queue *tx_q =3D &dma_conf->tx_queue[queue];
>  	int i;
> =20
> +	/* tx_skbuff_dma may not be allocated if alloc failed early */
> +	if (!tx_q->tx_skbuff_dma)
> +		return;
> +
>  	tx_q->xsk_frames_done =3D 0;
> =20
>  	for (i =3D 0; i < dma_conf->dma_tx_size; i++)
> @@ -2272,15 +2284,19 @@ static int __alloc_dma_rx_desc_resources(struct s=
tmmac_priv *priv,
>  	}
> =20
>  	rx_q->buf_pool =3D kzalloc_objs(*rx_q->buf_pool, dma_conf->dma_rx_size);
> -	if (!rx_q->buf_pool)
> -		return -ENOMEM;
> +	if (!rx_q->buf_pool) {
> +		ret =3D -ENOMEM;
> +		goto err_destroy_pool;
> +	}
> =20
>  	size =3D stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
> =20
>  	addr =3D dma_alloc_coherent(priv->device, size, &rx_q->dma_rx_phy,
>  				  GFP_KERNEL);
> -	if (!addr)
> -		return -ENOMEM;
> +	if (!addr) {
> +		ret =3D -ENOMEM;
> +		goto err_free_buf_pool;
> +	}
> =20
>  	if (priv->extend_desc)
>  		rx_q->dma_erx =3D addr;
> @@ -2296,10 +2312,27 @@ static int __alloc_dma_rx_desc_resources(struct s=
tmmac_priv *priv,
>  	ret =3D xdp_rxq_info_reg(&rx_q->xdp_rxq, priv->dev, queue, napi_id);
>  	if (ret) {
>  		netdev_err(priv->dev, "Failed to register xdp rxq info\n");
> -		return -EINVAL;
> +		goto err_free_dma;
>  	}
> =20
>  	return 0;
> +
> +err_free_dma:
> +	if (priv->extend_desc)
> +		dma_free_coherent(priv->device, size, rx_q->dma_erx,
> +				  rx_q->dma_rx_phy);
> +	else
> +		dma_free_coherent(priv->device, size, rx_q->dma_rx,
> +				  rx_q->dma_rx_phy);

I guess you can use addr here and remove the if/else block

> +	rx_q->dma_erx =3D NULL;
> +	rx_q->dma_rx =3D NULL;
> +err_free_buf_pool:
> +	kfree(rx_q->buf_pool);
> +	rx_q->buf_pool =3D NULL;
> +err_destroy_pool:
> +	page_pool_destroy(rx_q->page_pool);
> +	rx_q->page_pool =3D NULL;
> +	return ret;
>  }
> =20
>  static int alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
> @@ -2352,14 +2385,14 @@ static int __alloc_dma_tx_desc_resources(struct s=
tmmac_priv *priv,
> =20
>  	tx_q->tx_skbuff =3D kzalloc_objs(struct sk_buff *, dma_conf->dma_tx_siz=
e);
>  	if (!tx_q->tx_skbuff)
> -		return -ENOMEM;
> +		goto err_free_skbuff_dma;
> =20
>  	size =3D stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
> =20
>  	addr =3D dma_alloc_coherent(priv->device, size,
>  				  &tx_q->dma_tx_phy, GFP_KERNEL);
>  	if (!addr)
> -		return -ENOMEM;
> +		goto err_free_skbuff;
> =20
>  	if (priv->extend_desc)
>  		tx_q->dma_etx =3D addr;
> @@ -2369,6 +2402,14 @@ static int __alloc_dma_tx_desc_resources(struct st=
mmac_priv *priv,
>  		tx_q->dma_tx =3D addr;
> =20
>  	return 0;
> +
> +err_free_skbuff:
> +	kfree(tx_q->tx_skbuff);
> +	tx_q->tx_skbuff =3D NULL;
> +err_free_skbuff_dma:
> +	kfree(tx_q->tx_skbuff_dma);
> +	tx_q->tx_skbuff_dma =3D NULL;
> +	return -ENOMEM;
>  }
> =20
>  static int alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
> --=20
> 2.34.1
>=20
>=20

--xWjH8VhHG9dCfn2h
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCap09hwAKCRA6cBh0uS2t
rFpLAP998k3ZRb2rMMqwIUOKvZsgOTIcD0qc6Q58kuCly+atjgEA5pEAnwMWgdJ1
vQpssx8NIzwM3dXQbIr/iNqtu5ZGQgU=
=XDBs
-----END PGP SIGNATURE-----

--xWjH8VhHG9dCfn2h--

