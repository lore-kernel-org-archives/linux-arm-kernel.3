Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A141E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 02:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQcmJvgigbK/hIJBfKzM2/sEiuFnqI5+CH0DiwWAUgE=; b=M28Ig+p1BbMx2ZFfqgiZsJ1024
	sRR14PAzj4sXj+vlsOtKFgNDR97ZD+f1WPAdTjXY+5gq7RHf3dadlA8vWMgwuSmitafr7Cj1qASAJ
	LoNeUvGPO4+c6LRg778bAJ0PsCCfJ+lpVhx8GJ+KQoVA86MwNkHgjpSOfTUBlXvotif2hllj8cgj2
	oJypLeedpjmC+ZJYwHX6GrpEMyb/SnM1biL++J//Bo2CrJe/zL1yQHt9qBdRMBitGOfE88o3/dl5t
	3DmNAeBBDRFfRKEDF85KFszRAd0EaqgJ7Bq8LR+f1gjGg7SAeFo+ol5bfEyYJCisRJYRrNOsw+ugV
	KxucpNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPY1a-000000098oN-0I2m;
	Mon, 23 Dec 2024 02:18:26 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPXzZ-000000098Rv-45Er
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 02:16:23 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241223021618epoutp04279c9c88f10e15be68dfa1be74245c6f~TrLXJQKD33124931249epoutp04U
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 02:16:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241223021618epoutp04279c9c88f10e15be68dfa1be74245c6f~TrLXJQKD33124931249epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734920178;
	bh=YQcmJvgigbK/hIJBfKzM2/sEiuFnqI5+CH0DiwWAUgE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=YlzUabXkwem9RVSNV6dKVRDxVMsou+nQUyCYVuOcxjQqyy3QtPPOefYvfC2IrfQ1a
	 xn+wKRvxft2kqKwipodoU0M0GMUS633jZAG3YLr0tM3T+ghwRJS0IJUxQhnRyMjocG
	 /88yCWJBqn0zr0OTYmg9v5KbqYOWG95qepycW5Q4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20241223021617epcas5p3af44cc8efef50bc0e33b70bea3c784d3~TrLW1CVvy0790107901epcas5p3e;
	Mon, 23 Dec 2024 02:16:17 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4YGhTW52LSz4x9QN; Mon, 23 Dec
	2024 02:16:15 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6C.2F.19933.FE7C8676; Mon, 23 Dec 2024 11:16:15 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20241223021614epcas5p1ef33f9284b52f41ba66995aa96887d17~TrLT-X6ad0385503855epcas5p1p;
	Mon, 23 Dec 2024 02:16:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241223021614epsmtrp1b4d98e5baee9eda91bc2f69af5486f77~TrLT_nEnF1803318033epsmtrp1H;
	Mon, 23 Dec 2024 02:16:14 +0000 (GMT)
X-AuditID: b6c32a4a-b87c770000004ddd-9a-6768c7ef1da3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	60.43.18729.EE7C8676; Mon, 23 Dec 2024 11:16:14 +0900 (KST)
Received: from INBRO001561 (unknown [107.122.12.6]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241223021612epsmtip27bd87ad893acbbb305281e943c1a3e56~TrLSHMa_g2025020250epsmtip2N;
	Mon, 23 Dec 2024 02:16:12 +0000 (GMT)
From: "Pankaj Dubey" <pankaj.dubey@samsung.com>
To: "'Rob Herring \(Arm\)'" <robh@kernel.org>, "'Lee Jones'"
	<lee@kernel.org>, "'Arnd Bergmann'" <arnd@arndb.de>, "'Heiko Stuebner'"
	<heiko@sntech.de>, "'Liviu Dudau'" <liviu.dudau@arm.com>, "'Sudeep Holla'"
	<sudeep.holla@arm.com>, "'Lorenzo	Pieralisi'" <lpieralisi@kernel.org>
Cc: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Will McVicker'"
	<willmcvicker@google.com>, "'John Madieu'" <john.madieu.xa@bp.renesas.com>,
	"'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20241217-syscon-fixes-v2-3-4f56d750541d@kernel.org>
Subject: RE: [PATCH v2 3/3] mfd: syscon: Allow syscon nodes without a
 "syscon" compatible
Date: Mon, 23 Dec 2024 07:46:11 +0530
Message-ID: <000301db54e0$a45912b0$ed0b3810$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEZrw4XBTjqISieS499QzyO27eqOgJo/DN3AoqOsky0TsZ5EA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNJsWRmVeSWpSXmKPExsWy7bCmuu774xnpBv2HVS3+TjrGbvH/0WtW
	izUb6yz2vt7KbrGjbSGLxabH11gtLu+aw2ZxYGk7i0XLnxYWiw0z/rFY/N+zg91i+akdLBar
	Pv1ndOD1WDNvDaPH71+TGD1WvpjN7rFgU6nHplWdbB53ru1h89i8pN5j+7V5zB6fN8kFcEZl
	22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAXa2kUJaY
	UwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAp0CtOzC0uzUvXy0stsTI0MDAyBSpMyM6Y
	sfEnY8FDoYql/28xNzBe4O9i5OSQEDCR2Hx9H2MXIxeHkMBuRonermssEM4nRomvF1+yQzjf
	GCW+H/rHAtPy72kHM0RiL6PEvgUn2SCcF4wS9/7cYwapYhPQlzj3Yx4rSEJEYDaTxO/Lk8Ec
	ZoFpTBIHty9kBaniFHCU2LroAzuILSwQLXGt9zPYDhYBVYm78yaBTeIVsJS4+38dO4QtKHFy
	5hOwGmYBbYllC18zQ9ykIPHz6TKwmSICThLbn7SzQ9SIS7w8egTsCQmBBxwSD9snsUM0uEhc
	OtXMBmELS7w6vgUqLiXxsr8NyOYAsn0klu72gAiXSGzoWQr1v73EgStzWEBKmAU0Jdbv0odY
	xSfR+/sJE0Qnr0RHmxBEtZrE9+dnoK6UkXjYvJQJwvaQ2PLxLfMERsVZSB6bheSxWUgemIWw
	bAEjyypGydSC4tz01GLTAqO81HJ4jCfn525iBKdqLa8djA8ffNA7xMjEwXiIUYKDWUmEl0cu
	NV2INyWxsiq1KD++qDQntfgQoykwtCcyS4km5wOzRV5JvKGJpYGJmZmZiaWxmaGSOO/r1rkp
	QgLpiSWp2ampBalFMH1MHJxSDUwcpzpMd91cVbHkRFT1QeMZseuaWhJ7pO6b52fp/l2R+9T0
	5aR12aoZja5nhOsMn05xMo3VaI3O3HOzxU749QZfL48nYTpzspiF++ZzyCXEyJ69Vtr+xj7p
	1tllLA/3C2o+nRey9wNLu+lL99U986YumiLwySDORuzAF38nlpnlqhoG+U+Dnufylivlrwu9
	X8Ec4Vu64oD3c5emSPbvJ985FzSwn7f/J5Qkoqp/7vvpDcZzfINVmdo7+tZvutVgIdfzTfDL
	klNx82N9pjbKG3lxfV1TcnaCn3HSucyfl1VWLZ2xeN9rBy9vpdTVnVNSMldJ2H6zvt/07Mik
	Gf4dxtNeFF094eA3lTWMU2KnkxJLcUaioRZzUXEiANnGBIdeBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsWy7bCSvO674xnpBku3aFr8nXSM3eL/o9es
	Fms21lnsfb2V3WJH20IWi02Pr7FaXN41h83iwNJ2FouWPy0sFhtm/GOx+L9nB7vF8lM7WCxW
	ffrP6MDrsWbeGkaP378mMXqsfDGb3WPBplKPTas62TzuXNvD5rF5Sb3H9mvzmD0+b5IL4Izi
	sklJzcksSy3St0vgylg66SlbwQqhigUXJzM3ME7l72Lk5JAQMJH497SDuYuRi0NIYDejxINn
	txghEjISk1evYIWwhSVW/nvODmILCTxjlHj9Mg/EZhPQlzj3Yx4rSLOIwEImiTcn5oM5zAKz
	mCS+b1nLCjH2OKPE1qbLYGM5BRwlti76ADZKWCBS4vr+U2ArWARUJe7Om8QMYvMKWErc/b+O
	HcIWlDg58wkLiM0soC3x9OZTOHvZwtfMEOcpSPx8ugxsjoiAk8T2J+3sEDXiEi+PHmGfwCg8
	C8moWUhGzUIyahaSlgWMLKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYIjVktzB+P2
	VR/0DjEycTAeYpTgYFYS4eWRS00X4k1JrKxKLcqPLyrNSS0+xCjNwaIkziv+ojdFSCA9sSQ1
	OzW1ILUIJsvEwSnVwCTtw11mbL5Y6Y5i8C1hpwfmPbt8Zk0J29+3c1pvEmOY++kpBrkLzx2f
	uv0Ax2bpasl16w6kO5xb/6Nr08xg7vDvUlYbqpd0zFnZeEOXretLUOTtf+6SzlU7O73zDqid
	vfRGZFa44sm3nDqZXZsUXLYdW/5ugtnqmMUlixXN/uqXn5v2yq3zvcqLL3eKdq1mlLnhnhKR
	kSi36PiKhQlMqRMCtq40vMV29P9lpcSaeu6ixo4ys0lBooZT1X5c4LeW9qqX1M/Il/teOeHc
	VqPjL/hyee0fGT7X2j/X2OztVldZnw2zPU0ufHwXYbDpYcKO248v8s1oFvH5dEBHzGCF5Kv1
	D9lWBvVMVWWJmXv36TUlluKMREMt5qLiRADHWEEORwMAAA==
X-CMS-MailID: 20241223021614epcas5p1ef33f9284b52f41ba66995aa96887d17
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241217181206epcas5p281ddcf5e06cf1d9a76eb101597d6980e
References: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
	<CGME20241217181206epcas5p281ddcf5e06cf1d9a76eb101597d6980e@epcas5p2.samsung.com>
	<20241217-syscon-fixes-v2-3-4f56d750541d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_181622_491560_5FB4184E 
X-CRM114-Status: GOOD (  21.50  )
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



> -----Original Message-----
> From: Rob Herring (Arm) <robh=40kernel.org>
> Sent: Tuesday, December 17, 2024 11:42 PM
> To: Lee Jones <lee=40kernel.org>; Arnd Bergmann <arnd=40arndb.de>; Pankaj
> Dubey <pankaj.dubey=40samsung.com>; Heiko Stuebner <heiko=40sntech.de>;
> Liviu Dudau <liviu.dudau=40arm.com>; Sudeep Holla <sudeep.holla=40arm.com=
>;
> Lorenzo Pieralisi <lpieralisi=40kernel.org>
> Cc: Peter Griffin <peter.griffin=40linaro.org>; Will McVicker
> <willmcvicker=40google.com>; John Madieu <john.madieu.xa=40bp.renesas.com=
>;
> Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org
> Subject: =5BPATCH v2 3/3=5D mfd: syscon: Allow syscon nodes without a =22=
syscon=22
> compatible
>=20
> of_syscon_register_regmap() was added for nodes which need a custom regma=
p
> setup. It's not really correct for those nodes to claim they are compatib=
le with
> =22syscon=22 as the default handling likely doesn't work in those cases. =
If
> device_node_get_regmap() happens to be called first, then of_syscon_regis=
ter()
> will be called and an incorrect regmap will be created (barring some othe=
r error).
> That may lead to unknown results in the worst case. In the best case,
> of_syscon_register_regmap() will fail with -EEXIST. This problem remains =
unless
> these cases drop =22syscon=22 (an ABI issue) or we exclude them using the=
ir specific
> compatible. ATM, there is only one user: =22google,gs101-pmu=22
>=20
> There are also cases of adding =22syscon=22 compatible to existing nodes =
after the
> fact in order to register the syscon. That presents a potential DT ABI pr=
oblem.
> Instead, if there's a kernel change needing a syscon for a node, then it =
should be
> possible to allow the kernel to register a syscon without a DT change. Th=
at's
> only possible by using
> of_syscon_register_regmap() currently, but in the future we may want to
> support a match list for cases which don't need a custom regmap.
>=20
> With this change, the lookup functions will succeed for any node register=
ed by
> of_syscon_register_regmap() regardless of whether the node compatible
> contains =22syscon=22.
>=20
> Signed-off-by: Rob Herring (Arm) <robh=40kernel.org>
> ---

Reviewed-by: Pankaj Dubey <pankaj.dubey=40samsung.com>

Thanks,
Pankaj Dubey


