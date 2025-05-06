Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38EAC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 07:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJlHhbxitP8LDlQxS4M+ZJIc/lDJOqTIWiKvF63v4os=; b=ZTwf2QKe33+KTItMlygtQM3BxA
	Jjat4cu0eJU/ggM53PSx8ULWLojKOTqo7lZvvcKvKfPo2YTfAV+jZxVvYmQaCY9AO10jHq4Ruk+C4
	deakKvdWjK6xlwJxwTj5CYLYV476hRZK9neRxsLxJl171KPz+bWdl7B5erq/o491zxsBESE8oQTvL
	kJvYvDX8ZXdVjCJKMePKYcSe0oI7IVJDTiGmtWyVsUVB1atC15LMkTliZBVBBe3SxhmIpw/4rtsDQ
	ptZJDkek+NJHtKJbMk+WyefhbEROOVGDuqbHZW6qmwxddstZtXx8FdHcEKmUGlCEpTlfqEUpoYgQs
	jAdivBAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDA4-0000000B33u-1whs;
	Tue, 06 May 2025 07:56:20 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCD87-0000000B2a2-09Tl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 07:54:21 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5467Ubtt008940;
	Tue, 6 May 2025 09:54:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	hJlHhbxitP8LDlQxS4M+ZJIc/lDJOqTIWiKvF63v4os=; b=jrcdU3ZW0WY601N/
	HKQm4zkcPSpK/2HhYGNS6P+cZIAspikctNaK8Bupur9LdsWhHKhMT76kU3j7sqnx
	hhifg05xPGg+Wct8vBY4rRTnrJU7synIS3KWa7HJdIxY5p+UaFfY+JFQrpvWOq5v
	iwcaEHZ421ioRpLTaJUC5Urvesn7bHUjEFlw8svoorKyPsVr0sA6ozSizAmGkdAN
	8kdv4vajIOvMvUJDmqSpuFbM8dQFiB4eCwrK7VHHixR/iN/uT/xS1CeotxI22HnH
	lsv7LHaMIFmcUV984CTzpE9eS9ZEcjdZ9a1GjAZoyatfHzWWMiE48MDpPgyjpkRj
	YqqhVg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dbeksw9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 09:54:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 36B0740056;
	Tue,  6 May 2025 09:52:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C72BAA7A4B6;
	Tue,  6 May 2025 09:52:04 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 09:52:04 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 6 May 2025 09:52:02 +0200
Subject: [PATCH v12 3/3] MAINTAINERS: add entry for STM32 OCTO MEMORY
 MANAGER driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250506-upstream_ospi_v6-v12-3-e3bb5a0d78fb@foss.st.com>
References: <20250506-upstream_ospi_v6-v12-0-e3bb5a0d78fb@foss.st.com>
In-Reply-To: <20250506-upstream_ospi_v6-v12-0-e3bb5a0d78fb@foss.st.com>
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
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_005419_576588_B7DE9A35 
X-CRM114-Status: UNSURE (   8.76  )
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
index 96b82704950184bd71623ff41fc4df31e4c7fe87..32abd09c0e4309709998f91882c7983d1b53a80c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22881,6 +22881,12 @@ L:	linux-i2c@vger.kernel.org
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


