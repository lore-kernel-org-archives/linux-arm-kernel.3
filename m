Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87F7C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c1tT3yvxjkinhN97rO87ZxGO8TE43RhDvmMo/jPsRss=; b=ns81O/zrhq2tXF
	otEnfbQX0VU9YumxpT2Medrz6m4y5MEBpfY21DUeAk3kSU7DSanRi1ByromaLJZdjstlO7Ra0M9El
	Y6GtwYQe62MeIjOWtNONPm9dHpRDebjO9pGim4XEpu00rzYVMQ3GmbkrkXFVXdThmrN8ZF7zspyDX
	F5PeX3yBOit6tqD4GnPDbxVI/NivdVXVWBNbySt+mVsiJcpuze1/AyCPmagfmjyN0ABOGUUrNtMkJ
	XsJbaFYEVmuzG6Y7uYZHCbF/BHQ4xXCDnaGowBG/rdOzrOzKmQgiSbFCeXDwRv6t2jZL4me38aRB9
	mEIoNF/tmS1qetUNDEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QdT-00000005xTy-2t85;
	Tue, 15 Sep 2026 10:43:35 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QdO-00000005xR0-47dR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:43:34 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f63546c3so95015f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469009; x=1790073809; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c1tT3yvxjkinhN97rO87ZxGO8TE43RhDvmMo/jPsRss=;
        b=X6Svc1YbXATDCbbJSw4W7nEn6QVlMYjZWY3akikDqJFGAI+wY27fVfbBb0bKthYVXD
         I0C//wNbh1AeruP4KeMDWtwjCL+lcrD1jSbG8TIBSjRmeK3AkKalORlu5Ndj6U6h1kxf
         /B64YKfVtmOUkOJEOznikEKeQc/AOyJB4zQNQXSWvAa8StIN+6Uu78EwI7HCzelQb7ed
         bZHCO3kjV9CT5CczJY7BIYN0Y9qunBNzyN6U7eFTUbeytxIIBgTWhPaFUE0jLXoanwCY
         9ZFjfbjfavpwa1V8eKUhunrkYg3l9VCxLHNQn2Do36cml7hRoj/EGaJ/+eRaU9Ks61cA
         WwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469009; x=1790073809;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c1tT3yvxjkinhN97rO87ZxGO8TE43RhDvmMo/jPsRss=;
        b=lVWorTc0/1CCQxhaGIk6cpkjwoY3jH/Uwe35t2jJswOu7VSKdxl5jbJm0eXjsGbA6A
         0mfyr5R3RQw1rS+Ik/0ygsd9a6HcG+3YL28Tajt16R6GCgWUr8koZI7uHNg/DtW4wUaN
         jbGtRUWpNXdjreH5s/DqQedhKhp6k8twgTejdonXGd2+6d9xV+ZGr7d39XBmsQZMJ82P
         abZ/K9WvNIU0ZIYICUEiMfNLd/oRco9UtpK53IQHI3TEhNJ/AV1jojzqRDInHBYF3Q4i
         wQX2jy0ee0SY9sM+gabyv9QNoZK08UJ6ddVuzt7VhwBKEhq0F+b8v1jvFafoIZrkhJ1o
         tlhw==
X-Forwarded-Encrypted: i=1; AKwUvBz0wfzsm6wJY6mdYceCLIt+YJeL+aATqCUo+8CT6vd8JZIIxX4GYXkhITXuj2N/vRW2FDlMUe0wa7dFodcvK+y4@lists.infradead.org
X-Gm-Message-State: AFuF++meekzmw7vC2CfOuhWWoehly2qhj4yxzmMS+dyGRf5Arhpw9spN
	GaGz8Ds0lQSNbxBwQ9n9Ap3EVcNAM0VW2yE8VD3vuXxFyIl9XKJUYahF
X-Gm-Gg: AYBFou3VQgJXmKbjHvGDrHW2fJTMnJtTPswCVAFxfvS46W9vMSmKwR5sWqJz0YtOW1X
	VQZz15OErRQco6qeu8HvJXU0GrmhUY9fU7DuaOHGeIblqudq7753fGILVi+ysE/ZEWqHd43RSLs
	6JrMAY3Q1Jxbj1vIaF6p+eNj2YwMjld/7KmyrbCC181kh6QY8EA/FnUpa0ggiQ8jApKfcMxEicZ
	ZGRh+cnTO4FbGx6rY0v7Y2w+KwyuFz1WzjbRY1xYLAP4QeBHcn6TEZSCDwxep3PSqWWepyOQN7E
	xC6VyOxhXriFh3fJ9RhHZM8ubgcyZ1wDwmebM8IsrY4c+b18eXZBxtOXDK91J2EhFSjOUveQoSA
	zzwEqWY31hOMDKgR1rL6wl8IGipRwci8Csln52+IHC/DRP1xG2JrDAet0KRCXGeBBDbdKcVB+ae
	5u2oLc9QeoWRUmlNNrqzVuVnviPWGRll+Zl/aDPNlzmKLlFv0bB6hGbCjolbjifSqs5TJJqreQz
	GEFfHp027RQSyxt7tCZwgf32Meiv5ZYcqSe3k+dxdu0oAlbO52P9RpBiLS257fbing=
X-Received: by 2002:a05:600c:4f46:b0:49c:cfbe:5a76 with SMTP id 5b1f17b1804b1-49e82213d4bmr10107005e9.2.1789469008368;
        Tue, 15 Sep 2026 03:43:28 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2a94b9sm58001325e9.3.2026.09.15.03.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:43:27 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH v2 0/4] phy: rockchip: add support for the RK3576 MIPI
 CSI-2 DPHYs
Date: Tue, 15 Sep 2026 12:42:45 +0200
Message-Id: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACUhqWoC/1WNyw6CMBBFf4XM2pp2oFBZ+R+GBY8BRuWRFomE8
 O8WdOPyJOeeu4Ijy+QgDVawNLPjofeApwDKNu8bElx5BpQYS6Muwj5CncSiGttFYCij2kQGlS7
 AL0ZLNb+P2i37snsVdyqnPbEbLbtpsMtxN6vd+5VR/pVnJaRIJKEmU2lKzLXpcn6ey6GDbNu2D
 87Uuh64AAAA
X-Change-ID: 20260819-rk3576-dphy-2304f848215b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
 Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469006; l=1671;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=yZEgzTB21dJfahfS3EghGIYvrSbI8fD5s64xGT2boCo=;
 b=ot+vSy2JSTHjEbz9uBeefJXb/lU1tBk60Hb1vd+2VgmjPFt6k8cpkzJT9QHP88Ng6VxHFAlTL
 bJSEKJiOgB5A2Ledx+QpDv+NYkObnMwn0SNsr7pQzcftDj0X92xSduC
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_034331_034291_3D73C9F8 
X-CRM114-Status: GOOD (  13.91  )
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

Hi all,

The Rockchip RK3576 features two MIPI CSI-2 DPHYs. The CSI-2 DPHYs can be
supported using the existing phy-rockchip-inno-csidphy driver.

This patch series adds support for this variant.

As you may have guessed, this is part of the efforts to bring the
support for the RK3576 camera pipeline (VICAP) mainline.

Looking forward to your comments!

---
Changes in v2:
- Patch 3: drop the RK3576 GRF register table, which duplicated the
  RK3588 one, and reuse rk3588_grf_dphy_regs instead, so that the reset
  names are now the only difference between the two variants (Michael)
- Patch 3: reword the commit message accordingly
- Patch 2: spell out in the commit message why the RK3576 compatible
  cannot use a fallback (Conor)
- Collected Acked-by from Conor on patches 1 and 2
- Link to v1: https://patch.msgid.link/20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com

---
Amin Gattout (4):
      dt-bindings: soc: rockchip: add rk3576 csidphy grf syscon
      dt-bindings: phy: rockchip-inno-csi-dphy: add rk3576 variant
      phy: rockchip: phy-rockchip-inno-csidphy: add support for rk3576 variant
      arm64: dts: rockchip: add csi dphy nodes to rk3576

 .../bindings/phy/rockchip-inno-csi-dphy.yaml       |  2 ++
 .../devicetree/bindings/soc/rockchip/grf.yaml      |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 34 ++++++++++++++++++++++
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   | 15 ++++++++++
 4 files changed, 52 insertions(+)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260819-rk3576-dphy-2304f848215b

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>


