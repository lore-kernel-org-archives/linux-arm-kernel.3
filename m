Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B2CCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrWa66j0hTcus25nYq/Fkb5TBHxWAJjvPe1utIoQNCE=; b=mToeQq98E+crCOLPwR7zDuNtXZ
	GG2qnQhGZr3Rg2ClVbGcBB1soixusDu6A/9kIpJwQQFhcU+BtHr/imDUteSccvY+wzu/G5C16Ym12
	xeny/HljRDl8QZ4zxqdbeudh4/z+lENW/tm9yuc7pkRABi1YQOXddb4IrV/QddU6WKUK81ZpRi/Fw
	nQBpdg56DA7jQYkR+enxZAJ+va9vuyZKKimvc94GtU7bflUK7jGxMO2zB39Gs2p0YKVqiSrS0ibNT
	T9mXfL4wbvNzxpS89g/zjvv9wlPBqgam71mvUo8vBV/i+ZzCbflHayt7F3vT9bTGdpyQ8H5Fu2oFG
	esbDaPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDFf-00000008OhC-0EZi;
	Thu, 01 Oct 2026 09:38:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDFc-00000008OgG-4BNH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:38:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xltE1661059
	for <linux-arm-kernel@lists.infradead.org>; Thu, 1 Oct 2026 09:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DrWa66j0hTcus25nYq/Fkb5T
	BHxWAJjvPe1utIoQNCE=; b=PRSB/MnVAwE423KDKNUELp9Meju13Me4itv8BetQ
	vDfFGoP37nYhIx1y+xxH3OllKzS+7Ugn+xC8XwcWsmpBZEdtbcjP6iMusatgGD4x
	T40+A8+ln4hqebacjLhxdV87ZdEokaXuOxj/zgGHtWOULm7sWLQkmWzSxqmBgDo0
	3nCnYOh2SEE+7eGX3/o0sdFZE785V8mgSDz0LefKivTc01jgcWoKjKJTrH5RwC9o
	OR8i9hPhiLx2q5uoDZ9NE1ttCxyMZgANu5OreznsdJAPPrQRQwYJPN4knDzYsjuS
	VbCOC9Z5P9f7sNFioRGWo5i8JUJ82V1mU6EbrL0d0TQunA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pkmwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 09:38:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91235881828so128180156d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 02:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847531; x=1791452331; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DrWa66j0hTcus25nYq/Fkb5TBHxWAJjvPe1utIoQNCE=;
        b=S5T0UTgDAkxYODs4bTMgbDOrtKq29ALWff/lYrSLQE4aq8FW6JXdCms79pxrJ220E+
         bz1iBB7eG3GKClip8xf0aNmw1KXz27n5SA/FACkWRAOW6NQmFqW/XpqnRIjEONABxNse
         cXZuNNub+HXPQSW18X4yr6N79UeIdJKvNXiCdELzFw6ldcf/ebi6l2gPPhs5W/FPpZVN
         holKNJFrrKBnzucy+k07YaQkdzmkMn49hyUe5iro7bEIinmXBbbAH6kqGCArsx7xK3xn
         1G/ByL/8bfO63FVgn41G8NSBclmsLz3bQUy7GAIRZZy3udo1LJ+w98pQNYw/LcE58VKY
         F6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847531; x=1791452331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrWa66j0hTcus25nYq/Fkb5TBHxWAJjvPe1utIoQNCE=;
        b=g4CtFuVa2UxesYsZIhXcF5ikkfnesMIKyEVcgcdaLvjlqqhpag9cZUj3vbz7CPYPsv
         lQbu3zckbelNmI152vucmbiaAIFQlp6KtxItU3q9/vzaNukIfBO7cJ+utLCOUoPJh6rd
         bbWdOkj62+8t+VW+k5MW84wD4Ei5wD5Ze0ub0DHjohhF0SOgXcclCZd26S3x/itYb/Vu
         eVMxRt8Zjtr5IyMGy1YiqJq4E0oBF0NJNakTuwJ5lD7cOwEnoiIUxnJ6lu81ONOniR+F
         fTkwmNoP/ILxejKwMJdtexmZw4JP1DrTS8jR6z6DuaR9aUMoIErNqeS2XAOKiWjlRMIL
         f8Eg==
X-Forwarded-Encrypted: i=1; AKwUvBxZOOnX5NRa1W6kS8gonGFYBabn7g3YB/GgQxg/1vn2LimnrbHkYmEXmO2nQ+gqUPFVceY8B90OmcYkuAvD21+S@lists.infradead.org
X-Gm-Message-State: AFuF++ltqNpmaKDl9GczdId6vq9Ah7WNH/6qx9DUf9R010vrFXZnOU0K
	57Vjhbuc4AOfZNAADrGijZNczRcj/9x7wsry+XHF7UrFkVbAqmVeEgQtJ/YmZyS/P0vHuCEaJRj
	9GogT0JJpG663cZ62YIVy4yybdRdhg9j2i3BLArD0HZsh+uQMY+j+NCugAi6PaHLUUpNucGr0uf
	Y/Xg==
X-Gm-Gg: AYBFou0Jn40OcARhTKQojmHAg+1u6Ap7/UcMDpqT5oOoZjxb2mBWXlJs1/KNZi7RX+D
	Rg2NP6Fm4A61LVoN9CezJwzOMgrCrBkc3Hj7g88jm3V4uZ7r5J9v9mA+29BaT+oY+vZhnGzug1c
	fvBwkNDomKohnqBQUbC++L6Ec9V4970dCgdOmwbXI41WIBpmcnD3piw4KRfGWVAwjdROY+neEMJ
	OuiiRn/6BK4NyzOcRA0VbQANI1+Xl1HYz+8n06M6qBIFovDwFumCi2YeONGQj7OsyS/UCyOGyDh
	U68pHjqnm9A/+DLpYVebEqybxY/3ho45eueDjyBtO3lavds5uAu0dNIUbe7tpBiK2Eu/Ocq9quM
	4VLnTBT6rNtzgrA==
X-Received: by 2002:a05:620a:4102:b0:93b:eac0:ddd5 with SMTP id af79cd13be357-93ca97ae97bmr808655185a.51.1790847531002;
        Thu, 01 Oct 2026 02:38:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4102:b0:93b:eac0:ddd5 with SMTP id af79cd13be357-93ca97ae97bmr808651085a.51.1790847530391;
        Thu, 01 Oct 2026 02:38:50 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f984d89sm64686035e9.7.2026.10.01.02.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:38:48 -0700 (PDT)
Date: Thu, 1 Oct 2026 11:38:47 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
Message-ID: <ar4qJ9gI3dk4S3yw@lore-desk>
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <179068769042.31693.17699965363723906103@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8R9T85pNZ31B4MBi"
Content-Disposition: inline
In-Reply-To: <179068769042.31693.17699965363723906103@kernel.org>
X-Proofpoint-ORIG-GUID: f8CjyKY7Yb1g8EW_FTAHKeTm7eECI1Cb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX/I/gEjctOrxl
 KIjQovy45FwC6YUzPismZLeLIzYZoDRtniMsH2YScHPfTnltIzm0S3JvEIq/I7EWFN96um0t1TC
 eEfigASAdVQPSALLeZNBy2gyhXfiXJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX7Kxfiew3AUnI
 85FE1hizp+bfxFpJnl+yVwBq354YXmo5uUHw8LkzvsuwhW2p7wKSfC9lI+RGfIMw3o8x1jafEL8
 nk7FBxk/zqTdiTmO3Jz31Q1yBbw0B2NtzQY8V2Yyt61hYE1NMmvA1NRQpKhvWT3hIij0+nNFRdH
 YrYoC8WNhHfcFnFwtiMpd2ef4gzzTrawiczRSJKDEA6MDafp4D2iuAvKMPkkDBI/UXEx45mL6da
 vAYvuct2LB0BL8D2MpoZtEdZVNBAQMppIimgq1yn1k6K7UjeovW9aXTLjdHd58rJEZR6/hF0mrw
 qno+WErx4PAxycOqhtVQltH3Mg0ClIoKxKI4GrgOVXd1AUXyJh5LQi1p4c8ucs1pzhoVqOJiJMV
 o3kF/d/ObrWOFS/TVB7lupnXo4AEmT1oxcajgZbVhEUPyEns2qFdM0WNvPeTdHoPzlK4jzs7oIL
 lM9a0+y4YR6UoKNkj0A==
X-Proofpoint-GUID: f8CjyKY7Yb1g8EW_FTAHKeTm7eECI1Cb
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe2a2b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=TtmoeoLASM2qgFhL7psA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_023853_153200_9D2FA262 
X-CRM114-Status: GOOD (  24.89  )
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

--8R9T85pNZ31B4MBi
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

I discovered the issue during manual code inspection

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

This issue is theoretical, I have never triggered it on a running device.

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested the modified codebase on a qualcomm rb3-gen2 board.

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

--8R9T85pNZ31B4MBi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCar4qJwAKCRA6cBh0uS2t
rELSAP9HYlTAf2mcxWuOVgeouaefMXxRsMxlo7nr5ueWymrv4wEA4wf7C2dHgd6W
B7t9Q80FMvQlwZq2+VnfrK6bTc7NAQ4=
=fQft
-----END PGP SIGNATURE-----

--8R9T85pNZ31B4MBi--

