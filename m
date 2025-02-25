Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0453C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 08:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOcN9TjJ8kI82gXu1mJ0KoE7660yxLYsGvX6pzPGc6M=; b=dr2h5M2wyISizlcve50ktBLP11
	QUu/DcR7LFpUz02I8ETEwJAluFyDRYfA9yhJRqNVS+p3YRiqTUyJPvLhu2jKOP4+wbzo3sLkI2vy6
	aUF6xg5XojoqeTisYo2pw/yfLlpIkH8J/kcmTc1UwS8LpKAgQ7HAYkc9joS1wMLUUuRhgMqCsD5DY
	zvRbwDcjjIs1vOjeaEj42YfSCOJsjuCB9xSFkgdunDDOhZ8dLxLUD7iyDDOIPagm6SJznbQlQ/2wc
	IMH21XpmOPi4kYCGQ98ch94iKA2MlAHb/v6/OIKbtCPRROLmqU9zekSO5VxFcezECXHaVkSe0Hxvm
	MmC4vbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqkE-0000000GU02-0w81;
	Tue, 25 Feb 2025 08:56:50 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqfi-0000000GSvz-2O9w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 08:52:13 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7lqX8000766;
	Tue, 25 Feb 2025 09:51:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	oOcN9TjJ8kI82gXu1mJ0KoE7660yxLYsGvX6pzPGc6M=; b=dkV29SQM6ZNk+Qk/
	/NLjgIYrZvKlWsXeVLRuhdIQ95Gw80kJazNCkVA0N7x23a/AnkwqkaRxgVh5gcqv
	/YlGBypnLfElDcDckb2DDS3c4C2wISumpmML3fEjyiZ0PnPHT740vGYiej1JETsw
	7t29MPKVS2l9XuYqv81NmTxfi6QTNb0SSn+QrQW57ivMu5PYi7iuq+76cK2DTSYZ
	enLi2bYgqbNdgKGRNbFu6LaldbmM9g08XukVk96h//S1UZP40Zco0p2WBOq5m4KV
	DvLiJ38IRgikka7z0PRfeXB9AqNdewa0AHtbwLTI3kvoHaczlIepGzQhLtPB7n2z
	PHxhyw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp1t46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 09:51:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1BB2E40058;
	Tue, 25 Feb 2025 09:50:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DEF0A47A7B2;
	Tue, 25 Feb 2025 09:48:08 +0100 (CET)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:48:08 +0100
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 25 Feb 2025 09:48:03 +0100
Subject: =?utf-8?q?=5BPATCH_4/9=5D_MAINTAINERS=3A_Add_Cl=C3=A9ment_Le_Gof?=
 =?utf-8?q?fic_as_STM32_HDP_maintainer?=
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250225-hdp-upstream-v1-4-9d049c65330a@foss.st.com>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
In-Reply-To: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
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
X-Mailer: b4 0.15-dev-42535
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_005210_907135_D2E337DD 
X-CRM114-Status: UNSURE (   6.90  )
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
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea589f..c277b10cf48b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22425,6 +22425,13 @@ F:	drivers/bus/stm32_etzpc.c
 F:	drivers/bus/stm32_firewall.c
 F:	drivers/bus/stm32_rifsc.c
 
+ST STM32 HDP PINCTRL DRIVER
+M:	Clément Le Goffic <clement.legoffic@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
+F:	drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+F:	include/dt-bindings/pinctrl/stm32mp*-hdp.h
+
 ST STM32 I2C/SMBUS DRIVER
 M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
 M:	Alain Volmat <alain.volmat@foss.st.com>

-- 
2.43.0


