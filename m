Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3D3EB7ED7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 12:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Z2Lu7KyAxUqBfTltkfQbHav7d1VSfTjzY0e+ZOM03g=; b=p+mXx58h+7oFuUxtS/7HZ79YfW
	HaSTMJBgkS7DQuOFn51pCTTTqKnjI9p6z3I7KAmrxMinO/ScDDLqy1LF1jC/p1JJBqWrPlLhOOtFo
	jf7IAgker705oxGNQGFrI9YlPVcSE5VtASDVMFIoOLcWDW79QSwEJO+70LgHqThFKjf+5xSKirVZZ
	d1lh7Z4Nlqpy/3MdQSKqo9MUJ63yY2L67LrO1mMZhW+e4776o5ZHXl9HLwFRttDeRptQ/p5heRDzA
	SGQJuRMOxUkCHf0YKJwLashaG8FLR0smkeu9ikk4A90lEdPjntWmaD7C9yZH+gwUjOEgmVyPSsUIW
	YCyo5IGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxl7r-0000000HA8A-0sxq;
	Wed, 04 Mar 2026 12:14:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxl7o-0000000HA72-3EKt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 12:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=2Z2Lu7KyAxUqBfTltkfQbHav7d1VSfTjzY0e+ZOM03g=; b=RtzuhTVgvfzamcYYMwd2F5UgvZ
	Rs+60jPo0mTLU1USTx7SK8CelhQI88B0TG6pyh/QlIDKqtW/Hx9rg7XSEBJwSSeJ9rBcKWR/g3Qzx
	6SeB1GWs+23q5dF3cnSKlU06QY1xec49M6oV/FfH7LumjhJhmLebIN0zvzz87UPJudkSNhrkG6MCY
	lWBBgqsj0uRTWMvlzWmO4NnOIGszVnuUNidwLlPLekNW810uDVESfUHDOdWF0Je8QXbjGZ2Qng77L
	x4K3FHsmpVI7ARjj5rQZW6tIsYg1H3s8fGw6Bt9s5Lk8Kca/yLZ9aEnOEp4XliK37C+0GJ2a14E3c
	DutmfHQQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	zhangqing@rock-chips.com,
	sebastian.reichel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	andyshrk@163.com,
	macromorgan@hotmail.com
Subject: [PATCH v2 0/2] Bring dclk_vop2 in line with other VPs on RK3588
Date: Wed,  4 Mar 2026 13:14:24 +0100
Message-ID: <20260304121426.1184680-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_041448_808675_31F516AF 
X-CRM114-Status: UNSURE (   9.77  )
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

The dclk for VP2 behaves differently and its use can currently break
other peripherals, so fix that and additionally allow it to drive
the same outputs.

I've kept Quentin's Tested-by from v1, as the overall change is the same
but did not transfer his Reviewed-by, as the series-structure changed.


changes in v2:
- split the actual fix for breakage and change of reparent handling
  into two separate patches

Heiko Stuebner (2):
  clk: rockchip: rk3588: Don't change PLL rates when setting
    dclk_vop2_src
  clk: rockchip: rk3588: Allow VP2 the same sourcing options as other
    VPs

 drivers/clk/rockchip/clk-rk3588.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.47.3


