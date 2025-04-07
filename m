Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E8BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 19:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4/i+QoOu1T45V9mXOROYYRdaXqpR/d+RSP5AxIeu9E=; b=iugv40ZD7TDQLhjRHt6chdivVV
	jfividD+E2TVHb61hb11GZT4vk3xhT24Sg5786eYF80t0e8aGYqYXrXOTxpZ6ef9j0V6FFLsSqdbE
	j26moA3fTZ1RalL4/cDJxEgwZedHTVAkZ4iE/RNjcNvT+vvQY1UB7asxh0DHZcTckXjEVNRHxqaND
	zUJqFTGDfWLa3pt+1IQASH0k9cvf30XE7tn8TzSC5Z9Ik82yoQiFMgE2Fr3sTpyZWxNmb+Z3DgBAu
	9oJGfluX3Jbv6F4xej4yBsOJW6m1h+oCDv9QM3oYwpwFVEHf7JT3b02H2H+6f5+eAWvaYZBYBfgMI
	PtqlFcxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1s7V-00000001od9-0xcq;
	Mon, 07 Apr 2025 19:26:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qxr-00000001UJN-2rVM;
	Mon, 07 Apr 2025 18:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14C9D5C0211;
	Mon,  7 Apr 2025 18:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EA8C4CEDD;
	Mon,  7 Apr 2025 18:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049574;
	bh=lUqZd0rd4XtM1OpzBOVReCueFe1OJ6zFjC6Bpun+2DE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hfiMP2KKyIMh5yUUClNaeOm6Da1uO6ZKVmo6hxohYK/Mk4fiOdBDKkgslrtoIZu7x
	 3iHT0QRsVkABeI2Izfnto2s21EAQsXeZ0fZJ9C6F9kL62oJtfdqhRJ+neF1dkC9SkA
	 0ToUeG19t0AYtsd8xUHLRBlJV6zUBwJ5jTqfjUeytr18ZMe4wNu8jdkzZJO2kDPpyz
	 SwnuQHnODiNlQVtAR7uZWih7zZDTiJHw0LBKVJEzS2OtJJ6Hj8xLZbkCgIU8ogPYEC
	 9M46pAMhTuJCxrpm3epAZtUaYT2seYxhr1lvIQMhIbV4PfJLxwmF1eBJn/3/Df7L31
	 NgVLShKzctGOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	kishon@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.13 16/28] phy: rockchip: usbdp: Avoid call hpd_event_trigger in dp_phy_init
Date: Mon,  7 Apr 2025 14:12:06 -0400
Message-Id: <20250407181224.3180941-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181224.3180941-1-sashal@kernel.org>
References: <20250407181224.3180941-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.10
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_111255_754595_7DA084D0 
X-CRM114-Status: UNSURE (   8.41  )
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

From: Andy Yan <andy.yan@rock-chips.com>

[ Upstream commit 28dc672a1a877c77b000c896abd8f15afcdc1b0c ]

Function rk_udphy_dp_hpd_event_trigger will set vogrf let it
trigger HPD interrupt to DP by Type-C. This configuration is only
required when the DP work in Alternate Mode, and called by
typec_mux_set. In standard DP mode, such settings will prevent
the DP from receiving HPD interrupts.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Link: https://lore.kernel.org/r/20250302115257.188774-1-andyshrk@163.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 5b1e8a3806ed4..c04cf64f8a35d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1045,7 +1045,6 @@ static int rk_udphy_dp_phy_init(struct phy *phy)
 	mutex_lock(&udphy->mutex);
 
 	udphy->dp_in_use = true;
-	rk_udphy_dp_hpd_event_trigger(udphy, udphy->dp_sink_hpd_cfg);
 
 	mutex_unlock(&udphy->mutex);
 
-- 
2.39.5


