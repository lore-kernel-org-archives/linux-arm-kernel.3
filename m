Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AD4C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 02:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fvB2w7pntC+re0S0bjBBtAy6pYze67QvcaIBSYlhrs=; b=HEPGOYAe7tY1PeS/KxVmjTnp5x
	WNKWpg0KVdDlGvbkVbAbBKpy6QyXIBhSEsErC8OlWfijolcrYaxAzj8qnnmKr20bD700KXzhnqrOk
	fKF+1yGAhpk1lfkhqGulP2OeJYNkdXUBRsMzm5C6AvgPk57EsSFLamSBe5zR8wXg78FLwAlOwLgdj
	e0O6adsTkBwUCC9wGPYslyo1LUPZtmtTkNZlOSblocJ8FuxXsgdp07/N9tjoB+U3bilbjvbhESPuK
	CfrCedCVTu6KCh1BSGFsJ5pBTS4uCP4vB9CwokhMPV2QmXU4Pp3aV+qNfv0tKFK5wSnqt9zJHt0Vf
	9tf7wcCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDZss-00000005J8m-3Gb5;
	Sat, 10 May 2025 02:24:14 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDZqr-00000005J21-32Zc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 02:22:11 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250510022203epoutp0322251a68c9c7094d9defbe064b5afe03~_CRx1fDRc0166401664epoutp03k
	for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 02:22:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250510022203epoutp0322251a68c9c7094d9defbe064b5afe03~_CRx1fDRc0166401664epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746843723;
	bh=6fvB2w7pntC+re0S0bjBBtAy6pYze67QvcaIBSYlhrs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=QR2qHFb/OOGP4sjNHL27gnNpR9YTG+35QpZNHIQ0jFzRAZK9aBYskzEtOe/srIkl/
	 oTLwGH+0wbtHnqRhQcBoAfWpm9DD/DA4mR+Vm+aKBvr7BesFXZSJlXjVxYyeGx5Xv+
	 fYPv0lqOMDW4y2cNIvJzVSahJ/Ln/HeG3SB9qFgQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250510022202epcas5p160136d1a90dfba1044701aef0fc4c7ca~_CRxVC3Pj0493104931epcas5p1o;
	Sat, 10 May 2025 02:22:02 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.179]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZvV4S4xm8z3hhT7; Sat, 10 May
	2025 02:22:00 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250510022159epcas5p17fc37a384a4fc1dead464127dae045cb~_CRud99EZ1388513885epcas5p1H;
	Sat, 10 May 2025 02:21:59 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250510022159epsmtrp1b414b94448e409179f62883fb5230168~_CRudQHyy0294502945epsmtrp1N;
	Sat, 10 May 2025 02:21:59 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-2e-681eb8475743
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	D5.60.19478.748BE186; Sat, 10 May 2025 11:21:59 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250510022157epsmtip1cd776d297a219c4adce69d5d2c5d912e~_CRsXlj_u1125011250epsmtip1Q;
	Sat, 10 May 2025 02:21:57 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250509132414.3752159-1-raghav.s@samsung.com>
Subject: RE: [PATCH v1] dt-bindings: clock: exynosautov920: add hsi2 clock
 definitions
Date: Sat, 10 May 2025 07:51:56 +0530
Message-ID: <044201dbc152$4ef5eb20$ece1c160$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ0HEPcZwZ4sk03/CHUakVJHxOvxwGAJMZdso5kxzA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSnK77DrkMg/d7FSzW7D3HZHH9y3NW
	i/lHzrFanD+/gd1i0+NrrBYfe+6xWlzeNYfNYsb5fUwWF0+5WnxfeYfR4v+eHewWh9+0s1r8
	u7aRxWLy8bWsFk3L1jM58Hu8v9HK7rFpVSebx+Yl9R59W1YxenzeJBfAGsVlk5Kak1mWWqRv
	l8CVcfTyasaCZTwVfw7eZWxg3MPVxcjBISFgInHsfFgXIxeHkMB2RomZDX/Zuhg5geLSEtc3
	TmCHsIUlVv57zg5R9JxRYvLmSYwgCTYBXYkdi9vYQBIiAhOZJFq+HQGrYhbYxChxbvdNNoiW
	XkaJxRcbwFo4BWwk/uy+zARiCwuESazv3M8MYrMIqErMnP4HrIZXwFLizIo3rBC2oMTJmU9Y
	QGxmAW2J3oetjDD2soWvmSHuU5D4+XQZWL2IgJXEzPtr2SFqxCVeHj3CPoFReBaSUbOQjJqF
	ZNQsJC0LGFlWMYqmFhTnpucmFxjqFSfmFpfmpesl5+duYgTHpVbQDsZl6//qHWJk4mA8xCjB
	wawkwvu8UyZDiDclsbIqtSg/vqg0J7X4EKM0B4uSOK9yTmeKkEB6YklqdmpqQWoRTJaJg1Oq
	gWllodHUcy1MV+4/9JtoLLp8ntTNCOaLvtl7xHl/iRZffsRdMmGVLmNv6BvHNxf5eLg/5LBO
	uXT3K89LEy4Bmev/Q/g94k9fcJ9+ePt8bYUU48vxyy7t3fPszlVt8Sp/KcmsraXzDB3CWWqt
	973fvnySffGkc//87rlFvywUWMTzMWf/8inL9rP2yXipLE0oeqW2Y2k698zQ5Zu6Tq8uWlua
	FVH/dOqlFW45vwp+zypot9zz971l+NMnM/n02iP8j8tlGl3n+LFwjkfXGiNFPZvyb68Dd/0P
	vf7T41dapMiJC6u6lyx5KjHX07/XUaX5uJVqxYObCRWH/B8Xrvxw+NVy/ftWP/4sP+AaLtFj
	UqKgxFKckWioxVxUnAgAPdUGQToDAAA=
X-CMS-MailID: 20250510022159epcas5p17fc37a384a4fc1dead464127dae045cb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250509131427epcas5p1fe29ea19cb7624dc828935d6ec47854b
References: <CGME20250509131427epcas5p1fe29ea19cb7624dc828935d6ec47854b@epcas5p1.samsung.com>
	<20250509132414.3752159-1-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_192210_373177_2D52D0EC 
X-CRM114-Status: GOOD (  13.93  )
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
> From: Raghav Sharma <raghav.s=40samsung.com>
> Sent: Friday, May 9, 2025 6:54 PM
> To: krzk=40kernel.org; s.nawrocki=40samsung.com; cw00.choi=40samsung.com;
> alim.akhtar=40samsung.com; mturquette=40baylibre.com; sboyd=40kernel.org;
> robh=40kernel.org; conor+dt=40kernel.org; sunyeal.hong=40samsung.com;
> shin.son=40samsung.com
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; Raghav Sharma <raghav.s=40samsung.com>
> Subject: =5BPATCH v1=5D dt-bindings: clock: exynosautov920: add hsi2 cloc=
k
> definitions
>=20
> Add device tree clock binding definitions for CMU_HSI2
>=20
> Signed-off-by: Raghav Sharma <raghav.s=40samsung.com>
> ---
>  .../clock/samsung,exynosautov920-clock.yaml   =7C 29 +++++++++++++++++--
>  .../clock/samsung,exynosautov920.h            =7C  9 ++++++
>  2 files changed, 36 insertions(+), 2 deletions(-)
>=20
Hmm, you sent three separate patches that are interdependent but did not me=
ntion their dependencies.
e.g.=20
The patch that adds the clock driver cannot be compiled without the one tha=
t adds the header file, which is part of this binding patch

Go through the below section of submitting-patches documentation
https://www.kernel.org/doc/html/latest/process/submitting-patches.html=23se=
parate-your-changes

Make sure that each patch is individually compilable (or dependencies are m=
entioned clearly) and bisectable
ask someone if you are unsure of what you are submitting.



