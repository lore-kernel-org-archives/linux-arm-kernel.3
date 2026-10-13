Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCD0CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgEoCHdTeicYs8dHNwUpBuKbXP9XPOOmwmEWGVwyiIs=; b=Zc2A1CSAvLPN+JbztaXDDcpE1Z
	XE5GMHerQOPxuqs/qIr/rNwAjDBQQBCp8vogvlFd5ERqr1Zzf/6KygI/LhSityD8QPR7qaquucuhZ
	Av0zowT48Xhq6urZdOi/BpmRWBMFy1fBqIoTRq+rnFMudkj8+hsMZbZ+nV4aICoeORTw9FjnBRoKM
	OvekTZ0spV0ZqwmM3k9tzfGf5BYh7PGCjzbhTsTrA4ZMV+5/zt/c/M4FQUKxUZQxgBrVBUWIqtADK
	MTk42dzM1CIdltO5v/12Lg4X/6iN4jx1hRIVNBDu6efdBn2kOLD3Mee53xymVpifBveZfrdfIOCQ0
	ULx4Qitw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXvd-0000000CKtE-3EdD;
	Tue, 13 Oct 2026 08:32:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXvb-0000000CKsg-28Zw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 08:32:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8ODRF3054788
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CgEoCHdTeicYs8dHNwUpBuKb
	XP9XPOOmwmEWGVwyiIs=; b=RhqBEOSNGGNNo03Tp7noRTWEiLZ3ZuTC5vgd55vq
	iT45tRxi2JVn8DP1pebcN0MU9e5enClYO99FTYCbn1MDebinMcxVK8JTL3QS8Bn9
	qK/BCTH54jcsy2gT5cx7kCfcZy+r55XOK8UZut6ilIzWQ5fuKzutPMWE27SLCf+3
	frfr6mH9sTcEnvsIyjTOXXQJ6EkqXamW1HEgzUrZ6M5WCYxvUqR6YSuIE+/mpQte
	E0ZesVP2OITDNPNmGeIuQUfP0rt8uJLyGldHOecZdxxyQc08crBQBiZekaef1Obx
	YYViMymHYyE3t9xo6bHC35fwSzXldjZbqe/Sh7ayPxwX6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeu9ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:32:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc7a6e4e1so878289785a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 01:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880326; x=1792485126; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgEoCHdTeicYs8dHNwUpBuKbXP9XPOOmwmEWGVwyiIs=;
        b=TjyL1iCIAm9xWf8Gl9luvp9KQrCBBmOaWkGOPoEDAt1GuHZYzo23MuROrxY4/m5gJg
         6cGvZl5TZ/jrtwQ0UfiQKnhRCowLfdQ8zrvWOx+WI0JqEEI3qIl5pZX69AlfQPkUbwmp
         KvN4LSHv2cDBe7vJ6DxaWgrL6oYN08MSMJQDv7Pbp08U55N2UOWPg4h3KoV72afNnfn2
         he27aWFX7gCaHUXl5WhswDtkUMoxRimzwDjoxh9sJ32PumJF1Y0mSpD+KAsalnk2LksE
         8I73Svj+OzsDK3Y2SW+N6ccopST2DdTDkDbLpafdnlGEblU1Q9HdRp51XaInjIFrLmCc
         yJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880326; x=1792485126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgEoCHdTeicYs8dHNwUpBuKbXP9XPOOmwmEWGVwyiIs=;
        b=uXYpi4CGtW3+28p2HwCOqaTndb+F5Y0MJVTHu8ALryHEnnEZWBdC5c7qUXBB68S4Wu
         0XkdZT6MzCUMvl2nTNZjnG6f1tPykBgZJik6VrfhilqOXAu+Do+vQ0zVu7YxuM/pBg6o
         u/8UgDvemlseyYR1JitWyuC6J0UFIxWtk7Xwt8iRFwIdeD6rDbSohlz+9VAH1Vij7qaj
         Ee9fc0v59CxQLq7s2a3U+RzZ/cqivxHgoBHJ4NxBW1V5kFxsfRU1j6YHcDSLQ3cPhzgV
         J4OTQ063shRqja7/ODU1TU0RgLxZzOBsWDbpDwZIxSdMKcug3VhjhFYIoLCSP03e67SH
         KuAg==
X-Forwarded-Encrypted: i=1; AKwUvBwsI2G/sPyLxkNTHpYdfT5TDKqGk6DI4duUKEFsTQ6F504FeHt3/Pq1or7J68Z1iG2bZ+O9TvI79tX4vYLaNGuZ@lists.infradead.org
X-Gm-Message-State: AFq9FYJdAzotPuqrNWQcah+mfK6pSvEchLduktLwgbHB/ygivTnXXdmN
	nD1jbUkq7PO2ZwseRZ1Zz26kcORs1o2qtKhmuwddgP7ceZaCfBDvePcZwMILhfzzg361dF2RQhE
	gGFRyDOUyomLlDFfdEGmspTMg/x1v61N1AwIkK8t4NmuKRzbNpqaOVg81vLX8t7oxGF3AksPj8l
	gmDg==
X-Gm-Gg: AYBFou2QWuZoZFiBIxjbt4iNVGXbi1Tcw2BXT4Ek+U3ndvU6+yYttsD0CFM1j0e03l6
	OAaJzzKM4eQRbeCb2u7hczKU0K6lUibsBEL+2fyPLRk25E7IGFkSxAgJNVKw3d9U7EEQP1ME2Bv
	ZauDEZUzyMFE9RZaFKtEMfYrOBsQfa676Zxj6JX8mG4Eun2hNVussneJs+rw5zqCdJMCcQutilE
	MbVDAzJrSwWbQcuFZoieyB9cPfzJlwZ+BZHVKknvEt8nhretb386lnWmzvS4abCEwvGtfZg4BSL
	oTAR0jbHnSCpto6R0+Li34lnPkPElA8Sy0y7KfYM38Pj4mY1jUj7jNJpGcZ/z4gOlUoqXcfGuHa
	PqvXnqpRfXW47NA==
X-Received: by 2002:a05:620a:3720:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-93ebd2a05fbmr1975435085a.62.1791880325496;
        Tue, 13 Oct 2026 01:32:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-93ebd2a05fbmr1975431485a.62.1791880324843;
        Tue, 13 Oct 2026 01:32:04 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm280651825e9.3.2026.10.13.01.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:32:03 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:32:03 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
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
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v6 3/4] net: stmmac: drop multi-buffer frames in
 XDP mode
Message-ID: <as3sg4tbl93_yEiL@lore-desk>
References: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
 <20261012-stmmac-rx-mb-v6-3-2225050915c1@oss.qualcomm.com>
 <b11af7d5d430dcddcc681484b50ae7e2@tipi-net.de>
 <as3pB16af0_QhNyB@lore-desk>
 <3a483a6fbd86f50a02435932fe4a7ea3@tipi-net.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3qwKvKFoaOiXYisH"
Content-Disposition: inline
In-Reply-To: <3a483a6fbd86f50a02435932fe4a7ea3@tipi-net.de>
X-Proofpoint-GUID: 2CpslsM10jTsHMCSN2g16Fp5w-pFiRZx
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acdec86 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VeR9IiojQdXVVGmY0-kA:9
 a=CjuIK1q_8ugA:10 a=hNWK7rNVVTdq26VXPtYA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMyBTYWx0ZWRfX6zHTDX5CMKVt
 2G6/haHntTXR1NbKmhIpTBQF0PjkvTNtlWn3oHfWQUYVESfAHPhAtWFEt9gRv06ObGdTNMq1FgO
 nGch3+xkWTBEBvBOO3GcP2ZhgXFiej4=
X-Proofpoint-ORIG-GUID: 2CpslsM10jTsHMCSN2g16Fp5w-pFiRZx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMyBTYWx0ZWRfXz9CLW0xSgecO
 aOCZGv3OErea1l26V2uWOPKsEg5yTabrVNX6MGisJWOgYUzwJnhKieCrv62gZ9iaf9h7OTXcdJW
 qfORKG5fcRD4sLThCmR5NOmb9FgcpDOPHcGq4Qj7ETuPZ/wOnxY5MMxKXqu1mPCA7ZfNC+7AtqS
 jhdy8GpHeYDViYKLC98XdCUjOm4P3KReT4CaV6GqIpeOc5vkIYuhK8Hm5EHOauC1cXoYTy+5ayK
 rbN9YJ715ZKbC2XRQXjlHbGTRfA2U0+9oGuAXyHYA9vMBll4uX9A9ouF2BJ6LB9ebK8WGjwByrt
 qOuPHt3Do4uQWTF/651SyF4+mvJsMNdFyyzbPAyWe7pY1ThCyXFBve5+oYAr11wQ22jEqJqo+ih
 GvmjMF2YgQTW3+DFLI5loEcUtkrJy8VjFQ9Ho0c7dXGSJ1MqDl8xtO55TjtfPOxL+m0oe/dKll5
 sBR8/cMixieFjcIaCCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_013207_667754_9D375BCE 
X-CRM114-Status: GOOD (  35.88  )
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

--3qwKvKFoaOiXYisH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 13, Nicolai Buchwitz wrote:
> Hi Lorenzo
>=20
> On 13.10.2026 10:17, Lorenzo Bianconi wrote:
> > On Oct 12, Nicolai Buchwitz wrote:
>=20
> > [...]
>=20
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > index 426bb68c9bbc..8c08d44fdbd3 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > @@ -5893,18 +5893,24 @@ static int stmmac_rx(struct stmmac_priv *pr=
iv,
> > > > int limit, u32 queue)
> > > >
> > > >  		if (priv->extend_desc)
> > > >  			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx +
> > > > entry);
> > > > -		if (unlikely(status =3D=3D discard_frame)) {
> > > > -			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
> > > > -			buf->page =3D NULL;
> > > > +
> > > > +		if (unlikely(!error && status =3D=3D discard_frame)) {
> > > >  			error =3D 1;
> > > >  			if (!priv->hwts_rx_en)
> > > >  				rx_errors++;
> > > >  		}
> > > >
> > > > -		if (unlikely(error && (status & rx_not_ls)))
> > > > -			goto read_again;
> > > > +		/* We do not support SG in XDP mode */
> > > > +		if (unlikely(!error && (status & rx_not_ls) &&
> > > > +			     stmmac_xdp_is_enabled(priv))) {
> > > > +			rx_dropped++;
> > > > +			error =3D 1;
> > > > +		}
> > >=20
> > > AFAIU GMAC4 and XGMAC always use the second buffer of a descriptor. If
> > > so, at MTU 1500 a frame of up to 3072 bytes can fit in one descriptor,
> > > and this check would not catch it?
> > >=20
> > > The XDP program would then only see the first buffer. With XDP_TX the
> > > frame is cut and sent too short. With XDP_PASS the second buffer is
> > > added
> > > after the program already decided.
> > >=20
> > > Patch 4 fixes this. But if this patch should work on its own, should
> > > it
> > > also drop the frame when buf2_len is not zero? Or am I missing
> > > something?
> >=20
> > Hi Nicolai,
> >=20
> > IIUC your comment we are missing the case where we have a single
> > descriptor
> > (rx_not_ls is not set in status) but the packet is splitted over buf1
> > and buf2,
> > right? Something like:
> >=20
> > 	...
> > 	buf2_len =3D stmmac_rx_buf2_len(priv, p, status, len);
> > 	len +=3D buf2_len;
> >=20
> > 	if (unlikely(stmmac_xdp_is_enabled(priv) && buf2_len)) {
> > 		rx_dropped++;
> > 		dev_kfree_skb(skb);
> > 		goto next;
> > 	}
> > 	...
> >=20
> > Is my understanding correct?
>=20
> Yes, exactly.
>=20
> I think skb is always NULL there in XDP mode, so the dev_kfree_skb()
> can go. Both pages stay in the slot and stmmac_rx_refill() reuses them,
> so nothing leaks.
>=20
> Maybe extend the "We do not support SG in XDP mode" comment to cover
> this case too.

ack, thx for the review. I will fix it in v7.

Regards,
Lorenzo

>=20
> > [...]
>=20
> Thanks,
> Nicolai

--3qwKvKFoaOiXYisH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas3sgwAKCRA6cBh0uS2t
rEjBAP9gErlRqvxFcDyFsfPFSFOkj0MTST4iWeXLN6NZgNjN7wD8DWWqfrjLXqPl
Dp1q1qQAQUSjZYRFz2ogR2tzHG0Eeg4=
=mHzj
-----END PGP SIGNATURE-----

--3qwKvKFoaOiXYisH--

