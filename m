Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE187C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78AUIU/qShsfiAsNO+5TxDJa3CTewiJWx3Tp3csh27A=; b=r6yRljefcajtKmVmxT4OosRBTi
	2ahUcH2RgyOg0b5UC5a/7ctLZholeGDkuPxSguqE0I5iNJ0vMNxpCgDFcco3ZvMa5M8lU4vEyc9jJ
	A3sF9IqM8B5hCfu9+z/J7owHH5IVyGUN6wJPkPkhlHA2vf0ZyChSri3AKJMAdQYbCvCCOfZQtrFVr
	WMJsB+MhwGF1cMJUvc/ALV44GePHR2SC/+3Qu5rcGwDixcGZRoaSiOsPN9i1bJxU3ahyhWq4qi8Bw
	7lXNcCbqdLPcouqfKe+nOZ88K3qsaDwRCT/DSkEfG1zIDz1BGpG1B+B4LcHOOJxW1JanTufkOqyS4
	kZgbeXlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TT-00000003AOn-3dKs;
	Wed, 01 Jul 2026 23:36:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TF-000000039nR-3j6U;
	Wed, 01 Jul 2026 23:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=YBCV+kiCyUPfBLNmVJH9rKTzNtg3m9V76T8MrQilbT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o9s1NXowYl+ULHoiAgbOh/AF5OD4FvwCponf1Eke7F0+wkKgMzWI6QGo6zs84m0sO
	 ERVqrv+3YmsW7CsVaqJrspADajN29oWu7MttRMntNjmD7F/H2/5O3qkQcxdMTcwbAl
	 deFdeIwn+wRNlnfZasJ4KNS024V5Fe1NX0wItAWedUtVNO21QDbKxNSsih2NGEa8HU
	 EcW26grSa99DnPPJDBcopKcdLCftVGW0Mppd+LvfRCtMS35C61ymo7nbRxGZx64c6B
	 4JopfkzDcafR4ffmaOISHFFz98siBlYTDmwN/gO6pKkNgZuuei6t8ikIzvru256lsN
	 2ETjCKNnJqq+w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E77817E15C4;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BB1AB480047; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:48 +0200
Subject: [PATCH v9 10/38] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-10-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=nTHeRYz0L50JR1Z8kWwdqRqauaf+webExNiL/LtTnpA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFMn8FhFrrrUOqzc7DYJq1KHQQ2OnmeID
 mwKl3Sa+uItBIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qaZkEP/1BT7AyIO3coz5NukVhLeukMZdd8347fqNexEL7EASzFfMxxkI/B+hsZj7CMzrrswR7
 tTMwSkClHJGkPHULoENyHaUaS21V7/mThQsXOTQkZCdyKe4BkGk0JJ0rB6eYDmER+NhG3Da1dPc
 HEOxCe47R5DlIV0RKppAklmPlLkAwMXkcUTsxi/txyUZkCGaDiaYU7QVh9DzlrQIEsXVeDqHhkq
 PdkqukWurgi7z4HfEpfD7rXCSOgj5zcPOwmfLY0LSBkI8nndWrAlUoUDGliwru1ILOgbHm8QVmc
 uHLOb+T4+57nQ3SKVQJWpKNbWdgsrMkUpfo8aRVthwHBaaGA/7G5Y4eyXDF9vq6ig+PF/DMM6+v
 alfWtgOkfwjWf5Y8JRzNTZHsZEO0IVp5d1ZP++5Dz9EFp7OlaLA/FE7cbyzOmB1KDcs8J5tmDew
 wurk27f6uIjaeWfAgZe4z8E1pEIhQcypS87fOq6s/nMGXVIdJElxx678EBeocp1bIRpnmRJB9VY
 wC8TKbzeS+3YGxf2EG6RTsGIK02FL4Eh8TPfTysx6EuPnR0ew6IsAmAPF3prLPNlWhXmnj/LQrs
 WzSXD/bNAjsGyONokZjFGcqsCsvR2e3vihzEpmwsVwmgOnOaLa3TQY0A5g5+sWm0f2mE5+iFbON
 EMuoNLA8AqtfFUAaYPO0lpQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163558_125227_828685BA 
X-CRM114-Status: GOOD (  11.61  )
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 923279ed7d77..8202abab4274 100644
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


