Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1203D5C0C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 04:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0J3PnL2BKaLoFuJGvyxGh17PgdmTUCfDKR9Hdls1sA=; b=HLeiOFShuQyNtIRUJMtxNEvC9q
	FnOv78F7OXlPksbvFqZ4cH7G4v7kC6IbKXVRO6UfkYz79mUf8Ax+mbnUYG4q//Zs92SIuJQxYaNY/
	2eno9Bc0HBVc7DpfUgF86sEBalUpD6NybxmhqwxxTYMio/rFa083dqNfnC+05ZFkdeJ3uuPpJ1mIG
	QTZoGokUevl+bzU7dePzj97f7MSdfR8TGQZqZxRZyuI/8JcC9LXFY0z4aFZXRn2g9yWAUPojLZYQx
	5gGZ5Uzq2LIIgr/oRMkLLX0ULi5aVxVLweH24ovB6WtOb17/jrVVvKtayFNHVhgHyw9EUR+ZAkZ2Y
	IZWtOvKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVjEE-00000006A2Z-0CcK;
	Wed, 17 Dec 2025 04:33:34 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVjE9-00000006A2B-3KVd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 04:33:32 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251217043320epoutp013c206831fd11ba8e3ef71bc484d6da3e~B5ofuCEaG0108401084epoutp01I
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 04:33:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251217043320epoutp013c206831fd11ba8e3ef71bc484d6da3e~B5ofuCEaG0108401084epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765946000;
	bh=y0J3PnL2BKaLoFuJGvyxGh17PgdmTUCfDKR9Hdls1sA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Si8KYqBcRT1XjtFJRIKLJmNTT2vCPV0FEyBJY6rbA5A0ANTBSKS5s52tt2Kd6vB9H
	 qdvK58Y85NRkVpvNtHS71KaS1a/uhh9B0/osnkh4nQZkvZHQke2mxGc0t2EvRehP3B
	 eZ+SVgnjscriQHHvs9vEYmxE86ceHwPZNRAVj7Tw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251217043319epcas5p4985f521bd57309ed404f3b9218d41b59~B5ofIagsg1310513105epcas5p4_;
	Wed, 17 Dec 2025 04:33:19 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dWLWy5d7sz2SSKX; Wed, 17 Dec
	2025 04:33:18 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251217043317epcas5p303a51a5ecae59ec994dec8d1ae7bce9d~B5odYEZVn2667326673epcas5p3T;
	Wed, 17 Dec 2025 04:33:17 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217043313epsmtip22e5d96625da110faf098ce06ffa52b64~B5oZAxP-T0687206872epsmtip2k;
	Wed, 17 Dec 2025 04:33:12 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Youngmin Nam'" <youngmin.nam@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<peter.griffin@linaro.org>, <semen.protsenko@linaro.org>,
	<ivo.ivanov.ivanov1@gmail.com>
Cc: <ryu.real@samsung.com>, <d7271.choe@samsung.com>,
	<shin.son@samsung.com>, <jaewon02.kim@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20251202093613.852109-3-youngmin.nam@samsung.com>
Subject: RE: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank entries
 on Exynos2200/7885/8890/8895
Date: Wed, 17 Dec 2025 10:03:10 +0530
Message-ID: <12a401dc6f0e$441ae1f0$cc50a5d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF3wuMlGH6lOpjjwF0q/fgc3qftgQIr5xjBAatK81O1z9vLcA==
Content-Language: en-us
X-CMS-MailID: 20251217043317epcas5p303a51a5ecae59ec994dec8d1ae7bce9d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
	<CGME20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba@epcas2p2.samsung.com>
	<20251202093613.852109-3-youngmin.nam@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_203331_028906_9EB4FBA5 
X-CRM114-Status: GOOD (  15.69  )
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

Hello Youngmin

> -----Original Message-----
> From: Youngmin Nam <youngmin.nam=40samsung.com>
> Sent: Tuesday, December 2, 2025 3:06 PM
> To: krzk=40kernel.org; s.nawrocki=40samsung.com; alim.akhtar=40samsung.co=
m;
> linus.walleij=40linaro.org; peter.griffin=40linaro.org;
> semen.protsenko=40linaro.org; ivo.ivanov.ivanov1=40gmail.com
> Cc: ryu.real=40samsung.com; d7271.choe=40samsung.com;
> shin.son=40samsung.com; jaewon02.kim=40samsung.com; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; linux-
> gpio=40vger.kernel.org; linux-kernel=40vger.kernel.org; Youngmin Nam
> <youngmin.nam=40samsung.com>
> Subject: =5BPATCH v3 2/5=5D pinctrl: samsung: fix incorrect pin-bank entr=
ies on
> Exynos2200/7885/8890/8895
>=20
> This patch corrects wrong pin bank table definitions for 4 SoCs based on =
their
> TRMs.
>=20
> Exynos2200
> - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
>   'bank_type_off' layout (.fld_width =3D =7B4,1,2,2,2,2=7D).
> - Per the SoC TRM these banks must use the 'alive' layout
>   (.fld_width =3D =7B4,1,4,4=7D).
> - Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).
>=20
> Exynos7885
> - etc0, etc1: update bank type to match the SoC TRM.
> - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.
>=20
> Exynos8890
> - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
>   a non-external interrupt bank.
> - gpi1, gpi2: update bank type to match the SoC TRM.
>   exynos8895_bank_type_off (.fld_width =3D =7B4,1,2,3,2,2=7D) ->
>   exynos5433_bank_type_off (.fld_width =3D =7B4,1,2,4,2,2=7D)
> - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
> - apply lower case style for hex numbers.
>=20
> Exynos8895
> - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
>   change EINTW -> EINTN. (The bank_type itself was correct and is kept
>   unchanged.)
> - apply lower case style for hex numbers.
>=20
> This aligns the pin-bank tables with the documented bitfield layouts and
> wakeup domains. No DT/ABI change.
>=20
> Signed-off-by: Youngmin Nam <youngmin.nam=40samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1=40gmail.com>
> Tested-by: Sam Protsenko <semen.protsenko=40linaro.org>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

Tested on Exynosautov920 SADK board

Tested-by: Alim Akhtar <alim.akhtar=40samsung.com>




