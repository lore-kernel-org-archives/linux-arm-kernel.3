Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD36FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 05:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayR9Y4fp2fQzI98FxqHZ7jwPWhydQOB4f/Xl2vybRtA=; b=LQG60/6NpRO0etxFneP5erBPq0
	N/60ZMZwuAUnoapSvMtILh6UbkwIxDA4KtImThk0/VGUAu4h052gtaLTEOpVgRoqlomQEoJEOK5rB
	sqmtsI0eFbX+jhe7hGTfUOCzg1Atc3Mg8dOyg6pgP4kQwlf9Uc8GJZ2VhgIx0Lebf/+48zV2XS8cx
	o6+FwzJADja9mEgYw198LNOMzOaum1SaGoOxnuM96z2yt8XYO+HR/Da43N0tmRyd7dU+uXtApxGau
	X7vAQCPHW+0ZzK0z5203DGWYM+Z9Pt6Y33qsTWWYF/WZ++OyT49omqG6cuENSJcDZU5eWqg0dHLik
	1SprT7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueovv-00000006YqV-3O26;
	Thu, 24 Jul 2025 05:55:59 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueotS-00000006Yf7-10zP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 05:53:29 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250724055319epoutp0204773d22b4a1398fc2aa8d5194ec4adb~VGipnaB9O2528225282epoutp02P
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 05:53:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250724055319epoutp0204773d22b4a1398fc2aa8d5194ec4adb~VGipnaB9O2528225282epoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753336399;
	bh=ayR9Y4fp2fQzI98FxqHZ7jwPWhydQOB4f/Xl2vybRtA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=DU4uHM4wtJyq4f8bZZ5P9ix6oq6/Sp0lNOyIxbBa/y3j+/OhmG6XaY6hHilpH6Dz1
	 Dv5ea9JL+o5FL7LGBbJbZCRuB1BqyDWhB2R3htDv7HoLCJOXFRPW6/r/S/ENUNbXdu
	 eK0n1aN9Em5+hX2X+nge8BsVAioiwUfXPqQsbGko=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250724055319epcas5p26b747c2e27aea1b2c75dd2c3db41e51b~VGipYvUeQ1149711497epcas5p2F;
	Thu, 24 Jul 2025 05:53:19 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bngCf0PWGz6B9mB; Thu, 24 Jul
	2025 05:53:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250724055317epcas5p169284738fc5866d729b93d7200aedbc1~VGin-GWJw1902819028epcas5p1E;
	Thu, 24 Jul 2025 05:53:17 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250724055316epsmtip17afc9426154f08c2ff817c14c315c7df~VGim7j1Fu3061730617epsmtip1B;
	Thu, 24 Jul 2025 05:53:16 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250714055440.3138135-2-sw617.shin@samsung.com>
Subject: RE: [PATCH v3 RESEND 1/5] watchdog: s3c2410_wdt: Replace hardcoded
 values with macro definitions
Date: Thu, 24 Jul 2025 11:23:15 +0530
Message-ID: <2b5c01dbfc5f$40a8f970$c1faec50$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIEaJ+ioIR5Yp9zWAA/UcLZjjUhMgHo0cAqAj/2Yo2zzqazIA==
X-CMS-MailID: 20250724055317epcas5p169284738fc5866d729b93d7200aedbc1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9@epcas2p1.samsung.com>
	<20250714055440.3138135-2-sw617.shin@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_225326_774737_3D20C919 
X-CRM114-Status: GOOD (  10.95  )
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
> Subject: =5BPATCH v3 RESEND 1/5=5D watchdog: s3c2410_wdt: Replace hardcod=
ed
> values with macro definitions
>=20
> Modify the code to utilize macro-defined values instead of hardcoded valu=
es.
> The value 0x100 in the s3c2410wdt_set_heartbeat function represents
> S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its
> meaning difficult to understand and reducing code readability.
>=20
> Signed-off-by: Sangwook Shin <sw617.shin=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>


