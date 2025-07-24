Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343A1C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=ohWkVViPltngJsHO7QO3hWauv6Xr0PKpOtjgZtEomck=; b=422kzIUOuKuEDzRdybWoyA1itn
	rYnwlPKVtK4+GKLCt3qrkrM8eEdYhLXpr8vaEmmSGBcP98K9HavDmbui7678g1Ofc2AR5p9MHAzN0
	JQy/pbGH4jlkQGu1QGnLZKJad0gF7CH8CdTP4HBm66Pdb33vtLWOibtBfH3u8R2hgO6gdInyU+Ahn
	i62F8CbR36UZs6agueNpwZKbetxUZshwN9F1+nxTm9pAN6Wak8z0TnSQq0W5NG1E53Nlx7djQSD6g
	J2GXBiRS9gxAEEVbebivkC1dNyEaDMTWMAFr2CxwoUZXQ7Y4T1gdwhANjBGa0MnwKnKReEH4lTOcC
	TW+AmLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uery4-00000006zW6-1TUb;
	Thu, 24 Jul 2025 09:10:25 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uer5F-00000006os1-1CVd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 08:13:49 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250724081338epoutp03827008093564553cf17dd998488cfe14~VIdKz3YDj0030000300epoutp03_
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250724081338epoutp03827008093564553cf17dd998488cfe14~VIdKz3YDj0030000300epoutp03_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753344818;
	bh=ohWkVViPltngJsHO7QO3hWauv6Xr0PKpOtjgZtEomck=;
	h=From:To:Cc:Subject:Date:References:From;
	b=rz9xmknyc0OK2vhX03gTKVUvZxG5dcoAqYFydLUyKgXBFkVR0OEKB4n2Kt7AeokXz
	 ROs7SKLu7phBUNWroumR27GD2EYw5gbPGG3OV3794Inr0g9ST2VciYibcU77VVIf6w
	 bupCI78BJbzzVd0vQ7uMZwm+8eMGzYOW3OscmQAo=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250724081338epcas2p374500980da4a71c430cf64110e52ddf6~VIdKLs-yC1011010110epcas2p3L;
	Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bnkKY2kssz3hhT7; Thu, 24 Jul
	2025 08:13:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250724081336epcas2p30ba9afd1e78d9bbb60f44d24d1cf0acb~VIdI9bMNu0887108871epcas2p3I;
	Thu, 24 Jul 2025 08:13:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250724081336epsmtip13c1b034ffc2b18f9512c58cb6a28178d~VIdI5pJXI1874118741epsmtip1J;
	Thu, 24 Jul 2025 08:13:36 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, khwan.seo@samsung.com,
	dongil01.park@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v4 0/4] Increase max timeout value of s3c2410 watchdog
Date: Thu, 24 Jul 2025 17:08:50 +0900
Message-Id: <20250724080854.3866566-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250724081336epcas2p30ba9afd1e78d9bbb60f44d24d1cf0acb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250724081336epcas2p30ba9afd1e78d9bbb60f44d24d1cf0acb
References: <CGME20250724081336epcas2p30ba9afd1e78d9bbb60f44d24d1cf0acb@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_011345_873545_46FCD050 
X-CRM114-Status: GOOD (  10.34  )
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

V3->V4:
  - Merge patches [v3 3/5] and [v3 4/5] into one so that Quirk and its consumer
    are part of the same patch.
  - Link to v3:
    https://lore.kernel.org/linux-watchdog/20250714055440.3138135-1-sw617.shin@samsung.com/
    https://lore.kernel.org/linux-watchdog/20250515075350.3368635-1-sw617.shin@samsung.com/

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

Sangwook Shin (4):
  watchdog: s3c2410_wdt: Replace hardcoded values with macro definitions
  watchdog: s3c2410_wdt: Fix max_timeout being calculated larger
  watchdog: s3c2410_wdt: Increase max timeout value of watchdog
  watchdog: s3c2410_wdt: exynosautov9: Enable supported features

 drivers/watchdog/s3c2410_wdt.c | 37 +++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 12 deletions(-)

-- 
2.25.1


