Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AC6CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0joQw94XiM/OPOK+JDq2n0qSTv4A0S4JrAUcnweeYvA=; b=Xd6yHEhGjbGzSmcEdaZhWyQ6Gi
	qKVkQZ0pAg3vUHdg+4+ItDGCy/701nIMNXOVfKRvv9KbqG16n80Itl7u/FmkBs8ReJ4L4rMVwZLkJ
	227+2sUbiwgjoMoXoZTlDBg4ENAvDMbmf2E0/d+ddvcszGQ1YZGMvsFSP6mQGbZ1KuIsRiSjb1vIO
	jP2ie1Aoev4464HUognNPvoEzkq/7ULfBMkyzpZPOy4epm1CGItG1DPuzqNysGOn9NKU/RSGCSIbk
	kQtQ5u6YCxpA36MI1uc8a9f4zprBSYP3GoVK5hL96uSR3wcePk4BRPG+1Y+TMK+4Rg2ywBNISgNOE
	BO0B1R1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZYk-0000000CXQo-0A4p;
	Tue, 13 Oct 2026 10:16:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZYX-0000000CXPh-27KL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:16:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9oH9B3476145
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0joQw94XiM/OPOK+JDq2n0qS
	Tv4A0S4JrAUcnweeYvA=; b=P3NniW9JLpsxlSeGSlDQqw14cuf1x1w5VWBDx7IM
	1RlASUks3lx34QJE3AL/94Nhd6ZrJCyOlpAvjqgCPRvu4wyVAKYIvvfTOlo5Bvos
	v/DgUlPe7dZX+yexPUNO0re42XTL4vGM4HgUmLAAFRFbmKQ2e2G/k7LxSONZsV1I
	o0v2WzPJ9/5tdO4trDhtEn4gF4v15Pw5PmHccgKACYnLg/eKNoM1ZAToFtaqk4nX
	kOjBXkkp9X9ADOGi2/lW5cNORpEaSLS9WwGtQrZfctGl0wnKNeswEkavY9pDAVwz
	4u0hVvDoYpFmmgxzAMSOZpzrTDVaX8xI2dY4BVStc+A5Eg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9fx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:16:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so334136585a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886584; x=1792491384; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0joQw94XiM/OPOK+JDq2n0qSTv4A0S4JrAUcnweeYvA=;
        b=h8IXHMVDK3/cdRok4EHvSUKbKRUtN+M0A0e1Ovnu0Qt9C3RYnddNlPZN6MhgT8JAzI
         tfuHBA3MA0B03TaDruUVn7Zgzro4NSd3RPDD4lbn7ssyERh8oz9gPgpm6F0G5vaJ9EGz
         JJ9t0YgIYe7BAwbFHeMFWTpqyd90jNT+TrGphoQ9QtuTu+tG9Yq9SdDncaeE7HYgbJYt
         G/7StFuiAaO3rslq9S7FO+so9NNLpaCvQD3Rftd3n0jx0hEbUgBvVVDIqtHUQ8WIAJN/
         G3vl7bn9iF2k1drwYjan0u4dZIxSOY+l6E+hLfGAqIfxvcWvPoLONDljXeJxXLhKRJ6d
         GR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886584; x=1792491384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0joQw94XiM/OPOK+JDq2n0qSTv4A0S4JrAUcnweeYvA=;
        b=hFaL+hnXvmPk4IQHIsuzlp42f2/jATtpS20uWaXSF7i9cW80t+3svqtYvsdN9JVOxH
         e0bG68bD11cwkDM8JA5BraDbR3ozBES97fcTggkVYrIlL8bNVAZbyPXPZVIKdX6K0QDM
         Uys4PsIYt7triX/b05Mn1deoPHXthpSXlxv8D1w9M8pKvSvGt0IBWacJ84s1g8oaudQB
         DoyiXani6WFbYx0qTh4PyIA770LG0kn45cIW4h6x16ibu/lfJ4CRfIVxhcndYrzp7iNa
         AyyIf8VC9blASZ97AXxWV445bGXhVAejbEdNBqsrpeyaoDdsg7Dwatf4TFPvt8p8kgUQ
         lN5w==
X-Forwarded-Encrypted: i=1; AKwUvBxPMn/ENY5Qts0Jwa4P2S3X5C/Mnv9uGMSI7Hy5XO7EGkTswN4ZwSYuR7B3+/8hkZoW+1J+l67OozTjPn4khnzA@lists.infradead.org
X-Gm-Message-State: AFq9FYLRkSHMIxiIgzY1klzLkbhB9eOIMbXan3kJJNhhgjd5IT5kk5TE
	3oEjlxGXfD9stGosMfc6yfhqLUbJHoyjvlh7wLfuOhY2eo10jZzZq/HPbuloE55kJtWHA1xmPqR
	shkkYN2lPBdyOneltg0ft71wiY8U0sReMVWzHiLxf0HngSapnzFhqXCNSCiTMwgF9OT5L+SWA1q
	jWKQ==
X-Gm-Gg: AYBFou2DeraWKptbfnxpQn0Wbm8pG0Ug6X3ni4L7AxEKCrvzToJoKP6xGuOtg97tBv+
	xLHk+D4bAK5fuzJRhkQ0PR6+tfTXtOwPs8irAhyCBr6V5WMOVZUXPbPSkABm+B0YD+xTMs5Nd/A
	yTNCaSy3C/AHIsyEFtnaP7Tw6uxzbK42HEg3867ozAuoQKo6sP+M/+CV1j77cgVcG2j8+wZcJOE
	PDAB+eP8ORa1Q20W/Tpxl99ONdknKrrqdvz97RwiCzlLlV3ddTSMDZ315jRZGlfReuz9XkIDsFb
	GNLi0ztHnd60do0xcKgN0/t6jpjq6sS+bblIwfpjXzFyyrbwFO1BVwOR6S2B2U9I7u3i/Eoe4cC
	oFkUS/2jFrfKHEw==
X-Received: by 2002:a05:620a:6186:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93ebd248378mr1946433885a.34.1791886583399;
        Tue, 13 Oct 2026 03:16:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6186:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93ebd248378mr1946429585a.34.1791886582699;
        Tue, 13 Oct 2026 03:16:22 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc51c1sm4259497f8f.46.2026.10.13.03.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:16:21 -0700 (PDT)
Date: Tue, 13 Oct 2026 12:16:20 +0200
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
Message-ID: <as4E9Oxr03YYE0lU@lore-desk>
References: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
 <20261012-stmmac-rx-mb-v6-4-2225050915c1@oss.qualcomm.com>
 <9bf19616bc6fd8680e65272f45d14239@tipi-net.de>
 <as315RcZF2RcJGLW@lore-desk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mu66gn9kz4J4GejD"
Content-Disposition: inline
In-Reply-To: <as315RcZF2RcJGLW@lore-desk>
X-Proofpoint-GUID: aua4mcZoRO9PPw73XTqzqIXgHaXCGA4R
X-Proofpoint-ORIG-GUID: aua4mcZoRO9PPw73XTqzqIXgHaXCGA4R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX4YgV+KMDqojz
 xk33z6iL1fDAno/OZJztK5hmhJMWikS4JIvgYvT1xfDRYLij8MmFdaKet3/IyqSFOqWmwm3T+Q/
 eOaHN60qmwkKtSlSBNVF+1LeepawST8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXzh5pRrFoL3qn
 IrcSTsLmCSfplC9r4xOkcuyzeLBUrBHTYqUlA90e4up9aQM1MxC89bFFTMqD0Q9+Xk5J5hgPQQC
 u7semqZDxH8lsLqApl0nLNJMEH5BI82citR1mU7PxUqCMc8hDhvN4oxccPeBb8YNgnBam6y/Q0K
 EWpI2SAVMRl0C6wV0skJ8wccxX9LuX0QSU2WZZAevZL3aGYZ+A5wsoDPKvmmZi3KsXp3HOdVTs3
 bY2BALky5FJnwfI/Iik2BL730Y9BqbpQ7rXT51lcKTqVr9Z2/FCYbTVhxv54NhoxpxKXqEchZPL
 j9rkMhIhYM+iiUOewwCJngFQCnZeAMJgwlWurtgFzYieRehqJ7OXrdPPsEH8FEQo9krrviINEyi
 /axqPBO5gD2bzwFF7Bisf7516FOxdo/bzL8pAA0D8AzuuyC1q4jAZHBxWevwFqfVsOM0UIDFBM0
 GwXF7HAS+Ssbm+rgc4w==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace04f8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=v17Ietvw4lErNa0x46sA:9 a=CjuIK1q_8ugA:10 a=3mV5Pt-Fye_HxHZc_IkA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_031635_173575_CB43125C 
X-CRM114-Status: GOOD (  54.61  )
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

--Mu66gn9kz4J4GejD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 13, Lorenzo Bianconi wrote:
> > Hi Lorenzo
> >=20
> > On 12.10.2026 18:44, Lorenzo Bianconi wrote:
> > > Build the xdp_buff by accumulating all the descriptors that make up a
> > > frame, so the XDP program runs on the full (possibly fragmented) pack=
et
> > > instead of just the first buffer. When the frame is not consumed by t=
he
> > > program, assemble the skb from the head buffer and the collected
> > > fragments via napi_build_skb()/xdp_update_skb_frags_info().
> > >=20
> > > Note that XDP still rejects an MTU larger than ETH_DATA_LEN
> > > (stmmac_xdp_set_prog(), stmmac_change_mtu()) and disables SPH, so an
> > > ordinary frame fits in a single buffer. This path is therefore exerci=
sed
> > > by frames that do span several descriptors (for example jumbo frames =
the
> > > MAC admits through its jumbo-enable bit) and is groundwork for extend=
ing
> > > XDP to jumbo/SPH; it does not enable XDP jumbo support by itself.
> > >=20
> > > For those multi-descriptor frames the old code was buggy as well: it =
ran
> > > the XDP program once per descriptor buffer, so for a multi-descriptor
> > > frame the program was also invoked on continuation buffers holding
> > > mid-frame payload. It also subtracted ETH_FCS_LEN from the first buff=
er
> > > even when it was not the last descriptor (its second buffer empty),
> > > dropping four bytes from the middle of the frame while marking the FCS
> > > as
> > > already stripped and skipping the final pskb_trim(). Accumulating the
> > > whole frame before running XDP fixes both.
> >=20
> > With patch 3/4 applied, these frames are already dropped in XDP mode,
> > so this paragraph no longer matches the code this patch changes?
>=20
> ack, I will remove it in v7.
>=20
> >=20
> > >=20
> > > To do so, store the in-progress xdp_buff in rx_q->state instead of the
> > > partially built skb, so the accumulated head and fragments survive a
> > > NAPI poll boundary (mid-frame dma_own or dirty_rx break). The state is
> > > saved only while a frame is in progress and cleared once it completes,
> > > leaving it untouched when the poll does not process anything (e.g.
> > > netpoll invoked with a zero budget).
> > >=20
> > > In addition:
> > > - advertise NETDEV_XDP_ACT_RX_SG, since the RX path can now deliver
> > >   non-linear buffers to XDP;
> > > - drop multi-buffer frames when the attached program was not loaded w=
ith
> > >   BPF_F_XDP_HAS_FRAGS, since a single-buffer program must not be hand=
ed
> > > a
> > >   non-linear xdp_buff;
> > > - build the skb head with napi_build_skb() passing xdp->frame_sz, so
> > >   skb_shinfo() lands on the same shared_info the fragments were
> > >   accumulated into;
> > > - carry the XDP metadata written with bpf_xdp_adjust_meta() into the =
skb
> > >   via skb_metadata_set(), so it is no longer dropped and TC/BPF progr=
ams
> > >   can read it through data_meta;
> > > - attach fragments with xdp_buff_add_frag(), which initializes all the
> > >   shared_info fields and takes care of the pfmemalloc bit;
> > > - release the buffers collected in the xdp_buff when a frame is dropp=
ed
> > >   on RX errors; the previous code relied on dev_kfree_skb() recycling
> > > the
> > >   skb frags, which no longer applies now that the head and fragments
> > > live
> > >   in an xdp_buff rather than a partially built skb;
> > > - drop the whole frame when it would exceed MAX_SKB_FRAGS, where the
> > >   previous skb_add_rx_frag() calls were unbounded;
> > > - strip the Ethernet FCS from the accumulated xdp_buff with a
> > >   driver-local tail shrink (stmmac_xdp_shrink_tail()) for both linear
> > >   and fragmented frames, instead of trimming the skb or the first
> > >   descriptor length.
> > >=20
> > > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > > ---
> >=20
> > > [...]
> >=20
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> >=20
> > > [...]
> >=20
> > > +static void
> > > +stmmac_xdp_put_buff(struct stmmac_rx_queue *rx_q, struct xdp_buff *x=
dp,
> > > +		    int sync_len, bool allow_direct)
> >=20
> > This looks like xdp_return_buff(), apart from the sync length of the
> > first buffer. Could the NAPI paths (XDP_CONSUMED and error_free_frag)
> > use xdp_return_buff() instead? The teardown paths need allow_direct =3D
> > false, so they would still need something local.
>=20
> Theoretically I agree, but, since we still need stmmac_xdp_put_buff()
> for the teardown path, I guess we can keep it since it is even an
> optimized version with respect to xdp_return_buff(). What do yo think?
>=20
> >=20
> > > +{
> > > +	struct skb_shared_info *sinfo =3D xdp_get_shared_info_from_buff(xdp=
);
> > > +	int i;
> > > +
> > > +	if (likely(!xdp_buff_has_frags(xdp)))
> > > +		goto out;
> > > +
> > > +	for (i =3D 0; i < sinfo->nr_frags; i++)
> > > +		page_pool_put_full_page(rx_q->page_pool,
> > > +					skb_frag_page(&sinfo->frags[i]),
> > > +					allow_direct);
> > > +out:
> > > +	page_pool_put_page(rx_q->page_pool, virt_to_head_page(xdp->data),
> > > +			   sync_len, allow_direct);
> > > +}
> > > +
> > > +static struct sk_buff *stmmac_build_skb(struct xdp_buff *xdp)
> > > +{
> >=20
> > This is very close to xdp_build_skb_from_buff(). Have you checked if th=
is
> > might
> > be a fit?
>=20
> yes, but we can't use xdp_build_skb_from_buff() since it runs eth_type_tr=
ans()
> modifying the skb->data pointer (in this way we will corrupt stmmac_rx_vl=
an()).
> Agree?
>=20
> >=20
> > > +	struct skb_shared_info *sinfo =3D xdp_get_shared_info_from_buff(xdp=
);
> > > +	u32 metasize =3D xdp->data - xdp->data_meta;
> > > +	struct sk_buff *skb;
> > > +	u8 num_frags =3D 0;
> > > +
> > > +	if (unlikely(xdp_buff_has_frags(xdp)))
> > > +		num_frags =3D sinfo->nr_frags;
> > > +
> > > +	skb =3D napi_build_skb(xdp->data_hard_start, xdp->frame_sz);
> > > +	if (!skb)
> > > +		return NULL;
> > > +
> > > +	skb_mark_for_recycle(skb);
> > > +	skb_reserve(skb, xdp->data - xdp->data_hard_start);
> > > +	skb_put(skb, xdp->data_end - xdp->data);
> > > +	if (metasize)
> > > +		skb_metadata_set(skb, metasize);
> > > +
> > > +	if (unlikely(xdp_buff_has_frags(xdp)))
> > > +		xdp_update_skb_frags_info(skb, num_frags, sinfo->xdp_frags_size,
> > > +					  num_frags * xdp->frame_sz,
> > > +					  xdp_buff_get_skb_flags(xdp));
> > > +	return skb;
> > > +}
> >=20
> > > [...]
> >=20
> > > +static int stmmac_xdp_shrink_tail(struct stmmac_rx_queue *rx_q,
> > > +				  struct xdp_buff *xdp, int offset)
> >=20
> > This is only used to drop the FCS. On the last descriptor we already
> > know the frame length, so could the 4 bytes be taken off buf1_len /
> > buf2_len before the buffers are added? Then only the rare case where
> > the last buffer has fewer than 4 bytes would need to trim the previous
> > frag, and this helper could go away.
>=20
> uhm, right. I guess we could do something like (and drop
> stmmac_xdp_shrink_tail()):
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index e80793bd6553..5cb8a6883f44 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6027,6 +6027,19 @@ static int stmmac_rx(struct stmmac_priv *priv, int=
 limit, u32 queue)
>  		buf2_len =3D stmmac_rx_buf2_len(priv, p, status, len);
>  		len +=3D buf2_len;
> =20
> +		if (!(status & rx_not_ls)) {
> +			/* ACS is disabled; strip manually. */
> +			if (buf2_len > ETH_FCS_LEN) {
> +				buf2_len -=3D ETH_FCS_LEN;
> +			} else if (!buf2_len) {
> +				buf1_len -=3D ETH_FCS_LEN;
> +			} else {
> +				buf1_len -=3D (ETH_FCS_LEN - buf2_len);
> +				buf1_len =3D 0;

Here there is an obvious typo (buf2_len and not buf1_len) but thinking again
at the suggested approach I think there is corner case we can't really cove=
r,
the FCS can be theoretically split over different DMA descriptor, so we need
to reconstruct the full xdp buffer first and then remove it. In other words,
I do not think we can get rid of stmmac_xdp_shrink_tail(). What do you thin=
k?

Regards,
Lorenzo

> +			}
> +			len -=3D ETH_FCS_LEN;
> +		}
> +
>  		if (!frames) {
>  			dma_sync_single_for_cpu(priv->device, buf->addr,
>  						buf1_len, dma_dir);
> @@ -6064,8 +6077,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int =
limit, u32 queue)
>  		if (likely(status & rx_not_ls))
>  			goto read_again;
> =20
> -		/* ACS is disabled; strip manually. */
> -		len -=3D ETH_FCS_LEN;
>  		if (stmmac_xdp_shrink_tail(rx_q, &ctx.xdp, ETH_FCS_LEN)) {
>  			if (!error)
>  				rx_dropped++;
>=20
> What do you think?
>=20
> Regards,
> Lorenzo
>=20
> >=20
> > > [...]
> >=20
> > Thanks,
> > Nicolai



--Mu66gn9kz4J4GejD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas4E9AAKCRA6cBh0uS2t
rJPeAQDerp6+n4L3MJ2rwrKWH0/G7ww+Ee+WCf0ZI8frA7mKzwEAoHyOURfMe53f
TpZha7A/0DVjAtC9yaAN0a+AT+qJ0Ak=
=VvWK
-----END PGP SIGNATURE-----

--Mu66gn9kz4J4GejD--

