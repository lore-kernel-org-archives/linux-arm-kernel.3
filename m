Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43935C5ACD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+4dBrXytx8Pp4M6Zce80QJWV78ekktqXBweda+729w=; b=n9EbT98PKbTg0/p7azrycloxsZ
	YnOmrEA526VVCIQDNUhPXI2f0YueOopN92k3L4RadXEZ+0dpEUyDj1eFPwDqe96sbHh/pRe6VlbKQ
	foHYaqpJPYKp7ZszYh8sdcSh6Zy+hgi+xY4/3t4Fm6BNxe6ySFohOARR171LOojewAIRTQghRJ5lK
	Js5EFa/U7zjeTCir3OLaBDJPsP+mTzq5BDfROyvL1dLu/VhWnJzVtL6/hLDut1K84KGNReEvLFLvT
	yHzLsUaqjhyiwAbfI/ZfnOGAD1Jq8A+cgtp0k8FENBSoKVQlpRARV4sNxCl15rX5kHtc8mk9jvdQl
	6NKnLJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1UL-00000006HXe-0GzG;
	Thu, 06 Aug 2026 17:02:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1UE-00000006HMK-4Ajm;
	Thu, 06 Aug 2026 17:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786035745;
	bh=NCHXRPy+LHmwXdxbgtDdQU4HjaaTIm7gCF0WSF5xKIE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kclgAkryddi/ggeMDdOFR0axFmRaZO+maq3eUJXUlC/LQ90NNxjoBU54CKnsHR5pp
	 Eny4QMmlDwxY5yc60c8fOc95iWNIxRdXvgsYqp67wOO609i28fbSys6DfgWeTJrPfU
	 3mfDxFtnVdc3knnbhtZq9SEaKNaeOJBYo/r6/Vh6SfLquGYgBnBXuEAGJIAKDLTDqP
	 +CDINSGalGF3SOWVSMxAoYwGx1f33/9ko23myMYTs0/vn8Rb0apvGDreIb1hnAgIxs
	 BE1EFe3O93empM0YNIqHRg8hyXxHrEMPrqyIcRLSsUYcxnlnz20UZgiMx9G2/gfovG
	 yORqFSXs5SxOg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9628317E10B0;
	Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 00A6E480035; Thu, 06 Aug 2026 19:02:25 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:02:12 +0200
Subject: [PATCH v11 06/21] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v11-6-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=NCHXRPy+LHmwXdxbgtDdQU4HjaaTIm7gCF0WSF5xKIE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0viCLK9cau+WT/e4i2y7zVBrDCfqPauJIP
 u9RypZzTrONF4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdL4gAAoJENju1/PI
 O/qaydIP/ixE6hIA212y0LRKuoC22VvVGE2JVyrPpjAYlG3QJKiAKFD8ZSoKFL9XJ9pCIBCyk2i
 R5ukXp4bNnParCTKl3uu4K5o9R6u/ZOfnrP8ZviL/zLM3EsC3+kfxsPVnEXpgtDFFeXbfZnfsu+
 qK4x9Dtx2qOXtZ7888G2WGWGMqDpXWKrqWOET23MrbV+qh6N07fFbSEEjuTzpC2Ncxk8fma7A/6
 bK+Uhn+SqO6+YhY2+pJV8ygRwaHdlO5WD69OIRFBYKaIEvcfDWriBkLEh+Jq95B9Ewekl6fOXp6
 LxbOuHE0YqbvME+Pvxi2xSEwwN6fpCwaQNXZc+cv6XIWuto/zxtByhYP3fc9kt97j6yc5Uz1f9a
 qKK6A8lDlyxSmswC0g8+2pGkTGD1M0jeKujSi54up9+HztAjQ9/BU3exDdUzy5YZWIzQ29t35NS
 9Inoy8WKUQPzk/aHjRDXixfYnF4HGwN9VsCViWhYD1cLdStyKzvzQKbNTE75G/lvY3o8wFaAUr1
 t9HVVTGbThtFf3aZey7mSX4cl2syLd3OUW5vaV7QTcb+O9z4g74i8bHaNCGpKPqkUMsuMwIvAa8
 aq5tkghJ+E2rcr4ji02kf4PkPCizRXNJr055DqVgCqmPlzde0N06Zp6mTXoQX1653kEiTqGwvIR
 GEwFAnkI3PWmeP3W/RVE2AQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_100231_193252_C3237992 
X-CRM114-Status: GOOD (  14.15  )
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

The DP AUX transfer method uses a completion triggered by an interrupt,
which can timeout. If the function runs into the timeout and the
interrupt fires afterwards, the following DP aux transfer completion
would trigger immediately without waiting for the interrupt. This in
turn means the next one would also be broken and so on.

Fix this potential issue by re-initializing the completion directly
before sending the AUX command.

As this is racy (the interrupt might arrive between the completion
re-init and the new command being programmed), also reset the AUX
controller on timeouts and synchronize pending interrupts to gurantee
that there are no pending AUX transfers when the dw_dp_aux_transfer()
returns.

Due to lack of a sink, which generates AUX timeouts, this change is
effectively untested.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index b1856418f441..2573ea2bb574 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1466,6 +1466,8 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
+	reinit_completion(&dp->complete);
+
 	switch (msg->request & ~DP_AUX_I2C_MOT) {
 	case DP_AUX_NATIVE_WRITE:
 	case DP_AUX_I2C_WRITE:
@@ -1492,6 +1494,12 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	status = wait_for_completion_timeout(&dp->complete, timeout);
 	if (!status) {
 		dev_err(dp->dev, "timeout waiting for AUX reply\n");
+		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
+				   AUX_RESET, FIELD_PREP(AUX_RESET, 1));
+		usleep_range(10, 20);
+		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
+				   AUX_RESET, FIELD_PREP(AUX_RESET, 0));
+		synchronize_irq(dp->irq);
 		return -ETIMEDOUT;
 	}
 

-- 
2.53.0


