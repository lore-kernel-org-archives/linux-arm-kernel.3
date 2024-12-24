Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01394E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 09:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rtJBZYupoCo2RnfjzdA4ZjMJUUTzMcKgN9dhJSGNSh4=; b=m8nJxZI1IhK0f94ZmzVokW8O12
	7ctf9FuN5tB37H2hxvsm6IvbIdWnbKZLgyj7DZOtLH6M/pVcuvwctSfNKJJBwZ5qCS44zPU+BgoX9
	CLm4uEdPxotug958muznUUx7wJ79Dq8Q2ykBOA507Dl4giIFHLfDj2V9gV0ipv2cR4kRkOMcebMx1
	41GnH3JcjhH2sS3AaybDsjFYlPEe8tFHdBy2TTHvAo58+uSpAQlMJ2aJgOdiZB+HH4DyTSCu/S2tP
	tj2bg5HMCIRBvfUakFP8olYZN+Hsb7zpag/xE8QCy/xnk62iHgS7zLfkxZfc4p8/P/BN7IU1JvZFV
	tJ9deoFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1LJ-0000000BbqP-32TB;
	Tue, 24 Dec 2024 09:36:45 +0000
Received: from mail-m1973174.qiye.163.com ([220.197.31.74])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1K7-0000000BbcI-1rUi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 09:35:33 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aa61eda;
	Tue, 24 Dec 2024 17:35:26 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: Add rk3562 pinctrl support
Date: Tue, 24 Dec 2024 17:35:22 +0800
Message-Id: <20241224093522.3815562-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkIaQlZCGhpOQ0hDT09LGk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f805708e03afkunm6aa61eda
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCo6ORw5ITIQLkoULRcSHywO
	Tg0KCjxVSlVKTEhOS0hJQklMTkhPVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCTEw3Bg++
DKIM-Signature: a=rsa-sha256;
	b=EvYTmyXbZro3IeFOyCmPtgX1IanyQr3iP/c29QVqhnRNoSliEFck8j3Ks3bBK/Db4vTgBUnw0eLC0euTDxm17CuYnnALSKA1MrR6O7KfSRieE9B5ka6XD7+fK4U22ZFj5rWDqsIg9RmCU0BvYH/MjQhnIlF7Gf2yUiznfuuvsGQ=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=rtJBZYupoCo2RnfjzdA4ZjMJUUTzMcKgN9dhJSGNSh4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_013532_020571_8B366FFE 
X-CRM114-Status: UNSURE (   7.02  )
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

Add the compatible string for the rk3562 SoC.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v2:
- collect review and ack tag

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 6a23d845f1f2..80a2b1934849 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -44,6 +44,7 @@ properties:
       - rockchip,rk3328-pinctrl
       - rockchip,rk3368-pinctrl
       - rockchip,rk3399-pinctrl
+      - rockchip,rk3562-pinctrl
       - rockchip,rk3568-pinctrl
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
-- 
2.25.1


