Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC797CCD1A1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 02:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHT4Mxhe+zSodIVHd2qzlGnysBWHBxMufel41tGudBs=; b=R2TD0cfp30O5L7ALgrQPN7dziZ
	G2Tx4Vo1oAu6QySmw/4CUaKrVIMthJL3HhXpDM/9bSbqSiIjP2zk0SG9PGe39WVWhURCz9sm625Zd
	4L4DGZ9PWYdKeWGMVLQORPsdhjsk77Pho3lxKAEZhJEQ0VGcvkHW2UQfwwQqdnIS4KvwdvK+e8rqD
	0c6JkAEztpBdwCrXBhV5kizDU4WZDrAVBb0TYpyt7s3Ik2viFezCH+TI+LoaDudXIur0oQRD3qIzs
	/ZZMnka7/IP7403F5ucPr1xe1DiHxeEnvnxEJxJm8+QQvkWs1HDYc0/VD5GiTVMMI0KluV+1iKgsK
	D0eUXHfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Djk-00000003H1b-3lif;
	Thu, 16 Oct 2025 02:29:04 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Djf-00000003Gmz-403C;
	Thu, 16 Oct 2025 02:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1760581688;
	bh=YHT4Mxhe+zSodIVHd2qzlGnysBWHBxMufel41tGudBs=;
	h=From:To:Subject:Date:Message-Id;
	b=t1uSJlCh6BKui0tSWCB4a5j/1fjlPSegptuGjd0kHLT4U15hlYxGxPZFuIKlp+phR
	 AK0ukJLrBUvej52ujlnMIjCyQwjQyezqBVCBELYgRgdzCYn8VSEbRe7bqUa1xXc1vX
	 iP5p1RZCoHof+7iUyYKTtjzmW4BpF3iEQ88QrHT4=
X-QQ-mid: zesmtpgz1t1760581686t5a2ab742
X-QQ-Originating-IP: Br9MCe7LW7Ki5BF9qcSTZOmwdKejc+6aFdxKCmwAYcg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 16 Oct 2025 10:28:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18423012065782556951
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
Subject: [PATCH v6 2/8] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Thu, 16 Oct 2025 10:27:35 +0800
Message-Id: <20251016022741.91-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251016022741.91-1-kernel@airkyi.com>
References: <20251016022741.91-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: M8JnMGwRo1mQ6Zj1L8Z6+mML7Wre/rZNvq1Xkso/uoNZaDSQWwnLivVp
	A+46evxX661PFbgRkgBG35BaRv+OsTycJGrK/XtDbf2W5BeK+8/qyEEMBWUS2PHSOx41u3f
	duzduiejfnTE5tWzxHQpUGy7Hxck/oJQV+670iO4d5W+B4z7zgGXnKCvDiSPY+tDdR6HrRB
	Jg9Z8cumIN4q34tCs3AxZeu1meCN5QvVexDlN/DE+MLw6VI7OGqpwchlZ0ledt8sHs1r5eX
	yM+dVIwFLMISJ2r3IjnYTvk5BjeEYIUr/SMqh5pibrs4kTg/UjYqNoTQzM34xvf3+fZNmPX
	Qnmc7zEDe+uazzL1Rno+NI+O+j0jXyvZr1sLf7Dfl/9f1xZHkGdHirNPq9YHIPpO1Ifomws
	DNjnz5l1yvoPGQtW/F1xZwFP2vPVBByz960r/0jzWyBENNitx3C0m9yLn69BKBLDwiLX4O6
	4e9p205nuDc+DyLZlAu4zT5s282S4HGG7M2B/yui+ZYFof0ZsDoSWRaTQknJWZp5PVAYndV
	MoAnUtjh/iwAohKJ5pIo+NRMnuRt2KWC/FdC0qgF31cSufzOcAAzmgdXQ0RC6Y4oMNMPmlp
	5YnUAqIqursnVf8/dRJ9mPd633qprdQze1CQlEVyb94FWUIFkZ73BSf3qz2eohvhNwVTXcQ
	boEZ7E58eutpgod6566gUzNQ9QY8iCr2nfpxVWMRUdMhIj6dVphGagFfzvjArLnNqBSYpuR
	8//OJlT1tuib9Mzp2KbAcoJ7MMCPj8YOWbuzgQE+mU7C6ihw54fqWSPQYpOOMQFl7pr+P5U
	ZLopI2A16U0O4kswAWoqAVPPBkHzZbbS2Qrt9Sgp8xrx8yNXnrAtzGyj8UyC16GFEHNPpwA
	QbwozaMzZqkzauksWuEUU+D7EhSalcvzWNGSDaGskRCgVgtDV92n1y+FLY18vt+1ZPVqe0t
	0g5HOEAHN+x/1SFC4h7NazWB88P//jv2Dfv+M4cOcwO2NYuxYpwP0XySfuZFfh708FIK0Zt
	wQ0CSH4Q==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_192900_374416_6CB41C2A 
X-CRM114-Status: UNSURE (   9.76  )
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

The RK3399 SoC integrates two USB/DP combo PHYs, each of which
supports software-configurable pin mapping and DisplayPort lane
assignment. These capabilities enable the PHY itself to handle both
mode switching and orientation switching, based on the Type-C plug
orientation and USB PD negotiation results.

While an external Type-C controller is still required to detect cable
attachment and report USB PD events, the actual mode and orientation
switching is performed internally by the PHY through software
configuration. This allows the PHY to act as a Type-C multiplexer for
both data role and DP altmode configuration.

To reflect this hardware design, this patch introduces a new
"mode-switch" property for the dp-port node in the device tree bindings.
This property indicates that the connected PHY is capable of handling
Type-C mode switching itself.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

(no changes since v5)

Changes in v4:
- Remove "|" in description.

Changes in v3:
- Add more descriptions to clarify the role of the PHY in switching.

Changes in v2:
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.

 .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
index 91c011f68cd0..83ebcde096ea 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -51,6 +51,12 @@ properties:
       '#phy-cells':
         const: 0
 
+      mode-switch:
+        description:
+          Indicates the PHY can handle altmode switching. In this case,
+          requires an external USB Type-C controller to report USB PD message.
+        type: boolean
+
       port:
         $ref: /schemas/graph.yaml#/properties/port
         description: Connection to USB Type-C connector
-- 
2.49.0


