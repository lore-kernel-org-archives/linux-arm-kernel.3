Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283E9C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 03:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCZvhONzGCqdt8aOzvcC4ldH3+VFAzPo2PYO7Ow+zTw=; b=OOoypJ2MNDkBBiHZraFEP0Hgvx
	kQ7z4cZtZ6BGKzV52kGL0yCg5//kFCWfaPUyNVAwIjCU/8CRzPAIeukpMvCFSigttXX7bLMIZc0yY
	gwCNDBu+e2sFxbqavdTEKvO/CQVwinA2+QaC3HYK8g2e6vajl1F5JOffeq648CYvc4cItIqe4FmYM
	5JttkyC3208xMhCDcZEzJXsqPeQ48RllXXn8QGXZjJ8CIECkk4/t55Jhs1wT/2jK5Pg9wLg31RtUA
	0CNIq4HMadfLp8ZjtBlA8uh44gts7O/VwAX3523a4KNbOimpRV1OxL3vZ5k5Rn5Sv0u+4ujh9ftwP
	DaZrDbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVjk-0000000E6pT-1uAB;
	Wed, 07 May 2025 03:46:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPyc-0000000DRQg-1SX0;
	Tue, 06 May 2025 21:37:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE1986115D;
	Tue,  6 May 2025 21:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E63CC4CEE4;
	Tue,  6 May 2025 21:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567441;
	bh=/6dotfspmfvLZQl7LisUvq7pisMsJv9hVeR4uJ/vVSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u2AbNYMSYOYrfWqQ6O1px2QdfPrjmcK/cyLL4wiBweTgVid3OHvfgg6nsgLSBkthx
	 k6LIy1nguMn4/aKj8homDQD7hGviz7DuVonqYdLB28ANcKFHqFPjlOMy7FrF3hcZP9
	 A7Jn/8XVi2uGp3J4fMq3tt/f0uh3vyZqikght8/DCEgqjizjcWxsN04N2bQbv6Upn/
	 ccxNeJI2QteEi+K0FkFJOrxRh4FePLr6FeVAu6OUNfdH8GKhnMpjjlJzBja413F7Pu
	 dRGLUQPVUgB6stC7vNk+NTbq32v4n2c5OtI9yBfehmJMNpTtg2a5mpfPh0mqV8tOyx
	 w5EK0HHIpsdog==
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
Subject: [PATCH AUTOSEL 6.1 2/6] pinctrl: meson: define the pull up/down resistor value as 60 kOhm
Date: Tue,  6 May 2025 17:37:10 -0400
Message-Id: <20250506213714.2983569-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506213714.2983569-1-sashal@kernel.org>
References: <20250506213714.2983569-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.137
Content-Transfer-Encoding: 8bit
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
index 530f3f934e196..1f05f7f1a9aee 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -487,7 +487,7 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
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


