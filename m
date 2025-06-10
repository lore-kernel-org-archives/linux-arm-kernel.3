Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF67DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+ZXpV4BuIsMc3QUoJ0VAAjnTmM9QAGHI8YQX/Zc9Mc=; b=Li4RO6IibZ37J7e3AQgO3HKqJu
	F8ySWO5YF+pfWadq6UmDsiWjwOXXR2XDsrfIOYcfa6YNQuL7WPDtY26B2S9cEFkd7teABVhJPXCwZ
	Ny+pfRHHM75WWoaZkoIGxWa4juZ92fRj1z6/UoXgsLZlSr0YsIdxH66lnjwOOx+/1vLhCZ1ysgCiY
	LiQnuEa3VqlNvMHmDRi0ZDkMthlVst0djFJkvlvjNPYZ9G6yPyu+ol1vw2fZ2tEhRAYNT98HYzoaH
	U/go58w3mhJQe2gK2G2MPeuzylC2mYnH+PSCDEzCzZpdIYLke6OdpZgfTUu1ld8w4EqddnJsZ1wx1
	EsPyDDcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3pa-00000007ogU-117Q;
	Tue, 10 Jun 2025 18:36:18 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0qK-00000007It5-3opY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:24:54 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AF1VY0031553;
	Tue, 10 Jun 2025 17:24:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	B+ZXpV4BuIsMc3QUoJ0VAAjnTmM9QAGHI8YQX/Zc9Mc=; b=vOrEkKb/p3NVqL6F
	6jH1eya55lRO3KyQR+wQ27u5KZTW9PWzO8ifrfzUfnm4n9oaGVol3Jx0YLxxruO3
	YanbSukWtX8lbpAhn2QnE8y2ovHqDmGyjMqmcTCyVbVNP8ovwXNn8AsTUDd1luO6
	rU3ue/YiqjpMaxVcwZZKgrJsMi4M3WG/iuuDlBfrrd6Hqk+xZrXxGPEykdvq7smY
	/+o0xnHn7kD5iHO7yRpl4Vn7nQsznuRcqKKOEnoB+2hdWkoFcXW587fdUucEvBlN
	0R6rOSKSBffWRIAXd1SOlLWX+imdhX25rE4C2MZ2frbnNHcLyzZlfM4SGz41slAV
	uSoUUw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y053dsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:24:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 28BCC40044;
	Tue, 10 Jun 2025 17:23:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6844BB79BB9;
	Tue, 10 Jun 2025 17:23:13 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:23:13 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [RESEND PATCH v2 1/5] pinctrl: stm32: Handle RSVD pin configuration
Date: Tue, 10 Jun 2025 17:23:05 +0200
Message-ID: <20250610152309.299438-2-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610152309.299438-1-antonio.borneo@foss.st.com>
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_082453_284665_3857243C 
X-CRM114-Status: GOOD (  15.44  )
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

From: Fabien Dessenne <fabien.dessenne@foss.st.com>

When a pin is assigned to a coprocessor not running Linux, the pin
should be flagged in the DT as reserved and not usable by Linux.

Add pin configuration RSVD (Reserved) and instrument the driver to
not update the mux setting.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 9 +++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index ba49d48c3a1d1..e0c85f55557af 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -77,6 +77,7 @@ static const char * const stm32_gpio_functions[] = {
 	"af8", "af9", "af10",
 	"af11", "af12", "af13",
 	"af14", "af15", "analog",
+	"reserved",
 };
 
 struct stm32_pinctrl_group {
@@ -541,6 +542,9 @@ static bool stm32_pctrl_is_function_valid(struct stm32_pinctrl *pctl,
 		if (pin->pin.number != pin_num)
 			continue;
 
+		if (fnum == STM32_PIN_RSVD)
+			return true;
+
 		for (k = 0; k < STM32_CONFIG_NUM; k++) {
 			if (func->num == fnum)
 				return true;
@@ -841,6 +845,11 @@ static int stm32_pmx_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
+	if (function == STM32_PIN_RSVD) {
+		dev_dbg(pctl->dev, "Reserved pins, skipping HW update.\n");
+		return 0;
+	}
+
 	bank = gpiochip_get_data(range->gc);
 	pin = stm32_gpio_pin(g->pin);
 
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index 5e5de92ddd58c..8a1c9570b078f 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -17,7 +17,8 @@
 #define STM32_PIN_GPIO		0
 #define STM32_PIN_AF(x)		((x) + 1)
 #define STM32_PIN_ANALOG	(STM32_PIN_AF(15) + 1)
-#define STM32_CONFIG_NUM	(STM32_PIN_ANALOG + 1)
+#define STM32_PIN_RSVD		(STM32_PIN_ANALOG + 1)
+#define STM32_CONFIG_NUM	(STM32_PIN_RSVD + 1)
 
 /*  package information */
 #define STM32MP_PKG_AA		BIT(0)
-- 
2.34.1


