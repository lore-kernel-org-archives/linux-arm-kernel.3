Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FBEEE498E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 17:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWHnqiC3dSmgRTYrKept5ngKVSik9yAqk7TUBXdQ2P4=; b=Lv5o32Y14eXmI/kC/6B02MuoQf
	2LRreDqZgAAzf4rGdlTz0Zlu2F2lzssByjqtH7AyLnWtfE2jd97xoX0QuMVAEn8hBh/3i7QuVw+/0
	l6PdZ5m8IJ9sFAKS14CMFy0dRpPpRH6uCP6Ei42VDz+lXYP1+u4prXVu9nq1JbqAJ38+WDRIiuLEc
	xrEJwvRhIJkkVKM+f0L8rHARIwC5FKOyQ6y7y28rAXGpMs444usm9+4bova390neOrIXLkMMt3jyZ
	LtY3GcOcUtN0Ks3JUB5oQRcX1UkzGCMja9H8bpo+XB6IOXKHuNY+7lfV2NTFHsH7862lBrUASQty0
	lfSWZ9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadP4-000000056r3-3ipi;
	Tue, 30 Dec 2025 17:21:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadOv-000000056pQ-39vm;
	Tue, 30 Dec 2025 17:21:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F1D0497;
	Tue, 30 Dec 2025 09:20:40 -0800 (PST)
Received: from 010265703453.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9064D3F63F;
	Tue, 30 Dec 2025 09:20:45 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de,
	neil.armstrong@linaro.org,
	dianders@chromium.org,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: jesszhan0024@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] Properly support FriendlyElec HD702E
Date: Tue, 30 Dec 2025 17:20:30 +0000
Message-Id: <cover.1767111804.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_092053_828131_C6C7C745 
X-CRM114-Status: GOOD (  11.23  )
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

I've been using the HD702E LCD/touchscreen on my NanoPC-T4 for a few
years using my own DT with the "simple-panel" binding, but now we have
upstream overlays I figured it's about time to try doing it properly.
The screen itself doesn't seem to want to work as a generic "edp-panel",
as it appears the EDID isn't readable until after the whole lot is
enabled - I'm guessing this might be to do with the Analogix driver's
force-hpd behaviour - but since we do already have the legacy data, it
doesn't seem unreasonable to keep using it.

Thanks,
Robin.


Robin Murphy (4):
  dt-bindings: display: panel: Move FriendlyElec HD702E to eDP
  drm/panel-edp: Move FriendlyELEC HD702E
  arm64: dts: rockchip: Move RK3399 eDP pinctrl to boards
  arm64: dts: rockchip: Add overlay for FriendlyElec HD702E

 .../display/panel/panel-edp-legacy.yaml       |  2 +
 .../bindings/display/panel/panel-simple.yaml  |  2 -
 arch/arm64/boot/dts/rockchip/Makefile         |  5 ++
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  2 -
 .../dts/rockchip/rk3399-gru-chromebook.dtsi   |  2 +
 .../dts/rockchip/rk3399-nanopc-t4-hd702e.dtso | 62 +++++++++++++++++++
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts |  2 -
 .../rockchip/rk3399-sapphire-excavator.dts    |  2 +
 drivers/gpu/drm/panel/panel-edp.c             | 26 ++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 25 --------
 10 files changed, 99 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso

-- 
2.34.1


