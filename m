Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E261C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 21:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MrH8QKgsF8kmZ2e+B7i3zZCrWJpZ20RLQ1YKrlb37Q=; b=YYlro065FLZL2Ajh5qg+c+YKu2
	m7SPEY6BpQa8xgCU578xGVtAKoQrQ8D4aMNzkjcfdNfvVf5Vcwiif+onJwQvYRlQqgmedEdwLRxeT
	O4NtxfCdAUtEyQ6uth7xnuhV4LG9Y6ZOpo2fBDhtUJdaSiKVVWsIlNuBPkqq8th8wbZQBz45hbnFx
	G0VEktNxqPFymkFtRXj5N+M0NhxofffaObs5mqa4VMZgVpUpbM+cHkqoPU4CdinnFEvibu0QQYowL
	bn9myXzL/bP3hTpxocrNZPFrAEyYv/zDrNexOnOcKCVVrr7vAZ9ijZ2ABq2byzMYNj6/K/CprGB9L
	fKgzPgEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1sQi-0000000FvsE-07BC;
	Wed, 02 Sep 2026 21:23:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1sQf-0000000Fvrr-48hn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 21:23:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHARh1382952
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 21:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9MrH8QKgsF8kmZ2e+B7i3zZC
	rWJpZ20RLQ1YKrlb37Q=; b=fLEv42JCfR3lh67IATHlvY8tVbgtKtkFwR9OTIuX
	zJ8Qw+K+ztcKltPfTcBPTWD90zOkJwLM2ZCGu383Ahm2e7aSQB5r7e6wYCj2b9eG
	ffKGY8t67N23VXs4Op10NvI6yIKJy9+uHkGx3sNGEnaXspHcK2GdwIqc7Ok6ATC2
	hUyX2gVjim495EQWbo5v/X2S/1aAziCZ/29gjGMygWSgKgPh4FP6vEQbZ0nWPWlI
	WwkWWCnZMMZyiUVt8QKv7C7vk1arSK55DdrXAATigDwcGDFhNXVr4MTY92TPLK3V
	50uTw9+ZmGYg12mRljFzgLsUrCtPD0i7dhuq0J5Xf3Og2g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja25wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 21:23:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so315639285a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 14:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788384212; x=1788989012; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9MrH8QKgsF8kmZ2e+B7i3zZCrWJpZ20RLQ1YKrlb37Q=;
        b=SEb18qDZtRmMUfow/aD9+HH/wC+EQJADpF0aQlQsjKEdgxr8pEkkA54YcEI5AKimzN
         qvJwFIbfcfuu5KGxxZ4dQZJkqa8zFfAWefUlassbhXy0PAMj9WDwy8Kvq1lBEZkU16s5
         PhEbOwT5pDdjZ8gWOfn06/wgBiz//leSMtwaNYLK5HT8j0XpYyihn4ZgF4Mhc59a2SVb
         7qdAeeFywctfNQas/YUGc8tHEDLqMMVKoRSLzQYkJUA6N5D5gVA/K/KLwlXpIQYAUH1O
         Z2Qmv3VS7UUIjgSVEkDS2ywwsb5JWizhnko6GcEI6/QaXzKZJo3Y8M9fktlzUZtrzMzf
         HVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788384212; x=1788989012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MrH8QKgsF8kmZ2e+B7i3zZCrWJpZ20RLQ1YKrlb37Q=;
        b=jDLcg3QPrCS7ZbROThCw4qtfh9PTFXEljKoMNLJo2Zs4lvdz8kUy40zHbQnjZFqskW
         mOSDn0C2hgzUjlDUZBFsGmWBKhJb1yX3LbJ+j9VMoxT1izQCCI85faYks9womvVXetL5
         Ws2W5Q3RJQrWcByaaZQSQONhq1d+C2PlOve3AADW5ufWE3OkbYAL4/gzbE+7lw+xuIrH
         fd7qfXhjWEUhCh4U1EmTX6tm4C0fDRnkNrmDRtM0aubn1v1NXdNJb87onBhw7i0Yczwn
         HWD+44bwCUtJKDSk3RPQFHMRj91UQ8cPNxFW2xqZxmvVUz0DOAIkD2mOjVSeYqSBAeHr
         ZLRg==
X-Forwarded-Encrypted: i=1; AKwUvByDtbJRtbWRo7od4TACUxLLB+Viq/dwNHA4KcoVgdvncEYu9YLmDRIlQTTypHA9r7ZiCdamVLjsn6Aerej4BGK5@lists.infradead.org
X-Gm-Message-State: AFuF++nsMU2rDnaeIdEi8tQ7phusrP/dEw9X0pAD4FKRZRydaD843p2f
	oHEyeR3BvIuzeruk2gqz/Vn9QwAFockTlxy2o5kyBgCaW/vQTKaB+EDHQ3HbpQHVcZNK06byLQS
	4Qu9KRWj6Q3uXDSwplK0Fv3lL3NB8fanJfdYpI9oU5yr90ljUavOBWpzbZlW6HD2sh9CKpcv/j/
	il9w==
X-Gm-Gg: AYBFou2J7uSXwD2YnUltEEHcntcvUckH/hD/bdEQZ7i6LSs+Mg5mToDXMR8RbMYmZzr
	YCbNjjPoR017P/Ov6ip+ul4GglqxFH7pX1mTS07rX9Bh5qSciRqFasZnQZaEEFVOqnKHmulFxy1
	JlZUL0JZGNLZ3Qmw26xuU4yhnvLOG2dAdnLc0gK676GCSw9Im8hbT4qq0B8f74qPCsjjGcuG7sd
	zZTXSkxvtFD1cVJvKATCU6rCmK+HEEt94LJmDrEIQLGC185T0XpxhuSwu4xgJrIjtxn8G5ZpSGT
	GGbwWcDJsW4a7xAoR1zyND8C/V3QpQddrA8D6XzCFHCG0CQeq1MBgrNK/xREi8japWEC4KBpPS7
	koX7fg5I+h1cEZA==
X-Received: by 2002:a05:620a:2ad5:b0:939:6de9:4cfe with SMTP id af79cd13be357-9396de96eacmr191074485a.44.1788384212174;
        Wed, 02 Sep 2026 14:23:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2ad5:b0:939:6de9:4cfe with SMTP id af79cd13be357-9396de96eacmr191069585a.44.1788384211624;
        Wed, 02 Sep 2026 14:23:31 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm18104975e9.10.2026.09.02.14.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:23:29 -0700 (PDT)
Date: Wed, 2 Sep 2026 23:23:29 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>,
        Thierry Reding <treding@nvidia.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net v3 1/4] net: stmmac: propagate PTP init failures in
 stmmac_setup_ptp()
Message-ID: <apiT0ZrlBMF2k8qz@lore-desk>
References: <20260902-stmmac-est-reapply-after-open-v3-0-e72a6df5a7ef@oss.qualcomm.com>
 <20260902-stmmac-est-reapply-after-open-v3-1-e72a6df5a7ef@oss.qualcomm.com>
 <1010cb80-d9c9-4891-a719-8d7ca31c732a@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jVxPv4b2vhp6+CCe"
Content-Disposition: inline
In-Reply-To: <1010cb80-d9c9-4891-a719-8d7ca31c732a@bootlin.com>
X-Proofpoint-GUID: GMnTlygBQbsw6d-DjV51oNhDrtPMiVCi
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a9893d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yiiVG1sZxxzmvLrpgBAA:9 a=CjuIK1q_8ugA:10 a=xvJVbJRMoKIfBHf13kYA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4OSBTYWx0ZWRfX6AyX6VmAmT7G
 xC4UTMFNXrrAfe8JFMu8mgLE9PWBjdM8mjaGCRZjBexIagB6X9M8hNcjmZho3os+2g3bqKx1DzD
 SaB44wxQV2C2OjxhSCJ7FQowWhPiKSc=
X-Proofpoint-ORIG-GUID: GMnTlygBQbsw6d-DjV51oNhDrtPMiVCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4OSBTYWx0ZWRfX8/5tBi8ySwml
 zqUszXxpjyTOBCxYEMCwadQfICdd6GRq1pElb8Mgy2lUWPsqhOor84i/Z13mJhSe5NpiAILS3D0
 +a41HgyF9I/61M9mzyZz8bdFCNdvU7pieapI+sHOQ++lt53/pJHfMP+6C8E0CbVuq8bmWznv6mW
 Kc1+Q0Bivr76P/B5HN+u6eS4XcNMVVVR5wj5BwLPB89ekPQVizcY/c4bsUhVah+BT6LOt+Y1JSD
 Zbf1vEpqr9rLFm8KMb6oSsaCySdMHALs89whFIpR5FHjJx/vMLwrbS5gvw1vuhogx/SwC7RALAa
 sw+rxrP3lIs6VfhC9hNMC4XllcZnCXJ57yhd6dWYaqoXwnjQSlkkNea4th0LENGtMaY4L2GSkIH
 naTCggmGvsPUdT84TfLmJVPqM7ui4CrfxmJBR09sJcCYrXbpCE2fk7YHhHHjws1nuRQYQ6J35mV
 eU6972qCCd9ugN6yYcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_142334_038736_C33CA198 
X-CRM114-Status: GOOD (  30.95  )
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

--jVxPv4b2vhp6+CCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi,

Hi Maxime,

thx for the review.

>=20
> On 9/2/26 22:15, Lorenzo Bianconi wrote:
> > stmmac_setup_ptp() returns void and swallows both PTP setup errors:
> > the PTP reference clock enable and stmmac_init_timestamping()
> > failures are logged but never propagated. When they fail, the MAC
> > system time counter is left in its post-reset, non-running state,
> > while the driver keeps operating as if timestamping were up.
> > This matters for the upcoming taprio offload re-apply, which derives
> > the EST base time from the hardware timestamp counter: arming the
> > gate list against a non-advancing time base would leave the schedule
> > permanently stuck. Make stmmac_setup_ptp() return an error code.
> >=20
> > Fixes: 92ba6888510c ("stmmac: add the support for PTP hw clock driver")
> > Fixes: 0ad2be79f254 ("net: stmmac: Balance PTP reference clock enable/d=
isable")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> nice fix, this isn't the first time we have issues because ptp init silen=
tly
> failed :(
>=20
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 46 +++++++++++++++=
+-------
> >  1 file changed, 33 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index d576059c04df..47295845371a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -937,18 +937,27 @@ static int stmmac_init_timestamping(struct stmmac=
_priv *priv)
> >  	return 0;
> >  }
> > =20
> > -static void stmmac_setup_ptp(struct stmmac_priv *priv)
> > +static int stmmac_setup_ptp(struct stmmac_priv *priv)
> >  {
> >  	int ret;
> > =20
> >  	ret =3D clk_prepare_enable(priv->plat->clk_ptp_ref);
> > -	if (ret < 0)
> > +	if (ret < 0) {
> >  		netdev_warn(priv->dev,
> >  			    "failed to enable PTP reference clock: %pe\n",
> >  			    ERR_PTR(ret));
> > +		return ret;
> > +	}
> > +
> > +	ret =3D stmmac_init_timestamping(priv);
> > +	if (ret) {
> > +		clk_disable_unprepare(priv->plat->clk_ptp_ref);
> > +		return ret;
> > +	}
>=20
> This can legitimately fail with -EOPNOTSUPP, we musn't failt the whole op=
en
> sequence in this case.

ops, right. I guess we should just skip -EOPNOTSUPP in this case, or do you
prefer to always not report the error from stmmac_init_timestamping()?

Regards,
Lorenzo

>=20
> Maxime
>=20

--jVxPv4b2vhp6+CCe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapiT0QAKCRA6cBh0uS2t
rAmrAQCvacwj+zCM1Or7FiHydec40FqES0Raq6bMj/X6600SfgEArHws+K9GA4SU
omKFxFomH4QsNyP2HTqaW4nH4JTC4Q0=
=ke07
-----END PGP SIGNATURE-----

--jVxPv4b2vhp6+CCe--

