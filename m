Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D9BCA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 20:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ui4j5yz4g/dtRXMgKLud1I1DvziHiRoVyUoK39Y/Zc=; b=WgKxF+DJyUUbj3QOjz7Q6K4jUm
	XGBp0hiSDvRKwjgc1PcTfD8CX02sT6NDssTtvXW/fk8efvee1qglz6BEt9HUzBAB7jtDR5qVcmPV7
	f8rUcRNktOyqrHx2k+W5I+RyicuRRYd3yTr7Ka/iVfGuKrwSh3xy9NzshmQ1jDJL54lliRA/vrH5d
	3kF2pogVB0+dq+aBYA4ri6hUByV50J45W9MrIht843zMrGs0mVk5pz5a4bF1LLemNznJn45bRR/oF
	nuwvHSKTFdDEw53IP+39oiubrliXh+ceJ0f4GEW7D3EplmLbVsgji48nC+/9c0PbYpvh5ZPY7aQRX
	dbieGEOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMvf-0000000BUyn-49tG;
	Mon, 12 Oct 2026 20:47:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMva-0000000BUy1-0ALw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 20:47:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJN0R21779153
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 20:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9ui4j5yz4g/dtRXMgKLud1I1
	DvziHiRoVyUoK39Y/Zc=; b=EX45kSNRSaYQtkyMnaXXe8ey+pfV9qDzQ+gww7g1
	zxp7/sIks3/O1C3cWygmAWJ+ZqJY+JgsZlqWfU7oWk+CduN6mh5jCEljRfbzcLNn
	9hZ5IdEqu2YuJe0BhaX6aKExUoC9d4+ACYNVIS5twZ3mhPuKu3iLUOrFOq3iwguq
	SsdIvgqGxW6ynwnkKMZ7ouGtD5t3jlzwFoPO5xEA4m8xVoqhOrJ3UE67M5c3w/Nn
	hqXsaac86FlJtzA7qYBfmbsfk5OS4o8eYU8y39ldiQKNJfJ4hfHTKcD9PgIn8fkr
	d3a8ak/QL10bcjayLiaXXXlU2S1nz/Mdgbk2aGZgxjJBVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfctqyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 20:47:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so460824385a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 13:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791838040; x=1792442840; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ui4j5yz4g/dtRXMgKLud1I1DvziHiRoVyUoK39Y/Zc=;
        b=R0ku905L0Oo8CZSGI9B0us0guP6G8AH1Dx/0p99i8F8+EPJ2P2M5SBLsS5ZnrYpFML
         +2FxowqhH90Ye3f0qK1q17bDFCV86pF5bl0/HN+agfqNIf/YGJWvUq6943g9BszwD03T
         MOL2Yj4xF9/y2tkX9J3O68LrzjLvphVhEyXCiGBlZ9loCUZNKWfHFtCTuTUsGdckYJWR
         IT7MldkzrXRKlRJuevjPKWfUk0L6xmPzuown3zgSNITaRz8FEI62qvIkaUop5U+6mvpX
         vVPITpFdJjIKb4bBHzRwktANtvoKzRUNlIobKK2ZsPifnMPGle3HPvQTPmSaKkw0+T/X
         iHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791838040; x=1792442840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ui4j5yz4g/dtRXMgKLud1I1DvziHiRoVyUoK39Y/Zc=;
        b=MlKHgqaja36JO1EmZDE2fw+g6Hlk/RO/D5noi1DVhUHnWS/rHPcaTiJkgZdgGXDcWR
         jUZuUpmyhyyqYRLYxJPMP3ZnzqMkqAN6kXpnWGqe1LbBx5MDJQwvxRDU2+JeJmZWPuCQ
         uxe17BaTjyGrNHtW4cOGOGnhGYTXAZhUQo1/X27KXXPjG30yLsENCZH936hxpn9ZjPcA
         Io+fY/DQAbADW1SWMid/lveT/zZL2PDFq6bvStuB/ONrHt0Fxh/w8T07lzyPiheyQy2Y
         +sOz/x6ZaEprsNSk5sliungUfzbl30ncTNPwFeYG/ukRmdf2PyiZlhP0ey8qfaZp7t7a
         V/sw==
X-Forwarded-Encrypted: i=1; AKwUvBxjAwqmeDA2zF2lcjScN8xssMF8pc11zjNMfbqUhOsctQNI8WmCkietsMDBiz6CVHtglZCJzB6LjmR6C6XUfIHB@lists.infradead.org
X-Gm-Message-State: AFq9FYJztcZcXCOi2JjQmZw96CxvZJeIS76qSuSp/8wfoVF8tvIba/1F
	wg88BMSAFP8qmOAwUJ/fdRCZXfhHk7mNHvMFSAvKzTeIsX+K1wUncHDLqAB1a5MNgoXWBp4Ewqy
	8DcSIAIopDFc0LKcffcOM5x0uffRxewbliUcHWXZ1DQ9PJh9kyBHZ4S1lLSXxGk6jEe5qStI/8Q
	V4yw==
X-Gm-Gg: AYBFou2yHyUJ0OQHN4BRQBuhyz+jknNtGnp+zc+vumHpwDlNnPoRcIwzLw9yZ5gC3FZ
	RMVx7oXdK68cfnJ8FfxRfx40/yLZkV26wD6VU/VEAOkM6JRUWeus2L4lqLV09Xw8QlH+iCestT+
	C+HioAQ8AFHz3bF/eCiFqfAWTB4bnRP8l2SVpqDINWfQ5yyjNe92Tu0NnTPuHwpBYk6QKhvE4zA
	e+CKYuUaVfib42LzZXw9/ds5Dqt/sn1QNjvDgdLascacnZ5M6Eo2jFNDsQAyqR85rtISQ2uLJx2
	Mizq+m2s5YS4mKoPGKZJqak4FGJepmNCBpdNi/TNVkJ8n5BVz0JllrmqapeZRzUmIgtpSdiypXH
	q/LxsATZJ3HYm7Q==
X-Received: by 2002:a05:620a:270d:b0:93b:d79a:c462 with SMTP id af79cd13be357-93ebd26b606mr1757755385a.58.1791838040331;
        Mon, 12 Oct 2026 13:47:20 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93b:d79a:c462 with SMTP id af79cd13be357-93ebd26b606mr1757752685a.58.1791838039787;
        Mon, 12 Oct 2026 13:47:19 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6b82sm1192371f8f.51.2026.10.12.13.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:47:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 22:47:17 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] net: stmmac: fix XDP TX DMA address for
 compound RX pages
Message-ID: <as1HVdDa4yN4yp11@lore-desk>
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
 <20261012-stmmac-xdp-tx-pre-fixes-v1-1-05fd0c90f7e1@oss.qualcomm.com>
 <20261012194317.o642ym7ddsmny25x@DEN-DL-M70577.microsemi.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OnyHBvnZ49WjZumz"
Content-Disposition: inline
In-Reply-To: <20261012194317.o642ym7ddsmny25x@DEN-DL-M70577.microsemi.net>
X-Proofpoint-GUID: oYyyABFa-4cenvGbOFEv5LNEPXXzk8xy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA4MiBTYWx0ZWRfX7Bz/RuPErdZI
 qR/2tDHLzC02Sx6UPQs0nEu6TuJYZmhTqCL6Tptyi/3Jc6O7KcBSjqLmBm/NRsar9P4+b5BnRDy
 8calT/YgqLGwgQ+twCbTXf6q2Kb0VTI=
X-Proofpoint-ORIG-GUID: oYyyABFa-4cenvGbOFEv5LNEPXXzk8xy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA4MiBTYWx0ZWRfXwI4Hke6WZohd
 0usbFkDIZ4yeGaoQ2VKRW7zWzcLhlZuaT8leGIY6gq7mA/usnWI4CMSUv5G+dKBL6IcFOZ8jL7k
 ogV71pCMze+//FbnvlLtau7nFiP8AqNz7IwesPElYLCqkzH4dRTKDLHlMrrUd0Cm6BFX5c1pZGa
 pomcZ/wl7BKk99KwMJn/XMNgiHrGQl45YQGiwuM6ohFe/cnUIoyO2kd9ayw6fZMUET375Ya+DBY
 BRIH17f7Fd1FaLJdNkxo9dX4zWSs6VAKZ6M9iz79c57S2NCrhB7eMDVYAJTozBLd9CAfzpbYfgf
 p4LoZ9q0yqtCMvQ5PwqCtrHHRZMK/J5xChIE2L8etjhXG8ratoJLfCqqhz1JjfLsebCT/E5IMLe
 dHRjLxJSNZ5Vj0Au45/tkdI0f1L8SXeUSilZWNVDwA0Y0VYrMUkNARjUfCd0Yjms11fWXHQDJTd
 AGWviv1zXx/A/hmILhA==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acd4759 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Q9ur2bmSGazcmIiCI3kA:9 a=CjuIK1q_8ugA:10 a=Lm50YIOymODnlXrnE8UA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_134722_091343_BE34528E 
X-CRM114-Status: GOOD (  34.03  )
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

--OnyHBvnZ49WjZumz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,

Hi Daniel,

>=20
> > When RX buffers are compound pages (order > 0), only the head page
> > carries the DMA address programmed by the page pool
> > (page_pool_get_dma_addr()). stmmac_xdp_xmit_xdpf() computed the head
> > buffer's bus address from the page that happens to contain the data:
> >=20
> > 	page =3D frag ? skb_frag_page(frag)
> > 		    : virt_to_page(xdpf->data);
> > 	dma_addr =3D page_pool_get_dma_addr(page);
> > 	...
> >=20
> > RX pages become compound as soon as dma_buf_sz needs more than one page
> > (pp_params.order =3D order_base_2(num_pages) > 0), which happens from an
> > MTU around 3000 bytes once dma_buf_sz reaches 4096. If an XDP program
> > moves the data forward with bpf_xdp_adjust_head() by more than about a
> > page, xdpf->data points into a tail page whose struct page has no DMA
> > address: page_pool_get_dma_addr() then returns a bogus bus address, and
> > dma_sync_single_for_device() together with the TX descriptor transmit
> > from the wrong location.
>=20
> Looks to me like mtu > ETH_DATA_LAN is rejected when setting a prog, and =
also
> on mtu change when a prog is attached. So can this even happen today?

yes, these issues are real but at the moment we can't trigger them since we
have the MTU limitation in stmmac_change_mtu()/stmmac_xdp_set_prog().
These are preliminary fixes in order to remove this limitation.
There is a leftover issue we still need to fix about jumbo frames in
stmmac_xdp_xmit_xdpf().

Regards,
Lorenzo

>=20
> >=20
> > Use virt_to_head_page() to read the DMA base of the buffer and keep the
> > offset relative to the head page (sizeof(*xdpf) + xdpf->headroom), which
> > is correct no matter which page the data ends up in.
>=20
> I think the fix looks correct.
>=20
> >=20
> > Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index b8b4de4c5b1a..ca61ab449e32 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5301,7 +5301,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_pri=
v *priv, int queue,
> >  			struct page *page;
> > =20
> >  			page =3D frag ? skb_frag_page(frag)
> > -				    : virt_to_page(xdpf->data);
> > +				    : virt_to_head_page(xdpf->data);
> >  			dma_addr =3D page_pool_get_dma_addr(page);
> >  			if (frag)
> >  				dma_addr +=3D skb_frag_off(frag);
> >=20
> > --=20
> > 2.56.0
> >=20
>=20
> /Daniel

--OnyHBvnZ49WjZumz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas1HVQAKCRA6cBh0uS2t
rIgPAQCjz6dgW4WzgWlr9t4ttzrDaei6tXlT3nHR4akPNo83RAD+JXVPBbU0Xk0O
2ElGsVp8MPfiFKQMvS5xx31fZ8o3kgg=
=OIOM
-----END PGP SIGNATURE-----

--OnyHBvnZ49WjZumz--

