Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4191CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgswDTUC6heFE7Kb6HjIW/Q+kQDgzcu9CfQIYuxeCuk=; b=GiW98YX8Nb3UxBOjyrNPz8REfv
	zc0M5hUXZAHQ4Kmj2PyHmZ32JW4UiHtUh6oSgzUe0Dm49ccLPxbwq1wouJT6sh1uv8cRjpY85YxkL
	684ny24WBillGZ+q/CkMlTHOuUh/L5Buvz1ce8aH3dQ15QfNkLiPo+XypiS7uRvI9dmFG1v58W3Y6
	wHwi43PXUgY0CUjmxXu9JDgZoo5heJwk+ybCtzeFH41TgMUjt0pxb4JYk8n3hrk1DVcs0PcB5KTNq
	4bEELNzgYXqBmT9Xr7gFdMbG6kgraCSpF9yJhyuskdDSIv0VtFfsd61hf1AmM3v1wPkU3sphfbVFP
	T2QPQIXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBanv-000000044Sl-1hIU;
	Tue, 29 Sep 2026 16:35:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBans-000000044SD-2VNG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:35:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw5x53301456
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 16:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KgswDTUC6heFE7Kb6HjIW/Q+
	kQDgzcu9CfQIYuxeCuk=; b=XtR+IK2y+R3kVV5rIcaJToX++TeBAbdcSFnIDHOU
	mjgG/Epwzd7BwvDbmqPZQjGYlP+LU7jCuI4bhQZhplw2NdwjxERxwE6OkY5ewNFA
	vIWVUEeUq6DVS6+BfxlTjnGSTLN68OHfLZmhvoCegxZ4NjJqpwfACiqqaCd6Bqha
	HzVyMvwaOWA+N/Ge2QzuVPxw4i5mX+Jmgmu0x5ZygJiKpCqklUwEtVlqsOPILNxp
	lXpHbuT3XirjLpEjpnziPTn1Vqsc1zKELsJ0WTS/WV2QXf8iYy15zPLR/cFCs+jT
	U786o475DpXutHii0UpwOkHQXv8sQwTJQMpmxDHin+SjSw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx120q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 16:35:39 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso3512016241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 09:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790699739; x=1791304539; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KgswDTUC6heFE7Kb6HjIW/Q+kQDgzcu9CfQIYuxeCuk=;
        b=fbbrKKfwPvduPm7dsZz0rGjleWwmo+CBAQy8ZQeEvqJFw1688L1cvtD/BJvu8Df3cU
         Xw5essr8a2eUWIno9Ozfxk1rqMynaJRWhEGUhfhf0VZRNzBer1aOaC+rQGGFAQYbb2Q0
         3+szDe5IB4wPk+XCt3KWk0mdG4bUt9mhZT8ds6CWz8vt+WsPaFM7XCEDykMM1ZmJe8Zg
         AP4vr0X272uDyGtAhS3j+GxGIjuXymYR4vexyBxd8WWuQQanFzIRPI2mXlPQrZEZ8Zbh
         Fx34G34nDO+bNlAZ7YzUlt0VGpoC8zk04ynoBSK//KJ2utAY/WezLS7rNZfPtLOcbY02
         MCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699739; x=1791304539;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgswDTUC6heFE7Kb6HjIW/Q+kQDgzcu9CfQIYuxeCuk=;
        b=M1q4NhWLUUyUq/5Z3V0CfRSCELYjjl2brzh3lsMOXe7XLcuWnyqIVPhDOL/YM0AHyT
         YSupbP0T27puSP7NlP0QNXFR04qg9OGWj5bHAt6QlzI8M3RmKjFZ5v1/5GE1W6AWd6gh
         ocpDEWrbE0qs9clr2tj+lWaN4zo7/HcI/iAWk4f8kTli2hK+55JXOfVTtG9tebrGvyVI
         fIWWpKuTkjWms+UNn4cU9Ujg7511i5l53yKdQrlehv0NiwaBbYo5yCR5DbnGlj0YWpFq
         JV9D1g8z/19nX+3EAq+g951zobMomvo0UFgWcezPIgi8nXbgGAPWtkPnM9YEXhaM74KH
         L6bA==
X-Forwarded-Encrypted: i=1; AKwUvBysmothruJUqi2YYJPwPIZkZdQEZtnA8lVWXi4oMWaa81pseV/wKhA87WgD7ZqXk3sFAALQuoZ89GqsHJEdlpqS@lists.infradead.org
X-Gm-Message-State: AFq9FYKhqzz6dc0nmeoDYrfs3HZoUjqWfbxw+wkAE+K/w8pubJMn0lQ5
	cvIMDMUaldjcjTpjV2DA2GOxgKhaTkcGnEULFbBO30H+3d5kgqC+yFjtwfC+QuujjyYYnbwPUgm
	31RRlYGo18YtPxJnW2dWcO8IdRvadlcl3rV9cM6Snjde+EHz9VI5Xwj/Tews6mckQHb87sAr8BP
	42jQ==
X-Gm-Gg: AYBFou3JFlr4jVhaigjRX4/qXdGzgfGR8I0QYh4Xi05oq03IvWn53ATgvs8qNht6AoI
	tF9+jwm4UqD/AqPf7nMW2tbp7hKbdcCr4rEyi9TBNYMJNDoHJeII4Mtlr9QMXLrQO062CNcF7xs
	yWbNxEfeRcjPsIE8Oxksyr/z3YsN9dew6jFJ//BT7W1sx0Qmy8NkQPx6R1LqWvDEH4KGysR4k3e
	hHxfZt4mzLhsrvjlPGC04ndik/xJbAio8paS26Iw+zaSyPtnF3xv8g/hUtjVj+HNiRC0czA5HPB
	YGCdkJ+e4CR/HO6NDdVb+tzW9dZqGjVH4852L4um76kpmrivSEGyIDT2iCiwtozc0mJrnEohITG
	x5vf/sLNPYk8J0Q==
X-Received: by 2002:a05:6102:1486:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7bc2ecee87cmr47619137.1.1790699738668;
        Tue, 29 Sep 2026 09:35:38 -0700 (PDT)
X-Received: by 2002:a05:6102:1486:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7bc2ecee87cmr47606137.1.1790699738086;
        Tue, 29 Sep 2026 09:35:38 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af508bebesm5857887f8f.29.2026.09.29.09.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:35:37 -0700 (PDT)
Date: Tue, 29 Sep 2026 18:35:36 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v3] net: stmmac: add XDP multi-buff support for
 TX side
Message-ID: <arvo2GYtvVZ9FDyf@lore-desk>
References: <20260925-b4-stmmac-xmit-mb-v3-1-ca08f029e81c@oss.qualcomm.com>
 <179069820857.434549.2531492906306099121@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lCMFkcEL7KUIgE/T"
Content-Disposition: inline
In-Reply-To: <179069820857.434549.2531492906306099121@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfX+hcfYWlntA3u
 HzY95zD+ORjK/RZK7o1Ou9F7FNGkRXnbfm7iupmxnc9JXAUFIQ1JprVhidWyu11RcaOiuD1oWsC
 ZOs85hEI6Jg0WnFD6XlVAFzPrqJn0lJOK5xzq4vLS+FanbnqwGkXKVFBl11+iVrz+mHUZx2Sco1
 LqQptaFZBoT6nTLGtBd4/ZvMNe90wlseEGHCWwYRYOwFnVa4Mo9brMiY7znoaXz/b7ALPpzRpP1
 oOh1Psa4+/DwHXAOO2IA+3TCLSPUibZe5WaNjP4sFGBJqvcDljyzdWbj3z57mfX2SPgT/ycsgcF
 xD/PKO7C0Sjifyadi1GABKFbjlKIsRoAOl7Bd8uwkdA/OmCufIlwXO5a9eM+m+bsJjeab5H3sij
 VqxsXSFtwlvRmxyKOiTcHaqHOZrg2BNJqjw+RyBY0Lkx+lPI2FJhKmXyGh8BD1djEaEs2dkWkg6
 8YDIuiNasL+E1runP+Q==
X-Proofpoint-ORIG-GUID: _6HpcCWmacYq54YINXAiBV_1HhAo4iQl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfX+dgNDgpB0QE/
 J2RR9B9IfenWtY1Npm1APxy6jCQANpknou7+6G7oXoZWdsOf8RFzSORP6tHriLacxN+1+YcSax2
 kE4XjyQ+zZSkqFDBbJMlmQRZUYJ1Q8M=
X-Proofpoint-GUID: _6HpcCWmacYq54YINXAiBV_1HhAo4iQl
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbe8dc cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=jf9qpCBZcCKH78LjphgA:9 a=QEXdDO2ut3YA:10
 a=vBZCTss2YYTdBBQYqEIA:9 a=1WsBpfsz9X-RYQiigVTh:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_093540_641713_83F75E9A 
X-CRM114-Status: GOOD (  37.86  )
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

--lCMFkcEL7KUIgE/T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] The patch fixes a divide-by-zero crash in the XDP TX path
>   without saying so and without a Fixes: tag.
> - [Low] In stmmac_xdp_xmit_xdpf(), the new coalescing check reads
>   priv->tx_coal_frames[queue] twice with plain loads: once for the zero=
=E2=80=A6
>=20
> --
>=20
> net: stmmac: add XDP multi-buff support for TX side
>=20
> This commit extends stmmac_xdp_xmit_xdpf() so it can transmit XDP frames
> that carry fragments. The frame head and each frag get their own TX
> descriptor. The driver now also advertises NDO_XMIT_SG for the redirect
> target.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 3ad9252bf6aea..f1e9ac2f98598 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5241,77 +5241,118 @@ static unsigned int stmmac_rx_buf2_len(struct =
stmmac_priv *priv,
> >  static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
> >  				struct xdp_frame *xdpf, bool dma_map)
> >  {
>=20
> [ ... ]
>=20
> > +	tx_q->tx_count_frames +=3D num_frames;
> > =20
> > -	if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] =3D=3D 0)
> > -		set_ic =3D true;
> > -	else
> > -		set_ic =3D false;
> > +	if (priv->tx_coal_frames[queue] &&
> > +	    (tx_q->tx_count_frames % priv->tx_coal_frames[queue]) < num_frame=
s) {
>=20
> [Severity: Medium]
> The old code here divided by priv->tx_coal_frames[queue] without checking
> it for zero. That code came in with be8b38a722e6 ("net: stmmac: Add suppo=
rt
> for XDP_TX action").
>=20
> Can tx_coal_frames[queue] be 0 here? __stmmac_set_coalesce() only rejects
> the request when both values are zero:
>=20
> 	if ((ec->tx_coalesce_usecs =3D=3D 0) &&
> 	    (ec->tx_max_coalesced_frames =3D=3D 0))
> 		return -EINVAL;
>=20
> So a command like "ethtool -C ethX tx-usecs 100 tx-frames 0" is accepted
> and stores 0 in priv->tx_coal_frames[]. Before this patch, the next XDP_TX
> or ndo_xdp_xmit frame would then do a modulo by zero in softirq context.
>=20
> The new priv->tx_coal_frames[queue] guard fixes that, but the commit
> message only describes multi-buff TX support. stmmac_xmit(),
> stmmac_tso_xmit() and stmmac_xdp_xmit_zc() already have this check.
>=20
> Could the fix be split into its own patch with a
> "Fixes: be8b38a722e6" tag, so it can reach stable?

I guess we can avoid to add the 'Fixes tag' here (and so to backport this
patch) since the issue seems quite a corner case.

>=20
> [Severity: Low]
> This check does two plain loads of priv->tx_coal_frames[queue]: one for t=
he
> zero test and one for the divisor.
>=20
> __stmmac_set_coalesce() writes this field under RTNL. It does not hold the
> TX queue lock that stmmac_xdp_xmit() and stmmac_xdp_xmit_back() take, and
> it can store 0.
>=20
> If the compiler reloads the field between the two reads and a 0 is stored
> in that window, can the modulo still divide by zero? Would taking a single
> snapshot help, for example:
>=20
> 	u32 coal =3D READ_ONCE(priv->tx_coal_frames[queue]);
>=20
> and then using coal for both the test and the division?
>=20
> stmmac_xmit(), stmmac_tso_xmit() and stmmac_xdp_xmit_zc() read the field
> twice in the same way.

I agree there is a small race here, but the same issue is present in
stmmac_xmit() and in stmmac_tso_xmit(). I think we can fix them with a sing=
le
dedicated patch.

Regards,
Lorenzo

>=20
> > +		struct stmmac_txq_stats *txq_stats;
> > =20
> > -	if (set_ic) {
> > +		desc =3D stmmac_get_tx_desc(priv, tx_q, entry);
> > +		stmmac_set_tx_ic(priv, desc);
> >  		tx_q->tx_count_frames =3D 0;
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260925-b4-stmmac-xmit-mb-v3-1-ca08f029e81c%40oss.qualcomm.com

--lCMFkcEL7KUIgE/T
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarvo2AAKCRA6cBh0uS2t
rPbYAQC4FHOuUC7np8NscKyMG+sNI0axYle6eOCMGcv4Wg//lgEAs5kYtXHqr0Vo
h852u1vJB4hxTP+jHlpF7k5OBbOhzAo=
=f2Al
-----END PGP SIGNATURE-----

--lCMFkcEL7KUIgE/T--

