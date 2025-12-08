Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB82ED3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 01:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=; b=CKZ2Uikl9WITwjNASfQJgTGy8A
	d08HyDqNUxXqNfUXHWJKyFSNyoTcQhS1JdXVDQ794qqHW66dZWxncXgK7hv1is30JwSKnpVTe4P/w
	ongyKHZL2Yo38Dupv+APIs9bnLtp5u5/ZHygOgcreo7CmYgzn/Epbcm0OYj9vyDQfLZsT5+4sR+4N
	hvHy+O6ofLvDYHNWTEif4QwdxXzHXYkLJfLeFmN/YhJmQcwQ8Krqs0cDVi/b3W+DLZGm4oRTinMNq
	hSshgbvEZXdNP9c35IkKgczQ1aOzmxb086r3CjVnyPmdmwk0OoLaE3LEqsqdRAzTMH8YyAMqiVFb9
	kT+2lR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQVG-0000000CR48-1dMQ;
	Mon, 08 Dec 2025 01:57:30 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQV5-0000000CQe1-1R2P;
	Mon, 08 Dec 2025 01:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765158999;
	bh=pFI7M+6j2JewnD4BwkGRc0QPG+RPFm6rGXiCORxPrVE=;
	h=From:To:Subject:Date:Message-Id;
	b=eDwkX/1B3u5Pj5Nu6bk+AoaxIyZfXf/+w6RCpS+BXV8x47UMFvQIEv7hsKLmX5/e7
	 Ubj6p7NpVz+pz3s1oen3FTPQbUy2OWKYb+VJAify4BHRruD0nVaEkIXhQJAIyEtPpO
	 uw1GY6L+MPOIrhzd+5nD9D+8xNnEFIfVmPjAIKx8=
X-QQ-mid: esmtpsz19t1765158953tcdb9152f
X-QQ-Originating-IP: +8lPfsUXAmh9xGsf2UaKv/ckJ50+L2F5xe64/BgJqIw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7419382156516590338
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
Subject: [PATCH v13 10/11] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Mon,  8 Dec 2025 09:54:59 +0800
Message-Id: <20251208015500.94-11-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MXBlLHWRHBZ3E4p3BVD4yWdv+pX6jaYaG/26TxUMZwcSCb32XocZ3a1q
	mGAvBgcERHQgrE6L+RCa0DVmVHdJ7x5JbnnmgolSrWtT0+BUt2KS3K2GG5bIU2dyWhBlghN
	7CrtnZgJ05wWTLF/FKrUIkOHDiuLNqxdvIEhL+c9/eBg9uKjnx8v4a2uLysa+GmA/YkmB10
	TKFdKkB9tmDEeLrtW4MQSshSC6e5zvA3Yw4XQdN/gB2YBx0qR+ypA4L2tvhF9J5fs7qA9+6
	WaAGC8O5vZJ0x+TRb2XxrWwWSYjpl6z6nBR6Lym0NDMt2sFAb43lRPXzVwNXexvSHrFD5lI
	IEIkqn70MJgs/iYEC3hsAhTS8qN4kqtz95rVB3piI8xbkxGzNoAHCTHvrgZFrlXEBSgKYdD
	4H9eN+qc2g9nhdgDfVdznjXk644MTwwq4LTQLk1rN3c9QUwbFqCO4oZB5O0kITAmAi2kd8F
	4esTQPyighbae6liaBKa1DAhvN3cE0WGjVuHlrkLMPLl68z7516NirHnlomM5OHwxTNIZDF
	chLNds7583cxRPJuWbKImRhpv+astClfzTvXZd7Iv2esSuAfxizuTwcATQ+C+C/ow5+Kd/C
	t0NyJ9zlkFgNIJZJsPYCQ4646CxxtajQ00Bp6g3Ni/4MJ5IRB2652EoQuj5BtKbty0I7YRD
	7hAOt+Ap65fGtsTCVe45MzxW3NbjW777EUj3oeeQfl8K+YpwvrrPhkG+Tyf8Hw3m+O+4hVQ
	ZMnMEVXUJkXm3ZY1yluyQATMlRkNGES3gsVKrOYOPW0ulsWGuHHs0zBJjubt3w859bHDSsd
	03RfVHV0e8nswpgT4y96feN8yLHYJXFwRcXYx+DSjHQ4TWxtPhsimppWb7xEtlaQJ97AOBT
	IdjDcZufnmKz2iHz5V7SX+8U+Nj5T5IM46AYTGLAcKQut1NmG7AHOiHgFRbS004g1wDGfEM
	pHoapEJJ1dgl5wad7PmY0uNS5IW8RTQ2wglRoSmL6QRu3LJ6nvLsAueZ3x5yWv7LpjJu+VK
	qSi+DjQYLQGQrtukAjDUMnuVCNpa0=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_175720_236266_82827B10 
X-CRM114-Status: GOOD (  10.41  )
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


