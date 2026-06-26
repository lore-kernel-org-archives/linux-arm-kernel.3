Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E0CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpIfeHL4Kwoe/JD6fYn49g29cW7VP4BbO78u1OS3Azg=; b=hAfCaJ3n/acQ2bfHdf/BMdphIo
	8qcj01Lz/tisBik79Erm1hp86KgGkQcdPsmHcSpPr5az7p0aKS3oVmNuL6hhKF6WV4pC3irSp07hv
	aZVKzpQvxmFhyxNQ83qdB6lRmsidjAG7ajX8/WvJm16LCtgPsqdT07YZ0xzV5pPrApBismwVKyj55
	3dPqMo3lVnG7nvuw4ef9gTEbm+UJc1+io8WTaxZxedc0/tBdlsNEqCo4+2NNUG3Fe6+fwEEsfDK3K
	1n7mTnUbGuCufipN9OlGI4dVi8TzjteQG+/zNdsik8LnTiQ4zETirwzEhXLe2fo97qMpRTO2VUlxo
	id63x8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDae-0000000BqNH-0K2I;
	Fri, 26 Jun 2026 20:55:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZv-0000000BpbY-0GX3;
	Fri, 26 Jun 2026 20:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=PuDdz6Q2vqXx7HrK4iuws0Pe9IlARbZd32hHkFqvSvg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mb6uYsKqb3boqMDe1XrkyKZKNX9pJR7l1WaRFC9DDtPxc4Ldynh+m+1ohTv4ECgip
	 LHgktPnhmooUhvsD+TBF3N7/Ieb0gMaMepXDMEYcpZZELMO+ziKGo9w5JLQdsjNbiD
	 HnBZdGDkW3f2UQec6N3WZkGPgvydYmyEpn8fFNqLXBpEv8CJDHXjJjIJR6z5TMTt+i
	 sgAm3va4ikfT8FYybtOUd3A3A05KZn3/P+fm4/AYTbdEHyxqZuTD4WuSppbZ9KwzwR
	 Q48z46Vc0E+Z11TOCfyCcoS92EehCXazAXhRTAa3+qv5aFXTkxEYn/EylkCZRkCW2Q
	 MRxSUaVo/8njA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C9D5B17E1531;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 19F8848003D; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:03 +0200
Subject: [PATCH v8 10/29] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-10-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=MNkOUSpH7Jeejx5O36YJerXIyJQjXxCBZW0DlK6lNlk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yV4yEH0LduE9rXrmtiKqVQdQ0Cvz8XWk
 1FkpGU0OYL0PokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qawvcP/2u66/2Winc4HkaAKHlfyoQdnRirrF2NrRI77SAFVCX0A6A2cEsfSgV5Fvl5TkB2k/A
 4Y7jYaOC8xOHg3EiXd8JSLALJ+6ihGJJcJLLrXqZCGREiWxmf9OXAOATXqB3G2FLCj3QkcE3Kro
 QVCs6PiI7/1sqDG17BqFyT7iu2x2njr0i7jkeWRbZgyBHBnuTzOhhxfWIIATMWNbeScZFy1YFvD
 o40B1M7SPqGz5Va1WLp495Ivm4+5+gBVgt0nKsDH5HE5g5axDCW98e5nQa80Wtpg21hgS3HgR9k
 Usb/T28g5W5YZTVOdhdeppQavWy9CjbQNV1Y3lt9g/wlqxJIrTbCTRJz2PswQEmYIUaxl0t6/XA
 KRpO0Djp3fDZ2625inzcnhyY7cdQGOUu768KAGbC0fxAW2YvypqB/1cXzEIHd7kYACNoxmatCta
 QFECdZGE0aUCvq6Pnt0MOOjzR0MYpjDbdUwLuoFnv4y4m/jvSGMne5PJoK4XUXhf8Sh31fp+f0Q
 K2+RShk4Cu0ORG70q1PkV1LZTUbkg7KcNJJ+c7v+m671VPSAIM5599W76fMw8pBKESGHnlfg/YW
 Y9IvErfdVCvtu+LG0lAHLwJ80xuLR3ENA1CpnQSF3N1L8O4crIDANyrCsWJz1siCXzxE74CxjB1
 WLyUbr6wLlVK8dOM0VNAq0g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135511_384920_6BB1D7C4 
X-CRM114-Status: GOOD (  10.53  )
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
index 2aa9ccabf80b..c6d24dd3bdef 100644
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


