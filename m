Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C59C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 08:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AGAP2Ybmw0L7jOZJjvxtsmnLMJVGg8ukn0BH3Z2m38=; b=3mG0BGK/cXl8sKxiZadG+EnKej
	PZTgPcf7txWipZAK4oiCjvuEsuiirkoAnOsP9RnrtT5kHoxsT7zoDE1GrdNDbTuknce1NMapUzco2
	JOaCbXIm1X+L9LmXd/p+oKrCfm7USpJl6uIYkdNI0cTS5izqY7adzp9qdms3w95C8aCGf1mt3Th0O
	M2x4dNzGrYTzKrKZZ27LMZ/mFnF+cdEg3+oNDOu/trthszN78fKt6zSI9GuyfRuEKSozp4cLDJSqH
	dqtM20GS/e+z3m86pBGgjUM5COU/IQqc58QD1iLKr+J4/cryLWTWW8phm0wW9CznnrqnUD3saJXWi
	YJgvKzXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8D5V-0000000H7Km-1jG1;
	Sun, 20 Sep 2026 08:39:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8D5S-0000000H7Jk-0B06
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 08:39:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VYFs1363520
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 08:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2AGAP2Ybmw0L7jOZJjvxtsmn
	LMJVGg8ukn0BH3Z2m38=; b=EbmYetsuXA9InbIe1SWN3OR7BiVZ4a3X8RJgVnaV
	+1WZFbhyVVg9phlno0Fi0kZuD+Ro8v2kNF14xyTq3IV71pJfgqeQXD6a0mn4ag49
	keQ4ibW5j87Dqcr0xfyPbnLD2I4Aolnhu5He0lwPgpqBRc580LAjKZmHWs3HiPvT
	Y7wlVro2lGOuuOW8dB05hikiOZUz5nTRbcjk0lJmad616dI0iKCXQ1yjoNxgYMsq
	ZCy8US5c7XyxvORavdCKc67m0z9k7tZWYxMggSvACs/OrxJ67293mcM5BspNoHcs
	R9wEFcVi0kJh8+OAxILSDBzGfPgnAZpJgrzDYz4m2NgAkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsk5ejh7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 08:39:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0312937eso283315685a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 01:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789893588; x=1790498388; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2AGAP2Ybmw0L7jOZJjvxtsmnLMJVGg8ukn0BH3Z2m38=;
        b=ZUQ+xrB/SItPLDSzlMiOgeHqdz86vjtkWuObnYtskO51zUdv9ratnRTJEWaYmWAmJA
         Jdt9n2oZBerkDTq+b5OWGtCi8nGyPQvb55ePAJ3mB0PIcxekX70L52QiOXr7stl+KjTl
         F9Crp+1S9n2Z/jLdvG4H6huKrhlhbSpHz89qSPY0U8QKRkC6yQI9Mfiv0exBZ9aRChMm
         1sCC3fiey+M2CGuxefif/ZRrsQ7x2ftrPBgrGnjEbrDqzm8A0U84vE5cYfP8GgW/wOUQ
         qD9JUPr8qGx9DYuksnZv+gvjjDzsSDyQOhDpsCcK/YtX/vTTXdslzHexfrM79iMZbiiE
         S/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789893588; x=1790498388;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AGAP2Ybmw0L7jOZJjvxtsmnLMJVGg8ukn0BH3Z2m38=;
        b=tYzfPBqrX6BPO13/1QSkCjUt+l5qS0k2Jn23MSLx3pm+bXiwhYY9gxjRJSNIyKgs2c
         PEp6Un9h5yhQhoL974EWusShwukK2uMo8hUcnmlcwZVWRzCsbMjWLqwpZD9vvm9z/LUx
         C6ILQ/z379zjeMNQiEzqAykHUPU/X3c99hhx3uZWQcyjXXHokrliobpeiRHn1bBY5DZR
         b/Un72XX84/0Zoui3h30erZaM+RhOQTjK8F8tUG/OJmTYN7qSLLtRLknp+JfoY0XIWTw
         rnj/KoJbKKQPxI48V2XbJQ8CzW9jRIPxLubLXw4VJ8m7xWN4iB9X1XSxkqtNhtxcRXDY
         oG8g==
X-Forwarded-Encrypted: i=1; AKwUvBzZ0kkehX8aceSdBXExUu78DzErdvNcQq9rky+21oK9Uqy4idueGs/kkJtReI+OFAIA0N3ATfS5wBc/Mzhdsx+3@lists.infradead.org
X-Gm-Message-State: AFuF++nwk0ge9rYFn1v41n22UisOymTdtmAkg4wE8PZXVLdoXSKJfk56
	1m33xALjgfAdPDrc/6mu1JEunxp+ld9amCnX6SMNfsozu6aBc343JC/ZmLYo8mNqd9ZZcbw9s4g
	z8H1qnx+4DsCm6MOn2HwG3RLNNcILIr5B5PQIqzmpDXKli4ZxdaIqPiaZlzJlVt1mr7dkSqSebO
	YXQg==
X-Gm-Gg: AYBFou2tj1BBMyURRT9SwZIiv67xPLv6L1Sx9KpCXdzZ1wamqwhUp4ScdoccYqRlTpG
	LdGwg9dttwMyiNMV64Q+slNdls6l8S4mNL0iaRXKE3C/hCieBUQBAJAPURagJus+BytDwmiJkLE
	o3oBwUdOxx3HRjpYd0Ro9E+duZwRPg8MOlvrAuw6jv+QhaHmja1FFVCevQVtaH1YGRvOwK09pid
	vkVs6UPkLp6iwFu+EqyyXQiWJCVdiXt1EG9P2aCmlqbixrp6dObPqRWra6vC4ETV4KdpoY5R/fb
	DBkGcT9vSW12nSMXtmpBKDb5b/mhp9cD/jBPVMvK28m8CRyfhQF/KOfQhjpyFPJdeuARmdfIuwF
	xRpSp/PV86X2EYw==
X-Received: by 2002:a05:620a:462a:b0:939:3b56:c416 with SMTP id af79cd13be357-93bf5523983mr486566985a.8.1789893588236;
        Sun, 20 Sep 2026 01:39:48 -0700 (PDT)
X-Received: by 2002:a05:620a:462a:b0:939:3b56:c416 with SMTP id af79cd13be357-93bf5523983mr486564585a.8.1789893587744;
        Sun, 20 Sep 2026 01:39:47 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc52a5b6esm94919145e9.4.2026.09.20.01.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:39:46 -0700 (PDT)
Date: Sun, 20 Sep 2026 10:39:46 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: stmmac: dwmac-rk: fix bulk clock leak
 when the PHY clock fails
Message-ID: <aq-b0sgCy6ILmWSc@lore-desk>
References: <20260919174223.2356964-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lLE8aJHE80lsFHy5"
Content-Disposition: inline
In-Reply-To: <20260919174223.2356964-1-coiaprant@gmail.com>
X-Proofpoint-GUID: vJg5Yal4crYMEjlIUYcAgymCuk2hqCez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNCBTYWx0ZWRfX6xNK9rkfEu2F
 PYkga+/svEv8VRjKQRjBzdP+bBpmMQWcR6lszWJI70UJp0evHvd6sBn9r7gL7HghSFJqX2pVQpT
 ZLvQIQwHUB9jgeWoTIEJKa3ktAeo/GlF7CZDK4IkgUWXnOK+VohlvBYBuO/CRfq470yoZsJ+xXT
 jQ004zlRExl8vJ9ZAIcyLjWa666M8dzrqRjK+zva0aGj/bxGt9uNeSRKmq2s8ZIzA+saU4a8Jn3
 Yf0Ncp0HtxsvcT9ubG3wZEMYS+Mpvc2jK20D8pksGF/LMiY1PphETIJQeJg9B/OY+eFo4FyPxuL
 jE4kf/KPZ+meTh56LeTxMDwoXuw+Uy61/TAq//mFngMQgxotosFl8/aqLZf0GhCfkgSKFKi52fG
 rc+Ilhp+Z2rwENdi+UEoQ05kYUVKEF18DFInb3iEVRgqqE7ksu9yzFk2MH0AERpg4a51F+cgyQP
 QxoWGSXGb+i3lIXDe9Q==
X-Authority-Analysis: v=2.4 cv=f8Ddl+yM c=1 sm=1 tr=0 ts=6aaf9bd5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=xsftiwRyr5-5OFJR58EA:9 a=CjuIK1q_8ugA:10
 a=zIhQHG-rzOcrLlsejY0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNCBTYWx0ZWRfX9EWpPP6MrBmU
 jArifDUzm3XssQ3rdXhfWJqRhexY+NBqLwMKN1eqR+kGn2Ev/G57l3z9Xzq4VdqkTLtbF1KwG4E
 BD+zST7YkReEekU+XSGjWbEnILvdy18=
X-Proofpoint-ORIG-GUID: vJg5Yal4crYMEjlIUYcAgymCuk2hqCez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_013950_076110_96697359 
X-CRM114-Status: GOOD (  19.73  )
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

--lLE8aJHE80lsFHy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> gmac_clk_enable() enables the bulk clocks first and then the optional
> PHY clock. If clk_prepare_enable() on the PHY clock fails, the function
> returns without rolling back the bulk clocks, and bsp_priv->clk_enabled
> stays false, so the later gmac_clk_enable(bsp_priv, false) becomes a
> no-op and the bulk clock references are leaked.
>=20
> Add the missing clk_bulk_disable_unprepare() on that failure path.
>=20
> Fixes: ea449f7fa0bf ("net: ethernet: stmmac: dwmac-rk: rework optional cl=
ock handling")
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac-rk.c
> index 8d7042e689261..f3a98bd9d6ead 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1163,7 +1163,10 @@ static int gmac_clk_enable(struct rk_priv_data *bs=
p_priv, bool enable)
> =20
>  			ret =3D clk_prepare_enable(bsp_priv->clk_phy);
>  			if (ret)
> +				clk_bulk_disable_unprepare(bsp_priv->num_clks,
> +							   bsp_priv->clks);
>  				return ret;
> +			}
> =20
>  			rk_configure_io_clksel(bsp_priv);
>  			rk_ungate_rmii_clock(bsp_priv);
> --=20
> 2.47.3
>=20
>=20

--lLE8aJHE80lsFHy5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaq+b0gAKCRA6cBh0uS2t
rCAUAQCj0yfpPfa6URfV93oy7BQLAm5/S0I5F+E5Bxs9H7YvqwEA0d7mRWgJU5W3
57K2prdD0OU/F5c69mDQ0MLisskqwAs=
=MXlj
-----END PGP SIGNATURE-----

--lLE8aJHE80lsFHy5--

