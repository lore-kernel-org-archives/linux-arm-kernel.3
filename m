Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D624C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 15:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4kf8qwN68I8vr5z32Udkj2vXKggoefUcP+4H7K214E=; b=WhNafRc2SvW1+ZHg4mFwmBE/kw
	x/pWGGEFThbof4LreXFKRDvg9mqhwI2S+vDtATiGvqginzTYyKmKEsmP/ucIRH+TFUKPuQRV0wPol
	3hj/iJeulHdefWVwd/H6A4O81h/f/lBaIZzERFupTBDV4qmUC0IVsHAoG5u/bPQQ/O+miuMXUApEN
	DQxixm2+7Xbvo+k9gBmHm+8T43TFEjEVrKU9rNNNw/3Q+mw30vaKXPOuAXd1ta6lygwKbNa3ur9no
	JOpNdxAPEf4tYmi6vsPzz3csXNgLByrhKL4CrdzzvuGyRSXAULggyCrXzqc056JkRjdou9ZhMnV6+
	qmhDR+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFbm-0000000F8yo-3D3o;
	Fri, 11 Jul 2025 15:24:18 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaF76-0000000F4OX-1wXI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:52:37 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BEmNdo005606;
	Fri, 11 Jul 2025 16:52:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	+4kf8qwN68I8vr5z32Udkj2vXKggoefUcP+4H7K214E=; b=idIFcDLu1vvRcBd+
	DajJUuWiQNAVfAAu0j8EDiCv/nLjNMOI79zeIvmxmt0rdysWA0Q2xrvI99TijKZd
	YasqbuPoaXBSj3W95ABQjGamFv6AXTNXZRUKzqVEavYYqFRt2DdGz8MG7a2sskus
	PSpJce30yhM0nzxNaxOWf2GqEkN3ZDJCv8gzu5X0cs89UVEcDpDagbZPECjcw95r
	d4/JuC/60mjVguA8sTxinEgX4QYbKwzGNq4KDsI9iD+SqawrCoMillRl7Q9P3geL
	zpob0fyMKFTmUqz+8jClrhCrii4ZiJcrm+T6ZC317jDdoVBRT9yBsPzovbUE5MaX
	yg80nA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ptxjpx00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 16:52:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D02EF40053;
	Fri, 11 Jul 2025 16:51:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64ECCB554DA;
	Fri, 11 Jul 2025 16:49:22 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 16:49:22 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 16:49:03 +0200
Subject: [PATCH v2 11/16] MAINTAINERS: add myself as STM32 DDR PMU
 maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250711-ddrperfm-upstream-v2-11-cdece720348f@foss.st.com>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
In-Reply-To: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
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
 Goffic <legoffic.clement@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_075236_772276_0DEAD0DD 
X-CRM114-Status: UNSURE (   8.85  )
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
index fad6cb025a19..b721d1758db8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23491,6 +23491,13 @@ S:	Maintained
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


