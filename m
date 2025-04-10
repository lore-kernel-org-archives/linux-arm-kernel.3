Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63EEC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdOJrtk7Bjg1N0a/4B/OcJwqMOvdgRg20C9nexae3nM=; b=LUC9Mbf6nApwAFYqWvdyuHLJKM
	MaK8mnMls0KE54nvaQk6bzwRmWI6LFHzkmSten4noHmMSn2a2oiM13UZgX0SdqxLAmFZDBwVa7E9c
	iyhpUbPd8MtYZLVsMIG0z6zOMhjIksnxiMSqXI4+Lmk+yU1WfFkoph1m+iYKrjySdiMITrP/wRSPG
	J/b2zaG+Q0UBQH1C892NoXm1iQOonAuJ+b6CGTXN/aFi3baw76jgJvYECYuROFei5ZEwW4jtYnu2M
	ZlwfHZ1tZMDdAVyJ/Ch8jVHll2Sun7H0EYvoqb3HvlfjP0SNZLt+NRmOD4gamktVZiYgaGiZC6RfE
	Ry13PH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r1z-0000000AUz6-1GO8;
	Thu, 10 Apr 2025 12:29:19 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qxw-0000000AUM1-2sA5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 12:25:10 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A9W2Lj019490;
	Thu, 10 Apr 2025 14:25:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xdOJrtk7Bjg1N0a/4B/OcJwqMOvdgRg20C9nexae3nM=; b=d+sQH8F0pTPSdeS6
	SE9YkM+v1RteMI9+ShFlQlLP614yiwgMoI/TYGoA7a+kCqsCdsTUeGaWPksC1/ik
	H83TYbP7KEEoSoeK/CXgPqbt9uISnx6qzxR0nT49nVW4EdRA1pb93is80wd2HKb0
	0oxowXQHcdPyP82n5J2hC1ew7qiNMjBvgn3v7RxDXu0YHVe+flz/Kb7i2SGuPv6H
	qD4vAFITdkg3gVGAE60dwVhKy1bGUrt4uBOupSFscu1WmyR+L3+jRRp/r07ajQLc
	CBY1GouHp/ScNuHiUaYD9tlSbr5i2cLTqwnLPr+pLvDR4T38w0VMSdOPyuV6f4Xw
	WEdc8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw6eqma9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 14:25:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AC52240046;
	Thu, 10 Apr 2025 14:23:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DE319FC736;
	Thu, 10 Apr 2025 14:23:46 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 14:23:46 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 10 Apr 2025 14:23:44 +0200
Subject: [PATCH 1/2] reset: Add
 devm_reset_control_array_get_exclusive_released()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250410-b4-upstream_ospi_reset_update-v1-1-74126a8ceb9c@foss.st.com>
References: <20250410-b4-upstream_ospi_reset_update-v1-0-74126a8ceb9c@foss.st.com>
In-Reply-To: <20250410-b4-upstream_ospi_reset_update-v1-0-74126a8ceb9c@foss.st.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
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
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_052509_012561_7D534F32 
X-CRM114-Status: UNSURE (   8.24  )
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

Add the released variant of devm_reset_control_array_get_exclusive().
Needed by spi-smt32-ospi driver as same reset line is ulso used by
stm32-omm driver.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 include/linux/reset.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/reset.h b/include/linux/reset.h
index 2986ced69a026947c8aafa89cdddf1e4088caef7..840d75d172f6239540bd12ab701103b7f02a624b 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -1004,6 +1004,12 @@ devm_reset_control_array_get_exclusive(struct device *dev)
 	return devm_reset_control_array_get(dev, RESET_CONTROL_EXCLUSIVE);
 }
 
+static inline struct reset_control *
+devm_reset_control_array_get_exclusive_released(struct device *dev)
+{
+	return devm_reset_control_array_get(dev, RESET_CONTROL_EXCLUSIVE_RELEASED);
+}
+
 static inline struct reset_control *
 devm_reset_control_array_get_shared(struct device *dev)
 {

-- 
2.25.1


