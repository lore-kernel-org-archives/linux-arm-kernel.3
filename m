Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B89C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9ssr1sIFT0/yy99wQbn3SekrD91xN1Xl5jyop03qFk=; b=d/yi6sHgFuVxoEEswsKLpY4KA1
	8EBJZe9r0gsM0J+0atCiWxvnQEVjdBm95bjqXL3fvXRIttkBADASPjVZYbEuyzkA98NxxjNfLTeIY
	EFY97yW8ODf3xYH6eKGSUWTcjv8dtv1EM/YvUQO/HnFAJFeiRzSySK9E7RU0NvmA4AuFld2Vc4PIN
	HPy/WZcWmUw7r3embJMPk/nuNVyQDVkCRE0P7ZCg1NESbllLPLJNWM32oDsRXx5qKVKieZz0sISpd
	HFRdpnN7JCrB/ESV79/Jk/YAvgFVKon4w1l2bX7UyQlN3uCP1QHynu+0hfhsXbvNGingU8Z921wUY
	HuDFcucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EHT-0000000Dt2g-1Upf;
	Fri, 11 Apr 2025 13:18:51 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DkC-0000000DmlW-0aAx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:44:29 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B9hCOH001911;
	Fri, 11 Apr 2025 14:43:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	f9ssr1sIFT0/yy99wQbn3SekrD91xN1Xl5jyop03qFk=; b=ylW+4u6yodi3J3bf
	y4h/jTBAgNeNgADFMk3x76TMxNcNT0p985nrubnJXPq9XQXLM4Ob1Klv6lDEL/Vw
	r59CbXTSot4w0fCEcPYWWewAD+ZK6xkHGWkPheO//qB1WelWGnkZSfqoatU3CASt
	wRdjhoGZslaCa/2PGk73C9NkgGS7fkFt10NesnzJJx1ddJX9/1asHduU+Qc2SP/z
	gr/CpHjhnFilXBKBPaAaL0bxHnadwXG2cSkee3h2ZMg29Qoh2xVfOCGd8wT+3aBW
	T3yDgnhE5RCi+d5Z49QZDvzPsbvmKgkA88eYpe7wzNvbKM4bRyweoDIcbrQJbO07
	zcJfrA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw8pwnbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 14:43:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 138EA40046;
	Fri, 11 Apr 2025 14:42:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CAA0A9EC297;
	Fri, 11 Apr 2025 14:41:13 +0200 (CEST)
Received: from localhost (10.252.25.37) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 14:41:13 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 11 Apr 2025 14:41:11 +0200
Subject: [PATCH v2 2/2] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250411-b4-upstream_ospi_reset_update-v2-2-4de7f5dd2a91@foss.st.com>
References: <20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com>
In-Reply-To: <20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.25.37]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_054428_483119_F1ADC3C6 
X-CRM114-Status: GOOD (  11.61  )
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

As ospi reset is consumed by both OMM and OSPI drivers, use the reset
acquire/release mechanism which ensure exclusive reset usage.

This avoid to call reset_control_get/put() in OMM driver each time
we need to reset OSPI children and guarantee the reset line stays
deasserted.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/spi-stm32-ospi.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index d002b9c16714684e4e4623f9255a7f2660c46fd1..ef840f377459891b559be6d6c0435408fb58a1e9 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -804,7 +804,7 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 		return ret;
 	}
 
-	ospi->rstc = devm_reset_control_array_get_exclusive(dev);
+	ospi->rstc = devm_reset_control_array_get_exclusive_released(dev);
 	if (IS_ERR(ospi->rstc))
 		return dev_err_probe(dev, PTR_ERR(ospi->rstc),
 				     "Can't get reset\n");
@@ -936,11 +936,14 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_pm_enable;
 
-	if (ospi->rstc) {
-		reset_control_assert(ospi->rstc);
-		udelay(2);
-		reset_control_deassert(ospi->rstc);
-	}
+	ret = reset_control_acquire(ospi->rstc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
+
+	reset_control_assert(ospi->rstc);
+	udelay(2);
+	reset_control_deassert(ospi->rstc);
+	reset_control_release(ospi->rstc);
 
 	ret = spi_register_controller(ctrl);
 	if (ret) {

-- 
2.25.1


