Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401E4C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tGM9diftK82uEPdEwwEmZx3599l3xHAru6r160uTxg=; b=G3KPFqsF0FkGspT+sU8rf7EX0v
	aJmaZWQfUb2xK0V9nTXhWEKtzdcb0hnG0Rt8vdePNEE1Qb4ahFInyPtvziqdpevj3MYbtPkcnPXh5
	HJ3CMIEq4fX40qQKvuJEFq6zrnuc99LOHDSnIYWEuxTEu9sXset9L4xXytVEDYaccx4hvhNACIIxq
	qNLBZn6LK6ml5gjcwUWwcerEfhm/QipjQuezuEgB0XC1loV2jeorntCvL7BlXqCIlRtj9A9pocldp
	TCjpMkJsWyYRgyKe1K1XM7B6p8j40cU4moGSVsdFyu2Szk+WkxI5+KvxIiD55zXDQjo6oEsT1pDyR
	A3XaRxzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ayx-0000000Ds7o-3Vdd;
	Thu, 10 Sep 2026 09:22:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ayv-0000000Ds6U-0ldv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:22:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q0Rq427115
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 09:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6tGM9diftK82uEPdEwwEmZx3
	599l3xHAru6r160uTxg=; b=REL0V7zVLnqqNklSk92VK2ksvnh73yn+uXTKLHJa
	u5ee37RDZSmQNr8DYqK9BkKvuyr7VMA5Oa6ujFJloJjRdacBPvicVOMa74qSvF9A
	MQanvxpWteCjrq8sPhgOzkWJItBWBhLMYS2NA4wsrU6dryGnJCOxlBbxZ8nx6Fqj
	Hc5ozfR7FsG908utiitSriOOmvQ7PviR+6ErTkQYQAxy3zBw/azQQRo8HLwHWB89
	+9aGRIg55uI+MNM5ozqnjGZOzwNvo55WT/EjcBOQZ0JpophFPRystsnrGEs5K4dC
	0UgGNmrdymloI4GKJ5op/zuv9ayWDHJpnmqPgedlxUExHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd32bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 09:22:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b571432fso141978185a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 02:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789032126; x=1789636926; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6tGM9diftK82uEPdEwwEmZx3599l3xHAru6r160uTxg=;
        b=kPddpac9XUW2cEcxzV6TC+Jix3Y1qNC52Vrc3ro7UPV3ia3Y8TM1ENo/Hkt5yKpHcu
         0dj9LaV0rQ4xWKGY0Zn/3eqlFkr4pk87Vxrn24pzl3qggJIz0Q0Y5G32YK6BdZ515NAc
         JbxbYzyuuCrdWgChdZicdsR5NUuFWEnTQufHyJMTZT7i1dPVlypm6UKGR5/2HXfInDQI
         exRGxUBCDg/ESCZ7rfI3iUQmR/4AHlAq3kAtzjGdFfdAl9McHV3y8V/YkunXYo9S3dcW
         23SBxlTV53yymw88rj+SmtUKV6An5GmZ5BD2gKZoYnpL6Fzmso1KGdskUcTtBmchsfmq
         Fbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032126; x=1789636926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6tGM9diftK82uEPdEwwEmZx3599l3xHAru6r160uTxg=;
        b=mrvvwifkGMqfXGr9Os8qzWeIM6G1N5nCDRSfzqqqdZwXFiRr6J0CM93s5fPucezUVI
         Zc4tYzWVfz64mQ7u8vQ6mt2EuqTpkmn/Zq2X6UhQJbJ3W9NZpAirrrSa6YOP7JtvzndG
         saQTuG9tGududd/7QC+yfux0Qi02Gsi5HVtjyQgAQqvYxcGsN8mOrTXnaHjtjovrAnCO
         pbXNbHioqrO9N2sfGXfM0LmyKaZbO6RhZ4kGBNePGPoEQJ3DMbZgi1TakXWQoaBMCoox
         IifEnD/t+cBoOAseSaTlxcSw8l07+NXr6Wxb0XBclozmb9bumZQYZGz0ccorXXIycGr0
         Y6mQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3ahPIlTbKMiyemsqZ/Xl8eJT7X45dclSAB5HhNlRMC+/RZ3yee1cIxf37k0PJsX2OUEXstpXYZ8IESmwTVYVv@lists.infradead.org
X-Gm-Message-State: AFuF++lph9i9o+fu89z+K0o71wm6IzN1JEL+tEahSxK6dKqZy0Z8JJMD
	wOX6ri4HP8xiQfxhuE0hjW8JZhb4OKTE1oMrukcy/LwJ/FV+ok8Foge78ZXxZkRX2lh3nAZfDil
	v9gLj4e+zu2nbeOVG8pfLaiPjrMkcMuYlUh5ytwTFoJYVcQx7cUcm3+oz8ACto+0xDBURUTn/0S
	pJKA==
X-Gm-Gg: AYBFou0ZKTqiMRcLKIMtWsWdLpJg0jV4qi1YmmFiPRT7aMrzUxtqMLWzxzhbFsM35v0
	t3uLnFm5oK735vpkqbWNDvDMEkQSCNPRqu8ydYKLwZ0EiSWZVXVpaB3alDZ5gm/A8oi6Pm6A6N2
	qjQ4227uyJYxS/7t3rRIWEW+0hZ0wENPkg7juzumLMHsNDKiLnJGjwIND8URvcKR15DeKoXZNzO
	+jS87F9OPt1RAvtbMjJkUub8SqxLLpqzJUSyjnQ+PKkDvjRdrBlcGjGe+3EH64T200IJE28N3t3
	fMVuX/jzEncA4Rv3UB8fyMerAEVXa8wL0OMsUsxgHDbqKfjJe0rOe7BALIs+AiL2l1dHEx59mhZ
	vQFLuKm/xo/PXZQ==
X-Received: by 2002:a05:620a:8801:b0:939:319f:d6e3 with SMTP id af79cd13be357-939d7e4028amr435138185a.5.1789032126546;
        Thu, 10 Sep 2026 02:22:06 -0700 (PDT)
X-Received: by 2002:a05:620a:8801:b0:939:319f:d6e3 with SMTP id af79cd13be357-939d7e4028amr435133485a.5.1789032126022;
        Thu, 10 Sep 2026 02:22:06 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm41732270f8f.17.2026.09.10.02.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:22:05 -0700 (PDT)
Date: Thu, 10 Sep 2026 11:22:04 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: ZhaoJinming <zhaojinming@uniontech.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: fix stale descriptors and DMA mapping
 leak on Tx map failure
Message-ID: <aqJ2vGaushx4EL5q@lore-desk>
References: <20260910-stmmac-fix-vlan-desc-leak-v1-1-6b07dca5e5e8@uniontech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KcOlHxOUPHTI2fBm"
Content-Disposition: inline
In-Reply-To: <20260910-stmmac-fix-vlan-desc-leak-v1-1-6b07dca5e5e8@uniontech.com>
X-Proofpoint-GUID: csed1FSHRDf21h_MuB3E3DomCOPCgVHr
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa276bf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=iHwBjlyiAAAA:8
 a=w8qe9T3wKc6gY-gyingA:9 a=CjuIK1q_8ugA:10 a=dhHhmpoG3uERpqc57R0A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-ORIG-GUID: csed1FSHRDf21h_MuB3E3DomCOPCgVHr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX9tTTuAhm+GUN
 fQ2cxGsSzcck31Ck372XeJHo00/itbHDFtYWv4HzcYSWEBWAhzqLOuXamPscuXY6Wk9fSISDplF
 XHktheEJOp1UwU1/PzunhxN0L8bNRqg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX1B/9bTtXp0em
 oTO5fgPBFFKaFV+8qNhFXFc9PEjmObGN3JiYXfJfegaeM270EUFBGm5M+VDkisSn7MdO5kYBRke
 KwcGW4OYXNX68UaeczCiS7qN74/0fbmaTlgIEMz0ele17wKZ6KuxYcvJO+XCMEzeinJRRfRvGo4
 VN9eOQdzElRbB0i3jSwlSCQgZrZLh0UU8E8y2wALPBwNmvBPCQaaXmKkRw63acS/6MUFQCA31Kg
 GutS+Su2tl/QgNFXRDlEpwme3sEfrk8Jo67xJDK4s8os+dFW7djfHQvz1q7mT5PNk7bJunBQtXj
 oV3y4NCwRSiyQhvGwOSZzcMLp8XhJrphEYQaXbVaY8USqvB4EVq+7CMZo50AmGD5iuOLDoV4slL
 Q0aER2bLoRALbilwTXhO/jEGxlatcZk8Zxd426I0uXpD7RcR5/sVvLaQqCR49DY4taz0pUjOJ8t
 crrurzfKR2eL3D6pT3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_022209_343678_FE35B5F6 
X-CRM114-Status: GOOD (  22.87  )
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

--KcOlHxOUPHTI2fBm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In stmmac_xmit(), when the DMA mapping of the linear part or of a

[...]

>  	if (unlikely(is_jumbo)) {
> -		entry =3D stmmac_jumbo_frm(priv, tx_q, skb, csum_insertion);
> -		if (unlikely(entry < 0) && (entry !=3D -EINVAL))
> +		ret =3D stmmac_jumbo_frm(priv, tx_q, skb, csum_insertion);

if jumbo_frm() returns an error on the subsequent frames, entry is not upda=
ted
here, so we will end up with a DMA leak. Am I missing something?


> +		if (unlikely(ret < 0) && (ret !=3D -EINVAL))
>  			goto dma_map_err;
> +		entry =3D ret;
>  	} else {
>  		bool last_segment =3D (nfrags =3D=3D 0);
> =20
> @@ -4984,6 +4985,26 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb=
, struct net_device *dev)
> =20
>  dma_map_err:
>  	netdev_err(priv->dev, "Tx DMA map failed\n");
> +
> +	/* entry points one past the last descriptor written for this frame:
> +	 * on failure it is the descriptor whose DMA mapping failed, so walk
> +	 * from first_entry up to, but not including, entry.  Reset cur_tx
> +	 * unconditionally as both stmmac_vlan_insert() and stmmac_jumbo_frm()
> +	 * may have advanced it, and release the VLAN context descriptor.
> +	 */
> +	while (first_entry !=3D entry) {
> +		desc =3D stmmac_get_tx_desc(priv, tx_q, first_entry);
> +		stmmac_release_tx_desc(priv, desc, priv->descriptor_mode);
> +		stmmac_free_tx_buffer(priv, &priv->dma_conf, queue, first_entry);
> +		first_entry =3D STMMAC_NEXT_ENTRY(first_entry,
> +						priv->dma_conf.dma_tx_size);
> +	}
> +
> +	tx_q->cur_tx =3D first_tx;

do we really need to update tx_q->cur_tx here?

Regards,
Lorenzo

> +	if (has_vlan) {
> +		desc =3D stmmac_get_tx_desc(priv, tx_q, first_tx);
> +		stmmac_release_tx_desc(priv, desc, priv->descriptor_mode);
> +	}
>  max_sdu_err:
>  	dev_kfree_skb(skb);
>  	priv->xstats.tx_dropped++;
>=20
> ---
> base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
> change-id: 20260909-stmmac-fix-vlan-desc-leak-f057bb061daa
>=20
> Best regards,
> --=20
> ZhaoJinming <zhaojinming@uniontech.com>
>=20
>=20

--KcOlHxOUPHTI2fBm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqJ2vAAKCRA6cBh0uS2t
rO4sAP9QplCgEOl7LHiJtVRsPPgK9CPA9e9w9UD6ia60BXo9jgD/QCPFa663G/VC
TKZ5L1wUNGHzBoI5o+tS5xidHxQsLww=
=LJmx
-----END PGP SIGNATURE-----

--KcOlHxOUPHTI2fBm--

