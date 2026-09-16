Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C349C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEfR/5S3Wv5GzRV9EH6EqanQ/UM6ccry5/7wH1HKDnI=; b=k8uHc+SlerjRXWptikeMSxHcbd
	xyT8hRrqP7drr7fw1l+DuiOdEhi+/pVeMRrsor3aGQiK8w330EQa5CLeZ4oeyha0ALoRDd4GSmjWd
	QXh1xSLgAoGDNrjuiqh+mfXgKp/Lnq9YcETrFF8vrEpOA7VSkl40i+mOX3qyjMCgJM2Qe1DzNYXt+
	wyEu5Q5LovLFbyCevAWOla2s+FZoKU6Z+NZKCmIUsqH0CxEd1PieegSk6cFJNskS8eqBGL8hhahi7
	sJZBMNj5hhNau9MW4+wh69eIaB4QAxDSx4DBHkqE5znK7Gegq0r+QZQrovM+a6iSSplVwHDX3E/Sx
	OgtKKBEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kAl-00000008b8A-1OJ8;
	Wed, 16 Sep 2026 07:35:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kAh-00000008b7R-3Xxd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:35:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68iRL2428905
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 07:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uEfR/5S3Wv5GzRV9EH6EqanQ
	/UM6ccry5/7wH1HKDnI=; b=jR2WPIpRAdQpk5U4nBcPdRgJwfYE172GE7rL/IKh
	DKkUStrO6YmEp9Mo1fcnPSVOEpCAwixgtxOXJdQarmN+kcWQNNswgy6EMwN3GFNT
	Ch5eRAyAArkghUjHcF6rfvg3V/5yG0VOxw4hhDcXYd6TIPNHtFDCPK5FijyonfVO
	bG7OeS1hsmq3Ye8n/f90iAEIqI00wuI+e4FM6CbEqLGkkDuAektcdhTjDuPxrsbA
	QFZO2L2EuliREOxkPU78PMY7bycsWUiCY7vF3/4lE0genNITdCcTPEC2Nxv0k0ST
	+MXT0bjPBq22tPwrsM8CWup2m2XE0/nYFmnmnz/bPVNzhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfhmt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 07:35:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a07b5b5efso341777885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789544110; x=1790148910; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uEfR/5S3Wv5GzRV9EH6EqanQ/UM6ccry5/7wH1HKDnI=;
        b=TvLzVZqFQ5QI6i8ePZneB2iGNr8ohctm4Yp/vidGhmpUvTBmWBbMSWWkrWLm2M4Be9
         n6Qaf5XUkj/ucDHrS7svbg4svbgx6V4ORWLkbt4jbbI0cMmmhOuFvi/BHluqYGwcTCp5
         P/5WhI1e1kp4GHARiDol8VRkkRDcYJsKG/u7Pbc1TD7MxuObXPLSB2QLicBggUGMSoq7
         8eT3twX2bEwpJYQIdyQGaUslVRusjdJXHsDdMSc8qb2ESqNkTRyVvViV6mJ5nWQXd7sW
         RP08Is/px8yFS9dGj3/MgPPA0SrHx0FPbOYHJ0Zzh+HaGxfJHerLdojijmMNpS2gZoF1
         R2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544110; x=1790148910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEfR/5S3Wv5GzRV9EH6EqanQ/UM6ccry5/7wH1HKDnI=;
        b=kQGeOCHuEoOwsjxcgBtM++kpYhzyR/hUL03hDn6iIGKEhVpK/V0g3PjtvT/aQuKvOy
         XqeRgdyFQQCm7/vOaWU6kU9WwgxgEGmW5yY6/d3WdHACm0rBjwODeeUIVHm9KmhrmB5d
         frvQyuRjt9266YJJqZY0y1BJbLvybG7SkQSVlppsCYkfblDQPAUZQTCVAFPcBx0BKT9B
         Q0f04mwAkoPIZzaGpb1P7E315WeW88xFYdx2Hm4Xv3+UPFmBji94rmGwZ8xFA9yMRcKs
         WXVRG1GoH3aOQi/bbyE3cxVsWQ25zqYnIDe+4b+N4TFFlNgxl3R/TcloZ7z7zzGUA+mc
         rvwg==
X-Forwarded-Encrypted: i=1; AKwUvBz606XjZgwfSGZqAJNHiGtuVRDtgmsSTt3RYNhps6Dp7lG74F4qES10w9QvhxQg09MQsfShSAG27ZNK6aI+cl2c@lists.infradead.org
X-Gm-Message-State: AFuF++lEg3DLj1HJX0nph1Rz+OIWVILOryr8mSvnxeGmlC3Kgb4p4QBJ
	grRUTp7OdYAmvVJaxXMhgPm3oC8IJTTR+pC2xP7WsP8OjUaqLFeMSKi1fZP7mvmfzdMiXhvk4S6
	i7dKGRDDUybecUzC1M1wyUvxefZm7eWyzdR/qzqRm2ROquZrSizeeBvLMiuVNz2+Xbe/HWITyY5
	ZEEQ==
X-Gm-Gg: AYBFou0GJ+AW/VRsI8cQ3Zcar0Mdi/tnCXCnPEIUKPgQe/gut4OryRnM3q/B8tYuwze
	EazQZx2wNaMHrQ+KDFEZPABwlt6vIGYjcx8Nncj7Co1CCCfwEqisjhhrJghSZSfRZWfd+SKg5if
	DyEjRzPhvGif+30ejOCVB75oJHETOhuhDfEe4E8JLXcGX8lq+QN2DsLmdY9kkkcPUxXJaD3TRUY
	aWMjIuIKBnkEt9o0mwKWSQV/Ip52TgnjktfnJu/loW7AQ3LCge7whCBbousj3x7j/+yIfC/s2FW
	6/h3xKOiAoQvcmd44W71hQAv9TZ9vhtS/d5DeRraCuCSHhfSRSoTsar1SgV7u2ehhgfyNxJBnEP
	Q4QAaNa0eh980Rw==
X-Received: by 2002:a05:620a:170d:b0:939:fe07:a13a with SMTP id af79cd13be357-93a345d5f43mr953362085a.6.1789544109571;
        Wed, 16 Sep 2026 00:35:09 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:939:fe07:a13a with SMTP id af79cd13be357-93a345d5f43mr953359285a.6.1789544108926;
        Wed, 16 Sep 2026 00:35:08 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de63c5e7sm72892366b.53.2026.09.16.00.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:35:06 -0700 (PDT)
Date: Wed, 16 Sep 2026 09:35:05 +0200
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
Subject: Re: [PATCH net v3 1/2] net: stmmac: propagate FPE preemption-class
 mapping errors
Message-ID: <aqpGqfV2HdFKR1PB@lore-desk>
References: <20260911-stmmac-tc_setup_dwmac510_mqprio-error-path-v3-0-a76b1e2547c1@oss.qualcomm.com>
 <20260911-stmmac-tc_setup_dwmac510_mqprio-error-path-v3-1-a76b1e2547c1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5b69i88zLkTSu1Wa"
Content-Disposition: inline
In-Reply-To: <20260911-stmmac-tc_setup_dwmac510_mqprio-error-path-v3-1-a76b1e2547c1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa46ae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=J8cgxKmYb7H1puaGB6cA:9 a=CjuIK1q_8ugA:10
 a=QHj-6YDLfriWvGvl-S0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA5OCBTYWx0ZWRfX1YO9JNP6rPoi
 hUmINkfnAB817TS5qdZqoTdmPU2c6UDfH+2TFKdyGkXSLJqkEOzgIuZLtep3t0FjqWhmlf9n8NN
 +H66Xo2dPEgIPorK7JdXcRdVIDagkGHZb8Rd/ofgsWrc8TyDuovRE/t0hizYdGEkjdVArlyDAT3
 /ZNmdhNeS4837EnmqI4XQhxdBy/s/3viczqmRbLx9rbvjXxQV18xvXyExe6zFx/nVOzCvBMnJH6
 FtMB5wQxXDJGjf472i+yGF5enyGB9u8LTaSVFlwhlsn4MakfBBk/+lqsD0whGRt+xo8+5dULdfx
 cdj0qLUtjruiYnA0b5qdqL2de8H0fdnYLg1FcSVbrFMJcod2F4J2afImxRxXiw+HRmmUCLbFyTp
 +GDtd22wtpEu5gDjiysrPLEcZoghtIJAgCewcABsf1PpxDpkcRccAiDZFGewoNHm2H/WRkS5Wpd
 vWBOn1px8NKNeBN4Sdg==
X-Proofpoint-GUID: O0YeZYmjTeBop26l0blQASit3mkmoyOS
X-Proofpoint-ORIG-GUID: O0YeZYmjTeBop26l0blQASit3mkmoyOS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA5OCBTYWx0ZWRfXxz/X4gAjYCRm
 W+xb2xzGlc6NhxH8wnint7XgqYNOTDD2sTHg1x30hbmu/f3MQ41wU1xNvSoRZi2MtNb7UE1MMG2
 KsSTRHCHCb1m2paM26QVCVg1iToe6nU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_003512_259546_956C71D0 
X-CRM114-Status: GOOD (  36.80  )
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

--5b69i88zLkTSu1Wa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

commenting on sashiko's report:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260911-stmmac-tc_setu=
p_dwmac510_mqprio-error-path-v3-0-a76b1e2547c1%40oss.qualcomm.com

> stmmac_fpe_map_preemption_class() dispatches through the
> stmmac_do_void_callback() helper, which forces the callback's return
> value to 0 whenever the op pointer is populated. As a result the
> -EINVAL returned by dwmac5_fpe_map_preemption_class() (e.g. when a
> preemptible TC owns more than one TXQ under SP scheduling) is silently
> swallowed by every caller.
>=20
> Switch the dispatch macro to stmmac_do_callback() so the callback's real
> result is propagated, and honour it in the taprio and mqprio qdisc
> offload.
>=20
> Note that the taprio "if (ret)" check in tc_taprio_configure() used to
> be dead code and now becomes live: a preemptible TC spanning more than
> one TXQ under SP scheduling cannot be programmed in hardware, so a
> taprio or mqprio configuration that previously returned success while
> leaving the preemption-class register unprogrammed now fails with
> -EINVAL. For taprio, the failure also runs the disable path, tearing
> down the schedule that was just installed; this is the intended
> behaviour.

- Is the described condition narrower than what the code actually rejects?
  In dwmac5_fpe_map_preemption_class() the SP rejection is not gated on the
  TC being preemptible:
  - I guess we can do a little improvement of the commit message if I need =
to
    repost.
>=20
> Fixes: 195e4f409a40 ("net: stmmac: support fp parameter of tc-mqprio")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/hwif.h      |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 19 +++++++++----------
>  2 files changed, 10 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/eth=
ernet/stmicro/stmmac/hwif.h
> index 04dafec021b4..9314bcb85c22 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -494,7 +494,7 @@ struct stmmac_ops {
>  #define stmmac_set_arp_offload(__priv, __args...) \
>  	stmmac_do_void_callback(__priv, mac, set_arp_offload, __args)
>  #define stmmac_fpe_map_preemption_class(__priv, __args...) \
> -	stmmac_do_void_callback(__priv, mac, fpe_map_preemption_class, __args)
> +	stmmac_do_callback(__priv, mac, fpe_map_preemption_class, __args)
> =20
>  /* PTP and HW Timer helpers */
>  struct stmmac_hwtimestamp {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/ne=
t/ethernet/stmicro/stmmac/stmmac_tc.c
> index 14cabe76e53e..5398616fcdfe 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -970,7 +970,7 @@ static int tc_taprio_configure(struct stmmac_priv *pr=
iv,
>  	struct netlink_ext_ack *extack =3D qopt->mqprio.extack;
>  	struct timespec64 time, current_time, qopt_time;
>  	ktime_t current_time_ns;
> -	int i, ret =3D 0;
> +	int err, i, ret =3D 0;
>  	u64 ctr;
> =20
>  	if (qopt->base_time < 0)
> @@ -1120,9 +1120,9 @@ static int tc_taprio_configure(struct stmmac_priv *=
priv,
>  		mutex_unlock(&priv->est_lock);
>  	}
> =20
> -	stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
> +	err =3D stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);

- Can a failed TAPRIO_CMD_REPLACE now leave sch_taprio and the hardware out
  of sync?  In tc_taprio_configure() the FPE mapping is validated only after
  the gate control list has already been programmed and enabled:
  	ret =3D stmmac_est_configure(priv, priv, priv->est,
  				   priv->plat->clk_ptp_rate);
  	mutex_unlock(&priv->est_lock);
  	if (ret) {
  	...
  	ret =3D stmmac_fpe_map_preemption_class(priv, priv->dev, extack,
  					      qopt->mqprio.preemptible_tcs);
  	if (ret)
  		goto disable;
  That "goto disable" was unreachable for every MAC providing the op while
  the macro forced 0, and becomes live now.  The disable block sets
  priv->est->enable =3D false, reprograms EST, zeroes
  priv->xstats.max_sdu_txq_drop/mtl_est_txq_hlbf/mtl_est_txq_hlbs and clears
  the preemption class register, and the function returns -EINVAL.
  - I think this issue is not introduced by this patch, but it is already t=
here
    and it should be fixed with a dedicated patch.

- Is this ternary reachable in any form other than "return ret;"?  Following
  the call with pclass =3D=3D 0:
  - dwmac5_fpe_map_preemption_class() takes "if (!pclass) goto
    update_mapping;" and falls through to "return 0;"
  - dwxgmac3_fpe_map_preemption_class() has no error return at all

  - I think the current implementation is more robust for any future change
    even if in the current code if pclass is 0, it can't return an error co=
de.

> =20
> -	return ret;
> +	return qopt->cmd =3D=3D TAPRIO_CMD_DESTROY ? err : ret;
>  }
> =20
>  static void tc_taprio_stats(struct stmmac_priv *priv,
> @@ -1237,14 +1237,15 @@ static int tc_query_caps(struct stmmac_priv *priv,
>  	}
>  }
> =20
> -static void stmmac_reset_tc_mqprio(struct net_device *ndev,
> -				   struct netlink_ext_ack *extack)
> +static int stmmac_reset_tc_mqprio(struct net_device *ndev,
> +				  struct netlink_ext_ack *extack)
>  {
>  	struct stmmac_priv *priv =3D netdev_priv(ndev);
> =20
>  	netdev_reset_tc(ndev);
>  	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
> -	stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
> +
> +	return stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
>  }
> =20
>  static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
> @@ -1257,10 +1258,8 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_=
priv *priv,
>  	u32 num_tc =3D qopt->num_tc;
>  	int err;
> =20
> -	if (!num_tc) {
> -		stmmac_reset_tc_mqprio(ndev, extack);
> -		return 0;

- Same question for the mqprio delete path: with pclass =3D=3D 0 the value
  returned by stmmac_reset_tc_mqprio() can only encode "callback op pointer
  missing", after netdev_reset_tc() and netif_set_real_num_tx_queues() have
  already been applied.  Is propagating it useful here, or would keeping
  "return 0;" after the reset match what the hardware state actually is?
  - Same here, I think the current implementation is more robust for any
    future change.

Regards,
Lorenzo

> -	}
> +	if (!num_tc)
> +		return stmmac_reset_tc_mqprio(ndev, extack);
> =20
>  	err =3D netdev_set_num_tc(ndev, num_tc);
>  	if (err)
>=20
> --=20
> 2.55.0
>=20

--5b69i88zLkTSu1Wa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqpGqQAKCRA6cBh0uS2t
rBXYAQDeTCb+b4tMZ+vIn9CP0NyzAFTiP6RzSd6WlENMsVMsEAEAxvwWwa2Fh7+u
yLq3I47qLOt5M84M3vAVz+vy61PJpww=
=/iNM
-----END PGP SIGNATURE-----

--5b69i88zLkTSu1Wa--

