Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85712E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 11:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7lo6AZ6nkc8uBrTD0MBuWZ05yA1OzM6rnDDD29CHAoY=; b=UcpoEBrZGG2dizhC/3+9fe95mN
	wetAnLpQoKj21VANAMaBNWoGzzDpOFYxm5A0XLkD5/Ay5SmKQQQqDvcwHxH9zGjAsvHRBt8C6vzRJ
	6kqVROvNacBikbCuZ1Igz7b6J4wLKXT2EwlxDjXu4qY01WMlcS5/o0SH5jhpp+qfG0p0BLOcK+VfY
	TAT9toNfr6bSUKgZ/xZuTnYmZtxh2chnqXvcfm5xGCpdNRFyvfzPg1DVLctJWanTWwDpY+NCGjj2N
	HqAzdRZ2hFJ2X0eudBvHKzHHnqTRVr+65lPnH1iemnm8kFeVB97oszgJMU1MwCYcvJlx6pm05Jr5q
	HeP2kfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDVh-0000000FAIY-3ZWe;
	Fri, 10 Jan 2025 11:49:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDUU-0000000FA1e-194h;
	Fri, 10 Jan 2025 11:47:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D7675C5E54;
	Fri, 10 Jan 2025 11:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF165C4CED6;
	Fri, 10 Jan 2025 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736509668;
	bh=CQAk7BNs7sCcSti/FzDNut5RqmprsFJZKhzVyPEixDU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Nt+1w4UiOGGEC1mOSrGRgzmfuadvNrhrXBd78+pbJKlDh41KrxdgGldXfI6CtHPDg
	 yfJ6YlI81AYIvcce7pBV7Dxp7Ii4s/YTdKpNbQ3tuuqkNy7IZDdfAZ0AaCRr22UI0E
	 3vg7tqFqwR2riQKGCp3UAZMBjjMjGWHFWDsw5vW800O2R9QBeOlW2T37BjdEliBkb2
	 clrus4Ko0Z2kCR3hMK2F8mBwn3ZRaYmE/GzRrLDqzAyjbXoWguk/QazAz1AMRE0b8d
	 /Qs+BBFkpYEhdQdKDtZycMUPcNIwv+EU1XABOm9w7/NQf5qsh/75mMLl3YkU21T2GN
	 aCxnmoXsifG1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC6BE77188;
	Fri, 10 Jan 2025 11:47:48 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH 0/2] clk: amlogic: Limit the rate boundaries of clk_hw
Date: Fri, 10 Jan 2025 19:47:09 +0800
Message-Id: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL0IgWcC/x2MSwqAMAwFr1KyNtAWWsGriAutUYNf2iKCeHejm
 4FheO+GRJEpQaVuiHRy4n0TMYWCMLXbSMi9OFhtnTZG48IrZ4xtJsHX9wHDMqM33vpQdr4PDmR
 9RBr4+p/r5nleLUKm2GkAAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736509666; l=1897;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=CQAk7BNs7sCcSti/FzDNut5RqmprsFJZKhzVyPEixDU=;
 b=K/a3PUYWKhuKUwR/mV8m0LWvJiDK+kJ4UGtfSAsu+LGb3ueehwFWJ7GnAvwTTf5lm2umeQD+w
 D3z32mIAdFNBggglBhIP2ZH8UbCXQ6YSwbkdCwNXoahb14mEEDXtE84
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_034750_404253_5FC972F7 
X-CRM114-Status: UNSURE (   9.45  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The following figure shows a rough hardware connection block diagram
between "clk_hw" and "clk_consumer". The frequency of the clock is
affected by the following two situations:
1. The hardware limitations of "clk_hw" itself. For instance, the
effective output frequency range of some PLL designs is 3G to 6G.
2. The timing constraints for the electrical "line" between "clk_hw" and
"clk_consumer". Timing constraints are applied to each clock network
within the chip, which limits the maximum frequency of the "line".

   ________             ________________
  |        |   line    |                |
  | clk_hw |-----+---->| clk_consumer 1 |
  |________|     |     |________________|
                 |
		 |            ...
                 |      ________________
		 |     |                |
		 +---->| clk_consumer n |
		       |________________|

The frequency boundaries specified for clk_hw in the patch are the
combined frequency boundaries of "clk_hw" and "line", just like the
frequency boundaries obtained after clk_core_get_boundaries() combines
each clks_node.

The min_rate/max_rate of the clk_hw can be described in a less strict
way as follows:
* min_rate = max("clk_hw", "line");
* max_rate = min("clk_hw", "line");

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Chuan Liu (2):
      clk: Add initialize the rate boundaries of the clk provider
      clk: amlogic: c3: Limit the rate boundaries of clk_hw

 drivers/clk/clk.c                  |  4 ++--
 drivers/clk/meson/c3-peripherals.c | 21 +++++++++++++++++++++
 drivers/clk/meson/c3-pll.c         |  4 ++++
 include/linux/clk-provider.h       |  4 ++++
 4 files changed, 31 insertions(+), 2 deletions(-)
---
base-commit: 1e1fd26ed4ca05cc1f0e5857918da4dd54967f7d
change-id: 20250110-limit-rate-range-of-clk-61626c7b6dc5

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



