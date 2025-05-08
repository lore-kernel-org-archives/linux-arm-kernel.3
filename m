Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1BEC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 18:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RunLEOIGqZcaHH5istx3/NRLaEmuvJ3v+u+tkMxtecY=; b=E1pBbCpAyRAndz/jQlEqizqj94
	LRiIvDVkqFxYvb0d00fhRgxOLbsolZhjspWit6398hz0zcx3kQ7WhcTwq+v52FuYX4o8ULCsOSbY1
	afQr0m76hc5ph9lcx/+0sHjhIN/6Buc7z8Fhrg2hKM+BEgEt6YX5J00cQE81ZI5zfuBc/zFPgMznt
	jLbT47bbwnl8bHf7mL8LnzikU5SMtfkONbT3w0aaxUTM74jhDm+1Za5dCTi4+Al0aMaIg81ggoCHK
	eaX8Xc91qW64aj2ndgdeTGgtzefrUiQuShUO7HIekex6A+MZ8iv0RuTRBHZXtytgfBtfr1wBte9U7
	7m/0oQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD64U-00000001Ydu-3LCh;
	Thu, 08 May 2025 18:34:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5ye-00000001Xfm-29SM;
	Thu, 08 May 2025 18:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=RunLEOIGqZcaHH5istx3/NRLaEmuvJ3v+u+tkMxtecY=; b=B8CFgnA/nvIjBiXcN3f6gyLwts
	NVXKQl5zaHVKcoAlQDm7NxjfNzwCxZ67VW2B9mIDZxLw8UUCZR26UbN4648Zt4z+wHyKvErtME6am
	8IPC4fzbwYxJnB8BhgoVk1r+rDPFN27etC6wqb4blNajN5SO/byBAf9HfSDoW7tEQL9l1Y+yhkkCe
	RIFPN6OaimgMiXO5Schn66jG6JMUFQrPp2FzMXX3DO0hiWE7tUR7t1FfLn5xac4mrAVXwmI2GLVr1
	KSRasTa11xw+7Ixt1HUjbvNBu/Q+eeDD3Dbp6BgvCfBoQGXdQjfP2god0L1FfMiJ6b/p4dvtK+8Pg
	mHAfUf0A==;
Received: from [61.8.144.177] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD5ya-0000tP-I3; Thu, 08 May 2025 20:28:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nicolas.frattaroli@collabora.com
Subject: [PATCH 0/2] Some minor cleanup in the Rockchip clock driver
Date: Thu,  8 May 2025 20:27:50 +0200
Message-ID: <20250508182752.1925313-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_112812_568450_CA533314 
X-CRM114-Status: GOOD (  10.44  )
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

One fixup for the new grf-gate and bringing the grf-mux branch naming
in line with the oher newly added grf clock-types.

Heiko Stuebner (2):
  clk: rockchip: rename branch_muxgrf to branch_grf_mux
  clk: rockchip: rename gate-grf clk file

 drivers/clk/rockchip/Makefile                       | 2 +-
 drivers/clk/rockchip/{gate-grf.c => clk-gate-grf.c} | 0
 drivers/clk/rockchip/clk.c                          | 4 ++--
 drivers/clk/rockchip/clk.h                          | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/clk/rockchip/{gate-grf.c => clk-gate-grf.c} (100%)

-- 
2.47.2


