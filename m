Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E78C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 06:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0pI2iREWW5cC2LwJLtCoMOYZhwY83h/z7B9+8q2WvaM=; b=1BKc+XoqvcsgtHiXwr+Ga4pozy
	ANnbCJv2E/e/vs718JnCAAdh8+J7WVfF80lVN15gyNBZqKMo3zGupIB/xbxak1cQKx/dxurWsbEIE
	oj7UaoZzefXkWHXWt2Xegp2VMLv2Bnu8LsOGljzf8p093Fir9HIkhOZ98vPtdLfOEPrnYBbSuuqcs
	jUh+gWCAuxIFYxWvU3lgoeSJNh0xx3sEr2lIrRIk2xyr3iBriuUcxx/idgBXatQHSfQ9PykA+kMlZ
	B5zHyl37jSsATgjFUrqMkMnKItZMpimxm/QhOKcO0lyJhW4DrIklhGQcHCD6/e5VSNCujWjfHbHku
	EWQ3/sjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCv3e-0000000HVZN-1YfS;
	Thu, 08 May 2025 06:48:38 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuzj-0000000HV10-2Z3k;
	Thu, 08 May 2025 06:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746686610;
	bh=0pI2iREWW5cC2LwJLtCoMOYZhwY83h/z7B9+8q2WvaM=;
	h=From:To:Subject:Date:Message-Id;
	b=fxXpi/Y5mrjF84OdY3lEuMy2DsWSyvmGZ9xajslWgM+oAfiuAtOb9/FaVyPRZXU3i
	 B4awaS/VoRGgwCWFohqwr8Ez6DmG6Ctjml33QCmeoLknRvaPJPl4DUQD5NhWLR2y9G
	 y0LNDZr3mT0bxpl1gmh6gXHYCIBwXOPz/Ij0Jh3k=
X-QQ-mid: esmtpsz18t1746686608t123d24cd
X-QQ-Originating-IP: Lb7KIkQyY8JilwbOns5Cl43BA/5Z8/J56hf/m1H92DY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 May 2025 14:43:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4859509138922957751
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
Subject: [PATCH 0/2] Convert Rockchip CDN DP binding to yaml
Date: Thu,  8 May 2025 14:43:02 +0800
Message-Id: <20250508064304.670-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N3IC8um5pMyYiUTB++F8KmGWAz7BbvjjiJvjkp/Emlsn4bb47X4/ZJQi
	3s93gkfxyyqyBFPaHO95ETcR+vn67It2LfIX0jXKOXkXWHipQnUY61PNk7v42XfLt2bUInW
	b1CJIGt+gHy+SoabkJiwrra6tQkkj42SpsbbS03vIQR40QiBW1GVfYGJAosQekfFzr+CwRg
	YwMqWTEMVM4z3suCQIV+m4DDk3oSPaviOUbZJ1dFHZFydMyGXoh3+7d5aTHitLvAonE8QgF
	jeIEGebHMXzzEwvZ2qy3xzcsPYmyCbRBaWUDR/wovsrryAiK1OwxaGgyEjmpSNJL9dxQPQA
	XIulur70ImXupPMIfD4g/cvF6SxuWkZPkIQkIn9rynumJIkXcJc6mHYGoz/qOuQHDdQ7SbN
	F+CPCIanHXerXlwJOJhajxzhhBnPhbKASftNDzq9ZD4JfIfYape0q0ezZ8Ar9nrYrucZ/4a
	3FwGKtAOVO01z2DpkBTgYShC8gJm4yzBkVDzRRnIlqQwpjht0zILw6So2G0RqS8mSz7aYIK
	0ZXduco+VDbsd63wAHnLfiO659D6971lm00O1i7vpHIvVZ0rFXSEA76N/gJCjGUBk66yU16
	h0hKvIeFpl7ilnJ24FNO8J7buPsBUNIPooKHKJmAWWLOAxB/iUPGGVcchiLR0YPtt1a2tG6
	bUMR4pcsQhe+Pw4KCVpde0oz4eccAOhnEQg2MDPF6m4Q7lW0mcXPAJSpr/gfICE0bHHRA7R
	BnaKLEyJ+IWakDzca2dX0+tz15yetBk95GlTAx58Emd25MrQ9rda/6yHJQrE3wS22Sy6+ZI
	SRWByavJ1v1Z/xKQNObNDN5Oht3I7KmAwqiz0IhA9mpdPExOZZ4rzZe1BAYvukfHNXUxz7F
	e2tfrMTeBn6x31JRJjWXREaL5MK6BBQqdCtwtXoCzkeA7QsaqWvgFrbT/Vh4XCcYyRgX8cW
	VoHl3OzAjNz5v0Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_234436_153964_1379A00F 
X-CRM114-Status: UNSURE (   8.78  )
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

This series convert cdn-dp-rockchip.txt to yaml.

PATCH 1 try to improve coding style on the existing rk3399 cdn-dp
node.
PATCH 2 try to convert cdn-dp-rockchip.txt to yaml.

Tested with:

1. make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml

2. make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml


Chaoyi Chen (2):
  arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
  dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml

 .../display/rockchip/cdn-dp-rockchip.txt      |  74 ---------
 .../display/rockchip/rockchip,cdn-dp.yaml     | 148 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 3 files changed, 157 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml

--
2.49.0


