Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4728CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxiFw/CgQuSeQbZ7JHa4I2O+m7zilUEJVtb6pnzGaoQ=; b=WZZQuCKOBnx5+9BdlNTjJlw4eX
	r8iiQ9OCF5//qASnTVFq/V01UUVgzszBnJNYeQWVoHkv42O9wBMvLjcP4XNxkptaQ4Cw0HSfypEYC
	b8f5D9fPq34tNBlk/5Fq3XEMYyeEOKN3S8bfs8VUsBMLgJPGBg8/P6G2lD0uLtPXIMI46d2fUP8wD
	1nRdcg18VjyAWOuZF2gH487z/+6HTrTpEjSXGC6ICMvpwnFO2yFEaSVYFyu/r473f2ZyQPJUWTVl/
	Zvt0WTQCibZ2GFe65G7jb/hvW/A10l+7u9v3ZfhQYffclCuR0lzY25iYfZs55jtPZN+8jwzKdPVoz
	xIK2FLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Ts-00000003BbI-3bXc;
	Wed, 01 Jul 2026 23:36:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TM-000000039zq-1sIR;
	Wed, 01 Jul 2026 23:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=y1K38988NOGNjrWDX39V0tM+tzGRa5eL8tR+BuYD8RM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fte/d0iZq+OLvpUfy6Hrv7d21+g9YMofSExIkS8k+FiewC3JpNXMXVelGiMvVrRtw
	 PIf+kdEYi+I9nlGJSQxczBYYCXQPo98yUnzY/J6o9KSLoTUa/hc1jG3wSRtMbA5mC0
	 hyb4l/2ErpMpMAujFMdGMx5SkrZmNj9IowbEqmPYhKVzsa2oBFE9K0vAuNf1NNZc8E
	 ZMbb8h6sHfUzdcvGuCdL7EATaBdiGJUa2x5U8tZq76RXGf/8v2zhoV/k+pWT3zRwTY
	 1NCVHG6V513SQai9iCxZBsnqGOPEoPT5Xlae+aaKDG4e8olS69lo7LuLHTZsCudLLa
	 tD4FLZ2KCdhSQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5040617E3620;
	Thu,  2 Jul 2026 01:35:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E364D48007C; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:15 +0200
Subject: [PATCH v9 37/38] phy: rockchip: usbdp: Re-init PHY on mux change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-37-e31efbb62d2e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=976;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=y1K38988NOGNjrWDX39V0tM+tzGRa5eL8tR+BuYD8RM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFTn4vcJyseHiWtsGKSypASqmgHiFHurS
 73UXcoGV5JhgYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qa8UYP/jqwlza70YtDGsUk7C9XkDcHowQvZBZXAvJvgG5DWym8OS3+V4p7Uv2yvb6+5w32pwP
 M5TGFJr55M6WCUc0G3dG/v1MZpJHKbgDcfR0bVX+TbVGl34PZ0Jh6t+oXLTR/lviDjy7pAdmRBc
 c6thHRZk0mMEOa1ZSdD+AypEDwxKTqEXcGNjYh9IqSl8LWJ8dad4PnEwEB94qJvdZnsUc6h4/6q
 +QbFn3Wox5nbkHcJVtuYrpLj/7961Sg1Yez8ozPTWS4mT/PI74KDXEQV9bkZ6UV5TZELlMLTTPm
 cFMISyIAMNMORB8kfnWGmgFQXQDTxOzWaGERxc97QBanjPFr6PYKNAsnDBFs7yn1uU6AdFUQgHe
 zz2DueX0wIYPR/8gfLhA1CwY5rMOM6PYRjWFzJi4eV2UgKis5oZFGH3qF7Q4lau8s/WDLpVvqvd
 jauLtwktaLxbn8bp+XyV+SljEUDHuDtoOeigFy7DipO+sRqmpw++qcC4wukHSXZfR4F9195lh1c
 3pfdLxAR95nRtPhmh1LzNiR+3+reTJaBHfHKR49u4SANeDf5iN4Q0Kcbc0clRcD43Cfwuevc74f
 Fj6sjHYlh1DVsJO9TafaMOzis8BEBnWgCwOs5Svvv/gVCqGOQhYJ9My4hY7VmXXyFbWVvp8I2Px
 N15mIlUwamRmjNMxPbjUpCQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163604_818638_F4F9C1FA 
X-CRM114-Status: GOOD (  11.65  )
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

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 735ce1bfac7a..d056da53cb1c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1372,6 +1372,8 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
+	rk_udphy_update_power_state(udphy);
+
 	return 0;
 }
 

-- 
2.53.0


