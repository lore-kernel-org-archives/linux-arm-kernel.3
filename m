Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE78C369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3whygk/RlYZ76wCT9iuIKZGh9irSBykOVLGvkqBG2k=; b=4myIVj4ZnS3LC9olypUZU4pue6
	XhyIan3LOh4ekwRWWO79OPccp/dl7ycGuzfXTTSYSAbP349JgC5S1lr4eh8WwAWD5gwo736FG2fTJ
	cQHNs95GtYn/JqHDWHKjXhcDhr1mWvnKCy5EY6a3q54NhkXlNvDww4mpE2n8SFklUgA7mlk6yeaZr
	/Cvqez8bbhqcnmM8gQDlp0Egry11ZVfm7ynh772Y87JoOxSJUKc3evzdT+E5wyfaq5FDvr4LV1GmY
	WL1O7MZGFDXA+x30qW7bI8wdqMHS2McbhokgzCK8oX6CXASdnF/7aNWU8EDyJ4gu9NRhs159z+p8f
	JjN1Wa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r0F-0000000AUlM-2Ztr;
	Thu, 10 Apr 2025 12:27:31 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qxw-0000000AULy-0TzM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 12:25:09 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A9Vcd9005154;
	Thu, 10 Apr 2025 14:24:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	j3whygk/RlYZ76wCT9iuIKZGh9irSBykOVLGvkqBG2k=; b=Z2+VX8KWhkYoLhJ3
	+WwT+RVMajJsw5ZympDzFiFPGYtx8inCj5BMPy8602sEWNSlY4wMtehVtCEa/ov3
	nLj/tji8xO1U5/gPn4eKFu33+LX3xmfNofUthW2OmYS8zBqzmjEyF+CLuxo8jret
	eFVZPcviTQcfEIuqIMeuC74N+Lv0mZQWS4l4NOV33hesNbmw3hFX1qJ2pGFwVZsp
	2Ix/oEOjaB00GQh4oX7nzMAG1YvaNXaYop48YhYXRxrYx3R2aEI/9Eb/DsaWbLQ0
	NpTqmGNYbqrnrCDeSFHfhdbhW+r05flFhI0cXoj20097/TI7Z1gqL2mbd9ubnzFF
	hfwmGA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45uffmwdtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 14:24:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A568240047;
	Thu, 10 Apr 2025 14:24:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D5AB958201;
	Thu, 10 Apr 2025 14:23:47 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 14:23:46 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 10 Apr 2025 14:23:45 +0200
Subject: [PATCH 2/2] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250410-b4-upstream_ospi_reset_update-v1-2-74126a8ceb9c@foss.st.com>
References: <20250410-b4-upstream_ospi_reset_update-v1-0-74126a8ceb9c@foss.st.com>
In-Reply-To: <20250410-b4-upstream_ospi_reset_update-v1-0-74126a8ceb9c@foss.st.com>
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
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_052508_659167_97C5A57A 
X-CRM114-Status: GOOD (  11.68  )
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
 drivers/spi/spi-stm32-ospi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 668022098b1eac3628f0677e6d786e5a267346be..96fa362432f13c19e4dde63d964a0db64c8ade95 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -804,7 +804,7 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 		return ret;
 	}
 
-	ospi->rstc = devm_reset_control_array_get_optional_exclusive(dev);
+	ospi->rstc = devm_reset_control_array_get_exclusive_released(dev);
 	if (IS_ERR(ospi->rstc))
 		return dev_err_probe(dev, PTR_ERR(ospi->rstc),
 				     "Can't get reset\n");
@@ -937,9 +937,11 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 		goto err_pm_enable;
 
 	if (ospi->rstc) {
+		reset_control_acquire(ospi->rstc);
 		reset_control_assert(ospi->rstc);
 		udelay(2);
 		reset_control_deassert(ospi->rstc);
+		reset_control_release(ospi->rstc);
 	}
 
 	ret = spi_register_controller(ctrl);

-- 
2.25.1


