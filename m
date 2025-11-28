Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAB6D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 02:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=; b=bvlHiG1cL1b3TWlCSAjFF4CdD9
	jTAVo9ZKckARmyxKcCZ0GcCWAvF3WM6unG45fVa2uR4HwUJD1Z2gkPtH4hehHluW5zzRDlGvim/xL
	9OK67DD57I2Wxf4qdsjO9SLKobA+xPxvr2JsKs4WlscPelsR/fM23crJTjfCPpRtS1cV5tL5F7NNe
	a6SV4Gdh9E0xaGoucB5fHnbLbVpJbH8TSdJPk7rCl+gOyULybqotLnTAf9vxuY7oJEoNTSY1t6qvE
	LJfgT/Rf1pk9ZJbNyCbzZWCEcAeJ9S8LHIadZtibBCn8KcQWbT/4YLpz0sAyfXJY0aGhF0pi2bVmj
	nZYlbewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOntA-0000000HReA-1u85;
	Fri, 28 Nov 2025 02:07:12 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOnt6-0000000HRYm-2bZm;
	Fri, 28 Nov 2025 02:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764295587;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=;
	h=From:To:Subject:Date:Message-Id;
	b=BjntW1/dPs0QuYwjDsEpHJKbnnU3XQT5pExWDAMeQsG0+j+n3Nf1vpUMLCdzN8gJs
	 iPoep6jzSrsW4SskOmgmEgr3JkPLuU99t6TP2L1ypHdUpwztOnu5U6mK9gylvA8MJ6
	 AqCb3wYVV44+kJtM5dn0Uv54Ix9nMpGux7jMH/5M=
X-QQ-mid: esmtpsz21t1764295500te85580f9
X-QQ-Originating-IP: mJI2PEDtqc428+UDr15mULFM3tVFMG2XEZtF0eDz1FM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 10:04:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17121756573935767410
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v11 10/11] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Fri, 28 Nov 2025 10:04:04 +0800
Message-Id: <20251128020405.90-11-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MPAlP4yRn0xg5Ydww/1Q8zcChfoH9CA+8ZPcQ3p9hXyl1YV4Y5kU3EQG
	PwJAZT6oflnuVE7lb5GXmcnpPWJXlBP3jxr9kZ6TnmoRLubykrEfoUcmOxOchoRWIMXVPgh
	ufRhECkTbuGS5UVC5T+mSD7YLY0P8RqjtqMyMkLvOIuD5Gng4DjpGw6y5AFgtkx6hY70iU/
	fs0gMTLhk9FlWSCBuNnAw3NKLBZRP/WzZUOneqrV1/Ec/gEsamUOqcf1CULyHn2ROXnU6nG
	Izkxxh5kbYw1zdbzoGf38NSV5/QQ+HpvGXfZ99h1VRsH9KSIraPSIVhsi/iqut5eKnu0VMi
	+rsVn/g1HVvfdnUxSIzxMbMckrlPsvYeyWwxeU62LREjeeelOsDVZImxBT3QA5UIQdQEFEM
	/PKCMSXoqvWoC9NxOvjPR3cJnWgr222IKE5Yp5VEq7sWisi8g6VcioNGSDaU/angX+V9WDh
	LzFS30tebTV/O67NJDt7/W0tKvQvNPdom1v+m9Jp1SNaOHvE5qOc6AWb+zp7bUiJ0rOmgEy
	T3QI9Wi1obMXLEDete7iFX9mFOAjop7pBnVTdbsM6ywwTgmDtlA7u877FhuCb8aylowWFW4
	vtZSGqVnuQVd5duEM4IoEGb2dioaNysQEb/0zwRS+PVzbVvQ5B/OHV/xhmhICLJTsWzwSkK
	0PHh6a4hJ1JO34wjMZn65p/aUb72fDU5skMQfDcTr4e/D19C2Y1ey4CFEjFEHxAnHAb9Jm1
	SzybTPsC69vxuli6VCKdeHkQioeGC7oK0BXcl22R3gxhJlLcWC5Yr/nevJyM7iJ0Hvf1/2w
	UXwwa8gOm77MkW/IAji405hPtJ+MoFZdnj//mWtijPq8SizvkDD6sckPDOCvXlRFewCWz45
	eF8oFz49wawfdRCsl676+bhVnflC+jPhycsjHV5JE3VSFLfDwsUVXCTTFn0R/NrPjZFPwl1
	quszMhtZLeFSNJCuhw0urYGPM8aK9ZcKmhE5JtXv1lSwoCsgGqLCnzb9AdweowoDWJcHSif
	33YMl9thQFtTPRXY1z
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_180709_158589_6149576E 
X-CRM114-Status: GOOD (  10.15  )
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
2.51.1


