Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B057C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 02:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNcJBW2fZpfcG72m7YD8cMo3vuAaGA7fVmhcO/olNII=; b=aUFxQOiKx9K9sYQZ6SLky318Q+
	NVhl1m9qacbcCCeqJbC50qVoCgykrWuSfIUjyl8Lwg88V/E8ge2Ug1s45ILLx2O+A1cF3mue3sDCE
	WkGUR6tAhi2CS9j2PhrWnjUnnTB9TVD5MDLgDEFEjWPrJUgT2BlCE4FpMjzK0K0pZuEm1A8YhbGwv
	RJEBllnfSpfsqqb2zVfZmJ/rLHpQ5F3llxC8eBl+lc0DHrHwWO6reqwXndDzQppJe8Phdz6JdPfHz
	qrx32oZa489gMCKw42AN0tJ9ZlVAfD3DYlBMNFznysXbqcOok1sqKZa8hNdl46sRCZ8D3j4pDSd55
	xun4nsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvQMY-00000004OoZ-34RD;
	Sun, 16 Aug 2026 02:12:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvQMW-00000004OoE-2nw1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 02:12:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FNl9Id1540551
	for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 02:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FNcJBW2fZpfcG72m7YD8cMo3
	vuAaGA7fVmhcO/olNII=; b=P3/vRRwQAsaGG6Ms3wMZIdSL/xzhY8fvHKlty6Vk
	uLn1xFRjQ1nKZZaSakV8NWFTbr7jibmOaYe2FQE030CbnGDf02LdVb/G/a2jm+Fy
	FDXCz3ZhySGoVGrnHadDE8sV9FHw9khRFQYWyscIPuL1DvQ/qb154tAT56kSm4HO
	EoYSzCl4FYiLGs1FcwVSnqiGJmwxg5X/BwojGfKVndg6KwF98chSXh3N1Tw27CYD
	U7psRQWitjKxcRi6VIF2uoqpP8LfpM2LO2Y3+XsBxcBh5/ETHehr7CjO9rcaV+Lu
	/bYmhOOGYV+HsEXJcvnLLJEcgPp9Mqh22HEi3U5C3kSrOg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g322q87cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 02:12:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so4581277a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 19:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786846354; x=1787451154; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNcJBW2fZpfcG72m7YD8cMo3vuAaGA7fVmhcO/olNII=;
        b=f73z5ftkoSw98l3KOjXdeIL73kKs7m6E6b/fSRWdCGk+Uem26seCijvUOZzNWKugxD
         wE4Yv4k7kunjaS4srCcVr3+J0mbTsNWdffpKoHg9eESa4fcotPjB4Rk9fZRjbx3Z52Qb
         DHy58QzcaLFXe/SKGYwD7RriR5HA4yYLKaA5W9XHwSal0QhFtP6MJ2+Wl1F0AEOZHftr
         dId+uVzN93UbhULwXesbgCg8JZJJnne6wSv0uT0m0VoDslacrC1WPLwVrXAp2mYGMz3R
         Ll6qQBuQTaBTZXUKfBgL8Kj3NG68fZRMHLkHYXGC6DXsbY3w2mOLe/BGAhZ9vqYqIKqM
         T2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786846354; x=1787451154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNcJBW2fZpfcG72m7YD8cMo3vuAaGA7fVmhcO/olNII=;
        b=Iy0UdyhTWjt6UF+1W0VjaPNu1T/3VS2mCUdY/UtsvMnEsEqaquCctYKwcrGQlw/IRZ
         H0H9wsN2vPzH19W/ZlsSb9K8A13gAKkUxxEO3keKnkbaAFP11EdxW9Dn7fOp+WNIXg4d
         geLkjeqRbkbqhfR76V7ee9SJJkgi+5a1csTHQdICQGQ9Dt0nQ0Wcex3Yy3x7dgOgb01B
         W+tC2H+KtCY/EuYH299b0e3h+yMz/Cgplwug5buHuxEtcLnMNMdM0sagC85wRxJ7favu
         mEzGe7keMxZxJDYHzrROazn8El36V0YDwcEIBLcdWQisffTAlwnr59NejF9E7XkX1WPo
         RadA==
X-Forwarded-Encrypted: i=1; AHgh+Rp64PG2bNsJ5+ToGqpORWNBDBoLuuKuFqrhDfY50cBf4Rska+fwJ1DT4GI8blKnUvAgJFvVhgby6l+VbbBs4e84@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2NyK3BJS6/7iQEOdjwkMRH+gQv1PZxsFTzGLIrNFyjYpzvYcT
	iSI8wwEmmx8U6h9qJ51u97joT5X2S1I3wVPryHnpCsA6D/jDX9WL1mE4AeLo2zofAyrrXcL8fRK
	wHHF+HQwv48VAGY2tZM9s/km22muSfT10qAcvW12RVYxwOKgLNKe+OevSwjhJlb1Uk3BeQ8bduD
	hs6g==
X-Gm-Gg: AR+sD13KHQr80PbaBzIfiz5SPR/qdeIKMnWIpZHOXiUIQ8Sn5ma/Bb48kx7run2kcS5
	prV5RI/VkcvC6ZWzMsgKgsAZw/0TXOl9BoiwZZL5rosOQVjTwELNMGF4Q57bTYQt6ciSYInc8Yp
	rO+q43eED83uXqPcMOO317p4Bi6CEgLA7eDasM3a1N7sQaV/XeCQMl8A9QewVD1WpLu40UfTihJ
	0D7tf8PpsgXuJEdtDbOMeS3q7n8DpVVd+/a0jKqJh/H4NW9ydEcid5VTmtgp9pUFIfkJLivHqVD
	mgc7RlOcXWPehQDhBzoiuDgFOSkg1TH+LlYbLLHGiFobZLI/KORZSZ04WEQ0mBx8md/ODdtkHTX
	IALH7Nrw9nq0+0Q==
X-Received: by 2002:a17:90b:2c8d:b0:38f:caa2:5721 with SMTP id 98e67ed59e1d1-3933e62f4f8mr17525816a91.17.1786846353599;
        Sat, 15 Aug 2026 19:12:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2c8d:b0:38f:caa2:5721 with SMTP id 98e67ed59e1d1-3933e62f4f8mr17525772a91.17.1786846352936;
        Sat, 15 Aug 2026 19:12:32 -0700 (PDT)
Received: from localhost ([4.43.230.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e142dbsm150525a91.1.2026.08.15.19.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 19:12:32 -0700 (PDT)
Date: Sun, 16 Aug 2026 04:12:30 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Daniel Thompson <daniel@riscstar.com>, Alex Elder <elder@riscstar.com>,
        Davide Caratti <dcaratti@redhat.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 2/3] net: stmmac: add tc-mqprio qdisc offload
Message-ID: <aoEcjrBy6h7E22dI@lore-qca>
References: <20260808-stmmac-ets-offload-v3-0-b714466142b9@oss.qualcomm.com>
 <20260808-stmmac-ets-offload-v3-2-b714466142b9@oss.qualcomm.com>
 <20260814135631.766ceb41@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mwF8KmuxzVjuS+UV"
Content-Disposition: inline
In-Reply-To: <20260814135631.766ceb41@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDAxNCBTYWx0ZWRfXwfYHOKhoEAs1
 bf1v3XnI5ZPtK9xSWBsCDedfrJJ4HRKCxw2TLlicBJIMtCJrQKZ69PKfx19lxxTOMQtS5KrHCbH
 l1stV6RU08iGMkFqo0L7VO041opzJoQ=
X-Proofpoint-GUID: aBgqjlrly8chOTs83Tbgv9_yfjPOH99z
X-Authority-Analysis: v=2.4 cv=C5PZDwP+ c=1 sm=1 tr=0 ts=6a811c92 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=y9u56/S6JbnHW3dtX7SsYA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=1LTPP7CxEm4iLMqfjvUA:9
 a=CjuIK1q_8ugA:10 a=abe5JHccC3Obh-31B2kA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDAxNCBTYWx0ZWRfX1zjZQx9+nGa5
 WnSudJNKi75yCPml2Q17QWkOn4kIiS1RPFYIpr8iHz27ReQUW/PqiIJ4jPwYP9Hoj5ajzUG69DS
 S5le37q9wBJGzoXdCCPK/N4g1p4x+st/+jzrOk0VTnSbESYjT/ZjzgM8I23cmwStcitWEJUiyqg
 +EElbCVhURFFPxC6JFCZUlk/54DzUbZmi736omB31W9W0WxeSBNhjKRYpNS7zyrTapXi8RqYw41
 2hNmsw4yy44e+AO+Fi4HuUl6Wv43tezwNTpryR89M6+bBnTwPYi26xcaIY1dtSvgd/+n5+PK5pH
 ogCfqbzhSzYy5UeLYPeAyirDyJEZIwUQU9colxRTANzUmuY22m8TFyHKBihngTubAosbMCRxUNs
 JSY6GzPCsO1S8H04OesZ8kxNNBF+tKCECoxCHHEAPdHf2iP8qovbvLoY92wJAFzzMPL9U15Petd
 HwRtnKIRLeuHg/qx+Cg==
X-Proofpoint-ORIG-GUID: aBgqjlrly8chOTs83Tbgv9_yfjPOH99z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_191236_737944_008EF307 
X-CRM114-Status: GOOD (  21.02  )
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

--mwF8KmuxzVjuS+UV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, 08 Aug 2026 16:49:58 +0200 Lorenzo Bianconi wrote:
> > Subject: [PATCH net-next v3 2/3] net: stmmac: add tc-mqprio qdisc offlo=
ad
> >=20
> > Implement offload of the tc-mqprio qdisc in the stmmac driver. The MTL =
TX
> > scheduler is switched to strict priority, and the PSTQX/PSTC priority
> > bitmask of each TX queue is programmed from the set of frame priorities
> > mapped to the owning traffic class (qopt->prio_tc_map).
> >=20
> > The offload requires the DCB feature and a 1:1 TC to TX queue mapping,
> > with the queue ranges bounded by the number of queues the MAC implement=
s.
> > Configurations with AVB queues are rejected, since forcing strict
> > priority conflicts with the CBS algorithm.
>=20
> Clashiko has a bunch of comments, I assume at least one of them is
> actionable. High level - you say "add tc-mqprio qdisc offload"
> but the driver already has a bunch of mqprio code. Background
> would be useful. You also say "1:1 TC to TX queue mapping", if there's
> only one queue per priority why offload mqprio and not prio?
> At least a note in the commit message would be useful.

ack, thx. I will address them in v4.

Regards,
Lorenzo

--mwF8KmuxzVjuS+UV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaoEcjgAKCRA6cBh0uS2t
rPLaAPwNhvlwtI5cH91/8Oj5jzqnm4RKoWFYOWz0EWyv0Vw1xwD/QjanQNDBanDr
aT49OJ+Y1YE70hdbgSPIwPHmy9KRHAc=
=PVBu
-----END PGP SIGNATURE-----

--mwF8KmuxzVjuS+UV--

