Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820B3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 06:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfD49mysx56ByrkZgSzhxvm/5yDPMJ1rme9Y1NDR4zs=; b=qByfNA+k2+WCMtald+QnHmzrjA
	9OCXuTfMITDfzHOAf5swDQ1FYYPiShe5dJyDzOiElbeTScmuvdHAFv9DeH5oUYbLY1NV30D+xidf1
	pvbkF0oEgqrmiSHsNsSTMYeaph3gHo+B0Ft+J0wYXIuaSsqy4AMVgbgemfdZkXJnyWXxryEzmcshG
	Mxb2UhHFglECCi+To06WQjp9KNLKbms7Z266AByvRG7RKU3maK9WwkdXl5VM8lCycaovPqTuC+Pbu
	mOEmRLoV8A00fOhZdJ7ew6/DPIZIN2WImf9OoP0GlajaBgTF0D1FhTeoFa9hrjhoT0+VL7Dr+jRZ7
	iVpsMzyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucej3-0000000BmnC-2oGh;
	Fri, 18 Jul 2025 06:37:45 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uceZM-0000000BlkM-3aaB;
	Fri, 18 Jul 2025 06:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1752819998;
	bh=SfD49mysx56ByrkZgSzhxvm/5yDPMJ1rme9Y1NDR4zs=;
	h=From:To:Subject:Date:Message-Id;
	b=ubgSrIdLsKNnDnBm8/JtA7YulCQ2zdKhrvZATAEtmhnVmc2lZDgElxVQtcwpl4hqw
	 bXLm7wJ5DOCYpE1sCqbaJL95pxnYBBMRHCHIWrSJMK/8tYwTlNxxnnwmm1zUTh9b83
	 KPSIhZpx15JEnCK4F/Egqy3A3Dz5KIpDJS2by9+c=
X-QQ-mid: zesmtpgz7t1752819989t339e2657
X-QQ-Originating-IP: eoutYZ05PQmrVxRHP07fLErhbre+iSdNkklahpAft/g=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 18 Jul 2025 14:26:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5159759228802639268
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/5] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Fri, 18 Jul 2025 14:26:15 +0800
Message-Id: <20250718062619.99-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250718062619.99-1-kernel@airkyi.com>
References: <20250718062619.99-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NSQm2ODd9qLZih9YKEYtYvSvMiUwSCssyG3FIXzarvXaiRaail6jBAwx
	Yic9phCkJM19XwtqwA+QeeqJA9zH9G8owvtB+NkLW9TdHb4gh1hUFgf7fnNrANwAA0lX+sT
	5JIeeeB0wwb2U774Dt8wqNlO25Z9DThkDD78yXm4l2+kOxHPkO/L9AJDbgcFpH0rd8FeWjR
	u3mXjWPKgg90w9cDv0jXb9Lh6Pqwr7GOMiwOWCeb5j67bIrXwYBrNp4UjBzet/KWXafevHu
	DZIS0Bv/NyIdJbGUGGn8Epd8WdaDKA1qj77lY9wWH6nzS1nO4kJeqM8YTxtQYtDLoizgS46
	nrHxdGu9mFEWGL3L3lhanoYWnczCtinDCNKaq+1y332nxnt32uDYlEXWsApk5IsMMfNNuLp
	60iQ7gf3AY4OXjfb4UsaJgb2X2iLWfijC3NZ1PCQC0sJUQ3bb5oS6zlRuDdNuYITzb0t02B
	umjaaNTVtOhi45LF48W4qU2IYVN7kghjM9V2bxZdocLdkr/sRnPBLHxbVs+O7tMIe/fyVS5
	WjHQC6KlLAm3xUyIKyvHexE5XTEW93hVZ8G2nZgu1pT5+cvNuwtG78UDdCHT6WEatGzxTmY
	/61AVHg9DobMLhbMvSrpb+l/kwxiu+ITLEY4Msdx5XaFDRshfWS2EBXvp7sdthuef7vuFjK
	eYt/x6rFYsVQrM+13/JHWxgVntHRI+sZrH+zlfGynLzEpFu1kAJyB0adSbd7RfEe5otegkd
	7E/8TvXqliK8kvdPnAsFapfemesMRZA0f49ItQyKc43CAfXWMpp0uQ2TpTXNvI0pdrB6V1R
	hDRuspbp9jothDtppfn0SG8H4NLU8vmkWp7wKi8WR5cccjX/v7rPwjEdbox9Ptyxb8HXsU7
	W4wj4KACAMpkwgsOTbnAATbcN+n+h5TcQ7qdnSAbwq8IjOChU3Ev2Lladoadhz6sXroXHBq
	8ooN7WYb/S5VzHDs3ndJXdSenb+HJSvQnqbnQ/UMTNURkfQ==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_232745_785757_1D1262FE 
X-CRM114-Status: GOOD (  10.48  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 has two USB/DP combo PHY. With the help of external Type-C
controller, the PHY can switch altmode between USB and DP.

Their connection diagram is shown below:

external Type-C Chip0 ---> USB/DP PHY0 ---+
                                          | <----> CDN-DP controller
external Type-C Chip1 ---> USB/DP PHY1 ---+

This patch add new "mode-switch" property for dp-port to indicate
whether the PHY can handle altmode switching.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v2:
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.

 .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
index 91c011f68cd0..d503de7c7569 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -51,6 +51,10 @@ properties:
       '#phy-cells':
         const: 0
 
+      mode-switch:
+        description: Flag the port as possible handler of altmode switching
+        type: boolean
+
       port:
         $ref: /schemas/graph.yaml#/properties/port
         description: Connection to USB Type-C connector
-- 
2.49.0



