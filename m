Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7A0C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 02:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9kex6Z3WEWdGPRk9qXlwnM8PV8rrpdTWy9hzLWAGRM=; b=u6U1FSfcB/Un2fsLewyfcC0GKH
	3TNGOcBcpJuAdJ7fknaIZ0JPeF0+eMlcLHX3TailnevAyyV0mATktlmkm58hfcS66twy6cR87ZgLs
	ZweNip/MG/a82NOEmPVRLNV4LlBecuUhpA+eMDeemCK+g3SDgPTkdpTuxAntOId0zrHDZYuSOjlqv
	Ki9ssbGlsbheGfBxUW1kP+IAoPCj3lL6fbm/EnfA9JxaLkYCmpH6M1KiIO8Y7uGpbwewkphH6dhSZ
	+Trl8UpnycsPV8plCVeAOXMU/HjHSLp8JuUKFfVZPJScX1hj49uRDxxKE5aKpCpOqLHXouvL6IULz
	UJWRgWvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvmzu-00000005J8s-2AVn;
	Mon, 17 Aug 2026 02:22:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvmzr-00000005J8H-1ziE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 02:22:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLDPaQ4119389
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 02:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x9kex6Z3WEWdGPRk9qXlwnM8
	PV8rrpdTWy9hzLWAGRM=; b=h449e2ON73OsHk9px/cswg7IFKCKrsbdpAfXeZfV
	BjS9B0tqF6uMBE5v64QugdxRZzmb2KSSVg3Ly1eqNd6+Q8KySbXaEqfboUNsWrde
	wmGxN85khnVugoeVeqMzUpvBxXmmWzj+KNJhBSmuc9H4ep2mTg589ORv4PDR3OX7
	yt0lzIOnqJ3tsFx8qnct8hzy0ACZaTIIUapLACl7PR/X8DdOtjLGrBgXRCWNS5aM
	Rnpwg7VfJOAYXNudAbr0TwSyuS2WDg5FqSOSK9SZucRSeh1og25JtQgrwrICQV2q
	xihm2ZUGBFle1/hg7JnwgKhOfd9Hy865RgAmWvjmxPeh2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghfcvnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 02:22:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so43961305ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 19:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786933361; x=1787538161; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x9kex6Z3WEWdGPRk9qXlwnM8PV8rrpdTWy9hzLWAGRM=;
        b=ajoChiVYw5DJVPd/bv1FzCd3eQJVvstcJLuzU9xTd/MpuAddKxtGSA46M+RlvwVTfc
         pkBtaeKdKUEdzJ1wGESOyysaGZZvnfLrWUzDqlNe0nRDRKuGlFzLdHgE9D5OyayXrPVW
         lAuLrKwK4KkJ/ke4HwZpw6YNS3bO9XPc/aW5omrvpf6UHQl+XhPiarh4+IeHgyR5rSBO
         5CSXVEyZ8aMYvgy9BAWqlTY5T1xR7cPQrMN9jwOQu3L01RaRvPMSq9Jy+E3HnZMC45Ev
         RNBRvk3JJRi8Iv8Q8SZAPDIvpTyG9+M4aPxikHpeRriE0VWRSNqse0YOxq7em8cHJh1h
         GWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786933361; x=1787538161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9kex6Z3WEWdGPRk9qXlwnM8PV8rrpdTWy9hzLWAGRM=;
        b=Wu+fX20FrweKwmCkPE+oAlT2aYdsbvhjG9c5eZab8DrACUX2yBrokoqwt86IOwdDor
         xXHH33VLxgb6l9swznVDyTeCgDWMgNW130Dp28Y6J41Ykx/Oe5uS8HU4St5ZrLziHZRm
         Azqt4k4/+7yVUJ3q7lD4slnNHtpJlRiDzqoPHiXuP+iR8/pRIxL47PaTh3pQH3410fvy
         WPSfvoAyKpsHMO7Oz/AGFHPPQo4fPYeTWDbc8v6t0T8p1I4yITxS1JaC4K/dVaG8n3bv
         NvyFmzL14keilLVtpP3BQmatiftmANR8NmnZxS0q0W0GFd+rg1dUL83Yl8Qf5dxl2MqR
         WCqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7bt+LL9kgcaCPAoRtgSrMuaPyNYNDmWxPY+IbjjntlR/s1hXLNt0Xm4yH8krZCKrNxHQc6CD9V+TVb1tPqe2U@lists.infradead.org
X-Gm-Message-State: AOJu0YysQN85Fy6W6HZfDT/5Kcr2l2Es0Jd0xN487LeqKphtCsN1vSzj
	rmGtAWz3AL9cM1An/ifPG7leZVzFEqnVyoOc0TVQ4opnxtnNyypw9NcRzOJzaFws9v9HQ0OBChe
	qJNeaX14JaiHDOfnUYzdK8wug+r1xpNIRfBtLMbObg381/p5msIxvBdNnBqbTHCCMAqlLw9nIWq
	qaDQ==
X-Gm-Gg: AR+sD13p1iyAnkTVK5NeJYotZfjxLShWpqlLBXjW08csM0FBoIQISWwEXCdI/21bQLB
	9ZG69s9WhYh9pOi7XrMjcV0rRK6C9TYVmDm/DhjqPx6Yqv11iuRTJ4nVEM0fMWUXOiyTj7Rfhi3
	Em7nbcYN1+ingDUxGPnXK8hqQ/dBSn0eShImbruCZfWCi5bX3KcZtcxjK7fl9QVn/cIXPtDd5df
	kWiJDOkufWvrLVrW7wC8ahkT9eIRH728uYOKLS0dFY9TFxEqFKpc2uYXut2nXpZER5Fh+2A4fW2
	8RcTKM2FX3ZFUQ7gtioBq6bPov6iHLfs4X3UKa8Ym6XnvAjcplCYx08EPArzc8BGaMiekLmBhqt
	NYZ2QpEzbSPxShg==
X-Received: by 2002:a05:6a21:339a:b0:3c3:91f5:82c2 with SMTP id adf61e73a8af0-3cc71b16a94mr23599384637.16.1786933360844;
        Sun, 16 Aug 2026 19:22:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:339a:b0:3c3:91f5:82c2 with SMTP id adf61e73a8af0-3cc71b16a94mr23599319637.16.1786933360209;
        Sun, 16 Aug 2026 19:22:40 -0700 (PDT)
Received: from localhost ([4.43.230.125])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc095a1faf1sm2645151a12.16.2026.08.16.19.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 19:22:39 -0700 (PDT)
Date: Mon, 17 Aug 2026 04:22:37 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2] net: stmmac: improve TSO/GSO queue selection
Message-ID: <aoJwbQ-v--cTcysz@lore-qca>
References: <20260808-stmmac_select_queue-tso-fix-v2-1-67175b29772e@oss.qualcomm.com>
 <anybM_3Rdg8X8CMs@lore-qca>
 <20260812161038.5602eac9@kernel.org>
 <an4qzUrK62-rN7Q6@lore-qca>
 <20260813172156.0243cb7a@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QAuoag7Qlga7XwOH"
Content-Disposition: inline
In-Reply-To: <20260813172156.0243cb7a@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAxNyBTYWx0ZWRfX0pxg3g+syaMu
 +tFWOfkW6aQuz1PMzVTuH/JRs9vTXYzp2HlfTRbtHWr+8dK5eVNz6Plh3b9bjmjBBUO6j7NVYGh
 2dJu44PCcfbeVE0eHOOOKAImW2foDME=
X-Proofpoint-ORIG-GUID: mwxGK0foTQJwWuszcRxn7vl4dvsuowbn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAxNyBTYWx0ZWRfX1M777yD9+411
 AA+z1R/MvKigK+LwZzXkZn6rLuJbEKs52y96tnqUO5zptqaB1zGw2Zs15MuDhIS6Pi4lLtbVR4e
 GiTNWqlXtuRLK/br6VBzBla7UlmHCqCNXy/bWwVj5/mcMC9qC4aicRpB+Eu02Ctka2+UaMitZLZ
 +PmnSW5y6vcS3eGdKRK2bKTFBR5/m6tZE18LO0/s33ziCvNhpPoTfdEfga6TgDPDrppBJZvFoYA
 XOVIigT0EEQcSMKTCmClGVS9txuBaZhwIvC4TPcSSESnIoUJZGmlkgUCOKPBTSzNgi1UVaBya3J
 1uUAuMrOtaVGkCD0F6lC/8mlAW7Cqzec+cMioMLeCLkElm961HXWUFW0jySZGD/VZeYl4WgwESK
 SpJjmstA3B73WKAGzSuz6y2QjWZLykiAZuHjkQz+3R+xhGh1l2Gy2nRjOIbEHXWA1Lt+9DOuNdP
 UgsbzzHEtKqNDdOB7lA==
X-Proofpoint-GUID: mwxGK0foTQJwWuszcRxn7vl4dvsuowbn
X-Authority-Analysis: v=2.4 cv=I/dVgtgg c=1 sm=1 tr=0 ts=6a827072 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=y9u56/S6JbnHW3dtX7SsYA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=eGnkRP_O6TsY_KFkqcMA:9
 a=CjuIK1q_8ugA:10 a=eUwoYkQ2b4UhtwRhp3UA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_192243_634190_3FDBCE9D 
X-CRM114-Status: GOOD (  35.13  )
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

--QAuoag7Qlga7XwOH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 13 Aug 2026 22:36:29 +0200 Lorenzo Bianconi wrote:
> > On Aug 12, Jakub Kicinski wrote:
> > > On Wed, 12 Aug 2026 18:11:31 +0200 Lorenzo Bianconi wrote: =20
> > > > please drop this version, I will post v3 to fix some pending issues=
=2E =20
> > >=20
> > > FTR Russell was trying to fix TSO in this driver too, before giving up
> > > (on us?). The direction he was following of clearing the TSO caps in
> > > ndo_features_check and letting the stack GSO instead of all the weird
> > > hacks this driver has seemed much more sane. But maybe I'm missing
> > > something TBS specific here  =20
> >=20
> > thx for the pointers. I reviewed Russell's commits and I guess we have =
two
> > options here:
> >=20
> > - manages all the TSO/GSO checks in ndo_features_check() (stmmac_featur=
es_check())
> >   and disable TSO/GSO if the selected queue does not support checksum o=
ffload
> >   or it has TBS enabled. In this case I guess we can drop ndo_select_qu=
eue()
> >   callback completely (it does not make sense to me to always use queue=
 0 for
> >   TSO/GSO packets, e.g. it does not allow proper mqprio offload).
> >   Please note this approach would introduce some performance regression=
s with
> >   respect of the previous implementation.
> > - implements TSO/GSO checks in ndo_select_queue() callback
> >   (stmmac_select_queue()) in order to keep TSO/GSO enabled if the selec=
ted
> >   queue supports it and at the same time do not always use queue 0 for =
TSO/GSO
> >   packets (proper qdisc offload). Please note this is patch I am propos=
ing.
> >=20
> > What do you think?
>=20
> I don't know this driver, or how it's used.
>=20
> From the commit message it sounds like "if the packet wants TSO and=20
> the queue has a scheduler enabled - take the packet to another queue".
> Presumably you know why the TBS is enabled and whether the packet
> should or should not be going to that queue in the first place if
> you're sending the patch? What is the use case?

Reviewing the driver codebase, TBS and TSO can't be enabled at the same time
for a specific queue (TBS is not enabled via DTS but it is hardcoded in the
driver). Moreover, for some devices (e.g. dwmac-intel, dwmac-mediatek, ecc.)
TBS is enabled at bootstrap for Q1, Q2 .. Qn, (Q0 is never a TBS queue) whi=
le
for others (e.g. dwmac-stm32, dwmac-sunxi, ecc.) TBS is not enabled at all.
The current codebase forces TSO/GSO packets to Q0 (since the current driver
guarantees Q0 is a TSO queue). However this approach does not work with qdi=
sc
offload (e.g. mqprio).
I think it is clean to just move the TSO logic in ndo_features_check() and =
drop
ndo_select_queue() (previous option 1) but I guess this could introduce a
performance regression with respect to the current codebase (we could disab=
le TSO).
If we move the TSO logic in ndo_select_queue() (previous option 2), we coul=
d avoid
forcing the TSO/GSO traffic to Q0 if the selected queue supports it and
at the same time avoid any performance regression with respect to the curre=
nt
driver.

Regards,
Lorenzo


--QAuoag7Qlga7XwOH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaoJwbQAKCRA6cBh0uS2t
rHTwAP9OB+KuL9paucKapmcutF0REO2rHlCVsGoKX73Bqi4/wwD/S3Pmqa6JYHkp
oialF9o4sGc2cArZAMTn5p49Fe/u9Q4=
=jfRM
-----END PGP SIGNATURE-----

--QAuoag7Qlga7XwOH--

