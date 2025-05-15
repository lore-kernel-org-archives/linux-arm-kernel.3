Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02456C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=35gJfKFe+Cplq2SjrXZ8S17x/oDX+LF58z/wi/8ca+w=; b=OGZdv0IJA/JLDj9jcrV34SPvbL
	yopFwf2vQQ/zB5L2iqaCi8AiaMzt7YXvP/U/eIQ3z6eoQLMVixuB4jNBKyN2k+ORxIe68aTnnhUtR
	dX8YgQ/WKuWDPTgieWSGC3aIs9tSlLCdkG0liJyEd6+4SjW7TMbS0VFr33lMgP6ij8dCpzQNgs+pP
	rRw2jo8t1U5o0dbA5tDo981GClZKP6omcrwyjJmZZ1b/4eL70YnPC6G5imPw4PH8VXIYu66I3E56R
	l1irDr/IkPDiplJPbFEfZZFB2h0JOT1mnVRmyg5dg1TcMj0hX1pBtT5beS0pbwd5zDMEGia/Tqtqk
	W2zB0A/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTgB-0000000HSto-0YT3;
	Thu, 15 May 2025 08:10:59 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTYe-0000000HRMJ-0A9S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:03:19 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250515080305epoutp04f817ceebc59b8cbd4370ee064a27a8bd~-pJ_XT_hm2207422074epoutp04q
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 08:03:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250515080305epoutp04f817ceebc59b8cbd4370ee064a27a8bd~-pJ_XT_hm2207422074epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747296185;
	bh=35gJfKFe+Cplq2SjrXZ8S17x/oDX+LF58z/wi/8ca+w=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Ke6AX+6FvXX4em+PRyVV2VfiE+kl6zcH+sh5SkyZ8neYTUeygk8QTTUWLFz/nyDjS
	 XyNG6sI/hIBTBpZhZP1xZT5hHz2j8Oi2tgnDKQNn/v0hRY45Lj4wd+3lwVimY+ihJI
	 GOVd9J64Pk7eID5je0AlfHs9QXIOgKo4soIcXU3U=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250515080305epcas2p29f72dfaf098895c5fa564e56c0d55b75~-pJ_AZDwv0336503365epcas2p2z;
	Thu, 15 May 2025 08:03:05 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZyjPh5qCRz6B9mL; Thu, 15 May
	2025 08:03:04 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250515080303epcas2p47347b0169ae8caf3e149c57d94ca2c89~-pJ8PQuti2279222792epcas2p4g;
	Thu, 15 May 2025 08:03:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250515080303epsmtrp163eac1376ee8406670752a673fb6cc50~-pJ8Nn84I2250922509epsmtrp1Z;
	Thu, 15 May 2025 08:03:03 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-94-68259fb79fe9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C4.1E.08766.7BF95286; Thu, 15 May 2025 17:03:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250515080303epsmtip245bbc62747fe82bd4d4886b29b3977b4~-pJ8EUC2e1291312913epsmtip2i;
	Thu, 15 May 2025 08:03:03 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 0/5] Increase max timeout value of s3c2410 watchdog
Date: Thu, 15 May 2025 16:53:45 +0900
Message-Id: <20250515075350.3368635-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDLMWRmVeSWpSXmKPExsWy7bCSvO72+aoZBh0HpCwezNvGZnH+/AZ2
	i02Pr7FaXN41h81ixvl9TBY31u1jt3iy8AyTxYzFJ9ksHr/8x+zA6bFpVSebx8o1a1g9Ni+p
	99j5vYHdo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0SuDL+tdoUTOSuuDethb2BcSFnFyMnh4SA
	icTF5++Zuxi5OIQEdjNKrPqxn62LkQMoISXx7pklRI2wxP2WI6wQNR8YJTZcXMsCkmAT0JGY
	/u82mC0iECdxrH0z2CBmgZ2MEi3TfzODJIQF3CRaGl4xgtgsAqoSm6+tAWvgFbCV2H9qDjPE
	BnmJmZe+s0PEBSVOznwCVsMMFG/eOpt5AiPfLCSpWUhSCxiZVjFKphYU56bnFhsWGOallusV
	J+YWl+al6yXn525iBAewluYOxu2rPugdYmTiYDzEKMHBrCTCez1LOUOINyWxsiq1KD++qDQn
	tfgQozQHi5I4r/iL3hQhgfTEktTs1NSC1CKYLBMHp1QDk61if9/LDv8Lx0r1JzFGX+zdr/g/
	7FrctfglXw7vYn5y7uPVG1+rJSs6Cv3LMk7zeE+0m2zfbLvgSWrxXLf7Qtv4N5R//T1FUes9
	Y0mJtep1foXbbX5vFEPub9J73t1yx4yTLcTd5XySXdqrG82nHC9d3mUrKcn4aNKS3/FH7G5c
	+3fp5lHzVXf/NfdbvO46HrFq34raxStMeS8tO73SO2OhdxjftFI3yXNfuBnj9Fl/v23af+h6
	v5s9r2HcswcT30oF2b3Urj43sejvz422XiuKllh+P6W49eJ6+SThe2rLY0W5uI8vOr5567Er
	NyObjF85qmjdi3/x51RYzOtHuzSiGTiOyus+mWy1iyFf5oISS3FGoqEWc1FxIgA1cqWhzwIA
	AA==
X-CMS-MailID: 20250515080303epcas2p47347b0169ae8caf3e149c57d94ca2c89
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250515080303epcas2p47347b0169ae8caf3e149c57d94ca2c89
References: <CGME20250515080303epcas2p47347b0169ae8caf3e149c57d94ca2c89@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_010315_125489_206B4514 
X-CRM114-Status: GOOD (  12.34  )
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
2.40.1


