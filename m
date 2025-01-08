Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D8BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=smtjz2MWbY4Pc3cvI3V0Qv2Ac+AUvAjZmdApDUX6F/k=; b=pnOcQpgwVWQl7v
	Y0HKJDAyBuNF1WuK74FPWS/rwKy8seZKRxricCh/yZMcF5dYwoGlV5AMKbuvJ9sCNuxKZEHef6POS
	zu6KTHR7rVbGIEECXPHEvac1gVtsof/C7DSQhIjhzlqJzu1/5fqXFMO3yQO2De4ygw15/Cct1N6GL
	xIjgwtMwxqKMI5Vny9Onr5UeTZ4uEJbK4XYJGGc1EM1sC8sjgGdyIB+Som5yd6HwOP29r5Y6IdOcl
	tQnbTod2V59qAVL33I1AEgF64KVPmhAQI7Y3Ih7LQb6p7oiiURTE+2XIiNsQu00yoxeDLEEFJa5HH
	yuATfAxLqZohyxXfGFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWAC-00000008cZ9-273T;
	Wed, 08 Jan 2025 13:32:00 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVwo-00000008Zu1-2lpz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:18:12 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5089XEEX008924;
	Wed, 8 Jan 2025 14:18:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=smtjz2MWbY4Pc3cvI3V0Qv
	2Ac+AUvAjZmdApDUX6F/k=; b=DSXIc+F9xlB1Ue5EQRXDCxoBtNPskYUIFcsLFd
	FbrimWQScduTNX9iFWcRHAbdKGCLCkS4aNlP7lg3GPcJYp5fQLYwgVrDFKY4s0P2
	ER9zsAFQQx1I/2SW5bwlyHjVlV8I08qWLSTcg3fKL9LMJWZWTCEKORnVma1RJv0+
	TGkW0vOTM/k8PvNY630jt9j/iVno/2LPq/sh8a7p9xWReBU6halG+IAWwsIt9DRW
	GSXEjoYGW5rIVnPUfVoSGXigUlN1UdAdIGP67ee6YsOTgYbwtX8OKRMtSgAXipma
	cnDkSLUuOL4whcLMZKamFcOrwk1UqZ2MaBvvEX625+WKF6fg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441pu4rw6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:18:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C975640044;
	Wed,  8 Jan 2025 14:16:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D99512795F3;
	Wed,  8 Jan 2025 14:16:09 +0100 (CET)
Received: from localhost (10.252.31.140) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 14:16:09 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v2 0/8] media: stm32: csi / dcmipp corrections
Date: Wed, 8 Jan 2025 14:16:03 +0100
Message-ID: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJN6fmcC/42NTQqDMBBGryJZN5JMFbWr3qOI1GRSZ5EfMiIt4
 t2beoIu3+PjfbtgzIQsbtUuMm7EFEMBuFTCLM/wQkm2sAAFjQbdScM0WeMppcknaCcMZWbQY1h
 Z9gMqRKeHZnaiJFJGR+8z/xgLL8RrzJ/zbdM/+2d401JJmJsr9Kq1urN3F5lrXmsTvRiP4/gCA
 b96EcoAAAA=
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
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.252.31.140]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_051811_560032_390D52A7 
X-CRM114-Status: UNSURE (   6.82  )
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
Changes in v2:
- Correct commit message within the dt-binding commit, related to
  removal of bus-type property from the example.
- Link to v1: https://lore.kernel.org/r/20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com

---
Alain Volmat (8):
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
base-commit: 0e420e3a0a9a0d8d0b9d3d262baa240ef2369c88
change-id: 20241217-csi_dcmipp_mp25_enhancements-89e0eef194bf

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


