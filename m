Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6979C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 04:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7KUwKilFDHEDsfh4Yx7rczHG83ExKuciAknBf8324k=; b=oEKk+DJRZL+Mh0oULzH758GqL6
	rHusabYt5Z+InohNFJ/l6K0ie/PR81bKITLf9EAL02KL4W1kESOYkIKzxh8qdn2LrYGuxBjiXxH9r
	OysAD7aKPlRM/6VCXYOiqt3NFUQPO71CrrDAyzeWAk+2nchD4YZ8+Oy/qoTCFe2zzegDG9o6NpMc5
	szItN7ZjFEoWxOfK9ctt220F2G532EiJml6jriDpoUOPrjN0175Mxm9NMaoGytec4i1T6n2oO5GsO
	wOz5ZehQsYqSY17w5ta41g0iWLwGRlgKGYRZplZ563MgZp7DGZXRh+CXxBrdprmOTSrgwfzZze9LW
	j943g1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugyJd-00000000fiy-2HJ2;
	Wed, 30 Jul 2025 04:21:21 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugyFw-00000000fRo-0pht
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 04:17:33 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250730041728epoutp02e251ae8104cf571d407e9fa292145ab4~W7Gq738YB1018810188epoutp02J
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 04:17:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250730041728epoutp02e251ae8104cf571d407e9fa292145ab4~W7Gq738YB1018810188epoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753849048;
	bh=K7KUwKilFDHEDsfh4Yx7rczHG83ExKuciAknBf8324k=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=d6XwjYRlVRX8+/zPzCEltkpw1wDRuEboXY2tXEeVRe9DQnmtYS/SFe+LRTxwGytHB
	 WWbeiTLwRcFUMYATVJyg3EYVCe/UgdNTs5e0B7FlYbz28h4qfpaQUOewYVaYlzElA6
	 XpEF5eOSYtfEUl2QL74FIKfJRXUh1etYqBlAG+F4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250730041727epcas5p24ac1bc7bcb5343f2d896777c41cc5917~W7GqaiqPk2771727717epcas5p22;
	Wed, 30 Jul 2025 04:17:27 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bsJpG3b7tz3hhTK; Wed, 30 Jul
	2025 04:17:26 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250730041726epcas5p2ab1049be882c5eda45d384680200683f~W7GpFosuY1622716227epcas5p2n;
	Wed, 30 Jul 2025 04:17:26 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250730041724epsmtip25e8f7a35ba1e498bca2040a8730bbd42~W7Gnsd4kE0316403164epsmtip21;
	Wed, 30 Jul 2025 04:17:24 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Devang Tailor'" <dev.tailor@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alexandre.belloni@bootlin.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<faraz.ata@samsung.com>
In-Reply-To: <20250710083434.1821671-3-dev.tailor@samsung.com>
Subject: RE: [PATCH v2 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Date: Wed, 30 Jul 2025 09:47:23 +0530
Message-ID: <36d401dc0108$db031250$910936f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQMc6yo9jRPgA4nZ2IiZrgLtyBFMygKSVtdMAw5/R1KxmzSKEA==
X-CMS-MailID: 20250730041726epcas5p2ab1049be882c5eda45d384680200683f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082536epcas5p4f9dcd50ff474066562b2cbd40199d2d9@epcas5p4.samsung.com>
	<20250710083434.1821671-3-dev.tailor@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_211732_401640_814728F1 
X-CRM114-Status: GOOD (  11.20  )
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
> From: Devang Tailor <dev.tailor=40samsung.com>
> Sent: Thursday, July 10, 2025 2:05 PM
> To: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com; alexandre.belloni=40bootlin.com;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-
> rtc=40vger.kernel.org; faraz.ata=40samsung.com
> Cc: Devang Tailor <dev.tailor=40samsung.com>
> Subject: =5BPATCH v2 2/3=5D rtc: s3c: support for exynosautov9 on-chip RT=
C
>=20
> The on-chip RTC of this SoC is almost similar to the previous versions of=
 SoC.
> Hence re-use the existing driver with platform specific change to enable =
RTC.
>=20
> This has been tested with 'hwclock' & 'date' utilities
>=20
> Signed-off-by: Devang Tailor <dev.tailor=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>


