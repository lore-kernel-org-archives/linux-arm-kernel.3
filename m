Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3037FC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 00:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTM/uCOdIXeCzwj+lqvEQ7bP1qWiXe+FpATzAri2aok=; b=Y4IU/DToKjIyF4hlnwuUP6r0ba
	TIahQxTHoaSYOFsPdcdHVJ8ftw0fu6uC1LdRAMI7yTeeJzHK5xVhDQIU4gwgBaZhyOu7k/qtw9gHM
	/WF6NeWWnKg6cONQLh/zQzAf8iu7L5suzQ3Eui0DaaSFY4EmY8LGyEd3pcEk2MatDPtPBElovWGy6
	M7gOSPJ1HqN/acoxh8xKoRSEggDxIEFp4g1ogdtZmdOYqUm6o/00J68TKUNOptBuXx550qdgT4t3c
	Vn3RrA1Aw6AD4Gl3ZXM/zwjd5mXRCrfi71aQrm0F2ODzEoVMNtMWZiDLPM/0f3GtBrvYp52OAZFav
	IDXgFUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1YTt-0000000DYve-2vVb;
	Wed, 02 Sep 2026 00:05:33 +0000
Received: from mail.lvkasz.us ([116.203.126.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1YTr-0000000DYvB-1YzG;
	Wed, 02 Sep 2026 00:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lvkasz.us; s=pf1;
	t=1788307525; bh=/CCCKx7u/SD1z2NkO1bJZurwMqzPzrZhPYKcLlgoSk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AeS22BDtMX3vpsCc4zhlmE9WLWILrdsFNNCwOTuDGtYsojDWUPF/Y6cLP7XD7g2vA
	 pBBjHu0DYDsohnmOJgBZ7JGI4BNxLN5dQuirRObEqRQHqBtiZGfLnw46atHUcT0eQV
	 C5u4efUH+1rYSXtu8K0QjrchETNX/lbApFTAofBxnn8NwSZRexm5tvvmP3+vFl6hIf
	 fT3T6VWvP0lhxdTvtu6cY/nUlizjDDef43qSxt+1RR5Qd8OiAogMV+y6mPn1gLToRv
	 7HTrAL3a0v6eddKxde7Y0CV7Z0jUWXeCf4u32VLNct0Ti4jYtKZTk8ehFlXPBQU9aU
	 StH6MT1W4A65w==
Received: from aorus.localdomain (5.185.72.109.ipv4.public.orange.pl [5.185.72.109])
	by mail.lvkasz.us (Postfix) with ESMTPSA id 45B9BDF235;
	Wed,  2 Sep 2026 02:05:24 +0200 (CEST)
From: =?UTF-8?q?=C5=81ukasz=20Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
To: selvarasu.g@samsung.com
Cc: akash.m5@samsung.com,
	alim.akhtar@samsung.com,
	andre.draszik@linaro.org,
	dh10.jung@samsung.com,
	jh0801.jung@samsung.com,
	kernel@lvkasz.us,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	muhammed.ali@samsung.com,
	neil.armstrong@linaro.org,
	peter.griffin@linaro.org,
	pritam.sutar@samsung.com,
	thiagu.r@samsung.com,
	vkoul@kernel.org
Subject: Re: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to prevent OOB access
Date: Wed,  2 Sep 2026 02:04:37 +0200
Message-ID: <20260902000439.25379-1-kernel@lvkasz.us>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831070309.158069-1-selvarasu.g@samsung.com>
References: <20260831070309.158069-1-selvarasu.g@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_170531_593968_DF629D6A 
X-CRM114-Status: GOOD (  10.49  )
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

I tested this on my Samsung Galaxy A6 (Exynos7870) with this patch applied
on top of mainline. I wanted to verify the OOB read first before trusting
this fix, so I forced the device tree to request PHY index 1
(phys = <&usbdrd_phy 1>;) - this index does not exist for this SoC,
because the phy_cfg_exynos7870[] array contains only one entry. I added
a temporary pr_info() call after assigning phy_cfg in the probe loop to
display the phy_isol/phy_init values using %pS:

  i=0 phy_isol=exynos7870_usbdrd_phy_isol+0x0/0x60
      phy_init=exynos7870_usbdrd_utmi_init+0x0/0x260
  i=1 phy_isol=exynos5_usbdrd_phy_isol+0x0/0x50
      phy_init=exynos5_usbdrd_utmi_init+0x0/0xc8

For i=1, both function pointers resolve to the exynos5_* variants
instead of the exynos7870 ones - the OOB read lands right on
the adjacent phy_cfg_exynos5[] array in .rodata. No crash occurs, since
these garbage pointers happen to point to valid (though unrelated)
kernel functions rather than something invalid.

With the patch applied, the same debug print shows the loop correctly
stopping at n_phy_cfg=1; i=1 is never reached. Boot and USB both work
fine on the actual PHY index (0).

Tested-by: Łukasz Lebiedziński <kernel@lvkasz.us>

