Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEFFCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sqq3d4Um/1FzAW/kUe6wQksJqVemNCXMK7vcu4NUvaE=; b=TZ3q13WXfbyfqavMLPM1talEpM
	ZH2teuh0upS9j6tzJwBMoJWOCPg97tYZGfPSbUuQZAAms6Wg4IE+BfjZrwG56Rc9cYuthSnxVU9gL
	v1g/i8qjtICRyV0rakqYqL+gaStSYHc5GRYACgZ9e+qGx+5kJYOlAaxj4oxeiFPgcfk97X26oRnI7
	+enXsJ5XdlQ1q+h4JA7BjnyKYfzC4POVjfPgwJIx1AHX2lJuJ+MOzrQ/uYLmLCfKUXPlovYG0qByx
	RbfcAs31lIuTcabh8LsYOxf+595IUEZfduAlV1j1K3bnRXygG+aaGWr4zquoONGJRyf18BcwconZp
	afp4dd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGz6U-0000000Fbi7-2RLS;
	Wed, 14 Oct 2026 13:33:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGz6Q-0000000Fbhr-2HQO
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 13:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Sqq3d4Um/1FzAW/kUe6wQksJqVemNCXMK7vcu4NUvaE=; b=YD6ND5ygf+hkQYz098i7fCuWtS
	kRf5dmQ1IqG3r56zrJDja/Q+bNi7tUeYdrbYSyfRMF0iFLrO6wxALW4H0i93rkc4UDaUkY5y/O5JW
	W5s/OzBOyju+YKvg/kyO+tRNTmnYaF+5us/+IIrck6jl067F9MEYQl6Hb9eSaq28iih5AT2TVzZi8
	V8O9UWaRRmiuXELagzLJY9F5K2943BDAJqGFgY8h0Kyf7lGDsliM7xj6SXt58Lwts1hzB1Ltyq+UU
	Ei/VNzZJhS8yaKGzI9P6CkDb7h8WwS5tUbITzVVqNNUnS4IONMwbx/ZNscUB6zvjig02o+bvDNx9w
	0SybS9iw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGz6N-0000000Gp5H-1YFa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:33:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDHub8329046
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Sqq3d4Um/1FzAW/kUe6wQksJ
	qVemNCXMK7vcu4NUvaE=; b=UnfABSKF4JG68NRDS67n6FE6AnekBQykOL4dXwyE
	Lyv7SfAq92MSxg/NrlbJV+N22FkwrRfz1rvxBk56npO9QdUUq/VpujtVZEIRl2Ta
	nYctr+D9MFQKQ7eN9JOqCUogOh+OQC8JeUOiI9pCW9roWtHj5GlmcnsCP05PTpii
	5GRxY4+zhnTqgZdlksK+Qjb29bFX8A8MYjCvwAgbXr78RAb52zHSYJMCiJHPrfL3
	oNlOsNFMMq9MXzjw67mbd4gMyk7ImLGh/5DZwJAhXP/P5rImYvy1xtETZIjoZD0X
	4ut88kZXLGxS4yDQ95V+egmivq9706ssobJbZhFmUxoncA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf0204-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:32:50 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98e3ad6dbb5so24883241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 06:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791984770; x=1792589570; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sqq3d4Um/1FzAW/kUe6wQksJqVemNCXMK7vcu4NUvaE=;
        b=K7xSRiR0Pc9wosAmI5K+1myDvJYhvDt5nHSP5GHgxTIFzC+xrq0rFzg5FioEZWlRKp
         sdO0xuHYURP61xC74lORrZ2HsAibRHDF6fDLKR1F5XUcpyTvVl1GJBKseQKlhMKhU7Jm
         cBBhtC5afGE7vasYdLYhlHRbbVVApvX3/BsSMzkCom5u9EejEmOJ2TBSIMYWzmKcB9Bz
         /IscOasdh8pRxEJxK9s77iU8p+6OV4gkylbNbVokr2Zm0zIOXRGoyWkBhTCKjkdi0k46
         htXfDHvzW56Y+IFMi5OQqwwR8w38++WOfF9/OK7vuYYi/Q9Y/LZtOmk6/LynE9Gtws+3
         c9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984770; x=1792589570;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sqq3d4Um/1FzAW/kUe6wQksJqVemNCXMK7vcu4NUvaE=;
        b=wculrAd/npsarYNo6aulvk4D025928Dzch/PM3kIZRnJw/0+HhUN6IdJz46rA33t3e
         h2h958nbbTsP5Xib2Ixu2C/tJ7LsF2Zq8EcqG+3bdAxJKAo/EY3nuNDSpfCSG3UUaL8x
         yQ//BLhFYQ1xyrQXNMEonJ4F7FxVTudzNMVHr40xBvj/yLwhVyXv/GfRSJtMSmI3rLTT
         5aW6RlVPhCv6i9ZcV2+H22DQwgde9LW8jWb1sSA6dOLkd9yCXxlGULzbB8Kf5jlTkkch
         8g2fiBK5aWWvXicvuztPrCe9pgEsAJvMCllnpYhOIjEoQ22UJqPR4gnTis12vcTnCIub
         25ag==
X-Forwarded-Encrypted: i=1; AKwUvBwW/z8neX/IiliNNB2wKylLq02AZvquYjH5MhQA0Jk+qdLz2zRCuvzjI1j4dm5TEe651Me50d35nyEQYrSG4gqG@lists.infradead.org
X-Gm-Message-State: AFq9FYIDgqdx2wt5q3HAszMOKSkACID17GVWY05jSWQR6mpdQ83LCi0H
	8ERaF5ssWcIYRZUEWD+umEMUzzC/7IZcgA63IpN1qv+ri1xuVs45+iu2iTumb3rZkfZCj/mYQm/
	C/PcCwz/VsFnCM+wdGR+2oGVdy/BlB4Zaw+bWZmUrd6k2xPyUwVlESGfa/9RkqB49XKiO7d7yTy
	DGYg==
X-Gm-Gg: AYBFou0OOP8Ppdc6jlTUG9I95hTzgASEPYzomDxoG2bgkTPm5fxg64OTGSPWdgYBM5i
	ycrFvvFJmnEewBFGAD1digr4ggTx6Fvdyld+f+LTZIJ3xU8j1jfXY1kzYmp8jIscecfPSqMYXYh
	xsw5wUPKqZHzihwzBXT4NripLACSgyoHy1pYwXlCOoLt82PBNzkMX+2WMO0dWFImDtasYSutJSp
	xB2nm9DrJqwRW4d7lEmNYOEUWJybCjQ03Puc1OkXw9jtIBc6LlhezZEAq8vx72q6nIKc4GSRsmG
	P0QIeakxTbp2M/Og68UcbeOzXMg6Ye9zPEwAHn4mWRwe8Bv9zPaVRGAxFn8+pGX9rTu1GUAfKp5
	W6roccXgycUFh7w==
X-Received: by 2002:a05:6122:20a8:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5e91f48b6b8mr4332945e0c.13.1791984769679;
        Wed, 14 Oct 2026 06:32:49 -0700 (PDT)
X-Received: by 2002:a05:6122:20a8:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5e91f48b6b8mr4332918e0c.13.1791984769035;
        Wed, 14 Oct 2026 06:32:49 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd07c276sm416225e9.13.2026.10.14.06.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:32:48 -0700 (PDT)
Date: Wed, 14 Oct 2026 15:32:47 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
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
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        James Hilliard <james.hilliard1@gmail.com>,
        Nicolai Buchwitz <nb@tipi-net.de>
Subject: Re: [PATCH net-next v7 0/4] net: stmmac: introduce XDP rx multi-buff
 support
Message-ID: <as-Ef22VEKQcZ9QQ@lore-desk>
References: <20261014-stmmac-rx-mb-v7-0-5d2d70f052cd@oss.qualcomm.com>
 <179198374828.320699.17103999780938670424@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q3kgqRgL7mAsQ/qT"
Content-Disposition: inline
In-Reply-To: <179198374828.320699.17103999780938670424@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MyBTYWx0ZWRfX7568DX2YCFu/
 GHakRiOZlGTvYAhz1SVMkZS7lYbucsAPC9la3piERTBZUK7QOD4OqaoIjHq9BsAC4o+k82//Tip
 fchIIOwnwvBtWm0CKS8FO3p374gyQASHw2QYBO9EfFyxWAIoGwI9I824N+vPPHNZNEEBQEEjKp3
 39zdHPTPCXgJg/hIwp0ELPQK4ppay9dTARBSov32fsuZaf6BwsWhzU9vh72ZXY4ckGMO3C7w3cY
 rvTgVxlQLMbboRyrYNAiRrEgI59rzKJVLFluWdSNFui1ybuGaew8Enf3JDX3AMzPabZqvwpkLjA
 mKvcS8GR06/rywZ9lMP8Of3nWIBFhJIrFQRJRZpaBRUyKcld5WJ/y28pjUuKdR1VbCu/tRN0qKm
 tK6eeWgY1CsKqdgkAXCbSzR2aQe89fdBVHIc7OvlmV1GahWrTULyBYtxMA9rF9wSIgvU/2N5YVf
 z1fKdkxSZ9KBS/MwSow==
X-Proofpoint-GUID: RrSDNgz6bpe_VG-ecGyxJ_LbFMGEugwa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MyBTYWx0ZWRfXxcRaUTUcIGnz
 q+tc0QbqdMyPFpFZq7Maerpa6mX5ku1zOWA3K4emWtCe457PRtoKCfhpSLsnwwMLAaz+UdZsePt
 3HfObDokMA2jp7rF2BUSRlYTf2bm0fQ=
X-Proofpoint-ORIG-GUID: RrSDNgz6bpe_VG-ecGyxJ_LbFMGEugwa
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acf8482 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=cApNwXssEwYNTDXMzu4A:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_143303_870005_01950FEE 
X-CRM114-Status: GOOD (  25.02  )
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

--q3kgqRgL7mAsQ/qT
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

The issues have been reported by sashiko.

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

The issues are real bugs spotted by sashiko.

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested them on a Qualcomm RB3-gen2 board.

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

--q3kgqRgL7mAsQ/qT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas+EfwAKCRA6cBh0uS2t
rHLiAPoDfKUfclyNbJe2zYWQCf+joNgROzCH1Sw+dJSGo0Hy/wD+JduogxPwQFL2
qb5cuv1UhjwryPGYdH+CM1gOy0VEIAw=
=E36V
-----END PGP SIGNATURE-----

--q3kgqRgL7mAsQ/qT--

