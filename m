Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742A6C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrk4blxHLqUJykzlxgfb1Qc5qfKoiGnS2ANd2C+Alps=; b=IIX4vOydzN9RkGXyDV99Lm02VQ
	IKAQK8PKpndXPnST4F+WVaDgR8CvFTL7/FuuqXgTbNw7Ttag0xxezjpPtEjcTKhMozGILg7BYpneo
	O+VGMtqCCvfO4N1Pf/qqUAOl5EErV96B/osCVtGSGzL+pScvCRFjf8tBrcq8DwPq95bz2czUd+WXq
	ncnEezcnPs+a4DYAjq+5Emncq4xIsVrclZ85AwvQMMqTooLEqJWr7pMB/wcoa7xcJk0YMImWj790d
	6EHkz+QYX/0JqSQg72CtNYqIQvHPQtPYHxRKftUbriLkVI6BFwwcVlWzmbFb5M9JoMDINYBylwvop
	rmjHjvIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ujr-000000074uF-1F6D;
	Tue, 15 Sep 2026 15:06:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ujl-000000074qh-16KK;
	Tue, 15 Sep 2026 15:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484778;
	bh=ORTgeXoBWHzhph1db5nH3ROLXbfd5UE84Yvg8siOcNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZbpz08/GTHJOTDuae6L1HH4jzDWq4Jj0uF0HEt0TRnI5m9k95yAnqyXddXsrASC/
	 5yLENW2jbDN6Hd46JbA7cNxn5pabLEhexpbBJ61Dyj+MoqegCyqph4ZSI8qMbxuVwW
	 yceQO3s+43k1YPtVH0W/v5q78mOeF4Gll9xnGjdSROkCNjZ3WmYl4QhLglzwaBFJ8H
	 X7H2ttQ1FGrygms5luyj7G9b6RTwg0NXuq8jwc2mzFcrynQA36DkhZr50pH/m/VXpY
	 mGzqYUVhlX2LgDqHsKfmpXHaGi1oKU01RHfUdqx4OXAYgaajP2moW6llfozn/TlvD4
	 LJAPVUUqUldbw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C26817E015A;
	Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 622DA480030; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:06 +0200
Subject: [PATCH v15 03/11] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-3-8d507cb1174f@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ORTgeXoBWHzhph1db5nH3ROLXbfd5UE84Yvg8siOcNc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXuqvJxfb6SjKucFa5VdpqsNmkVhLhP8fG
 UXucuxt7FkaRYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7qAAoJENju1/PI
 O/qa9HwP/2cU48QE1osoI9QFtS6x+MpynnM2oZW33/E0WStGxTuofP+w3S3EOwKzEEevJVq9r8O
 0XvzFn/jT5Ovkvz+xKgRrmxpzJtwe9iA5tpIJsut9t/1Es8dpC8EBNOSGwzbkg9841NpYEtoDR+
 rAlZWnbp0oYchd1/58Bf2uVoaKXc19P7LBKvxYvIxEHW/umRx7xaPEjLPpt7F5/qocaAfZljazt
 j2KxWKG1D03cDYKijbmqY4+XL5oLBZNje2oKyDiu/+fIKKjv4BXqgxNpv9fgXgSdBm4PhfddOXC
 4AvVyFIf8T5BvMBN/c5XTvaJ0bOiazhzBl1YuSTtskz0zfDkU9Ebz9Cw5wcGP10J8QUnG8qJj38
 Mh+6EzipsJXhxTpP78gm1DxvmSbnR0TQoGsq5UrLAQTSqWNGJDT33yh0OYCGYIIiAxUqyoIr8NV
 rtYdkyKCLlW8cGtVCLwkvIxs9NvWopOn13usow8WvbJZ//E7qv41Yl+OFLPWPr8hawnmpxrB/39
 fm4tSqLCK/hofRBOHl8EWzg+ho199M20pfLkDyLULrTWpg3+y/XZDX/sBGY8X8SiyW5XccRny95
 KuB7bYg7tSl2/jAklL42I07rM1DGTYrCuJxNTQb4QlRBOKr3GVms8CPBkneIxUU6oNmxWtPRJMz
 b/414njHDrwxxv0oD1pI6LA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_080621_458408_4A45A8FD 
X-CRM114-Status: GOOD (  10.62  )
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

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 9767fba23660..9a4ead585151 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -619,6 +619,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -630,7 +631,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		goto unlock_ret;
 	}
 
-	udphy->flip = orien == TYPEC_ORIENTATION_REVERSE;
+	if (udphy->flip != flipped)
+		udphy->phy_needs_reinit = true;
+
+	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 

-- 
2.53.0


