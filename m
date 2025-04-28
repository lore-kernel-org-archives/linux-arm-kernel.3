Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1FDC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njfnSw/OzgCfnpUUUvsiz+VFYsSHIIORU2SrxBPlyTA=; b=zkWLlR0o8Ls/c+FR9hdArO7ZZ3
	lFsEJjF3Ft3Ed1/ROLyyCzivywknrPwwjtVBaTNsVG3At6r8EWK+UxhAmj30Fkp07QUhFJSGLzQXe
	97BQnRFFyVEuv47nYofLGzCwNELzE4ZIIWTbwEyejdlMRwRHauH2XmQ+eAB8DqWcgYdI9Sb41EHOQ
	pCBoQih1eGzPqrmJZM2AB1hbdGl1+QQuF9oj0VqdwQSJSJJN58e5RTvWaPDnMK81cjAoWJFEL48yz
	V15uBBgdz+UxAj4PjNOf/olSoy70eWIXsIDXRcQRDeqjSm6EgJA2XqZx//jr524mYHhukiqT2e9wt
	VTx2vzmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9O7b-00000006J4S-00Nd;
	Mon, 28 Apr 2025 13:02:07 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NPY-000000068qT-0lfY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:16:38 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250428121630epoutp02aed9e199ec34030b8173dabd91c46f6d~6epX8HUJi3116531165epoutp02K
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 12:16:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250428121630epoutp02aed9e199ec34030b8173dabd91c46f6d~6epX8HUJi3116531165epoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745842590;
	bh=njfnSw/OzgCfnpUUUvsiz+VFYsSHIIORU2SrxBPlyTA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=TPV3s7xavoD9UPUQ1keNySicbdEoAp2LeONRS079wIl/cO4qfDHg2UVXgUHTfngsd
	 yHaCcxGiY4N5/hprTUUgkVvgJkkbRNwHdpLdmIY207oR+i72Kbc58fi9V00lJe2NZi
	 o2B5+dvQk29OZP2+5rmetTPatbStMBG93HnuFv64=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250428121629epcas5p48af00b74bbf51523585f76a118699f36~6epXNzWit0170601706epcas5p4e;
	Mon, 28 Apr 2025 12:16:29 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.177]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZmMqv5754z2SSKX; Mon, 28 Apr
	2025 12:16:27 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250428121432epcas5p1d7f070391d0d206909dd8dc82f919396~6enqzJ6yl2814528145epcas5p1C;
	Mon, 28 Apr 2025 12:14:32 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250428121432epsmtrp2f26bd06225bf3ea60b2b7fecc29e173b~6enqwrRbW0223602236epsmtrp25;
	Mon, 28 Apr 2025 12:14:32 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-22-680f7128c330
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	98.A4.08805.8217F086; Mon, 28 Apr 2025 21:14:32 +0900 (KST)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250428121431epsmtip1f4d6f781b572e671553bd1e14f1f086d~6enpVszo91538615386epsmtip1a;
	Mon, 28 Apr 2025 12:14:31 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: "'Greg KH'" <gregkh@linuxfoundation.org>
Cc: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <alim.akhtar@samsung.com>,
	<jirislaby@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <dev.tailor@samsung.com>,
	<rosa.pila@samsung.com>
In-Reply-To: <2025042508-statute-pleading-df6f@gregkh>
Subject: RE: [PATCH v3] tty: serial: samsung_tty: support 18 uart ports
Date: Mon, 28 Apr 2025 17:44:21 +0530
Message-ID: <0ce801dbb837$19706530$4c512f90$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNDUeEKzZOD+6UL/EvMWKPcOF/PnAGTFIryAfZj8UECGlBVKgGCAc+IsLCZPcA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJTlejkD/DYM9LY4sH87axWdzbsYzd
	onnxejaLd3NlLM6f38BusenxNVaLy7vmsFnMOL+PyeLM4l52iy8/HzA7cHlsWtXJ5rF/7hp2
	j81L6j36tqxi9Pi8SS6ANYrLJiU1J7MstUjfLoEr4/Gs58wFL7gr5s1cz9TAuIKzi5GTQ0LA
	RGL3x2dMILaQwG5GifVXrSHikhKHn95lhbCFJVb+e87excgFVPOcUaKreSJYgk1AU+LO56dg
	zSICOhIdZ06wgBQxC2xgkliy9g8jRMcMJokPh48yg1RxCphJfJu9B6iDg0NYwF1ixe4IkDCL
	gKrE25aHLCA2r4ClxIuDv9kgbEGJkzOfsICUMwvoSbRtZAQJMwvIS2x/O4cZ4jgFiZ9Pl7GC
	lIgI+EnceZQHUSIu8fLoEfYJjMKzkAyahTBoFpJBs5B0LGBkWcUomVpQnJueW2xYYJSXWq5X
	nJhbXJqXrpecn7uJERxjWlo7GPes+qB3iJGJg/EQowQHs5IIb5UBf4YQb0piZVVqUX58UWlO
	avEhRmkOFiVx3m+ve1OEBNITS1KzU1MLUotgskwcnFINTPPWNW3dHhOyv1P5pmhqv0aCdPOD
	EIu9or26n+dfPRq07esmDut1tyzmrPo06cKSVpsPNWdyO7a9PP/li1zetO16z03zJbRkll/3
	lt/w7OSMz+v3/l3y6qRj6Ik7LneLJ4qZGDaEvkjr9Q/uy3P5pnO2zZ295OK8hLYvK3nfvuxd
	82VPqSSzhXhQ6/I9XyPNAj/p/dml3DI/q2uVS++cFFvz8vtKK2ZvMPja2bqcT/7zXNOPGu7B
	Z+fP+2d7RuPYmaTjAe4Vik9zY4pdpnC7Nizjd+n9YX1AcXMqb+qxRi79c+mr58kavqyZZ6p+
	6Of15qSCi3X5wUm7NPf90ZE57Hwu3CN/qdSMC3qeITvnTVFiKc5INNRiLipOBACclZXeIAMA
	AA==
X-CMS-MailID: 20250428121432epcas5p1d7f070391d0d206909dd8dc82f919396
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250417042427epcas5p2df3d35803adcb24da7d83e5df586380d
References: <CGME20250417042427epcas5p2df3d35803adcb24da7d83e5df586380d@epcas5p2.samsung.com>
	<20250417043427.1205626-1-faraz.ata@samsung.com>
	<d350841c-3560-4511-a866-9490737e48f7@kernel.org>
	<06cb01dbaf5a$1ea1a8b0$5be4fa10$@samsung.com>
	<2025042508-statute-pleading-df6f@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_051636_537697_5BD82A21 
X-CRM114-Status: GOOD (  18.59  )
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

HI Greg

> Subject: Re: [PATCH v3] tty: serial: samsung_tty: support 18 uart ports
> 
> On Thu, Apr 17, 2025 at 11:02:24AM +0530, Faraz Ata wrote:
> > Hello Krzysztof
> >
> > > -----Original Message-----
> > > From: Krzysztof Kozlowski <krzk@kernel.org>
> > > Sent: Thursday, April 17, 2025 10:50 AM
> > > To: Faraz Ata <faraz.ata@samsung.com>; alim.akhtar@samsung.com;
> > > gregkh@linuxfoundation.org; jirislaby@kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> > > soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > > serial@vger.kernel.org; dev.tailor@samsung.com;
> > > rosa.pila@samsung.com
> > > Subject: Re: [PATCH v3] tty: serial: samsung_tty: support 18 uart
> > > ports
> > >
> > > On 17/04/2025 06:34, Faraz Ata wrote:
> > > > ExynosAutov920 SoC supports 18 UART ports, update the value of
> > > UART_NR
> > > > to accommodate the same.
> > > >
> > > > Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
> > > > ---
> > > > Changes in v3:
> > > > - Fixed review comments from Krzysztof
> > >
> > > Which ones? What changed?
> > >
> > While sending v2  change log was missed unintentionally.
> > Added missed change log in v3.
> 
> Can you add this properly and send a v4?
> 
This was a clarification given to Krzysztof.
The complete change-log was missed in v2, This was pointed out by Krzysztof.
Added those missed changes in v3.
Do you want me to add this clarification as well and send v4 ?

> thanks,
> 
> greg k-h


