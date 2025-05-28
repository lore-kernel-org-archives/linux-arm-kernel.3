Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57E4C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 13:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOKCvrg9T946MeKb54UlHJZ6LDnhr4kD9B8NCELZ49s=; b=jKDxPN8rn7BQ9aH1Mtlf4hX+a7
	Q82wVW6ylWAmOsYWdfY9vlxK4NkirIce5FE4U6Rt2eRm+7ATX0P6ERR1UEHFrCNTmlyaPYrUUw4xC
	Sd2RSvcp+tip/85uJDWNNDQNjUsL7UHJ1QYEP5dE7LgB3dVCYZLnzYVK52HI4AgYbuwrVELTkMZF5
	W3U35RABWhsEppVFrrhjwNgXgOzAL17aKf9av9Rf6uqc7xDQUAL2x94naDaOPVmWAC3rrZZd8WrtS
	hftbVGljAe+XvwoUwdcmaWZ9dWDILsBMMWU9qByScD9Bn5FZoyWtq7P2NfabBTG/gRfg1oDSRhtUv
	PknEhvrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKH2g-0000000DGet-3ZJE;
	Wed, 28 May 2025 13:42:02 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGuC-0000000DFiy-17bF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:33:17 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SCXnlC019251;
	Wed, 28 May 2025 15:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vOKCvrg9T946MeKb54UlHJZ6LDnhr4kD9B8NCELZ49s=; b=bcd8cvsK+mcjyYwr
	BG8kIBEUsHAZLder+fY5vncgL2M9lQI8otrEzOVGGF9Cz+gpQcXi2zh+7i/fHChD
	wJZ16YghCKv19E6OmgefAhGEOGOUHeBeeCcP0JFMiCoci4/TtgAs0upaBl8GPdmL
	EixYoeIEyAVI5+iJm6qDNlaUKVutUS9l7M2StK5NcNW9OMJ2J8Qa+v0hpgW99lsC
	NHZOPXiwlG/xB78O0HMLglkeEtxlwBd3uJVehWVhLmKQ4e5FE1985fCw4v537pCN
	UpLlNiamFfPQWEmrbiKuUES5Jzi5BeR15aGFogNVwsGA3uyfll9PD5/RAactdBtm
	Zkonwg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4quvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 15:33:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E1FF340051;
	Wed, 28 May 2025 15:31:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 419386CB808;
	Wed, 28 May 2025 15:31:03 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 15:31:03 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 28 May 2025 15:30:57 +0200
Subject: =?utf-8?q?=5BPATCH_v4_4/9=5D_MAINTAINERS=3A_add_Cl=C3=A9ment_Le_?=
 =?utf-8?q?Goffic_as_STM32_HDP_maintainer?=
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250528-hdp-upstream-v4-4-7e9b3ad2036d@foss.st.com>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_063316_620181_DC888ACC 
X-CRM114-Status: UNSURE (   7.08  )
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

Add Clément Le Goffic as STM32 HDP maintainer.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f21f1dabb5fe..c0c30fe00a2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23023,6 +23023,12 @@ F:	drivers/bus/stm32_etzpc.c
 F:	drivers/bus/stm32_firewall.c
 F:	drivers/bus/stm32_rifsc.c
 
+ST STM32 HDP PINCTRL DRIVER
+M:	Clément Le Goffic <clement.legoffic@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
+F:	drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+
 ST STM32 I2C/SMBUS DRIVER
 M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
 M:	Alain Volmat <alain.volmat@foss.st.com>

-- 
2.43.0


