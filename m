Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA979CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J32kqd07hFmR6eCMuZ/OyisnVfntR08V/NULDB+Qtzw=; b=IV0pUffAy9s60FcxC6yHHYjAnk
	GbYJWcsJ7ZPgQPZiZeSCYKR6XmAj39pejjlNx2C6XFGZvh6e7fEtDilScHfPK0M/ZDYMtZ6lzqFN0
	cX/fGRskDdiTjjQ3kckUS04trrNLK/DhlOpsdDK10xv1BjY25JBhMjoj5zCZ29fQ0WuMWuDn73NXC
	n88edY3AbuzXpZE3psU2ynY/S7lxDKvN0SpUNYgx6Enb19U+Fi0jPQ8n3KJr7kRm0G2/erQ93ryTt
	wwU7JoJQPpJwCEEdPKfl20NLVGqLTcz8MeQcjSiO0yWgME1zyTn38QvGGpO0KzkfAXhglpG14yMt+
	VG3QtP4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUNa-0000000BUpx-1SD6;
	Mon, 24 Nov 2025 11:05:10 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUNU-0000000BUoJ-09mi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 11:05:07 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251124110459epoutp03e8bda1835847e07df12b5d58662047a2~67I4pALP30454204542epoutp03E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 11:04:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251124110459epoutp03e8bda1835847e07df12b5d58662047a2~67I4pALP30454204542epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763982299;
	bh=J32kqd07hFmR6eCMuZ/OyisnVfntR08V/NULDB+Qtzw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=mS0Pz9Hk7zb44LWjov+0QWnVyDqaOuhmHK1+gWG7CBPxuLrMvQRL3dm6+jDRXxHHa
	 h/I44T3iGIliduswPtf0GhgQl82i8Y3Cs+3QIeH/Dnb/up/pnbxh2BPSry31pZ9bQO
	 mfxYRrTI8dE3WmDcLJpgPJE4j5/PV0Ur+l7yVt7M=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20251124110458epcas2p31e56f8e02f3934038a9fbfac7de56fa5~67I37P8K50477404774epcas2p3F;
	Mon, 24 Nov 2025 11:04:58 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.203]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dFNJV1X4Tz2SSKX; Mon, 24 Nov
	2025 11:04:58 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20251124110457epcas2p442cbe07b335d90a8b5e4c66cd02e928c~67I2noxqe0858708587epcas2p4u;
	Mon, 24 Nov 2025 11:04:57 +0000 (GMT)
Received: from KORCO115296 (unknown [12.80.207.128]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251124110457epsmtip29fb37f805b54cc32a362e2c7f1e2908d~67I2g3jBS1950019500epsmtip2R;
	Mon, 24 Nov 2025 11:04:57 +0000 (GMT)
From: =?utf-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Daniel Lezcano'" <daniel.lezcano@linaro.org>, "'Bartlomiej
 Zolnierkiewicz'" <bzolnier@gmail.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Rafael J . Wysocki'" <rafael@kernel.org>, "'Zhang Rui'"
	<rui.zhang@intel.com>, "'Lukasz	Luba'" <lukasz.luba@arm.com>, "'Rob
	Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>, "'Alim
	Akhtar'" <alim.akhtar@samsung.com>
Cc: "'Henrik Grimler'" <henrik@grimler.se>, <linux-pm@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<shin.son@samsung.com>
In-Reply-To: <ab35c20e-390c-4479-9bb1-9f5e49cba2a0@linaro.org>
Subject: RE: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
Date: Mon, 24 Nov 2025 20:04:53 +0900
Message-ID: <000001dc5d32$2b4bfb20$81e3f160$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJR08pAfg/+KuTfxFjIW+Bmb4uKqAKoesbtAuyt0KIBiaSaQQHdj7cKAduSh9uzv/aP0A==
Content-Language: ko
X-CMS-MailID: 20251124110457epcas2p442cbe07b335d90a8b5e4c66cd02e928c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237
References: <20251113064022.2701578-1-shin.son@samsung.com>
	<CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
	<20251113064022.2701578-3-shin.son@samsung.com>
	<2180a854-8ba6-4424-add2-eb34637530c1@linaro.org>
	<000001dc5d2a$0697bf10$13c73d30$@samsung.com>
	<ab35c20e-390c-4479-9bb1-9f5e49cba2a0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_030504_724482_17F85E3E 
X-CRM114-Status: UNSURE (   6.44  )
X-CRM114-Notice: Please train this message.
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

Hello, Daniel Lezcano.

> On 11/24/25 11:06, =EC=86=90=EC=8B=A0=20wrote:=0D=0A>=20=5B=20...=20=5D=
=0D=0A>=20=0D=0A>=20>=20However,=20since=20ExynosAutov920=20diverges=20sign=
ificantly=20from=20the=20existing=0D=0A>=20>=20driver,=20Would=20introducin=
g=20a=20separate=20driver=20instead=20of=20unifying=0D=0A>=20everything=20b=
e=20acceptable?=0D=0A>=20=0D=0A>=20So=20this=20driver=20is=20one=20controll=
er=20for=20multiple=20sensors=20while=20the=20others=0D=0A>=20drivers=20are=
=20one=20controller=20for=20one=20sensor,=20right=20?=0D=0A>=20=0D=0A=0D=0A=
Yes.=20As=20far=20as=20I=20understand,=20the=20previous=20Exynos=20variants=
=20used=20one=20TMU=20controller=20per=20sensor,=0D=0Awhile=20on=20ExynosAu=
toV920=20the=20hardware=20has=20multiple=20TMU=20instances=20and=20each=20i=
nstance=20contains=20multiple=20sensors.=0D=0ATherefore,=20this=20new=20aut=
omotive=20SoC=20requires=20supporting=20multiple=20sensors=20behind=20a=20s=
ingle=20TMU=20controller.=0D=0A=0D=0ABest=20regards,=0D=0AShin=0D=0A=0D=0A

