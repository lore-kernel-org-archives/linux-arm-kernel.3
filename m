Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C04C4453F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 18:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yFCG9WjoWxwgglQeZmRGJpQkPU6dVeqvJYQB5/riEUs=; b=cTQ1lPlUiUEbG+
	FjlH2TDvRc6Xr8GuKnUfWoeaEEQZtLajrcmt1ItWVzMJn5WwqRXtBu1dHpqN6X/NmPTVI05SCzKlr
	94RgF5QxMFvIjjmwYApGsxnDXSc+J7zDrPTBBJaeWhn+T7aaEYD4hXihDl5/z+cSDvg3Spem0+jxa
	ma3juVGY/uAFIhpkz9eUVoRtTdgudg+x35+AbZPxY0DYlmID3G5UmqeZRKy9McT2lwtmTTWI6/K+u
	ccv02jqSUxE78CQjbci6Nx3phwLK8k+fG4/XJFyh74eeF5qsCBwaKRNK3YUF2v8z4IeRlRNcCh0Am
	5XySSwLC8qN6yYS1zqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmc9j-0000000CadX-0wEc;
	Wed, 22 Jul 2026 18:58:59 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmc9f-0000000Cad4-2bzB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 18:58:57 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DFA968695D;
	Wed, 22 Jul 2026 20:58:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUKNuNWloxYK; Wed, 22 Jul 2026 20:58:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784746728; bh=UfNqCcOeyh0EPGI9MOJP83FkVghh8sF7H6l5q4tKtFw=;
	h=From:Subject:Date:To:Cc;
	b=Sl5QumeunLrtHofgHBv/aoy+6EFb24yP8dg6quDUUgchsjYWKpeYaCungl1G6IBAq
	 GFlQf0MqXMbyf8Ffr/Y5aJK1ajQUTTQO3h+iYeUlCU0X2vi+WzVw2LUKHoHmC6OHda
	 z33fktrGK+kBICDDndSezEYgKSN1XDo735BqLpqPsGUCtOa521Fs5emCQpv9WCuMdO
	 LGFIsqssOdxQ7GkcqQCYhyLG9z78Xf7GBwgMResozBPmpC6YkpgITg1yqAKiT35i0n
	 a81oPqXmFjoowiqRPSM+/OaU83eEqwjrYYfUwhlmk1dIqa2P5RONUUi40iBC1zH11A
	 Zcq+/Eg27ytIA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/3] Fixes and enhancements for Exynos (7870) DSIM
 bridge driver
Date: Thu, 23 Jul 2026 00:28:31 +0530
Message-Id: <20260723-exynos-dsim-fixes-v3-0-0c31ae1dbecc@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQrCMBAF4KuUrI0kk/4EV95DXAQzbWdhI5kSW
 krubtqNCOLyveF9swnGSMjiUm0iYiKmMJVgTpV4jG4aUJIvWYCCVmmoJS7rFFh6pqfsaUGWjbH
 Gt67tVWdE2b0iHocyu91LHonnENfjRdJ7+09LWiqpAbyqOwfG66snjiHM5xAHsXsJPgYo+8uAY
 jjbdGi1UQ7ct5FzfgPd/eoP+AAAAA==
X-Change-ID: 20260124-exynos-dsim-fixes-5383d6a6f073
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_115855_807654_D0782F9C 
X-CRM114-Status: GOOD (  10.37  )
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

Since v6.17, there is a regression for the Exynos 7870 DSIM driver. The
display occasionally had random aberration when the panel was turned on.
The first patch addresses that.

The second patch replaces an implicit loop for waiting for PLL
stabilization with an interrupt-based solution, which should be more
reliable. This solution was suggested by Inki Dae in a discussion of an
earlier patch series sent by me. For further details, refer to its
commit description.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- Add patch for removing conflicting devices for DRM (Sam Day)
- Link to v2: https://lore.kernel.org/r/20260208-exynos-dsim-fixes-v2-0-a857e8130a2a@disroot.org

Changes in v2:
- drop now-not-required [v1 1/3] (Marek Szyprowski)
- Link to v1: https://lore.kernel.org/r/20260124-exynos-dsim-fixes-v1-0-122d047a23d1@disroot.org

---
Kaustabh Chakraborty (3):
      drm/bridge: samsung-dsim: enable MFLUSH_VS for Exynos 7870 DSIM
      drm/bridge: samsung-dsim: use DSIM interrupt to wait for PLL stability
      drm/exynos: remove simplefb nodes before init

 drivers/gpu/drm/bridge/samsung-dsim.c   | 48 +++++++++++++++++++++++----------
 drivers/gpu/drm/exynos/exynos_drm_drv.c |  6 +++++
 include/drm/bridge/samsung-dsim.h       |  1 +
 3 files changed, 41 insertions(+), 14 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260124-exynos-dsim-fixes-5383d6a6f073

Best regards,
--  
Kaustabh Chakraborty <kauschluss@disroot.org>


