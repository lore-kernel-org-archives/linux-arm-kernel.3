Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF325CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NLsoKJdelu/WPigCC1S3cR4NDvBgIx3LeYTE2q0jHyM=; b=B9f1/A1qdfqjpyAWYhpFCaB3ko
	RXBhgSLzXePzU0aap+Uh/LASfK0qoqagAPAaImhtAN7C+5rgqcsjrisXG4f335gd2OzdbrwMFz/gP
	ILTtam3ruZmNdS6QQmGGwb7iIMY+Hnb2rIH23PkfK+gOKe7avcI0j0za+UWn1DhcP8nm3rh5BwQuk
	QGw2yurjsL2wM0Pg9ejYADDr9gu3RmL2OzqG/syMSYc31oM9bw91bavYOGK+Z/Y9rRrvAnD98fxan
	8WqLW7sKfh9MrKNipbIJgsJYSuxY7t4wbFV1kCgiDrCYjvt+c1Qi6dYbRKCGVZDA0uiMO4oDK1v6d
	FIdcXs9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkDy-00000005bw8-0fbv;
	Fri, 31 Oct 2025 08:11:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkDR-00000005bee-3IP4;
	Fri, 31 Oct 2025 08:10:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7022434EF;
	Fri, 31 Oct 2025 08:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D488C4CEFB;
	Fri, 31 Oct 2025 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761898231;
	bh=EIXHJpDNgd4/dzJhbSBB4YpUTUTgFGHOzNPZSvMfSdo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hqftHuG7Gk1hdSRSGwTRDRJSsJ90jUL28WEUZkd5oVh2ef+783P5IleJNGYfscmeq
	 LCCjXtsNtl7pL3h27eNSiUUQeNyIV4d+Fvo7pM6nB5P/PwnVhkvTgqOlrKCPiFFZX3
	 /vweHWmG3dLkBi2hCTMWtBNA5+pxLHI41FnnflTiwbGUDHCu+Zi2AjxmxKDkH9GOGx
	 RfiXgIpIA+zyDY1ldahLZ83K8EnXBg3pQOn7m7qp4PfbKf3U1GJIX1DjNfN9PkDLOW
	 fwWRqS2lQc9D4wHaUZYcEnxQwcHJ+Wl512kQOmmq0hg3OmXu1dUbZHvHWZSsBLLgMZ
	 /7RwjcJx7uRTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92204CCF9F8;
	Fri, 31 Oct 2025 08:10:31 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v3 0/4] clk: amlogic: optimize the PLL driver
Date: Fri, 31 Oct 2025 16:10:07 +0800
Message-Id: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9uBGkC/23O2wqDMAyA4VeRXq/DxkO3Xe09xpC2phpQK1XKN
 vHdV4XBBrv8A/mShU3oCSd2SRbmMdBEboiRHRJmWjU0yKmOzSCFQqSQcjfO1NMLq7HrqtpTQM+
 lRnsWJ1maXLC4OXq09NjV2z12S9Ps/HM/EsQ2/Xjw1wuCp1yBLCSA1aXNr6rvXEPmaFzPNjHAl
 5L9/ypAVDIJMrOFhkLpX2Vd1zf3oyAs/gAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761898227; l=3924;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=EIXHJpDNgd4/dzJhbSBB4YpUTUTgFGHOzNPZSvMfSdo=;
 b=E2xrDs0kzXWia5FQI+8iHPTNFBraPMo5rij9PqIA1dpWE4C4gew9KKfjOfDZ6+XiSjBgfC21D
 mHNmULzDasbDVbyPXl/SLksCIf31EvxUgsOkalRBhrslYxPNjPNqJHj
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_011033_967371_8C59BFA7 
X-CRM114-Status: GOOD (  13.71  )
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

This patch series consists of four topics involving the amlogic PLL
driver:
- Fix out-of-range PLL frequency setting.
- Improve the issue of PLL lock failures.
- Add handling for PLL lock failure.
- Optimize PLL enable timing.

For easier review and management, these are submitted as a single
patch series.

The PLL timing optimization changes were merged into our internal
repository quite some time ago and have been verified on a large
number of SoCs:
- Already supported upstream: G12A, G12B, SM1, S4, A1, C3.
- Planned for upstream support: T7, A5, A4, S7, S7D, S6, etc.

Based on the upstream code base, I have performed functional testing
on G12A, A1, A5, A4, T7, S7, S7D, and S6, all of which passed.

Additionally, stress testing using scripts was conducted on A5 and
A1, with over 40,000 and 50,000 iterations respectively, and no
abnormalities were observed. Below is a portion of the stress test
log (CLOCK_ALLOW_WRITE_DEBUGFS has been manually enabled):

- For A5:
  # echo 491520000 > /sys/kernel/debug/clk/hifi_pll/clk_rate
  # cnt=0
  # while true; do
  >     echo "------------ cnt=$cnt -----------"
  >     echo 1 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
  >     en=$(cat /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable 2>/dev/null)
  >     if [ "$en" != "1" ]; then
  >         echo "[ERROR] PLL enable test failed! (clk_prepare_enable=$en)"
  >         break
  >     fi
  > 
  >     echo 0 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
  >     cnt=$((cnt + 1))
  >     echo -e "sleep time: 1 s."
  >     sleep 1
  > done &
  # ------------ cnt=0 -----------
  sleep time: 1 s.
  ------------ cnt=1 -----------
  sleep time: 1 s.
  ------------ cnt=2 -----------
  sleep time: 1 s.
  ...
  ------------ cnt=42076 -----------
  sleep time: 1 s.

- For A1:
  # echo 983040000 > /sys/kernel/debug/clk/hifi_pll/clk_rate
  # cnt=0
  # while true; do
  >     echo "------------ cnt=$cnt -----------"
  >     echo 1 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
  >     en=$(cat /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable 2>/dev/null)
  >     if [ "$en" != "1" ]; then
  >         echo "[ERROR] PLL enable test failed! (clk_prepare_enable=$en)"
  >         break
  >     fi
  > 
  >     echo 0 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
  >     cnt=$((cnt + 1))
  >     echo -e "sleep time: 1 s."
  >     sleep 1
  > done &
  # ------------ cnt=0 -----------
  sleep time: 1 s.
  ------------ cnt=1 -----------
  sleep time: 1 s.
  ------------ cnt=2 -----------
  sleep time: 1 s.
  ...
  ------------ cnt=55051 -----------
  sleep time: 1 s.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Changes in v3:
- Fix some formatting issues.
- Move the 20 us delay after reset into the corresponding if
condition (no delay is needed if there is no reset).
- Move the code that releases rst back to execute before current_en.
- Remove the patch that changes the active level of l_detect.
- Link to v2: https://lore.kernel.org/r/20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com

Changes in v2:
- Modify the judgment condition of 'm' out of range.
- Split the PLL timing optimization patch to make it easier to review.
- Link to v1: https://lore.kernel.org/r/20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com

---
Chuan Liu (4):
      clk: amlogic: Fix out-of-range PLL frequency setting
      clk: amlogic: Improve the issue of PLL lock failures
      clk: amlogic: Add handling for PLL lock failure
      clk: amlogic: Optimize PLL enable timing

 drivers/clk/meson/clk-pll.c | 64 +++++++++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 25 deletions(-)
---
base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
change-id: 20251020-optimize_pll_driver-7bef91876c41

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



