Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3275EC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 18:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwWYLVWIQhsieK1q3dXMnApygXnCasOaR3eXeKwwLbg=; b=KpnY49cRqTDd/HFORjWcTemCCZ
	3la4n9MuoMAgFMwDDFQD4iQI4duOohdmvVXVJXj2Pq3X9E0BQOtQfp6JG2+/FBOOKvbOvqTQUYtn5
	tmqZGj3nUS2Ac64wHSQ7EyZ0C+pCIT9XhIlm6olNuxlS53DAHe40sTS+EeKsi39XDCSYdUriV9UbD
	NLdWS1nKwjFXyOgdtMpLNbFBMxOPwn2qgKLbmJhRgbTlce3KtTdyZLP/dvpBA/B56NQzm0mpUk5Zf
	z9k0tyyNT6TWX37YJ4bm/IaIZuykhm3Ijd6BNQDiE29kIcSncoHWKwf1zTA2Xt3yDxwRoROY7cVHr
	UgdNS4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrEI-0000000CRp1-0j2S;
	Thu, 26 Jun 2025 18:21:46 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrC0-0000000CRXr-1YFo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 18:19:26 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QFGTks002802;
	Thu, 26 Jun 2025 20:19:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	iwWYLVWIQhsieK1q3dXMnApygXnCasOaR3eXeKwwLbg=; b=EFxqX0paIInigNMC
	Lult3CNQIgGNpz/CMYXvaf4nWki/zJeuf09OhvRyA7NgA6dfMGw/MCjzEBzNyZNd
	K34MexBZqrODKVW8MyLhwqPRdz4zhf+nFqBsfQmBAjq3XdjoeBvCKScPsJNDw1MN
	6Qj1wycRm2Yk7HchrzyVH5tmQ/j82bgILGKpYssIHRsS7FPOmz3Cb9/rm6fing8H
	1MBgkbEalSNy5CR3eFUFZDEQWCNKwNkivxMFD7tf9/Zb4QB4kuB5cY1bJyv8OA3v
	rxL7v21giBEqNuhFMmsWewZw04JqJo3a+LEOqNaOi2dskq9/gjgsPf7joT5Efy6V
	L+BRsg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e7ppn922-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 20:19:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F24B640059;
	Thu, 26 Jun 2025 20:18:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A408BAE270;
	Thu, 26 Jun 2025 20:15:43 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 20:15:42 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linus.walleij@linaro.org>
CC: <linux-pci@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH 1/2] pinctrl: Add pinctrl_pm_select_init_state helper function
Date: Thu, 26 Jun 2025 20:15:36 +0200
Message-ID: <20250626181537.1872159-2-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626181537.1872159-1-christian.bruel@foss.st.com>
References: <20250626181537.1872159-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_111924_893021_879ECCC0 
X-CRM114-Status: GOOD (  11.69  )
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

If a platform requires an initial state during probing, this helper function
provides the client with access to the same initial state used to balance
from a pinctrl_pm_select_sleep_state .
eg:

 xxx_suspend_noirq
    pinctrl_pm_select_sleep_state

 xxx resume_noirq
    pinctrl_pm_select_init_state
    ...
    pinctrl_pm_select_default_state

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 drivers/pinctrl/core.c           | 13 +++++++++++++
 include/linux/pinctrl/consumer.h | 10 ++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 9046292d1360..80cf9f20f626 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1655,6 +1655,19 @@ int pinctrl_pm_select_default_state(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(pinctrl_pm_select_default_state);
 
+/**
+ * pinctrl_pm_select_init_state() - select init pinctrl state for PM
+ * @dev: device to select init state for
+ */
+int pinctrl_pm_select_init_state(struct device *dev)
+{
+	if (!dev->pins)
+		return 0;
+
+	return pinctrl_select_bound_state(dev, dev->pins->init_state);
+}
+EXPORT_SYMBOL_GPL(pinctrl_pm_select_init_state);
+
 /**
  * pinctrl_pm_select_sleep_state() - select sleep pinctrl state for PM
  * @dev: device to select sleep state for
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 73de70362b98..63ce16191eb9 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -48,6 +48,7 @@ int pinctrl_select_default_state(struct device *dev);
 
 #ifdef CONFIG_PM
 int pinctrl_pm_select_default_state(struct device *dev);
+int pinctrl_pm_select_init_state(struct device *dev);
 int pinctrl_pm_select_sleep_state(struct device *dev);
 int pinctrl_pm_select_idle_state(struct device *dev);
 #else
@@ -55,6 +56,10 @@ static inline int pinctrl_pm_select_default_state(struct device *dev)
 {
 	return 0;
 }
+static inline int pinctrl_pm_select_init_state(struct device *dev)
+{
+	return 0;
+}
 static inline int pinctrl_pm_select_sleep_state(struct device *dev)
 {
 	return 0;
@@ -143,6 +148,11 @@ static inline int pinctrl_pm_select_default_state(struct device *dev)
 	return 0;
 }
 
+static inline int pinctrl_pm_select_init_state(struct device *dev)
+{
+	return 0;
+}
+
 static inline int pinctrl_pm_select_sleep_state(struct device *dev)
 {
 	return 0;
-- 
2.34.1


