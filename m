Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FD3CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJ0C2lXXTxby71lnZlxrL1Qvaq608lZ8/YfqHwgkQmY=; b=2FxGdClyQsevrgI0TfVk6LwyJE
	9xbkeDrztjVb3qvtE9PjrMzYDpXSlxB81u9C1CmWmh067Ecj7nMNPT1K50ZkNCYl2EI4tUEfTzGwy
	TEZoCb2x21s/e/7eC28bEOACeem+GYdCjBsCwPH6lOQELosgGwdoaHsthstX/jnpozClB/ZLTyfFj
	eY3l4Zt6fUc1TQNQFXd0lVum6ph5edL+NWBfNXlNbViOewAeA4yr1gx13UC4m3u3CT5Y/vf9Mc5eR
	ZZBdqEpHCz9Q//eAWSWkPcl8O0avj0gsuOWF2+q0aMzV31NBuZu5dffDCGOhS9TNw6XD0IxL8vMRz
	IlMJR1Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8VZ-000000068sb-41nP;
	Fri, 09 Oct 2026 11:11:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8VX-000000068sG-2xft
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:11:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KHEn230899
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 11:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jJ0C2lXXTxby71lnZlxrL1Qv
	aq608lZ8/YfqHwgkQmY=; b=WUGhl/OXzYmTiOa2sAGdDjWti01L7sojaGGZvnFn
	QEXTmo+umM+EIfoKulybB6yiqRiajp4F/kJmFCZO6ZBedF6wJuEEtmXJlInbWqUy
	+dpw0d5+wGHoc6LO90UU5O0jRgJ6n5+uC6bKtHNlLO2DScxMLWdlUlgseCogXxn/
	uY2XeDeEZyXUBy4+UvGH43rWZUOJ+D38a3jkipQuQAvHKPDEK1N+9Iswh8XpAy2x
	1TTFkIbS9DntHNh+BE0g1hqiCiHKgvaIjwl1DiOtZk1AHuB3c+wVZ+27BwXAQnXd
	k5yetvaU/JCv6It+majDrLsZscUUGiZX5yHuyiev7Ds0iQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu37pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:11:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc7a6e4e1so1748261085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 04:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791544282; x=1792149082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jJ0C2lXXTxby71lnZlxrL1Qvaq608lZ8/YfqHwgkQmY=;
        b=OHal0mZmAvDVknXi4sMIVK2PihxsYsghPOkikqnuCyC7W9rug7iWtXSzjWXJ0o1fMP
         d6aAvzg4vEAJu36BtWEq8KptJMrisdTLN7y3+wYQE2llOWCv2Aflas6KCbatvDPQlG6x
         zfuawjt9sJMXEVtuN9WvkVx3Ov5kbZbfgzPwM/XvOn9eckP/n1ax5a6VRQx2cXuTD9am
         B3mn/D+LefDETtRloFY8keNpbyCbCZpp7i6VXyD/QpYCdQlkHUQMeinUf1QnXsu+2QCA
         UFwtKxL1jV7+fGAzkwnI1qvq63+DzHOZFtvUJfPlk7d32csX2AqMcH1YaWO7vlsWvtN8
         ivoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544282; x=1792149082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJ0C2lXXTxby71lnZlxrL1Qvaq608lZ8/YfqHwgkQmY=;
        b=TWoF4IHk9f7CJ59ntDSfRf5zUQWB7dbGsG6Xuab764eO/h8I91tpeJUxEYjj2AiP41
         CoPsEWWJwN9MDStg85CNXvWM/ObYg7MX264ENfNumU/+MSw1pztfG6+RsTR/O0vla+LT
         J43+O/VXPo4zkfAFfx+Zlr6yRiJrNKrGxzCaAUukqM/zLwxqB37B3xGoK4iAXqa/whkX
         SaEpBzQinVHmi5urvwqBDpSnA32f6NT1oR6hU7+T0rMxFhA9DoLdvN2HDbpD7TcG9YXF
         ISVKf3m+UizQyUM3Phzbb9TIyVnzU+95arhaKJVI/2NqOSFVPXlWyBacwGjmsd3f3kBd
         Wc5w==
X-Forwarded-Encrypted: i=1; AKwUvBz5jqYKZMX/r72CB9hlv9wGB4qGMhZbU1GQhCqvosX2Y+lmm0w2EjCMiUcSvbvxfjSOZ+WIl3LJV6ojK2mYXdoS@lists.infradead.org
X-Gm-Message-State: AFuF++khVvziIvKfsoScp93oZzQdWg+RXbvFX4CUwjlELqJfcUUFgSN5
	SYIMLC7vsA5dq7SfWN3M9ZMGjsvs+IM+tgaclcSXf3nOB2uyTRswTIsgK1FIxQelogIKXtjI6MQ
	NWdugKQr8PMEnccG8BgcBBE9RqOXiSAgiRsEM3s09vWVbERAQbWiTcjIdyI0Lq0xzSzaTw4dwCh
	K0qA==
X-Gm-Gg: AYBFou3+/jyfk6tFIjwL/p69M7eM7HCqnkYbBPSqavsO6F+58JzcnobqQGkZSVe/mgM
	MJHnEDq2rNumF4hPBhAlUUDjSLdLKOnm8Icj21HM73WPCcdSaYKO7UgPnLEoieto6SmJd638ABo
	ftLfzoVXR1iWqBW8S6Oej31NCBUg9YVvt4jSWYTbp047vyeYvwXLT9k4ZqmKFPcyA9AfXQCuhpv
	wlhS9vamogX4FMEqyxGhk2AwVagkhal4pmm42AF0OeVi3s27+QBIE54SB+Nn7O5nmQ7orBYlBdL
	s0Dh3Vk1M8VcV+oE5s8XD0iXdfPnojSQnieUsz0gMhCCZSKT0oT7GjZnZFr/91t+LOi7KWrdVLX
	PpXjKDls4IARtHg==
X-Received: by 2002:a05:620a:4503:b0:93e:985c:43b0 with SMTP id af79cd13be357-93ebd248388mr200961885a.35.1791544281929;
        Fri, 09 Oct 2026 04:11:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4503:b0:93e:985c:43b0 with SMTP id af79cd13be357-93ebd248388mr200956485a.35.1791544281341;
        Fri, 09 Oct 2026 04:11:21 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bead84esm51414655e9.13.2026.10.09.04.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:11:20 -0700 (PDT)
Date: Fri, 9 Oct 2026 13:11:19 +0200
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
Subject: Re: [PATCH net-next v5 0/3] net: stmmac: introduce XDP rx multi-buff
 support
Message-ID: <asjL1y_IlFSc5mx_@lore-desk>
References: <20261009-stmmac-rx-mb-v5-0-c38fa4eaa138@oss.qualcomm.com>
 <179154182368.2527009.383686573505818394@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iNGO0y3tjkkSqUbG"
Content-Disposition: inline
In-Reply-To: <179154182368.2527009.383686573505818394@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NCBTYWx0ZWRfX9ek0dLLlnQRy
 yISUS38+Mi5KdepQ1fHD3flqVVqO/8yJ5Um/7U1B9yeaJQwk7JRPdAct/HYhvVTExMSDgy0Xwgy
 cfUhhdTlrH9hWugbT/11cqtCmjifpDUHiTyN/LVOd3TQ2dSvYRbVOjb5NwCBws6Aee+3KqBNeH0
 KDIbXi/oxTqJ0vtWff3QBkuC7hq/+YndQu6qsaKGjm/88bI1qN8irMZdIJkS1l41mfVLeiHkW2P
 qd5cdEEWzHT5l6nUuxtH7n4SnQdMl8VcenP/jl/MZsfgDO0bf3asxBTXT8NCGmc2AdpeDJ6qY5C
 V5+hyakoDVSETNISwnT/nVqhg3FcBkHw8PeqW+rvN2D3Xi7ZtFXnmnx8hwx8vvA3DneUz4wAtmL
 crHp/uEwIH1FDbn1lebz+N/LiSq1Cg64yM1xf7KXQgURZpKj4lQGk6b+gA0/Hz4QYtNSM5d/dOG
 CyyLelz64nmqaMHhK4Q==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8cbda cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=KWmWMJlhrGjfyJj_RUYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _AB316K9QDxAAIKg6yUq0IeoHDvIgccb
X-Proofpoint-ORIG-GUID: _AB316K9QDxAAIKg6yUq0IeoHDvIgccb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NCBTYWx0ZWRfX39id3g9WqD93
 Io4mH3x9grxK125QNqQDiKckArCeTvRGVl2/lZbWC/S2UWJKfTZF7m25OhS8OXxDwNuHyvgtbKQ
 Y1sHTkNRn5qi1nljM/iz13GMZB3OqDo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_041123_889452_6F524567 
X-CRM114-Status: GOOD (  22.91  )
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

--iNGO0y3tjkkSqUbG
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

The issues were spotted during code development.

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

these are theoretical issues found during code inspection.

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested them on a Qualcomm Rb3-gen2 board.

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

--iNGO0y3tjkkSqUbG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasjL1wAKCRA6cBh0uS2t
rDZBAP41yvTFMU8+1QZM1eCpABAni8FZUvsNZWn43rp4Cy0JTwEArQJ0ZljVQcWc
ZhQ5t8p8rc1b3QXidv3jo7SQGsDLkQg=
=Q0sA
-----END PGP SIGNATURE-----

--iNGO0y3tjkkSqUbG--

