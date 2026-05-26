Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF2ACD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+fMWAnNp8KOKogg5FwU4UQE2yjpCrokUNCTuHfLfBA=; b=tDMM+3jUvlaTyCNr1E1uLbeUOM
	31zml0eDYfzo26hO9onljvWCqo3iIvqIZs3QnnlGxvArZ3skbeDiSh3Aa2NakCQrHLV3J8z5d22lZ
	2hK4ni7n+rkYrigMmbGWlAVXEUkoGolurenVrUP4tTpgd+Wu3A9uFKkmpLdz/DYRCMiIeDaJyZqyn
	6rHvQWM89YWt38nhDQibHA0TySm6oF8AYhuYPHOMmn8qRarEet7lK5K3AmCoxP2yd8gy187udwbwS
	R8H/li7tTqSeO0aiW6Ua6agvKN9DjWXmgFhig3jjgjD6f5HOoFUsl33n/e1VpUQA1kLkw9Bur5K12
	I3tHF0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvJN-00000002fJc-2dvf;
	Tue, 26 May 2026 17:11:25 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvJI-00000002fH3-3xbl;
	Tue, 26 May 2026 17:11:24 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CB9C626EFE;
	Tue, 26 May 2026 19:11:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOs9WwFnslqk; Tue, 26 May 2026 19:11:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779815466; bh=NCNkhZt2TCA+7T+e7NKRSVG3uKd1PUwscoI+uF7q3lE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fy0WP5z2xD+VTvOPMhbLsLfDstvJq4QnAQqPqXwa73zIFNFsxAuLZTYuCwk2rwKyz
	 IEf0a9jPUQRxJfNXlxpyqF6LNRXfPPNX7Vr4/gvUBHwbGk/5IbzzMBbrOEI7Ye5S4m
	 bKx1iqMiU6RHrmpYn727I9jVJqRDLB7zjDr/kdTbXc6iWviDlgtOoBnFNbTzjpbthG
	 YAtwhEhworZCTgXETljsgLqOIUwUQa4ogSgtc1spJURkB7/cltAHqBzPPnDnov3z90
	 ou/3yohYORQiTuyaccv5mNSR5NBuW8Nv9McK94CaJSTRBhDYxswGDCx2hUdH/SFFoh
	 +605BwIcsuXkA==
From: Marco Scardovi <scardracs@disroot.org>
To: brgl@kernel.org
Cc: heiko@sntech.de,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	scardracs@disroot.org
Subject: [PATCH v2 0/2] gpio: rockchip: fix resource leaks and teardown bugs
Date: Tue, 26 May 2026 19:02:44 +0200
Message-ID: <20260526171050.12785-1-scardracs@disroot.org>
In-Reply-To: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
References: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_101123_050337_13254CFE 
X-CRM114-Status: GOOD (  15.04  )
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

Hi Bartosz,
thank you for the review on the first version of this series.

TL;DR: There's no clock-names property in the DTBs for the GPIO banks,
       and they don't expose a separate debounce clock in hardware. 

Regarding your question: existing DTBs currently do not provide clock-names
for these GPIO nodes and instead rely on positional clock ordering.

While we could extend the binding to optionally support clock-names going
forward, the driver still needs to remain compatible with existing DTBs, so
it cannot rely on name-based lookup here.

For this reason, keeping the index-based of_clk_get(..., 1) lookup together
with devm_add_action_or_reset() for cleanup seemed like the safest option.

A good example can be gpio1 in rk3399-base.dtsi, where the clocks property
is defined as:

  clocks = <&pmucru PCLK_GPIO1_PMU>;

If we switched to name-based lookup via devm_clk_get(dev, "db"), it would
fail for existing DTBs because they do not define the corresponding
clock-names property.

Additionally, PMU banks such as gpio1 do not expose a separate debounce
clock in hardware, so there would not be a matching entry anyway.

Therefore, using of_clk_get(..., 1) is currently the only approach that
preserves compatibility with existing DTBs while avoiding regressions.

Changes in v2:

- Rephrased patch 1 and patch 2 commit messages to use the imperative as
  requested.

- Clarified in the commit message of patch 2 why devm_clk_get() cannot
  be used for the debounce clocks.

The patches included in this series:

1. Convert the main clock (bank->clk) to use devm_clk_get_enabled(),
   simplifying the code and fixing an existing clk_put() leak.

2. Fix several teardown bugs and resource leaks:
   - Fix a reference leak for the debounce clock (bank->db_clk)
     by properly releasing it with a devm action.
   - Fix a potential kernel panic on module unload by unregistering the
     chained IRQ handler (rockchip_irq_demux) in the remove() callback.
   - Fix an IRQ domain and generic chip memory leak by calling
     irq_domain_remove() during module unload.


Marco Scardovi (2):
  gpio: rockchip: convert bank->clk to devm_clk_get_enabled()
  gpio: rockchip: teardown bugs and resource leaks

 drivers/gpio/gpio-rockchip.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

-- 
2.54.0


