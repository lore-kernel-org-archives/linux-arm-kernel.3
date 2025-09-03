Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37BDCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBdIdnKI53kzwYZV6kySizOPUkzoS2PQD2DaHLLIqVs=; b=PDFOOk+ro7wd7aOXmYSeB69hcF
	/YPxtytEZ9jL3XGguMNC9TBW1AJMsBKtsLuW9mHo7GPV3EwJ8O9UtwQrx6Tt5xinc6uO6AJ0Q0RMs
	LZl9ddwcEAMYx97kapGNq7YoJKG4r+LyZt1NP63/4DaZ4jx1fpdmjr6Q7K1gYjq5xfjYJLeYMmVzg
	xJdES9WQY9/1vpgetTMCbqfUSpwsRcnXU/p1+fXyMqyffB+5vVlrxZL88Bhvd2QMhR/EwsyJnF+1P
	LalnKWmt756/CWwcllYQ/y8gbOrBEEpuxgu6+j77B4pL9FCnXYQRuWcEV05U7OD/p9b6vDVqjrRLe
	OWDbybJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrcC-00000007EaD-2h9r;
	Wed, 03 Sep 2025 17:49:50 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utntd-00000006ePT-3udD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:51:36 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250903135124epoutp0196841aba43ce00fc8a81887e45f7b43d~hygx-LdzY0390003900epoutp01J
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 13:51:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250903135124epoutp0196841aba43ce00fc8a81887e45f7b43d~hygx-LdzY0390003900epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756907484;
	bh=dBdIdnKI53kzwYZV6kySizOPUkzoS2PQD2DaHLLIqVs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=dpd8hw/MupKTr0qtPO77S41WAB8tiH6YV/1JhHJBPEo3/4hwDwHHPHeAglXSEuURo
	 yrsKiwkV5fuDTfYvShVDeCmIhmZwr3zd5ozvD/HAnDR2qhXqhLQzKTGYAWG8J8xYnR
	 AAPqLNsh5LFGngoS6smBXAW7X5xHYz4x7z5ER3yM=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250903135124epcas5p18fa26f5f659e6fee887eb66d26da80c4~hygxjFWjW3191731917epcas5p1g;
	Wed,  3 Sep 2025 13:51:24 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cH3tM1dWgz2SSKY; Wed,  3 Sep
	2025 13:51:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250903135122epcas5p33bc7da2841b332773bceb3535f368af2~hygwEAZGf2373223732epcas5p3U;
	Wed,  3 Sep 2025 13:51:22 +0000 (GMT)
Received: from INBRO002520 (unknown [107.122.1.191]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250903135121epsmtip12fd955463311b1f218dd2bddb5a961ad~hyguqdbwg1911719117epsmtip1h;
	Wed,  3 Sep 2025 13:51:20 +0000 (GMT)
From: "Devang Tailor" <dev.tailor@samsung.com>
To: "'Alexandre Belloni'" <alexandre.belloni@bootlin.com>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<faraz.ata@samsung.com>
In-Reply-To: <20250903122342a2996825@mail.local>
Subject: RE: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
Date: Wed, 3 Sep 2025 19:21:19 +0530
Message-ID: <001a01dc1cd9$d52c1830$7f844890$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ8w0UJjWiHDR7+9bjoByRdFpd+nAMc6yo9AXLNbhMBpryuBbMOciLw
Content-Language: en-in
X-CMS-MailID: 20250903135122epcas5p33bc7da2841b332773bceb3535f368af2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf
References: <CGME20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf@epcas5p1.samsung.com>
	<20250710083434.1821671-1-dev.tailor@samsung.com>
	<000001dc1cc7$6bfee9d0$43fcbd70$@samsung.com>
	<20250903122342a2996825@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_065134_607267_2F6E908A 
X-CRM114-Status: GOOD (  33.81  )
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


Hi Alexandre,


> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: 03 September 2025 17:54
> To: Devang Tailor <dev.tailor@samsung.com>
> Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> alim.akhtar@samsung.com; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-rtc@vger.kernel.org; faraz.ata@samsung.com
> Subject: Re: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
> 
> On 03/09/2025 17:09:32+0530, Devang Tailor wrote:
> >
> > Hi,
> >
> >
> > > -----Original Message-----
> > > From: Devang Tailor <dev.tailor@samsung.com>
> > > Sent: 10 July 2025 14:05
> > > To: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > > alim.akhtar@samsung.com; alexandre.belloni@bootlin.com;
> > > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > > linux- samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > > linux- rtc@vger.kernel.org; faraz.ata@samsung.com
> > > Cc: Devang Tailor <dev.tailor@samsung.com>
> > > Subject: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
> > >
> > > Enable on-chip RTC support. The on-chip RTC of this SoC is similar
> > > to the previous versions of Samsung SoC. So re-use the existing RTC
> > > driver with applicable call-backs for initialization and IRQ handling.
> > > Add a separate call-back for disabling RTC since existing '.disable'
> > > call-backs updates additional bit not valid for RTC of ExynosAutov9.
> > >
> > > Setting and getting hardware clock has been tested using 'hwclock'
> > > and 'date' utilities.
> > >
> > > Alarm interrupt has been checked with incrementing interrupt count
> > > via "cat /proc/interrupts | grep rtc" for 10sec wakeup time via
> > > "echo +10 > /sys/class/rtc/rtc0/wakealarm"
> > >
> > > changelog
> > > ---
> > > Changes in v2:
> > > - Fixed the review comment of v1 for mis-aligmnent & asymmetry bit
> logic.
> > > - link for v1 :
> > > https://lore.kernel.org/linux-rtc/20250702052426.2404256-1-
> > > dev.tailor@samsung.com/
> > >
> >
> > Reminder!
> > Can you please help to identify if anything is pending in this patch
series ? I
> see all three patches are reviewed.
> >
> 
> You have actions after those reviews:
> 
>
https://lore.kernel.org/all/20250711-shapeless-adorable-lobster-d2efbf@krzk-
> bin/
> 

Thanks for the pointer. I had given the explanation for that,
https://lore.kernel.org/all/188001dbf249$831afd00$8950f700$@samsung.com/
after which I didn't get any feedback.

As per my understanding I have addressed the review comment given in V1 for
[PATCH 2/3] (without ignoring any).
So I am not getting what I have missed. Would you help to point out what was
left ?

> > >
> > > Devang Tailor (3):
> > >   dt-bindings: rtc: s3c-rtc: add compatible for exynosautov9
> > >   rtc: s3c: support for exynosautov9 on-chip RTC
> > >   arm64: dts: exynosautov9: add RTC DT node
> > >
> > >  .../devicetree/bindings/rtc/s3c-rtc.yaml       |  1 +
> > >  .../boot/dts/exynos/exynosautov9-sadk.dts      |  4 ++++
> > >  arch/arm64/boot/dts/exynos/exynosautov9.dtsi   | 10 ++++++++++
> > >  drivers/rtc/rtc-s3c.c                          | 18
++++++++++++++++++
> > >  4 files changed, 33 insertions(+)
> > >
> > >
> > > base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
> > > --
> > > 2.34.1
> >
> >
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel
> engineering https://protect2.fireeye.com/v1/url?k=62b10b19-03cce365-
> 62b08056-74fe485cc33c-bc602ba9f8c455fd&q=1&e=14890047-79c7-46fe-
> 85a0-48fc7c9b3d91&u=https%3A%2F%2Fbootlin.com%2F


