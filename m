Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627D3C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 21:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYtMlpnTVCZyNNpnFLfBSqH0ZRU4U9gizBDSOdoTsHk=; b=NwqF1bDOAlaHUGCi8yTuHUr/a+
	KL5exsTMGedRh67nf2GptntOx4Qeq/PD92CUIDN4lKe8+1LOcq6dQ8foOf1zdvSO4ejdcCvhtzNpE
	upwbEcPTuThi2mxcbXmO5+wqFgNrwyrKiuiYILjgCsxRb3G8TffQfJArmZ+yXZw+LEOzcAlc/pc1a
	zhmyaDpFpNzbOLajBVVRS+rxd2nfuCyYtOKLoTNo2HeOGe9j2ftsqVZBnIayZH/Y3l+8b2ZUBMZ3T
	nSwPG9kG6p7bSeeeEnAC6WppZV0jYAkFrpn1GYFvVbNS4T3F8Uvr0bvkynxQd4mCu+LPosC0uD8pC
	AyLMC6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1sOO-0000000FvlB-3Cf5;
	Wed, 02 Sep 2026 21:21:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1sOL-0000000Fvkm-3HMu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 21:21:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH3JN1898969
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 21:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SYtMlpnTVCZyNNpnFLfBSqH0
	ZRU4U9gizBDSOdoTsHk=; b=JouUdMFvzbWUx1dqVnfs1+3hNYj0jcaY/IFsaE3/
	TydRPBETuj3H691I9W/E/IUtI8odJ972Q7e2JY4qhNCDJ/gA0Adop1aeWqkJZUzu
	6/J3vy0ZZ5qkvciYOqMhIKtybnIwnkRBHtBlKpsFJeGLvaDi2TMnDrBIENoRVDkH
	dOwU002UwlnCBucTuvI7XzNh/+0T2qxzjNxoqNwQD986a6XqX2JzNLvQUc7olSKI
	BdYZZJhuJyxXwXne5dqJb/sCQSUxjELweBGwqOZmdyoXhtS9EC6CYJu8l3aubUlL
	ZHzuY9+l3DRx/UqVeA9EXiifVxygc7rRiEQvdk56DCdsPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb028ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 21:21:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so406538785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 14:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788384068; x=1788988868; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SYtMlpnTVCZyNNpnFLfBSqH0ZRU4U9gizBDSOdoTsHk=;
        b=ZGUam1hm8c/9mL6dB/6Em+PJ827EUEcNMtKCvX5t+PhRFII0IBs4OAAjQlhvWE+DXK
         G7AXMSIArj9qLn8W5WvU5pH+DS9iwH2/lmRtHuOFymtE1q5a0xyjYmyVbpaJRXyGt6HZ
         bNcLEHFcAsvIWpvu0BxlEiCFscQOdC6Hb8NkA1H7WjILgpaTgzO8VSkp5d3RJbSasKem
         7wrpmboSkPjRmY4hi72Zf2TDyOxnsCNNhjMPN2gUjwM9xZQJrX0Shqu7ieLldyHDLRMw
         WSnjXTd4HiEULUKOsT9tSRdxveT7/51OdM83DS5xNALJ/bvcXtwG8k/OGkXz9n+dM2sh
         GshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788384068; x=1788988868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYtMlpnTVCZyNNpnFLfBSqH0ZRU4U9gizBDSOdoTsHk=;
        b=r+2DJpTjBF8reOb0Fg60FQ8/PVwail11Z8d/v+3Nz2egd8v+Y3Sdf8+VIUBT/bznus
         fT33ypXzOfsnWX9+0JT+OFv/aKFvACWSyhNuyTX/4IdjO2oyc7QzRtVlnhjDxMfIpXa+
         6vjT9wcx8cvzrr+IdPCeePamyOTpIrHXPj0HWRIb05XIZ3k8DXP8GiYMl5U3Nq7pOnqX
         LM8KRzm0iu/jTLTJXPXiCsTBuy0VQdU33bDBuQBKJI9T3EyD1sb3c32O3UoDbMoUFZ7p
         QazCqlGhl+dRZP9bKcITxyqij0tK8Nd/iktrqunwaHyfj1DPe0b+gEQxUqJdYHY/Ro8Y
         E++w==
X-Forwarded-Encrypted: i=1; AKwUvBwcbx5U0tOiGAI3UlBJ5ws2zRQxkE+denB+VgTjHWsD2smtlurZyi6JNE2NbNV8CC5+OL6esbu8YByqjL9vuNq6@lists.infradead.org
X-Gm-Message-State: AFuF++lXF3Db8g8yLK8ul/alUx5aV1wHAaqjPlL0aCEgp+Mg8UdPsuqJ
	7J9nNl1L1OFZROptgEhwmb0CQn0bzU+CkLm6yFUZuhCZ6zNI14wBwmwTF/Ra6N6Y+J9fDHNpEb7
	Sq1oMGhIh/1nLLHovBy0FiRKXpZ55Etk2LnUXw8kBIDc0Wr+t6P1mVqDiOGkVnuKwkw9jEbmsql
	dbgg==
X-Gm-Gg: AYBFou3jf+AeZ954vZp7pwvBXCkRyu9SmkKJhFYvikii8FHSglvWiLNNt46fy5peWDp
	spZYu379n71rXb0mojivwWHFFjoLetfDUpW/mUWsjx1veZEG3iyUCM6xf9sfmhqytGAuDkVc/08
	CqxKXcxH8ZXL2NGvIekxsKbY3BDiJptJieNnDFoiwP2E9LIch3n4S9z2UhZ7WA2+jp2i+g8CGJe
	r0zMZ/ttblrU66sDpCssJfqs3uY/mqparQQ9mbYEMd1GB7YGxXN4jQDXiznxy0OsPWuLBVSB+wc
	DRgnEyIn3AGaxsIPbNyBMxLBydfspYImNF1J47YFc0yyV5CxQrY9SvWHgvSz/zOvr6udkK6CXG6
	OmG6aQl4HfuOtMg==
X-Received: by 2002:a05:620a:6982:b0:937:27fb:96f3 with SMTP id af79cd13be357-93960e05532mr1120929685a.17.1788384067630;
        Wed, 02 Sep 2026 14:21:07 -0700 (PDT)
X-Received: by 2002:a05:620a:6982:b0:937:27fb:96f3 with SMTP id af79cd13be357-93960e05532mr1120916885a.17.1788384066801;
        Wed, 02 Sep 2026 14:21:06 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeae34sm9438269f8f.32.2026.09.02.14.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:21:05 -0700 (PDT)
Date: Wed, 2 Sep 2026 23:21:04 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [net-next,v3] net: stmmac: drop the queue-0 pinning for GSO
 frames
Message-ID: <apiTQN_MTy9fbMSB@lore-desk>
References: <20260831-stmmac_select_queue-tso-fix-v3-1-d9c215fe7a85@oss.qualcomm.com>
 <178837492226.3394541.13110256562881802796@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9jHsxYCOqOIPICRS"
Content-Disposition: inline
In-Reply-To: <178837492226.3394541.13110256562881802796@kernel.org>
X-Proofpoint-ORIG-GUID: zilAjDbEPbBHR2gseul3hmOi8Qe--zq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4OCBTYWx0ZWRfX6exvr9W4ZiVx
 cfYICHMo5SslGQQL1R7vikA1Zfgjtqbeg8LLVfAfdCHXR0k186/0iO+4kh4OSE4x8cJSCdP3ZIv
 SNglT6yd7u1Pgnjrj7+SRONa+OfmTKze+M8rM7+hMj1cz+xrUkbp+qidPta0qx/yyQ6/sQ0oJx9
 FhE+iKOpzwiQeaRXoDZSrF/0FcUAUjKajIwfa9Bg7cbJ6IrRBElvh0fXXOFyvqCqQ2TXWBPpZUy
 z8NRdnz4Ft/pak+CtCXXz8Z9Ximn8rFPy6tlx7XcocZXwBxEppeupNw+8+wxgWtyR7E7lXIHzu+
 67D2laRcRzL+OHKI77F8iRLw9bdlyv2TMpkjJpJewIwwdFNWlh7mhz/hwK6ncmjXq2BOrfkKe+e
 d/GDn+Pk8ZmJDjCbKIHu/2bQ8oGEmwmz+VM7ll5XtQv56mrb7vAxpahElfFjw3NV786STSO3Oeq
 w+8bVkEUApwgVOIf8gQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4OCBTYWx0ZWRfXzUIMyQUhuY1/
 p1/QPr4Vvi7ZYaZ/c3xTY8dNO1DEQOME4FcZpJnRebLY8/47Dp7/da4EfrXWcX1BcxaJdoVJS0r
 GDF6v5tfGv2fyFb6tTkJVbyZMw2/cJ8=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a989345 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9R54UkLUAAAA:8 a=kh2Xnvg0e9x1CB174FoA:9 a=QEXdDO2ut3YA:10
 a=ZJvtu0cxrLrnXHhDaDcA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-GUID: zilAjDbEPbBHR2gseul3hmOi8Qe--zq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_142109_850622_743EE276 
X-CRM114-Status: GOOD (  45.50  )
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

--9jHsxYCOqOIPICRS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider:
>=20
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 2 =C2=B7 Low: 1
>=20
> - [High] Removing .ndo_select_queue silently disables hardware TSO/USO
>   for most GSO flows on all in-tree stmmac platforms that mark every TX=
=E2=80=A6
> - [Medium] The patch's stated safety property =E2=80=94 'stmmac_features_=
check()
>   already validates each GSO frame against the capabilities of the queue=
=E2=80=A6
> - [Medium] The patch deletes the hardware fact that the removed comment
>   carried ('There is no way to determine the number of TSO/USO capable=E2=
=80=A6
> - [Low] The commit claims to fix a real user-visible offload defect
>   ('This also fixes the case where queue 0 is not TSO-capable while=E2=80=
=A6
>=20
> --
>=20
> net: stmmac: drop the queue-0 pinning for GSO frames
>=20
> This drops stmmac_select_queue() and its .ndo_select_queue entry so GSO
> frames are no longer pinned to TX queue 0. The changelog argues the pinni=
ng
> is redundant because stmmac_features_check() already validates each GSO
> frame against the capabilities of the queue it is mapped to. Non-GSO
> traffic keeps going through netdev_pick_tx().
>=20
> Link: https://lore.kernel.org/r/20260808-stmmac_select_queue-tso-fix-v2-1=
-67175b29772e@oss.qualcomm.com
> Link: https://lore.kernel.org/r/20260807-stmmac_select_queue-tso-fix-v1-1=
-4c4787bad02b@oss.qualcomm.com
>=20
> >From the changelog:
>=20
> > This also fixes the case where queue 0 is not TSO-capable while other
> > queues are, which previously forced all TSO traffic into software GSO.
>=20
> [Severity: Low]
> Since this is described as a fix, should it carry a Fixes tag? The queue-0
> pinning being removed came in with commit 4993e5b37e8b ("net: stmmac:
> Re-work the queue selection for TSO packets"), which in turn fixed
> c5acdbee22a1 ("net: stmmac: Send TSO packets always from Queue 0").
>=20
> The removal also depends on the per-queue checks in
> stmmac_features_check() added by commit b55dfb173ce8 ("net: stmmac: move
> check for hardware checksum supported") and the surrounding series. Witho=
ut
> those, backporting this alone removes the only thing that steered GSO
> frames to a capable queue.
>=20
> Could the changelog name those prerequisites so stable triage has
> something to work from?
>=20
> The claimed defect itself looks describable from DT, via
> stmmac_mtl_setup():
>=20
> 	plat->tx_queues_cfg[queue].coe_unsupported =3D
> 		of_property_read_bool(q_node, "snps,coe-unsupported");
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 66ae365e1c89f..25121d6d84995 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -6428,24 +6428,6 @@ static int stmmac_setup_tc(struct net_device *nd=
ev, enum tc_setup_type type,
> >  	}
> >  }
> > =20
> > -static u16 stmmac_select_queue(struct net_device *dev, struct sk_buff =
*skb,
> > -			       struct net_device *sb_dev)
> > -{
> > -	int gso =3D skb_shinfo(skb)->gso_type;
> > -
> > -	if (gso & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6 | SKB_GSO_UDP_L4)) {
> > -		/*
> > -		 * There is no way to determine the number of TSO/USO
> > -		 * capable Queues. Let's use always the Queue 0
> > -		 * because if TSO/USO is supported then at least this
> > -		 * one will be capable.
> > -		 */
> > -		return 0;
> > -	}
>=20
> [Severity: High]
> Does this lose hardware TSO/USO for most GSO flows on the in-tree
> platforms that mark every TX queue above queue 0 as TBS?
>=20
> dwmac-intel.c, dwmac-imx.c, dwmac-mediatek.c, dwmac-qcom-ethqos.c and
> stmmac_pci.c all do the equivalent of intel_mgbe_common_data():
>=20
> 	/* Default TX Q0 to use TSO and rest TXQ for TBS */
> 	if (i > 0)
> 		plat->tx_queues_cfg[i].tbs_en =3D 1;
>=20
> That becomes STMMAC_TBS_AVAIL at open time in __stmmac_setup_dma_desc(),
> with no ETF qdisc involved:
>=20
> 	int tbs_en =3D priv->plat->tx_queues_cfg[chan].tbs_en;
>=20
> 	/* Setup per-TXQ tbs flag before TX descriptor alloc */
> 	tx_q->tbs |=3D tbs_en ? STMMAC_TBS_AVAIL : 0;
>=20
> and stmmac_tso_channel_permitted() then returns false for those channels:
>=20
> 	/* TSO and TBS cannot co-exist */
> 	return !(priv->dma_conf.tx_queue[chan].tbs & STMMAC_TBS_AVAIL);
>=20
> The commit message says stmmac_features_check() "validates each GSO frame
> against the capabilities of the queue it is mapped to", but the check only
> demotes the frame, it does not move it:
>=20
> 	if (skb_is_gso(skb)) {
> 		if (!stmmac_tso_channel_permitted(priv, queue) ||
> 		    !stmmac_tso_valid_packet(skb))
> 			features &=3D ~NETIF_F_GSO_MASK;
>=20
> So with the selector gone, netdev_pick_tx() hashes GSO flows over all N
> queues and roughly (N-1)/N of TCP/UDP-GSO flows on these boards end up
> segmented in software by validate_xmit_skb() rather than by the MAC. Is
> that intended, and if so could the changelog mention the throughput and
> CPU cost instead of describing the change as removing something that is
> "no longer needed"?
>=20
> Would a capability-aware queue selection (or a per-queue TSO map consulted
> by the selector) be needed to keep the "Q0 is the TSO queue" contract tho=
se
> platforms document?

We agreed in the previous disucssion to allow the networking stack to decid=
e if
the selected queue should perform TSO running stmmac_features_check().
Moreover, there is no guarantee queue 0 will always support TSO for all the
platforms.

>=20
> > -
> > -	return netdev_pick_tx(dev, skb, NULL) % dev->real_num_tx_queues;
> > -}
> > -
>=20
> [Severity: Medium]
> The deleted comment records a hardware fact: there is no way to determine
> which TX DMA channels were synthesized with the TSO data path. DWMAC and
> XGMAC only expose a single global TSOEN bit, surfaced as
> priv->dma_cap.tsoen, and stmmac_hw_setup() programs TSE from it for every
> non-TBS channel without any readback:
>=20
> 	if (priv->dma_cap.tsoen && priv->plat->flags & STMMAC_FLAG_TSO_EN) {
> 		for (chan =3D 0; chan < tx_cnt; chan++) {
> 			if (!stmmac_tso_channel_permitted(priv, chan))
> 				continue;
>=20
> 			stmmac_enable_tso(priv, priv->ioaddr, 1, chan);
> 		}
> 	}
>=20
> stmmac_features_check() only knows about tx_queues_cfg[queue].coe_unsuppo=
rted
> and TBS, so on a part where only a subset of channels implement TSO it
> cannot clear NETIF_F_GSO_MASK, and stmmac_xmit() then hands the frame to
> stmmac_tso_xmit() on a channel whose DMA does not implement TSE. That
> programs an MSS context descriptor plus TDES3 in TSE/THL/payload-length
> form on a channel that decodes those bits as CIC and frame length.
>=20
> Is there evidence that all channels are TSO-capable on the supported part=
s?
> If not, would a per-queue tso capability consulted by
> stmmac_features_check() be the replacement for the removed workaround?

As pointed out above I guess it is up to the networking stack to decide if =
hw
TSO can be used or the traffic should be segmented in sw. I do not think al=
ways
use queue 0 for TSO is the right approach.

>=20
> >  static int stmmac_set_mac_address(struct net_device *ndev, void *addr)
> >  {
> >  	struct stmmac_priv *priv =3D netdev_priv(ndev);
> > @@ -7302,7 +7284,6 @@ static const struct net_device_ops stmmac_netdev_=
ops =3D {
> >  	.ndo_eth_ioctl =3D stmmac_ioctl,
> >  	.ndo_get_stats64 =3D stmmac_get_stats64,
> >  	.ndo_setup_tc =3D stmmac_setup_tc,
> > -	.ndo_select_queue =3D stmmac_select_queue,
>=20
> [Severity: Medium]
> Does the "features_check validates the queue it is mapped to" argument ho=
ld
> on the AF_PACKET PACKET_QDISC_BYPASS path? __dev_direct_xmit() runs the
> feature validation before assigning the real queue:
>=20
> net/core/dev.c:__dev_direct_xmit() {
> 	...
> 	skb =3D validate_xmit_skb_list(skb, dev, &again);
> 	if (skb !=3D orig_skb)
> 		goto drop;
>=20
> 	skb_set_queue_mapping(skb, queue_id);
> 	...
> }
>=20
> and with .ndo_select_queue gone, packet_pick_tx_queue() takes the else
> branch, so queue_id can be any queue:
>=20
> net/packet/af_packet.c:packet_pick_tx_queue() {
> 	...
> 	skb_record_rx_queue(skb, cpu % dev->real_num_tx_queues);
> 	if (ops->ndo_select_queue) {
> 		queue_index =3D ops->ndo_select_queue(dev, skb, NULL);
> 		queue_index =3D netdev_cap_txqueue(dev, queue_index);
> 	} else {
> 		queue_index =3D netdev_pick_tx(dev, skb, NULL);
> 	}
> 	...
> }
>=20
> The mapping stmmac_features_check() reads via skb_get_queue_mapping() is
> therefore (cpu % real_num_tx_queues) + 1, not queue_id. When the evaluated
> queue is TSO-permitted but the queue actually used is not, NETIF_F_GSO_MA=
SK
> survives and stmmac_xmit() dispatches unconditionally:
>=20
> 	if (skb_is_gso(skb))
> 		return stmmac_tso_xmit(skb, dev);
>=20
> Before this patch the same ordering existed but was harmless, because
> packet_pick_tx_queue() consulted ndo_select_queue and GSO frames always
> went out on queue 0. Is something needed to close that now?
>=20
> Separately, that mapping can be real_num_tx_queues itself when
> cpu % real_num_tx_queues =3D=3D real_num_tx_queues - 1. Can this read past
> priv->plat->tx_queues_cfg[] and priv->dma_conf.tx_queue[] in
> stmmac_features_check() when real_num_tx_queues =3D=3D MTL_MAX_TX_QUEUES?

I guess this issue was already present even before this patch (e.g. for non=
-TSO
traffic transmitted by a AF_PACKET socket where PACKET_QDISC_BYPASS is
enabled). I guess we should fix it with a dedicated patch (e.g. verifying
queue is never greater than MTL_MAX_TX_QUEUES in stmmac_features_check()).

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260831-stmmac_select_queue-tso-fix-v3-1-d9c215fe7a85%40oss.qualcomm.c=
om

--9jHsxYCOqOIPICRS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapiTQAAKCRA6cBh0uS2t
rIIVAP0a0Fhz/sKVZ2P09QB0lqSrGCT/eq3TpkJ4fcTGHBcpggD/XcFsHrENORZH
DSkHDXJbeUtuotkDXHxGvcahut8V1gI=
=mF4n
-----END PGP SIGNATURE-----

--9jHsxYCOqOIPICRS--

