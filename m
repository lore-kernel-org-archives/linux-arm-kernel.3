Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3606FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iF7XGLKPcudkWLwpYz/z12ZVFINWFvDEkKGpP/Zh/5A=; b=Wu0evsByHgb9jIsvSgppTfaz2Z
	vTYIQBincH/rk3GUXAo3iUojMRMsVC/s7zWKaKIoukedMdLQxziJ5606MpwQnXOSoYIcWjhOOtKBW
	aUGBU+BT1KluHBV6nstHg7GTtSkVvsIheXkPlBnBtjVuEQGAbfmA0rQ97R9gKk3rfpbi6l/KcZCQ/
	fN6CWyBcocf9GE6XwVkbJw142pIFWuWJicPI09dLfbCBuDaIaWIJm5kEFqGgC+NiY7ieya3CFmtr9
	YaRSZB3r9Ga33VsYUQ4UfH0+kNCV5AB7hQMo+mTNRDKMlSwb30DxCTvIz0A6nYd2/MY/amZJ7vWws
	pRHWKe6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ues0W-00000006zyI-0vLd;
	Thu, 24 Jul 2025 09:12:56 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uer5F-00000006osX-1CZ4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 08:13:49 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250724081338epoutp03d4dfa2cffa3bb613fa587c0e50f432fb~VIdLAHRV_3233732337epoutp03c
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250724081338epoutp03d4dfa2cffa3bb613fa587c0e50f432fb~VIdLAHRV_3233732337epoutp03c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753344819;
	bh=iF7XGLKPcudkWLwpYz/z12ZVFINWFvDEkKGpP/Zh/5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AXm13xJeTCW/AiCRFHqspPSGPJO+CCfEUCo8UX/K8dEy1wuTnM0v4YDZhW6GTiU8Y
	 0gXBlCxq2Zt6ZJwrxp1TZpZqqb2oZ8IoqfZ+wPS1hs1NdQCIBOvYHzaRtxyze2B1wN
	 GEN0azR/OXydwJt/PIntC0jc3KTAww4fHyYFN0U0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250724081338epcas2p1c5b87ad2c7f81672871aa73c3c54b2b9~VIdKS6ZcI2457124571epcas2p1V;
	Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bnkKY41TSz2SSKX; Thu, 24 Jul
	2025 08:13:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250724081336epcas2p31c2e3cbed1d3a7bf30a9fb664e6cb92b~VIdJDvoPV0904009040epcas2p3O;
	Thu, 24 Jul 2025 08:13:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250724081336epsmtip1409ff895c9cab7adc3f5a208f246cd16~VIdI95Fg-2042020420epsmtip1S;
	Thu, 24 Jul 2025 08:13:36 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, khwan.seo@samsung.com,
	dongil01.park@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v4 1/4] watchdog: s3c2410_wdt: Replace hardcoded values with
 macro definitions
Date: Thu, 24 Jul 2025 17:08:51 +0900
Message-Id: <20250724080854.3866566-2-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250724080854.3866566-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250724081336epcas2p31c2e3cbed1d3a7bf30a9fb664e6cb92b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250724081336epcas2p31c2e3cbed1d3a7bf30a9fb664e6cb92b
References: <20250724080854.3866566-1-sw617.shin@samsung.com>
	<CGME20250724081336epcas2p31c2e3cbed1d3a7bf30a9fb664e6cb92b@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_011345_890093_22475BA6 
X-CRM114-Status: GOOD (  14.97  )
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

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 40901bdac426..95f7207e390a 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -587,7 +587,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	if (count >= 0x10000) {
 		divisor = DIV_ROUND_UP(count, 0xffff);
 
-		if (divisor > 0x100) {
+		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
 			return -EINVAL;
 		}
-- 
2.25.1


