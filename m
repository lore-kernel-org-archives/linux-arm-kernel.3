Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31439C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 13:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y1IxS0jtrAS2T8sDTVWHloBSuBdZ/2pcZoSIPKDAGmE=; b=qvhh+vffSD20Vz
	RarPY9E5F7WhkkBXiIQkK09ksHW28I7e0pwJgozvti+ftz8W2y+Rt3UPIeILWxNojIVw/lzbu9e3m
	RO5AiLXcD4vjSLYhWV9LLBhPRFO4L1YvUVrCtig+rsVDObYKf1/Ldkey7XNPoialbJI5FxKi7FV9j
	n+tCTHi0S+UFi3xrfv9VnLJpG9SnoUTZPVinoCNv2jA1WM/Zlt0QC5iscJufTBiSRpiPeKiQB4W2g
	yOW/+uX5HC/YM0pfpxxZfit6rYGZMRceGSxM4+Ctt4m12bl4PmEOTecdHrzdUlqJsBTYY9NH7AizP
	kwcKsLGwOmuqDWDrSWVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL00n-00000000nFQ-0wXM;
	Fri, 30 May 2025 13:43:05 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzwl-00000000mb9-3Qnx;
	Fri, 30 May 2025 13:38:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1748612319; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SZShYD1t7mTQ9DT2tggEIk7RVpQCf8D3/y2WWQq3xAp3QVq2TJNm8s2lhA5m3Bu7IX4+k3Azipd3wd5/YXEee8Nhg+WAmCgDktW+cPgRxy1nTbwb/ufZlgC6GS60Z0xf1vyoXRkR5neD91mJgPUZrQvyF1lH87/56WRqUC+jYPQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748612319; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y1IxS0jtrAS2T8sDTVWHloBSuBdZ/2pcZoSIPKDAGmE=; 
	b=H3rILkaoiVKgWlNhEKjM6EZiyvUnapLf5g56V+3Bs9THP1+BOv0Z/La9coz7lHvXU7B/RDdf5jf6e/0jm8wQ2bkzPYKyCccXL7uaJlyMPby3SAY5DytJsTzDG/N51Mn9PiN+HltABB0RZAlnB5reYvXoawUyqXogI+Fwl+SmxH8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748612319;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=y1IxS0jtrAS2T8sDTVWHloBSuBdZ/2pcZoSIPKDAGmE=;
	b=W7EytWmsa4SYw9aRN+PY2FYG2NiUItqPeB4c07/PK1UR/4G5Jl6Yc/dXzga8aXn6
	Pv/I+YN9TL/7dFgSsxf7naHrTNbGeWGerVZPEtxySVSOvA9VafN+FPS1QEVY+YlBGnX
	G80zcibtcscMFFi97xEAkivPAzxujErT5+pGHHVw=
Received: by mx.zohomail.com with SMTPS id 1748612317988810.2056390045541;
	Fri, 30 May 2025 06:38:37 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/2] RK3588 rockchip-dfi enhancements
Date: Fri, 30 May 2025 15:38:07 +0200
Message-Id: <20250530-rk3588-dfi-improvements-v1-0-6e077c243a95@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL+0OWgC/zWNQQqDMBBFrxJm3YEYEytepbiwZtIOJYlNUhHEu
 zdUunwf/ns7ZEpMGQaxQ6KVM8dQobkImJ9TeBCyrQxKKiNNKzG9WtP3aB0j+yXFlTyFktF1utN
 KXxtjFdT3ksjx9jPfxpMTvT81UM4R7lMmnKP3XAYRaCv4j8B4HF+xaBm9mgAAAA==
X-Change-ID: 20250530-rk3588-dfi-improvements-f646424715d2
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_063855_924425_00341484 
X-CRM114-Status: GOOD (  10.35  )
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

This series consists of two related patches. The first fixes the memory
cycle counter on RK3588, which read half of what it should've been
reading. You can easily verify this with

  perf stat -a -e rockchip_ddr/cycles/ sleep 1

and then dividing the result by the number of Hertz the ddr init settles
on, which for LPDDR4X on RK3588 appears to be 2112MHz.

The second adds support for measuring memory bandwidth with LPDDR5
memory. Results have been validated by comparing its reported bandwidth
with that reported by stress-ng --stream 8 --timeout 15, which line up
almost perfectly.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (2):
      PM / devfreq: rockchip-dfi: double count on RK3588
      PM / devfreq: rockchip-dfi: add support for LPDDR5

 drivers/devfreq/event/rockchip-dfi.c | 91 ++++++++++++++++++++++++++++--------
 include/soc/rockchip/rk3588_grf.h    |  8 +++-
 include/soc/rockchip/rockchip_grf.h  |  1 +
 3 files changed, 79 insertions(+), 21 deletions(-)
---
base-commit: ba2b2250bbaf005016ba85e345add6e19116a1ea
change-id: 20250530-rk3588-dfi-improvements-f646424715d2

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


