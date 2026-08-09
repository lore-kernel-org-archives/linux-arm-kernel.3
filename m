Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAB7C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 08:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cLHBp3kVyXFvQap3rPmU0j7Ee3NVjrNgZCHBeW66eBM=; b=KY4kFVsIbIAn9Y
	L3jCzPj12Kzu62fQylnKUVppRHirtV1mL48j0OcgoxC4gn22PFmxBr3BC7HIk6peil2weTTwQGfBg
	qPLNtFUsV/T2qvq+ZTCps09rW2Rv6tgWd0w9hUeH4h+K+vz1kreQLyvbU7J5OKTibvl5H5UAc7/nJ
	Vv/ixYej3bjrxLaHoo2BbU/03iZ9vj0luf6ythAop9RIG74GVaC1OcXVr6RuYxDo91mEkBADwcTy0
	hz7HWurPiBPkl3mPTkuNAaxQF8mjPks0y7vU5+i/A+ZvSC6mYQp8P+0aH6rtW5eKoRJyYzwNJKElw
	KFZxtTe13dQkvhqcoyXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsytN-0000000A5iQ-1sp4;
	Sun, 09 Aug 2026 08:28:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsytL-0000000A5iJ-1iO8
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 09 Aug 2026 08:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=cLHBp3kVyXFvQap3rPmU0j7Ee3NVjrNgZCHBeW66eBM=; b=avgX1N/Z330lcO0LxGXtQTHP7f
	Nfc9bM3CxwrlKobBCSlZ0qPrdElvIYq+RRtq4L9RurcrwiqHfExV6MZLL4c2uVu8bFEBQwPIelFHw
	93tbLYlL4G8eHG2bTjh0VANHSBQkNsT7I/kfL4HyHocnPH9sAODi/IeiUdihzZ/2s7Msgfz8WArhY
	mkn+vgFJQ6E6dwG37zij/pOH22EK8f2eqyjHHkPFcVGz9C5NX7f7BGrOc+B+pwACHNFpPycROKh5N
	PmqsEWI51ZfsHPGMr46c6U+o0TWDrx29TEpBLQ9TH3ANhPr2iwCV8inNbLUz7awWUTom/mCpW4dfQ
	qwZs7X/g==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsytH-0000000DEjP-2zYG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 08:28:21 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 441624311E;
	Sun, 09 Aug 2026 10:28:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKNuF9xN9AOk; Sun,  9 Aug 2026 10:28:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786264083; bh=5QRgRuns4zmF+gog8Y8zKAsY0zWas35xtUPB392I1/s=;
	h=From:Subject:Date:To:Cc;
	b=EZJv+0tcIsLwxPnEi0byDnAaiCG4kdaBfBnLTFiCTg7gAspwh3rDpAGOmOQdNsOde
	 dhts8OZp+vOJz5wYbcdQCSwvK7B3CDwdCqYLR4z1O3ZwGQy1dm3N/urHP9IVxHWJ3y
	 LIwbp3P0CRlkDVHcEu4iGohTvF1MBIcumKiKFpZ+xKfovbU0KDlKAFICQNc+hbf0cV
	 WTnqiC532HQBasDZNNIm3O0/ml/nC8RglSi2IzRY8uLcqdopcJXVFuEwcCHTN6AMrx
	 kgS+rYA71nQTTjvwh0WT3QML/p3mMjjMP3v8yY+3s/aeiCJ6Yq2prPAfDWEP+T5BKL
	 r54KD2COOTfEw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v4 0/3] Fixes and enhancements for Exynos (7870) DSIM
 bridge driver
Date: Sun, 09 Aug 2026 13:57:40 +0530
Message-Id: <20260809-exynos-dsim-fixes-v4-0-ca67c51e61b7@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBAF0KuYrq1pZ4ASV97DuKjtAF1ITUsaC
 OHuFjbESFz+P/lvZhYpOIrseppZoOSi830OxfnETKf7lrizOTMQUAkJBadx6n3kNroXb9xIkZd
 Yo6101QiFLO/egbZDnt0fOXcuDj5M24sk1/afliQXXAJYUSgNaOXNuhi8Hy4+tGz1EuwGiPrIg
 GzoulRUSxQa9K+Bu6EAjwzMhjAoNUn7JGO+jWVZPlndrW48AQAA
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
X-CRM114-CacheID: sfid-20260809_092819_850963_7D2E106B 
X-CRM114-Status: GOOD (  10.77  )
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
Changes in v4:
- Clarify active-hight MFLUSH_VS in code comment (Luca Seresoli)
- Move aperture_remove_all_conflicting_devices() before
  component_bind_all() (Sashiko)
- Change `timeout` type to unsigned long (Inki Dae)
- Correct typo s/Calcutate/Calculate (Inki Dae)
- Correct inverted condition waiting for PLL stable completion
  (Inki Dae)
- Do not exclusively conclude IRQ routine for PLL_STABLE interrupt
  (Inki Dae)
- Explicitly enable PLL_STABLE and SW_RST_RELEASE interrupts during
  reset action (Inki Dae)
- Wait for SW_RST_RELEASE interrupt before setting up clock (Inki Dae)
- Fall back to bit testing for PLL stabilization when timed out
- Link to v3: https://patch.msgid.link/20260723-exynos-dsim-fixes-v3-0-0c31ae1dbecc@disroot.org

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

 drivers/gpu/drm/bridge/samsung-dsim.c   | 56 +++++++++++++++++++++++++--------
 drivers/gpu/drm/exynos/exynos_drm_drv.c |  6 ++++
 include/drm/bridge/samsung-dsim.h       |  1 +
 3 files changed, 50 insertions(+), 13 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260124-exynos-dsim-fixes-5383d6a6f073

Best regards,
--  
Kaustabh Chakraborty <kauschluss@disroot.org>


