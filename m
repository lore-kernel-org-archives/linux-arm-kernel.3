Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071DBCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 08:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDFKYb/m924u2VXBFcjCVaMkoZJEVndeSzqMZ0nALvQ=; b=TB8uzS0BDW18vVgNXrUIkfse9M
	2NvNfzBKt7IQGc93FWNrgdOsXTiNM1e/IvoTLv3zTnhclRl4d66iUhzRX9nodJWraCprErP3UlW98
	3AQZT+tYi22SKN16sP86OF/cfytqCLiaB3gAqSSXfw7CvHug0cJjTfApSGHBg3gzVdEb2jO4uWh5Q
	qvI0alM5FWfCyl63Yr30ZTvzWLbDbRbpATWkaoimLw/5ftNLUMrS9+onM6UmMKnzJyjeQUoXPPkuO
	RAg7ueiqWPBkf83+wmOhq7myPRwCAml2JLxTSKmCoySligh68XHrYW5JyGLFplERw6DVFj/lDnXCb
	RELz5iDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXhN-0000000CIqz-3VNP;
	Tue, 13 Oct 2026 08:17:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXhJ-0000000CIoy-0aVa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 08:17:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8HCHs3908182
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RDFKYb/m924u2VXBFcjCVaMk
	oZJEVndeSzqMZ0nALvQ=; b=TFx4T6s+vG6c2WLyALwPHKSqjTDtCN7fxBIwwo1J
	dU7J6toDY3QwVuwovF2S2kEb/grSQqpfCVP88Pj9VauALz8f5p1qZ9Bxp5osc2ph
	vVnfrKQb6faASfxul4QO1ApJ2kwEWaOGhETfWu2apCrsqyf3TObZqHgWPEOgQLhh
	Jpnfz0jCHN0kyEdJ1+M5FtNGd0ocJ05actKCyR08YPiN3TVfLRzIwpIZ6lq7Eu3K
	/BUuuasFa7IVJtOsSdtNiVQdtMTFTakXpwk2ovJmmd944coP1P693ovg32b8VC40
	5fKQICLfMUU7TMz2R+ZuGa4oQ6HVnMc2/r9FEOVCcyZX1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqtfk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:17:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso293657985a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791879436; x=1792484236; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDFKYb/m924u2VXBFcjCVaMkoZJEVndeSzqMZ0nALvQ=;
        b=j1jzj38riCYAXG7z+ioAhPsGwvqzlFknLIVpfaZMJbhh3w72MhVuPaLlGVSXfMrwz5
         z7+BpkcF4jAMVmlplPKexmeTXxJao2kBqvZuAS9J4q1WMzJSBtPLzPUtxA4psoP9Jvaj
         x8Xcg/Y8Tq/mX1BwMlu6Z2xME741cktwC2iAn2grocOK9Nbc2knv85rDgXLBVP57ANqH
         jw6dJctRGpkhnIwpDsS6gCJ8sUpV3/oycjMInAcYSMGTF6VB8rRfsTBbMr96keOPqoPQ
         cYY9020pp1ftbYzeMsrdKpFLjSqt/U4pBjGUhqhW4NqJQNiAlQ5CaFzds/54s+rvx71c
         dj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879436; x=1792484236;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDFKYb/m924u2VXBFcjCVaMkoZJEVndeSzqMZ0nALvQ=;
        b=wzpNRxLN7SZa74Stpc1CZbl9EtDLYJPlgNDw3Z/PNj6/fIjMYuw4hoAR8VgBH3ko13
         QCxC3xi/egOwgV7ZpVtlp/2D48qBLxyPzDaW/K41yFAwOVQt476MpHBKHjWIYcu1n/bX
         0IMdBuGwV0Q8Ow23+LlVgD2vZQ8oEk0kpz/z1n/6QEkumhidCjpJtAF747E1wx3iht77
         ntK+vVM3dIHupnDIdx9UpgOfHts1IAXq9GMgzBC8RVcvsNBc3a/ME/Rrgxj2e5PFpIoe
         OYS2EyDMKJJ8dqhTmDQoLhUoB3Lf2icTtVe5KgvotP6sVZbw5wwR78epjywKBpzvv4Sr
         EzJQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2rjL8CX3O1oSbPII4sjjQhvu5XlI5rMNsmTojyNEmoUvwkFEK37O8frQd8b7d2nNlR+ZgsY6LBWrEyNjTheka@lists.infradead.org
X-Gm-Message-State: AFq9FYJOwDKvfB0r46pBZHMAGQiwEcRj2GJnRXvDTSn2yUquI/rWXwDR
	JsA7++8qC1A50Qdn6/0TrSGdDsZt9+ihQdOptsuyRmyQoAC1Vw76nu3EBdEJuvEfLETtHbl2Ksx
	DFIZ572KYJum6PewCVk2t/il4GGEjJZJDASHEWME0HSTAlhwMMLjEXhbMadB/jKP5aMAoDPRQGp
	HSew==
X-Gm-Gg: AYBFou1+xK3inCr5AUmtFqNlcCLgX0YLOsbpsh/y+jqp2i4DG2VVJXJcPLviqRTglC3
	PL6KwJ6E5cfRVMjI7q6hzsUZsuQZ2mKKGlVYwwENXzBMZeSkHYlOWz5/TxzxDaTlCRPpVk6AHim
	e06iQ9xf0nNhj0ylpPPjqpppQ3HPLAESP8etr/GAeW0tumcPMEpyu06ml5f1tuKg+itWq2xgabJ
	q51shK6abDF82g5M05uti3AHKm2vN+5Lp2CC4/6dilP/3Kb6sFVGZ1Co6u2mq6b0hcioluPU8j8
	sU7kOQrWwe+2F3Ik/FaE3nN7DrdR1vrOUzR8l1egFGpaGZ+xiPjDwNLdFLtCOJxHWEOEb1uU0PL
	04pxlxWnaFQ0kyQ==
X-Received: by 2002:a05:620a:199e:b0:93c:5872:ef48 with SMTP id af79cd13be357-93ebd273616mr1824175985a.50.1791879435944;
        Tue, 13 Oct 2026 01:17:15 -0700 (PDT)
X-Received: by 2002:a05:620a:199e:b0:93c:5872:ef48 with SMTP id af79cd13be357-93ebd273616mr1824171385a.50.1791879435209;
        Tue, 13 Oct 2026 01:17:15 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18dcd7dd3sm221979045e9.2.2026.10.13.01.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:17:13 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:17:11 +0200
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
Message-ID: <as3pB16af0_QhNyB@lore-desk>
References: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
 <20261012-stmmac-rx-mb-v6-3-2225050915c1@oss.qualcomm.com>
 <b11af7d5d430dcddcc681484b50ae7e2@tipi-net.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KY7hfcVLGCw62j4b"
Content-Disposition: inline
In-Reply-To: <b11af7d5d430dcddcc681484b50ae7e2@tipi-net.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX5vM0swoAydyw
 kweInk9B776rLonoounN4Bnxg1elrPAfrfHD6O2LAZ3J+XARADzqOqOfJ4MGmK+G+KpJF+nrXKh
 M9fAijqY+LCqCSMTIG5n/Yrj+IYMEcFiP1byEwC+z8tjJ4TgyrVXlV0aBbOAuWl0sXWsC/g0HP5
 dc/r285h2cf3+2qCKwM+o5RQ4hqBnUcNOE5I9uGQ++6o3739LvkPo6jp5kHra4mSQeaZocXuIU/
 n524g6n/OT/LLXuyPJ42cu9Xnhmc6y1am72HUw+IRutGwoz+db2dnldD3GcNvkohLS2eOC5pe5H
 UpdrkQ+FkLRV7IIihObbrEVCVwyOJjA6Qpf3vjT+zp3BLrYufaKhiheXYpBVCJd0Pg9hzEX3Ras
 eEGB++YaoPVE92m+nZh9+4sSb9ndTGjhpyRqm60/j+ZL8SsbxUSGbC5uuHtwGmnXO9v5XjzlHbY
 IZSji4d4eBhJyvyEetQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX9iut12f89eRi
 VwzKrdhBHFAGEy1z4hoDu+JUYGy3UKSJEYwqOxlS4cvyx3pSCCYVyU9Hxb+WScLhRTFdNSY0D3b
 1fvV1nGkZV1VOI+rTyzEZIQ8F58+aho=
X-Proofpoint-ORIG-GUID: qU9w7tshyhb_uXPsYQUNH-oCPywjd9xE
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6acde90f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7PNn2skMB5_rZfgV75sA:9 a=CjuIK1q_8ugA:10 a=nfflnHfShdqUK23c0sYA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: qU9w7tshyhb_uXPsYQUNH-oCPywjd9xE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_011721_310222_9B1B1307 
X-CRM114-Status: GOOD (  42.10  )
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

--KY7hfcVLGCw62j4b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 12, Nicolai Buchwitz wrote:
> Hi Lorenzo
>=20
> On 12.10.2026 18:44, Lorenzo Bianconi wrote:
> > stmmac_rx() runs the XDP program once per descriptor buffer and uses
> > skb =3D=3D NULL as the only marker for the start of a frame. A frame la=
rger
> > than one buffer is split by the hardware across several descriptors;
> > GMAC4 enables jumbo frames unconditionally (GMAC_CONFIG_JE in
> > GMAC_CORE_INIT), so an on-link peer can deliver such a frame even when
> > the interface MTU is left at 1500.
> >=20
> > When an XDP verdict ends a non-last descriptor, skb is cleared and the
> > next descriptor of the same hardware frame is parsed as a new frame.
> > For XDP_CONSUMED this happens via read_again with len preserved, so
> > stmmac_rx_buf1_len() then returns min(dma_buf_sz, plen - len) for the
> > last descriptor, which can be as small as 0-3 bytes. buf1_len -=3D
> > ETH_FCS_LEN underflows and xdp_prepare_buff() puts data_end far past
> > data; on XDP_PASS this produces an skb whose length is close to 4G that
> > reaches the network stack (skb->tail and skb->len are 32-bit and wrap
> > below skb->end, so skb_over_panic() does not fire). A 4+ byte tail is
> > instead offered to the XDP program and delivered as a standalone
> > mid-payload Ethernet frame on XDP_PASS. XDP_TX/XDP_REDIRECT instead
> > falls through to the next iteration, resetting the running length, so
> > the tail is re-parsed as a full-size new frame.
> >=20
> > XDP does not support scatter-gather frames until the multi-buffer
> > rework, so drop the whole frame instead: mark it as errored as soon as
> > a non-last descriptor is seen while an XDP program is attached, drain
> > and release every descriptor - including the last - and account the
> > frame once in rx_dropped. Removing the re-parse lets both XDP verdict
> > branches simply complete the packet via next.
> >=20
> > Note: the subsequent "net: stmmac: rework stmmac_rx to support XDP rx
> > multi-buff" accumulates the whole frame into a single xdp_buff and
> > supersedes this patch; the fix is kept so the net portion of the series
> > stands on its own.
> >=20
> > Fixes: 5fabb01207a2 ("net: stmmac: Add initial XDP support")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 28
> > ++++++++++-------------
> >  1 file changed, 12 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 426bb68c9bbc..8c08d44fdbd3 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5893,18 +5893,24 @@ static int stmmac_rx(struct stmmac_priv *priv,
> > int limit, u32 queue)
> >=20
> >  		if (priv->extend_desc)
> >  			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx +
> > entry);
> > -		if (unlikely(status =3D=3D discard_frame)) {
> > -			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
> > -			buf->page =3D NULL;
> > +
> > +		if (unlikely(!error && status =3D=3D discard_frame)) {
> >  			error =3D 1;
> >  			if (!priv->hwts_rx_en)
> >  				rx_errors++;
> >  		}
> >=20
> > -		if (unlikely(error && (status & rx_not_ls)))
> > -			goto read_again;
> > +		/* We do not support SG in XDP mode */
> > +		if (unlikely(!error && (status & rx_not_ls) &&
> > +			     stmmac_xdp_is_enabled(priv))) {
> > +			rx_dropped++;
> > +			error =3D 1;
> > +		}
>=20
> AFAIU GMAC4 and XGMAC always use the second buffer of a descriptor. If
> so, at MTU 1500 a frame of up to 3072 bytes can fit in one descriptor,
> and this check would not catch it?
>=20
> The XDP program would then only see the first buffer. With XDP_TX the
> frame is cut and sent too short. With XDP_PASS the second buffer is added
> after the program already decided.
>=20
> Patch 4 fixes this. But if this patch should work on its own, should it
> also drop the frame when buf2_len is not zero? Or am I missing
> something?

Hi Nicolai,

IIUC your comment we are missing the case where we have a single descriptor
(rx_not_ls is not set in status) but the packet is splitted over buf1 and b=
uf2,
right? Something like:

	...
	buf2_len =3D stmmac_rx_buf2_len(priv, p, status, len);
	len +=3D buf2_len;

	if (unlikely(stmmac_xdp_is_enabled(priv) && buf2_len)) {
		rx_dropped++;
		dev_kfree_skb(skb);
		goto next;
	}
	...

Is my understanding correct?

Regards,
Lorenzo

>=20
> > [...]
>=20
> Thanks,
> Nicolai

--KY7hfcVLGCw62j4b
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas3pBwAKCRA6cBh0uS2t
rKv6APsHFZSMX2dOAS1p36e6ZsqIAiOI0NDwoK6myQr0w44IyQEAuyVt58Q+sb1x
hWYvoUu5yllNvcDzIt78fFC420vYdAw=
=jWne
-----END PGP SIGNATURE-----

--KY7hfcVLGCw62j4b--

