Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DC2F3D61E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkjylHhPY5Zp4sZf/mKL22KMI1gZWywJJ0iSsDcvxlg=; b=3zrVXiU5NCbrChSEG3jRiPoWpf
	MXq2FvR7S3jJKQf7v+gnBXojDERjhjpHjju1o2RwhzvRBqIEZt7wTTFVcdM9hy4JdE/UgZ+YU3UWU
	tq5MVWBgPR+j3xgEyjRERMzgciw5KPOFzzQ+E7xSBroRUlk9cUWuTowC5FDhB8nu2Ew6Cj6Q9nP/i
	pS1f6NpQSSSfpTCPJ1znl+MbJM1YYOaTSgWNdcRtHAbBFz1CWaDl3gETnvHG+9fw7YbZ6uzCcd+lW
	QXvhsYsOhvBm7M+NxIXb5h8gViVa2hNO01OQOn0IK84zMtvdD09/8hznC7Ngwz8QfvHmtywihyE4A
	mocRHuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785y-0000000ArvI-1JxC;
	Mon, 30 Mar 2026 08:35:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785u-0000000Ars1-1TLW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:35:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso41804005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 01:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859732; x=1775464532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkjylHhPY5Zp4sZf/mKL22KMI1gZWywJJ0iSsDcvxlg=;
        b=ZEhWerg/vxbG4drWkXg0vRGOfOVpcUES55nPLdvT1VX3pkA2+tH90Ds35XZvQnSfN+
         +ecEIfHeUnEIJ7Leb3QS7iVBBm3gBi7mzlO4zCxEYdcSPfRkymUAwpH19VB8nXcB9O5W
         FJWgcDXcUAaC9TAdOwht7+S20TNmP6C1xCkvkh/E/S9xNyv+O+ePGWq+WGzOyzs6W+oL
         Q4QxvhQ9yM2XUk0RqHpy5iC5OU+bZGRKfeUGsAqa3LS3S/BGK633JQ5kye22IlkZnGkq
         UaUL6Zakt330jRF2djJMsO4y3p4Llp6JRdjq0egkrF/owUYGqu+24CVFlEfLYnykOdVD
         tbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859732; x=1775464532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FkjylHhPY5Zp4sZf/mKL22KMI1gZWywJJ0iSsDcvxlg=;
        b=UcnxN7aFxpb7BHttuufK636/K+EvLqS+JapaGomkU0IQth5rn0mTCyykB6+JBbUESC
         lVSGK0Vv7MR6IWzUJEqWcIYdR9hitfdI/lYxyoopUWpgAGaKHg+AD8hSlTtdyyW8AX5j
         Y3sBDFsYPTVGvyY+viWbwyV/8If90HInwErb3+GLagUI75AUDKoPaZPLyUO7XjrsCyHV
         S5/oxgMwigiUfSiNuwC88C+2RfqseidPX4ih3gr8vigEZazvzJvfqTQfdbn8J9girILJ
         MG2hgYjLoMsKBrAYKbpEWrER3VZukXRMfLQMrpLuHBiCqgOpGrbHL0xUrA09WMl9ENjL
         pPCw==
X-Forwarded-Encrypted: i=1; AJvYcCXQV5neKkOpNEFT2Dj/oLvixY4d9sJSkgkpnzCCgchY+6+DHfk1N82cJ1XSxZrik/4sx9aR4xZ2V6DlKeDRP3Gz@lists.infradead.org
X-Gm-Message-State: AOJu0YwPha75gI/Tib8o6SOaeEVrsh66Wqunxdo6YLgjC0RAhz8nLWts
	XhBJx7DSNMzBRAOwQtTwwdhBpDLBZlwJ96aBl2p9Pnl1nQbBV2uXAaMF
X-Gm-Gg: ATEYQzzNHStITd1d1dZP7bJU2Avh/TsD8zyGx74fsHPVEVEORb4HYTU6Xg3YQYvuJ9J
	0s8UkHwDDP38WONRTGkkunifutFgQp/RTzJwykIrGgqgcSkveDcxOKg+0UdNicV728LC6piv4BK
	LNJYhT/X6wgvghdJIOymTvL/1tVBS69i+pLmgZLBcn90WPC8COkxaTonmwEIPd+pCT2hKWBr9uT
	uh39ALLdBlBuSplD2Z7xu/yKLdxRlMVx4ce0suCysVuLBrmZvgGQi6ToWH8v67zALvQJGlumVWK
	Caevc0iWIZxgQtV8picxLUCld4FhLXoeQR8jfadtK0jrjmbRXeYXO4bOnzeEdWLUP9AAUubCZvz
	8YaAamWvPIh1YdqrdKUKckiFTBpaucYRqrD9T7meEnDPYNS76YsAPBh8WXytEDQB8W2BIFey3Z4
	2jnNSn8EanT2jLBH0hzwE=
X-Received: by 2002:a05:600c:4744:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-48727d5d6femr189659945e9.4.1774859732245;
        Mon, 30 Mar 2026 01:35:32 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:35:31 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Val Packett <val@packett.cool>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 4/9] dt-bindings: pinctrl: mediatek,mt65xx: Add MT6392 pinctrl
Date: Mon, 30 Mar 2026 09:29:38 +0100
Message-ID: <20260330083429.359819-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013534_427622_9D53FD39 
X-CRM114-Status: GOOD (  15.09  )
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

Add a compatible for the pinctrl device of the MT6392 PMIC, a variant of
the already supported MT6397.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |  1 +
 .../pinctrl/mediatek,mt6392-pinfunc.h         | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index aa71398cf522..1468c6f87cfa 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt2701-pinctrl
       - mediatek,mt2712-pinctrl
+      - mediatek,mt6392-pinctrl
       - mediatek,mt6397-pinctrl
       - mediatek,mt7623-pinctrl
       - mediatek,mt8127-pinctrl
diff --git a/include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h b/include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h
new file mode 100644
index 000000000000..c65278c8103d
--- /dev/null
+++ b/include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef __DTS_MT6392_PINFUNC_H
+#define __DTS_MT6392_PINFUNC_H
+
+#include <dt-bindings/pinctrl/mt65xx.h>
+
+#define MT6392_PIN_0_INT__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
+#define MT6392_PIN_0_INT__FUNC_INT (MTK_PIN_NO(0) | 1)
+#define MT6392_PIN_0_INT__FUNC_TEST_CK2 (MTK_PIN_NO(0) | 5)
+#define MT6392_PIN_0_INT__FUNC_TEST_IN1 (MTK_PIN_NO(0) | 6)
+#define MT6392_PIN_0_INT__FUNC_TEST_OUT1 (MTK_PIN_NO(0) | 7)
+
+#define MT6392_PIN_1_SRCLKEN__FUNC_GPIO1 (MTK_PIN_NO(1) | 0)
+#define MT6392_PIN_1_SRCLKEN__FUNC_SRCLKEN (MTK_PIN_NO(1) | 1)
+#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_CK0 (MTK_PIN_NO(1) | 5)
+#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_IN2 (MTK_PIN_NO(1) | 6)
+#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_OUT2 (MTK_PIN_NO(1) | 7)
+
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_GPIO2 (MTK_PIN_NO(2) | 0)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_RTC_32K1V8 (MTK_PIN_NO(2) | 1)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_CK1 (MTK_PIN_NO(2) | 5)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_IN3 (MTK_PIN_NO(2) | 6)
+#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_OUT3 (MTK_PIN_NO(2) | 7)
+
+#define MT6392_PIN_3_SPI_CLK__FUNC_GPIO3 (MTK_PIN_NO(3) | 0)
+#define MT6392_PIN_3_SPI_CLK__FUNC_SPI_CLK (MTK_PIN_NO(3) | 1)
+
+#define MT6392_PIN_4_SPI_CSN__FUNC_GPIO4 (MTK_PIN_NO(4) | 0)
+#define MT6392_PIN_4_SPI_CSN__FUNC_SPI_CSN (MTK_PIN_NO(4) | 1)
+
+#define MT6392_PIN_5_SPI_MOSI__FUNC_GPIO5 (MTK_PIN_NO(5) | 0)
+#define MT6392_PIN_5_SPI_MOSI__FUNC_SPI_MOSI (MTK_PIN_NO(5) | 1)
+
+#define MT6392_PIN_6_SPI_MISO__FUNC_GPIO6 (MTK_PIN_NO(6) | 0)
+#define MT6392_PIN_6_SPI_MISO__FUNC_SPI_MISO (MTK_PIN_NO(6) | 1)
+#define MT6392_PIN_6_SPI_MISO__FUNC_TEST_IN4 (MTK_PIN_NO(6) | 6)
+#define MT6392_PIN_6_SPI_MISO__FUNC_TEST_OUT4 (MTK_PIN_NO(6) | 7)
+
+#endif /* __DTS_MT6392_PINFUNC_H */
-- 
2.43.0


