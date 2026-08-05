Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628F7C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 21:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RG0WLH7pq3V59v399MYANWSLbjIejx2QigpuxS590SA=; b=oDcO34lcTeMiku6euSAlAyEXvd
	ZNqTnd7GFllLFprXPnzZVlnK2waEqxdywaObSjU/0XuHOPfO88FNhNS79DqpxSh3UePRUxw0wV7i6
	unIQaA4pQcfASlJmD6Fe70qMxoH9iwnTNzG7eIpbTEitW4TSnt7kHwxfA7yAG50fxjHnTME+f276h
	J+JkHG3k68h0PIKnqA1Dx8ulGdR9NhHwM8OGcr0K03LNYlGiDZMBds/xcTzRFSrhyUmOqW5lA3o8w
	IMOC7Zngp7YjWPFV+vQ9rzf8TWHHdTV5r0uIIpttyGk1P7qBVuWonjGFQGzDpojrwvLf5NDPa6EJy
	ChytL9cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wri6l-00000004WNe-48AH;
	Wed, 05 Aug 2026 20:20:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wri6k-00000004WNB-2Dvf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 20:20:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HSTLu3327850
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Aug 2026 20:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RG0WLH7pq3V59v399MYANWSL
	bjIejx2QigpuxS590SA=; b=JrhKChn7GaJ9cg8X8QHx8HLV42LHq7wCGriAnfoq
	JRplin65Zyq9gccZPsDNfPgo0RKWNhZuvIGBTkgrb4bI1j8ibP3wb3OsrHO3BoSI
	kL4IoIH0XY55I+cLc+xlJB8/+7rpLI1K2+M2RT3rnzD4x8KZVolA/DtvhZm6MHZz
	0rMhYnB53iKKR7aeKTSABYrdqQ3VmzP5LwU4tJilwc1DW9ch67bxOsvb6qEMcYOb
	oNVXlRodpxmGGiX5Q0BHNfjX5XFh8Q1cpJq4NmgFz6/1EiO2JhRviELvXxNa0XiE
	MGEWtYns9L5df7rJGMEuJ7uV/T/jkVFG3qAE1in4uRKkkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv1qgb431-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 20:20:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ce64c41efso23387881cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 13:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785961255; x=1786566055; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RG0WLH7pq3V59v399MYANWSLbjIejx2QigpuxS590SA=;
        b=PAR1OrT0FUYzIsAt91zb92KsVxteUFVbLZfpjElVQgL//2YCwAz2OPwR8XbKFrYHIf
         c2y+g3pilunnNvAx1v3ipK0w3CC3DhKSPIdMKVoXIg8uCxNe/0vvvw8T2J3SEDSDn+Ln
         9FDQO3ArrnDkhOI90G7D1LnmH6LgiaG6o/q/3Yg3EOmgcn/neSxMO6ujBoZS+8Gl9y2m
         WU7nwdViqip/wzV/IwGBwYsoEUZAM+CUnokmG9rGNgHGXhaSSbuNFUQS7mOZCDM7s7Ru
         6aemnati8rpHfqn4M0WAKwyH7lDZLgd9c4Pi8dRJCBCuKQWs9TZSASIfDdcnreD3SHHH
         ZMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785961255; x=1786566055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RG0WLH7pq3V59v399MYANWSLbjIejx2QigpuxS590SA=;
        b=a83rTgPnevdDdugPxSQtIJUXUz7vctPBfVUNzATpWw967KZgXtmNvtzBn2Cv7vATd3
         x2J02R2TRjn1GHaB2jTMYYmyFKOCywbToNGDNxBcnSjw6bhDqSZGUBm/3GAUQRrCypSy
         3ZPtctWj5yxCB602XkJVpOrdxQTcjb2b8CMylnv7LxABTV6emBaRJUk4tFkCzgTI/IZS
         /EOudZoOtBHyza69sPwi1NLCeB/129zkWmN6Xev4kyh7gVorbvREuAxAe4B5JcNZpLSV
         aDqSlTyeBTtW7rXDepazrxe+2zw/818CjSbBlvyFnj73JFy1VSZqJ/CcThcwajjqNMpo
         QNrw==
X-Forwarded-Encrypted: i=1; AHgh+RrV1c/ikjJLaelW7NNFpGT9A/3kKkboMXT33g/R4Zls/VaRLclZyA4tQIc3yfVRES1vPdhIZuTiwx0PxHhsaZ8U@lists.infradead.org
X-Gm-Message-State: AOJu0YyzPqZfhaFkqU0MoBa/Iu0wFx7iMubHZBO2ekd8Ku6tGypbimDo
	QKGxpIHFa/uZ9pyfAyN5Cbq2MZS/+oO8c4iKne/Y4SPbf0O5n7MaV6GXLXLhXgYJfVJnKpyf9y2
	BQOe+Q1hL7NGqqEsxNXBRIuZjZPVOcs/mkG7+6zkeNYOzZkO2oKyvgu6YR6329i2Aws3dvmEkcd
	zwbg==
X-Gm-Gg: AR+sD13Q9EZyPz/jietlIGoeYEWNzbU3u0hbYas9VY3Ru/ugSB8VgYs1Al/COnN6GOJ
	Zji9ewz7oV9fmad0DOg/9u4L54aWc4u+EAXk2xRLpj3UQVvyDvkFEvpx6iZ952aUsMMDGVzPhnX
	xQ72Jt/3s4PxHAX/MCNjNn8lRdHhrwwUxYFK9NQXUUalEhgqU/dczwG8SRHuyi8NultxJ2xVgAP
	0/Ucwv7rBDYQxhVw3iYb9VZZBc1qjVqpVC9G1JTWOhIw4og7KYdFDVhH3epmBN2usTcwn7wjbpd
	aZNztCz59VZIU7mGvH/RT5diH7Yc4FiPK9XQuD8mqtLBfMKcswomK0asezWfIv+H7VoihMjhEet
	ja050r3YapWwsGQo=
X-Received: by 2002:a05:622a:551b:b0:52c:dde9:5cd5 with SMTP id d75a77b69052e-52ce6113b93mr110064691cf.21.1785961255296;
        Wed, 05 Aug 2026 13:20:55 -0700 (PDT)
X-Received: by 2002:a05:622a:551b:b0:52c:dde9:5cd5 with SMTP id d75a77b69052e-52ce6113b93mr110064091cf.21.1785961254865;
        Wed, 05 Aug 2026 13:20:54 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49954206d9dsm5850935e9.2.2026.08.05.13.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:20:54 -0700 (PDT)
Date: Wed, 5 Aug 2026 22:20:53 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Davide Caratti <dcaratti@redhat.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Daniel Thompson <daniel@riscstar.com>, Alex Elder <elder@riscstar.com>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: add tc-ets qdisc offload
Message-ID: <anObJdRfQcElQGFn@lore-qca>
References: <20260804-stmmac-ets-offload-v1-1-f3a09169d22b@oss.qualcomm.com>
 <anNzkcCXvOehhNcZ@dcaratti.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s2xrkkYUQ9YkXZPG"
Content-Disposition: inline
In-Reply-To: <anNzkcCXvOehhNcZ@dcaratti.users.ipa.redhat.com>
X-Authority-Analysis: v=2.4 cv=I+hVgtgg c=1 sm=1 tr=0 ts=6a739b29 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=peNN9GvJXgMoxCkY4pUA:9 a=CjuIK1q_8ugA:10 a=h9vEhtIbZdNCuo1-SvUA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: eXLh29BTyrB6uuHaMIKMxzDkzfR2XI0V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE2NiBTYWx0ZWRfX8Jhb5B+PZTU3
 O6a8I8wDvOgvKhYOzE2Gy0VWeWF2Q9U6jgtOXWvzxZZaWTkUMTqFsSxtfjg8w0uxNy09HhoE0D2
 /7c6M1qQVDs+O0GFzYi/lpult6Me/S+HfPwxcO8jO19Po0Tn2uX3jdloUXizqqaeDr5LkRY+TmY
 BDmR5lYJB0PIVl8P65xzNEC5cA3BPCdW3yLb+aouzHS5jaMsEAh3wXrefS588NUMwxcxUCS/98z
 /hykdl3OHhdEh+idlsBlXhmCA/dZYmc3w4siKHRHymVRfSDeL6cYU1c/f+ZWbBnkwY/+4S9Ycqh
 VrHc5kYbAbsTOwGJ353V9vCEbUInzbyOYQeUPY6/t2Pu1sTw14kyLcuisS0Unc/uHCzs5XUBuxH
 nRaCpxTI0mNSUvxRqq0AYgxwmgtgsg5ICx7iGnGzCBt29prVEhR1s97chO8uKj3Z+coEdNvdAd/
 zH8tQd+/rX3meoMP6kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE2NiBTYWx0ZWRfXxhXxMZroDXvA
 r+HO8ucVx6VHAprMbiSyiV7r4+skaZA/AtCxFyYgPUJUhoLOU9jD0yG0HiM2Az2U4vYy0icUR6K
 MLXMFSfnk9O+n832Pt7Liv6Yz6zMmgk=
X-Proofpoint-GUID: eXLh29BTyrB6uuHaMIKMxzDkzfR2XI0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_132058_596042_581B932C 
X-CRM114-Status: GOOD (  26.25  )
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

--s2xrkkYUQ9YkXZPG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, Aug 04, 2026 at 08:17:35PM +0200, Lorenzo Bianconi wrote:
>=20
> [...]
> =20
> > When all bands are strict priority, the MTL scheduler is programmed with
> > SP scheduling; otherwise the requested weights are applied to the TX
> > queues and the scheduler is switched to DWRR. The TC_ETS_STATS command
> > is accepted and handled.
> >=20
> > Export stmmac_set_tx_queue_weight() so the ETS path can reprogram queue
> > weights, and wire TC_SETUP_QDISC_ETS into stmmac_setup_tc().
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> hello Lorenzo, thanks for your patch!

Hi Davide,

>=20
> > ---
> > +static int tc_setup_ets_sched(struct stmmac_priv *priv,
> > +			      struct tc_ets_qopt_offload *qopt)
> > +{
> > +	struct tc_ets_qopt_offload_replace_params *p =3D &qopt->replace_param=
s;
> > +	struct plat_stmmacenet_data *pdata =3D priv->plat;
> > +	int i, nstrict =3D 0;
> > +
> > +	if (p->bands > priv->plat->tx_queues_to_use)
> > +		return -EOPNOTSUPP;
> > +
> > +	for (i =3D 0; i < p->bands; i++) {
> > +		if (!p->quanta[i])
> > +			nstrict++;
> > +	}
> > +
> > +	if (p->bands && nstrict)
> > +		return -EOPNOTSUPP;
> > +
> > +	if (nstrict) {
> > +		tc_setup_sp_sched(priv);
>=20
> From what I understood, this will fail configuring the strict priority ca=
se (the only one
> possible according to the commit message, where all bands have quanta equ=
al to 0). Maybe
> the if() statement should be done like:
>=20
>  if (nstrict && nstrict !=3D p->bands)
> 	return -EOPNOTSUPP;
>=20
> WDYT? thank you in advance!

ack, I agree. I will fix it in v2.

Regards,
Lorenzo

>=20
> --=20
> davide
>=20

--s2xrkkYUQ9YkXZPG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCanObJQAKCRA6cBh0uS2t
rHD6AP9XgYpCrXA9PFQnJ+qQc4QoT8kpSYf9vl3QSkxIMCjvKwD+Is5MIO3/7u+d
f+JCbvPCgJWfCbT0bcm+si0m9cLGQwY=
=538k
-----END PGP SIGNATURE-----

--s2xrkkYUQ9YkXZPG--

