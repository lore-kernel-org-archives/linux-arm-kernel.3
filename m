Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8EFC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxT/1z2hNm8G/JbKcv3M9yphlDY3m9NRA657yxlQWPE=; b=XRbP0JJURJ2eg64tKZfk1Ok6g9
	mwIPoFxXJcoql7XJXZuu1ZuUBxBhRuzNjocLJlbFNLPjorAO75Hg6YRYKS4FWOtFrzRfzLQSP0FR/
	KUoY1/4QnCwdu3divVd986RReoAeVWKeKCkLY0ZAfNydKXfdRO6aeOLcMv4op74gU1tNgE5CyCusj
	T8M7+YUi/2N16QO6d3EUUruQq4C4iRqVy/G6uIEMW0bWT18oa0jvFivy2rbJ5AFPy1dPTDktWhRlp
	kjCDoZToYDUEWTCCvD4S/a7SwOPHguR/qoZhOX1WwGdrBfH5pYtHXsyFHe6qXeiBaS2q70JgQl2X0
	uLfYkWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDaJ-0000000Bq0v-2hdf;
	Fri, 26 Jun 2026 20:55:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZu-0000000BpbX-3yoS;
	Fri, 26 Jun 2026 20:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507302;
	bh=B/EWcVc3B/o4P4Gg8Orkvfe3e6uQ/US5ZTpIUx0ygOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bD/b+imHu1N6TSLbY+iZR1gvOQuT2n9MfYacxu1BB+7f1BZrQ8pM7v1IPe4Xv9/Or
	 4dwBH5o/SYF25QGrL5XscdgHIOV/kro8XzHeJdq9dAE95TT8kKY/S9qTSfcFN3/VXd
	 nWlmXcyh6mmQjJA9Ukzf3KXTw0JE8t1+DsgPaDoauKh0YKLc+7R6E+aM5t27nlCS0K
	 0nK5NL4r5r/Pc38wGdQnc/LlxDTsskcmQeHRAlXZ6EROvDlE57BSIBeBakzsYKSacs
	 xXKmCTnsnhTEN0BJYTXpw4POtX+DQbXEw1Vhh6J1ma8UkSBaiOunGBGV55TgQovd9u
	 Z3f8JiXU0loOg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA86E17E14E5;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 17033480038; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:01 +0200
Subject: [PATCH v8 08/29] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-8-47f682987895@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=B/EWcVc3B/o4P4Gg8Orkvfe3e6uQ/US5ZTpIUx0ygOk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yUFyWL2hgWHH48E4rPmWZhX8euEHrYhp
 QiZ9B6GSkSyiYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qa+3IQAJC86ALYXZglYkqXR5NyZLrEdQQFLd8fSY9B/+bA1dNBJfSur1/G0Z3tA6vXdFMOAcI
 t73ZHk5LkPlSAWRE2fBhPSFSRIe4ypjlab26X7CEpnyIuQFCw5oEnffrGUGdh2PLFZaV4VUckQl
 fsyclV6slNpEqJZ4L5nfGx/ZuM2foUIDyHtgdPthwyHoIctUF7Rjpv5HhkrR9TjPlll0bjLq0HE
 ihZ7IXEjfyTngb6AfIJYPWi53soutEzf4OIImjoe8G2FzI85B2jyKMi875uS111Rq/RdZQx3K5A
 6+/XofVb0E0awGaXkKQqNYdohklxE4YmG8QlZX0t5kO5Qwercln4MZpW3Fma+hZE7OxADwDPesb
 8TLLIeMNi01rJipR2yllHwo2keu26dppFAMkc0XKskMGzQTqh9epVjuPYv9pwnHcDTXlE8T0Qsm
 RHle0wjGUgxbq7wQ//LAbpB9oT19lQUR4WS1oEGY884U6W5ang5Qmxs7K3oLlHZkN3Wv9R7KKur
 T5z6zNkMg/HqDzYIdzQdcMe1zZhcRKe99Xte/U73YagWiSm8GmPmMwze12EHJP8ljWwfD8rep91
 ed5eL8QybPQL99JzIm7eG8Y9lQP19k3pXDAiN3CU5hVwLVksEHzuAlVajXSgjaNxkAhjLhF4/d5
 ShA1cK0aW63K49TOFDE4uAQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135511_145797_F2501F7C 
X-CRM114-Status: GOOD (  10.07  )
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
index b8de0a47a616..7fb7e4669f9d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1020,8 +1020,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
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


