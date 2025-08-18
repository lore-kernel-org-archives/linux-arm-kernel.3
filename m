Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7465ACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 02:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=ueluXiD+6F0xoO+M9xYzmVHY/W8ImB599hf7Mt0Mbh4=; b=Upg0FXbYjqMmgOTFvlk/OgWOBu
	A2UNnZmOt2mOk0VobrbhYRJP1Lyd1ISFbVxt/tDjDEuPl8aB+eiI5iXlrKYURhEp4H80qkgVvvtbB
	EQNaBhJ5cuNbmfPCi7az6V38RjbJkutXi4GmhW6ZZnw3H4LP7GjpL4EU6JpjO7D8FrZYevu/5FbB7
	vMQ9gfpYSAYg6hKXLBwfrCmMFpj6F1QRmx2AvJhI7tCW/WTaAl90T0PN4wO4FDMv9l+V8vusLcWAq
	/uJ49U/hPyUu36Zp8gtt6MR2Sqv1P2iLVm/nnx13uLOqzDp2a0E9DA1HECyC6hzcWeiJr8DCQr8Gt
	/SQli9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpdE-00000006LGo-1uCX;
	Mon, 18 Aug 2025 02:29:56 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpY7-00000006Kk4-1Adr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 02:24:41 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250818022435epoutp039bf17bb76ce100090fe631286097395e~cu0iO1OcA0793807938epoutp03F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 02:24:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250818022435epoutp039bf17bb76ce100090fe631286097395e~cu0iO1OcA0793807938epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755483875;
	bh=ueluXiD+6F0xoO+M9xYzmVHY/W8ImB599hf7Mt0Mbh4=;
	h=From:To:Cc:Subject:Date:References:From;
	b=P3DLlH+Q1sP7yBw4mT4OKg0bDjUFGggPh2EOESpv5zck2SWI7LrIdEUBxU47KG+I/
	 mjAHH1RD44qOm8/UUhoLbgU84l8ltKkGbxrnC5B+y5IaxioKALZ4AefNyo055bvG2V
	 KS7Iy3CD57LshI/3eqlpEuGd8aonH+/A9MRc6+cg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818022434epcas2p411816927055f844a9fc2782503e85f38~cu0h3_Ts72945329453epcas2p4S;
	Mon, 18 Aug 2025 02:24:34 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c4xPG0PP8z6B9mH; Mon, 18 Aug
	2025 02:24:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epcas2p37fe2cdc20b32b23ee894ceb636717a53~cu0gkyZ8j0507805078epcas2p3e;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epsmtip171af2b2b971b67eb1628c28c1b3d28e9~cu0ggapY01854218542epsmtip1d;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v6 0/5] Increase max timeout value of s3c2410 watchdog
Date: Mon, 18 Aug 2025 11:18:21 +0900
Message-Id: <20250818021826.623830-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250818022433epcas2p37fe2cdc20b32b23ee894ceb636717a53
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p37fe2cdc20b32b23ee894ceb636717a53
References: <CGME20250818022433epcas2p37fe2cdc20b32b23ee894ceb636717a53@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_192439_834501_0FE241E8 
X-CRM114-Status: GOOD (  10.93  )
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

V5->V6:
  - Replace hard-coded 0x8000 with calculated value.
  - Link to v5:
    https://lore.kernel.org/linux-watchdog/20250806065514.3688485-1-sw617.shin@samsung.com/

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

 drivers/watchdog/s3c2410_wdt.c | 46 ++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 13 deletions(-)

-- 
2.25.1


