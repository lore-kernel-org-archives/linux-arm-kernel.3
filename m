Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F745CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTpXd2xcXmR9jaqSnaJI/lPyn8DKYRE9YWWV6/HaoMI=; b=mwvuNBgkwLbCnzLTBdzHrpp19s
	iIFFBEV//+/hKK8M8vITS+zaCvFsb6u8BToh8tbPKITXM99hdpFS+ilBCnYqLAM/CyquCLOt/HB+n
	6y1seYscQSpIMwSOrXZRm1gniqBhAAnr8agwDS7NRYRP+qlRweiy93QkFn5ALtLsdJUoNOiJLGRZd
	JIyoR+pk/Ty3tecIsHlJ8D235JrY8jFO8u+o8yyQRbenTv/gURnafU3ls+MVWk5qTjs5ajIRoGZpT
	wa6Q5qM/YjtJIkpyIimTbiDriqkidacXEBB/8nOH15/tpXOS7QKDb2aDB/tYaZh+YtpWhWVKxg3kX
	y5t1WaUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfgC-0000000G8HR-2Phg;
	Mon, 05 Oct 2026 10:12:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfg9-0000000G8Gt-1VeU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:12:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xn991105273
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Oct 2026 10:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wTpXd2xcXmR9jaqSnaJI/lPy
	n8DKYRE9YWWV6/HaoMI=; b=HJspakl/D69qWYxop7Ch866rgarzmM6aBt1VrN/G
	mcmGUKHdvQegqiobw9pjzMJyk88qynk/bAwRJ8hee69FbTgmQwjII0/kMv/4bHBi
	yaO9LB4EE7bUhqLe6/Lp4U9zEi58ZoBb5+xJFk1dmWhi7VxQDwzH4eD7vyn0QkjG
	DzgapdM/0CcFy+qFiD8mWVOWICllHIUFCwxj+ub9F8tixnifo0lg5M0+TiQKtK0j
	V2Y42MEmZUtaVPGIAl0WC0p47TUY8agIlaLT/ihZPi+hvQquefxBqF5jiC3B/A2b
	zLvU1/F2ib4w16ekdF5rLkklPU+ym0gdsIa0BnP/uw2lqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu5cv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 10:12:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bfb2da664so344216085a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791195135; x=1791799935; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wTpXd2xcXmR9jaqSnaJI/lPyn8DKYRE9YWWV6/HaoMI=;
        b=Bcr7GUR1sft205Hxyxa1gwUfUeAGWAX0BMJOQ2xY4y+AhoXTEG44KBbGBcuGqFVcFB
         ObTF9BYUbHelVvAgSWsTY1kjnRg8DzJ+sGrQy1b22f/i2EK4PJmhsDxT539CbfSI98B0
         4TNN+/PYrNbw8UVbwfGqmDFIc8sPWmoFRnXGllY8mu3htfh5RlGVBbYqFaeRpFkWEtiQ
         bzHWJCmv682xXylD3m+9wJY1tkOLv/BsHuYMLnUZlOgkaLqUGoR73/OgvQMgHWOb9hbj
         D3BJiczw+etEqpoxGvPiPIeXm+luNyEzOPoPJfk7YQ1A0HlWPHzQonF01i111JJQRSnk
         yxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791195135; x=1791799935;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTpXd2xcXmR9jaqSnaJI/lPyn8DKYRE9YWWV6/HaoMI=;
        b=t/b3WtTZujRssAI+3usQHGjovx6XlwnkxviW1Id/Dmr4HjqsQ/Fl3/yzzbnwYZDoGN
         rS4LATt/ojOUGllND1ldapz9poFdLetMcSLeT1SKxFbrBf3EjLN2Eae3IfeOZaw8/oln
         K9xdGk17aMmGG+OB0k8ods3C+gDdMisjavDSWnTFOQHC6xbDQFN4H/iBlvFUf0CrNSlG
         pqS3MGpbSZyrEtl/1/nByd7AR7BRSFXdKVjG42vg6KsjzEIGOp5ODHVqfe3Xa+zgrGUE
         CCmMZB+H7UOTzjG1dHoVamsvH4lLg1lrnYBj+jhTbaH4N2PALwpR0YrG2xs8jpYN/AVc
         W6Wg==
X-Forwarded-Encrypted: i=1; AKwUvBx2sSyq3qW0L6m0HEnl97hKYnwAzKELD+Ab1Q9vdILi8jE+x6ULRyn/VQf5bkBM0/o1bmac1aVZNK6zHp7csh+R@lists.infradead.org
X-Gm-Message-State: AFuF++lr9GNxDFseT9Mythpb1PROxOjH9BMexlsZ3onkAZK85eHNK3xB
	pZEObD51nG8Av80THurfQHZlVmN1WaZ4+Xzz9Ua8nT30JELeIQQy+6929rNg9i910WbWZ76HRVx
	armOSGi4jcbThds1IMhg/RmtDODOmQVOMJSaAjpYIJwBIvj88PoCjeqdFQxOgnMXueM6h4s/7Oc
	bkkA==
X-Gm-Gg: AYBFou0GdksTCVUiJopNupYE90LQFAy3ZHr6EGD+Cs5klAuiKdhdVPsFaxeSuksJ82N
	e37MZ0HrRzFtVKaSGS+GFQ6SQGVAJ2Ig0jdsrZ8AJ7Cc4un3X4LcNDIeLhviP9P9Rl3DhsVExCK
	9tnO/+w/fpDlFCUVMxVjY2mpqe3Olju74rIC6Fcz/KfmlJ3hq9+YazajCc6WqPoxcm30dszKv3F
	aYwx67f1UoSgrlzy8crXUF10E8FFUVhXtUGlic/6MyzQKZ1KwTt3LgcIcYNmAwbfohspSb5Eujk
	9JsBuk+HmbJ9Tb4mXCPj0ZUTkbWQ3mPLy6nt+8r8RY+WfU/QHZV2HGizDy1Rds1JoFbYrp7UN7y
	D7PDE8gVp5FB+Uw==
X-Received: by 2002:a05:620a:6f92:20b0:939:a834:98f2 with SMTP id af79cd13be357-93ce7c126d3mr1270433385a.15.1791195135275;
        Mon, 05 Oct 2026 03:12:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6f92:20b0:939:a834:98f2 with SMTP id af79cd13be357-93ce7c126d3mr1270430585a.15.1791195134577;
        Mon, 05 Oct 2026 03:12:14 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a162e867e8sm306620895e9.15.2026.10.05.03.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:12:13 -0700 (PDT)
Date: Mon, 5 Oct 2026 12:12:12 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, boon.leong.ong@intel.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/2] net: stmmac: fix TX coalesce race and
 div-by-zero in XDP/legacy path
Message-ID: <asN3_ExreXflhcPN@lore-desk>
References: <20261001-b4-stmmac-xmit-mb-v4-1-664e0c3eb289@oss.qualcomm.com>
 <179119366947.434549.18258387588944949725@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UfQjmt/PTQh8Ar59"
Content-Disposition: inline
In-Reply-To: <179119366947.434549.18258387588944949725@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX7ySvDIWPsYlp
 zTw4m/JG1/uXdbSIQG9XlLAENPCoCozTp4bFnu7V/axCiDoPoDS8LvnVaycxOH+oEZe5fhvBM1F
 gSM3aPTUsJ/pr+scg+6ybagLHOTIt+RpiFbN09VrVR19S0AndwzK7zvBGt1JN+CQ6nof8Gp3vtf
 MJL6qU9CarsKYNQqstyZRoqE7hbSG52ohn6XSRtNaWYIlekMimqVlj0/DKxPwcMX1fyBAQyIM3J
 JN6QlGdFjvsoLc/csrQY0tfpMF8As21vkGPROh4g/G7aBQK6cDCJ7I8ZBM7xO8Qkamb4TkvUh6Y
 jdTBHxetgUxnKHOQr951ldLqzyv7fDYoPTVAzUFk6QRSjfxjMTwHQJO+7YePlW5fPsnhLZMVit4
 R7xz4X9mY6a7KlasO4z0I0j9xi9AoHZ+ymv3foIN0woPXaKlPdaiCY/qK835tFy5sPDuj6SOc68
 z9GQIL1GuZj8vGE2Wow==
X-Proofpoint-ORIG-GUID: vB4bXbc2j6KDiBC8yS0J3QEcTwpnupgw
X-Proofpoint-GUID: vB4bXbc2j6KDiBC8yS0J3QEcTwpnupgw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfXzelqzuS9zjXJ
 KVQ3pPp9Fe7Y3mHTu6gD/wDxKEW8+0Sfi33GtTkV30RZnIQfwH3Pu9uYcgHdpVyuvvXpOjD+tW0
 DJIhdZJRmICKuju2ZcT7RP3eFKewAcs=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac37800 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=hMNoLFnnqX5p7295vMQA:9 a=QEXdDO2ut3YA:10
 a=UvE2pUckuqDNxODme40A:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_031217_548840_8692B78A 
X-CRM114-Status: GOOD (  39.75  )
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

--UfQjmt/PTQh8Ar59
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 05, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0 (1)
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] The commit message says the stmmac_xdp_xmit_xdpf() divide-by-
>   zero is "only theoretical", but a privileged user can trigger it and=E2=
=80=A6
>=20
> Pre-existing issues:
> - [Low] __stmmac_set_coalesce() publishes tx_coal_frames[q] and
>   tx_coal_timer[q] as two separate stores and shares no synchronisation=
=E2=80=A6
>=20
> --
>=20
> net: stmmac: fix TX coalesce race and div-by-zero in XDP/legacy path
>=20
> This patch wraps every access to tx_coal_frames[] in READ_ONCE() or
> WRITE_ONCE(), since ethtool writes the array while the TX fast paths read
> it without a lock. It also guards the modulo in stmmac_xdp_xmit_xdpf()
> against a zero tx_coal_frames[queue].
>=20
> > Both issues were found by code inspection while extending the XDP TX
> > path with multi-buff support, and neither has ever been triggered, so
> > they are only theoretical. Tested on the Qualcomm RB3-gen2 board.
>=20
> [Severity: Medium]
>=20
> Is the division by zero in stmmac_xdp_xmit_xdpf() really only
> theoretical?

with 'theoretical' I mean I spotted the issue with code inspection and I ha=
ve
never observed it in practice. I agree this is a real issue.

>=20
> __stmmac_set_coalesce() only rejects the case where both values are zero:
>=20
> 	if ((ec->tx_coalesce_usecs =3D=3D 0) &&
> 	    (ec->tx_max_coalesced_frames =3D=3D 0))
> 		return -EINVAL;
>=20
> So "ethtool -C ethX tx-frames 0" is accepted. tx-usecs keeps its default
> of STMMAC_COAL_TX_TIMER, and stmmac_ethtool_ops advertises
> ETHTOOL_COALESCE_MAX_FRAMES. After that, tx_coal_frames[queue] is 0.
>=20
> >From then on, before this patch, every XDP_TX verdict
> (stmmac_xdp_xmit_back()->stmmac_xdp_xmit_xdpf()) and every ndo_xdp_xmit
> redirect into the device would evaluate:
>=20
> 	if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] =3D=3D 0)
>=20
> On x86, for example the dwmac-intel platforms that advertise XDP
> basic and redirect, this raises a divide error in NAPI softirq context.
>=20
> On arm64, UDIV with a zero divisor returns 0 instead of trapping. That
> may be why the RB3-gen2 board never hit it.
>=20
> CAP_NET_ADMIN can trigger this with standard tools. Could the commit
> message describe it as a reachable crash rather than a theoretical one?
> Would it also make sense to send the div-by-zero fix separately from the
> READ_ONCE()/WRITE_ONCE() annotations?
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/dri=
vers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > index 1cf0f8820b337..30e0d499326d8 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
>=20
> [ ... ]
>=20
> > @@ -887,14 +888,14 @@ static int __stmmac_set_coalesce(struct net_devic=
e *dev,
> >  		int i;
> > =20
> >  		for (i =3D 0; i < tx_cnt; i++) {
> > -			priv->tx_coal_frames[i] =3D
> > -				ec->tx_max_coalesced_frames;
> > +			WRITE_ONCE(priv->tx_coal_frames[i],
> > +				   ec->tx_max_coalesced_frames);
> >  			priv->tx_coal_timer[i] =3D
> >  				ec->tx_coalesce_usecs;
> >  		}
> >  	} else if (queue < tx_cnt) {
> > -		priv->tx_coal_frames[queue] =3D
> > -			ec->tx_max_coalesced_frames;
> > +		WRITE_ONCE(priv->tx_coal_frames[queue],
> > +			   ec->tx_max_coalesced_frames);
> >  		priv->tx_coal_timer[queue] =3D
> >  			ec->tx_coalesce_usecs;
> >  	}
>=20
> [Severity: Low]
>=20
> This is a pre-existing issue and was not introduced by this patch.
> tx_coal_frames[] and tx_coal_timer[] are still published as two separate
> stores, with no synchronisation against the TX path.

as pointed out by sashiko, this is a pre-existing issue and it needs to be
fixed with a dedicated patch.

Regards,
Lorenzo

>=20
> Can a concurrent stmmac_xmit() see a mixed pair? Take a change from
> (frames=3DN, usecs=3D0) to (frames=3D0, usecs=3DU). The TX path could rea=
d the
> new frames value:
>=20
> 	tx_coal =3D READ_ONCE(priv->tx_coal_frames[queue]);
> 	...
> 	else if (!tx_coal)
> 		set_ic =3D false;
>=20
> It could then read the old timer value in stmmac_tx_timer_arm():
>=20
> 	u32 tx_coal_timer =3D priv->tx_coal_timer[queue];
>=20
> 	if (!tx_coal_timer)
> 		return;
>=20
> That frame would then get neither an IC interrupt nor the completion
> timer. Its completion would wait for the next TX or NAPI activity on that
> queue. The same window exists for stmmac_tso_xmit() and
> stmmac_xdp_xmit_xdpf().
>=20
> READ_ONCE()/WRITE_ONCE() make each field consistent on its own, which is
> all the commit message claims. The window across the two fields is still
> there.
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261001-b4-stmmac-xmit-mb-v4-0-664e0c3eb289%40oss.qualcomm.com

--UfQjmt/PTQh8Ar59
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasN3/AAKCRA6cBh0uS2t
rHGpAP4u5rsRmhyEgCWlJ1hLUiJ6poy7UiqYIcRNsGH2h4wwIgD/SAI26R14/nqi
gX/DwdFmAvUo2UpQ/YeWx60UO70Togw=
=Hpyz
-----END PGP SIGNATURE-----

--UfQjmt/PTQh8Ar59--

