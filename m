Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA67C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 06:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNNWLX2zLaDJhWpiM9e2CQIZp31IKOkktSa/xRb2XIM=; b=WfByk6wRCJr19WrS0w9eFVba1/
	CsUVNJblOtaqZ4qAJjObfNojsyfO3z7vkWQJTUxbcLqPzhXV80M4i1cBbracRm5yU6X3dtQBisPE5
	QHZq+WdosCCwK4SlApxdMSGkq1GZrkni5/Dc7Oea15TVbtq+1gWx1nq0JzD8JP5+ca4FshYVoT5kV
	oMwEnUC9CMN4c7YxDyh9B9A2vJsjSLJpztQjMckyMBzPhXf0iWOaEU/NknIBYrARU8as3SnK0ldHl
	GVQ0xgpatmuGTFTohmx4PJaplTdt0RKHV33zwqvnGs3lGShBE1Cq37/Idx1ldt3sfaZqqFrjT6+FJ
	NuherUKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uep39-00000006ZeU-2vHQ;
	Thu, 24 Jul 2025 06:03:27 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoxq-00000006Z4J-1L1f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 05:57:59 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250724055752epoutp0325d012ce652e98438f1fc0d6cf00ad76~VGmn7XP4Z1840618406epoutp03-
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 05:57:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250724055752epoutp0325d012ce652e98438f1fc0d6cf00ad76~VGmn7XP4Z1840618406epoutp03-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753336672;
	bh=PNNWLX2zLaDJhWpiM9e2CQIZp31IKOkktSa/xRb2XIM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CKRSIVlJ//gOEd1lLCtOMtbl5FGqyuy85kYyYYLSYsa132Hw/ejREDjbCwmEMmJpc
	 jX3DJhv0aK7UUdP91ah2sXHbZjzfVNJKgZNB5F7YEgzkJSjp5pKZ0iXuSbH1MLYFRA
	 kvVkDTT+dbFDSt6muSLSGURt2jUzjqs7PfosHSMA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250724055751epcas5p417b17b4f7d64d2ea7810f1df38548aca~VGmm-hkza0591505915epcas5p4h;
	Thu, 24 Jul 2025 05:57:51 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bngJt1mqTz2SSKX; Thu, 24 Jul
	2025 05:57:50 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250724055749epcas5p2035c7876f3b871955b09d24de701194b~VGmlCT0Br2947129471epcas5p2B;
	Thu, 24 Jul 2025 05:57:49 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250724055748epsmtip26e8e1115bb4da53755857ace1f4a54f2~VGmj_Yr_G0141901419epsmtip2L;
	Thu, 24 Jul 2025 05:57:48 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250714055440.3138135-4-sw617.shin@samsung.com>
Subject: RE: [PATCH v3 RESEND 3/5] watchdog: s3c2410_wdt: Increase max
 timeout value of watchdog
Date: Thu, 24 Jul 2025 11:27:47 +0530
Message-ID: <2b5e01dbfc5f$e298d0c0$a7ca7240$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIEaJ+ioIR5Yp9zWAA/UcLZjjUhMgF6s7ZMAnq+8xuz0EHcsA==
X-CMS-MailID: 20250724055749epcas5p2035c7876f3b871955b09d24de701194b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055858epcas2p47b849c0141fdb556288333f7abe00372
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055858epcas2p47b849c0141fdb556288333f7abe00372@epcas2p4.samsung.com>
	<20250714055440.3138135-4-sw617.shin@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_225758_675966_984A790D 
X-CRM114-Status: GOOD (  12.41  )
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

Hi Sangwook

> -----Original Message-----
> From: Sangwook Shin <sw617.shin=40samsung.com>
> Sent: Monday, July 14, 2025 11:25 AM
> To: krzk=40kernel.org; alim.akhtar=40samsung.com; wim=40linux-watchdog.or=
g;
> linux=40roeck-us.net
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-
> soc=40vger.kernel.org; linux-watchdog=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; Sangwook Shin <sw617.shin=40samsung.com>
> Subject: =5BPATCH v3 RESEND 3/5=5D watchdog: s3c2410_wdt: Increase max
> timeout value of watchdog
>=20
> Increase max_timeout value from 55s to 3664647s (1017h 57min 27s) with
> 38400000 frequency system if the system has 32-bit WTCNT register.
>=20
> cat
> /sys/devices/platform/10060000.watchdog_cl0/watchdog/watchdog0/max_t
> imeout
> 3664647
>=20
> =5B    0.302473=5D s3c2410-wdt 10060000.watchdog_cl0: Heartbeat:
> count=3D1099394100000, timeout=3D3664647, freq=3D300000
> =5B    0.302479=5D s3c2410-wdt 10060000.watchdog_cl0: Heartbeat:
> timeout=3D3664647, divisor=3D256, count=3D1099394100000 (fff8feac)
> =5B    0.302510=5D s3c2410-wdt 10060000.watchdog_cl0: starting watchdog t=
imer
> =5B    0.302722=5D s3c2410-wdt 10060000.watchdog_cl0: watchdog active, re=
set
> enabled, irq disabled
>=20
> If system has 32-bit WTCNT, add QUIRK_HAS_32BIT_MAXCNT to its quirk
> flags, then it will operation with 32-bit counter. If not, with 16-bit co=
unter like
> previous.
>=20
As Krzysztof commented, please merge this patch with the next patch so that=
 Quirk and it consumer is part of the same patch.=20
Once you have done that, feel free to add
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>



