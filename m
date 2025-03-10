Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131B3C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 10:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZT8kUfSIqR+U8jrdTEq3259tcSEYOxweQkSV2xoZlKM=; b=gOyAJJ82OOzWlb
	+y0MbkaMx5nNzReD5Lubli9tQiMFiutab/qYJl53rmTV4jPrW3JV1SkClumuMDOAYdS/IhjUWnPSy
	L5G0KLwyAm7/IWK2EmEFIHBm7TPo0VjIcb+k2es0TCPaMuVLHPgKyhsqLAVVZyU30y2fRiQJu70hT
	SLKc3Z0GSPkhOctgPFCSPZYSqOauJzkrrIAYwV+f3Q9Fylg64JX0isyySr7RVpyv3j1dBt1WXnuz3
	Tzr6u09gf/7+JJVCaHhy3FHqlD+iF/UKx0KDaFLD1QPwETIA96L1eJ6nDgr5bUdV1HcD5OXIjnvUb
	0gvKpBc2aVTE2IOzq6XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tra7Q-00000002DPs-3gmB;
	Mon, 10 Mar 2025 10:12:20 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZwF-00000002BSy-3mjq;
	Mon, 10 Mar 2025 10:00:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741600834; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dob90s3z+DONEzCUXvAaOGYEGDPs+bd4jgxP31YtrPBNE5GxV4QlxFaWohCjFzrWzA11X4kNHqzW+z9MelRjDmBcaA1t57uYfZUIq9zgFC8vMn/jK430n3L/lp1iWawoIQn5EedojvNh839bKCYolkT5Vsf/MQuUz+UUXT1Sl4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741600834; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZT8kUfSIqR+U8jrdTEq3259tcSEYOxweQkSV2xoZlKM=; 
	b=RH9E2xuXmJP1UAgRBfLw546oEGYFEFhDpNrHIkkF1mMB5nziRoJM4HxGN3/BBHyH36dBcMw2Jk/mzO3taQ1CmhbQq0FzzGXoNLa8NzUEgNjBokGThCILxYNpDCFPkMCnQmYu8e1sL+l31mhP+6VGeTesKQGAgmS8f+Sm+MGFytY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741600834;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=ZT8kUfSIqR+U8jrdTEq3259tcSEYOxweQkSV2xoZlKM=;
	b=H41kcfGVxS+NJd7AoxBHL0YbVoPVD1GftC5jSHsAdnKxn4HHq95F7V6bcRpA/aXD
	Ycccp/ZEjkZkDQcYY4MLMpsMuve3R2YE8PpGQbOActapzRbBf9QdKKTAhg3X94L+uVQ
	UrlKhd11KF4B2+cwfqfyN5c6ucxkIi3vR81Ysynk=
Received: by mx.zohomail.com with SMTPS id 1741600832221948.8309673820739;
	Mon, 10 Mar 2025 03:00:32 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/2] Fix CPU and GPU clocks on RK3576
Date: Mon, 10 Mar 2025 10:59:55 +0100
Message-Id: <20250310-rk3576-scmi-clocks-v1-0-e165deb034e8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABu4zmcC/yXMQQrDIBCF4avIrDtgFCPkKiULY6btkKqt2hIIu
 XulLv8H7zugUGYqMIkDMn25cIothosA/3DxTshra1BSGakHiXnTxo5YfGD0z+S3gk7L0ZjVSmc
 VtOMr0433P3qde2d6f5pd+wiLK4Q+hcB1EpH2it2XFubz/AFYKoUflQAAAA==
X-Change-ID: 20250310-rk3576-scmi-clocks-a30655d70a72
To: Jonas Karlman <jonas@kwiboo.se>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Chen <cl@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_030048_011111_886E4CA6 
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

As Jonas Karlman pointed out on the #linux-rockchip IRC channel on
Libera yesterday, mainline has once again chosen a different set of
clock IDs compared to downstream, with hugely detrimental effects to
mainline's ability to use SCMI for clock operations. This is because
TF-A will use the downstream IDs, and when we reclock things through
SCMI, TF-A will get the wrong clock ID from us.

So this series adds the three relevant clock IDs to the bindings in
patch 1, and then uses them in the SoC .dtsi in patch 2. That way, we
actually get functional GPU reclocking, and cpufreq will work as well.
As a bonus, we no longer change random unrelated clocks all over the
place, and it seems somewhat miraculous this didn't blow up in our faces
in a much bigger way before this.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (2):
      dt-bindings: clock: rk3576: add SCMI clocks
      arm64: dts: rockchip: fix RK3576 SCMI clock IDs

 arch/arm64/boot/dts/rockchip/rk3576.dtsi        | 18 +++++++++---------
 include/dt-bindings/clock/rockchip,rk3576-cru.h |  5 +++++
 2 files changed, 14 insertions(+), 9 deletions(-)
---
base-commit: f064b0a4aa5f2bc61c9611a23a7fc83855751626
change-id: 20250310-rk3576-scmi-clocks-a30655d70a72

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


