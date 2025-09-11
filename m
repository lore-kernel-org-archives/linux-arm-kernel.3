Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB10CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEAgB8FLwolb3G6/hv5nbzV1b6/W++gnOLU+viUGvD4=; b=Cl3oApajMuBMKnsDU/CO1eKEHW
	KyuDOf9fClVVhI809xZIsEGOfdAPVOt4G4mN3+bnsrx4Vy9xlgbrfw1SpX3EjVQ5Mpw447Jcm5fyB
	VqdMw7ZA++6m0ds+xPgj3u91dRd7zaGBSTeA1giRyy3vWaQMaomog2zctCb+enJkGY3YmjBBiYfRj
	kN54B31kiWKp5U1/+aInoFXHocxMqsU/9uFWVQGuMm0mGvnRN63ftrO3IwQI/G46Py+qO+kJi5PIT
	FhOfELwN1q4bqJ5RGyDGMcj0gT5bPEfyuEfuTB6O2HIOTAVDP1ECnGQb/PrTot/wogtMYMDWxdQVr
	s4pIXiLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjnB-000000045bg-0aZm;
	Thu, 11 Sep 2025 16:05:01 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjn8-000000045Y9-3DdD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 16:05:00 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250911160452epoutp035968f4ef1ab75234b4fd542f23164388~kRfmbRYZq2549025490epoutp03B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 16:04:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250911160452epoutp035968f4ef1ab75234b4fd542f23164388~kRfmbRYZq2549025490epoutp03B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757606692;
	bh=NEAgB8FLwolb3G6/hv5nbzV1b6/W++gnOLU+viUGvD4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CwsBBP5AzOEOjo4sCLPFLNpn33smVfHTokQwymQymR/amharumFy6+RAAvqYWY8Y1
	 laZo5OuBRIVCehSt5W72QmFOb2dZT33knAArOKwtykc45t2uD9BXztvA/Ocscov2bN
	 VdyKkN9M+yK40XPwz6nPVudhSlgbADlyGFQzt5lE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250911160451epcas5p1428a7400e31cfaf0fb49ae1bb1e281b0~kRflCwNxe0037600376epcas5p1Q;
	Thu, 11 Sep 2025 16:04:51 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cN2Sf5WKZz2SSKf; Thu, 11 Sep
	2025 16:04:50 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250911160449epcas5p4016f54ce49a5af4e50787e90b0a8572b~kRfi51XKu2011520115epcas5p4b;
	Thu, 11 Sep 2025 16:04:49 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250911160442epsmtip1d6d45c14abaa5b9aa6c8b5552c0471da~kRfcmF7XE2197521975epsmtip1p;
	Thu, 11 Sep 2025 16:04:42 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Geert Uytterhoeven'"
	<geert@linux-m68k.org>
Cc: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jesper.nilsson@axis.com>,
	<lars.persson@axis.com>, <alim.akhtar@samsung.com>, <arnd@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <geert+renesas@glider.be>,
	<thierry.bultel.yh@bp.renesas.com>, <dianders@chromium.org>,
	<robert.marko@sartura.hr>, <schnelle@linux.ibm.com>, <kkartik@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-arm-kernel@axis.com>,
	<ksk4725@coasia.com>, <kenkim@coasia.com>, <smn1196@coasia.com>,
	<pjsin865@coasia.com>, <shradha.t@samsung.com>
In-Reply-To: <8aeda67e-404e-4deb-ac90-015f2325ef64@kernel.org>
Subject: RE: [PATCH 3/3] tty: serial: samsung: Remove unused artpec-8
 specific code
Date: Thu, 11 Sep 2025 21:34:40 +0530
Message-ID: <000101dc2335$ccd62f60$66828e20$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJu8uqH6fYxQzG+hnF7rWV1C9oliQHCvJCeAevVl18Bulx3hgI90RbxAdnEKbSzHH4+gA==
Content-Language: en-in
X-CMS-MailID: 20250911160449epcas5p4016f54ce49a5af4e50787e90b0a8572b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250911141714epcas5p29f591a1d645c9c69dc5b7d2c2d12af50
References: <CGME20250911141714epcas5p29f591a1d645c9c69dc5b7d2c2d12af50@epcas5p2.samsung.com>
	<20250911141605.13034-1-ravi.patel@samsung.com>
	<20250911141605.13034-4-ravi.patel@samsung.com>
	<CAMuHMdVe-FULHWk3QCBENG7TsbEZyxj0N5shhESxWBWd49JmOw@mail.gmail.com>
	<6df0e227-896b-438a-913e-95b637aa2b14@kernel.org>
	<8aeda67e-404e-4deb-ac90-015f2325ef64@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_090459_121755_4CEB405F 
X-CRM114-Status: GOOD (  21.40  )
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
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 11 September 2025 20:05
...
> Subject: Re: =5BPATCH 3/3=5D tty: serial: samsung: Remove unused artpec-8=
 specific code
>=20
> On 11/09/2025 16:29, Krzysztof Kozlowski wrote:
> >>> --- a/drivers/tty/serial/samsung_tty.c
> >>> +++ b/drivers/tty/serial/samsung_tty.c
> >>
> >>> =40=40 -2655,8 +2621,6 =40=40 static const struct of_device_id s3c24x=
x_uart_dt_match=5B=5D =3D =7B
> >>>                 .data =3D S5L_SERIAL_DRV_DATA =7D,
> >>>         =7B .compatible =3D =22samsung,exynos850-uart=22,
> >>>                 .data =3D EXYNOS850_SERIAL_DRV_DATA =7D,
> >>> -       =7B .compatible =3D =22axis,artpec8-uart=22,
> >>> -               .data =3D ARTPEC8_SERIAL_DRV_DATA =7D,
> >>>         =7B .compatible =3D =22google,gs101-uart=22,
> >>>                 .data =3D GS101_SERIAL_DRV_DATA =7D,
> >>>         =7B .compatible =3D =22samsung,exynos8895-uart=22,
> >>> =40=40 -2828,8 +2792,6 =40=40 OF_EARLYCON_DECLARE(s5pv210, =22samsung=
,s5pv210-uart=22,
> >>>                         s5pv210_early_console_setup);
> >>>  OF_EARLYCON_DECLARE(exynos4210, =22samsung,exynos4210-uart=22,
> >>>                         s5pv210_early_console_setup);
> >>> -OF_EARLYCON_DECLARE(artpec8, =22axis,artpec8-uart=22,
> >>> -                       s5pv210_early_console_setup);
> >>>
> >>>  static int __init gs101_early_console_setup(struct earlycon_device *=
device,
> >>>                                             const char *opt)
> >>
> >> Removing these breaks backwards-compatibility with existing DTBs,
> >> which lack the new =22samsung,exynos8895-uart=22 fallback compatible v=
alue.
> >
> > This was just applied, so ABI break would be fine. It should be however
> > clearly expressed in the commit msg.
> >
> > I have a feeling that not much testing was happening in Samsung around
> > this patchset and only now - after I applied it - some things happen.
> > But it is damn too late, my tree is already closed which means this is
> > going to be the ABI.
>=20
> Ah, no, I mixed up patches with recent DTS for Artpec-8. This serial ABI
> was accepted three years ago (=21=21=21), so you are Geert absolutely rig=
ht -
> that's ABI break.

Thank you for your review.

The DTS patches for ARTPEC-8 is added recently (https://lore.kernel.org/lin=
ux-samsung-soc/20250901051926.59970-1-ravi.patel=40samsung.com/)
Before that, there was no user (in DT) of =22axis,artpec8-uart=22 compatibl=
e.
So I am not convinced of ABI break (considering patch =231 and =232 goes fi=
rst with review comment fixes)

My intension here is to optimize the driver code (by removing kind of dupli=
cated code)
And also preparation of upcoming ARTPEC-9 patch series where ARTPEC-9 uart =
is
exactly same as ARTPEC-8.

Please let me know if I misunderstood anything here.

Thanks,
Ravi

>=20
> Folks in Samsung, maybe try to organize some weekly sessions sharing
> knowledge after upstreaming reviews/feedbacks? I feel like you are
> repeating same mistakes.
>=20
> Best regards,
> Krzysztof


