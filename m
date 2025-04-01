Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414EFC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 12:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+aM4v81IIJ0lXB9aqI4mX4YkHUFBD7dtY0uixMWUn8=; b=oUO4r7nbOl5C5UM+RRC9DX1Ul7
	D3457dPWAigFnEyTjpAC6PMfze6Q8gNfIO9K43IKz8lzNiTzQ7rd36neVRq7uKMrq2eTURUEMfHBJ
	2sPKbpZ16cCLhIYHLr6ePoQn7dZHq7HpRY6H09+gIWIm2CHk/4R/P15uy6ohA/j8KPOqSfhSeQ0zl
	wOxnr2YjMMwQEElI6kJOMlmI6/Oejj8ntT4OKRPED+0gBnqVikUQKg7FEexXLheFF6fOiQDzzD9dN
	pzp+7AmyyDaz8GszltafOzJUgizzw8M8bu1DgS8nxFUQl2a6dHOVc2YQdBSdzlCsbXKWREenzuscA
	RG86juOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzapA-00000003IOQ-1xUo;
	Tue, 01 Apr 2025 12:34:36 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzaep-0000000396S-0Zy4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 12:23:56 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531B8cHM008240;
	Tue, 1 Apr 2025 14:23:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	6+aM4v81IIJ0lXB9aqI4mX4YkHUFBD7dtY0uixMWUn8=; b=YTUwn2V2Rmy9Df2T
	I4dA9j7MrfHxLvZkXkryjXRDP65ccBGfiWePeSNeyjmwMOJuEWht2sbKMc9fROoA
	4eW97tmUmw29sjsNv+xayekyKBp9LOeEBJuxJ9FrZi2Y7Xh5xkdFKT/cf+HHtrgp
	vPkypxnD8XZfLzjS3bcNELBNf+9JywvfjynG5HJafQBATCROssYFFcu/fQHYVUrd
	/qXCN4XlyHUeey6iSHVdyDP3qBOpqMtClijnke7swLsnF+lBOdXWT2iAPiiDNUBM
	8moC6ccVhFKbC0WUPHA9rKxfQk7sdPHUbRtak1U0Kj7sajuMDiUnyQCJ8xwtG7/0
	kGKIMw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p935w9jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 14:23:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A64040051;
	Tue,  1 Apr 2025 14:22:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DDBC78A0456;
	Tue,  1 Apr 2025 14:21:48 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 14:21:48 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 1 Apr 2025 14:21:45 +0200
Subject: [PATCH v7 1/7] MAINTAINERS: add entry for STM32 OCTO MEMORY
 MANAGER driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250401-upstream_ospi_v6-v7-1-0ef28513ed81@foss.st.com>
References: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
In-Reply-To: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
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
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_052355_626722_997EA1F9 
X-CRM114-Status: UNSURE (   8.67  )
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

Add myself as STM32 OCTO MEMORY MANAGER maintainer.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b7e1f9c30f3e45fb85b0d0f58b56db84d986061..830245c8d583c422e869dfe4b5a184faaf52b559 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22766,6 +22766,12 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-stm32*
 
+ST STM32 OCTO MEMORY MANAGER
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
+F:	drivers/memory/stm32_omm.c
+
 ST STM32 SPI DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	linux-spi@vger.kernel.org

-- 
2.25.1


