Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B60C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/CZFy/+U63y4u14qoFKdQgO25aMb7fPm+WLntcQg98=; b=EFQKwExvKei5oZiwwjnsecuPoo
	x0IwDP6pFymHSRLVeaLu1YilsnHbmt74j+rLnldQS/vxbVCL09iw2RFQ+tOLKf38WiZsdDomkStFl
	EDeYDJVo6pnsNWhTC2rL6WEE8EoSWe3jmHNxfiFYcnk2/8aKJNWww32IpKRNLHRNrQOfMKDy4mMRD
	MB7WBLMj7a69dPnD8g/5eXNGqbuoQIW1dEJSokLV8q6C5WtNhgE3J0dmTOTeaDCZZQZtYnDFg1WVT
	R05TreG34uMvB9RdsTQ6ChTushVc9pHaSsYL4IAup7eASTgTcMLLjAC+4HnEbVEN843cYE0FzMC5K
	fhMMpuww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Tp-00000003BNM-0Cf0;
	Wed, 01 Jul 2026 23:36:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TL-000000039xV-1oaT;
	Wed, 01 Jul 2026 23:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=W5jYrAum20qKXLQnGb/B4JCipsc2gTq8Z+PJJaGnvv4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GMZZyQIlU575XEhDRt0N5tgtDNesmMJLW18d113Gyv7M8gx16ygdAJHVvrntYG8+J
	 ApgfefBXHzOR9UiCuYwIWVq9G2WTAGWb3gBn6Ii8ALT54f0TSnpBUnUDhyudQ3wmqN
	 MiHnD1o6QeUyTpOI2OKUbBO+oK8GgUjwLMi4li9n6iF2q1Hd+sSua4qJ2SrOxwNi0i
	 YhZSty9Msi1GN8mDnfclYqdVkaZXA+24IfZnQ2k8E1Uw5fLL2QXQZdn9/2Q/UuwNrn
	 +9Ae2EaTeOe3TmYx4XrOP9dHSCctkyqN7On2+PbNiin3fK+c2PW03uKXNp92eE1fqt
	 Hk9wwMLZYIUhA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BFA517E35F5;
	Thu,  2 Jul 2026 01:35:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D629748006F; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:06 +0200
Subject: [PATCH v9 28/38] phy: rockchip: usbdp: Disable USB3 on probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-28-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=W5jYrAum20qKXLQnGb/B4JCipsc2gTq8Z+PJJaGnvv4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFTpnQm9rJMPM60lI+AIyU6bC0eHnVDgr
 oWG9+YcUg0bE4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qafNYP/28D/+snNi14jEl73SZCLvc5/6TkK8mp13P7JSsbKlnJtSEaoZOCLZuGgNUOvEFM3Cm
 skKfXzgDSmR6uAvvpG2Q3lEjT5wxZGlRnlJj21mmCM6XPpsRorzXYUJ1xIeoewQ/I+RjgWUWqEn
 Ldg+DZz1LmKTpLruKBl9F62YEeFDBT38UmXRMHjhdUSdTs064paamcDNSMpjhFE+D4dOJK2m8YG
 APpSaE74A+kvhzQEd97FOZSP7x6V6qeIk5fLXC20x3DVV44OtBLktAAj+xa+FwoKI1hmcAgyfTL
 YGyzla1ft/NL8RS7vc2OfoyzH1tt153/n08R2eT1l7XPTcxYq6hVgYcax44CJ4toLe3CZ+ylhpW
 p7yFp+02KqKJEujTF0n5mzu3X1+BvTpmVx/5lkt1tRUgBp0c3AcofuU/2bEW08H1Hok7jggq1G+
 6/BTQMLXhAUALsgDWiFfxbYkBqovBdqF/+7lyC/hMuBet/pbdGhdTqiUObbgJIm1qKVFP62mI4V
 +npWVyqWih8p936wSn/TRhsFbpYUc+dibhcZwriMgguokNqa5wbVL0wcA9Tf0lcnsjXxO/tzko+
 r0LssFdBjnujAOX/pcLvCbYmHFu/olEZy7ZmiETu3soTHWPpcDOL6xgCC0R5dSSrDFXQhn1CMat
 5SFehG+4mQH3K+2xyk8YuJA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163603_807764_A20FF75D 
X-CRM114-Status: GOOD (  14.55  )
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

Disable USB3 support during probe, so that the driver always starts with
a clean state. With this it no longer makes sense to use -EPROBE_DEFER
for cmn ana lcpll lock timeouts afterwards. This error code should only
appear during probe and the PHY initialization function is also being
called at normal runtime.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 146edd35cf83..f788405dfa1f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -756,17 +756,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {
@@ -965,6 +955,8 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 		msleep(100);
 	}
 
+	rk_udphy_u3_port_disable(udphy, true);
+
 exit:
 	rk_udphy_disable(udphy);
 

-- 
2.53.0


