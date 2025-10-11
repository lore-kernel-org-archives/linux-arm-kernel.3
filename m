Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7205CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 03:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDiOxEFqYuonRjIga1t9o2u02p12TN3hXALWFcjKD9c=; b=qlwrDOLgGPYLVYcAEQkIX0uj0k
	cKQkqwvE64Wn5jLP7mhpqkJeJ9nKZfnHbqDsYcb3OCEzkUDuBFfUcpBwm2Nie/ZWvpmU34MOlNC3p
	/r9Pc6Ztz7gmYSK1YtkXmmC6uurpRcOb60otlG0ZLlBrjA2c7fywedj0MZekcSV2y8pyCeGCmxRiL
	6g9lm/bij8pupmQvTdF69HoYWCkryxgmJB0QdW3bplv17vhfiT+X3d6+u3UHMMC7zBjvKllb4OLPt
	uzCjpN5n2WGPPLU2Xg+qZjpuLYzQNQFAy+sFlUcF83q7Qhe0yxAvOiMKuiT+b7UiKSlLkMtTc1pIa
	mro/B4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QNK-00000009kZV-1PhP;
	Sat, 11 Oct 2025 03:34:30 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QNE-00000009jzE-30Yg;
	Sat, 11 Oct 2025 03:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1760153587;
	bh=cDiOxEFqYuonRjIga1t9o2u02p12TN3hXALWFcjKD9c=;
	h=From:To:Subject:Date:Message-Id;
	b=ULzbKR7QcbMf0nqC2RApmSGAa83W4Fcpxw5GOgeoJGTcfRtYTvBjdZS1uDF9wL/yk
	 zHm1l9mTjFd1maOSE8+iUxnqzAkuq7Gqr8ml4i8UJDA5WGijwKEzJZdjDtjVhaXId+
	 8M+0wvuqeSj82wTJ7LjVRr5kM9HrZ4oUBpDcggCw=
X-QQ-mid: zesmtpgz4t1760153586t91072ef4
X-QQ-Originating-IP: aEg4UWYxB0z7r83n8X2tWwn2jWviUUfrqwKQvlQMsCk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 11 Oct 2025 11:33:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15608153798208442778
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
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 7/8] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Sat, 11 Oct 2025 11:32:32 +0800
Message-Id: <20251011033233.97-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251011033233.97-1-kernel@airkyi.com>
References: <20251011033233.97-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NafziRg7Bx69LfuY1FvhTM8dyyKGJ539o8EgMEvAJa0Z3/n2Zdvt+ikM
	R95CWDMfgvcahPhDB3zpYrospcrZLysz1dU5Ay0Nlbn36FrEKQxw3AsSHuhDZSWUEVQhFRC
	a1maIL+tc2oKwucfHquYUFeJG1uJI7Q5qly5MOVQjmpnKV1QACPwG+rz18jEEXSFYSaYPa5
	1fUEb6c6qJz4UTvS2jTopFto4eHxEEcJqlQdVDKG/V2qMX+8YxE6bdV8BvO3Z7uKLQElaeF
	Xm9ijS7OiNw4C/drU9cxB4NMmw/0vkrUQvHXXvYvtfZwwJxbewU6XXrSerAHw5YAM/+GtwB
	G8NnBnv5uMt5E+JnloiEfDuSb3hzfNaM3sXxfOPxLRzIH5oP5YfX/LR6qs5NUyvtSiy9hdt
	9IAGXNCQLpYJa0adYFOQx3tov5bAm+PL7TmkdiJkk7gPXtpwwRr5Ye0M58y+h1Z6M77vCnO
	nyYIThiRkAACkYdoQytuURAFCwv7uwt70yQYeKrstyE6uhW/zQMf3S+14fuWVjWJyfQe7J6
	ygVHHd34SIwObLK67XOsLZ5WPHLPFE9lVQBeu4Qj2vT2wutAxA2pOKof1FQUgfNIHx+76Iv
	X5WW9Pz920x1s7ZP55F0Te16mylz99AYjrqfD94aI6TjZo2VOGFbyjYkep/PxZ25mxbSWpQ
	NNPd9UoIxTtBLuwORYoC9ls/NLi9zEyDZr7pN8iIFSyYwdrrk4Q6ttq12GzmM+9SmBeieFZ
	W4zjDbEAOPypAfDElI2HV737YkFQugl7jHyfYUYNodZ/DMlMA7N3eyYeM8Jo4lWKqplWz99
	B1QLJEt4wauZaC6ZngnxevqBSOuAhBKM7ac/iYGvZcg134X30dZeQYKeOj5pq0rj78MaeYo
	2URn27h/yH+U5TooHTcoDNbpnjMQ2kQtGIy1ntJoVcy8MmvcT0j98xpXgq3DeG0O4YSgErA
	6es4gj1VW2D9+iYR0OQ6z0I++RXAHoRwwkACagkxu1RrDSOs39x5ZqfCVLvMwRuR0ZLgqkQ
	7ZyBiAThcw01y5H3tMJhvYNGBWzqGKQj8JLl32y0l59HzrW9y1
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_203425_600701_965C6702 
X-CRM114-Status: GOOD (  10.27  )
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

Let's make the ports nodes of cdn_dp in the same style as the other
display interface, and match the style of ports's yaml.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v5)

Changes in v4:
- Remove unnecessary #address/#size-cells

(no changes since v1)

 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 4dcceb9136b7..93b42820998f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -618,7 +618,11 @@ cdn_dp: dp@fec00000 {
 		status = "disabled";
 
 		ports {
-			dp_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp_in: port@0 {
+				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -632,6 +636,10 @@ dp_in_vopl: endpoint@1 {
 					remote-endpoint = <&vopl_out_dp>;
 				};
 			};
+
+			dp_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};
 
-- 
2.49.0


