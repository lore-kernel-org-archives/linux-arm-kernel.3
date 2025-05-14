Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929B6C3ABDF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=rzfjBDdCV1bMbhaN4veuqL28+nSEvMmCnFpMP9vcanM=; b=FoBUIfX/OWtOi4RR7Cqvc43aoZ
	OwnGfNGhchDBHwBmP/NlZnUjyUXDL6PSdE3F+v3GdLMmn2NUOylTdHjT6ed4J/k2arveAf51fZnYA
	NCX0SWlq5Lh8TDS0/UN60txw4UZSFlmnACLNigtFO04AiHyIAflxrrzs6ZbF5yzFb4amf6cnLTJBT
	KYmbl4PH/4x9mABWDhdeOGksd3Z/SLcpGV0HlVWV7x1//rBQfAuq+qNuQ72hul4v7unx64nOz1/8y
	PwaFPjl1KEXX0qCxcoolJAhvrAWQHRWCTZL52MAhUiQg6phrhGn8AgR1Gr6ljBnSvKgEGRbNQA0JW
	e+88OYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCXg-0000000FGp0-1tlW;
	Wed, 14 May 2025 13:53:04 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8o0-0000000Eiwz-0hdy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:53:42 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250514095333epoutp04e832802daac479c51c9c1a2e62f87c83~-XBItL62l0360003600epoutp04E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 09:53:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250514095333epoutp04e832802daac479c51c9c1a2e62f87c83~-XBItL62l0360003600epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747216413;
	bh=rzfjBDdCV1bMbhaN4veuqL28+nSEvMmCnFpMP9vcanM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=N0Db7/Fo5XU7Fd0VgOAREVIIj/KC/Gz7Q60spdghuJ8DJ9HNc4VL1SKh73hkQjOBU
	 2YPF5/ZO1zGVCmgkYYltO0wTWL2iv7C5x3Du5V/rtRUq+scYXGijMP7dspBv+hubZL
	 MlHBnh/IIoS3DotgPKeLvl7Zk8kNjfUYoDscjpMI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250514095333epcas2p2e4f261863a747b91ce04e7400387a839~-XBIczive2406324063epcas2p2g;
	Wed, 14 May 2025 09:53:33 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.100]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4Zy7vc5CrJz2SSKm; Wed, 14 May
	2025 09:53:32 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250514095332epcas2p4ab71a73ab68e55f0e5e34cd9c4c7b483~-XBHdTRKJ3207832078epcas2p4W;
	Wed, 14 May 2025 09:53:32 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095332epsmtrp196f32a0b5e6edcf2b367aaf70c3297f4~-XBHcl-ma1996119961epsmtrp1K;
	Wed, 14 May 2025 09:53:32 +0000 (GMT)
X-AuditID: b6c32a28-46cef70000001e8a-04-6824681cc9d5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E6.C4.07818.C1864286; Wed, 14 May 2025 18:53:32 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095331epsmtip13fc246ce0f9b028881178be751c13600~-XBHO_1A23233232332epsmtip1S;
	Wed, 14 May 2025 09:53:31 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v2 0/5] Increase max timeout value of s3c2410 watchdog
Date: Wed, 14 May 2025 18:42:15 +0900
Message-Id: <20250514094220.1561378-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDLMWRmVeSWpSXmKPExsWy7bCSnK5MhkqGwZ2zHBYP5m1jszh/fgO7
	xabH11gtLu+aw2Yx4/w+Josb6/axWzxZeIbJYsbik2wWj1/+Y3bg9Ni0qpPNY+WaNawem5fU
	e+z83sDu0bdlFaPH501yAWxRXDYpqTmZZalF+nYJXBk9S04yFrzhrNj60LyBcRpHFyMnh4SA
	icSdN1vYuxi5OIQEdjNKHLrzjbmLkQMoISXx7pklRI2wxP2WI6wQNR8YJWbs/8cGkmAT0JGY
	/u82C4gtIhAncax9MzNIEbPATkaJlum/mUESwgJuEk83vmICsVkEVCWOnL8GZvMK2EosO9LH
	BLFBXmLmpe/sEHFBiZMzn4ANZQaKN2+dzTyBkW8WktQsJKkFjEyrGCVTC4pz03OTDQsM81LL
	9YoTc4tL89L1kvNzNzGCA1hLYwfju29N+ocYmTgYDzFKcDArifBez1LOEOJNSaysSi3Kjy8q
	zUktPsQozcGiJM670jAiXUggPbEkNTs1tSC1CCbLxMEp1cCUI7CbM9rVMf3F00OB5xN47lz4
	rWsYtNbmq+f3hEtP/+0PvJCy2L6KPXTZx6LeNp3T/47+vi3YEJ7y7hGfZ35J6vPG1JunTz+K
	KD/gs1q/V1XnqIzFmuN6vJv2fRJZNVv0meX0ZakCbkdv9AtLPNhR4LLzcF+r5MLkjy/P73nH
	zDbz+hHdCY+fTXa3jNx8Ud/3tL7th9LPXgcv1/wuk5nsrXTDucjwjPc+gSXbFhQVcQQukDwq
	m7Vu7x1Lg98/db9we3zrv3e48v6hnFrhdytvpTrcrNztPc/+SFh3zM2ClP0N+1ovcBidObzn
	h5P/juk7J7Wf66qtc5yxY/Yit/W676TSPkVIck+6lHw/7T77ZCWW4oxEQy3mouJEAP5kI7DP
	AgAA
X-CMS-MailID: 20250514095332epcas2p4ab71a73ab68e55f0e5e34cd9c4c7b483
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095332epcas2p4ab71a73ab68e55f0e5e34cd9c4c7b483
References: <CGME20250514095332epcas2p4ab71a73ab68e55f0e5e34cd9c4c7b483@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_025340_842630_BC3C35D7 
X-CRM114-Status: GOOD (  12.90  )
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

The ExynosAutoV9 and ExynosAutoV920 SoCs have a 32-bit counter register,
but due to code constraints, only 16-bit values could be used.
This series enables these SoCs to use the 32-bit counter.
Additionally, it addresses the issue where the ExynosAutoV9 SoC supports
the DBGACK bit but it was not set.

V1->V2:
  - Modify the max_timeout calculation considering overflow
  - Separate tha max_timeout calculation into a separate patch
  - Add max_cnt in struct s3c2410_wdt
  - Set max_cnt once in probe function
  - Add patch that uses S3C2410_WTCON_PRESCALE_MAX instead of hardcoded one
  - Remove unnecessary inner parentheses
  - Link to v1:
    https://lore.kernel.org/linux-watchdog/20250513094711.2691059-1-sw617.shin@samsung.com/

Sangwook Shin (5):
  watchdog: s3c2410_wdt: Replace hardcoded values with macro definitions
  watchdog: s3c2410_wdt: Fix max_timeout being calculated larger
  watchdog: s3c2410_wdt: Increase max timeout value of watchdog
  watchdog: s3c2410_wdt: exynosautov920: Enable QUIRK_HAS_32BIT_MAXCNT
  watchdog: s3c2410_wdt: exynosautov9: Enable supported features

 drivers/watchdog/s3c2410_wdt.c | 37 +++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 12 deletions(-)

-- 
2.40.1


