Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9709C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgwEKcUmGlnl1RM66Gn6GqrF8g5qbcj0OrA4U2EDCcE=; b=CF3aiCH03+0tHQVxlUP56XnQJl
	eRE14IfwOwDeZ+Pa5lnqEsoFxxQm3FnnYxZjek2u+Tj3pkZI78GFbOxWeDQQo4qfTKjA8tV9ikyP3
	oRAPICrcCtEpXkuV7z2cqjhbJ0+yh9VmofZ4zpY/Nj9GD5/1k2Y47t/0yv1IJC1Wxjkn8rVrBCCLl
	UWkRPgQWgQ6zqQmBcP073CzOJX4YT2P5ad+paeZbc4C3LlcngZGQ0o7lnHRd6URnuiKAqakUx1rlp
	81LqXXMr4XCo9ShiV1h4OoqtPYbCbGv0rAKZ0z17TaGSzUtL2xpVGvszVA7qaNWI0lIQCMfsJOKBs
	mB6zUMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0f1-00000007FVY-34Wx;
	Tue, 10 Jun 2025 15:13:11 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyRM-00000006q99-0z8o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:50:57 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLHFf028210;
	Tue, 10 Jun 2025 14:50:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	EgwEKcUmGlnl1RM66Gn6GqrF8g5qbcj0OrA4U2EDCcE=; b=e9GDCVhaKtFOFFfV
	U5krTjyOTeXdE4S7Eu81575P2m3yHzZB5gGdnS5chytCVndOINjQYLWwBDWwn91F
	tZmP9mMb9Ap+guIkaUyTJLRfuLKjAf74KQuBj2sSabp+oBIamthI3ocryPHJjAwP
	B5WDxXxDmApBRdhVcftpRxAZVsd47zzj9ExPEatYXJ5fkYuYCcYohMIMWbaIJSf6
	eCtZskDXgQ/98ezVyaFJ/ioN+DWbWmc5krJFnUx+4z8QBOevi5uSnsMHd6rHkb52
	PwViJgg+D21DWmI3pUo5OGYf+g/2poLuujC5xjZKnfIhVSHR74IFVn60D26Afl1c
	iGtc3A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2mydc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:50:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C7C034002D;
	Tue, 10 Jun 2025 14:49:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12EE8B4BF98;
	Tue, 10 Jun 2025 14:49:00 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:48:59 +0200
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
Subject: [PATCH 1/5] bus: stm32_firewall: Fix build warnings about export.h
Date: Tue, 10 Jun 2025 14:48:51 +0200
Message-ID: <20250610124855.269158-2-antonio.borneo@foss.st.com>
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
X-CRM114-CacheID: sfid-20250610_055056_558177_45D14B72 
X-CRM114-Status: UNSURE (   9.54  )
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
warning with W=1:

drivers/bus/stm32_firewall.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Fix it.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/bus/stm32_firewall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2fc9761dadecf..3ff5b5b6add45 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -8,6 +8,7 @@
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-- 
2.34.1


