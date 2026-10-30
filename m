Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F8D606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DCgI3Tme;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EakpDaqR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JzAjuDGqRjFI5/M9hXqONAKHHmuFve3CBLlF8W41tpo=; b=DCgI3TmeDAQhKwER06lrDlM8p7
	QN2O05uR95VrD0LkPaoiVYQJmwO442WTZyk3rkHtFNCJqBORvmi1HLSp/5Q9ZfXmpB0kmTBMQRABM
	mUKOycmYEfEbFf5B3f0BHN7KSkpek8kE8NYoBshmNaZYb+OMZrDy1u54aR1Q1fYyroh46B0xNckk7
	iz9sMml49gSiFX+ukl3lWJjAfjXby+bRVvZ32mN7HiHxlL0wpPL0wQ5xyrJcjrMPCkyJmEctqkpID
	kL0StlcNs4Mb5py8pnjNO5RvMeJ84g8ZDbJ1BhsU4AcRja2vwLMGQ82nyh79u+lasZSvcvLR8FF8w
	tDoIqEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjH6-0000000BICy-3N5x;
	Fri, 30 Oct 2026 09:51:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjH5-0000000BIBM-110R;
	Fri, 30 Oct 2026 09:51:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6236543E18;
	Fri, 30 Oct 2026 09:51:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793353910;
	b=OPRgIbulRwQqaYEFLNWtXwN5TjcQgOW/A7CN0L/MFucOhBlHnqBb3EdgrMR2Vp74jslq
	 RtASwIk9SicSRCHNCgyGkyDyiFbEDwT9vZNKRmv+rdR8XvIxVfJF/JbwXmbyDid4IFN3M
	 NlZW+FnSHgWpwo0wEkNwEaZq6UeC7wkyyNb+yZTI2dSnkV7xt/nHl8pv0QK1Ia9Hbwb15
	 9SegNTB8qBAHyy9QoeQIMQGwdzv0o1NdkUhXtJbBBou4yMpOYgoXBCdQNTR7xjDfK2+FT
	 PhLbdJFW6tMQ6BAGB9RTTyr6o74367RiYY/pnKtsavkI6nqXX65dLUQ2S1WbWyz/Ikg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793353910;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=JzAjuDGqRjFI5/M9hXqONAKHHmuFve3CBLlF8W41tpo=;
	b=SPQXA/zPTodVuk2MC+G/TUAS7jAW6GoK+X1OSlw56bTtzBU1JIlVXVkaJ9ZZIRSqzoDT
	 YJ2iwIgRbCaVS9lR0jCMeFLvRnYJ9Wad48vt0XfjBF9VacalmwvHxIPq30TedtKKO3pq+
	 dCY4v9RX/LMs3fE85g0I8u91ui2gkcCi6T+8LgBnMsmWH8trhCF5Jko9k9nPCd/d5F72F
	 LMv6UzK52Rw8ZM+hgW4Ry/zyldzDLHzASjncMDOFhEdxL1Or/I1P2hRE8D2FHA7DLAbJb
	 oisHeGZEc+/4rjOHBWLHrx3SKFaIpOoFxWzizWoOvFCJDnTMwj/mEPy59xLvh3/PDeQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 822CB1F0093A;
	Fri, 30 Oct 2026 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793353910;
	bh=JzAjuDGqRjFI5/M9hXqONAKHHmuFve3CBLlF8W41tpo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=EakpDaqRVIGu2f2Wpp+w00yPJcfaMEZ8Z5DJBCY2ZD49Fz+xWRpEuV4PGCvnGTFAu
	 HQa8iTsaYmbPIJjwAy+yUrSeej+SWsB8vJhVCYdwgAJ73p2NEQUzJ/4EZgRnMQlbSK
	 ZSeM14HnAAPwSLtxfeTDUDhU9tHhaYZnuQTRdlqT8phJ957AY8iXio8YUHvAB7ronE
	 reXBh5PAt+3VscyHlwx+mxCA1IlPXtB4cbrMET1yXZrnyxU6UBdN13hhCSjGafXDKz
	 k86kWQISnoL7z5dFsoN5zkrz1E/cBV4rAG7kZD5h3f21PnuvLZMAHJUWlnu+wL5RMf
	 tS+JbGzgsFmUw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DB7BA4370D;
	Fri, 30 Oct 2026 09:51:48 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Subject: [PATCH v5 0/4] clk: rockchip: Add RK3572 clock and reset support
Date: Fri, 30 Oct 2026 17:43:56 +0800
Message-Id: <20261030-add-board-ok3572-c-clk-v5-0-9a43403cb149@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANxm5GoC/3XO0U4DIRAF0F9peBbDDgtdfPI/jA/ADBZri4VKN
 M3+u1Cj2Sbu403unDsXVihHKuxhc2GZaiwxHVtQdxvmd/b4QjxiywwE6EGA5BaRu2Qz8rSXagv
 cc/+258IIDKgUBDSsHb9nCvHzCj89/+Ty4V7Jn7vWG7tYzil/XZfr0Hu/I/DfSB244MKJgJOyc
 iB6PJ3ufTqwrldY3q8+WaEZRjgzTVI70reGXBp61ZDNQGddsNKgNnBjjEtju2qM3RgHBW4MhNb
 +GfM8fwNmlcJOkwEAAA==
X-Change-ID: 20261023-add-board-ok3572-c-clk-090dfd552fd9
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: Cunhao Lu <1579567540@qq.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353906; l=6405;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=i68Y1nmmCbOvMxH5cnfBIgEWy5M+SQGHJUUSGcBqLJ4=;
 b=PKWYK0y1h0dk2d0qvkIL2ftsiD0DuVIj/NJ3BnWMAoBh7D2a42FNC6rYXLXpZZ14yG51rFj1K
 plJKFv+qfSVCW74Az09TW6oy54KdBRSre4hfgwuTCNx3qZgD5rsMol7
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: 1579567540@qq.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is one of the subsystem submissions for RK3572 support.

This series adds the CRU binding, clock and reset IDs, an internal
Rockchip 24-bit fractional divider helper, a composite clock macro with
mux-table support, and the RK3572 clock and reset driver. The shared
helpers precede the driver that uses them.

The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
ports, a Type-C dual-role port, eMMC, microSD, and UART.

The driver provides the peripheral clock and reset trees, including the
three audio fractional clocks. It obtains the PMU0 GRF for the AUPLL
reference mux. CPU frequency scaling is controlled through SCMI; BPLL
and LPLL remain enabled for firmware use.

Testing was performed with Debian 13 minimal and Linux 7.3 on the
OK3572-C with the FET3572-C module. Shared peripheral tests were run with
the system booted from SD, while eMMC validation covered the complete
boot chain.

Passed functionality:

- SD and eMMC complete the firmware, kernel, and root filesystem
  boot chain.
- UART console works at 1500000 baud.
- SD read/write and data persistence checks pass.
- All eight CPUs start; CPU frequency scaling and hotplug checks pass.
- Both Ethernet ports obtain IPv4 addresses and pass bidirectional file
  transfers.
- All three Type-A ports pass USB2 and USB3 enumeration, data transfers,
  and reconnect persistence checks.
- Type-C host and device modes pass in both plug orientations. Physical
  reconnects correctly select the expected device, host, and device roles
  in sequence.

Stability:

- Repeated cold and software reboots complete on SD and eMMC without data
  integrity failures.
- A combined CPU, memory, network, SD, and USB3 stress test completes
  without a crash, lockup, CPU offline event, or thermal shutdown.
- Ethernet error and drop counters do not increase during bidirectional
  network tests.

Build and checks:

- The kernel, modules, and board DTB build successfully.
- Strict checkpatch reports no errors, with warnings about new
  MAINTAINERS entries and the RK3572 Kconfig help text.

Untested hardware and paths:

- NPU
- PCIe
- GPU, video output, and audio
- CPU rates above 1.2 GHz and voltage scaling
- Other low-speed external interfaces

Some files in this series are derived from the Forlinx OK3572-C BSP
Alpha1. Thanks to Forlinx for their support.

Thanks also to Rockchip's David Wu, Elaine Zhang, Finley Xiao, Frank
Wang, William Wu, and Ye Zhang for providing the driver source files.

AI assistance:

- Codex / DeepSeek V4.1 Flash were used for:
  - Reviewing and adjusting code style to follow community conventions
  - Automating tests
  - Collecting data

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
Changes in v5:
- Select encodable 24-bit fractional-divider ratios using the actual
  compensation and field-width limits.
- Keep fractional-divider rate determination, programming and rate
  recalculation consistent after integer-Hz rounding.
- Correct the clk_ddrphy_top_src and aclk_top parent selector mapping.
- Link to v4:
  https://patch.msgid.link/20261027-add-board-ok3572-c-clk-v4-0-d4152b4fedaa@qq.com

Changes in v4:
- Move COMPOSITE_MUXTBL into clk.h as a separate preparatory patch and
  use it in the RK3572 driver.
- Link to v3:
  https://patch.msgid.link/20261026-add-board-ok3572-c-clk-v3-0-dbabfa39d692@qq.com

Changes in v3:
- Close the reset ID gap while preserving the register mapping of each
  named reset.
- Check fractional-divider scaling against the actual field widths and
  reject unrepresentable compensated ratios during rate determination.
- Use signed negative PLL coefficients in the RK3572 rate table.
- Drop CLK_NR_CLKS from the binding and derive the provider size from
  registered clocks, keeping the existing clock IDs.
- Fix the indentation of the CRU binding example.
- Link to v2:
  https://patch.msgid.link/20261023-add-board-ok3572-c-clk-v2-0-90b98836be6e@qq.com

Changes in v2:
- Split the original RK3572 support series by subsystem.
- Port the vendor 24-bit fractional divider to the internal Rockchip
  clock helpers and adapt it to the determine_rate API.
- Register audio frac0-2. Keep internal SPLL factors outside the DT
  lookup so PPLL retains clock ID 0, and remove the unused xin12m factor.
- Link to v1:
  https://patch.msgid.link/20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com

---
Raw dmesg: see v2 cover letter.

To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
To: Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org

---
Elaine Zhang (4):
      dt-bindings: clock: rockchip: Add RK3572 CRU
      clk: rockchip: Add internal support for 24-bit fractional dividers
      clk: rockchip: Add composite clock macro with mux table
      clk: rockchip: Add RK3572 clock and reset support

 .../bindings/clock/rockchip,rk3572-cru.yaml        |   57 +
 drivers/clk/rockchip/Kconfig                       |    7 +
 drivers/clk/rockchip/Makefile                      |    2 +
 drivers/clk/rockchip/clk-fractional-divider-v2.c   |  378 ++++
 drivers/clk/rockchip/clk-rk3572.c                  | 1981 ++++++++++++++++++++
 drivers/clk/rockchip/clk.c                         |   10 +
 drivers/clk/rockchip/clk.h                         |   83 +
 drivers/clk/rockchip/rst-rk3572.c                  |  739 ++++++++
 include/dt-bindings/clock/rockchip,rk3572-cru.h    |  559 ++++++
 include/dt-bindings/reset/rockchip,rk3572-cru.h    |  713 +++++++
 10 files changed, 4529 insertions(+)
---
base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
change-id: 20261023-add-board-ok3572-c-clk-090dfd552fd9

Best regards,
--  
Cunhao Lu <1579567540@qq.com>



