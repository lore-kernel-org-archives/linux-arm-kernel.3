Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65699C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 06:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVsfyWOIHeXBsAv/pI+LuirkOLN75phRnl2QMAl6n60=; b=ICE+ELc/3syEbuSAKi5evNNFNa
	I+zTu4qYLBOae5LYSyfTBS4DsnUlsRlzRB5725fTjqhbwfBLigHphzDIWXy/4esDb+67a8aIut2Hr
	NtEEaZ1hnRwyz4dc1GCz1DampZG5KNy9S4EueLc/aLV8yv0XI4Dvlo361s4czXBtvQ9KnMO15zDPM
	kH5yPEiZEGlvixHzyIRMZs24+/Sbdg+Z3EmEfqhTZ9BCeDY9zGx4KmwCS6t4m02WD4q6phuTtwFic
	wmyuziFbuUdBAMlgnCfe74YFfMmmGXrQFLdod16Kll9FNtAbvQN7GKJll9zCseA1t+VmIZdqH9T/1
	qKHHW6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucelU-0000000BnCl-0baT;
	Fri, 18 Jul 2025 06:40:16 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uceZN-0000000Blm7-1kwN;
	Fri, 18 Jul 2025 06:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1752820008;
	bh=cVsfyWOIHeXBsAv/pI+LuirkOLN75phRnl2QMAl6n60=;
	h=From:To:Subject:Date:Message-Id;
	b=bPalwIREVrxRNGjlNfYXW18k6P+jDgQ4MZ4kFjbsbx2kuPjXGo+epl3zdKEL/U/mw
	 1U89FUnJ7YEQ/jzCCE5p/iNcTweuRUh9qZCfsoE89sseqbSNNO4wfz9FDH6AbSRY2A
	 otVxzlicVZaRYh8jF+bNwFWjcSKZj94uNskQB/vQ=
X-QQ-mid: zesmtpgz7t1752820000tf3acf635
X-QQ-Originating-IP: 3Esvg81Z8Km/8FLlclkdOlva9JVeBii6w+oXvk+xVbQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 18 Jul 2025 14:26:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15425296164838630341
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
Subject: [PATCH v2 4/5] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Fri, 18 Jul 2025 14:26:18 +0800
Message-Id: <20250718062619.99-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250718062619.99-1-kernel@airkyi.com>
References: <20250718062619.99-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NzOHSugmTg7XLu9UWWkvov13lQqOYXEiQ0lH8b9sT6W2U/rGBDogo0eP
	vo2EbGiOK7BMFdIvWWFC7OjiVAVGTJD3G7NEZWHjw2sS2s3nwC1xy8suQJx9nY0k44Rr2RV
	/akLNhrFhSyXV0F4AetccpAqRccFOLPLQE8NUTWZbbjx3dEaRc8JtV6ZVmeXkwhWBV+GYwa
	jvq7Sz+X2z/E0Ni855li4WqbAvw2VXTATuTJ6E7S7M5+9TjV8jAtDGWgvdIHOgPqsactm60
	HdzYB/wNZpNO+GHWq17RDEB3rfGlVVPfNJkKb9Lt9RaWdRQeZ6+KgwEJpu5Fxo2C/UMTRYY
	at0lXrnhqV1f29c0ZIE96bX45+8XJR7u3DsLTWKiE+mUyGJvQy+q2ZQoL5w2LMYTPuM8Ju7
	V6G+rdmHGSt8JqJgXyKGg3PfwjDmjNk8Z1OkbiZJJ6uwzyqi1VB+2aBVfh71fJX1E5tE2+o
	MVoy4Dpu01Pia0dBJJftQuGvtlt72qvLlXOM1Qs41qB7GfGL2VbS+glYUbd1JE26sTxfAAf
	/AU0Xod//t/h9nnhE8MYzqZ4Qqv9qPpIULvmxl5/AH2Iu9KNuG6c3OYsLJYfMf8e081H7X8
	Fk2SL3Exbx7VzhF0qEWJI7o9d9TH4vIpbx8yRl6+xE1v+51IPou8KHsWLsXsCO8qvSjdaWP
	6PQwNStmSHcigLWyOylH/hJzdqUc+ntfTToZZ8AZyCn0itEzQtvKH8tkTbErLhj7QjUxWmE
	Eqbs5ez3XHNM44WQxZiM6Vs8NWUFzf4DY8GHnz60rhcXuawWbvnOUIUfa+7LtcxO3bZZgxe
	FRbN6EY/m2OlM7tDgMWQUCCuPIbok6lU+cr2OFKJ1Wa8uAFnD7wckK1CIJkNQpN4NvKeMXJ
	+rmRa2sFdRuy6vlyADQQyGaK9aZHSah4Y25Nnoa31zLxOeOmHIf7IXDjPtX+X62M+gudyfi
	Bh0NOo1AcmqwSH/BsT9I4JPHNPQdt6LjJq61Fqy0aL67vjC/KyTPMvjqJO6/iUTpbKgo=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_232745_806700_1EC8431E 
X-CRM114-Status: GOOD (  10.84  )
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
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 9d5f5b083e3c..edeb177bc433 100644
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
 
@@ -632,6 +636,12 @@ dp_in_vopl: endpoint@1 {
 					remote-endpoint = <&vopl_out_dp>;
 				};
 			};
+
+			dp_out: port@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 	};
 
-- 
2.49.0


