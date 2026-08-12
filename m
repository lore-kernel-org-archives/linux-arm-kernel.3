Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9575C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbfAZdLb7Gd/qSUJdj/UERpGGTxWx7AQk4XHSPv4SiM=; b=UvKRK0xfPdLJoceYd9iDAuZs3x
	2e5pCpD4oKtNXb1vvZdfhGiMmfDg58S/5lXXt0IQTUNEWOytBqrd2EAZin5aU2NIR07GDgD9zasTM
	YyiWtAd7YfGAhiacPooPAgmXTcigd6QY05zFichBQJjomef+ohCmNnnU2DxvrVViT1dK9AZEy00Ki
	t7l8ZjVZnvQzR4YRQwyQUnmXiziJtQRBmek2kprv1v1yAM1ei9jNgriUg3PjpftSrzTaUeaU0P4l2
	2qczCgSaEBNAhioGKBOikQEbYJj/pe8FW5BH1c5Bps6zyeqa1rVy4GwvTfzmUlFr5zSnGoQdiHWW+
	yYG4ZGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBYJ-0000000GYub-41t7;
	Wed, 12 Aug 2026 16:11:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBYH-0000000GYtz-1rZY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:11:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CFo1Ds3891813
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 16:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XbfAZdLb7Gd/qSUJdj/UERpG
	GTxWx7AQk4XHSPv4SiM=; b=KGQlhvAP0jr9XkEYhBKvzXRjo3jo54aXUdukIUr6
	XluiRkeMgXQolEUr9aFip878cPikWcX9lgw5DpllZWms2Vd/a/AE9sw+kdyDrOhF
	0dyZATXtKB5FywtApFQjwvuGNhlMV2fGv4Z2H9iMuB4r+QlnP0/TqPK/sLAf6LWi
	DYLK3QcT1Jv3lH+fYxmwKPhyCPqgmary9VOTYYzixKQWmK40ZErIjQBGc6gNJv2N
	6mOgBfvpPRenzxU8Ae4JAihR6wyOTxum4YsLOxVNH8NLq3LYEgfUOUNBj5z5Yb3F
	9mIX/hMoAl9li1hAK8AUjJfrr0sW6pMhki4PkAqXxo618g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0uts041j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 16:11:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84885a4fcabso1201986b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786551095; x=1787155895; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XbfAZdLb7Gd/qSUJdj/UERpGGTxWx7AQk4XHSPv4SiM=;
        b=fRPWMKJ2p/+0iQJPJWcLeFVxWkgxG7ZwTrIH5IYMFB6X6cKBb8MM9Li0WYxtl66cTs
         na5L4vJB1q+D0R9hIxj3ANQOFKnNIa26h2N+IrNHHKSi+XzDvJBlCrOXkCe1w/rOCH9e
         S4nlrNcknLA6zXxbZFdjREpwKg79LyHQLG+cMDbYFTmvWjhy3g+vC0Du1svwMmKcTL1y
         ZTY2aqfGTBZ5sU8bJ745n8lg5rp4n26g8VIKm7ghnX+K6n9nZD9uqpTTAMZafkiFkZxk
         G76tGxuJt5im2XLjua5TNTcBD03MN7qYQNzXdv69TasxFuhmWUucyhXwVQ7/o57Mv2Gf
         KEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786551095; x=1787155895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XbfAZdLb7Gd/qSUJdj/UERpGGTxWx7AQk4XHSPv4SiM=;
        b=nai4mu5MeWDzCq1gmAyGi7HsRdAD777zX0g25yrfM8CwLoMzEd0d9PHlAB57ymP4J1
         E2FymNsbmT8HRqc3YeEquEkU4jwhYMrxpzUGYwsX/Kl7OrnvKp8CJAkTjJp+dBpGrrYr
         HPf/cUrPhUnjswruarBzgzkjZ+32uMKLFLR6uwwI1KBzAPAOMHBHbnSiohG/5737FnIY
         SYseXypIiW/cVDONF7ThUEQrc36rFave/Awesf1JhzyWh76aXXEZfoPqkNnjOfrjDCvj
         wQRPzrU83FFmzTKK+7IMEdgogmYjEbAy3Jxm0oqhV+7cLtejGKw3lQ13npHThf0lHNFx
         JHoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrET+5s25yuzt6EaYxh7iT+Ur8eG7m1+n8qjkeBWY0fP0zoMRsJquOOHBMewXSZnvxm8mr89/9DmQOaRCj3ahiH@lists.infradead.org
X-Gm-Message-State: AOJu0YxJlgTSlnylSQaFzAIihARzbFpu/wewoDK4tMaofB7Ptph04nK0
	PpVgdkqxUkR/fZMI+qhMeBTlrrg7QKy5lANwoMMFC1lKkfckh9bIklCbnAflLkU7L/p6C3GnLRm
	tjjc6NUFtPlgRMM3GNRk3Awoq+nsLWHWv9xV1h4+bIJ7dQKIlKq6joc/j0+rnBujOCyAq7+Hp5j
	ALXQ==
X-Gm-Gg: AR+sD12LzTsp4mheLbs6fcrP0fj/P0OAP05Q/inaxQ7i97H/0cW40XKONKcDwcphTe3
	CdEnV1ZF/rUvijpa1V63N1ODHOKRJsJkA+//YXJauO94dKqLpXGS96vuJIQgNS/8o0a0LFaD76b
	T1iMvoEKt4i6EZ63/bWk+QJPJkRm19SxRdqfNwW5UJXs1RrtaVxIDmJz8tc5RNJDRgs7GvI3LGc
	aJs7KyTEMyPYafnZyx+iSn92PYwww/t1p9aYmdELYgxwwm+zh0WnFhlTJv8zlGUFnF/LNmRnQB/
	RenWku0rBxEVFxTf4/OPOvBJwTV8ZM08cAwliVSuEBVze3a0eo+pxDN4wrggyINO5eFp5Ibtv0O
	rDDjZ9Ja9u9Xw5A==
X-Received: by 2002:a05:6a00:1311:b0:847:9c3a:b77f with SMTP id d2e1a72fcca58-84fb55806bamr5807449b3a.35.1786551095113;
        Wed, 12 Aug 2026 09:11:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:1311:b0:847:9c3a:b77f with SMTP id d2e1a72fcca58-84fb55806bamr5807350b3a.35.1786551094390;
        Wed, 12 Aug 2026 09:11:34 -0700 (PDT)
Received: from localhost ([4.43.230.115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbee7d3607bsm941868a12.25.2026.08.12.09.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:11:32 -0700 (PDT)
Date: Wed, 12 Aug 2026 18:11:31 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2] net: stmmac: improve TSO/GSO queue selection
Message-ID: <anybM_3Rdg8X8CMs@lore-qca>
References: <20260808-stmmac_select_queue-tso-fix-v2-1-67175b29772e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iLzute234UfZUCF8"
Content-Disposition: inline
In-Reply-To: <20260808-stmmac_select_queue-tso-fix-v2-1-67175b29772e@oss.qualcomm.com>
X-Proofpoint-GUID: 1LdkFS0RUA7QnHAohoeoLc6IlpB19iqW
X-Authority-Analysis: v=2.4 cv=aPDAb79m c=1 sm=1 tr=0 ts=6a7c9b37 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=f2H3biQdujjI0Mw2rri0Ng==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eOeSzAT4wrZiS6Nb83cA:9 a=CjuIK1q_8ugA:10
 a=CIrVCWbjoDn5-O6LZhoA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 1LdkFS0RUA7QnHAohoeoLc6IlpB19iqW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEzMSBTYWx0ZWRfX13/gwwbKPDhW
 aSDWWB5pXJb3quqZhg3GF1knPvW1dRzL8T0TNzAKp4LnKe7sJVAIZgRHu5lTkl3cJRbJ1n93h8R
 +96hUqxGAgI3jaAZwtKziJCHmuXgFsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEzMSBTYWx0ZWRfXyhkSA6szcZR6
 BOB1VuPdR9RZ4CltLcCpr8waPaXRqp7ZSUNhburDf46fccBRf5LdB38naipSvM4OTid6d8tvhI3
 tI/JUSnuWggzO5/LjrydfzLr4jH4RFcqI4KU1o0WjJg/hKIsaYy9qj4Q+cUTidub9y4nQPw5FLO
 5BVaXZrpF51z5mRklXpNiinruRYamLpKEZIL6vP3BclQykR601zTWs0A+IjXdPLF9HSSUQf0zsN
 DnnDEgU0cjpyvQ7JLePX9mQpf1XcLU1L8wQFLd7BbRXTlV5fVXedMa9MZwqGIqLmTNw8xhYPHMi
 PNsPUumQgxbmxUmrLHcbKe9P6eCH6NJmuw77ePNg5p39qcj7s2hulMXOpujomi8PN9mGskT4rJK
 ODoUQ7unnzwjWkWkKlqX2d9aE/4ekGR5LB3IFGUnunsD7G8BN6FY9j/SvRzwjHEEjjT5Dqy/7kr
 KwRn0A86Hgvazsmaeng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_091137_487904_B32AFBD2 
X-CRM114-Status: GOOD (  30.46  )
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

--iLzute234UfZUCF8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> GSO (TSO/USO) frames are currently always sent through queue 0 since
> the driver assumed there was no way to determine which queues are TSO
> capable. This unconditionally pins all GSO traffic to queue 0, bypassing
> the per-flow queue distribution and any XPS setup.
>=20
> Instead, pick the queue through netdev_pick_tx() and fall back to queue 0
> only when the selected queue cannot provide hardware checksumming (COE
> disabled) or, for the GSO types offloaded by hardware, cannot run TSO
> (TBS enabled), since TSO and TBS cannot coexist on the same channel (see
> stmmac_tso_channel_permitted()).
>=20
> While at it, base the TSO capability check on priv->gso_enabled_types
> rather than a hardcoded GSO type mask, so it matches the TSO/USO
> capability actually used by the transmit path (e.g. UDP segmentation is
> only offloaded on GMAC4).
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

please drop this version, I will post v3 to fix some pending issues.

Regards,
Lorenzo

> ---
> Changes in v2:
> - Take into account when checksum offload is not supported.
> - Link to v1: https://lore.kernel.org/r/20260807-stmmac_select_queue-tso-=
fix-v1-1-4c4787bad02b@oss.qualcomm.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index b2b7d0242dd3..7a4bd0292966 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6445,19 +6445,21 @@ static int stmmac_setup_tc(struct net_device *nde=
v, enum tc_setup_type type,
>  static u16 stmmac_select_queue(struct net_device *dev, struct sk_buff *s=
kb,
>  			       struct net_device *sb_dev)
>  {
> -	int gso =3D skb_shinfo(skb)->gso_type;
> +	u32 queue =3D netdev_pick_tx(dev, skb, NULL) % dev->real_num_tx_queues;
> +	struct stmmac_priv *priv =3D netdev_priv(dev);
> =20
> -	if (gso & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6 | SKB_GSO_UDP_L4)) {
> -		/*
> -		 * There is no way to determine the number of TSO/USO
> -		 * capable Queues. Let's use always the Queue 0
> -		 * because if TSO/USO is supported then at least this
> -		 * one will be capable.
> +	if (skb_is_gso(skb) &&
> +	    (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
> +	     ((skb_shinfo(skb)->gso_type & priv->gso_enabled_types) &&
> +	      !stmmac_tso_channel_permitted(priv, queue)))) {
> +		/* GSO frames need hardware checksumming. Moreover, hardware
> +		 * TSO/USO can't run on COE-less or TBS queues. In this case
> +		 * fall back to the queue reserved for TSO (queue 0).
>  		 */
>  		return 0;
>  	}
> =20
> -	return netdev_pick_tx(dev, skb, NULL) % dev->real_num_tx_queues;
> +	return queue;
>  }
> =20
>  static int stmmac_set_mac_address(struct net_device *ndev, void *addr)
>=20
> ---
> base-commit: 8ac4255c1e0c83d2e1559a18b8918673116fc8d6
> change-id: 20260807-stmmac_select_queue-tso-fix-06cc586d4022
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--iLzute234UfZUCF8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCanybMwAKCRA6cBh0uS2t
rLw+AQDYUIq7wRrULOWg4CrNbvX2N9Op34JkkAtDXEeQQ97yNwD/Vpyc3UeG+iXt
waxrD4T3gZH18kfuM0iEjSHBI2wMBgk=
=TbQQ
-----END PGP SIGNATURE-----

--iLzute234UfZUCF8--

