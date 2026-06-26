Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B144C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlsCv+3sJBrDMAgF1ohnBunoYMONPW5x5FBrZispnxM=; b=kOB2tYX1g51TM9nQLjHxYgFaE2
	4keIOAHYhzI/D4vhlX0QY9ZbqEq4EQofB4FvnBLHQxXH+Cl35Qt1tFmmPgn1E3S26HiVndSsNbB+d
	3+smMjlD9CEl0deh94BHOgZekkEqwub6P68jzvqy1azoRJJ0pJxYxK2GDFOdKqclpkpu4wimzOI7z
	z4Av1Ud2j8F/Ygi2OtI6urYk9MsXzCqP5Bojv1ccwvSMNycLeqd+6fowAXOu1EMpB2KIOMGbVdFin
	syCJA8X86Y7aJkLWcipurGUc/ZhQn7R+hoLKSRUYwrpMvrqffhBNLvO8ike8PTX0oILni0jfRljYC
	tOl4NRQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDbv-0000000BsGQ-3rAb;
	Fri, 26 Jun 2026 20:57:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZv-0000000Bpbj-0yKN;
	Fri, 26 Jun 2026 20:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507302;
	bh=wIdm6WAvSCnmDVmjn0d4nzjlUVyQK7d9rbn5XLogh8M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iqYVbMDhwwrTVKiaXVZ6eBKE5tbmln5Mp4Ahy1GfBKnui0PLjte3v11igZmrCPUPA
	 2QvrjmOS5zXqBogYNNo0E7bac1uNUjVYoK+yHYYMAYs6BsrI+C/vYaJ/qWwmgVeLwu
	 YnutpULYGVo47VheQjke3klDNP2nowPz6eBk4WHgpuKSnKmUbukRIGeQn3JG4ByWxe
	 s9U0aKjJCA4iPr2FDC/fh4UarrIUl2loo7bSSeJ+L3u4mQ90KvnSMHnFhjtsUZj+Hi
	 zPVQRXDQSAwyYUHwegFLy8qW3rlBG7oAEFbd2FPDlPyAyIW4RWs+e+T0HNbqE4zGwA
	 MANh4Zyyz327w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7D4317E140E;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 158E6480035; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:00 +0200
Subject: [PATCH v8 07/29] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert_all errors in init check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-7-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=wIdm6WAvSCnmDVmjn0d4nzjlUVyQK7d9rbn5XLogh8M=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yWbE39BAB+33EfKvnPIrrl2F4e82Rhpy
 Fhj2WG76sGY/IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qabkEP/0fQDfGFBdE3Qjyi91pEFGDFfdMbowO1VMEMn2LpVopP514hAJkGol9ABBk4/YCYzPh
 q9PPGL8kM4g313JuDwpHTl+VyYlZrxGE4ht26BytKRwZDRkycwqs6tcgFk60VGqCR4eXizWOVlo
 kKgu29ASRVKy1uZr5sTFOZdCjA/6CQKFNiRrrOCD6pnO+5ZV5g7f9tadHbu4YHLyfLrwmf0qj9X
 kM2K3lIEaei4Nk+hkcNd028WUu+YLyFlEs4xtUxLyhR9QHBdGTcPwYkjg3e95HfYmOtrHNbLY3r
 XlYRx6v4xG0qDRvRVS/BByNozkusfG19tVqjPkx2s3l5jrpzJMr8acapRQ4Ky2XtxEUIoxjZ20R
 TOAsO+/BfWnOjfQgOwZj0xbJnOV1gC2L0519nFktLxgur65Ogu3rW1lS7YQTi40rSA2qhnA6VQy
 VSbaI68fvsMBkZLhDdCrH0rMXyz1IoDtIxOf4VekbgvOphuEdJplWXg1l+7ToAdZJVZNs2cB/Id
 6Fw2mW6GwEN6BgLJikjuOLLaEVxkKvBQXnhU3KJqWwmUIOjID69Frbc6fuwD5lGZyIV+8B3jsTY
 A2EuwGX3giuGG3SK8nFVGXwChvvnG1lSPgKiVDAIxXg41Jht/w4i1mbX+Fyxrc/DUCUwfguJkug
 scDllP0rFCxDrY4iU38YlwQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135511_554262_ED107F31 
X-CRM114-Status: GOOD (  10.28  )
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

Fix theoretical issue, that failure to deassert the reset lines would
result in an SError in follow-up register access. Note, that this cannot
happen with current code, since the Rockchip reset driver never returns
any errors for (de)asserting reset lines.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619154903.2225A1F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index f7ff55f03b7c..b8de0a47a616 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -936,7 +936,9 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 		return ret;
 	}
 
-	rk_udphy_reset_deassert_all(udphy);
+	ret = rk_udphy_reset_deassert_all(udphy);
+	if (ret)
+		goto exit;
 
 	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
 	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value)) {
@@ -944,9 +946,10 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 		rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, false);
 	}
 
+exit:
 	rk_udphy_disable(udphy);
 
-	return 0;
+	return ret;
 }
 
 static int rk_udphy_parse_dt(struct rk_udphy *udphy)

-- 
2.53.0


