Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CFEC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUcADHRW/CG5RbFLRdu854s7Rq7hg+3h+CuKTVAO9D0=; b=PYI+ERFxsEarhwR9p6fiLCq7yE
	+dxyVoR6OFjGy7yk3TfXv9Vv8c9xwCxiXT+wCYCVvB69VEbPZH3ys2IA1gnigR0q3SDPQseyPr3gw
	ZBKTSxb7wIJqf+EeaKxjB0HKB+T//nKNs7Fis7V+3M6G12Rja1VnHUSpwDyA9v6R0N5JeRUn1RsaB
	vQ6TuNcpMj2FvzzmA0e3SGOjrNBOXUxmt3apSVPnNtf0SSGyI7bBK9gvOMYn27nLqRPwRAabciIPe
	fSMIJGBQvTtRU90lAa6v7aQwErT5XsmEwsEfyXaFntSa85flwj1eO5h/2Jru1t4zSq4ItFmOt7TwU
	q3tmue1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1lV-00000007SRG-1RvX;
	Tue, 10 Jun 2025 16:23:57 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyWF-00000006r4k-0fmf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:56:00 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLEi6010655;
	Tue, 10 Jun 2025 14:50:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	oUcADHRW/CG5RbFLRdu854s7Rq7hg+3h+CuKTVAO9D0=; b=DNWTm1pgax86feqh
	VyQ9dkmv0nUbLOq5uDjbAxuM8ulylwzQ12xk+fUxjbJVzMTCEKRzp1NqbS5kQQ8Z
	Kw7Hoh3GAfa2VjSwCKQ/OHIbrlHEVlDzCAYPgZyxiJcBsrgELSm1heXWGf7bF5ci
	p6RdusyQaF0d0x1b52UJCFYqHVMnKAsbUm1gXQ5LRco+WEnHW6CEHTTe5S1J6/cL
	qzoR3/eS5tv0CINKBRxOsflTw6x64V4uwYdsaMwsLwE2Yufti2X1JOq2DJseQC9Q
	A8zAlxrg2K1ASNnLXLt0VMVQYsFJDtbIcpKRlOpZxCFKzVB8PzldBJSfobnObLMX
	0tjHVA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y052j0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:50:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 64AC24004B;
	Tue, 10 Jun 2025 14:49:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4C03B34ED0;
	Tue, 10 Jun 2025 14:49:00 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:49:00 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andy Shevchenko
	<andy@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Jonathan Cameron <jic23@kernel.org>, Lee
 Jones <lee@kernel.org>,
        <linux-iio@vger.kernel.org>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Olivier Moysan
	<olivier.moysan@foss.st.com>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
Subject: [PATCH 2/5] iio: adc: stm32-dfsdm: Fix build warnings about export.h
Date: Tue, 10 Jun 2025 14:48:52 +0200
Message-ID: <20250610124855.269158-3-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610124855.269158-1-antonio.borneo@foss.st.com>
References: <20250610124855.269158-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_055559_483997_52E1ED4E 
X-CRM114-Status: UNSURE (   9.87  )
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

After commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") and commit 7d95680d64ac ("scripts/misc-check:
check unnecessary #include <linux/export.h> when W=1") we get the build
warnings with W=1:

drivers/iio/adc/stm32-dfsdm-adc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/iio/adc/stm32-dfsdm-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Fix them.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/iio/adc/stm32-dfsdm-adc.c  | 1 +
 drivers/iio/adc/stm32-dfsdm-core.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index f583924eb16bb..c2d21eecafe79 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -8,6 +8,7 @@
 
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
 #include <linux/iio/adc/stm32-dfsdm-adc.h>
 #include <linux/iio/backend.h>
 #include <linux/iio/buffer.h>
diff --git a/drivers/iio/adc/stm32-dfsdm-core.c b/drivers/iio/adc/stm32-dfsdm-core.c
index 041dc9ebc0482..47e2d1338e9e6 100644
--- a/drivers/iio/adc/stm32-dfsdm-core.c
+++ b/drivers/iio/adc/stm32-dfsdm-core.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/export.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 #include <linux/interrupt.h>
-- 
2.34.1


