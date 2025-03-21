Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8450DC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 09:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+aM4v81IIJ0lXB9aqI4mX4YkHUFBD7dtY0uixMWUn8=; b=GVzrEz8IcIlDXzYWFF/PSNAFiH
	KM7eJOKSrwU3P2BfF/DFfGGOP9VH0UBYEsWpG2l8DhtWPYZSmG2p9kBfKumb6lfCHQSOpFdQv3Atb
	k/SUrpz4FyAHaRSoqQt08tHqd7VN848M8TQs7Yoy5ypJIb3XW2x6jWTXbXDDqR2GVEYv4DDPN2eB+
	hbLI6lJFgLNipITacOUwLwI7IH3AyX/3CIc0dtwRqhChKK0YUJEbqmu+TJjumVVXYCS/UIOFnjOAO
	zOU9u6UeivPx3Id8fxGy8cPAYdlancwFv8w3AaBLxgoloH3qYGEiHzABxqb0My6iiVCyaVS/T6yf/
	20VwvIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYna-0000000ENzN-0iA2;
	Fri, 21 Mar 2025 09:36:18 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYlt-0000000ENQX-16Ry
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 09:34:34 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L5Gbxc007262;
	Fri, 21 Mar 2025 10:34:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	6+aM4v81IIJ0lXB9aqI4mX4YkHUFBD7dtY0uixMWUn8=; b=4yazo+tkF8P4OFe9
	U3XTY82QV7IrMlmNtViDse/Xq9IK3M9D2gKvT4Kl+NX4ZnLIjhUz+laJwa4kWsGV
	YbkCo8oJmlmTzWHOR2Qkngy8ohc1mXYgD6qWc7hewChHzlozzU/o7xU1XS4IVuIx
	+bwAhx4niwjlxvN2VHO4oLapyW+0DHmA5spFEyjex1iDKGt3Wu2SIDjFSE7M/VGl
	Bh0268QHu3QT9oLAXautra5Jp8+tYS4pROmIRdzc1CJvc3rpzhww7t1OoUUtCvYG
	CEx+A8gNxkfwXuy80RbfER1r9ueQTcMdfw72I6i3gwMgoEpNqihEQGOWSLNF11vA
	R2g3Mg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45gh76vnpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 10:34:24 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4C70940058;
	Fri, 21 Mar 2025 10:33:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 858D27BC006;
	Fri, 21 Mar 2025 10:32:26 +0100 (CET)
Received: from localhost (10.252.27.50) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 10:32:26 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 21 Mar 2025 10:32:21 +0100
Subject: [PATCH v6 1/7] MAINTAINERS: add entry for STM32 OCTO MEMORY
 MANAGER driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250321-upstream_ospi_v6-v6-1-37bbcab43439@foss.st.com>
References: <20250321-upstream_ospi_v6-v6-0-37bbcab43439@foss.st.com>
In-Reply-To: <20250321-upstream_ospi_v6-v6-0-37bbcab43439@foss.st.com>
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
X-Originating-IP: [10.252.27.50]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_03,2025-03-20_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_023433_813567_D6695881 
X-CRM114-Status: UNSURE (   7.89  )
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


