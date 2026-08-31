Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366D5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRdUPsnNzxRUVLTcFatiqKu+uDqmGhQcvxZJaUARUuw=; b=pldtc5rXBEGxSZxPCXmCGX/bHj
	Jh+2Z0tBzkj6RourgUJqsiPAYM8rseNzHsPxfAUsLigWn4DEsa1M6xCVdJiGJfcBVRHxy33VkFuSl
	JuvblrFzoAAkB+/UPzNQlmGOHW8T9d+tQFtlo6C0VieLZCsg7Ufe9gXmTTXjdoATOwXu7zrP76WsR
	he8c1gJdKW5OPmOI7EW/FKM7Zxc3DgEk1OltRQ3x32kQ6q9hhEtfLH3waocIDRYUXfJa1GlPH4NXQ
	ySyzFGgygUVbgmCafEWj6fkwU2YyHyOmLglemxWyyanh5vytXIXY/T5LX4GtLTFgubuvJ0/q+ff3j
	S2auWViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yjV-0000000949A-2xJp;
	Mon, 31 Aug 2026 09:55:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yjS-0000000948o-2m1l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 09:55:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xa8M3427327
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 09:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oRdUPsnNzxRUVLTcFatiqKu+
	uDqmGhQcvxZJaUARUuw=; b=laUUXLAO1ca9F8h7lr/IoXmXLZzsW4/mzgyVcniX
	Z5YmSPDaZ/kP7I6dL8jUPJ7QaHW55GvEPrj/5YRtULgtC4Sd47VmqqJO7+Tmu6M8
	9Yz3umcuKNPMAcEhmqWJEt5D0L6Sbt4qKm7EQM2XDotFD0DMCXYVg9u+piD/dUt/
	sjDicwC4g6J6maQMFgKBxFv/poL4yFwwoHQ+pEKjjhWTtaCBbdnwC8loA0G2Cjmx
	uXjMqVGEx2oz7V7q646QWY4d4YALNfN6d01IFUNjEnK58J7et1aXqmE9A6jpWba7
	tp0z1fKS5fvrIvgVOxeTw/QDiTtX/15R3wyr65u/rR70zA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pm8ssr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 09:55:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52f9f6b85cbso21004011cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170112; x=1788774912; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRdUPsnNzxRUVLTcFatiqKu+uDqmGhQcvxZJaUARUuw=;
        b=SjZK6SiHvP922WrDz24roY0mC4Bs1yaiB4Oe1f7Ork45k5V7i9dgpD3KKCYI2GLVng
         WdLCcQT/nQzKZViORJXyEc7M0Pbvb73ERDyhnL/3/r4G1iud3J9emziB62WAqecNnytV
         wJCgYi+decN2v+x+KV0jTziu9+8CO0ON3SMF0kqugXIuGitjgzD0pcazOADznXfbgA4n
         J0vcm3svGg9ANcu/z5g3u73vHlopk7RYfa52VAkqmnfBOihXWiw2ZnXZ9gM2FQ05yA4e
         tcUbdO6E4+U59Pxbpw/I8O3+jqn/IfDPazcORMgLe1ZEUTjA7JDbpvITHR3pYcPwvkZf
         4KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170112; x=1788774912;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRdUPsnNzxRUVLTcFatiqKu+uDqmGhQcvxZJaUARUuw=;
        b=n4AEysv2E7nt/Uzv3IKLjx2w4f3sNc0itdQRsly1wxLLDa8/N0vnUQf8vfAky9iMTR
         qhNTSOKjP24DAVUpm5pLEuclJOMvNjo3zRnsb9VZxbxqtf3rCkQCYNh1rlnUKCAyhkNd
         S3yh2uMNptcFTIGGGU8bMqYEx/pB/Zu9iY0+cr2yOaTYVAVSKc2/Hena77pCaunFNQ8F
         vu3xXBbnH91Ea5MUtf//4TgnDfk+6lDYMjY8USqyNCOsBIvpS8Kz+NwWo2ubElVfvAcO
         3eNYmRETEfyvqnTruqdKhwTHczI14rWA6SZQsFNb/KKLymXjCEP9eGbeD6Q2h76s2MlE
         /vMg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+TjZKQgPy5gPLEMb3VGkzFt/gXggyvm8NWC9gX5LdDy/nScIyfmyJS73+14fmCWd4Re6sQwMoDwCggT96sU1J@lists.infradead.org
X-Gm-Message-State: AFuF++l866ox4DwlRDbm+wGk1xPhNlifR8Mxyehid/tPOFFDInt6sslj
	VMfz7l3kPEjUzomXK2lGcNREOU2Mu2l7BVchyajoxJEb58VCDwfxCucQFc9k3yasR8cIVmCY8+h
	iT9iKb40ciJ32dXP1+wbU3LAUG0ULubIjS8BGXKjUZgqr8NYilLm42q3ChlrIRBz/IfbKKnSzS7
	szoQ==
X-Gm-Gg: AR+sD12TdDv5eZQuUDQBQ5QUhAVTsX8z5LILQg5J7yuTBC1fSXlpYCaSl0j41b+CEfH
	/VrGsukIyCs5C4K2nCd4dZ5DqRLrNGaGvLSMj7fctx9nEcfdejh9UwOPshcOy6TKGM2RPgfxLzA
	/dwmhBztct77+FNjm183jZMdl97noM22tkxLZ9Mzlyp+Kbw8/YMSqFooBGY8OK6GCnIT/rS+NPI
	Ndtcfx9B47E6jAfVD0ZY/THJrv34TAmMpbaXcq1z4EOWElpAerChth5BGoP7MxjuExXQZ0WRPWF
	GTq7qH6VMg5vWM2osUTym2rKQFeLGwaky01mJp36Php13KsgBxBR1JNruz/9GoYIIfGWVIO6ENs
	p357IVREKZJ4vrA==
X-Received: by 2002:a05:620a:448a:b0:936:cae5:8b38 with SMTP id af79cd13be357-939137fb875mr2493932385a.10.1788170112151;
        Mon, 31 Aug 2026 02:55:12 -0700 (PDT)
X-Received: by 2002:a05:620a:448a:b0:936:cae5:8b38 with SMTP id af79cd13be357-939137fb875mr2493929285a.10.1788170111595;
        Mon, 31 Aug 2026 02:55:11 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd8148fbdsm34913945e9.3.2026.08.31.02.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:55:10 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:55:09 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: stmmac: hold runtime PM reference in setup_tc
Message-ID: <apVPfWikwo5pqh4f@lore-desk>
References: <20260827-stmmac-setup-tc-enable-pm-v2-1-a9b8a5948f41@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xKx+OafTtXKdsrQn"
Content-Disposition: inline
In-Reply-To: <20260827-stmmac-setup-tc-enable-pm-v2-1-a9b8a5948f41@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FDg22-svvjNsoZThAeyCWxeoi20wFaDA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NSBTYWx0ZWRfX32VUBa5+0ROD
 BMoqxg6yykA80YfR3tKPjCyPOxxrzGT3IeRA8ovr1l11SShDdKO9VD48F+1FNOOgIN92p9B+LvM
 bV6Omfh5/hhOirpbMFhgUCmicecnZrfviOHyRT4hUJhwNwcHg83EfKNZL4GeldLP6nKr/yAB9F/
 lev9e/C2GqkJRkvL/5qBlBKFC2qwRUdpzMICXM3i3HbbeNuTCkYI7StfHP6l/DEMiijhtTESLRL
 SULGz3Ybf5U2HiNnjsUYYmBniahcc4ZEnOcpZfhwRtOmtyF70Sa+woxSr3OmLu92R7xoZO2qXs7
 0kM1iW4lqbITA7G74eRTkSiFZHh6BNBf5mW1oLb7kibGcmf42tGOMsmKn8wsCNiWFKxomFbeJ88
 8YFbjsX3RwzRpDsiWJf4qtoPrHtp8mlVDrKVdCswnanieKHxpgPbayV/HHnOG44uogwGJ9+QCse
 ecTrhX4S8oYHucL2+RA==
X-Proofpoint-GUID: FDg22-svvjNsoZThAeyCWxeoi20wFaDA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NSBTYWx0ZWRfX9qqlyowq+0Ca
 lh/mJJ1VAhzp/pcyn2syI7sByR+VSP+BAWW9NkQkboK5tCNn3SBwVF7Z8DB5xn4QnHCYyNv8wtQ
 8kEQTFpZXIdW0v3dVzUConQokecbhbM=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a954f80 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LK5SnTVSdOS2cW5lnr8A:9 a=CjuIK1q_8ugA:10
 a=psPUyEKxvqZN-xNySdUA:9 a=a_PwQJl-kcHnX1M80qC6:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_025514_822368_BA5F90BA 
X-CRM114-Status: GOOD (  34.48  )
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

--xKx+OafTtXKdsrQn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The qdisc offload callbacks invoked by stmmac_setup_tc() program
> MTL/MAC registers, but they can be reached while the interface is down,
> when stmmac_release() has dropped the runtime PM usage counter and the
> device may be suspended with its clocks gated. Accessing the registers
> in that state can trigger a bus error.
>=20
> Hold a runtime PM reference while configuring the register-touching
> qdisc offloads (mqprio, cbs and taprio) so the device is active, and its
> clocks enabled, whenever the MTL/MAC registers are programmed.
>=20
> The TC block callback stmmac_setup_tc_block_cb() programs the MTL/MAC
> registers as well, but it runs asynchronously from stmmac_setup_tc(),
> outside the runtime PM reference held there. Hold a runtime PM reference
> for the whole stmmac_setup_tc_block_cb() call as well, covering the
> cls_u32/cls_flower setup and the queue enable/disable accesses.
>=20
> No reference is held for the TC_SETUP_BLOCK bookkeeping itself, the
> TC_QUERY_CAPS query or the tc-etf path, since none of them touch the
> registers synchronously. In particular the block bind/unbind must reach
> flow_block_cb_setup_simple() even when the device is suspended, so the
> driver never leaves a stale flow_block_cb on its block list.
>=20
> Fixes: 1f705bc61aee ("net: stmmac: Add support for CBS QDISC")
> Fixes: 4dbbe8dde848 ("net: stmmac: Add support for U32 TC filter using Fl=
exible RX Parser")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Commenting on sashiko's report:
https://sashiko.dev/#/patchset/20260827-stmmac-setup-tc-enable-pm-v2-1-a9b8=
a5948f41%40oss.qualcomm.com

> ---
> Changes in v2:
> - Return -EOPNOTSUPP in stmmac_setup_tc_block_cb() for unsupported TC
>   blocks.
> - Link to v1: https://lore.kernel.org/r/20260824-stmmac-setup-tc-enable-p=
m-v1-1-45172d241a4b@oss.qualcomm.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 35 +++++++++++++++++=
+++---
>  1 file changed, 31 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index efa35cfecc4f..90753d5af6d6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6393,9 +6393,13 @@ static int stmmac_setup_tc_block_cb(enum tc_setup_=
type type, void *type_data,
>  				    void *cb_priv)
>  {
>  	struct stmmac_priv *priv =3D cb_priv;
> -	int ret =3D -EOPNOTSUPP;
> +	int ret;
> =20
>  	if (!tc_cls_can_offload_and_chain0(priv->dev, type_data))
> +		return -EOPNOTSUPP;
> +
> +	ret =3D pm_runtime_resume_and_get(priv->device);
> +	if (ret < 0)
>  		return ret;
> =20
>  	__stmmac_disable_all_queues(priv);
> @@ -6408,10 +6412,13 @@ static int stmmac_setup_tc_block_cb(enum tc_setup=
_type type, void *type_data,
>  		ret =3D stmmac_tc_setup_cls(priv, priv, type_data);
>  		break;
>  	default:
> +		ret =3D -EOPNOTSUPP;
>  		break;
>  	}
> =20
>  	stmmac_enable_all_queues(priv);
> +	pm_runtime_put(priv->device);
> +
>  	return ret;
>  }
> =20
> @@ -6421,26 +6428,46 @@ static int stmmac_setup_tc(struct net_device *nde=
v, enum tc_setup_type type,
>  			   void *type_data)
>  {
>  	struct stmmac_priv *priv =3D netdev_priv(ndev);
> +	int ret;
> =20
>  	switch (type) {
>  	case TC_QUERY_CAPS:
>  		return stmmac_tc_query_caps(priv, priv, type_data);
>  	case TC_SETUP_QDISC_MQPRIO:
> -		return stmmac_tc_setup_mqprio(priv, priv, type_data);
> +		ret =3D pm_runtime_resume_and_get(priv->device);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D stmmac_tc_setup_mqprio(priv, priv, type_data);
> +		break;
>  	case TC_SETUP_BLOCK:
>  		return flow_block_cb_setup_simple(type_data,
>  						  &stmmac_block_cb_list,
>  						  stmmac_setup_tc_block_cb,
>  						  priv, priv, true);
>  	case TC_SETUP_QDISC_CBS:
> -		return stmmac_tc_setup_cbs(priv, priv, type_data);
> +		ret =3D pm_runtime_resume_and_get(priv->device);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D stmmac_tc_setup_cbs(priv, priv, type_data);
> +		break;
>  	case TC_SETUP_QDISC_TAPRIO:
> -		return stmmac_tc_setup_taprio(priv, priv, type_data);
> +		ret =3D pm_runtime_resume_and_get(priv->device);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D stmmac_tc_setup_taprio(priv, priv, type_data);
> +		break;
>  	case TC_SETUP_QDISC_ETF:
>  		return stmmac_tc_setup_etf(priv, priv, type_data);
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> +
> +	pm_runtime_put(priv->device);
> +

- Does configuring TC offloads while the interface is down result in silent
  data loss when the interface is later brought up?
  By wrapping these accesses in pm_runtime_resume_and_get(), the driver now
  successfully programs the MAC/MTL registers while offline. However, when
  the interface is brought up, stmmac_open() calls stmmac_hw_setup(), which
  performs a hardware reset via stmmac_reset().
  This hardware reset wipes all MAC and MTL registers back to default value=
s.
  Since the driver lacks a mechanism to restore the TAPRIO, MQPRIO, or RXP
  configurations during stmmac_open() or system resume, the TC offloads are
  silently wiped from the hardware, leaving the software TC state completely
  diverged from the hardware state.
  - This issues have not been introduced by this patch and they should be
    addressed with a dedicated patches. Moreover, EST issue has been already
    addressed in this patch:
    https://lore.kernel.org/netdev/20260829-stmmac-est-reapply-after-open-v=
2-1-5e5ccb185e92@oss.qualcomm.com/

Regards,
Lorenzo

> +	return ret;
>  }
> =20
>  static u16 stmmac_select_queue(struct net_device *dev, struct sk_buff *s=
kb,
>=20
> ---
> base-commit: f967455fb2a5a2079b9eb5823e9ccf359174bf9f
> change-id: 20260824-stmmac-setup-tc-enable-pm-149aa563d797
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--xKx+OafTtXKdsrQn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapVPfQAKCRA6cBh0uS2t
rC+FAQD4I8PucCebxzhGTP3k59QxgwKNXiDiNOUrxC6FKLzNcQD/SspChm3h57Gj
8kg/zNBbgQQ3NTji4kmloA2qeRf5YQY=
=TAX9
-----END PGP SIGNATURE-----

--xKx+OafTtXKdsrQn--

