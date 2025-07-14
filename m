Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385FEC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=BJm1Eod+dAJKfRZuImiRIeCSBkJ0UHEbIO+BfLsJsvg=; b=H4xsWKRpyhgAblQb23ROa+CavE
	TMxLdq+AqjeJMLXFGlr7OzeDBxq5Hy860LQykDVvTOfnNK+MMLzluRskyoiY7uwyUs5DVJItw6mh+
	8DxABG8CyGmc6T29ZdW5vNadWkUS/hO7fnYD6RhVmRJiTv9QSdU1tP46UFncK7vr9Kz+0+ucZMKAw
	PlWwgzk6+ZbUSkemsJFIGDqVBGyGsb4iJRYschEpddhy5bUibb0HyptBmJT5dWgxz+j8lFiFTVKc0
	kBqZNMWsw6YDEQZFaRMdGGHmBlwtknR9EXw9Ic4ruxolqr1Jnf/UD701xcEEb9wE37RZhNHMqHmsS
	L4Prl83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCFq-00000001Gw4-2wY0;
	Mon, 14 Jul 2025 06:01:34 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCDN-00000001GJ1-2qbt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 05:59:05 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250714055853epoutp0358a324e78bb10a0d27d3ee6aa9ef7226~SCKp7PhZ61565615656epoutp03Q
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 05:58:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250714055853epoutp0358a324e78bb10a0d27d3ee6aa9ef7226~SCKp7PhZ61565615656epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752472733;
	bh=BJm1Eod+dAJKfRZuImiRIeCSBkJ0UHEbIO+BfLsJsvg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=jrz6P2A5v12XpIflrsME7xZc7SmpALibCr3+kU/ncpUasHRXmpbpFnhzowYAmtzF1
	 z1fOyUZUN+weX2Gi3vXm+i9F7SMkJqtI1BKLhEQ/w2vGq90t0Zv+2WUY4Fh9DRK2Fu
	 /8/9piDduIdKSoR49UsFNLon9k+ffpHxi/aJnC/U=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250714055852epcas2p25ab44199be04da7bbeffdb5d6cb1bf4c~SCKo3tNoc1866318663epcas2p2H;
	Mon, 14 Jul 2025 05:58:52 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.100]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bgWpg4J9Sz6B9mD; Mon, 14 Jul
	2025 05:58:51 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250714055850epcas2p454265f0cc65a80e80e536a4e88819e2a~SCKntcPgt1467314673epcas2p4H;
	Mon, 14 Jul 2025 05:58:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055850epsmtip1d5df253e02e7ef9da2740184fce1db22~SCKnqS9c10363003630epsmtip1l;
	Mon, 14 Jul 2025 05:58:50 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 RESEND 0/5] Increase max timeout value of s3c2410
 watchdog
Date: Mon, 14 Jul 2025 14:54:35 +0900
Message-Id: <20250714055440.3138135-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250714055850epcas2p454265f0cc65a80e80e536a4e88819e2a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055850epcas2p454265f0cc65a80e80e536a4e88819e2a
References: <CGME20250714055850epcas2p454265f0cc65a80e80e536a4e88819e2a@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_225902_832697_42999B30 
X-CRM114-Status: GOOD (  10.72  )
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

V2->V3:
  - Correct the incorrect tag information.
  - Link to v2:
    https://lore.kernel.org/linux-watchdog/20250514094220.1561378-1-sw617.shin@samsung.com/

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
2.25.1


