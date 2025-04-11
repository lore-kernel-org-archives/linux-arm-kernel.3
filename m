Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A7AC369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/qj+1FHk4j+w1iPbMRgLM3/B5q9ZRu15dJ+f+b8Lbk=; b=s8cGLI6FUb/66Mje3NXRia0Ffj
	KYmB+CG23xtFCIVzhO3q8DWw8BDyLr14X0d6YoCYgwvJGAsVmWLATCfMVDKNEamLvlonkNgIzQ2gY
	2vE9NbFJP6FLCiDj+pare+Fam8ScL0LT7Y8BxYE336h/su242Ep9ZITFqU8Pmx7AY7zQumdTFj0Zh
	u3EkqY3DrPfEESCAVmR3FmogYedlMKcYqDbCcxc9k7qfYlNmuUGCluoV4gx/zQn99sjCcr+nCH5uv
	g1NlRKFgUDEQUXwjauOOtYznB1SfEzYRXcv19+DZmmQPUyLfBiBzCHhmykWOYdwq4LhE+YsWv3aR1
	p5RKBKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EFg-0000000Dsio-2qoN;
	Fri, 11 Apr 2025 13:17:00 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dk8-0000000Dmle-2ptF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:44:26 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B9MoLV017592;
	Fri, 11 Apr 2025 14:43:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	n/qj+1FHk4j+w1iPbMRgLM3/B5q9ZRu15dJ+f+b8Lbk=; b=FhLWvgGxIe3Ysmp5
	s27Tyc0xggGXBVlmhGOeiLyv2afBNUdObUCeYRKzss3ACkt3lHHABc5jSnNczeid
	NuELhGDqJgh+DZ5XejXorlyTyvVzbXgnIxnJyqQhpvt51em3/FwHkCUCFNjeBveF
	GzLjwQ7VC0ru+cy8sFsMtkY1fPsLoGpeCNXNTeDFR+afcoetQJcSCXvFnYT/lA5R
	1SeTO9C0VvnErSClZqh+9WK91krnZ8H31n0zHANVnOmQTshc6m4rli6qX81A3O/w
	o8KfUyCd6LlP+sYioyap3wfsLWjGIXjprG6jLqPGcXp6ZA43hAl9EWEtK8NvVjOQ
	LTeqng==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw5gp2s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 14:43:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 56E184005C;
	Fri, 11 Apr 2025 14:42:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 01CF69EC283;
	Fri, 11 Apr 2025 14:41:13 +0200 (CEST)
Received: from localhost (10.252.25.37) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 14:41:12 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 11 Apr 2025 14:41:10 +0200
Subject: [PATCH v2 1/2] reset: Add
 devm_reset_control_array_get_exclusive_released()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250411-b4-upstream_ospi_reset_update-v2-1-4de7f5dd2a91@foss.st.com>
References: <20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com>
In-Reply-To: <20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com>
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
X-Originating-IP: [10.252.25.37]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_054425_015000_C30044DC 
X-CRM114-Status: UNSURE (   8.23  )
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
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


