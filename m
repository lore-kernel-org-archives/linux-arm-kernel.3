Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1506DCC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2Pp+9YizOBDl9Z2JWZti07fbnD+Dxt3FH6Ir7Jb7Bk=; b=G9B9hCYC2771f7D0QNQbEf/nYV
	x9qY8UfDQc0cKqInkw2mzaNFaKxQa7X73YtzXdRvDzO+Nr2UJ0E6bCL/G2OTC9nb3Oc2LeCUW59CL
	Nbb/OGnFEM7rrolBAmy5rkU8wxxX/UXj9y9hwMoPYdZHJ3TyrGw67emsK+V48h1/rf5haX+jHkOe8
	pRAZJOzeyDuPUWyBQU95U+RnQcX+Rsah0hP8CPp/SVujHPKvFK3H0m1QDnKFMWauvDrDKnYgfDXtA
	kTvSuDT/kRj/oNsI1RWZUWVTDSlDPPGC7A94rhSu69Gxx2VEhorp1EgF8spXA0TkFp97CO+Lkhhom
	7VqDYYIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYYR-0000000CPTc-49TR;
	Tue, 13 Oct 2026 09:12:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYYL-0000000CPSL-2wTT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:12:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xvoE790830
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E2Pp+9YizOBDl9Z2JWZti07f
	bnD+Dxt3FH6Ir7Jb7Bk=; b=QCaDrP1qxyYBRIWjVNYHJ6lTXMqNSEIA5MrikGrH
	IptJH3JAd5J8fLQ5ihe5PAT2dTsT/WHsOBU+wMKfbJcbVMC5UiHZwTpbTDirNOC7
	yv+2vg21R1tf9otq28vVsSSnL5Ew6Jx+AevvuXJ9t2HEx6hrK5UoWX6RCbWopS+t
	p8xKPh2MPvNuuTbr2dKDZ0asHLsfWGsC0hiJb8TN2oT13UYTARJ5MX0107qF4j4z
	x4djFILlz5ogK5xpY7NbdN3ER95vatqWFn6eu9OUjgBmn5SUbdRbKj5wv7/yUfM7
	LeFWio/TVmBZVfmas8irAuv4gNTyny0FbvNvleKOexeMUA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjr1pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:12:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca9b53afaso759834785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791882728; x=1792487528; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E2Pp+9YizOBDl9Z2JWZti07fbnD+Dxt3FH6Ir7Jb7Bk=;
        b=i9HIXOOiD65Rfez1y0VbZaNPQLrVCEpymKLx37LC0yzY4zMqb0wMvhEXbPZC5xmKQJ
         a/brQJ5dwz4gUFI//j4gBWD4Bzht7KoTo17ev18UI36WXO2Iv2n9P6jrFq93mnsJvOst
         3iYk7hkbiwBNRE8KpLwRPy+pYU8N6SR/Mw/5qTcRqjAuFu6NE0KkuW8hiK7JaDGlTmII
         4QZKA+FfFFaN6feF+h14pQrNVgIysi/YiMJwDORhaKwNlLCqJsIARi4o1LR5KVSXTXP7
         MzL6oLzkxwiO3hUOj84UPpg9aPZeO+P3i070Vsj+902VWQ0mYMb5UrLF0KVlcsJ+nM+J
         ns1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882728; x=1792487528;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2Pp+9YizOBDl9Z2JWZti07fbnD+Dxt3FH6Ir7Jb7Bk=;
        b=k2VjH61w4tw02gkoFJEmuJWgCatUIeVfK2zYVRP6Fv+6sMjS64dd15PZXiucJEPfh8
         TQatkoOqleU7U5LibhTMhfvfN4DOmzqO9SGpckPVaCod/3ncDxgZq/ILt9uv8/u/4nTf
         M/MGeN5RXXGV74LUV0RswEgpn/4x6p36Fu0fb/Zb2RZRcSfnX9Y6cFyD4CEZv1GMP7Tq
         qgOM/DuRfn/36icHNPBxiehiTAS3gigZsrW+8kEbDXEiqDNzJIKX4KZ7GCZ0P3sqnpol
         8II9YNZY9YDrnALK0W1D3fTq4r7g65365bornniJ6HqZpop7dgWiCldObnGOsIz1EhkE
         sIng==
X-Forwarded-Encrypted: i=1; AKwUvBwLBjJI/rvZfBcYGlOeKDNgkG+tHeFJAoefxJC38RKXP7NdBUPy/jFo4V+qoqXos9JOUEe5PEy4bpFBxExDTAHm@lists.infradead.org
X-Gm-Message-State: AFq9FYKyzlCGnltxwyKjzBX4D4powI2QjfU70G4zpmvh+XytHoWsu/jJ
	50jVcV00hKFTslz3zr/eOQWk3r+x2keL0VE6pOwrNTHoKNchbv93g2Zx2oXvQd5hCgblKgdqzr+
	W+9p0C7Y0FiGvnLYY8jHMTJiqIc8CccfQ6tHzvaN8wEWPbO7CPpCAcsai+YsuCyOkmZ5YXgcr11
	v4qg==
X-Gm-Gg: AYBFou0nWkMe1QK7XhgP93U9D7/ZwOktW3gvte4yJt+1d9tQh+KWiem80/vjgfYyMoF
	FFoCT/X2VdCQPODLLejY7uVDYRvsjc7E08KxqaxTeKtSY6HmQMsPrfCQMc5T3fDfon76x/iPDnP
	mFmP2BgO9OPmaVf5tEvvpnYqeTJlbWBupIxbPYezPXZljjifh799PcvWakcGgSKJ+Nt+Bfd9aE1
	Igs2coYA6mV5ETntNilfQX20WwBTJbIvIvIeUSMxF/JjazXSB7b7W4efCq+TG6b794UFVWft8DR
	YW5+aZHo7yjywpfQgqWED254lwG1XMD/Z1kOc6ORqGGnlcaCFwMYCw9vtbH6Dsck+yCsPkCwaqV
	RzaxoJl7e8BH84A==
X-Received: by 2002:a05:620a:4689:b0:93e:5312:3c96 with SMTP id af79cd13be357-93ebd20e0c1mr2124288285a.26.1791882727629;
        Tue, 13 Oct 2026 02:12:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4689:b0:93e:5312:3c96 with SMTP id af79cd13be357-93ebd20e0c1mr2124284985a.26.1791882726961;
        Tue, 13 Oct 2026 02:12:06 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4e8csm3810292f8f.23.2026.10.13.02.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:12:05 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:12:05 +0200
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
Subject: Re: [PATCH net-next v6 4/4] net: stmmac: rework stmmac_rx to support
 XDP rx multi-buff
Message-ID: <as315RcZF2RcJGLW@lore-desk>
References: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
 <20261012-stmmac-rx-mb-v6-4-2225050915c1@oss.qualcomm.com>
 <9bf19616bc6fd8680e65272f45d14239@tipi-net.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5hJUbagSp6rWj5w8"
Content-Disposition: inline
In-Reply-To: <9bf19616bc6fd8680e65272f45d14239@tipi-net.de>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX8hTJc6kjbn9M
 cNoL07aHhId5Jk8fZ1RsIzdJTg52Hm2t0B55a6+v5m7EnO49ZjRCeX+Bqr2fLrmBJI/SblNpSKD
 Lt7RWY+wYwSgB+VJ3Rrd2O+KTdm9PLg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX803MgpID5NU9
 XKKsovLKWcxjm3jjHpkFFv6vWY5d6eEOywaJOklk7489smar0m3NRVAscrcena1NmqZIfT0f0A3
 w/MIzwqNGp8a4cWlCTr260DHaSvkwzqJdEwgqeERSCocC27X8qG+gecOTWvITwKGacq1Fi+1OJc
 PIaJaWqe2achZAyUmzRQftTlUzudf+i0BauwVtbOYKzF4OcASPc6jkS2+0KAILRV9sbr46REaea
 ooXuzaXz8xY+NzfqTbuYaLWocftAhVeDWwyyN1f7feqiYr/LnNk2qYcj7bMVWSWIubLzzEfEtEt
 vUJPJxY55WRrjciZb/Yr88KmpQiFeviSDL7YSij0KsNOKFsqa9IkyIW8xVT9y0KIEvjduveU7KS
 pvmN3rdzE86agFw0zDw7gU6LEk7cv5+Qx7N6rZbaz0Po4MvKVuZDCIJRxTZmiHiAJdIrR99A51k
 JJKk+vpKwRdFpNqFy8g==
X-Proofpoint-ORIG-GUID: CvyrDoSacZg3MiwSRIyMWBAhb1VLYgFM
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6acdf5e8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3yKrCuJdiH5fJuTJ9mQA:9 a=CjuIK1q_8ugA:10 a=EJuJvaCN_CdamGs11FwA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: CvyrDoSacZg3MiwSRIyMWBAhb1VLYgFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_021209_872191_DC94F228 
X-CRM114-Status: GOOD (  50.20  )
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

--5hJUbagSp6rWj5w8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo
>=20
> On 12.10.2026 18:44, Lorenzo Bianconi wrote:
> > Build the xdp_buff by accumulating all the descriptors that make up a
> > frame, so the XDP program runs on the full (possibly fragmented) packet
> > instead of just the first buffer. When the frame is not consumed by the
> > program, assemble the skb from the head buffer and the collected
> > fragments via napi_build_skb()/xdp_update_skb_frags_info().
> >=20
> > Note that XDP still rejects an MTU larger than ETH_DATA_LEN
> > (stmmac_xdp_set_prog(), stmmac_change_mtu()) and disables SPH, so an
> > ordinary frame fits in a single buffer. This path is therefore exercised
> > by frames that do span several descriptors (for example jumbo frames the
> > MAC admits through its jumbo-enable bit) and is groundwork for extending
> > XDP to jumbo/SPH; it does not enable XDP jumbo support by itself.
> >=20
> > For those multi-descriptor frames the old code was buggy as well: it ran
> > the XDP program once per descriptor buffer, so for a multi-descriptor
> > frame the program was also invoked on continuation buffers holding
> > mid-frame payload. It also subtracted ETH_FCS_LEN from the first buffer
> > even when it was not the last descriptor (its second buffer empty),
> > dropping four bytes from the middle of the frame while marking the FCS
> > as
> > already stripped and skipping the final pskb_trim(). Accumulating the
> > whole frame before running XDP fixes both.
>=20
> With patch 3/4 applied, these frames are already dropped in XDP mode,
> so this paragraph no longer matches the code this patch changes?

ack, I will remove it in v7.

>=20
> >=20
> > To do so, store the in-progress xdp_buff in rx_q->state instead of the
> > partially built skb, so the accumulated head and fragments survive a
> > NAPI poll boundary (mid-frame dma_own or dirty_rx break). The state is
> > saved only while a frame is in progress and cleared once it completes,
> > leaving it untouched when the poll does not process anything (e.g.
> > netpoll invoked with a zero budget).
> >=20
> > In addition:
> > - advertise NETDEV_XDP_ACT_RX_SG, since the RX path can now deliver
> >   non-linear buffers to XDP;
> > - drop multi-buffer frames when the attached program was not loaded with
> >   BPF_F_XDP_HAS_FRAGS, since a single-buffer program must not be handed
> > a
> >   non-linear xdp_buff;
> > - build the skb head with napi_build_skb() passing xdp->frame_sz, so
> >   skb_shinfo() lands on the same shared_info the fragments were
> >   accumulated into;
> > - carry the XDP metadata written with bpf_xdp_adjust_meta() into the skb
> >   via skb_metadata_set(), so it is no longer dropped and TC/BPF programs
> >   can read it through data_meta;
> > - attach fragments with xdp_buff_add_frag(), which initializes all the
> >   shared_info fields and takes care of the pfmemalloc bit;
> > - release the buffers collected in the xdp_buff when a frame is dropped
> >   on RX errors; the previous code relied on dev_kfree_skb() recycling
> > the
> >   skb frags, which no longer applies now that the head and fragments
> > live
> >   in an xdp_buff rather than a partially built skb;
> > - drop the whole frame when it would exceed MAX_SKB_FRAGS, where the
> >   previous skb_add_rx_frag() calls were unbounded;
> > - strip the Ethernet FCS from the accumulated xdp_buff with a
> >   driver-local tail shrink (stmmac_xdp_shrink_tail()) for both linear
> >   and fragmented frames, instead of trimming the skb or the first
> >   descriptor length.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
>=20
> > [...]
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> > [...]
>=20
> > +static void
> > +stmmac_xdp_put_buff(struct stmmac_rx_queue *rx_q, struct xdp_buff *xdp,
> > +		    int sync_len, bool allow_direct)
>=20
> This looks like xdp_return_buff(), apart from the sync length of the
> first buffer. Could the NAPI paths (XDP_CONSUMED and error_free_frag)
> use xdp_return_buff() instead? The teardown paths need allow_direct =3D
> false, so they would still need something local.

Theoretically I agree, but, since we still need stmmac_xdp_put_buff()
for the teardown path, I guess we can keep it since it is even an
optimized version with respect to xdp_return_buff(). What do yo think?

>=20
> > +{
> > +	struct skb_shared_info *sinfo =3D xdp_get_shared_info_from_buff(xdp);
> > +	int i;
> > +
> > +	if (likely(!xdp_buff_has_frags(xdp)))
> > +		goto out;
> > +
> > +	for (i =3D 0; i < sinfo->nr_frags; i++)
> > +		page_pool_put_full_page(rx_q->page_pool,
> > +					skb_frag_page(&sinfo->frags[i]),
> > +					allow_direct);
> > +out:
> > +	page_pool_put_page(rx_q->page_pool, virt_to_head_page(xdp->data),
> > +			   sync_len, allow_direct);
> > +}
> > +
> > +static struct sk_buff *stmmac_build_skb(struct xdp_buff *xdp)
> > +{
>=20
> This is very close to xdp_build_skb_from_buff(). Have you checked if this
> might
> be a fit?

yes, but we can't use xdp_build_skb_from_buff() since it runs eth_type_tran=
s()
modifying the skb->data pointer (in this way we will corrupt stmmac_rx_vlan=
()).
Agree?

>=20
> > +	struct skb_shared_info *sinfo =3D xdp_get_shared_info_from_buff(xdp);
> > +	u32 metasize =3D xdp->data - xdp->data_meta;
> > +	struct sk_buff *skb;
> > +	u8 num_frags =3D 0;
> > +
> > +	if (unlikely(xdp_buff_has_frags(xdp)))
> > +		num_frags =3D sinfo->nr_frags;
> > +
> > +	skb =3D napi_build_skb(xdp->data_hard_start, xdp->frame_sz);
> > +	if (!skb)
> > +		return NULL;
> > +
> > +	skb_mark_for_recycle(skb);
> > +	skb_reserve(skb, xdp->data - xdp->data_hard_start);
> > +	skb_put(skb, xdp->data_end - xdp->data);
> > +	if (metasize)
> > +		skb_metadata_set(skb, metasize);
> > +
> > +	if (unlikely(xdp_buff_has_frags(xdp)))
> > +		xdp_update_skb_frags_info(skb, num_frags, sinfo->xdp_frags_size,
> > +					  num_frags * xdp->frame_sz,
> > +					  xdp_buff_get_skb_flags(xdp));
> > +	return skb;
> > +}
>=20
> > [...]
>=20
> > +static int stmmac_xdp_shrink_tail(struct stmmac_rx_queue *rx_q,
> > +				  struct xdp_buff *xdp, int offset)
>=20
> This is only used to drop the FCS. On the last descriptor we already
> know the frame length, so could the 4 bytes be taken off buf1_len /
> buf2_len before the buffers are added? Then only the rare case where
> the last buffer has fewer than 4 bytes would need to trim the previous
> frag, and this helper could go away.

uhm, right. I guess we could do something like (and drop
stmmac_xdp_shrink_tail()):

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/ne=
t/ethernet/stmicro/stmmac/stmmac_main.c
index e80793bd6553..5cb8a6883f44 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6027,6 +6027,19 @@ static int stmmac_rx(struct stmmac_priv *priv, int l=
imit, u32 queue)
 		buf2_len =3D stmmac_rx_buf2_len(priv, p, status, len);
 		len +=3D buf2_len;
=20
+		if (!(status & rx_not_ls)) {
+			/* ACS is disabled; strip manually. */
+			if (buf2_len > ETH_FCS_LEN) {
+				buf2_len -=3D ETH_FCS_LEN;
+			} else if (!buf2_len) {
+				buf1_len -=3D ETH_FCS_LEN;
+			} else {
+				buf1_len -=3D (ETH_FCS_LEN - buf2_len);
+				buf1_len =3D 0;
+			}
+			len -=3D ETH_FCS_LEN;
+		}
+
 		if (!frames) {
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
@@ -6064,8 +6077,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int li=
mit, u32 queue)
 		if (likely(status & rx_not_ls))
 			goto read_again;
=20
-		/* ACS is disabled; strip manually. */
-		len -=3D ETH_FCS_LEN;
 		if (stmmac_xdp_shrink_tail(rx_q, &ctx.xdp, ETH_FCS_LEN)) {
 			if (!error)
 				rx_dropped++;

What do you think?

Regards,
Lorenzo

>=20
> > [...]
>=20
> Thanks,
> Nicolai

--5hJUbagSp6rWj5w8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas315QAKCRA6cBh0uS2t
rObYAQCy2tajGOULWzFImhcto8r0a2JaQpBQZNR/TbsHXIWUGwEApvfNEspODcun
ATgcQCea768H+tODWf15+U67WK1FxAY=
=2BN4
-----END PGP SIGNATURE-----

--5hJUbagSp6rWj5w8--

