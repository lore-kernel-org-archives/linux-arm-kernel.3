Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DCAC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQh8AWaRpKh1Q8l9bSylJcBRPs7X0IfdPjMRSeBWiRQ=; b=hnJmc6zd5yBee01/671G5HJS8v
	EKdeJ6haw5ZlG02j1QIKs/JjJedg2e6DEaQJaODtWlndFAi2XjZTzbIDqmV6yIqo0/6GHyXPD4y8V
	eP3LMQ/+Kts7a5d8FhihMsy0ExJX8kwh4P6e1K8B1bDmHLY7NBH0q7yIJj48mklisBkfnIu/8x+ei
	AwgpHLGcM//nUSrlYqcRpph7FpGKgPjMVb40VcNbC0s6cOADNn2HoV/UPAK1INozfVbQeTZ+MGVvf
	ZNVXfszwKUxiWsk395ej6vDY2/YNeDjwdVOyHDwATmJS1lxzwYctDJk56pxSarqm9zDmkjQ1Xrlau
	ySKSAofA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lcy-00000008niJ-3roK;
	Wed, 16 Sep 2026 09:08:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lcv-00000008nhb-3It3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:08:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92uQK1721210
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aQh8AWaRpKh1Q8l9bSylJcBR
	Ps7X0IfdPjMRSeBWiRQ=; b=L5NQgKYxrVas8nad6ppYH9AhComnAvqDowOB8nwz
	Z9wQiQIRp8hcn9ieUvvNAY/uKxTGbbO6eJCeAJPT88esjej212wzF3pF9adbO+mU
	6xeOV+0oNMLXTVngq38gVCApXxN/yQ7R9B99h5/t90r53wyYSYJ8AYgJvi+QkkmE
	BVStVO7sBE1L34299oE5GfSBxJG+ImwVynKpYYHv4bD3uwx7WrokMKB+0i8Rkk3L
	HQUOAtpUf8Z4EguKfFjiLxjKTE9+QUdqc4r9dU4yAVyqV6fliBkOjUxNu24zk2ZP
	o31cIH7DgGbY38bJmGXSdhvwA7wPB/knEZ2pV2P9rUhJoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnk0tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:08:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0050a554so1079817885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 02:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549704; x=1790154504; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aQh8AWaRpKh1Q8l9bSylJcBRPs7X0IfdPjMRSeBWiRQ=;
        b=YOtoa8BAVCX+1Oc3DdyEbvEzUCrWgVTdVOf00bGo1yUOugSuUug7H8BjNBu/X+UGyu
         Z+AGEgp05LLDPaSKHz+LkyrZ/nbEgFADZlAWyjgQKREkldqFf/lP0NzXDaVa8SDIwKFe
         We8sFniHnhpTNBqRj87yX7uVsSFTahQZSjs70v6ohV1XvbT5PiifBtQ+sGqpYOL1Rape
         X3FQNM7iRB8Gy7Q+2M3IP03MeOf0w3yiDHIjl+uY1CRKIjB8qpZNVHjXQsDHdJxBYrsS
         GL+G6CYRGKyX56q+DNchTC36cGAHIVp2hUUgx9Q+LO+wabsrVUAMB6jVON86oFxNuA+P
         j15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549704; x=1790154504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQh8AWaRpKh1Q8l9bSylJcBRPs7X0IfdPjMRSeBWiRQ=;
        b=HQ+JZvJ0v8XVrDw6V586BLdGA+Z4dE4zYRGehfQnbOxk2BF1fOQ7l5JtYorvHDd6ot
         qbJ7puTuQCnmW6yD4HLKL3aNmwssHKxZWDZXa9+UNwGZaMeN5naty4aeopJoKyRKN9Oq
         hJEcCgcFqJ3cpnAT0LW13mDkNf5z9ltINQhUHHEl+Op6Dk/YGijPHeuiaJvhWN39QN/0
         0Um/6XhqP1nB6cUu59g95QeJ/aV1BobWtLDnwKG6uWtHqeiv4yTTNmUd391YXYsrh8md
         VSZ78rPmcB8fr00t87obDnwJGLMC8FmIPY3toy82BwxZO8hOhGqVnacQnS/OPydUR/UV
         fUZA==
X-Forwarded-Encrypted: i=1; AKwUvBylK3kD2DJySDBs6BlCT0Ar3q9dS/TWBbbFRcU38Z1q6bRlPfYNao+kilSsTXWRaT62pBsX2bZ9Py09S5uoVZHv@lists.infradead.org
X-Gm-Message-State: AFuF++kEl+TClAmUCVa4lX/yOuTNebnTnN3M0CgFRliXBuvnONirRTRS
	jd9Y0YtNX0drSHKzoQOaRyoXeGIJVaP5fPsoX+jiDGsoXg3hEyoA2Kx/gGw452Pr1mnNFOcOTdb
	w6nu3ubpn2DDf6CVhqcGtBNXC5DFs1y5twGGrmbjkPVRK4RYMFyPrNvbzeOlfRffdhT5RNg8ZcI
	Lm2A==
X-Gm-Gg: AYBFou1iw+x6fpS8SIDpLry0+xzTSuZFuPEOFIF8QuUj/y7tP8HPTqdVSJz8d8NEnNf
	sJzqqvL8bTZJBT5Mnmg6O/XI5btHYtiBJginhQhiVQe+mVhtoCWdZeiAiYURHKp/jhVov1/CmTU
	t1kAEdhYCfLijXm6dkRB23qPxRhUy/dn2I2JGXBl2CvAnxV59xTKa+M8vxb/eEDSVWFwZJFy0kv
	2FVIHhm3SSrf/DSFLZ0xI+5FPAY218MKnmr9+DC61xDyVPgH88rknIt0k1UsyhZ303p90rt62lJ
	lkMlrI6a8sOP+TYXbuxeGNejcYVyM9lm1qm80egrvFrb0rntYlV9Vdq+eC9BV4/SZJu0eNurcka
	KGnPP8bb71CQKbw==
X-Received: by 2002:a05:620a:2b86:b0:93a:14c3:72c2 with SMTP id af79cd13be357-93bb7899ff7mr241443085a.29.1789549703916;
        Wed, 16 Sep 2026 02:08:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2b86:b0:93a:14c3:72c2 with SMTP id af79cd13be357-93bb7899ff7mr241437785a.29.1789549703326;
        Wed, 16 Sep 2026 02:08:23 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9fae9sm62245965e9.6.2026.09.16.02.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:08:21 -0700 (PDT)
Date: Wed, 16 Sep 2026 11:08:21 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Furong Xu <0x1207@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v3 2/2] net: stmmac: preserve real_num_tx_queues on
 mqprio setup failure
Message-ID: <aqpchcYpOyX81Mg2@lore-desk>
References: <20260911-stmmac-tc_setup_dwmac510_mqprio-error-path-v3-0-a76b1e2547c1@oss.qualcomm.com>
 <20260911-stmmac-tc_setup_dwmac510_mqprio-error-path-v3-2-a76b1e2547c1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S8iDoxvwvSgyEDhq"
Content-Disposition: inline
In-Reply-To: <20260911-stmmac-tc_setup_dwmac510_mqprio-error-path-v3-2-a76b1e2547c1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa5c89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=Lp37R7SOy4hbW3zDwkYA:9 a=CjuIK1q_8ugA:10
 a=Q-2sS2yn6ixtiu_JKUcA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX29QqNIQDgoU+
 5CJlV+7Dnp6lO20Coh9EzYGHwrk90g4tYn/6u1KP5gpPs9hi2UIqCrcBil2feIaT5NuMXbER0In
 YATobV0MzuWn0RAbyhuR87KGJPFLRHN0Dw7USe+V6xxjEdGIc0E0ETPipIWT3c0n9OAEmL1h+Lm
 sBVgvzfgGq8XzFmfLPBrJNkClsSYwXJqr7TWpffPHmzCmXMUM08I998+VRzrGnntKWX7HsS9rzi
 3lv9YaERzMKulWciRfRTM0QnSV6OqhmKeIUQKDJ+CFNxHQvaczPpBhoatWBymn1GyeyzbhkBww9
 xZ9Qz04wamDSXcaRQxtHW3jdqgGHRStI+KymIXTNCdBZx3/l+syQztKmc/ZBPJCAsbVtpaSrolv
 BRMwvVhGEvf8GOdpELsLSWgJAt+jbrBsd4rwIqWmBve3Mviarp50OAaGanLhQuLnbOTYFDKiOWk
 wCU637cpt9uQDYKRDNA==
X-Proofpoint-GUID: Vb6hxwIad0xMS4GJ2jMSrJVgFAaFmgqw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX9Ku+tZOjQD/I
 08HdOVf6O4sNCIauZ7L9KljRrhegerFIxcQ2BdZIFLOUlQkwYuX3BtviqsL3NQmHAAnY7l/wCiR
 6hefiLVw85F4GIsBVlePL0m/uz2QS5s=
X-Proofpoint-ORIG-GUID: Vb6hxwIad0xMS4GJ2jMSrJVgFAaFmgqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_020826_236110_4376C374 
X-CRM114-Status: GOOD (  29.38  )
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

--S8iDoxvwvSgyEDhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> With the FPE preemption-class mapping error now propagated from
> stmmac_fpe_map_preemption_class(), tc_setup_dwmac510_mqprio() can fail
> on the mapping step. The error path used to call stmmac_reset_tc_mqprio(),
> which resets the number of real TX queues to priv->plat->tx_queues_to_use
> (the platform maximum), overwriting the value that was active before the
> offload was attempted (for example a lower count left over from a previous
> mqprio configuration).
>=20
> The issue can be triggered using the following configuration:
>=20
>   # First mqprio config lowers the hw queue count below the platform
>   # default (e.g. 8 TX queues).
>   $tc qdisc add dev eth0 root handle 1: mqprio queues 2@0 2@2
>=20
>   # Replace mqprio configuration with a second one that fails FPE
>   # preemption-class mapping. stmmac driver resets the real_num_tx_queues
>   # to the platform maximum, losing the previous configuration.
>   $tc qdisc replace dev eth0 root handle 2: mqprio queues 2@0 2@2 fp E P
>=20
> Save ndev->real_num_tx_queues before lowering it and restore it,
> together with the TC-to-queue and priority-to-TC mappings, when the FPE
> preemption-class mapping fails, instead of resetting the queue count to
> the platform maximum.
>=20
> Note that a failed setup makes the qdisc layer run mqprio_destroy() on
> the new qdisc. Because priv->hw_offload is only assigned after
> ndo_setup_tc() succeeds, mqprio_destroy() calls netdev_set_num_tc(dev, 0),
> so dev->num_tc ends up 0 regardless of the driver-side restore and the
> previous qdisc is not reactivated. The restore is still needed to keep
> real_num_tx_queues and to avoid leaving the failed configuration's
> TC-to-queue and priority-to-TC mappings in place.
>=20
> Fixes: 195e4f409a40 ("net: stmmac: support fp parameter of tc-mqprio")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 82 +++++++++++++++++++=
------
>  1 file changed, 62 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/ne=
t/ethernet/stmicro/stmmac/stmmac_tc.c

commenting on sashiko's report:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260911-stmmac-tc_setu=
p_dwmac510_mqprio-error-path-v3-0-a76b1e2547c1%40oss.qualcomm.com

[...]

> -	err =3D netif_set_real_num_tx_queues(ndev, num_stack_tx_queues);
> +	err =3D stmmac_set_ndev_tcs(ndev, qopt->num_tc, tc_to_txq);
> +	if (err)
> +		goto error_reset_tc;
> +
> +	ndev_num_tx_queues =3D ndev->real_num_tx_queues;
> +	err =3D netif_set_real_num_tx_queues(ndev, num_tx_queues);
>  	if (err)
> -		goto err_reset_tc;
> +		goto error_reset_tc;
> =20
>  	err =3D stmmac_fpe_map_preemption_class(priv, ndev, extack,
>  					      mqprio->preemptible_tcs);
>  	if (err)
> -		goto err_reset_tc;
> +		goto error_reset_num_tx_queues;
> =20
>  	return 0;
> =20
> -err_reset_tc:
> -	stmmac_reset_tc_mqprio(ndev, extack);
> +error_reset_num_tx_queues:
> +	if (netif_set_real_num_tx_queues(ndev, ndev_num_tx_queues))
> +		netdev_warn(ndev, "Failed to restore %u TX queues\n",
> +			    ndev_num_tx_queues);
> +error_reset_tc:
> +	stmmac_set_ndev_tcs(ndev, ndev_ntc, ndev_tc_to_txq);
> +	for (i =3D 0; i < ARRAY_SIZE(ndev_prio_tc_map); i++)
> +		netdev_set_prio_tc_map(ndev, i, ndev_prio_tc_map[i]);

- Is the loss of the FPE reprogramming step on these two labels intentional?
  The old err_reset_tc path went through stmmac_reset_tc_mqprio(), which en=
ds
  with:
  	return stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
  The new error_reset_num_tx_queues / error_reset_tc labels only touch netd=
ev
  software state (stmmac_set_ndev_tcs() -> netdev_reset_tc() /
  netdev_set_num_tc() / netdev_set_tc_queue(), plus
  netdev_set_prio_tc_map()), so the hardware mapping is never rewritten.
  - I guess we have already discussed about it. If qdisc replace fails, I t=
hink
    the driver should restore the previous offloaded hw configuration. It i=
s then
    up to sch_mqprio qdisc to properly restore the logic. Here sch_mqprio d=
oes
    not run mqprio_disable_offload() and this one seems a sch_mqprio bug to=
 me.

Regards,
Lorenzo


> =20
>  	return err;
>  }
>=20
> --=20
> 2.55.0
>=20

--S8iDoxvwvSgyEDhq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqpchQAKCRA6cBh0uS2t
rBBCAQDRlOxiCPPJ3sCvvfdFTDMDQ5Ut/zQo1xpKhzf6U9ggXwEA+cBSE4+3t0YG
CyDvRnKtUJ74H4LFtzU47fKvrHWBrAI=
=9SLr
-----END PGP SIGNATURE-----

--S8iDoxvwvSgyEDhq--

