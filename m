Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD433C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2Wz+02biPobkFgq4687ds23RCGZHo5ebYaXPazcgac=; b=G+mLVYDLhTcDGMM+PJHa8LqRxs
	Zy+6rMfCdinQkYpNQY14UZEXfRcCvxMc9eOxmzTRjFPs99hKXhEFBFrQ67egFBnyuigkQYH5xwxjw
	b7+DN6i8xWzjHtnkahu8erqwp0RMtXFj86nAGg//L+2bYWzZfl6GGHILTR8pzOQ/ceIb7+UBaO3lb
	Ec9OMmaq29uy9uWYRFbCrPyvaoh4/ropJ4VNSrWwzegLbWKw7XzEtnHcPCMAYgnpnasmLXuwerKiN
	GtZQYQlnXl32nWtCY/K6IRTJHOq6Ig6a8CqVh2tvIz3ck1CCIL6Y5LtPtyMjWmHNcs3zlasmx/Hy9
	4iLdCetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCa6X-0000000EjTL-1eDW;
	Wed, 07 May 2025 08:26:13 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZC7-0000000EWlC-3jZw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:27:58 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5475tPOD018103;
	Wed, 7 May 2025 09:27:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	z2Wz+02biPobkFgq4687ds23RCGZHo5ebYaXPazcgac=; b=Hs3+pgg8FusUda+P
	uxcmX7XGetPt2IKMSb6nYiOSmwJwe39Qs+rU3AbHk98vY8sLq0Ecvbx9oD4SUKM/
	0rkFT/co2QkWcbctVRnhvSptIjpglNVeMI6iw04QMdbjOd+HlGEa0rjV36Zd60/d
	kxEvzgF9VOfmp+LUXae9OBTuZ6jmji4VNQ/huCM5h7OZUtWdUYvkdsbkPT6fuqFj
	aVikcnmCd96hOzk8zIdxTx020B/tZut3xlDI9DFwS2sNt0bs74chdFlu61ioLk19
	anMeeE37k50lhak9fc3s0oqwIi+/ji5JO/8MohaNtzxKPe1KnAr2zVQa41/MJaAP
	8CVSmQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46g1sx8cdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 09:27:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2EBBD4005B;
	Wed,  7 May 2025 09:26:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1142BACBA60;
	Wed,  7 May 2025 09:25:17 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 09:25:16 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 7 May 2025 09:25:14 +0200
Subject: [PATCH v13 1/4] firewall: Always expose firewall prototype
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250507-upstream_ospi_v6-v13-1-32290b21419a@foss.st.com>
References: <20250507-upstream_ospi_v6-v13-0-32290b21419a@foss.st.com>
In-Reply-To: <20250507-upstream_ospi_v6-v13-0-32290b21419a@foss.st.com>
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
	<will@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_002756_453512_D66AB696 
X-CRM114-Status: GOOD (  10.57  )
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

In case CONFIG_STM32_FIREWALL is not set, prototype are not visible
which leads to following errors when enabling, for example, COMPILE_TEST
and STM32_OMM:

stm32_firewall_device.h:117:5: error: no previous prototype for
‘stm32_firewall_get_firewall’ [-Werror=missing-prototypes]
  117 | int stm32_firewall_get_firewall(struct device_node *np, struct
stm32_firewall *firewall,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/bus/stm32_firewall_device.h:123:5:
error: no previous prototype for ‘stm32_firewall_grant_access’
[-Werror=missing-prototypes]
  123 | int stm32_firewall_grant_access(struct stm32_firewall *firewall)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/bus/stm32_firewall_device.h:128:6:
error: no previous prototype for ‘stm32_firewall_release_access’
[-Werror=missing-prototypes]
  128 | void stm32_firewall_release_access(struct stm32_firewall *firewall)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/bus/stm32_firewall_device.h:132:5:
error: no previous prototype for ‘stm32_firewall_grant_access_by_id’
[-Werror=missing-prototypes]
  132 | int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/bus/stm32_firewall_device.h:137:6:
error: no previous prototype for ‘stm32_firewall_release_access_by_id’
[-Werror=missing-prototypes]
  137 | void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Make prototypes always exposed to fix this issue.

Cc: <stable@vger.kernel.org>
Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 include/linux/bus/stm32_firewall_device.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
index 5178b72bc920986bb6c55887453d146f382a8e77..ba6ef4468a0a8dfeb3e146ec90502e2f35172edc 100644
--- a/include/linux/bus/stm32_firewall_device.h
+++ b/include/linux/bus/stm32_firewall_device.h
@@ -35,7 +35,6 @@ struct stm32_firewall {
 	u32 firewall_id;
 };
 
-#if IS_ENABLED(CONFIG_STM32_FIREWALL)
 /**
  * stm32_firewall_get_firewall - Get the firewall(s) associated to given device.
  *				 The firewall controller reference is always the first argument
@@ -112,6 +111,15 @@ int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsy
  */
 void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
 
+#if IS_ENABLED(CONFIG_STM32_FIREWALL)
+
+extern int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
+				unsigned int nb_firewall);
+extern int stm32_firewall_grant_access(struct stm32_firewall *firewall);
+extern void stm32_firewall_release_access(struct stm32_firewall *firewall);
+extern int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
+extern void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
+
 #else /* CONFIG_STM32_FIREWALL */
 
 int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,

-- 
2.25.1


