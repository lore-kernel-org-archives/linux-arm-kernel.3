Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBFCC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKaXaYwKcu7f+nUNj+bRqaE7VbhsFGliz8Rj/en1exs=; b=uw0H+X589Q5StSGJzCZlRMMR2P
	TZN1OO+pVHZ09IV1R84LV9kCQij0/MeciklEJBIEBiGyCRUSS0MC+bNKVLoRkbBLfOU3oM2Xm60v4
	WvPXSvkvEAOC+IVGCkXaOMAJjP7RJHFOUzsa12WXMOaLoTtNs6nXCy4SR7rZ/t7HWwQFqqkMIIyES
	XiK0uwc4y5vmTG7jZbBSKFfNzfYgL9K0zv5M6S9VA+kLjGkU+9YBQOx9MTlZZLIqAO56NfhyjLEuy
	WL+h5CS30KDuD3JL8G0J/Hm5d5yg4ZWo0Kdy61PAULwrQEposyB+8MEQi0IccLPA2gRPUOSWOL7Xq
	QeDDNZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewP9-00000007cp4-048B;
	Thu, 24 Jul 2025 13:54:39 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uev8y-00000007Q7l-0VEx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 12:33:53 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OCPTHO003302;
	Thu, 24 Jul 2025 14:33:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	CKaXaYwKcu7f+nUNj+bRqaE7VbhsFGliz8Rj/en1exs=; b=RpgRWqKADW0YVWS8
	dsV0erVRnub2M2YtrMJKgbH1Nae2zWKLg9P73WN/SuX18wlo6aPnz19IwDthnM2t
	jE4A/p1BXkwVSaCREsfVSHZb3/g8UhrlyY5rIT04c6p8lAISlwgOMEcgD3u5BJrf
	kSC56gJqaYi8KmhPgbBKZ+W+V2LGTdjeZ0W/dSZHDbPjgdeK7if51fxFIUNP4rP6
	hhLY+LVFuZ/PYvOF1LfVpuMyGoW9O4uFgatUmc6dwa8spSRmVtazNbKmUPr8LytT
	/hFWDJe0Sndxiq11t+WxG7BUZ+RmCmNEL9VwjZBWf+9acVOCuKVONA2AVD61KRyr
	P04oyA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q2hgcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 14:33:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 23DF340048;
	Thu, 24 Jul 2025 14:32:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F8046D58FD;
	Thu, 24 Jul 2025 14:31:40 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 14:31:40 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 24 Jul 2025 14:31:19 +0200
Subject: [PATCH net-next 2/2] net: stmmac: select STMMAC_RELATIVE_FLEX_PPS
 for stm32 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250724-relative_flex_pps-v1-2-37ca65773369@foss.st.com>
References: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
In-Reply-To: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=gatien.chevallier@foss.st.com; h=from:subject:message-id;
 bh=kYc22+pXE94O5MsVh/juNZH7hoJMz0fgwyYxca0rS58=;
 b=owEB7QES/pANAwAKAar3Rq6G8cMoAcsmYgBogiepsTgLPZrrGMt8M3XPMRT2k5dmelVV3cHXc
 q9ZAMJ4qSmJAbMEAAEKAB0WIQRuDsu+jpEBc9gaoV2q90auhvHDKAUCaIInqQAKCRCq90auhvHD
 KGcZDAC2we1zr9ttzik/UGxxTs6+etvxhZ0YdGNPoolAcEHDnw25ypGEq63DObs3YOEc2Bh4f1o
 aBdjY0Ty7gv0RsDXsLckk/swrytxeRvD/+sJP1sbw9Vc9rZTgLqFIFsTufOo5VpMsKYgf36xiO8
 Hnej7HVWtsxZfD8M5Al/cZ3qrbnq2ZFhiTj5c/wYmGqKsWfQoTpKeXB3JEwEVC5+E+yz813aHmG
 KnEXMabOtoDKkfgUlxTESNn8X4z9Yv60Ily6ReZTBN65DCDoMNK/Z+8Alxe9t40hP88TdpbX8Do
 pTRbfAOHNEONAmbr3OsVaatVDzN0Y7xqi2KteCWN3QzzE7dSK19hZB5KyZqITOrb5Z+EmTVq0a9
 sHua8pGthqjr05iB4or9VNHOL1wgbKjvaHXvhycDNM+m2NHX3IUcVl4jdnaTzrtktT71tQsdmtd
 eWE8lW8buHb41twjsq082g2ZmWBbSyYLl4vs75ucNCigNi45Z/gxKzGFdNEg0uw3zlt9k=
X-Developer-Key: i=gatien.chevallier@foss.st.com; a=openpgp;
 fpr=6E0ECBBE8E910173D81AA15DAAF746AE86F1C328
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_053352_461542_E89A1C2F 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

In order to simplify the generation of flexible PPS signals by passing
an time offset relative to the MAC system time, select
STMMAC_RELATIVE_FLEX_PPS for DWMAC_STM32 config.

E.g: "echo "0 3 0 1 1" > /sys/class/ptp/ptp0/period" generates a PPS
that has a 1s period, 3 seconds after entering the command for ptp0 clock,
given that the MAC system time stays stable.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 949c744d30f19f5ff480dca4811e678d2b93c450..98fae30ad5a2760ec6b9cebf3dcaf8e4d7d19b77 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -233,6 +233,7 @@ config DWMAC_STM32
 	default ARCH_STM32
 	depends on OF && HAS_IOMEM && (ARCH_STM32 || COMPILE_TEST)
 	select MFD_SYSCON
+	select STMMAC_RELATIVE_FLEX_PPS
 	help
 	  Support for ethernet controller on STM32 SOCs.
 

-- 
2.25.1


