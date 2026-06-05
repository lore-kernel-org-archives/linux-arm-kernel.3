Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BFDCD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 02:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qmd31Xl8YEPF78aS746HOGoMm6a1yS/+/Q2ASXjijrU=; b=FfQW2hDtnd740uLTMV2k61n7c/
	Bl6LGQcB9UOgBL9Vi/ZEvjum0Z+4qdG5aKoDN5KDYwAlUhjHAaAoabUTOsMZLeiv8ZmIQJKLpQR+1
	TvkMsOQGmdrncrRHeGQr6telLT+qSOdT70NJlnutA/kExPXl+ztQhQcv+8dtYw2BzUEzcL7u2BGeW
	IVXgeLplCBJ+CRbCcDqEQmhL6SutZnYcbSqRkj61xQtMyxoiyWBUBZL/nxFjxNX0ctUiKW6JqqeLm
	7vM9pbkW2+71CH0LfNiWc2ZDGAfmRn+V/n1futZEJHi8e3a210w8DBY5lBIwsSPyKT2G32kQOXtEg
	KN1l10Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVKDV-0000000HZsg-0Gsb;
	Fri, 05 Jun 2026 02:23:25 +0000
Received: from mail-m82185.xmail.ntesmail.com ([156.224.82.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVKDR-0000000HZqx-0P6G;
	Fri, 05 Jun 2026 02:23:23 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 412944ced;
	Fri, 5 Jun 2026 10:23:16 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: sebastian.reichel@collabora.com,
	nicolas.frattaroli@collabora.com,
	alchark@gmail.com,
	detlev.casanova@collabora.com,
	cristian.ciocaltea@collabora.com,
	michael.riesch@collabora.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v11 0/3] Add eDP support for RK3576
Date: Fri,  5 Jun 2026 10:23:02 +0800
Message-Id: <20260605022305.3058853-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e9597895003a8kunm9494c84840184
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSR4eVkofS0xDSx4dH0wdSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ewF0gHb2zHUhiXplbtvTOiSdLmIrvk2wdjGSa3oZuRSgLnSPGyinOjtTNeX5rpkfpgKs072cLKevW9ysr47eTnYLsDIBn6J2iO3nec+AcinsH9ATOiNb9/5IdegKIM9mEDxA7wgYh8KrYDTP1lxk4ka0KJw3/QKikNHIsqnB58U=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=qmd31Xl8YEPF78aS746HOGoMm6a1yS/+/Q2ASXjijrU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_192321_897802_EF94366A 
X-CRM114-Status: UNSURE (   9.02  )
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

Picked from:
https://lore.kernel.org/all/20260601065100.1103873-1-damon.ding@rock-chips.com/

Patch 1-2 are to add missing clock "hclk" for RK3588 eDP nodes.
Patch 3 is to add the RK3576 eDP node.

Damon Ding (3):
  arm64: dts: rockchip: Add missing hclk for RK3588 eDP0
  arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
  arm64: dts: rockchip: Add eDP node for RK3576

 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 +++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  4 +--
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  4 +--
 3 files changed, 32 insertions(+), 4 deletions(-)

---

Changes in v2:
- Split out separate patches to add the "hclk" clock reference.
- Split out separate patches to enable the "hclk" clock.
- Add Reviewed-by tag.

Changes in v3:
- Add a patch to expand descriptions for clocks of the eDP node.
- Add Reviewed-by tag.

Changes in v4:
- Modify commit msg.

Changes in v5:
- Enforce the correct third clock name on a per-compatible basis.
- Modify the commit msg simultaneously.
- Add Acked-by tag.

Changes in v6:
- Expand more detail commit msg about using hclk instead of grf clock.

Changes in v7:
- List all valid clock names at the top level, and constrain the clock
  count for each platform with minItems/maxItems in allOf.

Changes in v8:
- Fix indentation to 10 for enum in clock-names property.

Changes in v9:
- Restore the explicit clock-names for RK3399 and RK3588 eDP dt-bindings.

Changes in v10:
- Use automatic cleanup to fix OF node reference leak reported by
  Sashiko.

Changes in v11:
- Pick and rebase DT related patches.

-- 
2.34.1


