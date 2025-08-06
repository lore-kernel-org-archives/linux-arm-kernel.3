Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81A6C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 07:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=Vjz8oWdZc5/ymEPuFGcDwtJQ2WD6c0Qv4Cx8RnrFpVY=; b=onFN8zmGYDMjoRDemuMB7C0j+Q
	CJRhJelnhXFACy84xw7jh5vm0WOn32Hu6s+l4BuMor1SSXPvCQ+J8Y2G7BaqA0qYRIK5XctRku5pg
	EAV2y3blZ/991d6ZAKwloYiZjMc8G/xrvjQs66tNUakwoLxzLjNlsZ+xVt+2ZU2V3GVjvukmIKffG
	ZwVOV8TRKxviOJoUFhBZsxCG1oWMwUpWZgamiEX2MVAVj5rnTdiWae2L6LHNUecSJTekIC3DTSdft
	EUYHcH6C8+te0QyE3see+NVbhuDYu0AGZ+h1q5EomH6477qeEavSws8S4xMtDc9pf0ImK2O3eKjOy
	2igbCnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYPy-0000000EUk5-3unQ;
	Wed, 06 Aug 2025 07:18:35 +0000
Received: from [203.254.224.34] (helo=mailout4.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujY8e-0000000ESZI-466l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 07:00:46 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250806070031epoutp04ef3361ffb57042d83f2322b9ce214f9a~ZG2Ck5juj2384623846epoutp04Z
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 Aug 2025 07:00:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250806070031epoutp04ef3361ffb57042d83f2322b9ce214f9a~ZG2Ck5juj2384623846epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754463631;
	bh=Vjz8oWdZc5/ymEPuFGcDwtJQ2WD6c0Qv4Cx8RnrFpVY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Um4s4hL1j+xTRmGFUMrCdMItLKXPVYActD8B13OaF6qRs31zZ5xG3YW8P4qxcmtwJ
	 dxuBNDYIQwdUuaDGhFqwWOROXYMwgo1jJShousXPYhUXkgV34bGlDycoYu1NPJZFJ/
	 kUyKIicmSijtk/plTfqHmCyeV2t33rN+iHCAnqZg=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250806070031epcas2p475e68bca23c7e30d16f11b01aa495009~ZG2CJLkJg2311523115epcas2p4S;
	Wed,  6 Aug 2025 07:00:31 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.99]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bxh5B2yP6z2SSKZ; Wed,  6 Aug
	2025 07:00:30 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250806070029epcas2p18a80cf9215e331012e0ed4890cdae700~ZG2AsvPPN3143031430epcas2p1U;
	Wed,  6 Aug 2025 07:00:29 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250806070029epsmtip2f4934ba8b8bde9cb0018a76809e0e8bd~ZG2Aow3U-2292322923epsmtip24;
	Wed,  6 Aug 2025 07:00:29 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v5 0/5] Increase max timeout value of s3c2410 watchdog
Date: Wed,  6 Aug 2025 15:55:09 +0900
Message-Id: <20250806065514.3688485-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250806070029epcas2p18a80cf9215e331012e0ed4890cdae700
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250806070029epcas2p18a80cf9215e331012e0ed4890cdae700
References: <CGME20250806070029epcas2p18a80cf9215e331012e0ed4890cdae700@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_000041_331012_BA1F7F13 
X-CRM114-Status: GOOD (  10.77  )
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

V4->V5:
  - Update s3c2410wdt_max_timeout with Sam Protsenko and Guenter Roeck's sugestion.
  - Break [v4 3/4] into two [v5 3/5] and [v5 4/5].
  - Rename S3C2410_WTCNT_MAXCNT to S3C2410_WTCNT_MAXCNT_16.
  - Rename QUIRK_HAS_32BIT_MAXCNT to QUIRK_HAS_32BIT_CNT.
  - Minor Typographical Errors and Style Adjustments.
  - Link to v4:
    https://lore.kernel.org/linux-watchdog/20250724080854.3866566-1-sw617.shin@samsung.com/

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

Sangwook Shin (5):
  watchdog: s3c2410_wdt: Replace hardcoded values with macro definitions
  watchdog: s3c2410_wdt: Fix max_timeout being calculated larger
  watchdog: s3c2410_wdt: Increase max timeout value of watchdog
  watchdog: s3c2410_wdt: exynosautov920: Enable QUIRK_HAS_32BIT_CNT
  watchdog: s3c2410_wdt: exynosautov9: Enable supported features

 drivers/watchdog/s3c2410_wdt.c | 45 ++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 13 deletions(-)

-- 
2.25.1


