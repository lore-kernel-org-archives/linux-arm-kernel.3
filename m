Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A104AC54754
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kI99l7mtGn0iNk2KRSiHV06bFYTxVJP1UnDWIzaZPlk=; b=XvAxRtNxeIksasgew1z8Oq19K5
	/684ca6roWNnjUd91HWCqj1+nBMZOLAJNTmUvHsUt4Gj80WAguJN7v9oV97Yr5Qz3ieVY+nAkHkum
	o7I/wTHVpS6akkctcAEB0WhparvsvjJntahrUWeIpnempu4AVsQjwVk0EgrFbRnahEgGZvIu57fha
	5C/BZ0gcw2Yx+gArp+eCeeBN6Z1GdfIJKOu16WHm4tlLh+q8KZnt6aMxG8EO7FFDxLYBiYH3C3vrC
	/626Y+IDns8SJPkbg5L9ZpHmIXXgYkB9XQ5Qycq0JzKCvINttnroMglvG9vbxaLCV7blZsfMY3FvY
	1DO+VjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTiA-0000000HTSZ-3PFL;
	Thu, 15 May 2025 08:13:02 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTYe-0000000HROO-09fA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:03:20 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250515080309epoutp04e5a549b3fa7da1a907b12c5db0eb3ca3~-pKCHZzpe2272322723epoutp04K
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 08:03:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250515080309epoutp04e5a549b3fa7da1a907b12c5db0eb3ca3~-pKCHZzpe2272322723epoutp04K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747296189;
	bh=kI99l7mtGn0iNk2KRSiHV06bFYTxVJP1UnDWIzaZPlk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gakzh3y5xGISBmh2amH1f6Pto/3sNmtZooOvr4RUsW0xcrp2Xf7gVPvxsu6yALsH8
	 0tOXaEGA3faxQDPMR0nzwW47xySRz3iMs/dEYtIMvI8QV0iZs4RyiQu+Ck07BytF7h
	 J/Nkg0+SWQoeXHZPdtx94nynsBDli4nOLD+HNuks=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250515080307epcas2p3fb15f30d7cfc984881505e4768f9aeba~-pKAWgJmN2780027800epcas2p3O;
	Thu, 15 May 2025 08:03:07 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.68]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZyjPl45wkz3hhTB; Thu, 15 May
	2025 08:03:07 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250515080307epcas2p2898fb938ccf5c9a43d3f58098982dbdd~-pJ-h66rY1485714857epcas2p2O;
	Thu, 15 May 2025 08:03:07 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250515080307epsmtrp1049858c66d76c4b541895c4a7062b8f2~-pJ-hIC8h2250622506epsmtrp1-;
	Thu, 15 May 2025 08:03:07 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-fc-68259fba9856
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	3C.77.19478.ABF95286; Thu, 15 May 2025 17:03:06 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250515080306epsmtip20d5991e9a7419b91a6608246d0dfef9d~-pJ-T4uaV1291312913epsmtip2v;
	Thu, 15 May 2025 08:03:06 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Thu, 15 May 2025 16:53:47 +0900
Message-Id: <20250515075350.3368635-3-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515075350.3368635-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSvO6u+aoZBt27rCwezNvGZnH+/AZ2
	i02Pr7FaXN41h81ixvl9TBY31u1jt3iy8AyTxYzFJ9ksHr/8x+zA6bFpVSebx8o1a1g9Ni+p
	99j5vYHdo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0SuDK27O9jL/jJWbH30l+2BsbNHF2MnBwS
	AiYS/fvfs3cxcnEICWxnlDg+4wtLFyMHUEJK4t0zS4gaYYn7LUdYIWo+MEqsONDICpJgE9CR
	mP7vNguILSIQJ3GsfTMzSBGzwE5GiZbpv5lBEsICYRK3Lq8As1kEVCWW7ZsM1sArYCux88FF
	dogN8hIzL30HszkF7CQmXtzFCGILAdUc3vOEDaJeUOLkzCdgvcxA9c1bZzNPYBSYhSQ1C0lq
	ASPTKkbR1ILi3PTc5AJDveLE3OLSvHS95PzcTYzgUNcK2sG4bP1fvUOMTByMhxglOJiVRHiv
	ZylnCPGmJFZWpRblxxeV5qQWH2KU5mBREudVzulMERJITyxJzU5NLUgtgskycXBKNTDNK62y
	DjtnEva3/WXNsnsbit6uSXE5I+zxKMJnfvWNsJLe/Q/C8uuEpbakbptbyL28yPq1zmn9qMgX
	AjcFrnzXaJdfeerdzqMM5Y9TX4bycSezqfQs8VeM4THyCdv9KdDrWcwvj8jZS1XibB/OzPdg
	yPx+asW6XQvE5P+sv1+zrbNA5+mZogYRQYHwd5f2LJ5fGi8Vodcy2fb+cplt6yo2ZbEu++ls
	ekaogKVdwn5vvG5LOueG6b2bCh49Xzf3TnfGqm3istfiQowO7NZjnhq/vkROMEC+6S7PDIUz
	m5Y+3Z0Ta9Z7xe3U5YcPPGRvOH4xiujxPez/qy74pnhLWH5H46Ka3bXR71d/P1Vs1K7EUpyR
	aKjFXFScCABlPnLY5AIAAA==
X-CMS-MailID: 20250515080307epcas2p2898fb938ccf5c9a43d3f58098982dbdd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250515080307epcas2p2898fb938ccf5c9a43d3f58098982dbdd
References: <20250515075350.3368635-1-sw617.shin@samsung.com>
	<CGME20250515080307epcas2p2898fb938ccf5c9a43d3f58098982dbdd@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_010315_130160_5629D919 
X-CRM114-Status: GOOD (  16.81  )
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
index 228f86d83663..c6166d927155 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -379,8 +379,8 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
 
-	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
-				       / S3C2410_WTCON_MAXDIV);
+	return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
+		(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
 }
 
 static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
-- 
2.40.1


