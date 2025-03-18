Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA42C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 09:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1StXSRSMkeOQQJsmj1C0eudJiXT7wKXSaOlmhcJowtc=; b=PJNGYaSkvM9D32hhTqOvXOTLfg
	uvtx42jluz8VY9cTcKFeOPGeW1YzEsH9fKeEs5LseXXZRxpvTDLPrOhZerDyQkJflrX9sxYT0ERwy
	Glo+wQd3mxt5zBzTclCPkCbyFfLFV8QfEQYcus2yBg0TAHsloy9G2wTe1Knm4duOB8GCXF1EeDgc9
	wovvQ81GadsaG2507TBl4tmVNJzvBC4Nmu3YeghGZlE4h5c4tB0TIh+b4VKAXHXN+xZqmBbyeEQNV
	bK+8Gts1NLSLJ2pnRn5VYfatAD0dBkUwgQXQzoIO0gc5joQzAd5Y4paxuzNb7iiVauKV5azFU26Ps
	y56yRMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTEM-00000005Jbm-0RXY;
	Tue, 18 Mar 2025 09:27:26 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTCf-00000005JNz-0M7H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 09:25:43 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250318092535epoutp023bf8c8ee890829ec8195718a82bd8adb~t23clGEYc2929129291epoutp02i
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:25:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250318092535epoutp023bf8c8ee890829ec8195718a82bd8adb~t23clGEYc2929129291epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1742289935;
	bh=1StXSRSMkeOQQJsmj1C0eudJiXT7wKXSaOlmhcJowtc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=LKJEaokejmbKBuA3CcmW4dStMaWEEJgX1YNkbdB8gU8Irs0V+Z9Nxp3Qnpq8d5oza
	 Ilx17JGmPSKqMiu3DDWdRiqN85wNMsDm1Lcf1GtDGG40N5H/H8zwhgzRMYI6sZ9De8
	 DxrQBO3iF0do1qm+OJlFbav4jNyJmLukLpOwA7NI=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20250318092535epcas2p27b385e97dfcd27e1faefa33898013c4c~t23cQ6pw31410714107epcas2p2h;
	Tue, 18 Mar 2025 09:25:35 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.88]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4ZH5zf6rFzz4x9Q1; Tue, 18 Mar
	2025 09:25:34 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	40.DA.22094.E0C39D76; Tue, 18 Mar 2025 18:25:34 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250318092534epcas2p47ad924a460ba57696bb993686a534a0f~t23baJoay1336213362epcas2p4G;
	Tue, 18 Mar 2025 09:25:34 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250318092534epsmtrp22d88c7873a56fd6c60c64d2103215c28~t23bZeI6k1396413964epsmtrp2H;
	Tue, 18 Mar 2025 09:25:34 +0000 (GMT)
X-AuditID: b6c32a48-e72eb7000000564e-a1-67d93c0e25e6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CF.75.18949.E0C39D76; Tue, 18 Mar 2025 18:25:34 +0900 (KST)
Received: from KORCO180836 (unknown [12.36.150.245]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250318092534epsmtip1be7a60dc4f2fe02c3d48480105c7b14e~t23bLjdwH2041320413epsmtip1D;
	Tue, 18 Mar 2025 09:25:34 +0000 (GMT)
From: <sw617.shin@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <alim.akhtar@samsung.com>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, "'Kyunghwan	Seo'" <khwan.seo@samsung.com>
In-Reply-To: <81ce5a24-70b4-4dc7-af1c-3a193c5033e8@kernel.org>
Subject: RE: [PATCH v2] watchdog: s3c2410_wdt: Fix PMU register bits for
 ExynosAutoV920 SoC
Date: Tue, 18 Mar 2025 18:25:34 +0900
Message-ID: <001e01db97e7$b3780b30$1a682190$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG67P3IPb+lR6iHsR4BOPQv+XcanAE12wemAZEiIRgBot3M3QJZ7to8AU8euc6zeVzuwA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmmS6fzc10g6/zDC0ezNvGZjG//RKj
	xfnzG9gtNj2+xmpxedccNosZ5/cxWdxYt4/d4snCM0wWj1/+Y3bg9Ni0qpPNY+WaNawem5fU
	e+z83sDu0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5
	ibmptkouPgG6bpk5QEcpKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgrMC/SKE3OL
	S/PS9fJSS6wMDQyMTIEKE7IzFnceYS54wVFxcfpK5gbGmexdjBwcEgImEk/ecnYxcnEICexg
	lPjcdZ4FwvnEKHF49WtGCOcbo8SOn4+AHE6wjqYzq9lAbCGBvYwS3T1ZEEUvGSWuTJnNDpJg
	E5CTWNrfxgJiiwhUSbTNOsgGUsQscIBR4s/iWWDdnAJ2Ete/dzCD2MICsRLHj19kArFZBFQl
	9k9aC9bMK2ApsWPSRkYIW1Di5MwnYHFmAXmJ7W/nMENcpCDx8+kyVohlYRKfT5xkgqgRkZjd
	2cYMslhCYC2HxKEXE6EaXCTO7r7EDmELS7w6vgXKlpL4/G4vGyRg8iVOPRGG6G1glHjX/J4N
	osZeYtGZn+DAYxbQlFi/Sx+iXFniyC2o0/gkOg7/hQYvr0RHmxBEo4pEx8/NrDCLjp55wD6B
	UWkWksdmIXlsFpIHZiHsWsDIsopRLLWgODc9tdiowAQe18n5uZsYwclVy2MH4+y3H/QOMTJx
	MB5ilOBgVhLhdX9yPV2INyWxsiq1KD++qDQntfgQoykwqCcyS4km5wPTe15JvKGJpYGJmZmh
	uZGpgbmSOG/1jpZ0IYH0xJLU7NTUgtQimD4mDk6pBia9Oa7vKv9LtxQLns7cwseku0OvLCzk
	xZO33rZC15eU/4qXrXtw4MfLwhOuKVfOG7emyz1e2ubf8K4lv31S04c9Tj7/VuiIsT7bEzAl
	86V08cOkty/m2k2dOn+C4mzfJzF6YuZ8HNpME6ST9vmt/6Q6ITFlu2C0fbSfsejyuN03FW5P
	47W/Y7ZVfptT+7y/PR5NCxY3ee8Ua76/eEtsatmnNVOcjOc/693t2HDzpsfFJOPf7ZyvJW6d
	dfMKX+tZusLjdgDHT6uyDy4X/11NSLvjqGhw5ivfIRHt++lLNOxSS556zpU1qFouNm+ziFq0
	XFrrq8V/yhjbmVMv/bLj6Wev9q9rD3qV5uJwhvuBkxJLcUaioRZzUXEiAG6TLHc3BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsWy7bCSnC6fzc10g8OX+SwezNvGZjG//RKj
	xfnzG9gtNj2+xmpxedccNosZ5/cxWdxYt4/d4snCM0wWj1/+Y3bg9Ni0qpPNY+WaNawem5fU
	e+z83sDu0bdlFaPH501yAWxRXDYpqTmZZalF+nYJXBmLO48wF7zgqLg4fSVzA+NM9i5GTg4J
	AROJpjOr2boYuTiEBHYzSrx98Jepi5EDKCEl8e6ZJUSNsMT9liOsEDXPGSWuv3vGBJJgE5CT
	WNrfxgJiiwjUSay+fJMRpIhZ4AijxNoHU9ghOi4xSTx/vRqsg1PATuL69w5mEFtYIFri+JQr
	YHEWAVWJ/ZPWgk3iFbCU2DFpIyOELShxcuYTsDizgLbE05tPoWx5ie1v5zBDnKcg8fPpMlaI
	K8IkPp84yQRRIyIxu7ONeQKj8Cwko2YhGTULyahZSFoWMLKsYpRMLSjOTc8tNiwwykst1ytO
	zC0uzUvXS87P3cQIjjYtrR2Me1Z90DvEyMTBeIhRgoNZSYTX/cn1dCHelMTKqtSi/Pii0pzU
	4kOM0hwsSuK83173pggJpCeWpGanphakFsFkmTg4pRqYtA4I6i9Zt3Fl8p9vrkVKsqKFCwU/
	TC36O0fwwmXxux4FGZyXJQoPLt3r2pcbOY+nL0Igs6k6oMxrZlSXSenz4rO+nre9tzsv/lZX
	P/3Fyf1lM8V2+RnvS1iYpSR6ruJogoJP2r349uX1YrEppxz5qiVi9uScYTZr8Er8+U/2sM8M
	8zOWizv2+2WU+T2//u2L3Y/XW+Z5rX29/ecCW54l27+8+9qvyRZ0YLl2bufBhgfqD12n6zgq
	SK3N2lx4ZGfar53Hr67IqXOa92HZtqdHNdarbbrxPWfR7OxfpX8fHDhqlP3sht7G+JXs++ru
	HY0P+nGxU8DYKjRD/IiVy5yXKxedMj0gxqeZdlZGadpVASWW4oxEQy3mouJEAD2CxI0lAwAA
X-CMS-MailID: 20250318092534epcas2p47ad924a460ba57696bb993686a534a0f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250318005143epcas2p40ebb1954bed8890aaf8d0a641f710423
References: <9c94a771-b3e6-4ba4-9b7f-dcd93b53f924@kernel.org>
	<CGME20250318005143epcas2p40ebb1954bed8890aaf8d0a641f710423@epcas2p4.samsung.com>
	<20250318004411.695786-1-sw617.shin@samsung.com>
	<658c00e2-e8ef-4997-bb91-9620e97bafae@kernel.org>
	<000001db97e0$f2ef9e60$d8cedb20$@samsung.com>
	<81ce5a24-70b4-4dc7-af1c-3a193c5033e8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_022541_756290_9F08A322 
X-CRM114-Status: GOOD (  21.15  )
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

Hello Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Tuesday, March 18, 2025 5:57 PM
> To: sw617.shin@samsung.com; alim.akhtar@samsung.com; wim@linux-
> watchdog.org; linux@roeck-us.net
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-
> kernel@vger.kernel.org; 'Kyunghwan Seo' <khwan.seo@samsung.com>
> Subject: Re: [PATCH v2] watchdog: s3c2410_wdt: Fix PMU register bits for
> ExynosAutoV920 SoC
> 
> On 18/03/2025 09:37, sw617.shin@samsung.com wrote:
> >> Why do you send patches which were applied?
> >>
> >> Best regards,
> >> Krzysztof
> >
> > I can't see this patch in -next yet.
> > Could you please advise me where it is? Then, I will check again.
> > If there are any missing parts that I need to handle on my end, please
> > let me know.
> I don't think you tried enough.
> 
> Best regards,
> Krzysztof

You're definitely right.
I found it with my colleague's help.
I was monitoring wrong ones.
Thanks for notice and sorry for making you uncomfortable.
Thank you.


