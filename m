Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60C0C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pbi2ramR8l7UZqKCJOrdKuItlZX/GmKvNFxVQLDc/nQ=; b=mIF2rcBCLBjfHlaNLY002PR888
	c0Sc/tSv5JA8IusIlyX1q2fdHCcdCrSjSO3HfFk1NgnFNWZxMz0rhUCfQEG82bINXMtxUDisjNLPl
	244a3yDRnqoR4fubhKfk8xHP0draw0yQIX3/Redm921EPsKdv4fuEOWLjvWQfiwKzPeOf0V8JEKuk
	qNuVRseIXV0kg89gjASQfav79aDkiwo9G/cSLUOjpCj5NjLCrY7spLWa2nM2Ajy6MpCeHQBVGshth
	nD6WcFuCNdQxPavFf4C8a8rOwRnZrB07HbBZ/2D5+K1asI+yAfayPA9obhoWpb+02UERHrom44Gw8
	TldjhaiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCN2-00000001I0Q-3WGa;
	Mon, 14 Jul 2025 06:09:00 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCDP-00000001GKP-3F01
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 05:59:06 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250714055858epoutp03698ddda9ea498c9fcc19ce408d2a2a72~SCKvN2Az01530315303epoutp03g
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 05:58:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250714055858epoutp03698ddda9ea498c9fcc19ce408d2a2a72~SCKvN2Az01530315303epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752472739;
	bh=Pbi2ramR8l7UZqKCJOrdKuItlZX/GmKvNFxVQLDc/nQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J2JO1dvEnxsmltSfd2BEwtKYDopCRx7wOpcxpHl/urO63Z+rDYaoRZL0eSFNAzClG
	 gXtb7QzZSn0hkKftKS56oMq5g9p7GSSs8g1+oBXkOPeH25oUtJAfd4/ZKxWTUaaXNh
	 0eEJz7NlfktPLhR6yTW2vPs2iFiqsw3FLUQIPeq0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250714055858epcas2p24a090b666afd311886f4e04b775007c9~SCKuyYWUf1914519145epcas2p26;
	Mon, 14 Jul 2025 05:58:58 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bgWpp1MZxz2SSKs; Mon, 14 Jul
	2025 05:58:58 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055857epcas2p18cb516424b84f972970eed1ac5726c54~SCKt5qB8F3217032170epcas2p1W;
	Mon, 14 Jul 2025 05:58:57 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055857epsmtip14b84532306385aa5f10258f158f9da0f~SCKt0fYvC0355503555epsmtip1Y;
	Mon, 14 Jul 2025 05:58:57 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 RESEND 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Mon, 14 Jul 2025 14:54:37 +0900
Message-Id: <20250714055440.3138135-3-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714055440.3138135-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250714055857epcas2p18cb516424b84f972970eed1ac5726c54
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055857epcas2p18cb516424b84f972970eed1ac5726c54
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055857epcas2p18cb516424b84f972970eed1ac5726c54@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_225904_122399_6CB87021 
X-CRM114-Status: GOOD (  15.18  )
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

Fix the issue of max_timeout being calculated larger than actual value.
The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
S3C2410_WTCON_MAXDIV is smaller than the actual value because the remainder
is discarded during the calculation process. This leads to a larger
calculated value for max_timeout compared to the actual settable value.
A ceiling operation is applied in the calculation process to resolve this.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 95f7207e390a..31f7e1ec779e 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -411,8 +411,8 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
 
-	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
-				       / S3C2410_WTCON_MAXDIV);
+	return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
+		(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
 }
 
 static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
-- 
2.25.1


