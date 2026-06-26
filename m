Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9C5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6jXmQlYKLG6/+b28m7jod1WCtSytnvjTVSDOiebZDU=; b=2JZH/XmaGpQeAHatBPiHAPlfju
	B9nBeiHOhIvM5WaOVlCH6qpJmOeLrv8BUh3Dnk3r1GkKWi9rGozb7MHzwoWmwk3A4/YwJXl+LwgUV
	2iVJ47M9hAVCAUNq/mz5kvSsoGExRQyf5qxQ5CPJxhBa542dhrVVvhH0bjfPvHYgV0gJ5ynSb+MsM
	wSaU3DuDOGETAipw5VM8szngkIAhkAiejNGKn3lV23yoaXDDppsCv/5ulCffAWNhVd/zATv06xlz6
	/IUOW5wRtYmfa53auReM6IAwy/0XG8IMvkI78LdTBmuclGSV2u89F6kBuwC6saLsFIO1HpdpjsN6B
	sEEt6uSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDae-0000000BqNt-1LjS;
	Fri, 26 Jun 2026 20:55:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZv-0000000BpbI-2EZU;
	Fri, 26 Jun 2026 20:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507302;
	bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z1nqiS9NNz/nR3LpPwIZgkouMcgmy08ZzkZodIBkdA0cQ8H8CehtWYDB+1a3igeid
	 PqXBUWPieqNDFsKskKYDRxH1LUG2jBKnqKUwL6yOtj/gBpSZ8+42nTRspWCni90rVe
	 edGmbzQrZ3pr4+iG+JCx7DVxWyHqzCgDvcglIbG3RjZtlN6a2Itro7dcAoip9mEk7s
	 Td5dIjtWAk5j3IWxoptrRrNxJCLR6iAB9ZmwMCWo4HWJ3zHyY2WmXbIA8WTG2zfmd9
	 Su0zBmFQ8suO8vHnpn8ta4VTEG7T54LSF+Xic0SSHJmg3TQE/WKx4g9JxaXb7aRghI
	 nU7O+qpY+jDjg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE09417E120F;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 12560480030; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:54:58 +0200
Subject: [PATCH v8 05/29] phy: rockchip: usbdp: Handle missing clock-names
 DT property gracefully
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-5-47f682987895@collabora.com>
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
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yU1EsgQecKJDuUr15t17180rvVP28As2
 Wm5WXfaRjUfuIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qaygEP/0l9sC2P8AIfdIIXF4NSBjurLAM+DiCcf3oDgUkta/GtZYMEmedrHn0Z1qOlZUfbEQM
 AQVpMyZ2T08mRBjMjqRWNvDH0VOKZCvUM1aL4CB2Bwr8yT1f/NzvVKW5U2A7yiZQw5rCX+R3XsF
 ZNo5bLVv3HUXG0hZE/K8uNiFVilc+UNHoMRBiid83ZATOspAwcHgIYhu5FuRJUXVMcf5IWNNxPN
 AYXlvhwPYl9ZBzZ5sYiJVbKBifgBh1fvuVCZxvyahimk1MC0JogAMw1470NG74CuMUfMJ8WN8bb
 7DLZzOXtITffjn7gym8PAP5Iz9IF32sCvTnq4zn3D71YUzVr6pJC4mUcciLZQ/4KIkcYJxkDEVc
 1Mwjxxue2jGFsx60BcxcXiy4LLs6jQ0LwdWe6Pf55hLyxmIifV95m5kTloPpA9Td1TOwu60/aJP
 CG+Ra0FiMN6K8Hon992FEl5yT6JksLcC1NfNGar6hLr0QLme3pRqQ6EiU4zSCTfW4ocINnVOCpV
 NYsMYDzeMzIQpoQ0g3ohu95+7C6V3eIEKo0uG1iYx2cuMwTbTy8tfk5CRbkQqXgz60WrYj4vG+T
 hRytCkPqiA34XpRdGkVhMHthIUv4XZWiTgByeKTDpcvDN7T+nQ42j2TZJAA43MoktNtwRAlYv9L
 9+sRkkn+GPiGXmZ0BCMkeSA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135511_759162_9022BCB8 
X-CRM114-Status: GOOD (  11.58  )
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

The rk_udphy_clk_init() function would currently try to do a strncmp for
a NULL pointer, if DT specifies 'clocks' property, but no 'clock-names'
property. Fix this by making sure the clock has an id string set.

Note that DT binding requires setting clock-names, so this is only a
problem when booting a non-compliant device tree.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2845a012eafc..3fc8222fcaec 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -432,6 +432,9 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {
+		if (!udphy->clks[i].id)
+			continue;
+
 		if (!strncmp(udphy->clks[i].id, "refclk", 6)) {
 			udphy->refclk = udphy->clks[i].clk;
 			break;

-- 
2.53.0


