Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DE9C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPnjHnIgdmuzO9kTr0rrEAHp4E55nJ+bbwfUwsUg1os=; b=GQ5gGf/yOCNV23wroUfkFSYSKx
	3EpIxFgWPRHoSmM/6tWFXCiiJ9s6H0eYzHFW6doNhFp7hC8EY65EXYZpa7BivJn8vTwafBsB6rEaB
	Fi5tNO659spPruny/tvst00rATNhfIASn48W+NG/RuplFoz7u75oXF5BNyfnUy7JBnvAJs+i5ee6R
	x3d2hJMmlZRcmbYgotlGwtJ6gDQ7pTRg/FxgmfeXtj2FSSu5iWRRfqqHOol3Xf6i6TjI9Wp61OI3p
	RqL7DSGtxVycKw48eqRB9aDNoqTavyCk0+SqnOUdVkM5ceX3I9qaMqTuQUKdXdu60o64/HppHWo9e
	KFElQ4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eVt-0000000ERGi-1DzR;
	Thu, 10 Sep 2026 13:08:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eVq-0000000ERGB-1Uc1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:08:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7hWl869072
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 13:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TPnjHnIgdmuzO9kTr0rrEAHp
	4E55nJ+bbwfUwsUg1os=; b=KdG3BlCf1IP7V5byJVyncSli8rVhBCuYl5MzWASa
	JrOKfKfhPIZ8VqHC8hl0Fqe56jTdqTK4Dg2k66CsVBQcwDbHsnAMn5fUTCdORu8f
	KxdEa5rtTBv3SMTCgKpK7ynpb2KXCDB9FObM5VfE2OOJvq9vumjOZWExpIlbhHzQ
	eokPvaXA4yWM/Wk1PioahxILLsQM9rpjlzk0ECJBQL1U4+NLX3rvgE/7N4AdLVg4
	eShneExNa18SPItW8L17YNXyX+xX+V1jRJfI77Vj+CJabzYKyPdtYvSZr9eFV58j
	YPO/ygqAkn9YaOyDKMRXaN0h/oHeo7VRM73EZhuJeEQFxg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd3wq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 13:08:21 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4ca7ce3fso7275884b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045700; x=1789650500; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TPnjHnIgdmuzO9kTr0rrEAHp4E55nJ+bbwfUwsUg1os=;
        b=VgRWG6lXXRQGa4e1hq9HwjJp6Fyfpo82cMVoVI+O9udxeiEJfLCN+JV4QYmudyKo2l
         Q/aebjNfUthL1lpKlCd3oDbypFWFhoJohijWB+R1r7L/2VKZJ+vp3ednDhPSnmRq7LUa
         xxsNfwIla41JMhH3to3fV56MLbZGOiKCLmwa0piwwkDKlm8ZdGZgMvmHze0YSlRO/dS5
         TSTJuPc5HQ/f9DP+MuUjCrm3LpsHFDV97eaLXXr305ocFVnM8D6ZgtiE3VaTH++bNS72
         3mLg6OiV9a5Sr1iZ77Fg+CcQwmwjt/B7nKg0DaUFRZ6dS943F3XSPyheh7A3Q0LLbZcR
         jdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045700; x=1789650500;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPnjHnIgdmuzO9kTr0rrEAHp4E55nJ+bbwfUwsUg1os=;
        b=jydAdvgFlwqwYpsbxrILpu93TONZzZEhp50B8HcUWo0silZ6PV34kYYpYjxQHWa09+
         ewbzLluW+BykBFgaG0EVgImwXXDP3e2Fx6f/sQ8NHSIWOXG4WacZaGG/X8pYRoe5POA/
         G2XuuDMqaT8x33x5e8v48RPB/sk/hAkQca8fSp2yoNbADYEsRBkT4Z+trnKKUd7rEd54
         Bl0O0QehseuKf85xOyrhFjdhQbjL79bpCFzqq7qgr+50d0ycPAnr0gys1wwPG5QUcl4y
         yrrgjxPqoQiuTYWr+UdO8VBO+2DImUlU3ZN34fpjvAdVavXY+yACfCiTZ8ryU1+XMm7q
         /xlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRR8f8GBo4QnAJrz+m9i4QOcBqa0tueYljAF/oyD8qvq/9uvLHTqlpsTgziy/o+BChEMCzJudR+NYx3n2Fu2+8@lists.infradead.org
X-Gm-Message-State: AFuF++kOWUG3hUMhUQcuiS46qvlgYyfvJcqsXc2TnEWymZNeh6bmu/vK
	82hzesbxIYalLExyd20nXEevCs/eqbD12cKSi5Fg8tUiUW33q7rc34qpW6qdbp/Jsxk1Ed3OZFe
	OiZ8XcXzU5uTXkj8i1+hfgqO/u7b1sGNs9t3ZavlhXRjK1E5ZRi3EktC7XAqjEMuLMf5Lzzi71E
	locA==
X-Gm-Gg: AYBFou3nmEK7ENknuvklmrwsAnEueQY/0zBK4Y/0OCDLNPzQJsg+39ze9yxpGbr2rMl
	ylRZCy2wSBq4OPNncDJxsOqekSBFdaDfq3z65uoUK/Yq59H4tJYc5P3B8Ea+ZJokXbF7DKsz5u7
	Q1I5hTfbKb4nRGw/DR/yDcT8T4gt4IyiN7IFntKS3Ce4NrApr7fAPfkvRWqgu5HPl9nuBRjcjEU
	7O0GBDcPwQm7Jvp5xRtHGSGXEB3e5yQJbpJLbLlFy6M7U7IWFHyGDjiy625tcSI9Fio4waSpKYR
	GO/UpxnQF0ZCo/H8i7Ce+C0n6bV3vxXWQskKZtl5VcrNS1ni3A1oQT356soanyecyLaZVJrh6v5
	EO1QFHmmkovABjw==
X-Received: by 2002:a05:6820:2209:b0:6b7:46fc:1c9 with SMTP id 006d021491bc7-6b746fc02fcmr20501879eaf.40.1789045700118;
        Thu, 10 Sep 2026 06:08:20 -0700 (PDT)
X-Received: by 2002:a05:6820:2209:b0:6b7:46fc:1c9 with SMTP id 006d021491bc7-6b746fc02fcmr20501794eaf.40.1789045699526;
        Thu, 10 Sep 2026 06:08:19 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm943272566b.58.2026.09.10.06.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:08:18 -0700 (PDT)
Date: Thu, 10 Sep 2026 15:08:17 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        peppe.cavallaro@st.com, alexandre.torgue@st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: fix TX descriptor availability check
 for TSO traffic
Message-ID: <aqKrwW62rHjVzb5h@lore-desk>
References: <20260907-stmmac-fix-tso-nfrags-check-v1-1-328459906cdb@oss.qualcomm.com>
 <178903370842.219967.14155724625684562557@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LNHrs9xCYmBYQG1L"
Content-Disposition: inline
In-Reply-To: <178903370842.219967.14155724625684562557@kernel.org>
X-Proofpoint-GUID: pa6kwDkhCGZB4fF9V0-eYv_GSRBwYmYF
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa2abc5 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=elNHZ6xcAjOI5rna9C8A:9 a=QEXdDO2ut3YA:10
 a=f7ULPs5uqvM6TsqBw1IA:9 a=efpaJB4zofY2dbm2aIRb:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: pa6kwDkhCGZB4fF9V0-eYv_GSRBwYmYF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NyBTYWx0ZWRfXwJEhNyVrKs2O
 eT86yA+TKTH7rxAvf0aL5xlkkXB9s1AfzP3Ii18maiq0bVFDl26g6MRfDp4uiX8X8arHNAmOMyT
 PPP4YRe/UpnUFFWlE/xlkAZY9Xly92Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NyBTYWx0ZWRfX7scbc8qMvXs3
 xaA+ZVrWd5h8Sb2ona3z4yzzp7NG0l9dIgG0x6suDblghutBgWgbyNqY2kpMPa8jZFMSqDTYUDc
 8P/6MKrDxLS20OiYnxJIoSornn+vgU0dCBgVaSQqhw4pxGqvVbE0CSiBdPPMRV7zUCgAzE0Ilh5
 Vuvll7jDahJ7wmp+jKObAyYY3+fW4Tnd4GauZQb6NSqHjnZEwYuy68AZq7IKs7EmRYAXDdU/HLa
 q6kGAXvUwQDzGEOX4F2rvllV85chktbZ2GXfSwuV+0Q2eeghEm9E5AvnG9qjnCD88RqLvVx3/x9
 ZeO+EwKaVwH/EgwXKkzlU2gpvV4/x6KpYDc/IBxoNGQ6Q5BE79qPuzjS1QPC0+IksaS/WPECPw9
 a8t6od0HDQ8s/TNOD179yRAOsP8IdhBsskttwwrY/w4YekFoyafiXL8vv5NHNiiJ2Rsr7QmdyuA
 aGTWn5A2nZOrqH4heCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_060822_541590_FAB8B22C 
X-CRM114-Status: GOOD (  42.38  )
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

--LNHrs9xCYmBYQG1L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>=20
> Critical: 0 =C2=B7 High: 1 (1) =C2=B7 Medium: 0 =C2=B7 Low: 0 (1)
>=20
> - [High] stmmac_tso_xmit() now demands the exact descriptor count
>   returned by stmmac_tso_get_num_desc() (stmmac_main.c:4543-4544) but=E2=
=80=A6
>=20
> Pre-existing issues:
> - [High] proto_hdr_len in stmmac_tso_xmit() is declared as u8
>   (stmmac_main.c:4524) but is assigned the size_t result of=E2=80=A6
> - [Low] The stmmac_tso_xmit() kernel-doc states "mss is fixed when enable
>   tso, so w/o programming the TDES3 ctx field." (stmmac_main.c:4512),=E2=
=80=A6
>=20
> --
>=20
> net: stmmac: fix TX descriptor availability check for TSO traffic
>=20
> This replaces the (skb->len - proto_hdr_len) / TSO_MAX_BUFF_SIZE + 1
> estimate in stmmac_tso_xmit() with stmmac_tso_get_num_desc(), which counts
> the header descriptor, the linear payload, every fragment and the MSS
> context descriptor. The new count is then used for the free descriptor
> check before the ring is programmed.
>=20
> A few questions below.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 24656b35350b1..3566b33bc34e5 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -4454,6 +4454,26 @@ static bool stmmac_tso_valid_packet(struct sk_bu=
ff *skb)
> >  	       header_len + gso_size < 16383;
> >  }
> > =20
> > +static int stmmac_tso_get_num_desc(struct stmmac_tx_queue *tx_q,
> > +				   struct sk_buff *skb, u32 pay_len)
> > +{
> > +	int i, ndesc =3D 1;
> > +
> > +	/* head payload */
> > +	ndesc +=3D DIV_ROUND_UP(pay_len, TSO_MAX_BUFF_SIZE);
> > +	/* frag payload */
> > +	for (i =3D 0; i < skb_shinfo(skb)->nr_frags; i++) {
> > +		const skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
> > +
> > +		ndesc +=3D DIV_ROUND_UP(skb_frag_size(frag),
> > +				      TSO_MAX_BUFF_SIZE);
> > +	}
> > +	/* MSS update requires a new descriptor */
> > +	ndesc +=3D !!(skb_shinfo(skb)->gso_size !=3D tx_q->mss);
>=20
> [Severity: Low]
> This is a pre-existing issue and not introduced by this patch, but the new
> comment here now contradicts the stmmac_tso_xmit() kernel-doc that follows
> a few lines below, which still says:
>=20
> 	 * mss is fixed when enable tso, so w/o programming the TDES3 ctx field.
>=20
> stmmac_tso_xmit() does program a context descriptor whenever the skb MSS
> differs from the cached queue MSS:
>=20
> 	if (mss !=3D tx_q->mss) {
> 		...
> 		stmmac_set_mss(priv, mss_desc, mss);
> 		tx_q->mss =3D mss;
> 		tx_q->cur_tx =3D STMMAC_NEXT_ENTRY(tx_q->cur_tx, priv->dma_conf.dma_tx_=
size);
>=20
> Would it make sense to drop or update that kernel-doc sentence while
> touching this area?

As pointed out by Sashiko, this issue is not introduced by this patch and it
can be fixed with a dedicated patch.

>=20
> > +
> > +	return ndesc;
> > +}
> > +
> >  /**
> >   *  stmmac_tso_xmit - Tx entry point of the driver for oversized frame=
s (TSO)
> >   *  @skb : the socket buffer
> > @@ -4497,10 +4517,10 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_bu=
ff *skb, struct net_device *dev)
> >  	struct stmmac_priv *priv =3D netdev_priv(dev);
> >  	unsigned int first_entry, entry, tx_packets;
> >  	struct stmmac_txq_stats *txq_stats;
> > +	int i, first_tx, nfrags, ndesc;
> >  	struct stmmac_tx_queue *tx_q;
> >  	bool set_ic, is_last_segment;
> >  	u32 pay_len, mss, queue;
> > -	int i, first_tx, nfrags;
> >  	u8 proto_hdr_len, hdr;
> >  	dma_addr_t des;
> > =20
> > @@ -4513,14 +4533,15 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_bu=
ff *skb, struct net_device *dev)
> > =20
> >  	/* Compute header lengths */
> >  	proto_hdr_len =3D stmmac_tso_header_size(skb);
> > +	pay_len =3D skb_headlen(skb) - proto_hdr_len; /* no frags */
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but the new pay_len computation
> inherits an existing truncation. proto_hdr_len is declared u8 while
> stmmac_tso_header_size() returns a size_t (skb_transport_offset() +
> sizeof(struct udphdr), or skb_tcp_all_headers()), and
> stmmac_tso_valid_packet() explicitly admits headers up to 1023 bytes into
> the hardware TSO path:
>=20
> 	return header_len <=3D 1023 && gso_size >=3D 64 &&
> 	       header_len + gso_size < 16383;
>=20
> For a header of 256..1023 bytes the store wraps modulo 256 (486 becomes
> 230, 256 becomes 0). The truncated value then defines the hardware
> contract, both for the payload start address:
>=20
> 	stmmac_tso_allocator(priv, &entry, des + proto_hdr_len, pay_len,
> 			     (nfrags =3D=3D 0), queue);
>=20
> and for the descriptor lengths:
>=20
> 	stmmac_prepare_tso_tx_desc(priv, first, 1, proto_hdr_len, 0, 1,
> 				   is_last_segment, hdr / 4,
> 				   skb->len - proto_hdr_len);
>=20
> so the tail of the real header is handed to the engine as TCP/UDP payload
> while TDES3 declares more payload than the following descriptors describe
> (a header of exactly 256 also yields a zero length buffer1 with TSE set).
> A TCP over IPv6 socket carrying a few hundred bytes of sticky
> destination/hop-by-hop options makes skb_tcp_all_headers() exceed 255 whi=
le
> staying under 1023, so such an skb reaches stmmac_tso_xmit().
>=20
> For the new pay_len the error biases upward, so the ring accounting stays
> safe, but should proto_hdr_len be widened to unsigned int (or size_t) sin=
ce
> this patch now builds the descriptor count on it too?

As pointed out by Sashiko, this issue is not introduced by this patch and it
can be fixed with a dedicated patch.

>=20
> >  	if (skb_shinfo(skb)->gso_type & SKB_GSO_UDP_L4)
> >  		hdr =3D sizeof(struct udphdr);
> >  	else
> >  		hdr =3D tcp_hdrlen(skb);
> > =20
> > -	/* Desc availability based on threshold should be enough safe */
> > -	if (unlikely(stmmac_tx_avail(priv, queue) <
> > -		(((skb->len - proto_hdr_len) / TSO_MAX_BUFF_SIZE + 1)))) {
> > +	ndesc =3D stmmac_tso_get_num_desc(tx_q, skb, pay_len);
> > +	if (unlikely(stmmac_tx_avail(priv, queue) < ndesc)) {
> >  		if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, queue))) {
> >  			netif_tx_stop_queue(netdev_get_tx_queue(priv->dev,
> >  								queue));
>=20
> [Severity: High]
> The new requirement is exact, but the TX flow control watermarks were left
> unchanged. Can this make the "Tx Ring full when queue awake" branch
> reachable for ordinary TSO traffic?
>=20
> stmmac_tso_get_num_desc() returns at least nfrags + 2 for any TSO skb that
> has a linear payload, so with MAX_SKB_FRAGS =3D 17 plus an MSS change it =
asks
> for 20 descriptors, and up to roughly 23 when individual frags exceed
> TSO_MAX_BUFF_SIZE.
>=20
> The tail of stmmac_tso_xmit() still stops the queue based on the old
> assumption:
>=20
> 	if (unlikely(stmmac_tx_avail(priv, queue) <=3D (MAX_SKB_FRAGS + 1))) {
> 		netif_dbg(priv, hw, priv->dev, "%s: stop transmitted packets\n",
> 			  __func__);
> 		netif_tx_stop_queue(netdev_get_tx_queue(priv->dev, queue));
> 	}
>=20
> so the queue is deliberately left awake with as few as 19 free slots, whi=
le
> the next TSO skb may need more. Does that leave a window where the stack
> submits an skb that does not fit, hitting the un-ratelimited netdev_err()
> in the ndo_start_xmit hot path together with netif_tx_stop_queue() and a
> NETDEV_TX_BUSY requeue?
>=20
> The non-TSO path keeps the invariant the watermark was designed for,
> stmmac_xmit() needs nfrags + 1, which is always satisfied when the queue =
is
> awake:
>=20
> 	if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 1)) {
>=20
> The only place the queue is re-armed is stmmac_tx_clean():
>=20
> 	if (unlikely(netif_tx_queue_stopped(netdev_get_tx_queue(priv->dev, queue=
))) &&
> 	    stmmac_tx_avail(priv, queue) > STMMAC_TX_THRESH(priv)) {
> 		...
> 		netif_tx_wake_queue(netdev_get_tx_queue(priv->dev, queue));
>=20
> STMMAC_TX_THRESH() is dma_tx_size / 4, which is 16 on the 64 entry ring
> stmmac_set_ringparam() accepts (DMA_MIN_TX_SIZE in common.h). On such a
> ring the wake threshold is itself below the new requirement, so can the
> queue be woken while the skb still does not fit, producing a repeating
> stop/wake/TX_BUSY cycle with repeated error logging?
>=20
> Should the stop and wake watermarks be raised to the worst case TSO
> descriptor count, or the skb linearized/pushed to software GSO, as part of
> this change?

The goal of this patch is to fix the memory corruption triggered by a TSO s=
kb
that does not fit in the tx queue available memory space.
The case described above will be managed by the new condition added at the
beginning of stmmac_tso_xmit(). I think we can change the stop/wake tx queue
watermark with a dedicated patch that we do not need to backport (I guess t=
his
is mostly an optimization). However, if you prefer to have it in a single p=
atch,
I will add it in this one.

>=20
> >  @@ -4532,8 +4553,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buf=
f *skb, struct net_device *dev)
> >  		return NETDEV_TX_BUSY;
> >  	}
>=20
> One more on this branch: it sets XOFF without re-checking availability and
> without arming a wake source. If the ring drains concurrently
> (dirty_tx =3D=3D cur_tx, no further TX completion and no NAPI run), does =
the
> XOFF state persist until dev_watchdog fires ndo_tx_timeout?

I guess this corner case has not been introduced by this patch since the sa=
me
approach is present in stmmac_xmit(). I think it should be addressed with a
dedicated patch. Moreover, is the corner case fixed by the ndo_tx_timeout
callback?

Regards,
Lorenzo

>=20
> Since the patch is tagged for stable, would it be worth describing the new
> NETDEV_TX_BUSY and error logging behaviour in the commit message?
>=20
> > =20
> > -	pay_len =3D skb_headlen(skb) - proto_hdr_len; /* no frags */
> > -
> >  	mss =3D skb_shinfo(skb)->gso_size;
> > =20
> >  	/* set new MSS value if needed */
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260907-stmmac-fix-tso-nfrags-check-v1-1-328459906cdb%40oss.qualcomm.c=
om

--LNHrs9xCYmBYQG1L
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqKrwQAKCRA6cBh0uS2t
rGJLAP97a5a1+31bWNIA/98bBUZ68yBojQhkvWdH66C5SFQi0wEAo6iRd7fMPqu2
cCuGOeOObCKpxbTg7pb0J6toTca2uAM=
=qcF7
-----END PGP SIGNATURE-----

--LNHrs9xCYmBYQG1L--

