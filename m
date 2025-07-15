Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9A3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Q8tj7y2fVh1DqqXLpoIzvx75MH7E6vfXU9jWGAciCk=; b=wc1unALztmozwqqdJ3/CXBV+CH
	CJR4pRFo1HMBCU6ink5l9p0D86R3OzDYWFvLTY8A2eQSJ3+H6hV1ycl1BFXZzFDZ61YZaxpY8nsVA
	er79QUkh33ye17Drvbi1iS60zo5ynQjFHKpr++QwoZVcp0spPHEA1g2xkOCqGcydm6lzp2nLCAwRg
	kMrQGqUU6BtzgMbsM7aBSV/dkgZT8mI4y6BTVCEIuZCEWFxMyMaaMMA4gp9M9KtlESzt/wq1rCUxK
	wyHZZhZl9wydrjmE7Buj91y4Z2DMYiMOFIOrK1m7QY6QLiT2PB88Vmmk4w3XXVkfZjhDGg/1iFYEx
	1iiVW6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdwX-00000004xUP-3iSd;
	Tue, 15 Jul 2025 11:35:29 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdnb-00000004w61-1M3l;
	Tue, 15 Jul 2025 11:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1752578711;
	bh=6Q8tj7y2fVh1DqqXLpoIzvx75MH7E6vfXU9jWGAciCk=;
	h=From:To:Subject:Date:Message-Id;
	b=Fzek+kCy+1xuzYPmxg58YWz8lFmfkSuA+nP/EyxIVtFr6nhfW4JI2Pc+XmOMscgmt
	 PhiutHxeA7R2KSGoDqWyVnMOmtItJWgEf924BkVmwERJymE3WvD4kaf46XpIAu4LoN
	 Vzy5oJUcn4W/HPoMH9eWcaRETm/TVRCLYDrQXz8o=
X-QQ-mid: zesmtpsz3t1752578709t1424522d
X-QQ-Originating-IP: Y2jgY0DzpsnsowblI/Y8vYsFKW2TRFdQuFkynBZV9Zs=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Jul 2025 19:25:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6650864007286814184
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
Subject: [PATCH 1/5] dt-bindings: connector: Add displayport connector for hotplug notify
Date: Tue, 15 Jul 2025 19:24:52 +0800
Message-Id: <20250715112456.101-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250715112456.101-1-kernel@airkyi.com>
References: <20250715112456.101-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MgQY1K25Ph0m69AjCHDG8dLTdiARyZTSnRw9EQg2R6q5dMJZdEtS/BEW
	+uj5Uf6rzDB8gHxnzQ6UPPwTpHBrfYhrk6IjSPiGgbKeAA1vCboJdFKF+HSItQbcDWuwZzn
	0FCZlWsEEJdDj/HrGRX6PP98w8jJiU2p+vO53IBjVneaEHSHm/gJnjp5hvLKGZB/zv+FnKN
	JwwUIozMLceL/2BAxNeHGb4d4M4haFd7wB14UMq51IQp6hH7AAZnzD8MlnlKGNyDa1aV85C
	Bn7fI4mwRzxXKKWNrxrduOdcVSu5enzw01oMct8KdvBH2fpmIMDGrVpdOO5VLjO3sXElB9a
	yZQinHycpSuOt+iUbGaTh6ZNNdr6gCbyamEWHeFXlWLBO84Lb7anI+ZDJoFlPpTGO2k7HGR
	W2A6pSN/7+aZu06Jlw3OQT54k4qIQNpAGzqFdkveqFzQuE44yAYVfOPjsF+8ElwJLnxo0Zr
	jaNeoeM4Fejd/a6pVCtLO5LGzrcdQJtNKGK/Jb0ZkjOB0UwPJILosuePJvuigPONQvzxngw
	yBPgh6JcyrPK83HK6ZTCoggupnaE31qW9NENQpLdqsmH1KNX7w9TI2XaGIXZwFYcZ3wR/ma
	S4w4oJM2LDAHFHG5XRhtBn3SWH8piePojaxn9cs2ZLKJxnEKx1PROkx/J9Saa4pmQlzchzT
	YksT22rzdQ58d9dQMBmb/aqiSE+zw2B5vQYxo5og/Wy68eq/bQP6SmQu2R5FO+EYygxG6HG
	vd3dMVvyJOkrZ2V5P/g77d0jh4Y0yhCabEObxr+EiwZUottl7v/VN6gPtmD9Wc6AaVethJe
	RPhqlEVhxg1vuaAKSSkahsKhQ4s9GEmhB/WK5B1XXtf8fPsImdqeHXLkMM26aZGDlAldNOh
	XIGXJ/HVgLK0Dt5H2Xvfe8SsI7MU6j29dauek4bDVvy5okqNGrCLwZp2PY1jGWbAtQ4iXmr
	mqAbMFaZegLAQ+GWsrH0MY8yUYFyYBjm2xi+0yNVpewy1u48+26aiXhs7x7b7T8dCnApI6e
	172gfQUA==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_042615_873227_EFF74ECB 
X-CRM114-Status: UNSURE (   7.92  )
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

The USB Type-C DisplayPort alternate mode driver will find
"displayport" property for DRM hotplug event notify[0].

[0]: https://lore.kernel.org/all/20210817215201.795062-9-hdegoede@redhat.com/

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../devicetree/bindings/connector/usb-connector.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 11e40d225b9f..ccb258972cd6 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -300,6 +300,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     maxItems: 4
 
+  displayport:
+    description: A phandle to displayport connector for DRM hotplug event notify.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
 dependencies:
   sink-vdos-v1: [ sink-vdos ]
   sink-vdos: [ sink-vdos-v1 ]
-- 
2.49.0



