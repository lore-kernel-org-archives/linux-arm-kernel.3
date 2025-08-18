Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA92CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 19:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iqh23ACcsC8GvST8VN7x6EyQXXxqEn7dkmVJZWPiBCA=; b=p6P4nfb6G0ArXtHpIbdC09UDiH
	qKcXck8+aAfDnLLYRNcqdjzX/QI8EdGxVihN9ej1GZenNTuV//YWWj1BR48E8g95OIpN6OnWs/uFJ
	4anwddKTMoXLnWE9ADidJWVmEx8BoXKPi7eEcMOPVBMz6Q2T6Q5Pwc2jb8/ryr9vFfFpj0J56iT05
	IzHdcTCp8+zCcqGMq4YkcN3lYkj60FazJ00DCn6humVjSOxdGUkLxi2DJJltPWUhWdfqWphDFtC3e
	Z2d7cIiVd05pFj3FECgeH7EfjHKPWSiEwNiGP3TiMclBG8T8ToxzYaGdvJMxumwp7Nok0sjzvv2Ca
	kc0z7jSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5nW-00000008YPh-3J2g;
	Mon, 18 Aug 2025 19:45:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo54n-00000008R0u-1JVu;
	Mon, 18 Aug 2025 18:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755543564;
	bh=M1dIcKPewO8GjoiDE0+H9+TiBwX2gefN9QiT1gI6ePo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ivgTVbxjl01+N69VTQFV5SLwFWo5Hh5J+7LLAqX13Kk+cuLs4eBoYOQpY1xvbQLi8
	 L2PevdS2lm3HMrb19yn/0MhkZXZJvXb9u7sY5yQPQhitkYyl9NwdVmmV/6P9KWgSYu
	 5UIbs6LETd6uoACcmShm2mgWpZ0/vj+JEufDXFa/DwXAaHr36hksIxafkWEDpUUKrm
	 IiaVRv0yV4yVfMBCHiP+UF6pkfD0yTQo9DzEyBgIrfrkxqVrtLGBJfdUJA2NxDoJcs
	 Ct6vwGvmOvaDt2epQuhhHvQRKb6Hn4yprzaJSA/+wJGKoNSE+VdqN5NYLvtW16D1cy
	 R7W3tvCsP2C/g==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id C445817E1357;
	Mon, 18 Aug 2025 20:59:23 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 18 Aug 2025 21:59:05 +0300
Subject: [PATCH v3 05/14] phy: rockchip: samsung-hdptx: Use usleep_range()
 instead of udelay()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-phy-hdptx-frl-v3-5-c79997d8bb2b@collabora.com>
References: <20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com>
In-Reply-To: <20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_115925_504133_3AD61D2C 
X-CRM114-Status: UNSURE (   9.56  )
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

rk_hdptx_dp_reset() is allowed to sleep, hence replace the busy waiting
with usleep_range(), to allow other threads to run.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 5605610465bc812737f773e0f6232cb6dbdc78a4..83ec892bd6760865fc9e361f4003c5bfbef55608 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1075,7 +1075,7 @@ static void rk_hdptx_dp_reset(struct rk_hdptx_phy *hdptx)
 	reset_control_assert(hdptx->rsts[RST_INIT].rstc);
 
 	reset_control_assert(hdptx->rsts[RST_APB].rstc);
-	udelay(10);
+	usleep_range(10, 15);
 	reset_control_deassert(hdptx->rsts[RST_APB].rstc);
 
 	regmap_update_bits(hdptx->regmap, LANE_REG(0301),

-- 
2.50.1


