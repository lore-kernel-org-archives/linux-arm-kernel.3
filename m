Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05483C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 19:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7QSeYLY94H2m75IHiBRC24ZoWRTP3U2gls89Vc3KvIA=; b=C9OrDcGoeVQ3qN
	RdifSsjU+zcdrlH+/GhJYjY6orp+5LJ+gDADLtqVIn/r0J+DYCjHk6si7XxVwa4W04SoNiXm+OsuU
	KZ6i5bDRm4FeBLEHEh0CluaNLAeEIKklYMsynQui91D1+Htk2slF4oqzlFK70UNMV7vPnHqvaOIxw
	IR952FILR5uQZcDu5Bx5k0Z4r25AMOcjuzueZytvantBzIL6eOG/WgrAjTXqusxamWT1KkTET28BY
	vyPiAUZ6KGn8YbUc1Mz3pag4ALICuBFmsjg0GWPLufCFL2NeWLGjIY487aFTQqmOEofCwnaoX8/1u
	hR1QTLxDnE0qpufGQw5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsBk-0000000CYy2-0Y1F;
	Thu, 26 Jun 2025 19:23:12 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUs9S-0000000CYbY-3Ey9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:20:52 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 43249260B3;
	Thu, 26 Jun 2025 21:20:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrQBf9LbrxWq; Thu, 26 Jun 2025 21:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750965645; bh=F5drME/H2x0yXDYGBijt8T+fC00BBnPVtIbKK7Wla90=;
	h=From:Subject:Date:To:Cc;
	b=cfgEGIK5oLeB3XE1aJRZiOc/topaDddu3H+5KwtYmrpCELXS+o9lcEtdVkU6YMAqw
	 jwdsTKis6jw+tuuMRZtX4YWEww9nbuuLr9pq/fEGTysVxfkiDFcJj6bU3uNcG+H1uy
	 zqhehyxyYkreANKoQgePjWbulMaPTN3/lKsYblC/M7W14OybtZpQymq/si99jNYFc3
	 mepd4mnR+W4qQFnKDY59ZpuEDP6dRdW502NUBg0aariog0pccrZCMc2/M8LtJZkfuL
	 zexhf8751JoCiJ5a4O4EXRPTFJQxKpHqSsC+qfhX9cXhle8EGSdZug2YiH9KVMq9Re
	 Y5eBgvwPzzO6Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/3] Samsung Exynos 7870 DECON driver support
Date: Fri, 27 Jun 2025 00:50:27 +0530
Message-Id: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHudXWgC/2XOwQqDMAyA4VeRntfRZFp1p73H2GEmVXuYHa0UR
 Xz3VcHD8PgH8iWLCMZbE8Q9W4Q30QbrhhS3Syaofw+dkZZTC1SYqxpKaaZ5cIH9R7IhN8icECt
 mYGxakba+3rR22sXnK3Vvw+j8vB+IsE0Pqz5ZEaSSmopKAwE1Kn+wDd658ep8JzYt4iEUSgOeB
 UwCa0rvAFWqKP+FdV1/pr3Nw/IAAAA=
X-Change-ID: 20240917-exynosdrm-decon-4c228dd1d2bf
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750965633; l=1575;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=F5drME/H2x0yXDYGBijt8T+fC00BBnPVtIbKK7Wla90=;
 b=P19wZTZkJiUTW4xG+909e0UrW1ziOcHgEQAG5ZPLLi/lYtIXzLuRKoE+HKtBa5MAXUQqHSErB
 WKc/kO+8Q4uBXCdO9UHxPatIed3cuAkjsV/5rglvVwj2qEQmt9ZORY1
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_122051_243578_170264DE 
X-CRM114-Status: GOOD (  10.65  )
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
Changes in v3:
- Add a new commit documenting iommus and ports dt properties.
- Link to v2: https://lore.kernel.org/r/20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org

Changes in v2:
- Add a new commit to prevent an occasional panic under circumstances.
- Rewrite and redo [v1 2/6] to be a more sensible commit.
- Link to v1: https://lore.kernel.org/r/20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org

---
Kaustabh Chakraborty (3):
      dt-bindings: display: samsung,exynos7-decon: add properties for iommus and ports
      drm/exynos: exynos7_drm_decon: fix call of decon_commit()
      drm/exynos: exynos7_drm_decon: add vblank check in IRQ handling

 .../bindings/display/samsung/samsung,exynos7-decon.yaml           | 8 ++++++++
 drivers/gpu/drm/exynos/exynos7_drm_decon.c                        | 8 ++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20240917-exynosdrm-decon-4c228dd1d2bf

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


