Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AA5C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7pJzEtEF4BRq9Di9PYTDYHEZrJi/VT4Til+/18ednY=; b=L/LeWmJHsSKxtU4A66ycOZgs5t
	BibKm4Wg7wboDberKi1Y3jyzbJ/hI1ath2ba+oKWuaaquyRZZOOxmRsKCf8Cz4ey5dwrFh8xemBlg
	YLxqU46mFp+dsPPoPttRnpEY2pEnEteN0VJ43mrUlXQMsHLB0JkxUxj3B+ln5iAIfmRTq2Cc75s51
	5hbMAOeqsaVCMgUXAnjRuw+uwjvpWxoe6bNVGXtEIGQ0BrhMCszr7S4IErrIHpxLDpcKlv+oDujP2
	+y9Q/DSHvwrNBSjJs0+iXswmf1M3O+MoSwhjet5h9QzmOZpbWBedgOHIRUZxWPMNu5oelVMZITcY8
	FZt62COw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6kZ-0000000424p-1EuN;
	Mon, 16 Jun 2025 10:07:35 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR649-00000003uRL-33Q6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 09:23:50 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8nbVZ018924;
	Mon, 16 Jun 2025 11:23:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	G7pJzEtEF4BRq9Di9PYTDYHEZrJi/VT4Til+/18ednY=; b=RWetQUwEFnW9+VTM
	4BapsuOFsAERvwf4o1Msei3ff6HGnEO5FSz96zfWaUDBMsuqgl8AJ4Zk7MoLmzGP
	qIZfjpl1WXHiKIqgzU6xeOxkluxYxLH+4YmwFt+xyW63ycRL9/kLBJ81ViR+wosB
	YDRxR9cj9v31gMsZexgPpNKNbSZxfZeBy6dmEy2kvORtPP7Hz6POtsL1rJ5WYnZA
	dl16SnQbXR+pQENMhLXLIuKxibPzi5QxkqnMY7yz8Kgp2f/dQhQomsa+4Jf63wyd
	OCZdYyL8MHcP8mAE7KymgLQ+S7CyT1NIEwu+X1tKpLBvPSxzs0tptRlVJBMPsngS
	8GM7EA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4790e1ywfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:23:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0745740046;
	Mon, 16 Jun 2025 11:22:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71758AA6EC7;
	Mon, 16 Jun 2025 11:21:08 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 11:21:08 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 11:21:03 +0200
Subject: [PATCH 2/6] spi: stm32: Check for cfg availability in
 stm32_spi_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250616-spi-upstream-v1-2-7e8593f3f75d@foss.st.com>
References: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
In-Reply-To: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Erwan Leray <erwan.leray@foss.st.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
        kernel
 test robot <lkp@intel.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.14.42]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_022346_055420_4E9F60C5 
X-CRM114-Status: GOOD (  14.11  )
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

The stm32_spi_probe function now includes a check to ensure that the
pointer returned by of_device_get_match_data is not NULL before
accessing its members. This resolves a warning where a potential NULL
pointer dereference could occur when accessing cfg->has_device_mode.

Before accessing the 'has_device_mode' member, we verify that 'cfg' is
not NULL. If 'cfg' is NULL, an error message is logged.

This change ensures that the driver does not attempt to access
configuration data if it is not available, thus preventing a potential
system crash due to a NULL pointer dereference.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310191831.MLwx1c6x-lkp@intel.com/
Fixes: fee681646fc8 ("spi: stm32: disable device mode with st,stm32f4-spi compatible")
---
 drivers/spi/spi-stm32.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 2bcd4a43676d..8b61caf770a2 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -2089,9 +2089,15 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct reset_control *rst;
 	struct device_node *np = pdev->dev.of_node;
+	const struct stm32_spi_cfg *cfg;
 	bool device_mode;
 	int ret;
-	const struct stm32_spi_cfg *cfg = of_device_get_match_data(&pdev->dev);
+
+	cfg = of_device_get_match_data(&pdev->dev);
+	if (!cfg) {
+		dev_err(&pdev->dev, "Failed to get match data for platform\n");
+		return -ENODEV;
+	}
 
 	device_mode = of_property_read_bool(np, "spi-slave");
 	if (!cfg->has_device_mode && device_mode) {

-- 
2.43.0


