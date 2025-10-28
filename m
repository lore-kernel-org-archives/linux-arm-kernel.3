Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C0DCCF9F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ByC/W2oznGy4Mtnd35kR81wKPCmbFk2E78S926JlcA4=; b=dsZVgFkRIjhQZ70dsPSGXRdjl7
	WjQuaaOYaUeD1d1qKP5b877E/QWIsT4cYz1vaBtJKSdTvRpueRN9pMthuSazCvrvMY9vv5pOL9gzj
	gvmiBxwp6xjgB5ha9mpwfnlackvmwWaxuTU5FYNsu1D6zAEoKRaOmXW5yMOejZHuI6fl3Y3yZvt3u
	ruBOJ2AbRS/B3gnatJmIgz+T8mIK70/D72SPfVoK/T++lRcdAQ+94JFzqyULIl3reOFi5jFA/xp5V
	ErHhKzfBwq7ZByFpGAOzDYIvOkGMR9CRQrK+aE+g9syR/5dK2tO4VABdRsKagMU11knDhIa2BtDWr
	CNrTZD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNi-0000000Fg6A-1HRn;
	Tue, 28 Oct 2025 09:52:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNY-0000000Ffzn-2Vh0;
	Tue, 28 Oct 2025 09:52:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 788C943A56;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52D41C4CEE7;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645155;
	bh=ioK5ZOkw4s9KW/LEkvm0WElrqFYWX7BayiBP0MdRiGo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cnPdGatQY7oNXrgJarKlBFwdDpB51nLLwuQnJwUQdP13EKXfX49BtT6TMx4qZlc1s
	 PypORfEoWDv3VpYJ4uKBTX8cEIeuTgKXdqyJuGGEFisylEksEhMqYp4QFcxcpcQNEO
	 2UhkOKfCnUaTvU/ABFm5QTUcIG+SF1cTQiRluz05XNDT6SKqJQjAD+3QlntB3AJDgf
	 C9XGBYzZktAD5esBpKyKlXJYSJQ6bWo4j/tHOLseFvcpSBTmqqq2G1Mer/cvuRoh/S
	 X72aS2Ih86/UzDBpsiKUFzAMRIMtU9P4jyDm2MGRNRGXON/4JLx/ff0Q71e6mGfoI6
	 S/Y/fieVndVCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D42CCF9E0;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v4 0/8] clk: amlogic: Add A5 SoC PLLs and Peripheral clock
Date: Tue, 28 Oct 2025 17:52:26 +0800
Message-Id: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFqSAGkC/1WMQQqDMBBFryJZNyUTo2hXvUfpIo5THaqmJCW0i
 HdvFBS6fJ//3iwCeaYgLtksPEUO7KYE5pQJ7O3UkeQ2sdBKG1UDSFtIHJ4yL9DUFpvcEIh0fnl
 68GcL3e6Jew5v579bN8K67gmzJyJIJQsijeYBjarwasfBdYxndKNYI1EfIoBWh6iTmLgqNVBdQ
 vsvLsvyA9CB407XAAAA
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761645153; l=3354;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=ioK5ZOkw4s9KW/LEkvm0WElrqFYWX7BayiBP0MdRiGo=;
 b=cRSuEim5T63EspU1g2+LpOzydALrYZiEHD7YePKx/x6fZFEcKe8Kxz7OB6JV43dZgm+0QTOxt
 pji4lf70lpKCA2UMsg8tEWBYOW8c9TzZ3g2vh6j60OAlgOc9XkvKkIk
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_025236_746157_D86219F3 
X-CRM114-Status: GOOD (  10.34  )
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

The patchset adds support for the peripheral and PLL clock controller
on the Amlogic A5 SoC family, such as A113X2.

Due to work arrangements, I will take over this patchset and be
responsible for submitting and maintaining its subsequent revisions.

I previously resubmitted these patches in another patchset [1],
Jerome pointed out that it made tracking more difficult. Therefore,
I’m continuing the submission here based on Xianwei’s v3 version.
Sorry for this causes any inconvenience to anyone.

[1] https://lore.kernel.org/all/20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com/

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>

---
Changes in v4:
- dt-binding for peripheral clocks (kept Rob’s 'Reviewed-by' here):
  - Added optional clock source rtc pll.
  - Renamed rtc_clk’s clkid to better reflect its function.
- PLL/Clock driver:
  - Adapted to Jerome’s refactored driver interface, naming
conventions, and macros.
  - Updated related CONFIG entries in Kconfig.
- Added dts patch of PLL/Clock.
- Link to v3: https://lore.kernel.org/r/20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.com

Changes in v3:
- Rename xtal_24m to xtal, and modify some description of Kconfig.
- Drop some comment of PLL source code.
- Move definition of A5_CLK_GATE_FW frome common code into A5 peripheral source code.
- Use hw instead of name to describe parent_data.
- Making SCMI binding the first to submit.
- Link to v2: https://lore.kernel.org/r/20241120-a5-clk-v2-0-1208621e961d@amlogic.com

Changes in v2:
- Move some sys clock and axi clock from peripheral to scmi impletement.
- Remove  ARM_SCMI_PROTOCOL in Kconfig and correct name A5 but not A4.
- Add two optional clock inputs for the peripheral(ddr pll and clk-measure)
- Make some changes and adjustments according to suggestions.
- Link to v1: https://lore.kernel.org/r/20240914-a5-clk-v1-0-5ee2c4f1b08c@amlogic.com

---
Chuan Liu (8):
      dt-bindings: clock: Add Amlogic A5 SCMI clock controller support
      dt-bindings: clock: Add Amlogic A5 PLL clock controller
      dt-bindings: clock: Add Amlogic A5 peripherals clock controller
      clk: amlogic: Add A5 PLL clock controller driver
      clk: amlogic: Add A5 clock peripherals controller driver
      arm64: dts: amlogic: A5: Add scmi-clk node
      arm64: dts: amlogic: A5: Add PLL controller node
      arm64: dts: amlogic: A5: Add peripheral clock controller node

 .../clock/amlogic,a5-peripherals-clkc.yaml         | 134 ++++
 .../bindings/clock/amlogic,a5-pll-clkc.yaml        |  63 ++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  86 ++
 drivers/clk/meson/Kconfig                          |  27 +
 drivers/clk/meson/Makefile                         |   2 +
 drivers/clk/meson/a5-peripherals.c                 | 883 +++++++++++++++++++++
 drivers/clk/meson/a5-pll.c                         | 476 +++++++++++
 .../clock/amlogic,a5-peripherals-clkc.h            | 132 +++
 include/dt-bindings/clock/amlogic,a5-pll-clkc.h    |  24 +
 include/dt-bindings/clock/amlogic,a5-scmi-clkc.h   |  44 +
 10 files changed, 1871 insertions(+)
---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20240911-a5-clk-35c49acb34e1

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



