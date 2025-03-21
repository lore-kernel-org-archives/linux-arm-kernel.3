Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523F4C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfEGs4dkfxFOD5KJYRTWHjD7ebrAHHsZi90qqkv9y+Y=; b=Nb04KpsIAmRlVlRPl+wiIgi60U
	1T7IlqHEif1ewKy4PzAzz9rTn8glAlcdYB7gTr7hQuad2//Ue+/wzdd8JJDBQ+RRqAFPXrnJX6Akn
	eVpVlwhWm0YazNOcF3EUhFogs+l0/VPrO1i8+2VbIbTf0Zn1sNa4D+3UKo2cZGeMEAwsk/p2IQemO
	8ruRDe4acIck/rmhhmTf3cTNOehBbmTfUJuXx58GXQhE0XXBHnIHsQZYv7gFLTlKj/zlY9mh2sXoz
	nOn/DuFItiY1XpcikjjpQzepOq1SpGnvVFusUUz81p+CeVDJzZoHvCSQVERvs08AQ1fvroE49Jp0h
	FmjyAF7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZbG-0000000EWSI-0zSp;
	Fri, 21 Mar 2025 10:27:38 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYx6-0000000EQD8-1gea
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 09:46:09 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L7Y3xq019542;
	Fri, 21 Mar 2025 10:46:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zfEGs4dkfxFOD5KJYRTWHjD7ebrAHHsZi90qqkv9y+Y=; b=bUZXZZdc2/obN/TT
	RSXOrVPogUeFQNidrAYzuATt0Fh0Rpq7AKd6dcCIahfmC4gjyf1SNxh7d19LMMb8
	SK9JeHAbhVcVf/lDVy4xz5J+q3LIVNxVm0dKzImeihFkjMmTp+cSqG4d531Fl1pU
	EWvzghp9FNHLzv0br9KypmYeqVqDj4XSEwM4dueg04xHQqVwnNFKsJ3EORvwuI/t
	gzZQtqS8JirEFQItmtZRTg+n3cuTMYsPWc9mmllDtK/GciFesr9KzK20F2+FGw2X
	ur9xClHw3h8J9bAHJzjZxE8UZFQNDvArIl5XdG/hu/F5tYmzg+rtREUet5mj8BML
	epVUIQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45h3ua0p4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 10:46:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 78CBC40055;
	Fri, 21 Mar 2025 10:44:56 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4DCE7C17CA;
	Fri, 21 Mar 2025 10:44:07 +0100 (CET)
Received: from localhost (10.252.27.50) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 10:44:07 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 21 Mar 2025 10:44:06 +0100
Subject: [PATCH 1/2] spi: dt-bindings: st,stm32mp25-ospi: Make "resets" a
 required property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250321-upstream_ospi_required_resets-v1-1-9aa4702e3ae2@foss.st.com>
References: <20250321-upstream_ospi_required_resets-v1-0-9aa4702e3ae2@foss.st.com>
In-Reply-To: <20250321-upstream_ospi_required_resets-v1-0-9aa4702e3ae2@foss.st.com>
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
X-Originating-IP: [10.252.27.50]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_04,2025-03-20_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_024608_734618_ADF7AAC6 
X-CRM114-Status: UNSURE (   7.61  )
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


