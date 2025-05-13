Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74176C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 01:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sx0QPXnSaLIf4F34i9zHng6KtwZzILwK0rjOsdgpCTc=; b=lCQ4AtShDAcpHIxsXqytGBt5jd
	TStg3KnxQESW1LHbB5Of0iAXQwzQJLrtLcikn3bH2zcSj15r8bBicC3mYbSsV/CpFfX8vMLZqdAzV
	VI+rwhgRYGklirkmYpdQgi/LCKo9Jw6zmOfY8pS16V6CdBISn9vE3Lw9bh6Aay5yd8K1IlpzjAwhO
	Er++Sb7BEMEwB+LaFNH0M5TAm3MUlfPxzRwQ0sWe2HJEA4D5DirwhGIlui/6b9Vq9YFEwxl8xFj0u
	HQeg05AnENAFOxx1Y/tIM5drQbmNLSo14Knz5xWd81WPjKneBKyj+EmPys0GBebb5tf8OkDki+4zv
	Yk3eqiVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEePk-0000000B3cs-1OdC;
	Tue, 13 May 2025 01:26:36 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEeKX-0000000B34y-3R43;
	Tue, 13 May 2025 01:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747099212;
	bh=sx0QPXnSaLIf4F34i9zHng6KtwZzILwK0rjOsdgpCTc=;
	h=From:To:Subject:Date:Message-Id;
	b=Co1n7HhMer8FJlSY9wEQbv7GPvFZf/ZJmY5ZKsmh9Qcjgh3ilo2+j9VAsQ3o/IZvS
	 Jw+RjyP1i8c4Fpj01luMmECgDyxgwWx3Y85cA7ffZKL8s1cKKhHn+Eu+/BkONJsNbo
	 EG8GAt3qjwWro6K8biikU2bKEf7paevU9MmpTOWg=
X-QQ-mid: zesmtpgz8t1747099209t919a02de
X-QQ-Originating-IP: 5vhkHeA2dWXXDt212fbrUzKzkNBcuE37BFyAXXTQglI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 May 2025 09:20:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14605522553798699493
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Convert Rockchip CDN DP binding to yaml
Date: Tue, 13 May 2025 09:19:02 +0800
Message-Id: <20250513011904.102-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: Mutteg8H72qD0e3+xNdYv7CPv9n3fer6jJ/f7nyr3mA6gEE3MIlXi520
	W5LlOfYqWYpn83CH9jq8K44RjnktcHg/gtM3ajPpMG0zZFf6/nqgcPcNLsPUnIConEgmiQa
	1qXAFoTIuYyBP8xDslCeyANlIveCSBWA9cCck0jbSh2TBy+g5+enQbYsMkq9po83IKGEkMY
	/R8i1mZxWw1M4H2uUHMKXyhmAnRCfrcsM0lOvXRkzAXaa65kdT7qjz1YVcHQ3+3bW/MDrs3
	MqHNqs3w9y/Kd+jsMHa012iejgdeG71tvZAThtGjpPFVuyZspJ34o199D7Nnxslu2VRa8Vi
	Z4/g72BbNNc8bJpSFvYVbWK7t0Nk35OqPOEzQf2+J0F+uqWS3cxpF9qmPkg418dqBiPLkpi
	qZpipCZgi95yUCepWxPl9zxGLQNA/wVmFKcXLf2WjFZrNpPofuvD04gmmezscWMlS+0HW/m
	DrUhmDGszSGHQm6YfgAYFc9cXKwRbFuRdnCBVPKaT+gvadkSsy2TFLKzg1RRCSoNJ8pO4Tf
	tGhRzUqK/R+ijswCB1g5ZbS9AElbCkEtDIzjCa74rM18LwaYew34th9Zy3Kwb2Mi6MU22w9
	q9IKgBD14U93uuqPwYuWUyG6MgjCEAtiT7jGWyVkYtOuuJ90jLqRQW4Q0fWAHhUrhBnD+My
	l43vyZ0LlmzFGrXliisEJ3p/h6xRK8Uply7Int2MunJdeUsIccgVzuep7vDu5IoYaykTb2a
	80+xs5VuEb4X2cJgZ7MVYiPoqG08VnjkVP/LaBTgJjtXCabRmqF6wImXSRIwDBFaq1EBtrW
	Uj5NkcRln1pwZj1yuU5rK2r9N0JlzoO78FzKk8TSS+fQu4r7QCv9yC3BzXziji1LJHk+fGF
	gwdJZrnSDZeaJjM57Jh/zT4qPvBfKx597YGU3pRSRZ5Jl/xkDVG39KVbZV9DFiU+PxYizbH
	XWy0Wb46ZfJoomwTNdzn6PYX1K6xmH87WmmhUqztYAHKoFw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_182114_377278_C2D46AFE 
X-CRM114-Status: GOOD (  10.11  )
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

This series convert cdn-dp-rockchip.txt to yaml.

PATCH 1 try to improve coding style on the existing rk3399 cdn-dp
node.
PATCH 2 try to convert cdn-dp-rockchip.txt to yaml.

Changes in v3:
- Link to V2: https://lore.kernel.org/all/20250509070247.868-1-kernel@airkyi.com/
- Add more description about phy/extcon
- Fix some coding style

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250508064304.670-1-kernel@airkyi.com/
- Rename binding file name to match compatible
- Add more description about grf/phy/extcon
- Fix coding style

Chaoyi Chen (2):
  arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
  dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml

 .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 165 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 3 files changed, 174 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

--
2.49.0


