Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16F2C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU9EDwtysvUbHDPXdbcgIU7SqfLkn5gQbGF2GbXa7pY=; b=Uq3h2gxDgCPfL9RlYsLTdPdy36
	8sIdbLZdzpxVRQdIY4tRA9w2jWOg5LWFtFo3pyTBVRD4g3gr7MjdW2D63bgZdWW96UZcSv5XzbzgI
	ROV1pIojsh5v+o0KSnpk/ndGNJRLiFELRzQiRZvOcSy7TRqt4fdFaWswiYEmzU7mHPUwnSjj81n9/
	zUhBAvdZ99Gjz54Gc/B7hMB4gAf/1d85M9x3cUAv+fLujXdgT/bvEjgbPeXplkICSby4YrtCIA2x9
	SvryMKsVGoJ/Dhivd26lu8O+zZvBE4MvGjCBw5RZgLddg5aB3XZwFGKrejM/vxoDGVF1ZTPh1rHMn
	J8ErfsHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilm-0000000D2pJ-3rMR;
	Tue, 14 Jul 2026 19:26:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilk-0000000D2hv-01SZ;
	Tue, 14 Jul 2026 19:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gHNbOAYpLNeJMIX8AB67rtX0qgJArQ+D5DKBQu8GLMn+hOrcgF0xwbMhSMRVtWsnA
	 J/hvXxHb2y5LvWJUX0UZFGV8jhheOgFPd3YHLoCQlk4h1xuE+Cxe1gh54RM5erWAN1
	 7JZpdeekW3jeKLce4F/+7DB10MyBSQdF7POlIzITc6ho1GNo/abroEZZMeVcB0Rtte
	 tZrT3lGcxoI6netTqokfVn4GzpyfYTP9tWUfoGSjBjH19Ifhz71YSuHh7owwYPcvnf
	 yxbaLd5tp1yM10faVvJMAYD0nVljFfZsAIWuxp9gsjv4/2z3kcTz5Swl2S92mEzVjw
	 8s0C6IpNmGXLg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2538D17E0B89;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CFD2D48002F; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:04 +0200
Subject: [PATCH v13 03/35] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-3-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU/N+pqThOWKKerejsXTJvqKMa89XLKeY
 o53vbzDkztdJokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qaoPYP/0M8Z8VgKSRwjex2OTUq917XYXZ7RdTjMZ0Ik7ZF5EM8whNXlWfREoCv6688qYuStSj
 I4BzMuuLXxJFbkYriSqopaY4635z/8DwtRkUZKsV9sNGX1CgszSV/HPzWs18/bpyyR69rxMExu2
 1v4FD9QDinQ2Dl0BiBbecQJZvnvhzQ/4iyqwxqOVau5TpEeNum7ZLnXxTsNAXm7Dz7jXvf6FqC7
 1hgZsW3j/+E7GsxXDbnIra+qcFfncmqBe8TYE7laUIl1HnFS4NbJJVlp2k8JI7EQ9aPW5kE2BIy
 uOhrGtAV7nALkbedghmXb884u/RZUsxr70DDCESjaNxYATRajqX6+g2LmAWPOrbFfAdD2nNWjFR
 M9vIGzq7MkBxSjs0N3b9BTzHvwBOlH5yuWJsI6UUEM1RBOizOSudAtTifDTdp4zm0t0RY+ggAHF
 1R8EFBFGRi5euOQqHdkNG7JIOeQTnMjb+ojWUiAMxpM8WzKz/ff43TralA6H1mdbpFAaamUcY09
 IOrx4KhJsMlRl5sSNWK1p9RMQfLQk6Sg6dReV69VJCIKe4mZdz1GItmhr3snG1fdlfMNlAAQyja
 guAaqYN1qWA2H78ng8E6XmsCuJfyEMXkq/fWtAfXysLAesz7dDXKosF7b70LbYP+Hd9TpEtko8+
 4E0cmZ26DuGVQ+cxVsvo0Hw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122616_247170_43F138BB 
X-CRM114-Status: GOOD (  12.45  )
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

By default (i.e. without manually enabling runtime PM) DWC3 requests the
USB3 PHY once and keeps it enabled all the time. When DisplayPort is
being requested later on, a mode change is needed. This re-initializes
the PHY. During re-initialization the status variable has incorrectly
been cleared, which means the tracking information for USB3 is lost.

This is not an immediate problem, since the DP side keeps the PHY
enabled. But once DP is toggled off, the whole PHY will be disabled.
This is a problem, because the USB side still needs it powered.

Fix things by not clearing the status flags.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a5ffdf7a6e76..12dfdd470a78 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1008,7 +1008,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->mode_change = false;
 	} else if (udphy->mode_change) {
-		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.53.0


