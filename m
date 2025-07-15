Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BB3C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdxuukrMJyMvzJ16KhGFmRwb53DnIsrK3r7HucbSbmc=; b=N1jdh1DF3cQ+ejmJ/ARUfozUt4
	homUFtL5KOA6JR+P+wgFOd571XSYyDDDWj5OXup3uCRCHWyKlVZ4wnDqf16T9Hwk8NzTveIduUP8k
	k7vCn/M54J1v3d8W63xGEt4BqUi/S+lyhi7880J9adzlNdFSqsR6J8oGH4BmpRRd9qGA5/zzlvPbe
	+s5fK02VOT6IKHxJ9xOzTHSNvIwBmOyNWKz8w8p+llNcdtPflsUw4msgXVfrvIFLscITm13IpJtyi
	xVcW+BHig/IZILFhNnvzDhhR1W6LHc2Nm7PEm5E9WLNYuU3SLyEWJUALC4mhV6Zr7YENLJBleNXB1
	9e5zs/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdyw-00000004xr2-13eW;
	Tue, 15 Jul 2025 11:37:58 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdnc-00000004w66-2BGR;
	Tue, 15 Jul 2025 11:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1752578714;
	bh=PdxuukrMJyMvzJ16KhGFmRwb53DnIsrK3r7HucbSbmc=;
	h=From:To:Subject:Date:Message-Id;
	b=YuIUcMBux9vcBm31tT4VniU5BFwp5Ncdb+ntuBiE3Upec8MzRfeu+YykP8ThbULz+
	 VjO4Ial6lHC+GNUzvOpxkXq+26Kz7L3amcPQ6icZ0OK0B7fvmR8mX9g6orUSJXfUP6
	 vLPZcCLIDb2rcCMCBoMl7RXIGIGxxoYhuOIOV4io=
X-QQ-mid: zesmtpsz3t1752578712tf0188769
X-QQ-Originating-IP: XVdB7d8ltncWpCfKxfEuv57ere8QMwHyZ9NM2AK9eVk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Jul 2025 19:25:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11091658648405409275
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
	Diederik de Haas <didi.debian@cknow.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode/orientation switch
Date: Tue, 15 Jul 2025 19:24:53 +0800
Message-Id: <20250715112456.101-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250715112456.101-1-kernel@airkyi.com>
References: <20250715112456.101-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OKKHiI6c9SH36/h/9qneLh9I5MxAB90IO8g4kzM0Wgvv6GpZEEm4QTxW
	n7YdQKFjCn9IcqtrY+28B01QzRRH4tbGXtRIPiNO947eusZ0xYiSzxW8xg4dl15MKAyumJW
	4ZzY8CH7keStm3tMSod/FryURZPpBmNv4SJ2jbiGVtNiSTcudvW1aKAV1p/BIq1VFPcf4dA
	jUQb2MeoZgL+090l9q7OhlGwxPaHTTwBJps5mqnyEdetSxq/MWsgnuSKnYDosuyQtwX2NWc
	Oh8YGdAwMJNZqJswbrISqjk3+wy2IZc39VrPWkdsFuMJ//Nj92Me6N6oaaTy9CHhZl2BtDR
	MiE/7RSamUNxMole/gTiLa+kdEMT4sF0PbmnlA/ec8BaNK082uTAQuDY5hrac3r3JAN+GGg
	4zUCepmVRLnRM55M/uM08QtLUbuXcg3Rsj1Y8zpQFuDMfC2ccFFbd9//PJUHW3HliLLN0Rs
	C0bmVzPZh3GhEMZb+0OcVEMlRteHSlr2MK41gcVRExF1vujgk3eWphlx3ax0p1tpQUH/djQ
	o4E0/RrHE30cVikKO5Gd334FcxcYQ94hFar7qbiWl8bkH+VmpfSVUpC+shPx9VnyTQa5BQu
	kPFAk6Vp5kkOgU1d82HsiaMxixaD22WSmokDMRvMFLwOanwVyYKZrK8elKIPuP7DZsuY+xp
	GKYvVTEH2uz4XHIvhY9aQqHPcusQfPU4VTFrLSQgnQ/8opbaQvdo+0KCpiJnpBTI+sicbTD
	4Nj7zTQXOR3zsxbqOq4z1qZ1wUc8iAEeDGxbi3bN+M/w9j/q7ZpbTDPe4EDzn+ALTGsVD+Y
	IeLoHjKDax0X4z8OXKLhzHDMw047y1Ocb4Z5xZa3r6/gi3+fYWqcbywucRDZjnntdRBMtgU
	Gnw/YqvwC9INC/LuApRHEQMKolN1XS0hl4tFrljJyWjpSclorEJc7esqHPlJmI+FZ+y33oo
	MXxECCUc0KlTLhYNDsfpb881VWGAD7H5LFr/q+O7LBx3A6oDGztibL0VFAlq1Jyq+5kFRdn
	kyBVoFSg==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_042617_222920_AB343347 
X-CRM114-Status: UNSURE (   8.53  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Add support for Type-C orientation and altmode switch.
The Type-C controller can be specified to handling switching.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../bindings/phy/rockchip,rk3399-typec-phy.yaml    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
index 91c011f68cd0..a885c6893a90 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -43,6 +43,20 @@ properties:
     description:
       Phandle to the syscon managing the "general register files" (GRF).
 
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  mode-switch:
+    description: Flag the port as possible handler of altmode switching
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the PHY to a TypeC controller for the purpose of
+      handling orientation switching.
+
   dp-port:
     type: object
     additionalProperties: false
-- 
2.49.0



