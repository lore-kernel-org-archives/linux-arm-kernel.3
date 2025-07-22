Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D411C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 14:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iltrvkkBDPNUkwWqDFThCKXQjo7LhI+eeBGbd3adnYk=; b=PP2+E4iscHx1CxzwrPHP9pf/ah
	Kk0K8lWujS6hLR4VdJr9rtMK3N1u2YhhuR69dvyR0tiZEkrsjvkDAVwVQY6MRowtxqQr4yJDc47SR
	5gakOS7xypCfOgOEwCvtH/z+CFdTy6nh37ZVmhDqcJwxV4WdXWA60eb88iGx8yK+Xkl0UJ566JWWr
	Ypo7whC3a5VuVqHbfkJOgmCCUvnrBPRRtuFbotFx/LHK78DETBzHgVNvqa9dCmeryUHgrXjM04tH/
	xI5ixQtLow4jspJ8jLp/BZAUmo6ksgY+RhGa/y0ExlykEWv0fO7rgtqC50F5IXdZUW9q1BB6jKXEg
	tAVGMe2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEIE-00000002lUp-0iFv;
	Tue, 22 Jul 2025 14:48:34 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDdw-00000002ddB-1CZ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:06:57 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDXiGn010281;
	Tue, 22 Jul 2025 16:06:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	iltrvkkBDPNUkwWqDFThCKXQjo7LhI+eeBGbd3adnYk=; b=NvI9jpQS+JhmRmRq
	nxK2aoBTimL5MKRL8KLi4p61ZSy+o0019paPFiRiWz4NtFPqXoaBcDj5E5m7aXxK
	8iG6fTcFSAdlK3nmOA0TVRrdcqjX7rrzaJLKpNJ1y8+32nQOHXpxSmH6DoR7zHN7
	asA5JHawwVl6WkXT+HY/Brcc6ZoGHXxGu9bd8tJkAqJU8cxGo+H+mpuVTgBpCz2T
	YFcgonhukwIb3ndH7Tz/N5i6sRG1eM7vbK4vQOJcO1rcXzOByMZlSXdf62ku2MwY
	1BXAXj2D52jlUam3IfBux3F9/vjYNdjXF9d9tLLM3SIw7tM9jeMEDoOp9711osa4
	mhtcsQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800skxyhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 16:06:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 12E464005E;
	Tue, 22 Jul 2025 16:05:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EFE437A1A6D;
	Tue, 22 Jul 2025 16:03:59 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 16:03:59 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 22 Jul 2025 16:03:31 +0200
Subject: [PATCH v3 14/19] MAINTAINERS: add myself as STM32 DDR PMU
 maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250722-ddrperfm-upstream-v3-14-7b7a4f3dc8a0@foss.st.com>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Le
 Goffic <legoffic.clement@gmail.com>,
        Julius Werner <jwerner@chromium.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-8018a
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_070656_640051_B28F7BB5 
X-CRM114-Status: UNSURE (   8.78  )
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

Add Clément Le Goffic as STM32 DDR PMU maintainer.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10850512c118..247f07ae4176 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23487,6 +23487,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/power/supply/st,stc3117.yaml
 F:	drivers/power/supply/stc3117_fuel_gauge.c
 
+ST STM32 DDR PMU
+M:	Clément Le Goffic <legoffic.clement@gmail.com>
+S:	Maintained
+F:	Documentation/admin-guide/perf/stm32-ddr-pmu.rst
+F:	Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
+F:	drivers/perf/stm32_ddr-pmu.c
+
 ST STM32 FIREWALL
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained

-- 
2.43.0


