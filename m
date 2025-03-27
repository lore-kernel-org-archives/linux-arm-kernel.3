Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB97C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 08:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4spI71XBW9TktNPtgUKlhmqprWhHOZmJMEc8QqOQvcI=; b=pry8fYNFjuqz1fE14YQsRtvhAK
	Qq9FBdvvuz8gu6hiG/fT4/TN1SItRi1vT9BZ5s1X6GXFd1oVI+OQ+Hcv67VPKQzIt0Hk8ToHMTw9r
	hpcfNfsWZPGfvOPXO9x4g0EBhxWqAtUksn11JyK8cFj7v039GWZkCm1IIQXWoS95tycLI+hSIVs2q
	wScfBLsJRM6XFA2+0qEj/WwuEH9xRz2z9g5DJmODOYo+3okhY1SUo4Sl02LgjngC1Pve8r8aGn8uF
	OjGexPpLY/mmFTHqEC6+UKVeFua0kOkjnygnmnP+TlabJJc4bEw0aU6KDIEcK5QOigoMXAqJChyr+
	LHvm3GIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiii-0000000ATAl-0LvN;
	Thu, 27 Mar 2025 08:36:12 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txid3-0000000ASWd-37Zr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 08:30:23 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R89RxZ028645;
	Thu, 27 Mar 2025 09:30:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	4spI71XBW9TktNPtgUKlhmqprWhHOZmJMEc8QqOQvcI=; b=2RpZwxSO5XM74kUR
	Xd7QhwnrX0ayzf9nUUJP8QHePjZSkMTl+SZTM3AQCk4kji6BvhVuo5Iuickozzlp
	dMKeUW0lf/fAL7nyg2nIrhmfcWF11Zrj1o+z5cu2JCkhYCY3xB6qZNHOz6xie9nJ
	TsS2rZ5qhWEYNzn8wnhONGr8dNeQt/Ya9QJK9cXHw5TSlo9W2JcMcDIVaWDzo57u
	l+FN3waH2aV3VvdJ2DDqOrmoWUrp91x9SamMgIRohF7owMqjZKNUjjgtT6bVNQUg
	5HZPO6veSDHT4KyBIHQv5IS1UWfqE0tRuohu7pZfdUcuWnt+qSWfy+WDwSm07CbF
	oQTMbQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45hkgrtt26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:30:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 14E3F400B7;
	Thu, 27 Mar 2025 09:28:59 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55E368329E1;
	Thu, 27 Mar 2025 09:27:34 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 09:27:34 +0100
Received: from localhost (10.252.3.68) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 09:27:33 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 2/2] drivers: remoteproc: stm32_rproc: Allow to specify firmware default name
Date: Thu, 27 Mar 2025 09:27:21 +0100
Message-ID: <20250327082721.641278-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250327082721.641278-1-arnaud.pouliquen@foss.st.com>
References: <20250327082721.641278-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.3.68]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_013022_072778_2074A0E5 
X-CRM114-Status: GOOD (  15.05  )
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

Enhance the stm32_rproc driver to allow enabling the configuration of the
firmware name based on the 'firmware-name' property in the device tree,
offering flexibility compared to using the remote proc device node
name.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/stm32_rproc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index b02b36a3f515..431648607d53 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -835,6 +835,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_rproc *ddata;
 	struct device_node *np = dev->of_node;
+	const char *fw_name;
 	struct rproc *rproc;
 	unsigned int state;
 	int ret;
@@ -843,7 +844,12 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
+	/* Look for an optional firmware name */
+	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return ret;
+
+	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, fw_name, sizeof(*ddata));
 	if (!rproc)
 		return -ENOMEM;
 
-- 
2.25.1


