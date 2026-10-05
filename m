Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA23CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUVEJhKhEH7vvNgnLgaPTGHbo49iKYfTXpquXY45oew=; b=Hrqzc752EKnAyw3cpnWhInSKxo
	F2Y7Hr8/SlTyUUhhQDYf1FGhtlJLAfkPU/P+a3MTS+U75tsPaAaaV0Ei10qTeR4Ldw3P8McOcKSYC
	vDO0PZI5gpdFTXY191m/QvYVN/lQnZatt34WARtIGTCLEjGAwg7EiwLpUxLmmhfzrRkelKCf5ZbA+
	OEmY806XrB6pqGMrt+/qXPZoyiL1mupi/cDkho5mSyDgZJhGnxCFrP/0Naxm+UASrNpS6mgyhiQFp
	UGFtF+6UAc+HK9h3/o64YrCsFkU7ciYt81OD2NN/joRfEtXxGOMjIENc9F9ZnVdO9jQoC3+2EHmnj
	w7WDcK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdwq-0000000Frvk-2s3u;
	Mon, 05 Oct 2026 08:21:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdwn-0000000Frud-3oXu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 08:21:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69583xUX1180849
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Oct 2026 08:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rUVEJhKhEH7vvNgnLgaPTGHb
	o49iKYfTXpquXY45oew=; b=Vn+fY6jXyjwSkoxvSbfhNbdoJb3l/q8JJps8P7W0
	kdmdltjbDkp+OIyPABTSsnm9V6ab7WoyVR3PHj5gza3kDOP/V16DBx4ZtY+CWGha
	jB41ZPYU6zFdcE4flZL0Bb8xOJ30s9Yu9kzap/Fk7zHw6ZSel2OEMmzvnW4yhHKc
	xMMf1tUWYjr2cWqqm/gvqewHf4JJA3UsIDVFyK5UK9t3k+TB3twhINEhM6gn8v39
	NQloVXps8JRgVN6Lfjd0TrOdrOrfsEbzEpHWBRIYhifZvve4EKd9kMVqdt3XXk8I
	QX5GU7UYQfODBUtScAoHyY4ERomnO3WeXXBAI7m62a52Sg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs18kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 08:21:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc0b31ecaso339890185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 01:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791188480; x=1791793280; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUVEJhKhEH7vvNgnLgaPTGHbo49iKYfTXpquXY45oew=;
        b=UZu53K5a+R381oQwC2mawxd7caZO5DmV9oZ0hq4GnVr1fnr7sPb+SyxF01coOhXaek
         y7Q6qTRmkS2z8Zemu+nWuNIEsIchLdRSInBkLSe73vidmwlMm/JcrXv+PqHMjpkz2UMq
         j0cmx/89rC34PEfBjdB4e2vB3o0Ii6UmmuejyJzJqit7vBM0nWgyvz3rrdRzLRSuRd3B
         v9VvHTkU7W/snCGpERAOp807AtmxccV9x7q3TmjD9Hk7hXVNrjqdIUnMoGttKH2Zn4r9
         nCkn3xNC+YCJH6Dq2cO9IoipvU/l3xxDYcnIPnmjiXuvDw7bsggEMqMNVNochX+japhw
         /y3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791188480; x=1791793280;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUVEJhKhEH7vvNgnLgaPTGHbo49iKYfTXpquXY45oew=;
        b=F72Olq7m5ZSFEw4a1uGKwKiTnR+tdjjI7BYYUeZixWtx62RA61H1Tdaxr+gK1q86uu
         66drV5+IzWGseyBupcbKTXDRfBHyLG5uJEZhIUgDjZRZWrlQ1U1QhqXwXOgQXvfsO28L
         LWQvsDP/h1wASV/zJD/v3g7zbIWMdCea42oo4/MCMEyDWFvF6IiAv9IqjRcH2vwSU6nX
         L32v6Ki4m0/8gIylNhRbuC+tBU7PNNO/I4vZzEpgH7EXgA8JqmKYnt1yFH9WIPZMxKTw
         v5kHO2PKpUpC6JvdBQj/yvuUhX9dLTs49ibvEEHZvQhV6huJpAZDuq+tJ+FH9b5PxmcF
         UVpw==
X-Forwarded-Encrypted: i=1; AKwUvBws7OxCgfXI7ecAqrHpA5d3LJwjsqzVKDxRWVKcVr3jeMrHcldqZLXuLRQAKgFG1FEJGMwsvFy9N6LGZWXG15Ih@lists.infradead.org
X-Gm-Message-State: AFuF++m3t6DMmnnYQgvlQhrbcu0LB8k3rEECpESo0yhmJO1ZMMMWEAV8
	Ckz2pvXo1GSkdW+tCRzvdOPlyOdMHVtZO2mHJ9QlDuhmmHoFj+PgwutxGzM/UIgIHVpJH3mJR4f
	nmZwCxrdN/kiUUDQNiwFJVcyyO5IZEZkhamBWLBvTOmngtPruFb3zWwDWBxC1vXpsGk3RUahwj+
	6KVw==
X-Gm-Gg: AYBFou02QvyADlFM8kJBVTdHr8y9JJ7b7OeWGKcgW+C8GbqgdpA3hzHjx+JSnCutI7y
	BIkcGfeS+vL7x7FWZVwTB71x1Ykf8NJISIHMxA7KKRIIahr+nKReembsDZCu/QJyF0+UWBjDAZ7
	875dKulwuVz2Y2Mg5FZo3sbneI3QKZ+MsgOKR4+M91XGwDy9A6heDjpW+485o07Q6RUJ6Yl6fkH
	wafTBhwN7H8ozox0jmJpm1cazVt49rmAnJf4z2PjIvqqiAMTn38F43xfnpjDs8ZHU4Gla/u8nfP
	75OwLPifnseEDmEcrncWv2g+X8EPGfncE6G0OXhA+yq+gzpIUhSqV+ai5eGHfrKU37Tw2+Nw/Bo
	uKltL4jWAWHDs6w==
X-Received: by 2002:a05:620a:27c4:b0:93c:c6b6:f07e with SMTP id af79cd13be357-93e510414aamr1063402185a.40.1791188479994;
        Mon, 05 Oct 2026 01:21:19 -0700 (PDT)
X-Received: by 2002:a05:620a:27c4:b0:93c:c6b6:f07e with SMTP id af79cd13be357-93e510414aamr1063397985a.40.1791188479240;
        Mon, 05 Oct 2026 01:21:19 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16bcb9a21sm289902275e9.10.2026.10.05.01.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:21:17 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:21:16 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: stmmac: serialize PTP timestamping
 configuration with priv->lock
Message-ID: <asNd_LvyknoJG4Yd@lore-desk>
References: <20261005-stmmac-hwtstamp-missing-lock-v2-1-3b3bf4fe3f45@oss.qualcomm.com>
 <179118798620.1402591.3969606322694204017@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fNN4X/HI4OLgub8a"
Content-Disposition: inline
In-Reply-To: <179118798620.1402591.3969606322694204017@kernel.org>
X-Proofpoint-ORIG-GUID: 19r50EQy-dr5jtwyU2uOwyjYi_u_Tjbc
X-Proofpoint-GUID: 19r50EQy-dr5jtwyU2uOwyjYi_u_Tjbc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzMyBTYWx0ZWRfX5HVuIrPgCBKC
 DJjWxu2LsaU07SSOVJjcG6l+yPjzts14jv4IVr670FkkEsJZ6L/MQQYzVYd/QwnGi8CyqyE6qFi
 5YTeRb+nO2cvE2YzYyXwvug5SwzzA6k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzMyBTYWx0ZWRfX8a/5j2D+ysdV
 47SzgDuVmB1+WZtGf6XGvmdBO8YhuLNcMRQo8cErVuQK5zqS/5pn9iugUzPFFtTGsiZB9JLJjkn
 u+AjeJ5Nmle1/Ni6Th9gb/wqm1bmqqMtNJG7sIw+zVyIpMzcxxJv2on7Sf4sbyc9kDyNKSfUTRl
 N4FOQ2L8+ZvikbQtPrqPl9xvzTBZAysU/sbcHolv9Eh3OBa1rcwitbpP+ngmpUrNYPfPaJKb5Y8
 ByEhEMZH5DnZnMefgOO2jRFMzToCn+lsa0/XWS6cxR5N134z2y82sWmfCU5gWZ0u/rgkaS5O72y
 QPZlGl37EmLBUveuBCRbJjy0cwheljrjd0vKTaQATiToKLGfNebmMdd+iDVWy+iZTm/xiyxYgBU
 sttLQWfPbYPzATj4sXxMxZOzns3Q9/tJz5vX+mM+w3lK9rD00PWKUoETZH0rcXb0wM7qp4dwj+F
 TURTBCk1Q6R4y5oI6vw==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac35e00 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=V1iQPMawNJRGt7sAMh4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_012122_067277_7F3FE81D 
X-CRM114-Status: GOOD (  24.07  )
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

--fNN4X/HI4OLgub8a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The issue was spotted by sashiko.

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

This is a theoretical issue found during code inspection.

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested this patch on a Qualcomm Rb3-gen2 board.

Regards,
Lorenzo

>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

--fNN4X/HI4OLgub8a
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasNd/AAKCRA6cBh0uS2t
rPYZAP45J+CHNqpNdLNS4qw1OTxElIz+xsyDdFlWYLyLbLcgwgEAwko5tKXypMQd
4+GY1KyvDAJ82pv/0r6Y91TaEB0xXA8=
=/FIL
-----END PGP SIGNATURE-----

--fNN4X/HI4OLgub8a--

