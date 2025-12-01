Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF11CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 01:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsphNECWH6FlY+/fe8I5Dr8EOrnC9119goArJKPN7Mg=; b=c0BSr8XTpntsQvIfOUwOpyKQLD
	BYZzG8ujon7PwjZgMwP8YH2qhdJ5Hu621jVxCNMHTqnyjyKoEtlzFoaDiYtXFZ2R/pE/a+aR+RJVp
	ELD60qwp3LKFCqxJDK1aotcNAEelCzkEXJaA3WBZ66THd+qDmpg/9EayIo5lV067MW2bczXsXkjpj
	5z6xA51UDoaUx2GxzVT1oLFMgVivM9McFU4cYFBxoEsp/PapGoH4ziWeWPX+8YmYvT8g8X/FnE6Y6
	gs173nTnTb2awMukL63UAnTzIZmmn24v+ZoiMtzC2L/qogDggMbWnjM2PY8wMiwCujQr3WE9Tp3mx
	l21NiObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPssT-00000002lg6-2HSy;
	Mon, 01 Dec 2025 01:38:57 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPssP-00000002lfS-2uTK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 01:38:57 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251201013844epoutp03742a1ef1e97e467aac1c4ff4f0800784~887fJe0tV0229302293epoutp03g
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Dec 2025 01:38:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251201013844epoutp03742a1ef1e97e467aac1c4ff4f0800784~887fJe0tV0229302293epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764553124;
	bh=EsphNECWH6FlY+/fe8I5Dr8EOrnC9119goArJKPN7Mg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CPZfh8IxcqENs97fdEl013f3S5nszJhFabG63EbOh6ZrvHK4Nb+Evqh4rY+ZmpQuc
	 QWuEZWCdQl4tF3huMtqgMCPqxAomKYgrvDKBpodQ6OJoCNcWhgbP8J+xGRYo96Hqk9
	 wTgHf/Yx7/0t+DmBjpuaVbAKdm/lKYN8hPH6gD/k=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20251201013843epcas2p2944a9c960745b2537458a3359803b97a~887ee830e2497924979epcas2p2p;
	Mon,  1 Dec 2025 01:38:43 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.206]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dKRPv3wjpz6B9m7; Mon,  1 Dec
	2025 01:38:43 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20251201013842epcas2p358dd69f1ccf89e6641f18de7aa36c405~887dgwr212919429194epcas2p3d;
	Mon,  1 Dec 2025 01:38:42 +0000 (GMT)
Received: from KORCO115296 (unknown [12.80.207.128]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251201013842epsmtip156a337ee8ce3fd5c1b4ac983debd2da6~887dYx5zk1615416154epsmtip1i;
	Mon,  1 Dec 2025 01:38:42 +0000 (GMT)
From: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Tudor Ambarus'" <tudor.ambarus@linaro.org>, "'Bartlomiej
 Zolnierkiewicz'" <bzolnier@gmail.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Rafael J . Wysocki'" <rafael@kernel.org>, "'Daniel
 Lezcano'" <daniel.lezcano@linaro.org>, "'Zhang Rui'" <rui.zhang@intel.com>,
	"'Lukasz Luba'" <lukasz.luba@arm.com>, "'Rob	Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>, "'Alim	Akhtar'"
	<alim.akhtar@samsung.com>, <youngmin.nam@samsung.com>
Cc: "'Henrik Grimler'" <henrik@grimler.se>, <linux-pm@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"'Peter	Griffin'" <peter.griffin@linaro.org>,
	=?UTF-8?Q?'Andr=C3=A9_Draszik'?= <andre.draszik@linaro.org>, "'William
 McVicker'" <willmcvicker@google.com>, <jyescas@google.com>,
	<shin.son@samsung.com>
In-Reply-To: <1704827d-f273-4360-bcd5-c18818a85034@linaro.org>
Subject: RE: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
Date: Mon, 1 Dec 2025 10:38:35 +0900
Message-ID: <01da01dc6263$39efe660$adcfb320$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Content-Language: ko
Thread-Index: AQJR08pAfg/+KuTfxFjIW+Bmb4uKqAKoesbtAuyt0KICEvKvogHXMeJ7AVgXt0UBNbSBZgGsluTSs7NOStA=
X-CMS-MailID: 20251201013842epcas2p358dd69f1ccf89e6641f18de7aa36c405
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
	<5a6a749b-b2b7-41bb-bcb4-a2342e7f4e98@linaro.org>
	<015501dc5ea5$0c7dd460$25797d20$@samsung.com>
	<401ed9b9-19a4-4a19-b397-0f353e9f0c97@linaro.org>
	<019301dc5f4a$e9aadd60$bd009820$@samsung.com>
	<1704827d-f273-4360-bcd5-c18818a85034@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_173854_074444_7E875E36 
X-CRM114-Status: GOOD (  17.33  )
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

Hello, Tudor Ambarus.

> > Yes, Do you have any plans to upstream the GS101 TMU code? From what I
> > understand,
>=20
> Yes, I'm currently working on upstreaming the GS101 TMU code. My plan is
> to do the acpm tmu helpers and then integrate the gs101 TMU support with
> what will be the new exynos TMU driver.

Ok, Understood.


> > Autov9 and exynos850 are unlikely to be upstreamed in their current for=
m.
>=20
> From what I understand from your email exchanges with Daniel, you're goin=
g
> to propose a new driver. Is my understanding correct? Do you have a
> timeline for it?
> I'll then follow with the gs101 support.

We don't have a timeline yet. Separating the driver was not our initial pla=
n,
So this work will likely be postponed to next year. When we resume it, I wi=
ll CC you.


> exynos850 has the same reg layout as eav920 and gs101 too. If Exynos9-era
> is a common terminology used inside Samsung then we should be good to go
> with
> Exynos9 prefix I think. Especially since we have a predecessor, the
> renaming tried in pinctrl. But if you're not sure about it, use just
> EXYNOS_ then.
>=20
> Cheers,
> ta

Got it. Thank you for your clarification.

Best regards,
Shin


