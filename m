Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5845CFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rU7ZTWyciW0wwSSBrPGsu9MtHdw7I8uY+j1pu2yQbXw=; b=LWAIxEMbun42sqxFfcs6Y9Vgcu
	yEDEVPtWCi9eBKdVfl7fKbnTovtpCP4CEcVEJkcYYDKp89mMsBnkFQ0W2sjYI37+nHWqwBgo5H3r7
	Z85i2yCxHLb9gzwy3KPlCMTRVjYkpygRFu0TmbW4Ukp4Z5xqh/7jCkz5OoUwUT1qAzr+P/dcVnuj9
	z8au6WZEpbHqjNngNT8sqwZJ3ar63fbfMiKN9TK3vhiJDHmIEbHWxJr5sIqrqgOgFenx8K6H1fI1V
	aY3PP0vNUQ2q1wfbQd96xuxz2dBmnJ5HoeiT9FvZHHxqtRgSPJ6O9G6AL2KfhUrcASZBrtqXnshra
	xJirGmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4g-00000001srK-2Yqk;
	Tue, 28 Apr 2026 16:14:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4b-00000001sge-0GD5;
	Tue, 28 Apr 2026 16:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=44U1UChGeKh0HEiCvpuVJ49MDPkv3nQQ2Nz9Gq57yC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YLzpHbg6XSqh2vYW149Cb0Mr0ybRSIrbVSUVjwSs9LwXQJP8A+i7yrkNfTbNtlz/x
	 ZUoJXNqSK0D0m6YKDrc2neDcLjT9sake1Y9gqmtRACliv0FnucCknafoX1GRq9HjPv
	 y9BdQ7QWTHGiF3CV7Lil31x1k7Yp2SGZRB+DTwUJR5lRyuoC8PF8lEcd4V4T83fCBl
	 mao1NWOFxFCPMfrO8jbjWfJ/bZjIkKqCYYATmR+znpbMXbODczPl5oVo1fsV4qIR8l
	 0qAoYxOIGsv5JpzziPHSakzTD8sQF1wIXW3nGHILMi8qPNhIzeaZvLkMtpVZqIlzR6
	 X5uMvquCybqzg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 22AF117E1553;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 863AF480038; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:44 +0200
Subject: [PATCH v4 05/16] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-5-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=eVOY3NqVA0ogxpiysvigAYrriG39FpovjHpdGuHvpr0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MmfN1guRhjMtYp9JkPPxN8GXqZLa1Fw3
 +AZpTHqhhYZ9IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qayasQAJ7VUokwjwSLaNyTDCx4EDvrdj8WT91X64eLgL1YSZRX5VJXRA22KedRmXcFoKMFBeR
 CPEYb1LCKDOVQ11dc/Ggbwgec1EqRtt0efChSWzIjsasQs4fH+wa69lsWqglGyTYZnkTFRbOmSA
 lQBfkog5lRxvtY6qalkE6ERj8EokI0VigqxSUOAE37z7fPnkw4kbNs7/r5lUqzIBtJid1QsYDhH
 pl0L9PtnYXiT5T2f9QjLvtW95NxUyJKcZXgwML+JAIYw75GtWdzhIEdbEQa+clv3EPpYYBnhtK8
 b9RedvdRLHi2cWrywbHQcupCNakcW+9CgxJgTvMJuBF1amNa2+DZ5QmDrczf6Mk7zEFvHqtqatx
 o9ZMa6eYbMh1MOYACjuSClnzARLc3sN6RH7f8zNogEgW44Efwvgmn8u9Kcks13a0RXUgvoznBvA
 C+4Sc2d2D0s4hVyoWfi2yr2ZecfHpuhuSxCaak4r6g6d04dIS8pOzgiMRv4CsG/jEcv4pg2uR8q
 01V4vXcbytqE48kvGaQRs7TfCIz17BzO7mJzqEFv5N01gNrCvPNe5Lb9r9nVaAzqPY2N7iqVGSS
 /Z2vR3d2Ot24AT+4tQSwz0fM9OGEgM/206G17/qAALXynyJ6Ve9C8YquhhOAziS2gCMAGvDRMrg
 1wWt4el7UIycW0B8dW5g1bQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_091409_278890_3FD42241 
X-CRM114-Status: GOOD (  11.14  )
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

From: William Wu <william.wu@rock-chips.com>

According to the LFPS Tx Low Power/LFPS Rx Detect Threshold [1],
the device under test(DUT) must not respond if LFPS below the
minimum LFPS Rx Detect Threshold 100mV. Test fail on Rockchip
platforms, because the default LFPS detect threshold is set to
65mV.

The USBDP PHY LFPS detect threshold voltage could be set to
30mV ~ 140mV, and since there could be 10-20% PVT variation,
we set LFPS detect threshold voltage to 110mV.

[1] https://compliance.usb.org/resources/LFPS_Rx_Tx_Low_Power_Compliance_Update_Rev5.pdf

Signed-off-by: William Wu <william.wu@rock-chips.com>
[Taken over from rockchip's kernel tree; the registers are not described
in the TRM]
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 1f686844c337..97e53b933225 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -413,7 +413,8 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x0024, 0x6e}
+	{0x20d4, 0x08}, {0x0024, 0x6e},
+	{0x09c0, 0x0a}, {0x19c0, 0x0a}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0


