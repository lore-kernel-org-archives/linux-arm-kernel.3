Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C17EDF171
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+emT4wXmiJNAywpNUkx9muWy/TANM4dWezSJLgzgVTI=; b=IC3PeDnJGW/sKjLtRLj4/bksnz
	PLP2N8qSLcbQpZRJDiQpWsfmschq7OVbR/jb3NoWuEpyvLrVVVQl60a6Rq0D5h92GaDZXAASYrJZi
	0j8zbhKtiaBAKTkzFrUylsLxQgjEhhOwjsxf+hLlkuVdptwjO2xL7CL/jgXJ8R2DY8gwO4qRHcroN
	DfGexzO6uHXd/UC4dCrZn5sW0B7zsJczyZ/l8tuD4rR5i6K8k1SrdAM5DQoBDa8i9IAKoN8I97x4x
	KkENBUsAkbEndd4gv8j3xe8ImEDAj2Wunut+dUombc9/xrJXoBixFzoRBIsAyAciaJSiJRG8maZDK
	J9j7HC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKd-00000003YTH-0tRB;
	Fri, 13 Feb 2026 14:39:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKU-00000003YLR-3qNv;
	Fri, 13 Feb 2026 14:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770993571;
	bh=nkXYQxPq+lB3vzjnwGcNOGOuenfLKxQwMSun5YGuw0M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WjPWzo80zImLgGFoMw6PLU9crMiXM1rmf0/zYICM/d4ST5SrXaS/RS91Oadv3QP/f
	 AOpBdSsq2t8zMkFl1Se1IuJYzvsUnp8YZQmZoiJSHAr+hFShXNtmUctUO8CObV6fmV
	 8w6z1jBx6pkE2OSj4x0R9jLLs8Pf46N1nt8v1Kok3hw5EQLd1nboqEbOgieQHHqNs/
	 cm5ZfbT15ileraeqnckGxGVNXM1kPIUNT1SkY1ryk5rxVvVw3pBfB8ZBm51wUloeqV
	 mTcOY7hDGpuP+4iwCUcC+JDFMYEd5XzV1X7WX4jOyUq4tO07HHnIs7s7S640c52UvQ
	 JCWyaUjT7UxUw==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F125017E0C21;
	Fri, 13 Feb 2026 15:39:30 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A5D1E480029; Fri, 13 Feb 2026 15:39:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Feb 2026 15:39:27 +0100
Subject: [PATCH v2 4/9] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-rockchip-usbdp-cleanup-v2-4-b67ec225f96e@collabora.com>
References: <20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com>
In-Reply-To: <20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=idTUPP5e91uhF/EzTIc6KkaVZGLtsNP2d+inYWbkKyo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPN6IqwDxfz1aUT1ZBR3lZSM3/i+R6o6LJV
 XktVQhWf3UviYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpjzeiAAoJENju1/PI
 O/qaquYP/2TJwLaJlvW6UKYe+deia1zmDIUc5QiD1iJppCMfer4jkB2ei33ZsFyKz68Y0iFFTS6
 W64TT4VVxZvgmBEeU539QrxLJvdpnRH/jGY92dpK7RKELS6I6hFE/88fdPy9Q0EE/9EA5Hthtrk
 K4yJ57Gli3uwbe+dPGP0aE5p8jX3D2rR0ZDqJmWOJa7zSTJF4TCpVRpcUBD4TBFy+iyrHMfk2kH
 XO/noYoDV6/oqIfgrtO/7pFgQZb+yGElU5W8OIP9aRMikCJtyVe7OmVA0TTPK2qcBMsAUnzYOLb
 69hQsPGMghqHXXkfe5RJzC8iJGm09XILBn8eRSR99MNtDJRzbuVj3hiHDMKFUii16MNzaXT5VI2
 D7YKcd4qub//to4XKmYW4ymXXT17N6lu6qytOrJS+qTioebgorK/lUlFlWNs+spUsf9in2Fw+ym
 ViSTI7VqZ2RPElcyGw9+MLBXBRmseAVSrvfvgdrOueGnvoabukupm/5gfr8hCXwXCFUkMDiPE6b
 aWxGmbBjcsF/vnQou9q7oRBq6idjfvkeplw6Kg7r0BpinTzp6337peJISzd8L8u0y+fWL8cPSCV
 9BDfcO2X0abcM+R1QV8P1d3QQ/lS5RQMw9QuIHoko3BiJX/Gy58iwEY1Lm1sDXbameGAWYqKn72
 AlWiUr3m5ajzX1EZOBuY1tw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063935_112288_ED3CB8FF 
X-CRM114-Status: GOOD (  10.58  )
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
2.51.0


