Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6AAC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=37TpAl9wbgOsV5Z6M//ml7JiFhzHgyko7+RFEp3uV6k=; b=R9vhXTwV6MJxtE
	T4YRbE9Njsu+xCemv2T1Gt41cbkk/uwdQzivJ4JKVGEdoy9NsA10UQzB+QyVyMXRWkCNPqenpcHIQ
	WyiUwm9kPblQ2jKWpxyzsGItfWfbeeT8ZmsiquDOCAB7qHpPZwHbJYJuELStNCJhiltH25MGi0Hs7
	+eL/q88jbr9jhkdbnfrtGhSfBfGcoAAZVBK3wVYTFgmWQFW8SGgD24m73qhu0JvRGwQBWDlO3APVd
	VJ0NZsn+D69ZZOU+zEO4TjyV+0Tn+PIjPiKDmLrBtwWJEuaY/TtYKLrvPIm/BcYYGAHTyG0pWgF0O
	Ojf8QqpdrqQDMuSxCaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r3k-0000000AVEe-0CLI;
	Thu, 10 Apr 2025 12:31:08 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qxw-0000000AUM0-2rQZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 12:25:10 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A9Vdxr019225;
	Thu, 10 Apr 2025 14:25:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=37TpAl9wbgOsV5Z6M//ml7
	JiFhzHgyko7+RFEp3uV6k=; b=PS9dKJRukFSJlYQ4JNFU7B++TZvDxUXzBPEIr6
	sJIaEnUVLrlokz5m7NLHV8G860gOG7lFjiMZpVG5mjYvlUMStbk8EISlEHslN+wF
	pP7dz7JM6mQga4DgvVDDFd1KmY97wYcR++f4ZQWqGLWNdZjpAz7OxR7sIIeY5aKw
	mr8a2VoY2BvGGDbR2hyH00iaf/2gY+fuywcHyDemjnLutaYr/2Cug56dyk3qIpZl
	zldbQZYnyd1ly4Ky1KmRwmiJbF3oJth5ztD47WsC/FIuaAKNoSqgbXSGs7oIBkNI
	fGlOa2oIOsXeY/r/B6wbWgPyKWvq7Oa1r1Izcl8S/YpcAwNA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw6eqmaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 14:25:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 98C4F40045;
	Thu, 10 Apr 2025 14:23:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A54BC9DA5B3;
	Thu, 10 Apr 2025 14:23:45 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 14:23:45 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH 0/2] reset: Add
 devm_reset_control_array_get_exclusive_released()
Date: Thu, 10 Apr 2025 14:23:43 +0200
Message-ID: <20250410-b4-upstream_ospi_reset_update-v1-0-74126a8ceb9c@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+492cC/x3MQQqDMBAF0KvIrBtIohbaq5QSUvPTzqIaZqIUx
 Lsbunybt5NCGEr3bifBxsrL3OAuHU2fOL9hODWTt360g7PmNZi1aBXEb1i0cBAoalhLihUmZ/h
 rcv1460HtKILMv///eB7HCS2Mgl1vAAAA
X-Change-ID: 20250410-b4-upstream_ospi_reset_update-ffe26d13593e
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
X-CRM114-CacheID: sfid-20250410_052509_010913_102E3A1D 
X-CRM114-Status: UNSURE (   6.74  )
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

Add the released variant of devm_reset_control_array_get_exclusive().
Needed by spi-smt32-ospi driver as same reset line is also used also
by stm32-omm driver.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Patrice Chotard (2):
      reset: Add devm_reset_control_array_get_exclusive_released()
      spi: stm32-ospi: Make usage of reset_control_acquire/release() API

 drivers/spi/spi-stm32-ospi.c | 4 +++-
 include/linux/reset.h        | 6 ++++++
 2 files changed, 9 insertions(+), 1 deletion(-)
---
base-commit: 4a65326311aba694faafcef9e3c0ef7ae1b722e6
change-id: 20250410-b4-upstream_ospi_reset_update-ffe26d13593e

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


