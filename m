Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225A7C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/YD691Fj2CJ2m9/QspAH8/d6dwRoEx6BxlEqozr9iZk=; b=lQxMh6QSOfeZI7eocUmJ/StQXR
	MFKri5mqQHVqxXNx8toTeT2P8/k2JVN8JTueRIvndbFQ57t4XSHsF5Lawf1+za3Dh6uE9r5bn/dl3
	cS/QMqqzBdtE/524TqqtiKYHeScGHdHzmRHJDI1TUHxMl4genevCBGmcYz7coi1PV20+0sY0ZFAFA
	uATCtmuy8cAJZ5+hVl7fGCjeQcckmjfIn8wPBie1zWzZB9gb16ucacAxKfWp5GmOdzexYew7ZzhkP
	4huMXtL6jdKDFO2+2C2UGJqj3uRqD+Ej1486lJsDw9XfxT76Sm712OiXq2rJExSZpIW20eQ2o1B5R
	hfvLYaqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67eQ-00000003yt6-0TCa;
	Mon, 14 Sep 2026 14:27:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67eN-00000003ysa-1xRa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 14:27:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0XqC1025811
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/YD691Fj2CJ2m9/QspAH8/d6
	dwRoEx6BxlEqozr9iZk=; b=DPGI/zWDLKCH/NeMsWI/R/5eNReuUerefWo4N7Mu
	B0ud/Ng4S0zBKtzOURtpMRdEBXCadIHdBJ+qKpykUO5xI9fY0MfEWcmaT0x6YJ1m
	pP8kQe0VwETgSMrP7D52RjGAsRt+y9bOmQG/usLHsCJOUIGn6xRKxw+0W2zHBrfl
	DCMav8wHuSkJqjhPIxeArt7gXeXByf703e1oJMD6zgaBljexxC4G862sAvsGyu8c
	jzFSHfTSxQdLI6mwGronNNA8eWmQMPdC4eW4r33eN2RnPhbvK9Yn2xc0IK61vM0E
	EF0Dh2B3V6B5cj6Wln6U0IGUVmj8bCYXc5prGU9lhdXHUg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5sbds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:27:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78fbc5a4cf8so3582797137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789396033; x=1790000833; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/YD691Fj2CJ2m9/QspAH8/d6dwRoEx6BxlEqozr9iZk=;
        b=bDvPfvNOmSMUBRaGcdFkFt+IIQNsrTDOHiAfRExETy960sZnL3YEsg2/tfOFhcUNG1
         wysniBOQNjln29GwXJhrHgTYE/mWIPPN96nXkbPkVNmVeJPpxF9mVHvTflqhTeLR7NzJ
         4Uf+6T4ptHPfb+WKbQNfeUljCsYKxQ29lzR5loIhsaAvyFqajXkOxUkE1coI01WXhPv7
         qIp6tpekauPPlDXHjlY92zqG7B3ys/sKBZiQwmUECOckPk2Wyn/s4iGPYP3+xgzbyZS7
         er8Mr5BYu+VGP7zaHZhCUxunNEtkT87HzXL5CbB9DlNII0kU6U6M4ukY6Z/T/QInpiBZ
         G6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396033; x=1790000833;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YD691Fj2CJ2m9/QspAH8/d6dwRoEx6BxlEqozr9iZk=;
        b=DJckcJvtGQX3jnUUYiRhNBA43gtOvE+aYry98Awjo9BKiXmKiDMNknA5SAxHURrEUs
         4lKhmXhimA5upYJQusr80DJg5ZRK3IVUMYt+inavV+jrSWPFXxnPetlrkhbYmRQ/aWMd
         WW85Z/wbSbdg+YMmZuxRNAIf/+Y6OQNNK1EQSrkKYILAXDy7fFjj459uEZCsePVDcyQm
         3c4bnvyBLxeB5+m8uX2M5MbVe6siKx4cejOdYA5vHuQg2646k542yA0ipPZgo58woKGj
         lRvpLz6IAOb/FIBa2F0AK0MDvUbTghsDnUh4lNCD6TwU1V43KZg6tOWEvDkgAfrbOJqM
         ME4A==
X-Forwarded-Encrypted: i=1; AKwUvBzdz+w0ighJd8uXjgDeFCIerPpxuK3SYnsVe0eSkC5UE6LKu6hK0elKn30Ozkjl0oD//vEJ9csntVTXNqBFkChp@lists.infradead.org
X-Gm-Message-State: AFuF++lvVZSWsASS2x4eq/uQ3r0gA9fIFTzPwcN422C6cNv2we7xHeNH
	aW7UNiyK540oKJBf2+A24WysE3lx/JHU/gHf8C7Kr/gM2eSrel4aNNZ/7fR80g+l6RGRB6+/VIr
	36FBENbgkzPg+e3XMI6F5YSUSsR3Fg3JJQgCK0HzdoO5R7WmAyDyf4dqug22N5K69CbW/Izj6GR
	LLlw==
X-Gm-Gg: AYBFou2znQnl9VYCMANroatogfl4NoXgWSUmvosPJ+OhvZAR3XpQdWPYCUITid3PPcq
	Ma5dlFsFaBiqN5BZn8Cl+P+JKsdheif72ZBFMQQ1XfnRCNQVVUhtX9nAhUutkwphZQQev2Jw8sH
	Jo4s6JB8Tjdr55WUgF33nYOguP0l6CTJbulHwatFmOMNUCH0r5jjAJIedsaadpAQN3KMKhlarVU
	nQ3rbyr1rmPuonXxoTDcCfBvqVFPOi6tgoxoz/IfnWTjblgmRbtV+yzblucHfiWQ7c3o1YNbUyO
	3xaF9Ltw0fdTG+KdgDvUIXM9nJHo/MyVyk4KyqMD04Q94tkq5E+GGr5xGU0NjN1U/fV3+eLnJmP
	TPQSsijwQ4kRzLg==
X-Received: by 2002:a05:6102:b13:b0:786:a11e:484d with SMTP id ada2fe7eead31-79b4d3cd906mr1003607137.6.1789396032463;
        Mon, 14 Sep 2026 07:27:12 -0700 (PDT)
X-Received: by 2002:a05:6102:b13:b0:786:a11e:484d with SMTP id ada2fe7eead31-79b4d3cd906mr1003568137.6.1789396031760;
        Mon, 14 Sep 2026 07:27:11 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2985dsm678959415e9.6.2026.09.14.07.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:27:10 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:27:09 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        richardcochran@gmail.com, rayagond@vayavyalabs.com, treding@nvidia.com,
        linux@armlinux.org.uk, qiangqing.zhang@nxp.com, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v4] net: stmmac: propagate PTP init failures in
 __stmmac_open() and stmmac_resume()
Message-ID: <aqgEPems3l1zOvf2@lore-desk>
References: <20260913-stmmac-ptp-error-propagate-v4-1-a947aceac928@oss.qualcomm.com>
 <178937485371.22033.14951761320111266794@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GfXrRmG2N/CD0xPe"
Content-Disposition: inline
In-Reply-To: <178937485371.22033.14951761320111266794@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwNyBTYWx0ZWRfX9fa17pffd6P7
 OB1Y6o2xNPMY7W9gqutCWRcUjPQQmuwvmx4n02QmBHRSqLfZzUpW0s78943NoqL8oWJ+mRSs5a/
 KLwFiAfT1kvLhzmVdVpvSVw5ouvjH/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwNyBTYWx0ZWRfXw9AzVIOqtr1Z
 PM0rDq44yFPBxY/MY8KqNDDqTssvqmxa94niNEdvNVPTziaH+9DK95KO21XE4HDt6pl8rTGg7Lh
 HFCKa2Xy7xfMl5rjwGWYvPAZVYZ03pipCWw+UcuxshgbF8hInBsNnlZ6eC50GU7KCDVw2ceNlvX
 8rY8ygcUrIiuWbA/dd1I9mxlgf/zMJ5PxMMTF6kZfC/klcDL/aD4sUmI/GQ3Cq4ZU7epsIJ7HU3
 w/0iheGFZZLH8imHQtdtOYQvZPR+WNvacb+k6gJ7E1YoBEEElF5lKlsOBiTFl1SidHtQaI7glR+
 UDGL/5hakk38NhNsI8XxeI/VUiTKmnGRAuvNJSJ0r09CwVW6Y90534TdNKaE35zMZn9KRiwUGf/
 +1aQ2MIO6csQ8YUl8s6lyHR+fVMY89/zoSDneHAXfXbRBWQhuee+K9bv3ls2m+ksz3ql1uzmCsO
 /Agy1oqypghKL1b6VlA==
X-Proofpoint-GUID: 2fVGFA1Pjby6xPiz1eBo18ARkLA_KAB0
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa80441 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=M5u55ggWcs1IBBEdvW0A:9 a=QEXdDO2ut3YA:10
 a=PamM1jCGBwhPM0J5wQsA:9 a=gYDTvv6II1OnSo0itH1n:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: 2fVGFA1Pjby6xPiz1eBo18ARkLA_KAB0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_072715_638216_28B2B623 
X-CRM114-Status: GOOD (  41.94  )
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

--GfXrRmG2N/CD0xPe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider:
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 3 (3) =C2=B7 Low: 2
>=20
> - [Medium] stmmac_setup_ptp()
>   (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:940) now gates the=
=E2=80=A6
> - [Medium] The patch unifies two of the three hardware-timestamping ABI
>   gates on stmmac_check_timestamp_cap() ((dma_cap.time_stamp ||=E2=80=A6
> - [Medium] In stmmac_resume(), when the newly propagated
>   stmmac_init_timestamping() failure is taken (stmmac_main.c:8371-8375=E2=
=80=A6
> - [Low] The commit message claims that after applying
>   stmmac_check_timestamp_cap() to the hwtstamp get path and the ethtool=
=E2=80=A6
> - [Low] The kernel-doc of stmmac_init_timestamping()
>   (stmmac_main.c:889-895) still reads 'Description: this is to verify if=
=E2=80=A6

I will fix the above issues in v5.

Regards,
Lorenzo

>=20
> Pre-existing issues:
> - [Medium] stmmac_get_ts_info() (stmmac_ethtool.c:1010-1019) sets
>   info->phc_index =3D 0 when priv->ptp_clock is NULL while still=E2=80=A6
> - [Medium] stmmac_change_mtu() (stmmac_main.c:6181-6199) tears the
>   running interface down with __stmmac_release() and then calls=E2=80=A6
> - [Medium] priv->ptp_enabled is used as the single ownership token for
>   the clk_ptp_ref prepare/enable reference, but the platform noirq PM=E2=
=80=A6
>=20
> --
>=20
> net: stmmac: propagate PTP init failures in __stmmac_open() and stmmac_re=
sume()
>=20
> stmmac_setup_ptp() now returns an error code so that the PTP reference cl=
ock
> enable and stmmac_init_timestamping() failures are propagated by
> __stmmac_open() and stmmac_resume(), which stop the DMA engines and disab=
le
> the MAC on failure.  A new stmmac_check_timestamp_cap() helper folds the
> hardware timestamping capability and a non-zero PTP reference clock rate
> into one test used by the hwtstamp get path, the ethtool ts_info path and
> the devlink registration.  The platform noirq PM callbacks gate the
> clk_ptp_ref enable/disable on the new priv->ptp_enabled flag.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net=
/ethernet/stmicro/stmmac/stmmac.h
> > index 7582fca637419..c781cf3441fc3 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>=20
> [ ... ]
>=20
> > @@ -419,6 +421,17 @@ int stmmac_set_clk_tx_rate(void *bsp_priv, struct =
clk *clk_tx_i,
> > =20
> >  struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev);
> > =20
> > +static inline bool stmmac_check_timestamp_cap(struct stmmac_priv *priv)
> > +{
> > +	if (!priv->dma_cap.time_stamp && !priv->dma_cap.atime_stamp)
> > +		return false;
> > +
> > +	if (!priv->plat->clk_ptp_rate)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> >  static inline bool stmmac_xdp_is_enabled(struct stmmac_priv *priv)
> >  {
> >  	return !!priv->xdp_prog;
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/dri=
vers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > index 154cc0c7623da..7758b854700a3 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > @@ -1007,8 +1007,7 @@ static int stmmac_get_ts_info(struct net_device *=
dev,
> >  {
> >  	struct stmmac_priv *priv =3D netdev_priv(dev);
> > =20
> > -	if ((priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp)) {
> > -
> > +	if (stmmac_check_timestamp_cap(priv)) {
> >  		info->so_timestamping =3D SOF_TIMESTAMPING_TX_SOFTWARE |
> >  					SOF_TIMESTAMPING_TX_HARDWARE |
> >  					SOF_TIMESTAMPING_RX_HARDWARE |
>=20
> [Severity: Low]
>=20
> The commit message says that after applying the helper to the hwtstamp get
> path and the ethtool ts_info path, "so all of them consistently report
> -EOPNOTSUPP when timestamping is not usable".
>=20
> Does the ethtool path do that?  When stmmac_check_timestamp_cap() is fals=
e,
> stmmac_get_ts_info() takes the else branch and calls
> ethtool_op_get_ts_info(), which succeeds:
>=20
> net/ethtool/ioctl.c:ethtool_op_get_ts_info() {
> 	info->so_timestamping =3D
> 		SOF_TIMESTAMPING_TX_SOFTWARE |
> 		SOF_TIMESTAMPING_RX_SOFTWARE |
> 		SOF_TIMESTAMPING_SOFTWARE;
> 	info->phc_index =3D -1;
> 	return 0;
> }
>=20
> So ethtool -T returns 0 with software-only capabilities rather than
> -EOPNOTSUPP.  Could that sentence be adjusted?
>=20
> [Severity: Medium]
>=20
> This isn't a bug introduced by this patch, but while the gate here is bei=
ng
> narrowed, the phc_index assignment just below it still reports a valid in=
dex
> when no PTP clock exists:
>=20
> 		if (priv->ptp_clock)
> 			info->phc_index =3D ptp_clock_index(priv->ptp_clock);
> 		else
> 			info->phc_index =3D 0;
>=20
> The ethtool convention for "no associated PHC" is -1, as
> ethtool_op_get_ts_info() does.  Index 0 points userspace at some other
> device's PTP clock.
>=20
> This branch is reachable before the first ifup, since the gate is a pure
> capability plus clk_ptp_rate test independent of PTP registration, and al=
so
> after ptp_clock_register() fails, where stmmac_ptp_register() leaves
> priv->ptp_clock NULL.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 62c3441911e71..9d2c6bf68575f 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -653,7 +653,8 @@ static int stmmac_hwtstamp_set(struct net_device *d=
ev,
> >  	u32 ts_master_en =3D 0;
> >  	u32 ts_event_en =3D 0;
> > =20
> > -	if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
> > +	if (!priv->plat->clk_ptp_rate ||
> > +	    !(priv->dma_cap.time_stamp || priv->adv_ts)) {
> >  		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping");
> >  		priv->hwts_tx_en =3D 0;
> >  		priv->hwts_rx_en =3D 0;
>=20
> [Severity: Medium]
>=20
> Is the remaining divergence between this predicate and
> stmmac_check_timestamp_cap() intended?  The set path tests priv->adv_ts,
> while the get and ethtool paths now test priv->dma_cap.atime_stamp.
>=20
> priv->adv_ts is not a capability bit, it is derived in
> stmmac_init_timestamping():
>=20
> 	priv->adv_ts =3D 0;
> 	if (xmac && priv->dma_cap.atime_stamp)
> 		priv->adv_ts =3D 1;
> 	else if (priv->extend_desc && priv->dma_cap.atime_stamp)
> 		priv->adv_ts =3D 1;
>=20
> On a non-xmac core that reports atime_stamp=3D1 with time_stamp=3D0 and r=
uns
> without extended descriptors, adv_ts stays 0, so ethtool -T and
> SIOCGHWTSTAMP advertise hardware timestamping while SIOCSHWTSTAMP returns
> -EOPNOTSUPP with "No support for HW time stamping".
>=20
> adv_ts is also only assigned once PTP setup has run, so this gate answers
> differently before and after the first ifup, whereas the other two are
> static.
>=20
> Does that fit the commit message claim that "all of them consistently
> report -EOPNOTSUPP when timestamping is not usable"?

I think this is just a small inaccuracy in the commit message I can fix if I
need to repost.

>=20
> > @@ -843,7 +844,7 @@ static int stmmac_hwtstamp_get(struct net_device *d=
ev,
> >  {
> >  	struct stmmac_priv *priv =3D netdev_priv(dev);
> > =20
> > -	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
> > +	if (!stmmac_check_timestamp_cap(priv))
> >  		return -EOPNOTSUPP;
> > =20
> >  	*config =3D priv->tstamp_config;
> > @@ -900,11 +901,6 @@ static int stmmac_init_timestamping(struct stmmac_=
priv *priv)
> >  	if (priv->plat->ptp_clk_freq_config)
> >  		priv->plat->ptp_clk_freq_config(priv);
> > =20
> > -	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp)) {
> > -		netdev_info(priv->dev, "PTP not supported by HW\n");
> > -		return -EOPNOTSUPP;
> > -	}
> > -
> >  	ret =3D stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE |
> >  					       PTP_TCR_TSCFUPDT);
> >  	if (ret) {
>=20
> [Severity: Low]
>=20
> With the capability check removed here, should the kernel-doc directly ab=
ove
> stmmac_init_timestamping() be refreshed as well?  It still reads:
>=20
> /**
>  * stmmac_init_timestamping - initialise timestamping
>  * @priv: driver private structure
>  * Description: this is to verify if the HW supports the PTPv1 or PTPv2.
>  * This is done by looking at the HW cap. register.
>  * This function also registers the ptp driver.
>  */
>=20
> Both statements now belong to stmmac_setup_ptp(), which holds the
> stmmac_check_timestamp_cap() test and the stmmac_ptp_register() call.  Th=
is
> matters for readers of stmmac_resume(), which calls
> stmmac_init_timestamping() directly under the new priv->ptp_enabled gate.
>=20
> > @@ -937,24 +933,43 @@ static int stmmac_init_timestamping(struct stmmac=
_priv *priv)
> >  	return 0;
> >  }
> > =20
> > -static void stmmac_setup_ptp(struct stmmac_priv *priv)
> > +static int stmmac_setup_ptp(struct stmmac_priv *priv)
> >  {
> >  	int ret;
> > =20
> > +	if (!stmmac_check_timestamp_cap(priv)) {
> > +		netdev_info(priv->dev, "PTP not supported\n");
> > +		return 0;
> > +	}
> > +
>=20
> [Severity: Medium]
>=20
> Can this early return permanently disable PTP on platforms whose PTP rate=
 is
> programmed by the very code the gate skips?
>=20
> stmmac_check_timestamp_cap() returns false when priv->plat->clk_ptp_rate =
is
> zero, but the only run-time writer of that field is
> plat->ptp_clk_freq_config(), which runs downstream in
> stmmac_init_timestamping():
>=20
> 	if (priv->plat->ptp_clk_freq_config)
> 		priv->plat->ptp_clk_freq_config(priv);
>=20
> On dwmac-qcom-ethqos that callback is what establishes the rate:
>=20
> dwmac-qcom-ethqos.c:ethqos_ptp_clk_freq_config() {
> 	err =3D clk_set_rate(plat_dat->clk_ptp_ref, ULONG_MAX);
> 	if (err)
> 		netdev_err(priv->dev, "Failed to max out clk_ptp_ref: %d\n", err);
> 	plat_dat->clk_ptp_rate =3D clk_get_rate(plat_dat->clk_ptp_ref);
> }
>=20
> The value the gate samples comes from probe time:
>=20
> stmmac_platform.c:stmmac_probe_config_dt() {
> 		plat->clk_ptp_rate =3D clk_get_rate(plat->clk_ptp_ref);
> }
>=20
> If that probe-time read is zero, the pre-patch flow still recovered: the =
ref
> clock was enabled unconditionally, ptp_clk_freq_config() programmed the r=
ate,
> and the !clk_ptp_rate check in stmmac_init_tstamp_counter() then passed.
> With this gate, clk_ptp_ref is never enabled, stmmac_init_tstamp_counter()
> and stmmac_ptp_register() never run, priv->ptp_enabled stays false so
> stmmac_resume() skips timestamping too, and hwtstamp get plus ethtool -T
> report no hardware timestamping.  Nothing is surfaced because
> stmmac_setup_ptp() returns 0.
>=20
> Would it be safer to evaluate clk_ptp_rate only after
> plat->ptp_clk_freq_config() has had a chance to program it?
>=20
> >  	ret =3D clk_prepare_enable(priv->plat->clk_ptp_ref);
> > -	if (ret < 0)
> > +	if (ret < 0) {
> >  		netdev_warn(priv->dev,
> >  			    "failed to enable PTP reference clock: %pe\n",
> >  			    ERR_PTR(ret));
> > +		return ret;
> > +	}
> > =20
> > -	if (stmmac_init_timestamping(priv) =3D=3D 0)
> > -		stmmac_ptp_register(priv);
> > +	ret =3D stmmac_init_timestamping(priv);
> > +	if (ret) {
> > +		clk_disable_unprepare(priv->plat->clk_ptp_ref);
> > +		return ret;
> > +	}
> > +
> > +	stmmac_ptp_register(priv);
> > +	priv->ptp_enabled =3D true;
> > +
> > +	return 0;
> >  }
> > =20
> >  static void stmmac_release_ptp(struct stmmac_priv *priv)
> >  {
> > +	if (!priv->ptp_enabled)
> > +		return;
> > +
> >  	stmmac_ptp_unregister(priv);
> >  	clk_disable_unprepare(priv->plat->clk_ptp_ref);
> > +	priv->ptp_enabled =3D false;
> >  }
> > =20
> >  static void stmmac_legacy_serdes_power_down(struct stmmac_priv *priv)
> > @@ -4161,10 +4176,12 @@ static int __stmmac_open(struct net_device *dev,
> >  	ret =3D stmmac_hw_setup(dev);
> >  	if (ret < 0) {
> >  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
> > -		goto init_error;
> > +		return ret;
> >  	}
> > =20
> > -	stmmac_setup_ptp(priv);
> > +	ret =3D stmmac_setup_ptp(priv);
> > +	if (ret)
> > +		goto ptp_error;
> > =20
> >  	stmmac_init_coalesce(priv);
> > =20
> > @@ -4189,7 +4206,10 @@ static int __stmmac_open(struct net_device *dev,
> >  		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
> > =20
> >  	stmmac_release_ptp(priv);
> > -init_error:
> > +ptp_error:
> > +	stmmac_stop_all_dma(priv);
> > +	stmmac_mac_set(priv, priv->ioaddr, false);
> > +
> >  	return ret;
> >  }
>=20
> [Severity: Medium]
>=20
> This is a pre-existing issue, not introduced by this patch, but the new P=
TP
> failure branch adds another way of reaching it.  stmmac_change_mtu() tears
> the live interface down and reopens it:
>=20
> stmmac_main.c:stmmac_change_mtu() {
> 		__stmmac_release(dev);
>=20
> 		ret =3D __stmmac_open(dev, dma_conf);
> 		if (ret) {
> 			free_dma_desc_resources(priv, dma_conf);
> 			kfree(dma_conf);
> 			netdev_err(priv->dev, "failed reopening the interface after MTU change=
\n");
> 			return ret;
> 		}
> }
>=20
> There is no rollback to the previous configuration and no transition out =
of
> the running state, so netif_running() stays true while queues, IRQs,
> descriptors, phylink, MAC and DMA are all down.  In the baseline this was
> already reachable via the stmmac_hw_setup() and stmmac_request_irq()
> failures; after this change a clk_prepare_enable(clk_ptp_ref) or
> stmmac_init_timestamping() failure during an MTU change can put the
> interface in the same state.
>=20
> [ ... ]
>=20
> > @@ -8346,13 +8365,14 @@ int stmmac_resume(struct device *dev)
> >  	ret =3D stmmac_hw_setup(ndev);
> >  	if (ret < 0) {
> >  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
> > -		stmmac_legacy_serdes_power_down(priv);
> > -		mutex_unlock(&priv->lock);
> > -		rtnl_unlock();
> > -		return ret;
> > +		goto error_unlock;
> >  	}
> > =20
> > -	stmmac_init_timestamping(priv);
> > +	if (priv->ptp_enabled) {
> > +		ret =3D stmmac_init_timestamping(priv);
> > +		if (ret)
> > +			goto error_stop_dma;
> > +	}
>=20
> [Severity: Medium]
>=20
> Should this failure path also drop the PTP-side state?  The open path is =
now
> consistent, since a stmmac_setup_ptp() failure leaves priv->ptp_enabled
> false with no PHC registered, but the resume path is not.
>=20
> On the goto error_stop_dma path, priv->ptp_enabled stays true, the PTP cl=
ock
> stays registered, and priv->systime_flags, sub_second_inc, default_addend=
 and
> tstamp_config still describe the pre-suspend hardware state that the DMA
> software reset in stmmac_hw_setup() has just cleared.  ethtool ts_info,
> SIOCGHWTSTAMP and /dev/ptpN then keep advertising working hardware
> timestamping over a non-running counter.
>=20
> That looks like the exact divergence the commit message describes: "the M=
AC
> system time counter is left in its post-reset, non-running state, while t=
he
> driver keeps operating as if timestamping were up", including the EST base
> time derived from a non-advancing counter.
>=20
> One way to reach it is stmmac_init_tstamp_counter() failing on its
> !plat->clk_ptp_rate check after plat->ptp_clk_freq_config() re-reads a ze=
ro
> rate during resume.
>=20
> > =20
> >  	stmmac_init_coalesce(priv);
> >  	phylink_rx_clk_stop_block(priv->phylink);
> > @@ -8376,6 +8396,16 @@ int stmmac_resume(struct device *dev)
> >  	netif_device_attach(ndev);
> > =20
> >  	return 0;
> > +
> > +error_stop_dma:
> > +	stmmac_stop_all_dma(priv);
> > +	stmmac_mac_set(priv, priv->ioaddr, false);
> > +error_unlock:
> > +	stmmac_legacy_serdes_power_down(priv);
> > +	mutex_unlock(&priv->lock);
> > +	rtnl_unlock();
> > +
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(stmmac_resume);
> > =20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/dr=
ivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index 6128ed1bd521a..19d4815544990 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -959,7 +959,8 @@ static int __maybe_unused stmmac_pltfr_noirq_suspen=
d(struct device *dev)
> > =20
> >  	if (!priv->wolopts) {
> >  		/* Disable clock in case of PWM is off */
> > -		clk_disable_unprepare(priv->plat->clk_ptp_ref);
> > +		if (priv->ptp_enabled)
> > +			clk_disable_unprepare(priv->plat->clk_ptp_ref);
> > =20
> >  		ret =3D pm_runtime_force_suspend(dev);
> >  		if (ret)
> > @@ -984,6 +985,9 @@ static int __maybe_unused stmmac_pltfr_noirq_resume=
(struct device *dev)
> >  		if (ret)
> >  			return ret;
> > =20
> > +		if (!priv->ptp_enabled)
> > +			return 0;
> > +
> >  		ret =3D clk_prepare_enable(priv->plat->clk_ptp_ref);
> >  		if (ret < 0) {
> >  			netdev_warn(priv->dev,
>=20
> [Severity: Medium]
>=20
> This is a pre-existing imbalance rather than something this patch
> introduces, but since priv->ptp_enabled now becomes the ownership token f=
or
> the clk_ptp_ref reference, can the two error paths here leave it out of s=
ync
> with the reference actually held?
>=20
> In stmmac_pltfr_noirq_suspend(), the clock is dropped and then
> pm_runtime_force_suspend() may fail and return, so ptp_enabled stays true
> with no reference held, and the failing device is not resumed by
> dpm_resume_noirq().
>=20
> In stmmac_pltfr_noirq_resume(), a failing clk_prepare_enable() returns wh=
ile
> ptp_enabled is still true, and a failing resume_noirq does not abort the =
PM
> resume sequence.
>=20
> In both cases the next teardown drops a reference that was never acquired:
>=20
> stmmac_main.c:stmmac_release_ptp() {
> 	if (!priv->ptp_enabled)
> 		return;
>=20
> 	stmmac_ptp_unregister(priv);
> 	clk_disable_unprepare(priv->plat->clk_ptp_ref);
> }
>=20
> The same underflow existed in the baseline, where both callbacks and
> stmmac_release_ptp() touched clk_ptp_ref unconditionally, so the gate
> reproduces the old behaviour whenever ptp_enabled is true.  Would it be
> worth clearing or restoring the flag on these two error returns while the
> ownership rules are being written down?
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260913-stmmac-ptp-error-propagate-v4-1-a947aceac928%40oss.qualcomm.com

--GfXrRmG2N/CD0xPe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqgEPQAKCRA6cBh0uS2t
rJhhAQCWW/UaO/tz7OS8Gf3KrwU/Juy/v3TTHosE7yzPaNz/6AD/S22Mocr+xK2o
2H9XIwmpW4gUSFjuYcbjPy0T2l1nsgM=
=tojs
-----END PGP SIGNATURE-----

--GfXrRmG2N/CD0xPe--

