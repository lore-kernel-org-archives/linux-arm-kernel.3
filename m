Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17543CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sl2PyeEgwA2sMKNN7tpj1e7Snnbx1U3YT5+hgWgDo1Q=; b=oBP4RQfGeG6rCsVKYa9pEmYEjc
	WeG29uQ7fwS/ch0DfxB+s3UnU1MyOZY/m6WeUkDzcSX5NM6nI1zhj5+dg4Rog5MIwgimMujyzRFfj
	111nUDW0fpTzR2VPsmkZi52+L1hCFGd6AyfImumcBUfNbVCAPsev0JjXJ1EJ6FgtGQnGotlB+ppqX
	W/NgFAZqmkLJDblA3FO+ZQv4Ya7A+CMBd3DM86orHCbSn5b7tx+NqyvZrAKTpfupd4VfvrvZ/QeS6
	oc6S8d5DB1x8A3sj53kqrsbzVEqX4PohUWlXIDGcwFzL8BcNZwwYUtO+t1PhXRShwpdQBdTrl4G17
	3N8FK4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImIf-00000007MlT-3tNE;
	Mon, 19 Oct 2026 12:17:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImId-00000007Ml4-2MjR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:17:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P5sW1896523
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 12:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Sl2PyeEgwA2sMKNN7tpj1e7S
	nnbx1U3YT5+hgWgDo1Q=; b=lOpYNIT9Bd4SX1q+mz916Sz5yHYqWS5IfKIf96aC
	DDzL/emt8rae588DLrk/9COBhU1YD/yFfZokZeK3bcU7pjce2wGe1zqedCG6+jG0
	9d+beKOmtV6aFbraoUi4JCDUzrMOiS4Mu9DCY49Y4IhuPUqNpVeJGD1T1aRdSk7e
	IuKlvUl4m3PsFkHptj5dMet1/fg5nRZVmhEswbu7H3wZU0b0j4VnPfIHU6mjOcI4
	G7BqK2oLvI8vE0lJQEt+4u+szl3GQrKsxW791itqh6jFYBuKmbY8Q9qt/gysjKTb
	jVtbYJ/p06FagISjOXqDJxswAYtP+OjJzajnFN5Mn3tgJg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr9sm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 12:17:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc0418036bso115629137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792412225; x=1793017025; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sl2PyeEgwA2sMKNN7tpj1e7Snnbx1U3YT5+hgWgDo1Q=;
        b=VtXhlGas8jPwotwKGnRxoG0VDT6IsZiInTV0k7HU6xoav+xFayY4rReZiz2z1wFdMn
         U0k8/ahfLaEO48+4ZsKVl3HVWXORz+WA/1kx7mgVIGo+Meo6pKjoipOpxrh/Xt8VOr9A
         IIKNGu1RgcXIimgsWRb0wKUfsjaNiqAX24U7MIJw58+PJUWopj9bdAOxFLlhW+otEBMm
         rJ9nqUz3xUdr+A0icgSQ4e9esSlV7JZr4jAER1lVwIeSG6enXcSJsPgDDuzF8+Jdsaoe
         mwvicg5Gf8Q66D8rK0S4s3LZOT+dCqI3do3ilhPmkMe2Tqvb7xGt5NPoRsOHR8byHoUO
         7wEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412225; x=1793017025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sl2PyeEgwA2sMKNN7tpj1e7Snnbx1U3YT5+hgWgDo1Q=;
        b=NtG5ud2RyJZCZu6eBiVCC4h4QWbj+Ki7GjehBA2kOt5jx9fk9nqFP0nyub2nHPM/s3
         +5ohQkrAYDleXRK0u6hhkYg9BDl8waZeCw1XUQ3/0/9ZzNZCc3kzakej4NPUqeQLBfdK
         JhJdWUlw/nE/wW+kucLiJeGDUavOpmW4Ef4KsqAz6BO/hPOWtOLdlZpZDCHHt6ts/jnm
         XJCU6TpDjnbG6O8RxeRrb9P3rgIT8I4vD6Cvswp5bROjpxQsWUwFb1FTwCsg7h7jjkd3
         ziJQ0FOWKWoDtlwU367Hrt6vMnIr+2b48QaNiy55QY8sy6rHEIl/zb+tDlUA1F0zjNJZ
         sbQA==
X-Forwarded-Encrypted: i=1; AKwUvBxr/CbZ1wLcLULxGpRs5U7sc8jicWP9u/ujUbVyE/U/lpd5n7VyKzmVazPnWks352wVhR3b1l4ZR7C2CLtgsDGd@lists.infradead.org
X-Gm-Message-State: AFq9FYLndUnesBTOErFwZCoUBhxw1kY+szmQyXXcHtKBm45crHVnouiu
	zaLMDw3RYLm7G5ybUg03Y7tXoeG6AMvF5xQtSpAtyIg8+N8wkL3QgADim1LktmJnLuGs4Xn2QSj
	vZT0dOdNJJ/gpzP57rxu9bIxNV9mkSWxKowiuiISHcNg76OhMgkIBt01L+kw/qwjzvjqbQyhnoF
	fKEg==
X-Gm-Gg: AYBFou3ET5xQfs9ZCH0HQpVHJsLbgpDFOm/FyxnDIoM9sg9J9xBpkCQGlugmNzWYP5l
	WCKsQRGVTlpwZ4JpyOhYDZb0PdMI2hnWHfJtoYeYtu+LcJQWdkfRgfqhNbVvETz1zCVdPYigBmV
	uWZniS3DV15aDYNSOhfbR2H+Q5qkH2hbgRTxIRznZJnKzNgP9/QmybQKrg+JGxWPCiIrIrlS+wQ
	bwNarF4Px3oS20a1leit2j//s/9xJti0Bu4o81YbONCrJEsEpEcDDRtiVhnab18h4tyTLuGJT11
	BaOPJ8Cnzy38U1ECUiF7I5RQd6LSznUhchH+vCV7MbDJ+095a1PxfVnw2kMkxkW+Gp4o+wN1NNT
	1D+tCvxd08otRvQ==
X-Received: by 2002:a05:6102:3c92:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7cc36af1428mr1517782137.32.1792412225214;
        Mon, 19 Oct 2026 05:17:05 -0700 (PDT)
X-Received: by 2002:a05:6102:3c92:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7cc36af1428mr1517767137.32.1792412224510;
        Mon, 19 Oct 2026 05:17:04 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ae6d2esm271272245e9.6.2026.10.19.05.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:17:03 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:17:02 +0200
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
Subject: Re: [PATCH net-next v8 2/5] net: stmmac: drop split frames on AF_XDP
 zero-copy RX
Message-ID: <atYKPgSrad4jAsJM@lore-desk>
References: <20261018-stmmac-rx-mb-v8-0-5f58c0b25849@oss.qualcomm.com>
 <20261018-stmmac-rx-mb-v8-2-5f58c0b25849@oss.qualcomm.com>
 <8c9e47e535ecc8190fa1c93ad5b5e32a@tipi-net.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RucSXeWTOi+YV0bB"
Content-Disposition: inline
In-Reply-To: <8c9e47e535ecc8190fa1c93ad5b5e32a@tipi-net.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfX8tnYWTnUgfTt
 CcJl6ynwd3YLpxggJWp0RX8PR4PwAC9JLUyApfBDMGdi776YM578LZrspvp/bAOwEL2Ghew6I+P
 iq4+5ohNzqB52wIQeSXSfjhwQiLViw3/0aXfX3xIGqO70TD8S1kngrjUndh6AQZ/PJq5ZK2NDAc
 +N6/bpe0dqntL8mBpOMpFu+WYLEi3Sd6xX9KmHRmL78/qbyVpWOOEfWgkiETlxwPaV+ZWkBzGt/
 PtskRp+fOOu8Yo/3/1ZOD/y78BaxQOOl1g/URP0aanrjOL4Wb99cthV0jdPoPupzWXvL0q/rWpx
 6UtJUP2d1GcVTntwzDGfFB3Z94ApKn+AJIptWHuzfa1skO7CoD4tkp68OBZQV9pWWFZQaJcww3V
 NagVBd4i78X9FYWnjXTezax1xG47DmoQjNXhl5VmdyGxnVIdcuOzh0jM7ekmwuCQDBPKLblsg8C
 h73e0pcFno/2SW51lfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfX8GbJTtWEAP10
 0uMvdy6Q+tWwe9+M8cCoixeKh9zDraRvN/84hrDStBZPtcHHlhTBpd01RF54RTZthM/wmbMefny
 vDOkzZhGQnnXcYyzWEV/6beGcyGR8mM=
X-Proofpoint-GUID: qleC0B5p7iIdjud__3x_9V4aN7-Sr6DO
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad60a42 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Hv1B4VqaJksLaqeBzrcA:9 a=CjuIK1q_8ugA:10 a=Uhvad6e0Kplh35gtGjIA:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: qleC0B5p7iIdjud__3x_9V4aN7-Sr6DO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_051707_725607_6A170002 
X-CRM114-Status: GOOD (  37.47  )
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

--RucSXeWTOi+YV0bB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo
>=20
> On 18.10.2026 19:07, Lorenzo Bianconi wrote:
> > stmmac_rx_zc() assumes a 1:1 mapping between a received frame and an
> > XSK pool buffer and drops any frame that spans more than one RX
> > descriptor:
> >=20
> >         /* XSK pool expects RX frame 1:1 mapped to XSK buffer */
> >         if (likely(status & rx_not_ls)) {
> >                 xsk_buff_free(buf->xdp);
> >                 buf->xdp =3D NULL;
> >                 dirty++;
> >                 count++;
> >                 goto read_again;
> >         }
> >=20
> > The non-last descriptors are freed and dropped, but the frame is not
> > marked as errored. When the poll reaches the last descriptor of the
> > same frame, error is still 0, so the fragment is handled as a complete
> > frame: it is passed to the XDP program, copied into an skb on XDP_PASS,
> > or converted for XDP_TX. The tail starts in the middle of the original
> > payload at a predictable offset and, parsed as a fresh frame (len =3D=
=3D 0),
> > stmmac_rx_buf1_len() reports the full dma_buf_sz length for it even
> > though the DMA engine only wrote the tail remainder into that buffer, so
> > the reads extend past the received bytes and can reach beyond the end of
> > the XSK pool buffer. GMAC4 always enables jumbo frames (GMAC_CONFIG_JE
> > in GMAC_CORE_INIT), so an on-link peer can trigger such a split even
> > when the interface MTU is left at 1500.
> >=20
> > Set error when the 1:1 mapping check drops a descriptor, so the
> > remaining descriptors of the frame - including the last one - are
> > drained and released with xsk_buff_free() instead of being processed as
> > a new frame. Account every freed buffer with dirty and count the
> > dropped frame once in the poll budget / rx_pkt_n. The direct 1:1
> > mapping drop also increments rx_dropped.
> >=20
> > Normalize the legacy normal and enhanced descriptor callbacks to report
> > rx_not_ls together with discard_frame for non-last descriptors. This
> > allows both stmmac_rx_zc() and stmmac_rx() to drain split frames on
> > dwmac100 and dwmac1000 instead of reparsing the final fragment as a new
> > packet.
> >=20
> > Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
> > Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
>=20
> This grew quite a bit since v6 (legacy desc changes, stmmac_rx() etc),
> so my R-b should have been dropped. I had another look and two small
> notes below.

Hi Nicolai,

ack, right.

>=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
>=20
> > [...]
>=20
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5695,18 +5695,21 @@ static int stmmac_rx_zc(struct stmmac_priv
> > *priv, int limit, u32 queue)
> >  		if (priv->extend_desc)
> >  			stmmac_rx_extended_status(priv, &priv->xstats,
> >  						  rx_q->dma_erx + entry);
> > -		if (unlikely(status =3D=3D discard_frame)) {
> > -			xsk_buff_free(buf->xdp);
> > -			buf->xdp =3D NULL;
> > -			dirty++;
> > +
> > +		if (unlikely(status & discard_frame)) {
> >  			error =3D 1;
> >  			if (!priv->hwts_rx_en)
> >  				rx_errors++;
> >  		}
>=20
> There's no !error check here, so on the legacy descriptors a split
> frame now counts once per descriptor in rx_errors. stmmac_rx() in 3/5
> counts it once. Could you add the !error check here too?

ack, I agree we should align stmmac_rx() and stmmac_rx_zc(). In order to av=
oid
reposting the full series for this change, do you agree to address it as a
follow-up patch?

Regards,
Lorenzo

>=20
> > [...]
>=20
> > @@ -5883,7 +5887,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int
> > limit, u32 queue)
> >=20
> >  		if (priv->extend_desc)
> >  			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx +
> > entry);
> > -		if (unlikely(status =3D=3D discard_frame)) {
> > +
> > +		if (unlikely(status & discard_frame)) {
>=20
> AFAIU this also changes GMAC4: a frame with an error plus an IP header
> error returns discard_frame | csum_none, which the old "=3D=3D" let
> through. Dropping it is right, but maybe worth a line in the commit
> message?
>=20
> > [...]
>=20
> With the !error check added:
>=20
> Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
>=20
> Thanks,
> Nicolai

--RucSXeWTOi+YV0bB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatYKPgAKCRA6cBh0uS2t
rEsiAQDQamG4derazgJTTxn7SZMOZWRJHjCj7eJxazZzk/TRsQD9HW+DZjAv8DRc
o4Rs6TsL7BDw+otQr4rfMam5lAKUnwM=
=n+5w
-----END PGP SIGNATURE-----

--RucSXeWTOi+YV0bB--

