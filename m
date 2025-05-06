Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93083C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0q0dzFoJ3WrDK/qF/e5WkmphHVI//oWdwzj8ZPt1ow=; b=qO4br+CtUm1MnFx4ZeBc6LQiNr
	Snt0M29Cz3KDH02bQzpfDFeWZ5GQ5/PZ+JKXkiLUyduyTOjYc9P6ZBr+yGvdDMm6MtdwobH3bXSNM
	edtwDFMt9yHMj2ZToh2xkUjwssRUjm8vbdpWAYxAeJ34mPneav2/g/3IW7UWtZ/Rj379z3dnyS2v3
	reA/2gt8mOsgFQNbkXiE9HzTp+qYNA68RtjyBy0RTl2p+88scAonrdkwW51FpguUWAY/Ze12y1F/Q
	c6UR4xNM4seBvIUOQqmgHoqyXcpGfjkShAMLoDd7GN55JyPG0VVyHM7bb/Ak79eX7M1FfcJE4pNNR
	TT4f82vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUcJ-0000000DxWU-2fGe;
	Wed, 07 May 2025 02:34:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPyE-0000000DRJs-1ivn;
	Tue, 06 May 2025 21:36:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B11C1A4AFC3;
	Tue,  6 May 2025 21:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205D9C4CEEE;
	Tue,  6 May 2025 21:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567417;
	bh=1k5f6S15WEvZFIIAndx3JpAhTytTqx5CYGLFKaXK0Q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WGnlRfK5OjePuxU/kX0ROoYfCILPxOzE9wmm3CQ07DAH/YCszm4UlHZxHve605Sn0
	 R06FhSrrurhiEIH5gaK0hR/E5R74YCg682J7RGjAVcvYhM6ZNi1Dw9lb/MqiAxcEJJ
	 Gt1LYzTR03waqXEcCrf1pqu1Tt5UIbEvyu4BHiNrHI/x5RGX3WqZ0nlxnZUxQZw2ph
	 J8U3p04HDd6k80s5QYnVFtdOYV9fN7k1yb/fTYUe4gw5aPvRiiaps5sAQIulstuTh2
	 9S7YLmWzlgCQXQ7afDzTooU1P5w/6gXgAouCjjNGsY345J0h2hzG/EisSZ+DWoN7JU
	 whhTS9cvpOSTQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	khilman@baylibre.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 03/12] pinctrl: meson: define the pull up/down resistor value as 60 kOhm
Date: Tue,  6 May 2025 17:36:38 -0400
Message-Id: <20250506213647.2983356-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506213647.2983356-1-sashal@kernel.org>
References: <20250506213647.2983356-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_143658_520759_05110610 
X-CRM114-Status: GOOD (  12.88  )
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

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit e56088a13708757da68ad035269d69b93ac8c389 ]

The public datasheets of the following Amlogic SoCs describe a typical
resistor value for the built-in pull up/down resistor:
- Meson8/8b/8m2: not documented
- GXBB (S905): 60 kOhm
- GXL (S905X): 60 kOhm
- GXM (S912): 60 kOhm
- G12B (S922X): 60 kOhm
- SM1 (S905D3): 60 kOhm

The public G12B and SM1 datasheets additionally state min and max
values:
- min value: 50 kOhm for both, pull-up and pull-down
- max value for the pull-up: 70 kOhm
- max value for the pull-down: 130 kOhm

Use 60 kOhm in the pinctrl-meson driver as well so it's shown in the
debugfs output. It may not be accurate for Meson8/8b/8m2 but in reality
60 kOhm is closer to the actual value than 1 Ohm.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://lore.kernel.org/20250329190132.855196-1-martin.blumenstingl@googlemail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 524424ee6c4e7..5cc00fdc48d84 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -486,7 +486,7 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 	case PIN_CONFIG_BIAS_PULL_UP:
 		if (meson_pinconf_get_pull(pc, pin) == param)
-			arg = 1;
+			arg = 60000;
 		else
 			return -EINVAL;
 		break;
-- 
2.39.5


