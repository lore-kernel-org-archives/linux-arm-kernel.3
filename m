Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A28C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vmijnahmzqgvBOY0vSFX0jDJzO9B2yPyewutBO/kKI=; b=PxNOG6CLbynYJkVSuXIvn9nzVI
	IfDb+OEfguDsR5PpUgr4FeuvNmgxB/ReLOwM8xPM5E13UM7w6qhpfIYa/nbV5mduQ/cshbWS9V3SU
	ZTqWIAKiZe0HDh3gizC4D4Psec5wlFrUwLcllu2nU06qzkwy+V7APO9Dv4e0vLGStNMyduNel0Evr
	GG/EFEcR1JcJFJFByNJQCAiJob1Bm8Jj2kEbFSwkCXnUVwHSjbKSxpyQgqYZ7+aRdOdbIPthqcApE
	yPT2/dmpejZlWdKw11dNWsQUTn9MaipHvr0M4oC6KSIuc4slzrTGxkNKFcIcWgkBcDBmoKOYjCgam
	Ml+RXbJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA38O-0000000CDLi-0heJ;
	Wed, 30 Apr 2025 08:49:40 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA33Y-0000000CCLV-1eK7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 08:44:43 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250430084434epoutp032e251b5f99fcdbd869dcbe70f6d8be23~7DC6Vq8BX0750307503epoutp03i
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 08:44:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250430084434epoutp032e251b5f99fcdbd869dcbe70f6d8be23~7DC6Vq8BX0750307503epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746002674;
	bh=+vmijnahmzqgvBOY0vSFX0jDJzO9B2yPyewutBO/kKI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=QuzRoyMy4s1E0Yxy3E2erMCKXV5XcXhfeA549uW7YETfEikXj9TF4rPygc4uUDN2M
	 jdKjuTa9/P4TT68iMq46YU9OGF0/9YYqzeYmfaGhxwcXYmWJQp2SZk4i0MTu4hseeq
	 98yY83AikXZvkAtBi5lhX4h1eIGW8J2e/Ro/ziAI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250430084433epcas2p27e1db1c7198c4324ab807ce33e41371d~7DC5gvq1W0138101381epcas2p2k;
	Wed, 30 Apr 2025 08:44:33 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.101]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZnW2T3bzzz2SSKr; Wed, 30 Apr
	2025 08:44:33 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250430084432epcas2p49ec3562a8e09555b3c1de9bd84e5fb8f~7DC4fP_el2366723667epcas2p4C;
	Wed, 30 Apr 2025 08:44:32 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250430084432epsmtrp2f9a6eeaf557de57d66e880627510c49e~7DC4eXuv51265712657epsmtrp2F;
	Wed, 30 Apr 2025 08:44:32 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-5c-6811e2f04d9d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	3E.C1.08805.0F2E1186; Wed, 30 Apr 2025 17:44:32 +0900 (KST)
Received: from KORCO115296 (unknown [12.36.150.221]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250430084432epsmtip2969e7c98e0532399bb9136e22ac75a64~7DC4R7PHd3272732727epsmtip2V;
	Wed, 30 Apr 2025 08:44:32 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Alim Akhtar'" <alim.akhtar@samsung.com>,
	"'Michael	Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Rob	Herring'" <robh@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, "'Sunyeal Hong'" <sunyeal.hong@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250430-wonderful-meticulous-groundhog-cbe6e1@kuoka>
Subject: RE: [PATCH v2 3/4] clk: samsung: exynosautov920: Fix incorrect
 CLKS_NR_CPUCL0 definition
Date: Wed, 30 Apr 2025 17:44:31 +0900
Message-ID: <04c801dbb9ac$17eb1f40$47c15dc0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQKVz8E4gWpx1pKf+PhrDO9dWLB9vQKrOtICAhAmCl4B8oDt7rISRXng
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSvO6HR4IZBitnalo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZbTt
	esBcMF+woqN5IlMD42G+LkZODgkBE4l5j9YxdjFycQgJ7GaUWDZhNhtEQkLi8IwJjBC2sMT9
	liOsEEXPGSX+LZ/GApJgEzCUWPVjOxOILSKgK7H5xnJ2kCJmgWksEm/390J1fGKUuHlrGztI
	FaeAs0T/3UZmEFtYIFHi0u7vYOtYBFQlFuxZyQpi8wpYSsz7/wjKFpQ4OfMJ2DZmAW2J3oet
	jDD2soWvmSHOU5DY/ekoK8QVbhKbWp+yQ9SISMzubGOewCg8C8moWUhGzUIyahaSlgWMLKsY
	JVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYKjUktrB+OeVR/0DjEycTAeYpTgYFYS4Z10
	SzBDiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+3170pQgLpiSWp2ampBalFMFkmDk6pBqbT59et
	kfHiZ7ZdpvE7IDlyopzKWyWVppZdYROdDe/lTduxnTk/8KzKs/c6Z+beu/Xw68mI6mdM4jHX
	Qq6fjQkT9FNeO8Euf+Lh6Rek9to5MT9+eP7qvnUiZ6yaz1hHzrZYsaOPu/UD40fHwz6bWB0+
	MW1zj+OecETB9re02lyFO3ZLXZ3vTvPSfbX6ovDGFbUr3qw6v9LIfwqL/VLFm2t2zTma8p7z
	pyibQ/h63iWzjnsGrv7tXMykOXVmWmCVyTzpWWeUfq1LLzgzLW528sSYPk7lsw/jT71rvbJw
	q6D7xym2M+cwc290EBB2yF193ca95f+qYMFqTddr26VdftbbXjY5MFPbIdWnq37Z3ovqSizF
	GYmGWsxFxYkAAiBDMjkDAAA=
X-CMS-MailID: 20250430084432epcas2p49ec3562a8e09555b3c1de9bd84e5fb8f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428113558epcas2p1f2980cbc58f71dde78a9529e2b85ac20
References: <20250428113517.426987-1-shin.son@samsung.com>
	<CGME20250428113558epcas2p1f2980cbc58f71dde78a9529e2b85ac20@epcas2p1.samsung.com>
	<20250428113517.426987-4-shin.son@samsung.com>
	<20250430-wonderful-meticulous-groundhog-cbe6e1@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_014441_058673_83BF49FC 
X-CRM114-Status: GOOD (  19.67  )
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

Hello Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski =5Bmailto:krzk=40kernel.org=5D
> Sent: Wednesday, April 30, 2025 4:26 PM
> To: Shin Son <shin.son=40samsung.com>
> Cc: Sylwester Nawrocki <s.nawrocki=40samsung.com>; Chanwoo Choi
> <cw00.choi=40samsung.com>; Alim Akhtar <alim.akhtar=40samsung.com>; Micha=
el
> Turquette <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>;=
 Rob
> Herring <robh=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>; Sunyea=
l
> Hong <sunyeal.hong=40samsung.com>; linux-samsung-soc=40vger.kernel.org; l=
inux-
> clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v2 3/4=5D clk: samsung: exynosautov920: Fix incorre=
ct
> CLKS_NR_CPUCL0 definition
>=20
> On Mon, Apr 28, 2025 at 08:35:16PM GMT, Shin Son wrote:
> > The CLKS_NR_CPUCL0 macro was incorrectly defined based on a wrong clock
> ID.
> > It mistakenly referenced CLK_DOUT_CLUSTER0_PERIPHCLK, which
> > corresponds to a cluster peripheral clock, not the last clock ID for
> CPUCL0 as intended.
> >
> > This patch corrects the definition to use CLK_DOUT_CPUCL0_NOCP + 1,
>=20
> Please do not use =22This commit/patch/change=22, but imperative mood. Se=
e
> longer explanation here:
> https://protect2.fireeye.com/v1/url?k=3D2e90faf7-4f1befd2-2e9171b8-
> 74fe485cbff6-28bf0169b8fd9187&q=3D1&e=3Ddfbde4e5-fe38-4140-aa45-
> b3362eb2dc00&u=3Dhttps%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.17.1%2Fsou=
rce
> %2FDocumentation%2Fprocess%2Fsubmitting-patches.rst%23L95
>=20
> > properly matching the last clock ID for CPUCL0 as intended.
> >
> > This error was due to confusion with the hardware diagram, and this
> > patch ensures that the number of clocks for CPUCL0 is correctly defined=
.
>=20
> Fixes: 59636ec89c2c (=22clk: samsung: exynosautov920: add cpucl0 clock
> support=22)
>=20
>=20
> And proper order - fixes are *ALWAYS* before new features.
>=20
> Best regards,
> Krzysztof

Thank you for applying my patches.
I appreciate your feedback, and I=E2=80=99ll=20make=20sure=20to=20improve=
=20those=20parts=20in=20the=20future.=0D=0A=0D=0AHave=20a=20great=20day.=0D=
=0A=0D=0ABest=20regards,=0D=0AShin=20Son.=0D=0A=0D=0A

