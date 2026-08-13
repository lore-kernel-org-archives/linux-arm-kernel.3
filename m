Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF989C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugm2a+isEGrk7N2xRhWWXkNnM9vhmOAWJZh64QP4pPE=; b=t3cBJpl+ZQXFeJ7Yftul63Ew3B
	gax8x7aJBSjD5MGo98OdKA4lXVU6BCfA2avRHUwr1Fx5z5RRf1RgQbY1wxbNtf/hhkNe9H3N968XP
	a7D+SHObdz78Wre9QnBAQ8a3jADure3JrXQo1bhGxurH+kTSbuJ7vLZkvBOq02UAsHdlU8GaLpZro
	+HnfvUadhTB2RrsnFiLSDUJmp3JFflXlM4QcnloxVp3A9rjME6hDxyQB1LqeoVSJrrahxHxtuS0o6
	JyQQ/OWcfDoxZ56HrmDNK262rR1lCC/y0glPW17wZwqZU0mmteC/zQwSwAmzJLJTLKxi4KVqSUwLf
	X3+CPs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucQU-00000001ZRv-0BbJ;
	Thu, 13 Aug 2026 20:53:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPF-00000001XM1-3QRE;
	Thu, 13 Aug 2026 20:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654311;
	bh=az155ty4ey0N2rbig1QNJwsNOxcqCRBwMjN2/AtKJko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LJ3Yu0Ah5WlEHZOCFyFFK60xmXWrsoYM+LSAN8ldjgHeZWVD3yc6hc8iADApun9he
	 CVwDKLdmhavQt5gZdU20+5a2vAZ08Tqu4RmzucM9iR/+8wikAq/OGDPZ3xZp6OCvok
	 uPoSPVt930JOhl+ss1i3SwSxvwcOTqS23jCKnu8UHiqt96B2lmOrgKIiQWRL1fYmDP
	 N4WQ8Ha6zl2HQuoBnlXBZlcw5hEQ1WD3AEiduSMsux52LnHvL5P21E1QxorhRiiW5H
	 t0ELvP+rIPuvealhNgZip9Phogceht5uhvgJ8a8amo8HB4GOkx2Dtu89qy+GkE13X3
	 LM9v8YpemCbEg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 10FD917E35C5;
	Thu, 13 Aug 2026 22:51:51 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C99DD480079; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:17 +0200
Subject: [PATCH v14 34/38] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-34-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=az155ty4ey0N2rbig1QNJwsNOxcqCRBwMjN2/AtKJko=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmXuvHkIKLF8WzgW8Xt3dZVo/ImSA8pyM
 bLRFywusTTPjokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qaD2sP/2X1hCEWM8Y4KcuUUh/u4WxeCzFCA3ny1NLWS/KbPpa+38JVyDC81Z7zXIZC5QB15es
 EdPXoyygKp6CqbvF9D9F8Cg6dPwap28pTwagQNFNRWfFDd9Osk2ifO+sbDMlSWDF+JcvDvRYm0M
 3dhe5ZdDx6k73+IhefVtJznNzPZj3i7ogUkj3CCyDTNAFJbZGjNzo6iTnUrhi1Ww+iAClIh9yZb
 M8FhwEnp3u/SmLjcUKfvbkv1sLWjuveEVDyhx7n4ul31i2b8J71v1T8G8ipS6YwP4MtdO11wOoo
 GAAH/ytvst+ujqfUxtl6uthTFQGbLRLiKeYUA8IjgaFwZSiLJYdUEuLX9JHJYeSEyyPwzgw4xTT
 HdizEvrOfVbDc3O6MWl3Xqh0GtFEj1+ci/8fgJK1XX9V8gyiOPAXsSx2OqMbUXhx8pCYvWv1acU
 m25neI2sKpfQZB4ykjikGq+QCCFdXX9q3wDrAN5pEmCPisb1ODoFWk5nIiEbOPPRDVwyWjRqyok
 7U28KIUYqqGotUdh/HVaznprBE4g6MqvJR9ONz5ChTWxmU2TBNSi85gFpeFaqIigzuerkegYdWk
 pjflGl7Bk7axvxdX+P06tSTyWkuUs7S3qp0TWLjiaQeBCe5J59xy6bDvjRn4t2RfyEWAYUgz9BV
 fXVugwMD9jljp0Dqa3PwzRw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135206_083796_82C95701 
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

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its PHY init, which
avoids the problem.

Since rk_udphy_status_check() is called after the probe, it should not
return -EPROBE_DEFER.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 21f282216aef..a6fe634574bb 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -750,17 +750,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
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

-- 
2.53.0


