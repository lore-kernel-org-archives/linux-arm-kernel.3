Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACDCC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVuBfRM6hSH7bdNrYC43eEuMmYCLe63rDtFa+xag5MI=; b=psBM+ygvnBxAesKQ7mv7AUd8sz
	UHieHRK+PdGCrRZCZrfu/T1UNtbzjCAbYHXUlSYMcjhsSgjf0kcRjMwppJU3WVNZW4AUA4dQK+X33
	5zhlxZe950kFX8yaUJdvufTs1bsC4fkKT3bqGjn3bhwXGtipq5wBThq5NILrBDo4pHjto5/9Rk/VR
	e6Vjz1AffjikYCmYIf8+1oGwlhdPTyEpv2eGDgG37iOk4vDvO8rZV4OC99g0oRz75xOooA/W0/fbN
	8FCXNEos22hU//ynMgZVTu2L7ACuSm0WTa/DQy9+v1tLVX4ChWLP3Ex9g/rzkF9r5cgcYvOGZ0eDn
	7yQ8V0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Cly-0000000H6ET-0Ixu;
	Sun, 20 Sep 2026 08:19:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Clu-0000000H6E7-1fAc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 08:19:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54mbx760139
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 08:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tVuBfRM6hSH7bdNrYC43eEuM
	mYCLe63rDtFa+xag5MI=; b=pfXP6JY4DnCBiJRRqLLq4GC53wH/2llSz804NQdy
	Sj/pSvLWm1EEnGneNra/2PGP2EfR4mKBEnxGCArCsWVRowRB6jBkutthASeU7T1v
	npjATBwkOl+nVmTgWG+QQ+XVxaRmm89QEcPZFbW8jhG4tNbD9PEo8biBG1x2+5Ds
	wLzEfD1lD6KnIrNZlMCYHLCqUzuvL/4ubh/ugNZXqHMgSiPyB9qZ8A0Si8VZMNrY
	DanhYowD1V+3uTLZakUQ9ht5Q9avMbsSCIWvR3EbDgyrVaKHQe3Nar2TNmxcZC0a
	x+ew65F6cCM7sfoH1gOqHsRYDezvuO2Ozwb5w4YrRPXYsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9te18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 08:19:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a01d1d1b6so329161885a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 01:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789892376; x=1790497176; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tVuBfRM6hSH7bdNrYC43eEuMmYCLe63rDtFa+xag5MI=;
        b=VN3wKHCN144/HrW32E9Wz22bO4ajZTqkHO1sDWvrO9rpBBz5FKHG6FRgEveip8rL8t
         gwJe7znP/lERzTVmfIkQB+IBFdV9+gbjEmSZSyInA/JERLncSNk6OrR61SGA6fy6dOhg
         53IXtR2b4mlylF+9LsVkkQQfuyCLuX3a9+h/GP2SJK8cvs+80xHbsgcqK4MpYoLXR/qC
         /9SSuvLVbamfKqnBFtzTDHEEOCY+E2Xxk8w+nANO3vjo2RVu63Br0aNNyakco4IlmGen
         A2Y9VA5DDHKk2eBhQgdTeM2tgTd5d/cqHLSj80C+DlJFqMCvC4Ilc9iveOo3V1f+3/PH
         igGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789892376; x=1790497176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVuBfRM6hSH7bdNrYC43eEuMmYCLe63rDtFa+xag5MI=;
        b=hxq+h4LNnxmmvAai7hz3WBOD+nmhW1H1s0WAjFdXHaoKYhEcsPYPQceNUSFamL2gJL
         Di94OoUhXc30FiG5RumVQoEJM2iN8+wNCrhjden8zhDZ4PD0GyUo91ukwWrxAn3IdXcJ
         LO/vHNQY6rqDcRYgmThCWBbijnF87pyyNaBXCqm/7INJ1mS2rirD+sd+fpqDq6lw6m4h
         1wVwzqWoyPmnb967+nsHjwsem8hNI4IsWUr67oIPidjMpjhrX0pylj3ewjEFdqyW4DOh
         wCUDY1wbTl9Wu/W7ZkL5kkcrye4nX5BChTed3/yeXOwVgcGO5l8o9C7aZIYCPekfrqRi
         Zvow==
X-Forwarded-Encrypted: i=1; AKwUvBzwTE8e6Zr2m2KsZ2nQeyb2xXHyWUW7jl6g3c63NHOp7QOrKBjYWDZogFnQ2BJ7/Bc+DJLm8fVpZSXmjxfo/PfU@lists.infradead.org
X-Gm-Message-State: AFuF++kfOwHgX3mWurzmSjgxMqRo1DPalKXUatEG3KALkBJPwlIYtDKe
	QV3WAua9J5kMBkKelleNqZorNH7iAnxZA5xsvbDkqAZhxHAxPuKnh5k0k8QVFsGprzHabUtX5jk
	vvDH44H141umLzvWYUSMpQkIDDzPLenygMzaYBV5kYXPNguxADMH6ihv5KnQMrsTOtEnR+sLqXu
	4WsQ==
X-Gm-Gg: AYBFou31o/MLYays/Zrl5iFtv5XKQ4W5ovIq8C/TddQJBqfwmqk6TZlJnmae+RkFlxF
	CbCZ9BkSReali8KXiCInEtVjkMsWxYTKOKlr4aFuAVX1MTXNzU0OCF7UoKLY61z8WlUjJW0BBsL
	JfD8TV6z6veCunB45G4j6pNRKH8lUXabIDqCx45OuU0TyK7ZNq6SuBk+O/yj6JxboOEWMIxpmdR
	XtS7BOrwpMMmkWzTi05SAdHne36FWqxs9DKxlU47rfRCoHB0aqMZMoviShDxQaGbnfVxKvkdL8Q
	jkfWMgxstuuTANaNZ+QEdli7mq7bBYXMwcwLhAmTMygudbG1C5B2H5zgX3YtmvFKrhwp7+gBmaY
	ISOKOTieBs65pbw==
X-Received: by 2002:a05:620a:c47:b0:93b:c332:3d9e with SMTP id af79cd13be357-93bf560c669mr438973085a.30.1789892376494;
        Sun, 20 Sep 2026 01:19:36 -0700 (PDT)
X-Received: by 2002:a05:620a:c47:b0:93b:c332:3d9e with SMTP id af79cd13be357-93bf560c669mr438970585a.30.1789892375995;
        Sun, 20 Sep 2026 01:19:35 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4885a0549c3sm557784f8f.25.2026.09.20.01.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:19:34 -0700 (PDT)
Date: Sun, 20 Sep 2026 10:19:34 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linkui Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: do not cache the new TSO MSS before
 it reaches the DMA
Message-ID: <aq-XFrxqzeQvYEAn@lore-desk>
References: <20260920061609.1919876-1-xiaolinkui@126.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hdZmFPt14xPP7efX"
Content-Disposition: inline
In-Reply-To: <20260920061609.1919876-1-xiaolinkui@126.com>
X-Proofpoint-ORIG-GUID: i1JN83lU5e5ArNSAZ51EyXwJzEXyVx6R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDExOSBTYWx0ZWRfX/kucgbcpJDXs
 cOS32Zt0o3mTHvMd8KV0wfG+o2yGydmgb9O3y2FIcm/9/KI0YzTRdwLO1fZviXix7qJslvU9WeH
 +2+ixXvgqboOnGPj0zKIIz+kEEBsERNG5QTE34JwTV5YDrvzsguOkJvBoXI6gnupw3LrgjgtxW5
 /fFAkO3jUVoh0Q78P8Qburp55Fk/ngOUEvTSsrYbXeoQRzrPndjGxTN3vNVMcOX1GiiEb8moHII
 dKkdjNnVQjf6ZTkQUHbsXhjUgHTPKFvFk0HeMp6QMlJlNg+8OvG3NuHJKiTE3Wky2sP4L5bzsiJ
 iie2PGQtSatKZa5HRHsI4u47+KppKgwJv7QKGgAVybKIbTa6ZEK1kiCJTCZcmyXix4D/6sLBPNY
 I0iqXtFRcwQApxfBAy5P6i73Pt6SkBqau5tSdsnToeu85pIGVVNxpwVluv+zTp1oI+pmpkQSGvY
 YecmKM6OlPCfhqUYkyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDExOSBTYWx0ZWRfX61iV6G452twA
 Amu7mcx8gYV91myEXSRj5MVfwecjydUC3ONngmaTPg4PBPJQD60adguTuhlgYlAQvrvEN8ifb5L
 tX641C55/cdw+w6mWn+4gEbGpvmPJCg=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6aaf9719 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IWBWnCfD7v3Vv49I:21 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=W4vQ8E46j4nzeUKewMYA:9 a=CjuIK1q_8ugA:10
 a=6340d-lrAPSOr5qSYlQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: i1JN83lU5e5ArNSAZ51EyXwJzEXyVx6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_011938_444740_1696BBA9 
X-CRM114-Status: GOOD (  31.52  )
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

--hdZmFPt14xPP7efX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Linkui Xiao <xiaolinkui@kylinos.cn>
>=20
> stmmac_tso_xmit() fills the MSS context descriptor and stores the new MSS
> in tx_q->mss right away, but the descriptor only gets its OWN bit much
> later, right before the frame is handed to the DMA. Every error path in
> between - the dma_map_single() of the linear part and the
> skb_frag_dma_map() of each fragment - returns with tx_q->mss already
> updated while the MAC is still programmed with the previous MSS; the
> abandoned context descriptor is later reclaimed by stmmac_tx_clean().
>=20
> The next skb carrying the same MSS then compares equal to the cached
> value, so no context descriptor is emitted and the hardware segments the
> TCP stream with a stale MSS, generating frames whose payload size does
> not match what the stack accounted for.
>=20
> Update tx_q->mss only once the context descriptor has been given to the
> DMA, so that the cached value always describes what the hardware is
> actually programmed with.
>=20
> The context descriptor is now handled like the data descriptors are:
> tx_q->cur_tx is not advanced while it is being filled. Whether the frame
> can be queued is only known after every dma_map_single() and
> skb_frag_dma_map() has succeeded, so the descriptor stays at the slot
> tx_q->cur_tx points to and the index moves past it later, together with
> the data descriptors. That also keeps the context descriptor outside the
> range stmmac_tx_clean() walks when the ring is cleaned after a failure,
> so the error paths have to release it explicitly.
>=20
> Fixes: f748be531d70 ("stmmac: support new GMAC4")
> Cc: stable@vger.kernel.org
> Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
> Changes in v2:
> - Do not advance tx_q->cur_tx while the context descriptor is filled, as
>   for the data descriptors, and release the context descriptor on the
>   error paths instead of leaving it to stmmac_tx_clean(). (Lorenzo Bianco=
ni)
>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index af2d38a2bb3d..e2e680dd980c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4563,10 +4563,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff =
*skb, struct net_device *dev)
>  			mss_desc =3D &tx_q->dma_tx[tx_q->cur_tx];
> =20
>  		stmmac_set_mss(priv, mss_desc, mss);
> -		tx_q->mss =3D mss;
> -		tx_q->cur_tx =3D STMMAC_NEXT_ENTRY(tx_q->cur_tx,
> -						priv->dma_conf.dma_tx_size);
> -		WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]);
>  	}
> =20
>  	if (netif_msg_tx_queued(priv)) {
> @@ -4577,6 +4573,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *=
skb, struct net_device *dev)
>  	}
> =20
>  	first_entry =3D tx_q->cur_tx;
> +	if (mss_desc)
> +		first_entry =3D STMMAC_NEXT_ENTRY(first_entry,
> +						priv->dma_conf.dma_tx_size);
>  	entry =3D first_entry;
> =20
>  	WARN_ON(tx_q->tx_skbuff[entry]);
> @@ -4714,6 +4713,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *=
skb, struct net_device *dev)
>  		 */
>  		dma_wmb();
>  		stmmac_set_tx_owner(priv, mss_desc);
> +		tx_q->mss =3D mss;
>  	}
> =20
>  	if (netif_msg_pktdata(priv)) {
> @@ -4745,6 +4745,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *=
skb, struct net_device *dev)
>  						priv->dma_conf.dma_tx_size);
>  	}
>  error:
> +	if (mss_desc)
> +		stmmac_release_tx_desc(priv, mss_desc, priv->descriptor_mode);
> +
>  	dev_err(priv->device, "Tx dma map failed\n");
>  	dev_kfree_skb(skb);
>  	priv->xstats.tx_dropped++;
> --=20
> 2.25.1
>=20
>=20

--hdZmFPt14xPP7efX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaq+XFgAKCRA6cBh0uS2t
rKz0AQDQOKlvoWo/v6YdVyqg7wc3sX8gVj0oK+SpKbYYAjMZFQEAi+/NjQU08Sjg
F7zosScZjl1GSR20UvITwQJmXwNs+QY=
=Efwo
-----END PGP SIGNATURE-----

--hdZmFPt14xPP7efX--

