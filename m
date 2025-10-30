Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2655CCF9F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 05:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D/Zjfe+nhtqfCaFCij7nBqhYJgLtR8D2E/15g0euPlI=; b=OCZPNQ/a+OLc1YLN25FgK9iPVU
	hAdEPE2sOme3yudmxmlc/b2lhnqKysWPJFSx57nWfpjEJHzVfIgb6uFOTar++/dDNtUECKksgIhp8
	hEerabdGWD+a2dcLTrnBlLxQViSUqpSKalGIvEi6TDtd/Q94iMoLdE8/oJowcSwvtIZCmpx/RV5S6
	0Ju6MD+Db1x7/tuDJCWNMXXD0Zcz1gCHH0zMazDwHP9U3qBy6uGir5+2UtFVW0SvBPg/Sy9Bl1nqy
	yojz+GRUlx2OHSIY0aLbENiDuJA1dSAkC5KZBLhsCPl+FCXns6b07pAxIavULpsKmiumAFxDEOzlF
	oY1yPtfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL9S-00000003VBt-44F3;
	Thu, 30 Oct 2025 05:24:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL93-00000003Uvc-2cqh;
	Thu, 30 Oct 2025 05:24:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D83C3418C6;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2222C4CEF1;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761801857;
	bh=qk43B9yCr7jS07xjPb+H5F9/166ml0k8WcuPbOL1yd4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=O2ZTiUXAX2d5KG2aIahl7c8/Sb9GrysrpoWWwvGa2m5YKYnSbysivAGi+KgrtZ9rU
	 Wjxv6sqaL9Lr4dx/1bwZ85Qep684DUaPuQjm2oDU1TNCKRgAk4l7d5sj2dVE72QgUJ
	 gGUPsEaipBtF9sDzikjvL9aIxktVkStVk1OLG98aygttA858jLbgOJfXe57YM4+xn9
	 nqQ0oaZ3H6/R8csqQNFean7HUnumkNNJmTr0sBEkGOsA9xrjC25SMd/YMFldYigwR+
	 S6v4X1FI8UlJJUaclAWDlIQ6p/iB3gQLaqrMvJuwn3Vj5lngCzdRjqk25X4/NxXwdA
	 1q+idvcoeXyzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9E7CCF9F0;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v2 0/5] clk: amlogic: optimize the PLL driver
Date: Thu, 30 Oct 2025 13:24:10 +0800
Message-Id: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHv2AmkC/22NQQqDMBBFryKzbkoyqGm76j2KiMaJDqiRREJb8
 e5Nhe66fA/++xsE8kwBbtkGniIHdnMCPGVghmbuSXCXGFBioSRK4ZaVJ35TvYxj3XmO5IVuyV7
 VRZcmV5CWiyfLz6P6qBIPHFbnX8dJVF/76+HfXlRCigZ1oRFtW9r83kyj69mcjZug2vf9A/c0w
 HO4AAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>, da@libre.computer
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761801855; l=3694;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=qk43B9yCr7jS07xjPb+H5F9/166ml0k8WcuPbOL1yd4=;
 b=Ye9PcJTMkJnNXguvJBxSK+yppF+Wno1exRnSWWteXg6YN/Pw+36WDOLdRjHH1oDmOdI3Xjjxe
 +Vy68rbQbjsCt8sSw17LMUW3/5DKwJg+qq0XVpEjuNWje75b/DnN6GW
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_222421_746185_5CE0FF18 
X-CRM114-Status: GOOD (  12.20  )
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
- Fix out-of-range PLL frequency setting
- Improve the issue of PLL lock failures
- Add handling for PLL lock failure
- Optimize PLL enable timing
- Change the active level of l_detect

For easier review and management, these are submitted as a single
patch series.

The PLL timing optimization changes were merged into our internal
repository quite some time ago and have been verified on a large
number of SoCs :
- Already supported upstream: G12A, G12B, SM1, S4, A1, C3
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
Changes in v2:
- Modify the judgment condition of 'm' out of range.
- Split the PLL timing optimization patch to make it easier to review.
- Link to v1: https://lore.kernel.org/r/20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com

---
Chuan Liu (5):
      clk: amlogic: Fix out-of-range PLL frequency setting
      clk: amlogic: Improve the issue of PLL lock failures
      clk: amlogic: Add handling for PLL lock failure
      clk: amlogic: Optimize PLL enable timing
      clk: amlogic: Change the active level of l_detect

 drivers/clk/meson/a1-pll.c  |  1 +
 drivers/clk/meson/clk-pll.c | 76 ++++++++++++++++++++++++++++-----------------
 drivers/clk/meson/clk-pll.h |  2 ++
 3 files changed, 51 insertions(+), 28 deletions(-)
---
base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
change-id: 20251020-optimize_pll_driver-7bef91876c41

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



