Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FD4C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BJuzcpGXYVncedFk5d9HUY/cT+JRzKFHXCrY8R9hPAo=; b=cjnFHc9s+TUmBI
	aY7cNOtCg5/PorpPWxGBiH2JD8lR7JYWUSxJsPLi7tB2kAS3f6YN9cTO8WHi3MdePnNxb05LBEC5a
	syKsRpVTPp8npZpnW1yoDuWLGGc515+DwoOwVU8ASpR3mi6Nuk9E271ODT4N2BlqmJXwM03ZGQ30k
	Cs07LqOakYaYkWVJR3Inh6aYkK3fAnk25OhseVSo5MfS+b+F4p44HorLCh9hrNxEnrOGbjUcdcBBo
	D/kqqx0iU38wjkeN25VyVvvzChI6kz3vyAJDLnKG+b5OSIecEJEBc9D+3l+2D/rcdNtPtKrVr1u4D
	CVV69MuVEgmIjlyeF7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnqA-0000000EIMB-1QyS;
	Thu, 12 Jun 2025 19:43:58 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjQ2-0000000DiW0-3sCd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:00:44 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 14A5A260A0;
	Thu, 12 Jun 2025 17:00:38 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ma3iOkFIL4ux; Thu, 12 Jun 2025 17:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749740435; bh=hyszOhcRbzyjfVvsWkNpk+hVLWy3Vif4GHa8XCtb/z0=;
	h=From:Subject:Date:To:Cc;
	b=UBs+WhFPGmXf10maD/KCA03fqTS+jQmw0BJes/UnNzmC3xIEuLH2la6i7Qp2XZk4N
	 3H8QosxjTDSMl6IvaERdEF5o/9lFwU01jdjA0Po7JFJvMiyp3ZABsTzTt4d6yCBiXb
	 yOwlZi+8sc4hHDFjd14rxmfDdpm5jWajdicBwrQoVgHycyO9FJjoAbxM4ebi1EV7sG
	 HxXyQu0I9+eoI17KoDJCUIKGAF1MMtvRXXAbDbQHyrlSqLTeNMMTI9CDxedjW9U9zf
	 iAmientABoTM6Z65Y4RkCs/kkdFAX3sdeN/HQXDj3qX4m2FhuoDL8gcj5zWB0Mkfsy
	 2JIEUcWipbuaA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/2] Samsung Exynos 7870 DECON driver support
Date: Thu, 12 Jun 2025 20:29:18 +0530
Message-Id: <20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEbrSmgC/2WNQQ6CMBBFr0JmbU3bIIIr72FYSGeAWdgxU0Igh
 LtbSVy5fC/572+QSJkS3IoNlGZOLDGDPxUQxmccyDBmBm99aRt3NbSsURLqyyAFiaYM3teIDn3
 XQ169lXpejuKjzTxymkTX42B2X/trNX+t2RlrqnCpKxdc6Gx5R04qMp1FB2j3ff8Ax0hFv7AAA
 AA=
X-Change-ID: 20240917-exynosdrm-decon-4c228dd1d2bf
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749740428; l=1203;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=hyszOhcRbzyjfVvsWkNpk+hVLWy3Vif4GHa8XCtb/z0=;
 b=RBepMzepmmvN9MEFlWtkAYr8CSmXHsbMD5QHpkFVOAJxzE4dbCgTT+mxjmvjvSYo2dr+5RnEc
 0Fi3M5ecoAzBnDtWAjPc8ngbIx8joImgFgyZP9PLH1uivMD+tNAjOEP
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_080043_086301_8A1AB7EF 
X-CRM114-Status: GOOD (  10.05  )
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

This patch series aims at adding support for Exynos7870's DECON in the
Exynos7 DECON driver. It introduces a driver data struct so that support
for DECON on other SoCs can be added to it in the future.

It also fixes a few bugs in the driver, such as functions receiving bad
pointers.

Tested on Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2
Core (samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- Add a new commit to prevent an occasional panic under circumstances.
- Rewrite and redo [v1 2/6] to be a more sensible commit.
- Link to v1: https://lore.kernel.org/r/20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org

---
Kaustabh Chakraborty (2):
      drm/exynos: exynos7_drm_decon: fix call of decon_commit()
      drm/exynos: exynos7_drm_decon: add vblank check in IRQ handling

 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20240917-exynosdrm-decon-4c228dd1d2bf

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


