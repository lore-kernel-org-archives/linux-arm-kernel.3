Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF8FC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 09:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzLmfHxTjgjzxH2MLhlvyo1SC7eJ5Hj+e6zOGJcJg9E=; b=F7PxNFr6fSoIzS5knxS5aQNfuj
	av9PUQAK26od8p299Pta9q9hb4DjHU3R814eNDURJCLcZ27QfTCZteWPCuJhptBPiaFR9p6AXsSvX
	/MPZzF1rHkfFAHKzYjckARjek0dKbFhKxMTPzCQHsLt72H4QRXk4FqK75u6uPT4WsmcdT9NMLaWOI
	MR6EjxM1OAqF54P2WFPRN2QFegyPg3oHvtCLb49o2bOMrUh9RLwgwcLiFS0ztg5PdFK1t/ewDDde3
	uroNtsxQp226aiu6UlZ4jH2Xa9KlxcJDS7iSBH1j/mnJwM4Lh8RrlaOBzIrBC4E692e26Fk061cp+
	KmDdcFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twePF-00000002l3y-3Ip2;
	Mon, 24 Mar 2025 09:47:41 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tweKz-00000002kRm-2V9O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 09:43:19 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9bkhv012912;
	Mon, 24 Mar 2025 10:42:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	NzLmfHxTjgjzxH2MLhlvyo1SC7eJ5Hj+e6zOGJcJg9E=; b=RjZcSVc6/aR2sEEY
	p3+BtYB+Ow7xIIr5Zlmif8LHp0BXyL7U/CXvQCDlo3ElPwrs6FqMnlWzmcXm1DPK
	rH0kQ3KIL+8NjPBh+buHONUDAD1JKonPfsTnn2Xv+RlWegZzs4TGw4zdWTOJ1qe8
	t2VkWPdFcgkBHkI+9s41y6qim0O39+VTOlbLMZ6U7Kxcp+Zyn5EToWLu6Hoo7cHj
	Mkipvnv1f4yVJUmwaGp9h0OVk+pTJqI7d8fpXiJM1zkejYnwv8yBcfgqd4qLy0uT
	MjO2zzu1L/5TGYKx3FnEDJAcfUG2pfccNb82WW8acU/FxPA7qGYGGDT6x51S+tHl
	VwAJMw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45hne56t0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 10:42:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E3C6C400DB;
	Mon, 24 Mar 2025 10:41:40 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA1817DCB33;
	Mon, 24 Mar 2025 10:40:16 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Mar
 2025 10:40:16 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 24 Mar 2025 10:40:13 +0100
Subject: [PATCH v2 1/2] spi: dt-bindings: st,stm32mp25-ospi: Make "resets"
 a required property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250324-upstream_ospi_required_resets-v2-1-85a48afcedec@foss.st.com>
References: <20250324-upstream_ospi_required_resets-v2-0-85a48afcedec@foss.st.com>
In-Reply-To: <20250324-upstream_ospi_required_resets-v2-0-85a48afcedec@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <christophe.kerello@foss.st.com>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_024317_941473_94808F2F 
X-CRM114-Status: UNSURE (   7.91  )
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

On STM32MP2x SoC's family, OSPI is child of Octo Memory Manager which
must have asccess to OSPI's reset to ensure its initialization.
Make "resets" a required property.

Fixes: bed97e35786a ("dt-bindings: spi: Add STM32 OSPI controller")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
index 5f276f27dc4c1fd2056f129cafc1005eaee8008f..272bc308726b2dfdf3ec80740d70e0fd1bfc4fea 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
@@ -68,6 +68,7 @@ required:
   - compatible
   - reg
   - clocks
+  - resets
   - interrupts
   - st,syscfg-dlyb
 

-- 
2.25.1


