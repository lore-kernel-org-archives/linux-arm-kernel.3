Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA02CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 01:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQiFCRapN/3mwb02ZP+dTFVgTrcEVb7y08IjRSvyuIY=; b=tA+YGytUHPZdzvp1pzw+snIPqW
	vz2F4iqapDPZJdqCtutDOE83ttJ60Z6RSgHNhRnvw9BhZqXr7feX/c2HSanCYWT7ljTRwS8YLszre
	jhFS+AVJSc8rilHF1QrmNFJLi5k08hR3ri/DcsRg+9v2vjPm45P/1zzLxtbyKODbMWNteXyukTqFB
	szSVuE40gsOz/onjaDtqgYo5bGvZNX/dgBlhJfQU4eU+j2qJIFDEOWHSBD8Zf+hrfIDz9bNGiLK7x
	3aQTpndyQiS3JzcEQ/U4M9Pr/iduwqD8T6frRPD7OeXwpejhBMLuyGqJqezzI41E/vZB/Ewkjs8aD
	iddCRi6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0VG7-00000008V05-1yvw;
	Mon, 22 Sep 2025 01:22:27 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0VFq-00000008UVC-06Nu;
	Mon, 22 Sep 2025 01:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1758504072;
	bh=FQiFCRapN/3mwb02ZP+dTFVgTrcEVb7y08IjRSvyuIY=;
	h=From:To:Subject:Date:Message-Id;
	b=u0yxSLlSwOATLLm30XMbWjPLBFDpyvoP2neidc+XQMfGEYWq3H5x1vzW5cWOAhydC
	 Nn9CL4SK5uOmvEoLdZ8Vh9+U5MnkyToL6w/ufUa+aU32ptKsuIwg6fpf0dtreQteFF
	 A/Dw9SfKJaM2iYtBkkivy6Yw4G5K5xxO+QXNkjCI=
X-QQ-mid: zesmtpgz1t1758504070tb08ab248
X-QQ-Originating-IP: irFhF1T+2Su/4ccgz1o9QWkx8RvanKgMn5pFCBUgAAg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Sep 2025 09:21:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16934661695937755636
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
Subject: [PATCH v4 6/7] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Mon, 22 Sep 2025 09:20:38 +0800
Message-Id: <20250922012039.323-7-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250922012039.323-1-kernel@airkyi.com>
References: <20250922012039.323-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NafziRg7Bx69wZmNWpnyeNSCX5aQ2zp2rCi5Mn2t95JOtwkVnw2RyUrk
	9EY36yPs97/o3uIS8Rev5/D4N57O5jdh6CvE2RAyRUuvsEjqUBUEQjvSi+yhfEETbHBQ7GC
	JA1IcMA/Rb6ro++E8lUaA3XEeL6lS6+qDoA7bg4N4CD2Yl4K9WXrscWfNc+qBH5FjzEHrtc
	FMl3zRm/riQEt75uYJKlGk7nA5VxbCZlJG+hJ+bM5hkjbv+syt0sgcJuigs1Yop4ypCQ6ns
	Df2FOfiOC/iIKJYdmowqHCfY8VZd20DMl3J52RvQIVhBpoD99AfIGkcds2VzBsbSjjPlK3J
	yHScEaZgXdYbkoBvMVsgkmSI7ofRUcOsB2JwKcX65Y/+g3VV6FXoJWstr/pzKltTlv3zOhO
	2ouWJ/Bl//dKMsY4hkFyh4KXS/ZnOPxIlZiO6YwLO5c4i9DZRae2a21O4rKl3K8I/ub887G
	5VykFVAp6dFN/vd7QlHvS+NhxA+/VI31nIIZw44oFklkV8DknzcNPPZ8huKQ+P1yYTp6cqL
	eiQ81dL5tlImSSo8Qzl2wIrH3yfWzRneHC1Z3dEuYnXKeLT0NBaF02G4N8G0h2q1aOH9BDQ
	qq3h86STYI/yqqCOXGDti3ZbxEHjF6QLQQu7Mlhvl8LuWHnl6D9MX+xJtdzY3CVafdQ3XgR
	Umt6eYtf/fDM2fX5KNI/pugP0rRWyRk45EzDM+QNUMRC2loYP/sgl3R1ogIprE6yCkK4mJL
	BKKyyDlTOi/7sYUQgGcDmx4Dy3FOY62gGy94R/6SbvR+Xk5fUivKukFFZzo9Rp+VZUnfD0s
	e2cMLfRSroTI1Sb7I12dDnUr8li1Z7h57CBlFqll9ZQXkhZoJCHc+g1wyjaf2ggXpo4pel6
	efBEqFpmwq2/jVTN4aFijLYgr5RWDHYSXGWnii3iQA+oKrjR7g3f6UPyDQnTWAa2B/RFqKt
	kZhPVh1E9r/Jbvn/W+2ilghMQp9XLtTyNbUIOxslTTvOzzB95AaC2ojrRcpL0ozcjiDDrm1
	Y8mUcrnHvf4ZP9ediN
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_182210_481659_CC270D83 
X-CRM114-Status: GOOD (  10.82  )
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


