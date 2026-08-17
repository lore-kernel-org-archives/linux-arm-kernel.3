Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3B4C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 21:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EscPOpDYNYn67TaC3QAFzk0j+ZR8OzOIR14DT/DHQiI=; b=z90iawYfgp3dtsfE8fgMyw4TB/
	dufK/cRBeAeaKCe5FNeC2VJLzwLpPfBo+aqVRlGIdMi3urwsTjtg78lPWW6nt4bE7OTq7hkfNgXs8
	JpwBqKOOGB8297rEGNT4u3sYzDrExPrrxK/Uh+ElxMMyWJVpsQljbYJxxpcfT1Mr5TnaFpxqokssc
	g8H1CaCpU4l+MTT9nHh0X4os1ycOlZ44IfunBO0OSEPhnHZiBo41CxKROQ4zNuZuoQxy9sEhLV/xy
	RbkS8E09MYBEP92DmEGZyz8nFg39N77Nnm1WLjaC5Nf/vuhlHyqzyxzVjB10K3nm4Ez0gJHq+q3xi
	KbZSjtPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4u3-00000006qTA-2M63;
	Mon, 17 Aug 2026 21:29:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4u0-00000006qSg-3qUn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 21:29:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HIR9RY2638294
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 21:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EscPOpDYNYn67TaC3QAFzk0j
	+ZR8OzOIR14DT/DHQiI=; b=kTUjMM/leo8pwUL1jF+Njy41T7P6BsXW2mGXDUZ7
	T5FY2ngkkzMbAhdsxPs4TDlAxrWSCs2gvQn6M2T8xdvyks3iPk0RteowWKDLYjFu
	kzQrjWqqE4eU0l8Dzb7HKq6D/0mI1Jw1SO7zRR/TNAzvW5F2brwJaHdrHqwVG1jQ
	ldO/Mc+2xuSxGrm4llWQxrhVQgCzaaFjeM5WxaNZixf8levtrA9G2+jIKfmEjdAp
	GtNGhbUOaqrnu9xD+BNwzZ2qA/KEe9vkuQj2bmd1Do3RtnsOlukPxVALno7RxXw7
	buc50QHTqYIZ3C/Qdb0mtzNrnpjzbPZYGMzQvQ16xb9F0Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7jyj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 21:29:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so44089255ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 14:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787002191; x=1787606991; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EscPOpDYNYn67TaC3QAFzk0j+ZR8OzOIR14DT/DHQiI=;
        b=eY86m20Nok6gGwR7jfsGhOjKu8FOrdTB3DuY435L31X3WqshDLd+H1qFOKXn3Xfe/1
         TBlzQU0DDuzakQXNW2ZiYiO/EptboS9SQWLY9Mh9ZQIia22RDFWopO6njdsy+Ytfx2OV
         L1gKe/iZG4O6cHj2fi6bS5WskE8MxzyKuHtn702Vv27MdzoQuXJzn9tCtQmeVsqovYuj
         cDtxcXvvNSxz7kd9IkLe9w1KBZyT3Ubux4S1CR93Qc9chHcOYnSapZHhizCG9vncz3vk
         P2vqkFPv3fRSlr8r02LO/ATtJFyoXisBsuPKnOLq91JKWOMNYkTE+ote7xW2KDcU5OBG
         /xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787002191; x=1787606991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EscPOpDYNYn67TaC3QAFzk0j+ZR8OzOIR14DT/DHQiI=;
        b=HveRqO8ptQbQb44DXCMPy+jmH8HxKSmubx1tOg+jkkZcUb6cyVDmh4Al2h7ZJXV4HS
         KK523purbrYFDxFMqLhB/Zs2cQmh/7kIgOaLXIsP1OcBqof4pqkShBAIhqXnEtnq9KWp
         Fc5WSMXY7wT+7Giy3Ulluib5xtNH/2h6lvzea9LD45EfPsvVUSy28fjUAk8uGWmsQjH6
         W89S5Fv30qjK50ngj7Vp48nuES4RFfKNuZVtslZG2vjr7quzjRJIm53nkzrGKX241T+a
         zl4g2GiuwCW58En/4L4rybA8rb+SpYMBK4zfDFh1CKUuTU6qc+bAakm1cjF41fmvAWBb
         8U3g==
X-Forwarded-Encrypted: i=1; AHgh+RoMrrC7rsk1p/osgcOZKfLxOTQqCbvEI/xfR657BMXPAKQ94uibOL5dHZcN51VZJB0O3w2HpIJhAjY7AdT4pL+9@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl7vsFH/48BzbfKxrWudq62QsjsWouHRZ81fN8MTQH8yJF5hTt
	aYiA2y1YIzPYqGePoFdC5PeB8csr3707brpoF6+1WK20NfDVgjooCJNlNRZ8Klk7YYvbmlbmtE5
	CDNbJ2RtFIHN67H1vEUPHNgiaNtNurz90yQDsLPm8GC3v3rltXc6EnINci1YfB8RlKLLu8oiEN8
	zkZw==
X-Gm-Gg: AR+sD11MUQzj4Q3gjQdKSbJwM2LMUEEVTOdJd0/BDfTuz/Z2c9D9oKc456PB295GxSS
	+XQ9c1aIRJE9ixTsvYxkPF/pa09fzaUUctM5ejLVFKNi6pnrA0W8pqwDa/oeSwtkALAWWJIjkzu
	F3HU4DA/3pb79YebgHp/JaYvLvcHMkRB50V3GUmXghyT5ZakBZE8l4QVnlFRHQ2hnzhvyuWLgkB
	CZdY2bX1tSkTlhN7UUNbB0EaW1GsrBubySFWEELl2h+BFTy7JQ2y1V3YLteZUa6Lfj9Z+YIMRrm
	//JFgzdVDn0AzfKvh4bZQ5he3dlQyvKqofcxcevHU1TVsUCwLYde081e3UkGV0XuX9MiExiRRNR
	CYFW0u2L57NKIrgKytSho
X-Received: by 2002:a05:6a20:d52c:b0:3cb:b3ea:858a with SMTP id adf61e73a8af0-3cc71ca23b6mr30949949637.20.1787002191251;
        Mon, 17 Aug 2026 14:29:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52c:b0:3cb:b3ea:858a with SMTP id adf61e73a8af0-3cc71ca23b6mr30949883637.20.1787002190645;
        Mon, 17 Aug 2026 14:29:50 -0700 (PDT)
Received: from localhost ([2605:59ca:800f:5110:246a:f60e:9bc5:ae0a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm11009602eec.13.2026.08.17.14.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:29:49 -0700 (PDT)
Date: Mon, 17 Aug 2026 23:29:48 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: stmmac: keep gso_enabled_types in sync with
 netdev features
Message-ID: <aoN9TM4BrnEXt8Qx@lore-qca>
References: <20260812-stmmac-fix-tso6-features-v2-1-72c3b06eb8d4@oss.qualcomm.com>
 <20260817131416.409fc7fc@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gLgKYaYlMyj7cH5d"
Content-Disposition: inline
In-Reply-To: <20260817131416.409fc7fc@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDE2NCBTYWx0ZWRfX0rGn7IlgEy5A
 VLhKB6s0Sf+O2iDYm0AHaFCd1/4BYhRHlsMlsZMdj45SDRmn2QooBK5NiaYK/PDEXsGGhttjO9B
 WbUPfGNOuPJRnkE5SPGweiw6LdcQZbs=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a837d50 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PHq6YzTAAAAA:8
 a=pYFe1_jzmwtMJlaTMGcA:9 a=CjuIK1q_8ugA:10 a=xjuSOcxbN7U8p7k89moA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: 9ZmoCtQMBeDoFHQaRqwBL66bDSqbJUX2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDE2NCBTYWx0ZWRfX+y1u122gySnC
 A/pe7bIVNphuMLetG6pkKYiCYIrIAczsDC5tK/ggSezvvi2eJ0HRUAzYjqHiuXg7ILqhpoNv8lH
 BVzOeHrUWCM9GySHUG7jZ9QJ2SS3vLGnMtEqx/Su/R91zwN84SGpEko6dH/FqnkXj0ROB6cRR3t
 u8RT8jd7EDzuYB3GbomU7vIiOJmIKyXWPJTAeSAtLBBJkj3/IhyTOwdcqWYiWvWiHXIsrZxazEX
 AO/yykvb+nz8JO7DDSXZJ6T0hUnCELcGoyyl9V3WLF424CZ0vf3QnZiynVFGUwidOJf0jV5MwF/
 sYtpOJRb6mhIfEJH1Px9EO+CTRePpJKSdYRixKSwUUIqsmtYOiuj4absIBcPLJ95jo/6+p/WojP
 va9W2RrhJcEQzHpjcomjYjCL7wfjE0cJt07suv6i51Q2jEeFSf610mRp34iI3CPmqB8vVribWOB
 acFL0jSyRipApvK448g==
X-Proofpoint-ORIG-GUID: 9ZmoCtQMBeDoFHQaRqwBL66bDSqbJUX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_142952_963416_2DDA48D7 
X-CRM114-Status: GOOD (  39.10  )
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

--gLgKYaYlMyj7cH5d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, 12 Aug 2026 06:38:13 +0200 Lorenzo Bianconi wrote:
> > stmmac_set_gso_types() derives priv->gso_enabled_types all-or-nothing
> > from NETIF_F_TSO, but stmmac_set_gso_features() advertises NETIF_F_TSO,
> > NETIF_F_TSO6 and (on GMAC4) NETIF_F_GSO_UDP_L4 as independently
> > toggleable features. Since netdev_fix_features() only ties TSO6 to the
> > checksum features, disabling TSO (ethtool -K ethX tx-tcp-segmentation
> > off) leaves TSO6 enabled in dev->features while gso_enabled_types
> > becomes 0.
> >=20
> > For a TCPv6 GSO skb the stack then keeps the frame unsegmented
> > (NETIF_F_TSO6 is still set), stmmac_features_check() does not clear the
> > GSO mask, and the stmmac_xmit() gate (gso_type & gso_enabled_types) is
> > false, so the multi-MSS skb is transmitted through the ordinary
> > descriptor path as a single oversized frame.
> >=20
> > Derive each GSO type from its own feature bit instead, so the mask stays
> > in sync with dev->features and TCPv6 (or UDP L4 on GMAC4) segmentation
> > keeps working when only TSO is disabled.
> >=20
> > Fixes: 9edfa7dab811 ("net: stmmac: enable TSO for IPv6")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Fix possible race between stmmac_set_gso_types() and stmmac_xmit().
> > - Fix fixes tag.
> > - Link to v1: https://lore.kernel.org/r/20260808-stmmac-fix-tso6-featur=
es-v1-1-f82b17595052@oss.qualcomm.com
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 28 +++++++++++++--=
--------
> >  1 file changed, 16 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index a71f0df26378..df3549f55741 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -4371,16 +4371,20 @@ static void stmmac_flush_tx_descriptors(struct =
stmmac_priv *priv, int queue)
> >  	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, tx_q->cur_tx);
> >  }
> > =20
> > -static void stmmac_set_gso_types(struct stmmac_priv *priv, bool tso)
> > +static void stmmac_set_gso_types(struct stmmac_priv *priv,
> > +				 netdev_features_t features)
> >  {
> > -	if (!tso) {
> > -		priv->gso_enabled_types =3D 0;
> > -	} else {
> > -		/* Manage oversized TCP frames for GMAC4 device */
> > -		priv->gso_enabled_types =3D SKB_GSO_TCPV4 | SKB_GSO_TCPV6;
> > -		if (priv->plat->core_type =3D=3D DWMAC_CORE_GMAC4)
> > -			priv->gso_enabled_types |=3D SKB_GSO_UDP_L4;
> > -	}
> > +	unsigned int gso_types =3D 0;
> > +
> > +	if (features & NETIF_F_TSO)
> > +		gso_types |=3D SKB_GSO_TCPV4;
> > +	if (features & NETIF_F_TSO6)
> > +		gso_types |=3D SKB_GSO_TCPV6;
> > +	/* Manage oversized UDP frames for GMAC4 devices */
> > +	if (features & NETIF_F_GSO_UDP_L4)
> > +		gso_types |=3D SKB_GSO_UDP_L4;
> > +
> > +	WRITE_ONCE(priv->gso_enabled_types, gso_types);
> >  }
> > =20
> >  static void stmmac_set_gso_features(struct net_device *ndev)
> > @@ -4416,7 +4420,7 @@ static void stmmac_set_gso_features(struct net_de=
vice *ndev)
> >  	if (priv->plat->core_type =3D=3D DWMAC_CORE_GMAC4)
> >  		ndev->hw_features |=3D NETIF_F_GSO_UDP_L4;
> > =20
> > -	stmmac_set_gso_types(priv, true);
> > +	stmmac_set_gso_types(priv, ndev->hw_features);
> > =20
> >  	dev_info(priv->device, "TSO feature enabled\n");
> >  }
> > @@ -4766,7 +4770,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *sk=
b, struct net_device *dev)
> >  		stmmac_stop_sw_lpi(priv);
> > =20
> >  	if (skb_is_gso(skb) &&
> > -	    skb_shinfo(skb)->gso_type & priv->gso_enabled_types)
> > +	    (skb_shinfo(skb)->gso_type & READ_ONCE(priv->gso_enabled_types)))
>=20
> Maybe I'm missing something but I don't see any device configuration
> based on gso_enabled_types. Why does this mask exist in the first place?

gso_enabled_types field has been intrdocued in the following commit:

commit 2e4082e4b739191d71e03fe6c55cec68d36f67fe
Author: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Date:   Wed Apr 1 08:21:55 2026 +0100

    net: stmmac: simplify GSO/TSO test in stmmac_xmit()
   =20
    The test in stmmac_xmit() to see whether we should pass the skbuff to
    stmmac_tso_xmit() is more complex than it needs to be. This test can
    be simplified by storing the mask of GSO types that we will pass, and
    setting it according to the enabled features.
   =20
    Note that "tso" is a mis-nomer since commit b776620651a1 ("net:
    stmmac: Implement UDP Segmentation Offload"). Also note that this
    commit controls both via the TSO feature. We preserve this behaviour
    in this commit.
   =20
    Also, this commit unconditionally accessed skb_shinfo(skb)->gso_type
    for all frames, even when skb_is_gso() was false. This access is
    eliminated.

>=20
> Right now AFAICT packets which miss the mask check get chucked on the
> wire as one giant frame, without segmentation.
>=20
> Can we just delete gso_enabled_types completely? Stack should obey the
> features for future frames, and avoiding races here may be hard.

I agree we can just remove gso_enabled_types field since if the user disabl=
es
TSO or UDP GSO, the driver will receive segmented packets for particular
traffic (the segmentation logic is managed by the stack). I think it is eno=
ugh
to gate packets for stmmac_tso_xmit() using skb_is_gso() check.
I will fix it in v3.

Regards,
Lorenzo

>=20
> >  		return stmmac_tso_xmit(skb, dev);
> > =20
> >  	if (priv->est && priv->est->enable &&
> > @@ -6198,7 +6202,7 @@ static int stmmac_set_features(struct net_device =
*netdev,
> >  			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
> >  	}
> > =20
> > -	stmmac_set_gso_types(priv, features & NETIF_F_TSO);
> > +	stmmac_set_gso_types(priv, features);
> > =20
> >  	if (features & NETIF_F_HW_VLAN_CTAG_RX)
> >  		priv->hw->hw_vlan_en =3D true;
> --=20
> pw-bot: cr

--gLgKYaYlMyj7cH5d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaoN9TAAKCRA6cBh0uS2t
rOloAQCVbuBB852UJgcGmrzlPkDB1pdYSHB+9WosXCXnz09j5AEAvL4j7ZI662Ma
1F7w7Q4Xwm1FEGMh3ebu5KEKNvqDZQw=
=rpY+
-----END PGP SIGNATURE-----

--gLgKYaYlMyj7cH5d--

