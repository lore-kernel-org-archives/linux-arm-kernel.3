Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C998C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 17:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeHaJe9Qao7AHi4F08K5E9v8rW7Bb0sStmKEtc/P+qE=; b=O00orggVWdZ3IVszMtB01IV5Th
	ZpssWdD/LjWpMogIR+ssTZk2uoNCwa1nHrdqTZyRua3PzjjkqY2MFKOLezw26f0wYvUuV5P2oJ91k
	9mRXOme6lA9rTH0Lk7pXDLWb3darvZlAT4fwneS/A81AscNx0PbFMM0zg7xzsDdGHCEdZPn1O2hpt
	9mJGGEi7iDTjeO3j/2jdyUaOUVFsTgfUF2lA0CQFiFqdRv0ph9P7vB8lhlAvIVaiDhQp1J6mAbPVr
	7gLWzUQ6jYCgvcV2oqBTUY9fOFDRr6ca9I/MvC3gM2rTcr9MLrNFzNM8/XYt9Zvj5ddHPToixWgHa
	UYlv0Vhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tCs-00000009qTz-2SoT;
	Wed, 16 Sep 2026 17:14:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tCp-00000009qTc-35eE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 17:14:01 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GGtIBu3402897
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DeHaJe9Qao7AHi4F08K5E9v8
	rW7Bb0sStmKEtc/P+qE=; b=SLAeiwu7Uwh3KtN5bkGk2pkL1bNJCqnYJJm+/bKM
	N02h/UGRZWasLth58wbhc9CM5/IvSvYxlF/OrdZb93lc6sBKujTDcOYv/FVDrq3n
	Kq6tcTOU8ycf7s8GBLkxkjbVa8XOnf2dJXe+RYbaHU+hJK6cdrd0XRZx/lzPbZye
	DJKAqz5FCxV5O299KWgTkwdNZ/XWNJeTjiZSvoPApkVNVwDIJqsKyo+MVX6l0VwV
	zeLSz0iavekN7QRt/U6aWL1dOhaeQKW4/3ssXePJqUmB9bz8IY6JdcwznpDgszI3
	Z6wPIjlCzqpHssgTD/0MlJnozWCVCrqvNw/5dhkof2zmTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d033a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:13:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a07b5b5efso436202185a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789578838; x=1790183638; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DeHaJe9Qao7AHi4F08K5E9v8rW7Bb0sStmKEtc/P+qE=;
        b=KftTW35nM5WnTnOCsWwpyv49Ron6/XnKDAelWeTwDzO+eC4+aePOA8Jj/OU0xzfFMh
         zcJCAnMe9moTHW17trXmR9MYxgw8vmChzQkLsxmNWq/JnI6XHOimzDtnfNqZLTJzft2L
         5EG8pU9kEZrhmnT/6kV6GBcYPvc48M01PWz4dZ/eDaEsIL/elcod7D7/75g/3Qs/Pp1Q
         nAhOdRphmIfUIDGYbZ5bFklDoOQewZR4PzDD2RSzl1IhpyQVAMjv4rgDpbxccSGS2llN
         7XZzirJi08AfCMnWE29cT8EDd+xD7YP8O6YIxkus6QxLqDGCBSIRoElHRSzrcVaqefrU
         nbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578838; x=1790183638;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeHaJe9Qao7AHi4F08K5E9v8rW7Bb0sStmKEtc/P+qE=;
        b=PcH9CUuhz6oR1JUcaTwNA+EY8zyH+5zG5lCVZmneQpw0LF0FdySKkBCM+uX28wIxsi
         /cPnD5ggkykzNtR/Asy7WpK/CBJ+5vZEmVuApant66AtEdwkS7HU/R2yo9KQdYWlK3O1
         iSctXluvAM2Om4ameLnSa3pDLXCQ06I6pM0IPFCG4KJEG+Vy4jdsWC7CDKYkQq1vwu/R
         icPSNB7eZH2OxnapB0mmI5ZtnZ+csaPlgw0Ql+QC0g0zCF39XTLHDXIC2UCzzeFjMgkp
         XNLoDa4njAeLWfbbdr/CTZ+QJa94VYKQO2A4gBmwKpF6vpqhsoNegeqc/wBJmNHX1LG3
         ATlA==
X-Forwarded-Encrypted: i=1; AKwUvBzWmOgo1whCCSJf0J2QPjRR1GmSdPlnT+ttrekfkbmDnGbB33w8uJ/ikp5SrDwCmTJnrUAtxL77KPDbMQq253Mw@lists.infradead.org
X-Gm-Message-State: AFuF++kHXvW7mY0zrWCKFUJzV0ApQAa8MzgO7+XrqIbUQ3esSd/jgSer
	G8Zn7PdKXchJI3HaUPospq01lPNBb8o08bpuVsBj7yiq6m+kYMBvyGo9LFo2sEODRG4NJg/+E8W
	SrjeaB/qqu0ZKZjPUB6xsXmYAmP7P9xJd+3AvGOjrjpO31pgObXY1KwHS2ayWztg5pA0OWeiE2j
	kIEA==
X-Gm-Gg: AYBFou0b/80oaMQQBR8pMraoFYwm2VxxryHozrbRdOQX5hUCNjwI8RAOffLukFtxoUO
	xJZ/rvv+gCvWKxolw4V5nbMppiyt0oWhuYd5x3H3W5O8jehHaBVIgfir/6LErwjdAPcRiqZb5Ao
	M+x4x1keobNUbFTBQCJEs5BYQKCiYVOUYc/FOBQq37Fv0A1SxBbTLSCxPULGAAwOrbHufS5/ATg
	wB0p7Cv4CUduRCKW6wiY+MK8MydlUfHMJwv6iWlnwqzP35Xl/3oNR3urUwUiUwjWaNfIB+DUCzz
	EI52bORlEfEgDp3f54wAgX9QsuD8RLaqaBgjFVZI5wkk/G0obv2umfEOFjbyX6SRdQH2I7trFER
	0lOOfVOJ4sQFka85gtUpbalvRCvoHPAhxXBMpUW3vZnxiLsT/iQ==
X-Received: by 2002:a05:620a:1789:b0:937:6f98:c68f with SMTP id af79cd13be357-93bc62405afmr61132385a.1.1789578837960;
        Wed, 16 Sep 2026 10:13:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1789:b0:937:6f98:c68f with SMTP id af79cd13be357-93bc62405afmr61126785a.1.1789578837460;
        Wed, 16 Sep 2026 10:13:57 -0700 (PDT)
Received: from localhost (mob-176-242-39-34.net.vodafone.it. [176.242.39.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7642sm7943207f8f.5.2026.09.16.10.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:13:56 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:12:56 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: fix rx Scatter-Gather support
Message-ID: <aqrOGKHuJ63wWd8y@lore-qca>
References: <20260916-stmmac-rx-sg-fix-v1-1-b49b7b8f725f@oss.qualcomm.com>
 <2ec95f84-2eaf-407f-8372-6f6e89eb1e3b@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Im3uIu74X4MILul3"
Content-Disposition: inline
In-Reply-To: <2ec95f84-2eaf-407f-8372-6f6e89eb1e3b@bootlin.com>
X-Proofpoint-ORIG-GUID: tImNCONicRNx5ASUSB_JMNlvpB6mkror
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzNSBTYWx0ZWRfX1a5XeKvrg8An
 xxvv+VdA0GLntiTdz77/bwkYx78aWAASVo3mErMIYKYo+lyS9dDDbz4iZAUWDBNlYryNcMimUul
 l0u7rq8307bRt6a8nDz3yzvqXFFtJyE=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aaace57 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=AQCpnuTwkiGt/6pP7chwVg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=a7vlQkQE84izC6u3-4sA:9 a=CjuIK1q_8ugA:10
 a=pPXggMpnJ1fGgHuoTg8A:9 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: tImNCONicRNx5ASUSB_JMNlvpB6mkror
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzNSBTYWx0ZWRfX6MioFTvsVJSr
 OVZY152UG/MbuXiIGBG8K4eVgyPegFREfau+xn/agTV0RhumDhKeaASaq2MZhY1rlGYEqoYpa2/
 eqTVnBAex81mL+QqzTb7rGd6Hu3GQE+yP6hwh17+JT1ZoIFXtdLYC/XCaV4m0ywYkMoCToGq2hm
 Z/0ntbIFDYAZry3ETsAogBflV15TvrfHTcw1fmzcnvdxdD8fiPDIVSaew8hwQscnMs39haMDjQp
 GWzVhyh/QGfZ1GuGYHRjxM25w2V0vTXQuTKbhLTNj4GAh01Cii/SfsBUJQYZALeJyMorojA6hP2
 LM/ILotuQhc95t7xuG6CAc7Y4H4hpGRQeMic0MTzudygijTQcOZVsOUfitrQQ/ihMuVIm7Zh/sQ
 I+Y8Lrb6QNr7i2VXy0aDVTq1c0eRNnFBSZWtqJG6NSY/12qdLSt5GGlOL8Rua3vzszs2i5I2QWb
 ASThgPi7r8d4cwQZdtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_101359_779379_D21B77D3 
X-CRM114-Status: GOOD (  44.52  )
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

--Im3uIu74X4MILul3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo

Hi Maxime,

>=20
> On 9/16/26 17:25, Lorenzo Bianconi wrote:
> > When a received frame is larger than dma_buf_sz, the DMA scatters it
> > across multiple RX descriptors (rx Scatter-Gather). The secondary RX
> > buffer (sec_page) was only allocated and programmed when split-header
> > (SPH) was active, so for regular frames buffer2 was neither allocated
> > nor backed by a valid mapping. As soon as an incoming frame overflowed
> > buffer1, the DMA wrote the overflow into the unmapped secondary-buffer
> > address, triggering an SMMU translation fault on IOMMU-based platforms:
> >=20
> > arm-smmu 15000000.iommu: Unhandled context fault: fsr=3D0x402, iova=3D0=
x00000000, fsynr=3D0x7f0011, cbfrsynra=3D0x1c90, cb=3D11
> > arm-smmu 15000000.iommu: FSR    =3D 00000402 [Format=3D2 TF], SID=3D0x1=
c90
> > arm-smmu 15000000.iommu: FSYNR0 =3D 007f0011 [S1CBNDX=3D127 WNR PLVL=3D=
1]
> >=20
> > Enable scatter-gather for non-SPH frames: always allocate the secondary
> > RX buffer and always mark buffer2 as valid in stmmac_init_rx_buffers()
> > and stmmac_rx_refill(), and account for it in the buffer length
> > computation. stmmac_rx_buf1_len() now returns min(dma_buf_sz, plen - le=
n)
> > on the last descriptor, while stmmac_rx_buf2_len() returns the remaining
> > bytes on the last descriptor and dma_buf_sz on the intermediate ones. T=
he
> > GMAC4 + split-header path keeps using the accumulated payload length
> > semantics, since there an intermediate descriptor's buffer2 can be only
> > partially filled.
> >=20
> > Fixes: 88ebe2cf7f3f ("net: stmmac: Rework stmmac_rx()")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> Ah this is also nice ! Ran into that with the Jumbo Frame selftest, it
> spills into the next desc and it doesn't end well (at least on dwmac1000).
>=20
> I don't know how you've tested that, can you test it in conjunction with
> this patch too ?
>=20
> https://lore.kernel.org/netdev/20260911212028.1497613-6-maxime.chevallier=
@bootlin.com/
>=20
> It changes the way we select the dma_buf_sz based on the MTU.

Ack. My main goal here is to keep the default MTU/rx length (1536B) on
the stmmac device and to split the received packet (e.g. with length 8KB)
over multiple DMA descriptors.

>=20
> I'll run your series on the boards I have and report if anything weird ha=
ppens,
> but if you have some testing commands to share that would be awesome :)

If you want to test with a simple ping you just need to increase the MTU on
the sender (e.g. setting MTU to 7KB). In case you prefer to test with TCP, =
you
would need to change even the route MTU used by the stmmac device:

- sender:
  $ip link set <nic> mtu 7000
- receiver (stmmac):
  $ip route change <net> dev <nic> mtu 7000

Regards,
Lorenzo

>=20
> Maxime
>=20
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++-------=
--------
> >  1 file changed, 8 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 1fb5f804ea23..be7cb0cafeb5 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -1659,17 +1659,14 @@ static int stmmac_init_rx_buffers(struct stmmac=
_priv *priv,
> >  		buf->page_offset =3D stmmac_rx_offset(priv);
> >  	}
> > =20
> > -	if (priv->sph_active && !buf->sec_page) {
> > +	if (!buf->sec_page) {
> >  		buf->sec_page =3D page_pool_alloc_pages(rx_q->page_pool, gfp);
> >  		if (!buf->sec_page)
> >  			return -ENOMEM;
> > =20
> >  		buf->sec_addr =3D page_pool_get_dma_addr(buf->sec_page);
> > -		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
> > -	} else {
> > -		buf->sec_page =3D NULL;
> > -		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, false);
> >  	}
> > +	stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
> > =20
> >  	buf->addr =3D page_pool_get_dma_addr(buf->page) + buf->page_offset;
> > =20
> > @@ -5097,7 +5094,7 @@ static inline void stmmac_rx_refill(struct stmmac=
_priv *priv, u32 queue)
> >  				break;
> >  		}
> > =20
> > -		if (priv->sph_active && !buf->sec_page) {
> > +		if (!buf->sec_page) {
> >  			buf->sec_page =3D page_pool_alloc_pages(rx_q->page_pool, gfp);
> >  			if (!buf->sec_page)
> >  				break;
> > @@ -5108,10 +5105,7 @@ static inline void stmmac_rx_refill(struct stmma=
c_priv *priv, u32 queue)
> >  		buf->addr =3D page_pool_get_dma_addr(buf->page) + buf->page_offset;
> > =20
> >  		stmmac_set_desc_addr(priv, p, buf->addr);
> > -		if (priv->sph_active)
> > -			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
> > -		else
> > -			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, false);
> > +		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
> >  		stmmac_refill_desc3(priv, rx_q, p);
> > =20
> >  		rx_q->rx_count_frames++;
> > @@ -5160,7 +5154,7 @@ static unsigned int stmmac_rx_buf1_len(struct stm=
mac_priv *priv,
> >  	plen =3D stmmac_get_rx_frame_len(priv, p, coe);
> > =20
> >  	/* First descriptor and last descriptor and not split header */
> > -	return min_t(unsigned int, priv->dma_conf.dma_buf_sz, plen);
> > +	return min_t(unsigned int, priv->dma_conf.dma_buf_sz, plen - len);
> >  }
> > =20
> >  static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
> > @@ -5170,10 +5164,6 @@ static unsigned int stmmac_rx_buf2_len(struct st=
mmac_priv *priv,
> >  	int coe =3D priv->hw->rx_csum;
> >  	unsigned int plen =3D 0;
> > =20
> > -	/* Not split header, buffer is not available */
> > -	if (!priv->sph_active)
> > -		return 0;
> > -
> >  	/* For GMAC4, when split header is enabled, in some rare cases, the
> >  	 * hardware does not fill buf2 of the first descriptor with payload.
> >  	 * Thus we cannot assume buf2 is always fully filled if it is not
> > @@ -5188,8 +5178,9 @@ static unsigned int stmmac_rx_buf2_len(struct stm=
mac_priv *priv,
> >  	 * Thus 'plen - len' always gives the correct length of buf2.
> >  	 */
> > =20
> > -	/* Not GMAC4 and not last descriptor */
> > -	if (priv->plat->core_type !=3D DWMAC_CORE_GMAC4 && (status & rx_not_l=
s))
> > +	/* Not GMAC4, or non-SPH and not last descriptor */
> > +	if ((priv->plat->core_type !=3D DWMAC_CORE_GMAC4 || !priv->sph_active=
) &&
> > +	    (status & rx_not_ls))
> >  		return priv->dma_conf.dma_buf_sz;
> > =20
> >  	/* GMAC4 or last descriptor */
> >=20
> > ---
> > base-commit: ceac0de741bfb47ca255eee075257b3bb31f0651
> > change-id: 20260916-stmmac-rx-sg-fix-a8d2d8a3ba01
> >=20
> > Best regards,
>=20

--Im3uIu74X4MILul3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqrOGAAKCRA6cBh0uS2t
rEc9AP9lSxuJ98JUZ5NxlDXvDdE1CpA/9FW+O7HPw5YG+Vr8SAEA72d2As0gaD79
SwV5DGTakhWkPgzYvdCuvCZPG+diNwE=
=L9Kn
-----END PGP SIGNATURE-----

--Im3uIu74X4MILul3--

