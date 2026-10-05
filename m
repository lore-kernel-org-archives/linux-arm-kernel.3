Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F50DCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 07:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2zW2XYrhteEZp+tMcr1cImJ9lxTvzZKtBhMT4o9kFY=; b=4y4LPDyc79sF1hcYLwUpI1aSjj
	MioechtJqI960cXW643UppLiYqRvXYOVJH85yjhgWo4KBq5vU6lIi23qmPE9qOOjy3lJDFQDvhZp0
	a8GHbysLMEUN0N9sBUrsweGOwQ3kgbwuvSBkVGxYWWb9AxuQz+tWC8FQvXxaEWiGjO4nFjLMP2o3w
	TO7PTjGWsqqNBnm3y5hh1zAS63YiIGFw5NzRODi5wPbhAnR5c9uGlHG6iL/qnI46P6JJ9ABL78k5l
	CsuR+VmIhvpaQYqfLn2o0gOfCueuzhGojWlS+6LiaYSwqVV7XV07/hp/tY8Ovc929MhCn8JTdBDq8
	URiWCP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdM8-0000000Fnxd-0v75;
	Mon, 05 Oct 2026 07:43:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdM6-0000000Fnww-0njq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 07:43:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695108ND3688247
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Oct 2026 07:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h2zW2XYrhteEZp+tMcr1cImJ
	9lxTvzZKtBhMT4o9kFY=; b=n8DPUBO+IKzrhykk60ivyIvwjSn0HlGsZfsZen0H
	7PsAQrmLqbN3KlFLzkaLGnYUUdY/f1X91Sti5663Wm6tLKzfQXq4bhUUdeR9mGm3
	YW3Mky1BH8HicxUZvuKRkqT4QMqeBlfRig1EnfvZVgmxZIDnMvZtndpuOz5rK43p
	5h4snJSZkK2d568mbskD7xKvBsp0fPgY8QTNm+HcgP5B2Ha1GXpQDqN+liZJXDP5
	q23uXHcvoqMv/uKaSpxf620j2N/WvZtqYgkdYpaJrcVK1zztHwRuH3ZmYf+ybW7r
	fHZdH/3C164EmjKyt0P+c53KHrjY2GC/s6d40dtAjalHNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfju0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 07:43:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so194766285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 00:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791186204; x=1791791004; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h2zW2XYrhteEZp+tMcr1cImJ9lxTvzZKtBhMT4o9kFY=;
        b=B1R+/qr10HX4zPWXX1J1VM4BRM6pLSKM87pzPVZ2+8b4GlRDFynnmha47tXioJHNYh
         xOB5lPm8zhZLO9UzaOX56mT335PpP7k9G6Y4wqG0rLPdd7MTA/YCgmqPB5SNEDzW/zB1
         awVjAlLNJcMzYMAducwnRLhFAa7amXlzzBxA6pZ/1nJuHUIQ6pOpN344VW3FbeXMHZUa
         O3sMM68gVtHyCzedl2v5Ahvdf1jf94Jtu1ubq6bGu/92H/FMkAQjhzlDLw1uVvmZx+kY
         88C7wPpevkWp9McszcJu0Z4MzjEFaWHUFQ1YJFEuKhkAqpVbbK9AhRWeqOuTjwzUrTn8
         KHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791186204; x=1791791004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2zW2XYrhteEZp+tMcr1cImJ9lxTvzZKtBhMT4o9kFY=;
        b=aj9nsukyLrMT9mRUC71YrAQ/S9HmB4zB4muFYi/LhU/+DS4BG6LQorrKLlG+Z6dHyz
         MejMMc6nQxvD92Lc5c+6FpdBiaUDHr4qoc8yVXao3DLlIKx7VwaqwcIJWZ2VzbpyQMbB
         sglRDZd0twKm2Vd+FmDzdEVi67QYxUv06u+W85ZpnZB6uLmONwSp8uJGNXyZfGOCjS/S
         3m3bonmbOA8iszqtgATAIEBIpYFhAFPfcUBw8s+RiZU7XDtWsEYFabu/CpvXQidN13Z0
         y362PvRG0/m6QYToeCdvZfwkDGu9gKQVsg08bAIHufnUXFG3J8D+qDf4Hu5upGzeee9D
         vxwg==
X-Forwarded-Encrypted: i=1; AKwUvBzp+YVdhgTZZNpu9btePlrnwtpJHOTJg2PN/bSyzBQMVA1XKpbONoRSC/+IQNRZgcwqAgVUVGqRGSqXyp32sBQ5@lists.infradead.org
X-Gm-Message-State: AFuF++n0uO143fOhT4f9o0CGwEPO4gsSp14EvCEIcEvPBcEhCpMbdmPX
	L5fFTtTfbKC/Hj4TpdLXtPx9KDY7ltqv/g7kxlx7Ho3p+YDaWqN/79f7yQXxn2T6eNiIe9wnU4B
	79OliqdwXYVmUlNCP2T+YMDKgWL59clKyBX5e2P8fd+9CDjWbz3Iqtu++dujRgOeRFkzXkSuHAh
	NNVQ==
X-Gm-Gg: AYBFou1ISS7nGEJ5uYRagtiMrIQU2kz1g2zxHEfvYV1eVmHtvWOT49zQ5jY5MpFz5la
	cEWPDzxZs/Kx4eCHmTD75vzxNs2hLxmpN98wHYnesSszY7G0Hw1DAQ3giaxA1STGlh86QgzCdfn
	f9jG7vJnSodf1hr2k1U7/J+abxlsew7afxJQ7/bVV3Jy9KlOWLuknqaq5X380Zr8/ZddFuecKQi
	/7B1+idEmVMadoYX76/X7hSFY7WVjjK/rVnVIu0N7hr6Yj5g4FPcYDv8pGWViYQeLSTg4bB1r3V
	PN/6I9DyxVqsZSUz+4o3YJN0O4EDM/N27KHhI2UbeeylluS/lpsZUnpMFMzN6kphCZc/APhsGWn
	rhs6gTT+V4BHn7w==
X-Received: by 2002:a05:620a:1727:b0:93e:5fff:db01 with SMTP id af79cd13be357-93e5fffdf99mr824217685a.6.1791186203462;
        Mon, 05 Oct 2026 00:43:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:93e:5fff:db01 with SMTP id af79cd13be357-93e5fffdf99mr824214385a.6.1791186202794;
        Mon, 05 Oct 2026 00:43:22 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622bb172sm3783113f8f.42.2026.10.05.00.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:43:21 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:43:20 +0200
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
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: introduce XDP rx multi-buff
 support
Message-ID: <asNVGOmmQMitsvGe@lore-desk>
References: <20261004-stmmac-rx-mb-v3-0-50fa171af9ec@oss.qualcomm.com>
 <179114695065.1402591.17659606391395950626@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9uROaV1TaSjXnGB1"
Content-Disposition: inline
In-Reply-To: <179114695065.1402591.17659606391395950626@kernel.org>
X-Proofpoint-ORIG-GUID: Y_RQcz4JME3y8BA8OAiumrj5V84e5tu1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzMCBTYWx0ZWRfX1KP7S5BSkdJe
 ZDk1iNFAUXiBNiKG+TC4SZMnCM6Xi7Hu4vGZ+DXlkXb1Y1+a70Q3zoFcJPielcR0Ly/qd/UEHFr
 YfJ1YAtTN5U3kQkQV62hUMxhDZ2j7DI=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac3551c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=Zqq8r-utnCB5I3cg7E0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Y_RQcz4JME3y8BA8OAiumrj5V84e5tu1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzMCBTYWx0ZWRfX6hT5B8y4egEn
 bYWF9bqcOvOlkbgxDurN8ZhV9Z6AR1YfhziUeIKl+lYi1qj2hi5O+aI+mh2LwTO7dot7LvBow/6
 EOzWION781Q02RZBGswxT3cexo8vFK9fCfhGPKWzXCDrdIEAUDJn4L98D/Qv8NTTTpaNGVXuH0J
 2aj7DMqwH+qkCrJX7OoYYKGfgZVZJK6y2D47tWxOWwGmwfZtmtEpdV0LA2SmCrA2GWYUbLsPhSW
 9/e3sB7Hmy/jJ5X1demFCnUTG9nX7fBZkGNiQ6rRIqzKxKnNx4wS0178v2t9Xd1WOou+kJ5wznS
 WlOJYKg9xOUdgmTsktl/qBxc1NoC7IS4b25A9clNlgxMSXpeZJlPIKDmhDaVJUrYdPvHClqEEWp
 3lEnYgm9eHIsvGAHs3RqZtlVJ/x0t6MIuFabgwBF2fJM1eLmlH4wplVCVy76mDFGQW+uQ4ffAAP
 QWdy6TDmnLRSnlajP4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_004326_348411_DC16BA0A 
X-CRM114-Status: GOOD (  23.89  )
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

--9uROaV1TaSjXnGB1
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

The issue was spotted during code development.

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

--9uROaV1TaSjXnGB1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasNVGAAKCRA6cBh0uS2t
rJ5sAQDtfUGPnyWCkz+pj7JZxhjd1ga4M4qD7JZHsy7lZp0O1AEAtt0ccBSxDqoo
94s3FWJnuvbD7dd+a1MlgpW/uuYGGww=
=Sts9
-----END PGP SIGNATURE-----

--9uROaV1TaSjXnGB1--

