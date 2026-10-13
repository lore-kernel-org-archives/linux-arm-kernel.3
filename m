Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D29DCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRXEqBHq37FSBtlagdCvVWvm8N5YQgQEDV8TIW7L8YE=; b=cRh8AGxs4qnpFSMsiqNrlk7vc3
	Iw33esofvtEWWP3Uo+HdkJJJU0FoLkT8u1Iq5+x4w9YodLkpyAVP/y3neMlS+mezPekyW+4pmoS10
	U1WWXY3TLgmyb8HfB3F7nE6yVrmvMlBgBtV41TTAaV3yW/XHchg43Zz9alyCApVE9HA3EsSdcegcS
	YbSLbFb8es6cAIoOzwc7JSlCxt1hUodFYizcyhuQEkBWZcRpOWulXxBMBPfw9dhTLtUXH4Pxej6KX
	hEJclpanALhj2hamn0RlYFGVT2YmrqrtmAmhUJmjLY+UT1PBzBIkhgl61N5V29COvB5jtaF3y+eAH
	qmaCr3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbZ1-0000000Cof5-35uP;
	Tue, 13 Oct 2026 12:25:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbYy-0000000Cod4-0QrH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:25:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OXxS015275
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 12:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IRXEqBHq37FSBtlagdCvVWvm
	8N5YQgQEDV8TIW7L8YE=; b=O2FX/R+rNuwSriKaWhZwScVOSraOEOM1+uep+0m/
	vX7QTlwFlOy0F3SdAwG4RngAGoEGcu9PsPvkAk4kPbt4d9zS7Brj17zPkFI03hMt
	o7wLPJJNv8xTmZHCPKRFLCuh3Fhfp56NXSw72LWOgDfzn7t4e12B6azMTtcWpCTT
	ibZEVKdYzNTT5wn8JrhF8bxV4+AeivWU2ZyxjsCZ7T8+y1PRXQS9weZIZX1etZ93
	gcXnhF+xaNpa+SGFa/gQmZMpcTQgdlTDP/0ZeZL7Gq1T/RslizUpt5emjJU7yTlY
	CmYZ1X2JCWRxYCzaTFpV/P7rdpcDbKEKDEzAuSWMKnL8HA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uh722-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 12:24:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso806898085a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791894289; x=1792499089; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IRXEqBHq37FSBtlagdCvVWvm8N5YQgQEDV8TIW7L8YE=;
        b=V8fP/EDRZbZz27GC7Ry9QM8Ek9dQmcQnyeXXhwUN+ey4gPuJV84C20/l3SkQvIIyLg
         wOc3SpNZoQA/YXHaBtqbZI9eVssP/FW5GHDY+bmdyBQ9IsuEENqx+/4ivESW2ostuvNz
         cq7EY2RmXvi9J/kQgw6Zkhw63sm28GKkFrIpnytup16NFRk1uTHHD8T/Q1p/W44rGoEk
         GibGvIejY4ZmHqJ3kaEUs8Rq439R0xudaP8cOEqFZ3JMO9N3oRN5XBt7v9yzNHPNl87f
         oePw5lHAmOsALX9QmGdnJouE6B3+siDvJa72CFhiD6v/yOkUdUBgSghubBgAaVGR2alR
         xu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894289; x=1792499089;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRXEqBHq37FSBtlagdCvVWvm8N5YQgQEDV8TIW7L8YE=;
        b=0ajsfNENu2juCM3+eiJ4fD0xBwMLeWflaEYb3bsU6hHcx9ZvCjn/iXhW4a4bdEa40P
         SJzsT1og3EtT+EW8w6DOgBbfMyG+DdkUobfI5v/HWA9VUD7Hlsjo9j4OVGsdAlCWVmIo
         UGBsXirvOwTIvsUQZbwye6yTLyglKKW6LkevqEyZl1pk5UI9TYD5FbomzzTkbXl5SfCz
         lwiI8/biAVnM7gaGMeBylwHELjyeTWvp/vP6i1JUOTEgN1xZrwbYoOR1hDyJ/l1oDPVF
         gV7vmXL3mVgwx5ayvN0iXvUGEqTDYHr353FBmAUJ/57egIiszpUQklfFiGEqGrCaHp6V
         GpgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzx2taJ+97x9Labdf+geTDuUDXoKtkRKW1rSyqm8GDnMq2A5ZZJ+LerGEFB4CjDxISO2bI5O76IqSSKXisqlgAv@lists.infradead.org
X-Gm-Message-State: AFq9FYICBqt0ERqODD0R/9HqsUf7GteTGRD2XRT4gnDrNNeQdIM4k0pK
	R1dlWfKrtuqEDZgY+eNp8dKZmMpBRTMABfzwMAWqa8D/jAVQDTHAW7UUnlV0Bk2/7yp9E0KuXJ1
	gwHw8xHJIlrr3GcTgOIhnT8amwhmeSxDx+fzhuDrhDSckStkFcKTZ6G2/KqDl3BwW4mSgFg+R2V
	7eIQ==
X-Gm-Gg: AYBFou3361zE48Eox/NJuTLRmQepggvw1y2xv29EPkYIeUAUs5BX039reYwcoqWt9KT
	7ZsnzlANMJZ9miq0DrK/ektWoAWLGowYYiUHc3NOjSPTJLZW1YDtyfkJ5bRgBOyVR3L5Kj8At9J
	k2EZgH/Yj5LA6RAHkmsjlITwXc3Dy8RbDoGg3ompdU/Me1+CBh7sSJJg0ShGk5wF0MYcYSL48v2
	ozpqZiNKxP7ecXSR+esI8S6oA4o3lXQHrQrnI1FlsAlsn0RdxTagJJRNVTd9HgnNlgVpAgM9QLW
	10ZQyaAK4b2I7x+Zbdrj7uKU4TQBj98R0ALXexS9cyLnX3eVooRKOED0oxKnmMXsyLrRa58E2d4
	+eFntyqfW8aHVYw==
X-Received: by 2002:a05:620a:19a1:b0:93e:653e:698b with SMTP id af79cd13be357-93ebd27d873mr1906817485a.55.1791894288405;
        Tue, 13 Oct 2026 05:24:48 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:93e:653e:698b with SMTP id af79cd13be357-93ebd27d873mr1906809785a.55.1791894287489;
        Tue, 13 Oct 2026 05:24:47 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm414511335e9.12.2026.10.13.05.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:24:46 -0700 (PDT)
Date: Tue, 13 Oct 2026 14:24:45 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Davide Caratti <dcaratti@redhat.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH net-next] net: stmmac: fix mqprio and cbs combination
Message-ID: <as4jDfpsvIfsZp_M@lore-desk>
References: <20261012-stmmac-mqprio-cbs-combo-v1-1-831e323eb4ef@oss.qualcomm.com>
 <20261013101031.42ilxihghwsivccm@DEN-DL-M70577.microsemi.net>
 <as4GJdF8oD_8FsGI@lore-desk>
 <20261013104325.j526p5yurc5zmzhn@DEN-DL-M70577.microsemi.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N9isKUosey8taFli"
Content-Disposition: inline
In-Reply-To: <20261013104325.j526p5yurc5zmzhn@DEN-DL-M70577.microsemi.net>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX7AwGNTMmX/yt
 fANZMPAd+np1KuOlyAI8Fm7GTzdbcweYZP8sZuO4dw/L8NyjD2NfYhE826hErJYj04Tkhnowlkz
 ZklA+STqGT+UKaYVeAIcwB5qIYqpU1g5SoC6tM1IbOHHfaB5IEkeutFtjJp59WuW1erssbShJm7
 sl3VIWCu+5Nf6G5k3Jxg0vvAmPwiAOptve2m8JoUWI7zAyLEL9tI8Ages14tGjR0sa+pPPgGTXV
 2To5bhzMkQvd4qH7C0++LwsbadhAJoPtSTBCOSzDtERER6gD/Hul7Oi/a3ELUHlG38CfDxUT0lB
 0GG7G9kJHt9HpQ6CkIXt9qHBGsDpEvRH9KObrrDu2H9iKmRMye2FIgt1JpXVYCktrUuwwE/f5hb
 flH5K6Klf9HH4Pu3kXsXOmAL/356Oo12s59a7wtljhz4ekSff4DrVC+kXhofeSV272Cr5vaWzCw
 tUhSH7e1Ejdsd4n8vzw==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace2311 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=PfZZTzpaSJvV7ojCNxEA:9 a=CjuIK1q_8ugA:10
 a=KlyeCCL51scEqKYOWpwA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: Zs2_aeMwthRdylzmSx5yVjfYHkApwa9B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX0/a/Dpsfwbmv
 6o8d7zsFjMRpPtObf6CsPvisT+tdTcyjieYvf2WNmlcCdhwhoL3f2W2PJwfS6ggAGF/n8Z3zzAg
 AWzXq8nZjhxLVj+m3BgEvk2gKEuNVbo=
X-Proofpoint-GUID: Zs2_aeMwthRdylzmSx5yVjfYHkApwa9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_052500_155946_DFD43C51 
X-CRM114-Status: GOOD (  43.16  )
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

--N9isKUosey8taFli
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > On Oct 13, Daniel Machon wrote:
> > > Hi Lorenzo,
> > >=20
> > > Just a question:
> > >=20
> > > > The channel-mode mqprio offload and the CBS offload can currently n=
ot be
> > > > enabled at the same time. tc_mqprio_validate_chan_mode() refuses the
> > > > mqprio offload as soon as any TX queue is configured in AVB mode, a=
nd
> > > > tc_setup_cbs() refuses to enable CBS while the strict-priority sche=
duler
> > > > is active. As a result the combination is rejected whichever order =
the
> > > > two are configured in.
> > > >=20
> > > > The strict-priority scheduler selected by the channel-mode mqprio
> > > > offload and the per-queue CBS shaper are independent MTL settings a=
nd do
> > > > not conflict, so drop the checks and let the combination be offload=
ed.
> > > > The following configuration, which was previously refused, now work=
s:
> > >=20
> > > Looks to me like these checks are shared by multiple cores. Are the M=
TL settings
> > > independent on all of them?
> >=20
> > Can you please explain what you mean?
> > What I mean with this patch is we can have a given queue (e.g. queue X)
> > configured in MTL_QUEUE_AVB mode and another one (e.g. queue Y) configu=
red
> > in MTL_QUEUE_DCB mode.
>=20
> Sorry for being vague. I meant the MAC cores. So, dwmac510_tc_ops is bein=
g used
> by GMAC, XGMAC, XLGMAC. My question was whether the claim that the commit
> description gives (per-queue CBS shaper are independent MTL settings) app=
ly to
> all of these 3?

Yes, according to my understanding. MTL_QUEUE_AVB and MTL_QUEUE_DCB are
mutually exclusive for a specific queue, but there is no restriction on two
different hw queues (MTL_QUEUE_AVB and MTL_QUEUE_DCB can be mixed).

Regards,
Lorenzo

>=20
> >=20
> > Regards,
> > Lorenzo
> >=20
> > >=20
> > > >=20
> > > >   $ tc qdisc replace dev eth0 handle 100 parent root mqprio num_tc =
4 \
> > > >         map  0  0  0  0  0  1  2  3  0  0  0  0  0  0  0  0 \
> > > >         queues 1@0 1@1 1@2 1@3 mode channel hw 1
> > > >   $ tc qdisc replace dev eth0 parent 100:2 handle 102: cbs \
> > > >         idleslope 800000 sendslope -1700000 hicredit 494 locredit -=
1049 offload 0
> > > >   $ tc qdisc replace dev eth0 parent 100:3 handle 103: cbs \
> > > >         idleslope 400000 sendslope -2100000 hicredit 247 locredit -=
1296 offload 1
> > > >   $ tc qdisc replace dev eth0 parent 100:4 handle 104: cbs \
> > > >         idleslope 200000 sendslope -2300000 hicredit 124 locredit -=
1419 offload 1
> > > >=20
> > > > Fixes: 47891d501e34 ("net: stmmac: add tc mqprio hw queue priority =
offload")
> > > > Tested-by: Daniel Thompson <daniel@riscstar.com>
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > > > ---
> > > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  8 --------
> > > >  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 16 -----------=
-----
> > > >  2 files changed, 24 deletions(-)
> > > >=20
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/dr=
ivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > index 56d89a696272..51d502930219 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > @@ -7740,14 +7740,6 @@ int stmmac_reinit_queues(struct net_device *=
dev, u8 rx_cnt, u8 tx_cnt)
> > > >  	    tx_cnt < priv->xmit_qdisc.num_tx_queues)
> > > >  		return -EINVAL;
> > > > =20
> > > > -	if (priv->xmit_qdisc.prio_offload) {
> > > > -		for (i =3D priv->plat->tx_queues_to_use; i < tx_cnt; i++) {
> > > > -			if (priv->plat->tx_queues_cfg[i].mode_to_use =3D=3D
> > > > -			    MTL_QUEUE_AVB)
> > > > -				return -EINVAL;
> > > > -		}
> > > > -	}
> > > > -
> > > >  	if (netif_running(dev))
> > > >  		stmmac_release(dev);
> > > > =20
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/driv=
ers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > > > index ea1f97d6f0bd..175236ba379d 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > > > @@ -346,9 +346,6 @@ static int tc_setup_cbs(struct stmmac_priv *pri=
v,
> > > >  	if (!priv->dma_cap.av)
> > > >  		return -EOPNOTSUPP;
> > > > =20
> > > > -	if (qopt->enable && priv->xmit_qdisc.prio_offload)
> > > > -		return -EOPNOTSUPP;
> > > > -
> > > >  	port_transmit_rate_kbps =3D qopt->idleslope - qopt->sendslope;
> > > > =20
> > > >  	if (qopt->enable) {
> > > > @@ -1340,7 +1337,6 @@ static void tc_mqprio_config_queue_prio(struc=
t stmmac_priv *priv,
> > > >  static int tc_mqprio_validate_chan_mode(struct stmmac_priv *priv,
> > > >  					struct tc_mqprio_qopt_offload *mqprio)
> > > >  {
> > > > -	struct plat_stmmacenet_data *pdata =3D priv->plat;
> > > >  	struct tc_mqprio_qopt *qopt =3D &mqprio->qopt;
> > > >  	int i;
> > > > =20
> > > > @@ -1350,18 +1346,6 @@ static int tc_mqprio_validate_chan_mode(stru=
ct stmmac_priv *priv,
> > > >  		return -EOPNOTSUPP;
> > > >  	}
> > > > =20
> > > > -	/* Forcing strict priority conflicts with the CBS algorithm
> > > > -	 * of AVB queues, so reject the offload when any queue is
> > > > -	 * configured as AVB.
> > > > -	 */
> > > > -	for (i =3D 0; i < pdata->tx_queues_to_use; i++) {
> > > > -		if (pdata->tx_queues_cfg[i].mode_to_use =3D=3D MTL_QUEUE_AVB) {
> > > > -			NL_SET_ERR_MSG_MOD(mqprio->extack,
> > > > -					   "SP conflicts with AVB queues");
> > > > -			return -EOPNOTSUPP;
> > > > -		}
> > > > -	}
> > > > -
> > > >  	for (i =3D 0; i < qopt->num_tc; i++) {
> > > >  		/* The offload switches the MTL scheduler to strict
> > > >  		 * priority, which only supports a 1:1 TC to TX queue
> > > >=20
> > > > ---
> > > > base-commit: d0bd617658ddfa5a115e64d1ab687bf155f6331f
> > > > change-id: 20261012-stmmac-mqprio-cbs-combo-341f12749ce2
> > > >=20
> > > > Best regards,
> > > > --=20
> > > > Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > > >=20
> > >=20
> > > /Daniel
>=20
>=20

--N9isKUosey8taFli
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas4jDQAKCRA6cBh0uS2t
rCkRAP45m7SIjwOdxBQYPN15+CQ4puHY3w4+MjjuXw34i24K6AD8DaivhbgUtFls
WzPW9+mrIyv8adf5/ND4CeqMcwXH4Q8=
=HtK7
-----END PGP SIGNATURE-----

--N9isKUosey8taFli--

