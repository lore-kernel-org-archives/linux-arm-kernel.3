Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40446CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ur6qA6hAP712lEuWCnSpdVtJp7T98n6tWpR4IdaSLTQ=; b=qIOoa3HSF67h+4ds4B+m+crIjl
	WN1Y2usyGZO5ykVX0iZexhfPzF0rYKUf+DvB4j6uuasUE1mLL3PRdjrka8a09ykjwSfshyWKi8YKw
	1Byrxus4So+fZOvNZoQpKkvzWfdhOEYCpE7sd0FcCnE9VugT2i3q+WjoWwjliflTGXSRpdTjDgf2n
	22LFCQENXYhFRVw14XAJIQ5JrfTKsiCI+Jfy7wq/lijL2kPZagwxfNZ5gaDCA7qlJba5TOAoiFKjW
	VVP3lMv8m69OEEvDSJemxfJLEy50C+hBvspHEbK/2p3GWjXaUiRfm+fan0UW4ndGdZivwYocBDtpP
	AC7QN4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3W-00000009Zmg-2008;
	Thu, 25 Jun 2026 17:40:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3E-00000009ZSv-0OYs;
	Thu, 25 Jun 2026 17:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZdWtmyG1oaJCucC0ghgV5Lxq23Y5n8RlHbhXeFfM34p+sDpm/hfWc8G97kfVWPyQO
	 BmBfa2hII82F1o7sS9LQ1t+zoXtLyekKbl8q6Fna64Lz+H2TB/RENbXJytCroq8XhD
	 CLP7jm5YLSihuacTNhNN9VISolTa5Ydd6dz6Dl4yZT1yso+59iIHUvauwt9FZpsNcF
	 wOUtX+cMOQ/rcWTqPx9Hf4OpEK0MT8V+QVziwbU9LNvqsRLajMWzNCTrDAWIJ3NkeC
	 JeqAouVSHAI55moiU8EzoV+c4S6rF+idDXO8gqLPR2mHxVYOBsmoJUFsPslKtHEKCF
	 utTXfUhNW4nAw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C48517E0F44;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F33CF48002F; Thu, 25 Jun 2026 19:39:39 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:31 +0200
Subject: [PATCH v7 04/27] phy: rockchip: usbdp: Fix devm_clk_bulk_get_all
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-4-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9oBvh5fI+O4i+iBX1HMEwHdLwXMGKbfm
 CMmVBcQz81IdIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfaAAoJENju1/PI
 O/qaYN8P/3mE4/ylrhwoK7kkvM/UM7TxvzPUyruDa4t6Q+TMI+CKvwnKXknr+2HUZr86qHjQX9t
 uE72uDVjwOSQXUqhTt2OvO9qwNVQQ8ewYVnI9O2j77s3bfrzql+UfX21U3AurzwFyJrb1JICC4u
 fZq+l2TZZN1X8WNCg4knwzB7Z+LRn31p9kFqYEhBHmrIDRySKDbuOVdddK6LdA4GUP0B5uNMhoC
 4cXTnDrJqoxaDcj3TH7mgBvUJKz3MX4nWQjB25bEYHzJ3aMCe571JOgu04frtU/ONu6C7rOjOfH
 LcB5cGLrQyt9XiZhNwwkPK8fpr/HV1WoOAigc9iwcIfJVRsOnN4Gmfj04PixiUML0F/egSDaKOp
 ulz8NtNtlOMB6iE55I7mC8+jGXoknoDjWQ03JDtoLVahRBlL8Yf7KQqCDNJD3YSfGoQYCMqhOVy
 vz7+EdT0jps2KWjAxvXffoHyNTdgsPIRbjECGtJEGw8yg7dG6BWTSXDsMUZDq8kvq79XTR+ZB9x
 bzmWI9Wbcu66i5QiJSrHey6v0fqruwoVODZjzsiE2E3GAAWq4U7z4JFG8HAXA7/EzWngWaVrnY+
 9ZCfqIYFKeBlVHxsjSUYYQV9CcXmhgcc9StRcpNlQRMgjskH9nkxv1/uiNhwCj8LsXHT3Swd8Bh
 0T5aGfK4NJtNWkHSst4gn6w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103944_283224_FC93D746 
X-CRM114-Status: GOOD (  16.65  )
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

If devm_clk_bulk_get_all() returns -EPROBE_DEFER, it is replaced with
-ENODEV, permanently failing the driver probe instead of allowing it to
defer. Avoid masking the error code to fix the issue.

This effectively drops returning -ENODEV in case no clocks are being
described in DT. This special case will now be handled by the follow-up
check searching for "refclk" and exit with -EINVAL.

None of this will be hit in practice, since the driver is only used by
RK3588 and RK3576 - on these platforms the DT is validated to contain
the clocks and the clock driver is force probed early. Thus there is
no need to backport this.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 12dfdd470a78..2845a012eafc 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -427,8 +427,8 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 	int i;
 
 	udphy->num_clks = devm_clk_bulk_get_all(dev, &udphy->clks);
-	if (udphy->num_clks < 1)
-		return -ENODEV;
+	if (udphy->num_clks < 0)
+		return udphy->num_clks;
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {

-- 
2.53.0


