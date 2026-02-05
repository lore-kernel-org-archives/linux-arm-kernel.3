Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAF7ECD9AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ho4Pruwzx1KqYD+xofyqPWw/Rz/G6T9msAWOM2ZTWL8=; b=G6P3SbDeW2UpaTJAtVt1RgFd1X
	D6F4/EvyC4slBgy1cPpWRHU67ddSlfmsvbCCoOdlcTN4DR9saa1V2F14mxjwrUCpnVytQOjzkRlKC
	jLO/urOzA+m6QEFFufgpzrv0lf9v50+HdTuIZCT1c9fjoj85Vkd9fbRo3sZ8KGkT9DM48E1xw2x1f
	blHBCPX00vhBGKh7+wdnR02o60T97jXXEVA+k7g8gkrgCYZ58+JwhEhzf5we7UAisXU0vKDVwDy9n
	Q1w9OfdWJFxTXvvRy1qrYO1Cuj4H9baMusenKjG2/UOFfJ9DGzsfEe3kjFLHh5pIGsmCFKhJQNhMA
	3wNNQfpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6lb-0000000AV6T-3yIY;
	Thu, 05 Feb 2026 21:19:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6lV-0000000AV2F-1R0L;
	Thu, 05 Feb 2026 21:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=ho4Pruwzx1KqYD+xofyqPWw/Rz/G6T9msAWOM2ZTWL8=; b=MHMe6ZQGLejNwKJJ06xtrXED67
	mQ5rtKWw6oxTj9vgwMawZ8zHZlqtb6q399sO2ZE9I4/L4qmdVzVWTinc+XRXj5wtvlMTX3vuDymqF
	nvRyXciomzAE5MKrw5k8VzgFX8GTs8YMtRSyzuT5F9+AgOHFfN7BeEEhApYquQ5n4aBJt2lUs3WYl
	0K1gyC7KUQBONaCZABtHpo6KpAGgm+4+PGgtuwiXZYp2eAvcJvRCDdwYAGLxABzNZ2z9EtxcGcvuj
	W21HgZhq9mB3rqDFtv81nGQf9671MHWWGVdvvZfFcOuYhQ03C/UEId2jFGYRWcYKpjidFygL9mMeF
	V6rtpZNg==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vo6lP-007GGK-Q8; Thu, 05 Feb 2026 22:19:48 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: [PATCH v4 5/6] nvmem: rockchip-otp: Add support for RK3562
Date: Thu,  5 Feb 2026 22:19:00 +0100
Message-ID: <20260205211901.490181-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260205211901.490181-1-heiko@sntech.de>
References: <20260205211901.490181-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_131953_381243_F3A426C8 
X-CRM114-Status: GOOD (  12.46  )
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

From: Finley Xiao <finley.xiao@rock-chips.com>

This adds the necessary data for handling otp on the rk3562.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/nvmem/rockchip-otp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index cfb69bc58869..62ce22d72586 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -376,6 +376,10 @@ static const struct of_device_id rockchip_otp_match[] = {
 		.compatible = "rockchip,rk3308-otp",
 		.data = &px30_data,
 	},
+	{
+		.compatible = "rockchip,rk3562-otp",
+		.data = &rk3568_data,
+	},
 	{
 		.compatible = "rockchip,rk3568-otp",
 		.data = &rk3568_data,
-- 
2.47.2


