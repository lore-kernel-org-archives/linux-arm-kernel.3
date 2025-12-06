Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BC1D3ABF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 05:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Db2q6dT/j6RKhINW0J1Xu2aTYUEmZfbY9ZOLYGcFW8=; b=hRiBwYc0Hp9L5VX8aTMAW5Gyqi
	Qx81+lNul7co4EHeqnP2sDEoWuqXL8ga/kWouH1OvZpQQe2pBhuJRDg4xi0SdVKNhnlIDgIxBSfPe
	Ldzh2sun6Uc3Hc8xXxUpQe4ajrhSFTFEmyycLOpqJKjeiCF7VeVpj7IP9XX9PAia0g3zqTS2B20UC
	0LJW4d6F45C/Ayj55ZA0qrtjrJ15Shz1pHGJgSpbilabDAPHqzIx9XbZrV6aLtOV/SBKG606xTiiD
	vVUsmTmenHXNr2nY1NEbdLO65Ftj8eEp8Mfs9KGLwPvmBHKXAQadpPwWmyHvfV76QO6cbHQZZ4ql1
	+NDCvM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRkXV-0000000AdE7-3YLQ;
	Sat, 06 Dec 2025 05:09:01 +0000
Received: from mail-m49207.qiye.163.com ([45.254.49.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRkXR-0000000AdBZ-2xFv;
	Sat, 06 Dec 2025 05:08:59 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c3493a61;
	Sat, 6 Dec 2025 13:08:47 +0800 (GMT+08:00)
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
	tao.huang@rock-chips.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/8] dt-bindings: pinctrl: Add rk3506 pinctrl support
Date: Sat,  6 Dec 2025 13:08:37 +0800
Message-Id: <20251206050844.402958-2-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251206050844.402958-1-ye.zhang@rock-chips.com>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9af21006a009d8kunmae94618c4ed3ae7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRkdHVZJGBhDGU9MQk1IGE5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bG+/oVHC+FD2dNeKBHi7ZwwuxQRf9EpErKon41AD7ic+dUl+vm7z44dwS/EnRlYYtxLLGWyrErjWN0O2iH6pJ+20tb1tlfYNuJ+vVmIQRiQLQyYfZHHz3DK3JlhmWwr9ZleG1iyr1xA5+bDGNX0pRX5lXQurCrOCcBL+j292TRs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=0Db2q6dT/j6RKhINW0J1Xu2aTYUEmZfbY9ZOLYGcFW8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_210858_160415_F5BD5C8B 
X-CRM114-Status: UNSURE (   6.36  )
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

Add the compatible string for the rk3506 SoC.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 125af766b992..76e607281716 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -44,6 +44,7 @@ properties:
       - rockchip,rk3328-pinctrl
       - rockchip,rk3368-pinctrl
       - rockchip,rk3399-pinctrl
+      - rockchip,rk3506-pinctrl
       - rockchip,rk3528-pinctrl
       - rockchip,rk3562-pinctrl
       - rockchip,rk3568-pinctrl
-- 
2.34.1


