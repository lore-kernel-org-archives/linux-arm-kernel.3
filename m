Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D45C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 22:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18vPnmJEZtEvBUuGwHJgoJZ3PhgzCYtMv1/K1VGThH8=; b=ifm/9+4P+2Z3P5NoKQ5xh6btXQ
	2uLUAjSFR4hBRWx9aFKbw05qbmer4/QIZhP9SDAuTnHcqA1WDcBXd3LPImJ+YWF8zinsPFQFyEPwR
	Lti0+bDLomAzrYmI7iDl6/hnqtiUc1M72yqjfNwbwKTOX9SrxP1N9WXeRj7QuUEx1kSPRVquYkx2x
	LOxgkrUN206Svd9QSZzrdo+WXkz2gByzym2lrbUmGoxTi4zIdSOcLE8Yg+8wrzseTHKrRpB7k+PGi
	yQNVIo7DjaU+ZEjoE0YjyZ/ui4VmANiT0m8fUPFPsTJfLurItccPCVicFCzuIoxrmGO0/zzXzlGNh
	ETH8pCow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tNW-0000000FzuE-1yev;
	Wed, 02 Sep 2026 22:24:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tNU-0000000Fztf-2fuT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 22:24:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHAr83690939
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 22:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=18vPnmJEZtEvBUuGwHJgoJZ3
	PhgzCYtMv1/K1VGThH8=; b=DB5w7My4ed+/r9Wj8JS6IRovwzDK5/P1HYQ36629
	AFmkuMI4wxbU5HGAVjmUmU840F4IUFC/Lb/ZLNBvMdAdOjgEPwotk0y5S+L9egzm
	5xjHVbwHQy5Fl2clS6ML53Q8EiOCHbiRMr2rCNNVmrt3dhBwGHUzL3p4ZZ7mFomq
	YgDcKNMx75ow0quXwvzLTHSVXZSyeKKUtUdjlNcXyd8Qp3nhwH9UeLNp6qvCbQgh
	/7NqhuLelTHZ3HlCktrPzXhma1HIM/JYm8oSgIL6QInEX4NWLFn3nwHdXOJ5Qqah
	PbfAADsj0zzjrqhfsTl6KNScP4fvqUjwUl3THhpLODeS6Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnj66k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 22:24:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e52306621so243886085a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 15:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788387859; x=1788992659; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=18vPnmJEZtEvBUuGwHJgoJZ3PhgzCYtMv1/K1VGThH8=;
        b=O1Q0Zum6uKRQNiU257c4eJwUqIm/TLVItbxU/FJMxDQB8JUhqOm1nAIbAkOs2z1ywp
         80Y3XC1ZVDCO09/Nj1zKGGujsy6CnFPusx7updyQ3cYWUbLd8GNgPnNyP9zUe4Diyxrn
         XJkc2sPCxDsZ5geT2rkwSLnsVU2KF+vn8dhtKbWCGC5pyTuM6ReemrUdeQ0WaDsXtf8r
         2I/KbhZ8hhNwx14ZRvcZTwChHKobFrhSjyuY3iXHy2N85j94tsyGbPaMooKys+SIoBWn
         FJZdjNOEMq10lU4oeJHSJIfwRRVT7zyRFpfwIdpVa+bU4G+5qpfp5L1b9lbe908oL6ak
         91IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387859; x=1788992659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=18vPnmJEZtEvBUuGwHJgoJZ3PhgzCYtMv1/K1VGThH8=;
        b=PpBpPC5umQHtjiYfUWKz+wp7DhLhXSjbdz5zzNkvKPUf7cVPaIJYe5cVAKWQh69EVo
         K2T2m3xj33NTXZeI3oBEt5X76lWuRACBeaXRy8Zt9a/7xL25zve6MZiqrPJuQzdx9uwJ
         JCKj8zw2YKUt0cqJMapJgHSTlYAl4UPGhsjwIOoTA/IIEAa/UqSnF/U3Wuhi7Zfeypdn
         itJDwvvK5hO56xllVmpOtUyB43wln9pXkzuVhuudmGOXmYIejBK3GeHzwqBlOx5Y/Yac
         26PiTr/KtuxaeULTHnuUvVi73o4KkFzn9EydwOrpAmgxnc3ndiSlMEW5cYHWYiboiHRd
         yFdA==
X-Forwarded-Encrypted: i=1; AKwUvBzjHHsqUuyGsQYp6EZG/7O2u07W/nYDBssfsawW9+dbFD1fYx/Ow+xlDunqgXo9Oz3rGA0ed21M5cJGJKCim9M6@lists.infradead.org
X-Gm-Message-State: AFuF++kTA8kPcB6nk38v9+AGJTO519BO1VTnZv7OXIo9pGe98c4an7pE
	xCQk7MBBdX4fWzQZye6jkQBghW42OZK/G7rzfBxsGNpyK0Y5NMcAJNzWhyinqV4/6Mdd/Hy4T7f
	9vyvhOtuzYSkjkJZq95EJPxEgCXtjpNwQs6QE7VYaVMb+upFh9deOlHrS5jTshC+UFV5QZEZpPG
	nqYg==
X-Gm-Gg: AYBFou1m7GkXjnwSOxs54vWnQnJqSnxnPUyFM0oE+TGdk/UPUJGCi0ipEkHotBDngei
	4M83gCuXur+lRJ0G6AAk3qRMiAJAKARLWcxBRR3MwPSywXdB8M8bbu+2EmlwMaVaLGVW0kp9aIn
	sHTPp/UV8oWLF+dzW5zduVkW+FZeCHZfv851+QmlzfDzoSeVTZpRmTvwjvXj48JggDdMOfe/h4S
	fKX12ganfb733RyUqAIOl8/w8lqGkosjh6liGEYUoI4Oa3brsAVhtqFJ1sTewzX1VAZ7//VcXDi
	2vMo4BxiUkNB55cGNdi7Q63quszCylr/ED+X6o2s+vpIFu33zpLVUXNsBwzcQP71j/4CnUyy3dn
	yIjY4Xn5Wd3n9JQ==
X-Received: by 2002:a05:620a:4110:b0:939:639b:2e1f with SMTP id af79cd13be357-939639bdaf3mr827498985a.7.1788387858798;
        Wed, 02 Sep 2026 15:24:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4110:b0:939:639b:2e1f with SMTP id af79cd13be357-939639bdaf3mr827494285a.7.1788387858198;
        Wed, 02 Sep 2026 15:24:18 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d2019sm21672695e9.2.2026.09.02.15.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:24:17 -0700 (PDT)
Date: Thu, 3 Sep 2026 00:24:16 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>,
        Thierry Reding <treding@nvidia.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net v3 1/4] net: stmmac: propagate PTP init failures in
 stmmac_setup_ptp()
Message-ID: <apiiEIS2ExdBIPqr@lore-desk>
References: <20260902-stmmac-est-reapply-after-open-v3-0-e72a6df5a7ef@oss.qualcomm.com>
 <20260902-stmmac-est-reapply-after-open-v3-1-e72a6df5a7ef@oss.qualcomm.com>
 <1010cb80-d9c9-4891-a719-8d7ca31c732a@bootlin.com>
 <apiT0ZrlBMF2k8qz@lore-desk>
 <ebe7d40e-4f2c-4c39-8d9d-ef588074154b@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+uG7zYthDkJCX/Va"
Content-Disposition: inline
In-Reply-To: <ebe7d40e-4f2c-4c39-8d9d-ef588074154b@bootlin.com>
X-Proofpoint-GUID: FoiXCat4fkKpWFOrAKp5HCRnZLBHPLSX
X-Proofpoint-ORIG-GUID: FoiXCat4fkKpWFOrAKp5HCRnZLBHPLSX
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a98a213 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=09jnV3MRIQTx9f2RKdYA:9
 a=CjuIK1q_8ugA:10 a=xbPlxFjQ-td3EfFMwg8A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE5OCBTYWx0ZWRfX8tPeMxUqe9cq
 26kf83qenWSknmta6byWZGjPgbECDvH6tyvG9t3xWB7XkaMHsx2/31Udhk+6iMcVAjsdzPn7mTl
 JoP75LpG4im3yBZBoUG0F0o/5+2ndbU2Za/XXdxPxSvtAWvxBvCEAco+AyXxiuM2t/fkVqxqJXO
 wbSKhcxUUhapt3h9EUH005ZL6XqW2tQtqnHnYv2T8zX/BZM88pqaoRHHCGLO7p7IGptCY32P/SH
 QeM7fV7tMMOUa5dEtX+NHPqf6G/0qitV5btkM14Kocm09G9goD18u21jW81+3GOgThI5nRhe3za
 6AYJ1aNZrXGvyE31WBj2KUWfqJ5ZwY/ab41JofhNSy/h7nNF+M3M2wTfaODAit0xus4xkSiLq/s
 nyH0yXk2tTkNVhz5Q3lS1VpqWZaMt7sowhvLFSGb9xe97nAb+Dqph92JA6TR5jPyQ9Earz3Dvuy
 Ui799/SqWqHiVkWKgFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE5OCBTYWx0ZWRfX1Ir0ZU66uQEh
 WRq5clmukgEdzxjn9XyZ0oA82wiftx/cck++4or50mIKyzz2m76xc3h45Bz5hUEms6A4eRlqicv
 W/EKLWE+xzLaYIoJCGFvcDKiAQw94xM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_152420_705376_FEF711C6 
X-CRM114-Status: GOOD (  24.27  )
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

--+uG7zYthDkJCX/Va
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi,
>=20
> >>> -static void stmmac_setup_ptp(struct stmmac_priv *priv)
> >>> +static int stmmac_setup_ptp(struct stmmac_priv *priv)
> >>>  {
> >>>  	int ret;
> >>> =20
> >>>  	ret =3D clk_prepare_enable(priv->plat->clk_ptp_ref);
> >>> -	if (ret < 0)
> >>> +	if (ret < 0) {
> >>>  		netdev_warn(priv->dev,
> >>>  			    "failed to enable PTP reference clock: %pe\n",
> >>>  			    ERR_PTR(ret));
> >>> +		return ret;
> >>> +	}
> >>> +
> >>> +	ret =3D stmmac_init_timestamping(priv);
> >>> +	if (ret) {
> >>> +		clk_disable_unprepare(priv->plat->clk_ptp_ref);
> >>> +		return ret;
> >>> +	}
> >>
> >> This can legitimately fail with -EOPNOTSUPP, we musn't failt the whole=
 open
> >> sequence in this case.
> >=20
> > ops, right. I guess we should just skip -EOPNOTSUPP in this case, or do=
 you
> > prefer to always not report the error from stmmac_init_timestamping()?
>=20
> The clean solution IMO is to gracefully handle -EOPNOTSUPP, here I think =
you
> pass it on to the caller exactly like you do (I don't think it makes sens=
e to
> still enable clk_ptp_ref if you don't have timestamping available), and i=
n the
> __stmmac_open() path you don't fail on -EOPNOTSUPP.

ack, I will fix it in v4.

Regards,
Lorenzo

>=20
> Thanks :)
>=20
> Maxime
>=20

--+uG7zYthDkJCX/Va
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapiiEAAKCRA6cBh0uS2t
rMpeAQDSlOGBUoDB8iAvL0AANqgwiQB1TA6IntKZ+pzplorvugEA+k+rry0HXitb
TP2XILNZCA5T3YbdGL2pMUmnfThEIw4=
=Q2Yi
-----END PGP SIGNATURE-----

--+uG7zYthDkJCX/Va--

