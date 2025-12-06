Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B641D3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 05:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peBVdRDCYMluVzoh6VCOVP/33y4SVuD35nSziJTXUi8=; b=JnBSHwcGZRmSA5Y7bTOmDniBRJ
	PpfK50BP0LI4gpFPYnHFH/FlzHhreuaGY4SNAkWjDJtbln7duCS6Ti9GbywHXriHPZnAn6SpY6HBh
	QwguR//XLLCLimLrFaxGFtTJz7cHkYuMiUZXgPEQ0FGPrWU2opvuUNUhvCO6J/qsfM+jqiHRX8ZKF
	+lyHku0fth1El4UagKkWecKZeJoGw0atS2+sBOdVXN3idrnk5Ge2JfCGJqqrKEL2+0JzAHJZf0lIS
	yOHZKW+Kg7ZaczZeWuk1PGWahRhdZ1EENGiKZp65jrAtNSHcoFagFmOra7ytBRrKMnou5k/y1JBaa
	h9hiXCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRkXY-0000000AdFx-0XN2;
	Sat, 06 Dec 2025 05:09:04 +0000
Received: from mail-m49221.qiye.163.com ([45.254.49.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRkXR-0000000AdBX-2ezw;
	Sat, 06 Dec 2025 05:09:00 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c3493a67;
	Sat, 6 Dec 2025 13:08:50 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v2 3/8] dt-bindings: pinctrl: Add rv1126b pinctrl support
Date: Sat,  6 Dec 2025 13:08:39 +0800
Message-Id: <20251206050844.402958-4-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251206050844.402958-1-ye.zhang@rock-chips.com>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9af2100fed09d8kunmae94618c4ed3c65
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRoaHlYaShgfSh8ZSk5OTx1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=j0DLJk/ldHyUNN1Lze38fkhfQWx2G4XeWPjZ5OjSM0RYbHcXbX4h3Ij3/bceXUt8wxI41y2S0+XQM1sjkgk9ol1pH+noROEq8YtQ1h+S0BnBqRAtpFI2PB+9PAO3HDlDQzpZxLABrV2vYPFl/6FJnxYbU34cM+D5ou7UgzKWSBE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=peBVdRDCYMluVzoh6VCOVP/33y4SVuD35nSziJTXUi8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_210858_164128_ECFBB65A 
X-CRM114-Status: UNSURE (   6.70  )
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

Add the compatible string for the rv1126b SoC.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 76e607281716..93bf8f352e48 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -52,6 +52,7 @@ properties:
       - rockchip,rk3588-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
+      - rockchip,rv1126b-pinctrl
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.34.1


