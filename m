Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51846C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiYXe9hU4GLjYBlDm3NApTkkTrpbtTK2GE6gR5VILjo=; b=QA/nAsK/WrGYtFduSJutYpWGig
	PwiuOH6RnVqUaPk92e1fm7athSEecNKoCbw/SUgoHV9WWt0tu5RY1tj/T3nCbXpxyZkLn2UwnK59s
	KacNhewTxtbdL/kklXfU8Z2aszubv6j0EYhNqNK8Tw+Cm0riVPJfsIR3GAMIPp/bznLdhHIYzXbJp
	oaa+JF+KciwUu5PPOm0pDAhHha3xJFrXRMQMlwRd0rRL/fevt3QErP+zT7Q4Y+o6es2xqyv1TLLNF
	icJecCS++C6Qg/7SAcMBazM/skvR0ZhXr1fiBEougT3qq/6m3JYKMtk9J1v2csGgiv8RcD8AHXEe9
	Y+B2KarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiENH-00000005JrU-3qKV;
	Fri, 10 Jul 2026 16:46:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMr-00000005J9C-1uWD;
	Fri, 10 Jul 2026 16:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NjE5uvc5+pzOZ6Cr0sB5GhFJuZh4nggCgscjR0PcrjE9/XrbGjSy69+AKN890gLXn
	 OodAVrETAwl1q31hdFtE5kHGITfnPAVeC6qt3gZmbw8+6latYCBim4TY4tBZjG/2bv
	 xw5BnnLHMVaN6jRtW5fXkkezfRwk+z16pXzF8Ag6bqoPs5LJlUXtmd9E0ndXqKdj0g
	 ew16GKv+WcldM58rQG7JX/g5kIgVL4QgQEoVGKZMjdjhugOSFho+50dIhlfDyMaWsB
	 tdGlkPcwlUX14hHLtTuuRaF16UC3GtmmXyacp6LsM7N8FzpSPKUTd2umWWO3inrKTB
	 V5AeJH2nfzWnA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8268917E0F07;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E5D72480038; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:45 +0200
Subject: [PATCH v12 07/36] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-7-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdhqOy2ZElnpS0BwMCU6H2iuXvIyECnhV
 vB5ZKq243aP9IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qa334P/ivNQ7nTlsIT/y1p1BEFl3Hu4d6FRwGzWgvv5a8ocZs4ewtEMbU2UiPyxL3P9eBxIbM
 h2EbKn9f7yZiQ2vjTqVXEW4vE5jbekrHcFX587jwhkxPzKORudZGpArKz4HRr9g0vAV3hE5bUju
 4vjOeIf7rOlj0ZwGwH8hLNoVDsf29lbCch6sbY+AUULNa2/N5UQE+tLuZdsf2hlCVBCZCgc64zs
 SweAkY0NuTiICGzBSM+rmE9mT+eGhLWKp5YXeHH2AW2J2n51c7eeqdqmj+Kx248HtpzFcncO1nX
 NQMIbVNuyvtJEf+sAN77d7pPFz07NEggoY8Bn9mO56QYXykbjA9+ljkBOpc+ICbdzQgpV/zbXA4
 wZj+1ZxhbpAseuAjos3VLAG9X55mfeiBoMW0fnvRLPCVvJPfYlzVx3gw39nc7/Q4Bb3ekLZhBoV
 y8WKwhVE3GPEX8XYaY7YhPYwTVyPYjQbtbdlMX+kGcox2dK3reh9jti8CuLBEtz/WyPnYdk9sOe
 8O09bkRUZxJtyndRVyMBj7A8JwtHffnvM6cQ2D7uSh0PIQV7e/lxw+fgwmApWiIYbmDJb6ht//a
 wVPgFojbIgx+8m/6H9u9tdShjxqXFe4/cBAEEdhD/KRNSOaL40dfWTnu+I9Q/1/5hdXTSo5vskH
 0O9K1tKwY18CSmbDB6GYtkw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_094625_683140_AE0F3E9F 
X-CRM114-Status: GOOD (  11.03  )
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

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6cb9f6b4dbf6..e3f5a26c876a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -987,8 +987,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
-		rk_udphy_disable(udphy);
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
 		udphy->mode_change = false;

-- 
2.53.0


