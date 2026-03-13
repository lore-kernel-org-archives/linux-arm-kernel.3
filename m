Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E714107BCD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1T40iBP/BEcS2Gbcp0xja1nt1myecU5WbcaOae1LKo=; b=oY6xhNzVEDu9yXUb/oDN78zTnk
	fkiLTE7BYx9brB53W3jrQgwIi3ODv55L90QnSCwJUbjvFZfPOTxlS3VPS/sLT9A8Fkwetc718O6W+
	G/D3Ss+tplzGSP22CtUi2I2fPU3xYS9rn1gRA9dytFLvDETyWDzuoZDntsbH/QnOkWPklSas/pXdQ
	CxJQ6zS+qrruQLcHqnPnIXVRhdsXJm8xXisaKAyV4UrOHa5GvmUxmYL9/baCxn3gU+wTCALDj+ni0
	aO2D1mS2QpzJKQGfusqaKzQQ4d9SYgpymlKLvVRe05zcsDtNSwlHMCvL6Oj5xLAsjufoMG6nvYTPD
	/pO+2twg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16ld-00000000o8s-0bhd;
	Fri, 13 Mar 2026 17:57:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16lN-00000000nno-3dnn;
	Fri, 13 Mar 2026 17:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773424641;
	bh=wJZwMH5VNSE/o5UNMK6zuMUZDJCLHOUN4lmKhidacts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WvnYFtbY57K+ac6FBs3eg5Lo+L9B+Ldzkxlrd710Tm8UkNxNYorM6YKqV62SXX41e
	 y5FN1rUiBcQKuHTxi/ZPlvzR0amg0lFIskIrlIb3ZuTXbxq4XW6vVOivqj/HZWjnT6
	 b70KZnYZyuTf42231rWsQ9rk5T2vvQrIbZb5dPmHQ0sqJ8+DCY0J7WaMkM19PgDjYF
	 z2J+zXdLmFlu3BIYv9cI/1ZzBpuY6baDHVEmR22Sa5ebDqwzvQJ2mhahf89t8D+0S+
	 2JIQNIvfwrknLhOew5mPeJhe8QiY3geCgcz5mTdaSRNQBdlh73+JTHaSYDmtN7aP1W
	 Of/3wPaZZQKBw==
Received: from jupiter.universe (dyndsl-091-248-210-078.ewe-ip-backbone.de [91.248.210.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D6AA817E13A8;
	Fri, 13 Mar 2026 18:57:21 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2EE5C48002F; Fri, 13 Mar 2026 18:57:21 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Mar 2026 18:57:18 +0100
Subject: [PATCH v3 09/12] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-rockchip-usbdp-cleanup-v3-9-3e8fe89a35b5@collabora.com>
References: <20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com>
In-Reply-To: <20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=wJZwMH5VNSE/o5UNMK6zuMUZDJCLHOUN4lmKhidacts=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm0UAByLSx+ishzSoLVEUgcjdh2ubFoSoBs7
 Hv06J44ZO+MSokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJptFAAAAoJENju1/PI
 O/qaj9AP+wXt6JbzZqt5ymAqbDIEAzGKOq5pWCk50mwOjJCmcJYUqZHu6mAb/tOjxQQ1LC39p4z
 nP41t8odHGLzET3d9aM6uhh7Sb2A6fmQA3hsXufUL2nlh/ugC9gpYMBt6fdZLtwBhFLvAoGOM3F
 K8DyQNgGvt0ddN6hmLsYt9gMmBCrqFn0C0elli8oBDGnIWxCQwHsdXRrQxOhHJV54i0tjgq9n/A
 9iw8J1vZsYhXL7Py2znMkv6Hhf22wYSukwUtO1BJoPbxC9aum+w2kNTaWeb7+opf+oCH9lYzm0e
 T34PDSfNE3Oqf9yt0b5LTYyAlz6cyvyNgIZVDS24iJu7cibB/ItpZrXZF4ooQiQ3369ukvPFrha
 3+1hf+2vBGHOTln/w4ahfaFmAzJS36Ru0RJD1GpZjJokbDjoleSBBW0/f0cyh5WDcm5HoQQcEVQ
 U9JpdWpxXC5akvHZPbfm/lqaf8G3CFPfesxuJp4WCY+Hp2tiUguTVYAtsRz3h0znZhxbaqKYfXV
 N3Pj5A6n2GiK6cAGyS5KDl+No5YFspIHQBv/wIOLmJNxjYEGagOHsc+/sUvmiUjvj2CS/2S7Cxc
 hCJkmrNqdKcfPSKuYpJaN+BewmBNXrcfq9JOAwkiGvlnqL1rcVA0EUJ+v9GDCeP8+yQyk6Lh+2b
 qby/Zw9IdcmtEe6att18n8A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_105730_057703_89F0D2EC 
X-CRM114-Status: GOOD (  11.42  )
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

Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
with the existing helper macro.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6d7ca11b308e..1bfc365e2b2c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -75,7 +76,6 @@
 #define TRSV_LN2_MON_RX_CDR_DONE_OFFSET		0x1b84	/* trsv_reg06E1 */
 #define TRSV_LN2_MON_RX_CDR_LOCK_DONE		BIT(0)
 
-#define BIT_WRITEABLE_SHIFT			16
 #define PHY_AUX_DP_DATA_POL_NORMAL		0
 #define PHY_AUX_DP_DATA_POL_INVERT		1
 #define PHY_LANE_MUX_USB			0
@@ -104,8 +104,8 @@ struct rk_udphy_grf_reg {
 #define _RK_UDPHY_GEN_GRF_REG(offset, mask, disable, enable) \
 {\
 	offset, \
-	FIELD_PREP_CONST(mask, disable) | (mask << BIT_WRITEABLE_SHIFT), \
-	FIELD_PREP_CONST(mask, enable) | (mask << BIT_WRITEABLE_SHIFT), \
+	FIELD_PREP_WM16_CONST(mask, disable), \
+	FIELD_PREP_WM16_CONST(mask, enable), \
 }
 
 #define RK_UDPHY_GEN_GRF_REG(offset, bitend, bitstart, disable, enable) \

-- 
2.51.0


