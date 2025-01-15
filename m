Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FED8C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aM0Y5eexJjB6Wzg/lesuXq3ipDaQf+BsTx1LkmjE7Xk=; b=VGm0ixWoRRtauI+1JDqP/N6bPs
	NRzQ7Ssx/3SPSYqMvPSgFzDBhrEFPRNyn9CfndbpQcfklHA1gaphh06Lz9luWKedCNNbXuQ2O7l4f
	IT/NBbzkfanvo6xCAFoMVqWKo3sPM0/qsXaRQVM+5y6QtfFIxO0HZi2ynirYSqbLnZvzqKXQFwzNU
	RnXRkAxeot7QCJU69xeypaaO0Ny93N5nK2V6bNVfXImDaED88Bw5wAQGwQA+CK39Yy7KYIq8fbYoN
	lq7Ll4Cq5hNBIozJ+0aGGkxgE+uUZfPqgu7cVRBfssFIEfzGIoD+EFAeYPzRuo+ewBWmBYuLvfqrT
	16JUNLZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzql-0000000BMw2-1Sv5;
	Wed, 15 Jan 2025 09:38:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzff-0000000BJVi-4BPl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Jan 2025 09:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aM0Y5eexJjB6Wzg/lesuXq3ipDaQf+BsTx1LkmjE7Xk=; b=d5YnAzT6XWULmrFUm8Snkkt/ux
	4gzv+fo1p0f8vvpeslYfjQdLLFpIGRiTsUEP2gvqc+KlKkNHvdzf/qdegoGQSERy4YuSSLlkq/8rC
	0yx4rTfHrgSbWK0KX7TKcNNcYHxr+cpPY9M5282TX4BmkNml4r5TBDPblwNXnwSiZZtQ6gXyKyXlf
	C+2h1NCSCKgA+WQB/fvbBKFK4zANmUVSGU6aoBHcIrIiy9tCJWwUWY2gF6USZjpPw5dbDMERYGReT
	sa1tbJky4Guoj0ASZbK7eUCJrURp3VDaqXRzOZEZO+GvnTRUH2ocGhFgYK5wfKCVCcLZOM7blc9nh
	O9l5yx2g==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzfc-0000000ApHw-3Uqi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 09:26:42 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F5MPv7014624;
	Wed, 15 Jan 2025 10:26:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	aM0Y5eexJjB6Wzg/lesuXq3ipDaQf+BsTx1LkmjE7Xk=; b=nhfAZfdRy2YfuWr8
	kSTkaaqP8bE0qaUeMpXm5NrWXWU5sjk1yK4hroUQrik6xb3YpaY8poFkEMBgSEUe
	v4TTBI215Xw4+WLwExGXoczfHHKdS8GT7nTvpPJuP0Q8u/Q1ui3BvJE4SlkhXW9+
	qqOckNs/bEqILp0isctU1tc/FkagVnGwmuc1xrr5xUDKbMMFhdFHTcn5k0dWOrmO
	/F6AoWZeccJohGGhY2ThZI0ltzYYOqqYch6cy3HnCVYEJMjCzMwzUbCWx//lgMy9
	pFWJ7iZeuFa0D5E6ytamyxGHgZOr9MIh0drsJuUdGL61CoS8YsAs4y1Od12btTui
	XCYJgQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4466tjrxrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 10:26:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D8E5540058;
	Wed, 15 Jan 2025 10:24:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B720246974;
	Wed, 15 Jan 2025 10:23:44 +0100 (CET)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 10:23:43 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <bhelgaas@google.com>,
        <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <jingoohan1@gmail.com>, <p.zabel@pengutronix.de>,
        <johan+linaro@kernel.org>, <quic_schintav@quicinc.com>,
        <cassel@kernel.org>
CC: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <fabrice.gasnier@foss.st.com>
Subject: [PATCH v3 06/10] MAINTAINERS: add entry for ST STM32MP25 PCIe drivers
Date: Wed, 15 Jan 2025 10:21:30 +0100
Message-ID: <20250115092134.2904773-7-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115092134.2904773-1-christian.bruel@foss.st.com>
References: <20250115092134.2904773-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_03,2025-01-15_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_092641_039451_7E871AA6 
X-CRM114-Status: UNSURE (   8.66  )
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

Add myself as maintainer of STM32MP25 PCIe host and PCIe endpoint drivers

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ed02ff7d5ab6..2e5845f11a21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18108,6 +18108,13 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	drivers/pci/controller/dwc/pci-exynos.c
 
+PCI DRIVER FOR STM32MP25
+M:	Christian Bruel <christian.bruel@foss.st.com>
+L:	linux-pci@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/st,stm32-pcie-*.yaml
+F:	drivers/pci/controller/dwc/*stm32*
+
 PCI DRIVER FOR SYNOPSYS DESIGNWARE
 M:	Jingoo Han <jingoohan1@gmail.com>
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-- 
2.34.1


