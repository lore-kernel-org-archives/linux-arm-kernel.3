Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D38EC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVyto71w61vrp7yw23DVq8t5lbwhvGzxNZd2g0nOgRU=; b=EJLmf1CaPUkIWouAIgZn9yM0dn
	jqd+cNG7RU7tPxmzpFf+sRilmXdNPxR4KUfpqoUaPUCR5W2J+nWJQ1GcXlUUhwM170W2RJ0tnfWrd
	eENf1jvOfFNKGDOv5LpTm78NSvSpFNDMJJ0vqweIEKKklCRJdinWJakHnMjDbttUMk9s0YTzb3Huw
	0X2xOufYggWPH9GZFIu+cT1ZmDeNrW/lQX+EdrWdYHWu5ENZVt3WV6o2WripEByKHLQFrS0AcG1NT
	yTgI6Zkmgu2rxBDd2eZDhEfIKpUDh4L2kx6Yvctowi4W9hspOPBa/0JafdkZKWXODLyzDDts1rmoQ
	zrMV/bGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCXf-0000000FGof-3X64;
	Wed, 14 May 2025 13:53:03 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8o0-0000000EixJ-0hjE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:53:42 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250514095337epoutp01cc6fcfb0c9761e94b8cd717ce23dc32d~-XBMCTEWM1978819788epoutp01u
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 09:53:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250514095337epoutp01cc6fcfb0c9761e94b8cd717ce23dc32d~-XBMCTEWM1978819788epoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747216417;
	bh=JVyto71w61vrp7yw23DVq8t5lbwhvGzxNZd2g0nOgRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VX06KiTs8bC5wpUDjqhVIG7sLoo03yCicEfpzWr5lqnDW2wUhBZa26DHDT0b4aASo
	 3rrXLyjCjqyQfzK9uMFvIuAl/wrza0heSAJswBlVy4IIIUl8ZguMAM59LLQIA9iJ0a
	 O+eIXtn747YPbylQ+/Q+uDa2YqciFGUK4u6WfhWE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250514095336epcas2p4f5bbf7c6386516c792c82a0073c306e9~-XBLuGcfg0187001870epcas2p4Q;
	Wed, 14 May 2025 09:53:36 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.97]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zy7vh1ZMsz3hhT7; Wed, 14 May
	2025 09:53:36 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095335epcas2p139710b146aaf4709a0a7aafcabe2f7c7~-XBKib47P3022730227epcas2p1I;
	Wed, 14 May 2025 09:53:35 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095335epsmtrp14926ba4f054b27b3fb411a1af425d0b4~-XBKetToL1996119961epsmtrp1P;
	Wed, 14 May 2025 09:53:35 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-ce-6824681f3306
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	68.55.19478.F1864286; Wed, 14 May 2025 18:53:35 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095335epsmtip18ba7a072d9f13ba0d6fb49eff0a3815c~-XBKNbQAH0078100781epsmtip1z;
	Wed, 14 May 2025 09:53:35 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH v2 1/5] watchdog: s3c2410_wdt: Replace hardcoded values with
 macro definitions
Date: Wed, 14 May 2025 18:42:16 +0900
Message-Id: <20250514094220.1561378-2-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250514094220.1561378-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSnK58hkqGwd9LIhYP5m1js5jffonR
	4vz5DewWmx5fY7W4vGsOm8WM8/uYLG6s28du8WThGSaLGYtPslk8fvmP2YHLY9OqTjaPlWvW
	sHpsXlLvsfN7A7tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZXQsbmEt+MZecfrmDsYGxsts
	XYycHBICJhJPLn9nB7GFBLYzSnw55dXFyAEUl5J498wSokRY4n7LEdYuRi6gkg+MEkdO/wDr
	ZRPQkZj+7zYLiC0iECdxrH0zM0gRs8AjRokr83qYQBLCQInpd44wg9gsAqoSW44tAmvmFbCV
	uLl6HgvEBnmJmZcgjuAUsJOY29LKBnKEEFBN03YPiHJBiZMzn4CVMwOVN2+dzTyBUWAWktQs
	JKkFjEyrGEVTC4pz03OTCwz1ihNzi0vz0vWS83M3MYIDXitoB+Oy9X/1DjEycTAeYpTgYFYS
	4b2epZwhxJuSWFmVWpQfX1Sak1p8iFGag0VJnFc5pzNFSCA9sSQ1OzW1ILUIJsvEwSnVwCR0
	33/vFJ7HE/wVzpqW8t0zKIv24056ru+1MHfvJ48HmxP4C67t6D/8SDzleUbVFcaWUIv3t89t
	nJYXc9K22ND+2tLrEw9UvPWK/75lzaTbx7qX/MxavlC2olXN72jTyu7d1/YmeAq/PXYg6+7Z
	+OfnXZaoTW/nbZzNIqBkqr/6glXubVnzwtlBy0WYffbN9alaMyMv6o+k4FqBaWnvgs+48/Wb
	ZCw0ODgrV+P0doUjm66smalhnhn7uTBE6g57S0L8qxctAuqL/KPmHGNcaLHLVMi/ZWpaiOeF
	r8XG5juiJjcf47Svupay1HxOY/oN1d5jv+4++5z9TaX05IKezNSrOwPU5u2cbMc0eWlh/Dcl
	luKMREMt5qLiRAC9p4jL5wIAAA==
X-CMS-MailID: 20250514095335epcas2p139710b146aaf4709a0a7aafcabe2f7c7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095335epcas2p139710b146aaf4709a0a7aafcabe2f7c7
References: <20250514094220.1561378-1-sw617.shin@samsung.com>
	<CGME20250514095335epcas2p139710b146aaf4709a0a7aafcabe2f7c7@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_025340_845998_18454901 
X-CRM114-Status: GOOD (  19.78  )
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

Modify the code to utilize macro-defined values instead of hardcoded
values. The value 0x100 in the s3c2410wdt_set_heartbeat function represents
S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
difficult to understand and reducing code readability.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index bdd81d8074b2..228f86d83663 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -555,7 +555,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	if (count >= 0x10000) {
 		divisor = DIV_ROUND_UP(count, 0xffff);
 
-		if (divisor > 0x100) {
+		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
 			return -EINVAL;
 		}
-- 
2.40.1


