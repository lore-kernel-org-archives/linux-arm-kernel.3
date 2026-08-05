Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A50AC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 20:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LZuDa/NBmLZez6CPV0BSelskEx0FfB09wzrO8qwC5Q=; b=UxZ1TqA1nhBNwXb7OEu2pIRF+x
	R65QPL8IOpcqpfK7lO8BtLpqjopsu89g7c8xLQX7ryBLo1irPDEOrCS/uKXExZMKHMLq5wtymo4RZ
	9swWhPcKrlcBWvvJtRED8d3ixTYMhMD6Sl0MOUEyhC0n44bikerr3sPPhNLXSPSJB4qvfT4tFCR/W
	3yn1Zo9zrjWEMJEIbHbsg2ChVI+3UpOZJ9/8XMAbVDP3j24b5HMMXwQTZGBrNnckVP0bYcv7oBQde
	qN5sMWaFcMqm59L1wdntE1uBQdNcdt7yE8kfdrx3NYG6iY3eGwRmhuJvx+86wvgtlM+w289bPBM3C
	D0whOiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wriPU-00000004XJT-3pCz;
	Wed, 05 Aug 2026 20:40:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wriPS-00000004XIw-1fGB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 20:40:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HSC203888726
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Aug 2026 20:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5LZuDa/NBmLZez6CPV0BSels
	kEx0FfB09wzrO8qwC5Q=; b=aDSLw7HPQn+240k6hE37hqqjTT+GY/ZhUHnrSr80
	ABYts9WsyXAw9M0QuRLpRJ5cra2uoz2KbpM8CNfZttNlpr24/u4gQiCFSVd1vOzP
	snoWfB6c8FTuz/ZIfXHYOjFT2N56tHJrHHFoeVxQGWVn8TdOhWItE9wyUR01Latw
	g0wFItOGcESe3emO8ypP6hdjBaVThtM1lem/EEzRH0vbp1pWpiANBtZJoGeSRHTU
	q5Ay2zU2VGOkBMkcfR+wsE11aT1OPmUIZgJ8KOjBZpU/Aj0griG7JXxN8PUE0ZjT
	KbphGuSFvrzcCgWpn1ca/5Vo4qonLFVo4DxHrHNBJE+/Fw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5t1cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 20:40:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso2412641cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 13:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785962414; x=1786567214; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5LZuDa/NBmLZez6CPV0BSelskEx0FfB09wzrO8qwC5Q=;
        b=NRPDHAsYF21Z1j823hE3i2i+qFDm3NJbkm3RImVSXzbkajt8P93Hmr3F4L3dmo0UZq
         yGqis9h/BN4+TAhYO1EMRyZEXZYblIWO88yy1Zu3OUWQ8+YxbgYUx5SMXVLRT7cKBOpU
         w6+RKAR3d+qOvy//w/zmcEM75HMVhEFS2qzyLnTVinden4npeXS9L+mTQAY35WQJ2bha
         6sxdlpI6M7svQEZzkZvA1yyO8F+C3x5BgdDdw7dK/RvvdQa/hE8QmFowUPhDHG7NgIBe
         pjokYS4jV09esjl5LTngh4Sz9thjExSYoNvMUW3bU/DgUojoUqO+Yo5euoY5eYh7bbmM
         XaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785962414; x=1786567214;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LZuDa/NBmLZez6CPV0BSelskEx0FfB09wzrO8qwC5Q=;
        b=cPQKXcsQzEcj5HbT817AOd52SejlgW/K9SiAgjRsleUtQxqVN9tIKmrupKfhX1+Pq/
         guJoTFkmgxCC1a7MbewGJbRwK2vKu2LGu+29Y6FixDh5tu9soGEUVNNCwqdDVefvB75b
         aUT1kuPhadjiuvUZmZDZf9W05+avNGvHUgiaMEdIOp9Ssc7jQhdoPe1Qt8sgElISzuPt
         Nq8oOUmcfQHB1DZlg7LL8drvH+SLRq7/73gz9llh+YhcOZrNCi9d6r8ZeFSm3ohm3mMx
         xK5cykOzdTO0vNMIJjB0+FSQTwwqQrhu3oYYa9UQ5qTCiIQ6YjO4LHMBQiFZDiJt1Sty
         LckA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0TRcGwQMzSItkqolyfqmgOIDnhbLPwjPHKEoJ7egHsqd5XdqCVPQJu3p+APPplemmLnVYvvTzzNVsBmwMdej3@lists.infradead.org
X-Gm-Message-State: AOJu0YxPULEtimhfVpyTlnTlROiF+6mo9bHc6p1Eih8fxxC6upnFiqZr
	n1I/CGbAwr/N0NIinwewcR4SisyNsO85NbMCoa0lVMdcPIjMhC1lU4t/4aOcQf2EXuG9l37kUNe
	XoTHJNHpUFJQv8GMwSYXmHWlIommc6ew1t8o+ZOfzdgQNvWm78GH64a+IIt38NWamNugZXIZiaz
	JITzy2jdwkfA==
X-Gm-Gg: AR+sD13lK7iw3EIyKwCZzKUEK+OLTiID9693kAvPv4p3qr3zLGH9+RREiSd8Od2CFWM
	Iz8N3tKbL+3PB/iJxoQp51WvQzBgJxiGfon9ESfeLJRJkeulSsQ7Sl1oPlEdUUEWGaGJPteRJTU
	ESP1nVRyEjdW6JW1Io+ThEM6rm+c1irZfJxanrbRMKZvE4JsWg30m3bImbOINyUg4EF2EgbdxRU
	NPZz5E6340FbYGci1DIuf3PZcCCB1WrfokkQr3H1m98ElEvnZhTPFzPap4cbBmd76lWiQ5VsrR0
	ezL7vaHI96u88rJqdFgemjxB1gAC4NbmqcgGXxTNLSGM/1pPn/FOt2/hc54IWlfDxuGF0alRxQu
	VxSCDAZvIaa/2Y7A=
X-Received: by 2002:a05:622a:5145:b0:517:c65c:4987 with SMTP id d75a77b69052e-52cfb0a9111mr22805481cf.22.1785962414441;
        Wed, 05 Aug 2026 13:40:14 -0700 (PDT)
X-Received: by 2002:a05:622a:5145:b0:517:c65c:4987 with SMTP id d75a77b69052e-52cfb0a9111mr22804911cf.22.1785962413964;
        Wed, 05 Aug 2026 13:40:13 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b31975sm97158f8f.33.2026.08.05.13.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:40:13 -0700 (PDT)
Date: Wed, 5 Aug 2026 22:40:12 +0200
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
Message-ID: <anOfrP0IZPYnfzE3@lore-qca>
References: <20260804-stmmac-ets-offload-v1-1-f3a09169d22b@oss.qualcomm.com>
 <anN6sHZt47dRZeaE@dcaratti.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DmZsoeZb2q28/CCl"
Content-Disposition: inline
In-Reply-To: <anN6sHZt47dRZeaE@dcaratti.users.ipa.redhat.com>
X-Authority-Analysis: v=2.4 cv=Xea5Co55 c=1 sm=1 tr=0 ts=6a739fb0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=P-IC7800AAAA:8
 a=ivObySnqZvrQ93kweaYA:9 a=CjuIK1q_8ugA:10 a=WgJNjlqc4YYCZ52uAfgA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: YpKeHa03K7XJr19qc0SVTQb4i8jrSWt1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE2OSBTYWx0ZWRfX9yEjhY45fPMI
 BJsILoeTdEErPbx2OjpP38Mh8AqCErvZq+XYruysX3SIcyeEx5fna3NJ2ZQnnTGYsFvJ4ukprjv
 5LncS2/TuAacnvb9HX8BoMElMkoDCp25vRqYfj+y40kn87Ox5EAbDmMqktbo0pnnRNCYbkmmpev
 GAz9jbdpV7zVpuy9Sm6xCTg2AiCj9JdZCNhskidfGN1FJOBIkeOSph/ac4X913C72jAvtpqIHA4
 FH576rU1i8h1BIw/Ul6o/nGK/v+e0V00qCTc+0upBr18Cun2nC/V2eViHi4D9zmx9ngqlZt6+fu
 HI39GhpnfHiu19chBhM+MddIZIgm3sZlzSt1xMAHCBQoGbnhFhrrKqwzkPkzGN1ZRQSPmsYK3vd
 u62ftGx9Y4AcFMcI3T8io5xlxiczL0ZpFNcwp+vxU8z1k6qkL/+180DF1CFkZGwYHlrbg4/P6v+
 u9KtYss+HVinZM9QjJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE2OSBTYWx0ZWRfX2sRpYLOAV+1X
 4pZS/rENxAbUChWy1S5TqVmeGDJgd5MZDz3171/j2GDcg+6KkUy/1F6yOAa/cQWA3JnRJEPOuDM
 LQG3uNH/ieUYTkTldtVtbG7wMz1YDZs=
X-Proofpoint-ORIG-GUID: YpKeHa03K7XJr19qc0SVTQb4i8jrSWt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_134018_555560_4730E04E 
X-CRM114-Status: GOOD (  28.15  )
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

--DmZsoeZb2q28/CCl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, Aug 04, 2026 at 08:17:35PM +0200, Lorenzo Bianconi wrote:
>=20
> [...]
>=20
> > When all bands are strict priority, the MTL scheduler is programmed with
> > SP scheduling;=20
>=20
> ... and I replied too early _ sorry for the noise _ there is another smal=
l thing

thx for the review :)

> w.r.t. SP scheduling:
>=20
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > @@ -1210,6 +1210,73 @@ static int tc_setup_etf(struct stmmac_priv *priv,
> >  	return 0;
> >  }
> > =20
> > +static int tc_setup_sp_sched(struct stmmac_priv *priv)
> > +{
> > +	struct plat_stmmacenet_data *pdata =3D priv->plat;
> > +	int i;
> > +
> > +	for (i =3D 0; i < pdata->tx_queues_to_use; i++)
> > +		pdata->tx_queues_cfg[i].weight =3D 0;
> > +	stmmac_set_tx_queue_weight(priv);
> > +
> > +	pdata->tx_sched_algorithm =3D MTL_TX_ALGORITHM_SP;
> > +	stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
> > +				      pdata->tx_sched_algorithm);
> > +
> > +	return 0;
> > +}
>=20
> The above function configures the stmmac SP queues to a well-known state =
where all
> queues are SP. However,
>=20
> [...]
>=20
> > +
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
> This is not necessarily what the user wants when setting up the ETS qdisc.
> The driver should parse 'priomap' (like in [1] or [2]) so that only 'nstr=
ict'
> queues are involved, and selected based on the packet priority. Otherwise=
, the
> offloaded ETS is going to behave very differently from its full-software
> implementation _ which is something we probably want to avoid.
>=20
> [1] https://elixir.bootlin.com/linux/v7.1.5/source/drivers/net/ethernet/m=
icrochip/lan966x/lan966x_ets.c#L36
> [2] https://elixir.bootlin.com/linux/v7.1.5/source/drivers/net/ethernet/a=
iroha/airoha_eth.c#L2281
> =09
> WDYT? Any feedback appreciated!

ack, I agree. Since the hw assigns increasing priority to the sp queues (pr=
io_n+1 > prio_n),
we should check the priomap according to the following code:

	if (nstrict) {
		if (nstrict !=3D p->bands)
			return -EINVAL;

		for (i =3D 0; i < p->bands; i++) {
			if (p->priomap[p->bands - i - 1] !=3D i)
				return -EINVAL;
		}
		...
	}

Agree?

Regard,
Lorenzo

>=20
> --=20
> davide
>=20

--DmZsoeZb2q28/CCl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCanOfrAAKCRA6cBh0uS2t
rL4wAQDb78rIKeY8ylrviZj54UjKHnTb97dp/vkXS3Qr9qcgSQEA28BfSF9ibFLs
EEVoTHxAuTnIYoUBUvdbgvhPNhdiDQ0=
=jIeP
-----END PGP SIGNATURE-----

--DmZsoeZb2q28/CCl--

