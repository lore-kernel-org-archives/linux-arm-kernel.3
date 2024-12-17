Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D187EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=klpO7a4rKZ87Ajz1kwj0LhobGu0p7g33e+yMsi/sDLQ=; b=qfIwfKPv8DRGSA
	T7ym9nTcqqGeTApeLWliyC96CK4T5ObrqIaC9vpvoV1RmSHTo8DqEsMR7QZ15iGz6wE0pNOYAOmPS
	6GaPdheAFHonk6MbE4bVb7Lya06EWwMludan4l+EewigyixK3yZ+IacXra6qHEzTSG5b2uTSPR0vp
	JPdv9LSVedxFXaWO84XTWDb6JReyoAochnA2fUZdCZZJZRwZcOFW1chmRqkBflus1mqoVlafiGIIm
	RfiTANseJTeEB8V/+DIyIgJMKWBshhaC8LLWnVG/rhwiV+WTInNYbcr+rvqa/Xc1Fu4fonct9UVeg
	yfmoIJnSroY8ztl2BX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbzR-0000000ESqT-0sFC;
	Tue, 17 Dec 2024 18:08:13 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbZq-0000000ENpW-3Wl5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:41:48 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHDQcJQ030946;
	Tue, 17 Dec 2024 18:41:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=klpO7a4rKZ87Ajz1kwj0Lh
	obGu0p7g33e+yMsi/sDLQ=; b=pdqn0uvxqrUHeV8bI7lLPfR/ScE7uekK16iY3d
	JtUKXBzS5bxFJcY0uYYT4u6GjTZCDjmt3FJjbYfhMReGjn2wUkBTz3Ee442EJ7fT
	EX84+UHuZAahJi6IdbdzJUBKHHIxheHihu7eTbS8LdP8dYfrX7izohOLxORoTrNv
	Vww+9gg11yME5aXb7RnYih9acjTBz1fPkfdl+hYH73JVHHlzlAg+SCeD4elP2sg1
	+eTICDk37Pz7BJvM1O/anMNuH525l+GpZB2Uvu9b8LPtmuHqSKnprUXLvas1l/yq
	zYyOU8XWnJ0BjCk74T9RDDcanf5zBMgRhAkA2QqHZ6qgFuUw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5c4u3br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 18:41:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B146B4004A;
	Tue, 17 Dec 2024 18:40:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12FD92839F3;
	Tue, 17 Dec 2024 18:39:24 +0100 (CET)
Received: from localhost (10.252.23.235) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 18:39:23 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 0/9] media: stm32: csi / dcmipp corrections
Date: Tue, 17 Dec 2024 18:39:17 +0100
Message-ID: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEW3YWcC/x3MwQqEIBRG4VeJux4hpajmVWKQst+6C028EUH07
 iMtPzicmwSZIfStbso4WXiPBfpTkdumuELxUkymNo02ulNO2C4ucEo2JNNaxJI5BMRDVD+gBrw
 emtlTWaQMz9e7H3/P8wdo/mnebgAAAA==
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.252.23.235]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_094147_174466_C36CF160 
X-CRM114-Status: UNSURE (   6.09  )
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

Various fixes within the stm32 csi bindings/drivers and
stm32 dcmipp driver.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (9):
      media: stm32: dcmipp: correct ret type in dcmipp_graph_notify_bound
      dt-bindings: media: clarify stm32 csi & simplify example
      media: stm32: csi: add missing pm_runtime_put on error
      media: stm32: csi: register subdev only at end of probe
      media: stm32: csi: use ARRAY_SIZE to search D-PHY table
      media: stm32: csi: simplify enable_streams error handling
      media: stm32: csi: remove useless fwnode_graph_get_endpoint call
      media: stm32: csi: correct unsigned or useless variable settings
      media: stm32: dcmipp: add has_csi2 & needs_mclk in match data

 .../bindings/media/st,stm32mp25-csi.yaml           |   5 +-
 drivers/media/platform/st/stm32/stm32-csi.c        | 102 +++++++++++----------
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  23 +++--
 3 files changed, 67 insertions(+), 63 deletions(-)
---
base-commit: d216d9cb4dd854ef0a2ec1701f403facb298af51
change-id: 20241217-csi_dcmipp_mp25_enhancements-89e0eef194bf

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


