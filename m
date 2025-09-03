Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01134CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7brYymqqs4aIaN8Zo+JAkRMDFy6v/aAdvXLq9zLu890=; b=pyzqFKUXXpJ1kECQizfHKoMqAB
	fEetaJ/Sj1Lhl42fOCfMizrZ9dn2yjw8nOHKSNqIrg4qGBPIlT8hPoaHBH6yJZtD/5Chw0Xt1dHlq
	DhEZ0hpjVgQiJEzhC1VXCxJB4yXfx/3pB8eCwMIjG2k2YLBPdJ+Pr1yVYhydorp4XOhx0f2nMDgUH
	kKgyvcYK0G6T0jSc9lHmF0ZDQiG1T4Rm+sxs4yRxizRlQn8SAkO96LRDTYu+GF+SJMiY86RrDqAxT
	fIYtml2oFcQsmamHmfh/t51jGKZe1Ho3xijXjtr6ofKhIcA0joDGynZwVB/Zy1xkdTGQil2Gg1DeE
	Rat/40ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmqP-00000006R17-3aK9;
	Wed, 03 Sep 2025 12:44:10 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlq3-00000006FdF-3xEw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 11:39:46 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250903113936epoutp04941ea46865ae178b48a16746ee68466f~hwttUUy3y1531615316epoutp04q
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 11:39:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250903113936epoutp04941ea46865ae178b48a16746ee68466f~hwttUUy3y1531615316epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756899576;
	bh=7brYymqqs4aIaN8Zo+JAkRMDFy6v/aAdvXLq9zLu890=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=nbCnIuKd5yIhoIE+HHSRXan/tD+ViEyZ8LVorLByq27qYgcqt/txouJAuDyrJrNXG
	 d0kL19mYOXMlDG/sVQ5CNH9AJU98j2WWIIjmqzDbRKr7y1dGpCz5TC1hLBReAduiWj
	 AVjNYCduDqNeEI+Hwpuul+dQRMjYlotdFhsRu4Xs=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250903113936epcas5p2a2fc50ab07b0fd777b4bee856b31511c~hwttCSEIa0673206732epcas5p2L;
	Wed,  3 Sep 2025 11:39:36 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cH0yH46Bnz6B9m4; Wed,  3 Sep
	2025 11:39:35 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250903113935epcas5p3227334fa7684fe2170093c2851f27476~hwtrskr2T2284122841epcas5p3A;
	Wed,  3 Sep 2025 11:39:35 +0000 (GMT)
Received: from INBRO002520 (unknown [107.122.1.191]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250903113933epsmtip13e7d48e7582eba797719ac5d7c4a2873~hwtqTZwKo0781907819epsmtip1o;
	Wed,  3 Sep 2025 11:39:33 +0000 (GMT)
From: "Devang Tailor" <dev.tailor@samsung.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <alexandre.belloni@bootlin.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <faraz.ata@samsung.com>
In-Reply-To: <20250710083434.1821671-1-dev.tailor@samsung.com>
Subject: RE: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
Date: Wed, 3 Sep 2025 17:09:32 +0530
Message-ID: <000001dc1cc7$6bfee9d0$43fcbd70$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ8w0UJjWiHDR7+9bjoByRdFpd+nAMc6yo9sycffmA=
Content-Language: en-in
X-CMS-MailID: 20250903113935epcas5p3227334fa7684fe2170093c2851f27476
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf
References: <CGME20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf@epcas5p1.samsung.com>
	<20250710083434.1821671-1-dev.tailor@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_043944_629028_6A216DCC 
X-CRM114-Status: GOOD (  19.28  )
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


Hi,


> -----Original Message-----
> From: Devang Tailor <dev.tailor=40samsung.com>
> Sent: 10 July 2025 14:05
> To: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com; alexandre.belloni=40bootlin.com;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-
> rtc=40vger.kernel.org; faraz.ata=40samsung.com
> Cc: Devang Tailor <dev.tailor=40samsung.com>
> Subject: =5BPATCH v2 0/3=5D On-chip RTC support for ExynosAutov9
>=20
> Enable on-chip RTC support. The on-chip RTC of this SoC is similar to the
> previous versions of Samsung SoC. So re-use the existing RTC driver with
> applicable call-backs for initialization and IRQ handling.
> Add a separate call-back for disabling RTC since existing '.disable'
> call-backs updates additional bit not valid for RTC of ExynosAutov9.
>=20
> Setting and getting hardware clock has been tested using 'hwclock'
> and 'date' utilities.
>=20
> Alarm interrupt has been checked with incrementing interrupt count via =
=22cat
> /proc/interrupts =7C grep rtc=22 for 10sec wakeup time via =22echo +10 >
> /sys/class/rtc/rtc0/wakealarm=22
>=20
> changelog
> ---
> Changes in v2:
> - Fixed the review comment of v1 for mis-aligmnent & asymmetry bit logic.
> - link for v1 : https://lore.kernel.org/linux-rtc/20250702052426.2404256-=
1-
> dev.tailor=40samsung.com/
>=20

Reminder=21
Can you please help to identify if anything is pending in this patch series=
 ? I see all three patches are reviewed.

>=20
> Devang Tailor (3):
>   dt-bindings: rtc: s3c-rtc: add compatible for exynosautov9
>   rtc: s3c: support for exynosautov9 on-chip RTC
>   arm64: dts: exynosautov9: add RTC DT node
>=20
>  .../devicetree/bindings/rtc/s3c-rtc.yaml       =7C  1 +
>  .../boot/dts/exynos/exynosautov9-sadk.dts      =7C  4 ++++
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi   =7C 10 ++++++++++
>  drivers/rtc/rtc-s3c.c                          =7C 18 ++++++++++++++++++
>  4 files changed, 33 insertions(+)
>=20
>=20
> base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
> --
> 2.34.1



