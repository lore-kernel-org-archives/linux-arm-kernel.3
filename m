Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731C8C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tkp0DQwXc1mOn4qy+xZBw8LmMOr1qvZhRe+FhWG/Q84=; b=s3mesHgdRCy1teUjsTREQVU4/j
	4lHiyW0tXw7pe430qlEYi76SlJtlNc43A/pRKZ+aDutk8YSvA24dSbuy8EAG3NNRRIbaUvEZv2f8r
	FqQhwj35fwcD822GWH2NdtDLMcew6l1reB0+zK9yxn/SfY+Sp8FanZU5tfxa8gCEBvk+hyaI7nltP
	ccK8m/YD38dlk6FtBjI6/FWnYbykF7a8HutWkuXQ+34T6klLWNTPccRyyqYfGYwPoxwWJ/q279puA
	9SLJ/xJsUPWzS90UTqxIFXwLBzayFE+hItbmvA/UC6HNpKi1bbLDsReIyo/fhU9J3QTmYsqLhdiHu
	lcbGQQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTeB-0000000HSfJ-0TE4;
	Thu, 15 May 2025 08:08:55 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTYe-0000000HRO0-09ai
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:03:18 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250515080307epoutp04cf94fb5da2ad5cc4af8c23150e10e9f5~-pJ-wFUnP2272122721epoutp04H
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 08:03:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250515080307epoutp04cf94fb5da2ad5cc4af8c23150e10e9f5~-pJ-wFUnP2272122721epoutp04H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747296187;
	bh=Tkp0DQwXc1mOn4qy+xZBw8LmMOr1qvZhRe+FhWG/Q84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJ8cUNUkyQw+ylK+3ntdvOjXnn/bCBbSFaeNHcLeFapeV0B81MujwqvS/n/lR65jz
	 FFl5/UQJZ4n40i/huhuGRT148O4g0hXBqUL//i7fz39GF/TYCuxlfC3Xk6c7sOfTZ0
	 c12ha3a7RjNNmGwxy/otGLNhNe5Vt5lfIopUGJOU=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250515080306epcas2p481b6f11776427b56173731bd63fa4591~-pJ-a9u7B2562425624epcas2p4b;
	Thu, 15 May 2025 08:03:06 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.102]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZyjPk2H2sz6B9mP; Thu, 15 May
	2025 08:03:06 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250515080305epcas2p4fa47dbfe9c4ece7c40eb04ea4c37c386~-pJ_OI3yE2143021430epcas2p40;
	Thu, 15 May 2025 08:03:05 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250515080305epsmtrp2f76e6349f9cba96800c1fd2046b971a8~-pJ_NWHhQ0238402384epsmtrp2k;
	Thu, 15 May 2025 08:03:05 +0000 (GMT)
X-AuditID: b6c32a28-edfbf24000001e8a-61-68259fb92c1e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	06.C6.07818.9BF95286; Thu, 15 May 2025 17:03:05 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250515080305epsmtip2160d2a09d0e53fdf3e15513c5ad463f6~-pJ9_fQdi1287712877epsmtip2V;
	Thu, 15 May 2025 08:03:05 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 1/5] watchdog: s3c2410_wdt: Replace hardcoded values with
 macro definitions
Date: Thu, 15 May 2025 16:53:46 +0900
Message-Id: <20250515075350.3368635-2-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515075350.3368635-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSvO7O+aoZBmc/KVo8mLeNzeL8+Q3s
	FpseX2O1uLxrDpvFjPP7mCxurNvHbvFk4RkmixmLT7JZPH75j9mB02PTqk42j5Vr1rB6bF5S
	77HzewO7R9+WVYwenzfJBbBFcdmkpOZklqUW6dslcGXMejKTreAAe8XqlaeZGhgXsXUxcnJI
	CJhIXLxwnx3EFhLYzSjxfrt0FyMHUFxK4t0zS4gSYYn7LUdYuxi5gEo+MEpcWf2eESTBJqAj
	Mf3fbRYQW0QgTuJY+2ZmkCJmgZ2MEi3TfzODJISBEuvf7AYrYhFQlWh49h9sGa+ArcTum2vZ
	ITbIS8y89B3M5hSwk5h4cRcjxEG2Eof3PGGDqBeUODnzCdgcZqD65q2zmScwCsxCkpqFJLWA
	kWkVo2RqQXFuem6yYYFhXmq5XnFibnFpXrpecn7uJkZwwGtp7GB8961J/xAjEwfjIUYJDmYl
	Ed7rWcoZQrwpiZVVqUX58UWlOanFhxilOViUxHlXGkakCwmkJ5akZqemFqQWwWSZODilGpis
	iqe/zHr6tnOLrIuAHK/Gtc6/fHqyHUd1X6dddj5sFSH3pU/7j7flt/V2fvb/TGoCQzqvXOGT
	ex2+hv3xnd1tuewcRjN+9P7Ojuyx+Zez2uz0Ql6dlKvhohkvf88RWqTW2rtvn4HDfYWY5VES
	cclfJz7NmJO84PQ2z52Gq9a5bLC6YqxXtEPh5C+FdZOP3YpP33H+r/7bBZPsdq6///t1nZz3
	n8CXEsknwy/b7Lz/i+XQJL77gnOmHuC/euvaXf4doccua0r4MN5ue+pYkTvX8HbGzxvz0jdP
	rY173qK6giHCVUrmYEOhwcLID6cvfnKrebCTkyNcfWLizRO6GQ5zn/aa1rrPqZ1UL3Ox6Plv
	JZbijERDLeai4kQAYiq1XOcCAAA=
X-CMS-MailID: 20250515080305epcas2p4fa47dbfe9c4ece7c40eb04ea4c37c386
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250515080305epcas2p4fa47dbfe9c4ece7c40eb04ea4c37c386
References: <20250515075350.3368635-1-sw617.shin@samsung.com>
	<CGME20250515080305epcas2p4fa47dbfe9c4ece7c40eb04ea4c37c386@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_010315_125032_18C26361 
X-CRM114-Status: GOOD (  17.00  )
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


