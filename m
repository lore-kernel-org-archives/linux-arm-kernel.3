Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211E7CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 02:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDiOxEFqYuonRjIga1t9o2u02p12TN3hXALWFcjKD9c=; b=e6eXvTsuUror5KqUS1EpyPL+Qy
	7bUxPUHoWtF5PS1Z6XBkdPUJuRdRzgppEcpqE51xgpPwRbTeoMQUSNaM0K2c2n7zPKqm6v+1XK6C5
	/NJIDMX8V88hU+Bz9K9K/WKBbo78w9MALzyHxo6Gh1+1R00K/53jVuR4S2BLCpEpMhwEbeoYJ+dbH
	sAGAhMCG5ghdBjkG0vEhjJWb/yY3zENYSxNCPz6pN7I7z61Jd4qZrNFycdv4e56OHNLdKuTianrW0
	DqAlh+UTZnYuU8KCV9nHvezQRHPK6AEKaZUKKJzsExnJoAM0ljg7GwtGe5KRI8dp0MB8WlXIaTQ5o
	OsesTtHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Dk7-00000003HUi-2TSj;
	Thu, 16 Oct 2025 02:29:28 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Djw-00000003Gu1-2y0U;
	Thu, 16 Oct 2025 02:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1760581705;
	bh=cDiOxEFqYuonRjIga1t9o2u02p12TN3hXALWFcjKD9c=;
	h=From:To:Subject:Date:Message-Id;
	b=oKKTeL2sZnJ/Ra/KO+JjtpEeovUL9rnSUI9xNdOU7MXVLO+02xrqkYfqglXFiuye9
	 plGCwzspO5dTpRr/XFyPeBfxLTMrRavjxJiEXgwbR5F9J6osU18irF3J8+odbwQnlX
	 p/ZaIGb1UlhwQdARY4WYIAhfvNYGPY8YJ/jAghH0=
X-QQ-mid: zesmtpgz1t1760581704t48b93ab9
X-QQ-Originating-IP: jspWVOP8OQq1eMaljl9zTAS2LWtC6NlYZsKyhlsXums=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 16 Oct 2025 10:28:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14690965305072094161
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
Subject: [PATCH v6 7/8] arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
Date: Thu, 16 Oct 2025 10:27:40 +0800
Message-Id: <20251016022741.91-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251016022741.91-1-kernel@airkyi.com>
References: <20251016022741.91-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NyTsQ4JOu2J27F0cQTRa45FJWTwUSNN68235XxeH56GQesGmtZ+5TV4k
	G5txBcbyhrcgiIUmrhPI1bCi1eURjT+y9YNjngB8p+YRELxfjPfpF4UQSsALVYDq2G0S9y1
	/XPLXIwnMwVGTqMYRLfOHsSHoTA+0u+fudJT72iJ3VCvXXVaHkrnfcykgWt0/mvx25xQtTf
	FxxA/cL99eFmypUoDXnz/ZKCIe9MmXaw8RZ4TfVzENBN3awx2vJjDIbvt02DOA9UFC+aiJf
	q1GkIPDwrrv70AYVYVTCiVPLMoZDbISOA/1BVuxa9/SJGcBdiLEncWz4XgiWZYarlWeCaAk
	w0mvoBIxKCTHEmPN9uV7vI1PM5+oK9YziskoGo6eg7yxI9ilvKqiSNnQO04yoJEdxgiLDFl
	sGLNkEjq0WHfag88LB8oT2gVxJr4Av6vI1pJAWc17F8ZLjoE+wfJulnR1Pn/kzLwuqSx/OA
	tzHDFdY54MUvvyyqxqWBt3p0LfTFc2eP3AGxpcq5HSWPR/2rdefWaF0e3kZeVvVrKiA0syT
	bsmWmMUxqQjqTQ07/BEEJuV6hLvM3/DJSxdIKPHnOyGRn2Y1Xncr9F572aWE82M827wD2h7
	mxcT31qFhVG5ADIYO4tc0p5cQRobR6RkDlNYEcRued9bryUdpufS371PRpFBx2nFvNn4A8D
	GKz1x9A4ArqdM8BDLA/+vlwu+C+OY9qWKGb9q+uv1xcnFCAbNmRbiDWDb4IWqp5mQVgSzWL
	Qr3lNyjp0TUkNYv1FmV2xvSoWsYDpu5yG4xrzJNPDsbHoXIxadgdBiSU4AJSioebQSGA6e9
	va3mh99JbR523F3w0Kqs/ZCbgYoaeG6UgJkngX1oywf83KkojXj6QIMEUPBVv92mBAckmRi
	tBM+mEA1dZrLmEeV97rK07ePBAMQztnkEIBg+RJe7uhNDwCWLs9ENy/+lTm8pTnqLV5VY7Q
	KG0FKNIx8QZBfFyPG3FbbFFUuy40c5tKUUzvwGaoWJ2Du0qHHzjtzs5H6kA6z7M188P/rJf
	YDRU0QcTImY2ORoAiEe/xQjxkFU7GrOVuNkN37zA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_192917_294322_E2A2AAE6 
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


