Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986A5CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 20:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nT7uAiV0xMGo0ccwsBEgegZqRMJyigLwSqhDtIUoOXM=; b=NlUPT4DAW7ja37
	ieUSBCi3oj+VDiKj9JXWn0GWNpWvo1oCf3bWttAWdFxzcp3Jh6dVIg5GCtD/cLikM1f5CQvEdC30O
	39tLWae24Igb3eLqhS3pAgtjV0G8iftFiX73KOi8XrKc5SfVPSjEGWgh3rcb/xQ47Th2/7nZBpzzN
	Dn+zq7J45w8xjQAKzzwIefUyU5I+5fT2YDzSrtxmbc+G/0tpuf6YB7sp6cP3c73lLWVBU+pQuLrfj
	85uHDihShOyTEJDNfd3/M1TqdW7jW1fDv/XM35U94X5xR6+wCoT1u//hQOtw7KnjwKCrFZ4sDCIxV
	6kr8xLH9fwO4+LW/QE9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFefm-00000008ntO-0I6z;
	Sun, 02 Nov 2025 20:27:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFefi-00000008nsK-1twh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 20:27:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso51122205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 12:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762115248; x=1762720048; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nT7uAiV0xMGo0ccwsBEgegZqRMJyigLwSqhDtIUoOXM=;
        b=OmWJL1oF1UkJrPXp6XEvjSmxA9NpEb0VC3kgKTUFvoS70MoffNGxW6qprfc8Aq2qWl
         zO6CrUD9Jl/lVKN0MvwLOiAO0c3vuSZO30v4b9L3xsnax8+2SkZI2jap0CivuFlE4p8S
         H/ulaF3BkbjEUewFfGthz/bOZyYRjFIlo7AmZKF4BN9g5IQO4Td/6Rm8qP0jD4JznRgb
         WRdNm2izbO7PsWbB2JAFYt1z0pUObgiQMuVql1pCE9xHLH57SCyXXzSWdv/V+VbTe8Na
         NBcuEDrK/+hS2yMaBJcYx74AYC+1s1xcEUPP4TPal26Sa8oMi1N7EjDIUJ5Uy3NbSb9M
         8zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762115248; x=1762720048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nT7uAiV0xMGo0ccwsBEgegZqRMJyigLwSqhDtIUoOXM=;
        b=ot10LMyEX/IqKzZHwhrlJgpYk6Ic0+b/VIsma0i9n8NCtiyt+iZJsi2e7m1rAG2v2r
         1XjI4WQb/cd4PRRVXKWUAgp7u1763x9jWVPVcOzY1HDMJus41yXRCWCpyvvbYQqART9o
         3TkxtEfoxolAKBz2ycob5bxjwPXEIU6Ful4G3gpVq/EjSSrtLZJ3U7Tm67jkNGAzuDhp
         CvMMoqpUqVnVa8D1MOhoEhGibTJA7A4YyeGUjDlsiX08y9FzJQJPrKCFwHT1XuETdhHX
         W3PGK4X+bllE7jXQKodghRiobJKg8oBdarPlAj//T9a5MyFtSTEcM3rxJHcWlJJ2CRbq
         etqw==
X-Forwarded-Encrypted: i=1; AJvYcCWjAvlsBcYKwOa2o4ZKpCnk2XYZNh84kc6HEnJ87LGpaJuZfNMj9hY+Q//ItoLa5QhLduBVVI/mMmciQjge3/bm@lists.infradead.org
X-Gm-Message-State: AOJu0YxURZEpRlNrQB3iXaRkuJqSle//57HHwmFmSh6JaLc6v6dRcMg2
	tX4rkD3KaUeh6trSvpOLzrx8ASqiAkTad8FhkWsdRkUnZJ656GpDfyCicXDryx28WAo=
X-Gm-Gg: ASbGnctyLmPoiGmGdrnZ18cgO2PSE4J23i3zU1tpue6SRs3sUc1OgmwPHWpM9E3c5Oe
	JQT0x8qmbzpiQM3RaH+ItvbziHTi9ZRSvFvtn5xOCQ/GOoC2aIIWVRk+uacZwr3JA1slGPsxstk
	abnlQSBr8JRaw1bEq8e798lR+O32Om0VdAuzVaTpn9KJ5rPyNhU+/zlmINBuNRaBBEbulfkt7mn
	eJ1iT+wMWf3dU6vlJtg2lPab02smMPoDoFuMOYpWyKMcvL2vPTrzKFBddgn8E1gbN+2l5jZk5H2
	w1qLeFnpFV21R5+4q9HXupkJU8Di8eYmb0SOBg/yMbMCzypBR3A8kEBdHnxy63gLdh6tRYc0gfm
	47GzQ9eJW8JkRoytZczpXs2YMQhw5TmPeIjqmaH0r9fYlBrNX+HyHyMCMhwp4yKj559GxAC3u8L
	Bge6PD/zEGZ8qsopKUwFs/cDnMIU+r2eWmXJZfDPjAIA==
X-Google-Smtp-Source: AGHT+IHIKkiQwKtmGAzKOmgbA356fRiVBqvIHDiF+GGEZBhFiNyjM9x7OLxG5XcUh3gmeu6263UQKA==
X-Received: by 2002:a05:600c:530f:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-4773082d988mr91469825e9.9.1762115247938;
        Sun, 02 Nov 2025 12:27:27 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c374f84sm114664165e9.0.2025.11.02.12.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 12:27:27 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 0/4] Implement hardware automatic clock gating (HWACG)
 for gs101
Date: Sun, 02 Nov 2025 20:27:13 +0000
Message-Id: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKG+B2kC/23NQQ6CMBCF4auQrq2ZTgWLK+9hXJQyQCNS02KjI
 dzdQlxodPm/ZL6ZWCBvKbBDNjFP0QbrhhRykzHT6aElbuvUDAFzAaC4vo/uqkdruOmduQSOu1J
 XBTQFGmLp7OapsY+VPJ1TdzaMzj/XD1Es6xsT8heLggPfo8oFEYAEOPZ20N5tnW/ZokX8ELD8I
 2ASGkV1LTXWCqsvYZ7nF4AB82nzAAAA
X-Change-ID: 20251008-automatic-clocks-249ab60f62ce
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8200;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=OhekFW3h+d47C/5AQdp3ggOLmxhgBAEJIvtUoN5VEas=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpB76pXUE6B9l/PyF19LGMSvyFgmTlaR0K/ip7w
 JLdHmop57WJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQe+qQAKCRDO6LjWAjRy
 uhm7EACjNzKyTNo/pp6snc9dOYQUWRVlkURbNVn7v4DbhPB95Okxryn6+xv7IN0Rc2pJMT9dtLJ
 DNbJqy+TSx1y19jEgZFPggl+TEVQ+iJdH3GR8lA/dxT8ZKJXvQpUt9Nn0i4pFvtNIZXBaJr13RY
 8O5eNmFOVYkcx27T7KAbpCaPeK9MUf4fQ7vO2liCQ5UPwXb1xdGtilNhaUQvPeFpZrM3qn7S+Qr
 lO912goKd56OXbPud0vhI4wjbsNMVx/AInuQAzT2AKb0oCUodwnnHGqsUQI50KkzhCTq8wmkjFO
 kkeOFN8Tb28a8/lfY5IgZGaKU84brFPoxcmMRpgwESqoJVPzlb/KU3boRC1io9JM9qhcJl3mP9s
 42Oqu8L998pReG92a+fMaVR3zmQi08QbAohXWIieBQL4is3+nQDU74fO6Iq/Uo2p7tND2Hmu9XX
 sG1dFInzatdYUaeP9GHJ2sh7PAzH+6DnfkPy/T+x289JrLMKATUSCvaEqdzZoJlUDPi6aw4t2KR
 5YJgOp4b4FSUhuwNj9xRxkNtqReWi3BLCRnx8bIJlz9x6nJx3TWLCHlNcurSZ4vmMGvIenmZ1Ft
 wjOCho7fg7HM17/fr06t/0mtuyBOpw33a+rfQXgzEyGQw6w28rUUAVQ8TLFO3YZD134CErQZfYE
 XsoqbMcMuFLOeyw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_122730_596140_102183A2 
X-CRM114-Status: GOOD (  32.09  )
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

Hi folks,

This series addresses an issue with Samsung Exynos based upstream clock driver
whereby the upstream clock driver sets all the clock gates into "manual mode"
(which uses a bit that is documented as reserved in the gate registers).

Another issue with the current "manual clock gating" approach upstream is
there are many bus/interconnect clocks whose relationships to the IPs
are not well documented or defined in the specs. When adding a new CMU until
now we have tried to label these clocks appropriately with CLK_IS_CRITICAL and
CLK_IGNORE_UNUSED but doing so is both error prone and time consuming. If
your lucky disabling a critical bus clock causes an immediate hang. Other
clocks however aren't so obvious and show up through random instability
some period of time later.

Fortunately each CMU (at least on newer Exynos) provides a "hardware
automatic clock gating" HWACG feature that is used by the downstream
Samsung clock drivers. Hardware automatic clock gating uses a hardware
interface between the CMU and IP to control all clocks required by the
IP. This interface is called Q-channel, and is part of the Arm AMBA low
power interface specification [1].

The advantage of using this Qchannel hardware interface for
enabling/disabling the clocks is that it takes care of all clocks
(including bus/interconnect) ones for the IP automatically thereby reducing
the dynamic power.

Whilst each clock component (GATE, MUX, DIV, QCH etc) has a HWACG enable
bit there are also some "global enable override" bits for the entire CMU in
the CMU_CONTROLLER_OPTION register.

This series makes use of those "global enable" override bits to enable auto
clock mode for the entire CMU and every component within it. Through
experimentation we can see that setting the "manual mode" reserved gate bit
on a particular gate register overides the global enable bits. So the code
is updated accordingly not to do that.

Auto clock mode has been implemented as a "opt in" by setting a new
auto_clock_gate flag in the CMU static data. The intention is existing
platforms in manual mode should not be effected by any of these changes.

If auto_clock_mode flag is set and the option_offset field is specified
then the global enable override bits will be written for the
CMU (to avoid relying on any prior bootstage configuration). Again if auto
mode is enabled the code no longer sets MANUAL and clears HWACG bits on
each gate register.

To ensure compatibility with older DTs (that specified an incorrect CMU
size) the resource size is checked and the driver falls back to manual
clock gate mode in such cases. As the CLK_IGNORE_UNUSED and CLK_IS_CRITICAL
flags are required for manual clock gate mode, the patch removing these
flags has been dropped from v2. I tested with an old DT and we successfully
switch to manual clock gate mode and the system correctly boots.

To have dynamic root clock gating (drcg) of bus components and memclk
enabled, it is required to set the bus_component_drcg and memclk registers
in the correspondingly named sysreg controller. If auto clock mode is
enabled the clock driver will now attempt to get the sysreg syscon via the
samsung,sysreg property (as used by other Exynos drivers upstream) and set
the registers accordingly. The suspend/resume code paths are also updated
to handle saving/restoring registers using a regmap. Note cmu_top is an
exception and does not have a corresondingly named sysreg_top.

As all clock gates are currently exposed in the gs101 drivers and DT, we
continue to register all of these gates in auto clock mode, but with some new
samsung_auto_clk_gate_ops. As clk enable and clk disable are now handled by
Q-channel interface the .enable and .disable implementations are
no-ops. However by using some CMU qchannel debug registers we can report
the current clock status (enabled or disabled) of every clock gate in the
system. This has the nice effect of still being able to dump the entire
clock tree from /sys/kernel/debug/clk/clk_summary and see a live view of
every auto clock in the system.

With the infrastructure in place, all the CMUs registered in clk-gs101 are
now updated to enable auto clock mode. From dumping
/sys/kernel/debug/clk/clk_summary it is possible to see that after enabling
auto clock mode approximately 305 clocks are enabled, and 299 are now
disabled. This number goes up and down a bit by 3-5 clocks just on a idle
system sat at a console.

With auto clock mode enabled it is now also possible to boot without the
clk_ignore_unused kernel command line property for the first time!

For future CMUs in gs101 I propose we continue to expose all gates, but
register the CMU in "auto mode". For new device drivers or updates to
existing dt bindings related to clocks to support gs101 I suggest we only
use the "obviously correct" clock(s). By "obviously correct" I mean a clock
has the IP name in the clock register name, but not try to deduce other
obsucurely named bus/interconnect clocks which will now all be handled
automatically. Note it is still possible to test whether the "obviously
correct" clock is indeed correct by putting the individual gate in manual
mode and disabling the clock (e.g. by using devmem).

Note: As everything here will go via one of Krzysztof's trees I've sent it
as one series.

regards,

Peter

[1] https://documentation-service.arm.com/static/5f915e69f86e16515cdc3b3e?token=

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3:
- Add missing 'np' func param to kerneldoc in samsung_cmu_register_clocks
(0-DAY CI )
- Link to v2: https://lore.kernel.org/r/20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org

Changes in v2:
- Rebased onto next-20251024
- Fallback to manual clock gate mode for old DTs with incorrect CMU reg
  size (added samsung_is_auto_capable(). Tested with old DT and it works as
  expected. It does require keeping all the CLK_IS_CRITICAL
  CLK_IGNORE_UNUSED flags in clk-gs101 so patch removing those is
  dropped. (Krzysztof)
- Rename OPT_UNKNOWN bit to OPT_EN_LAYER2_CTRL (Andre)
- Rename OPT_EN_MEM_PM_GATING to OPT_EN_MEM_PWR_GATING (Peter)
- Reverse Option bit definitions LSB -> MSB (Krzysztof)
- Update kerneldoc init_clk_regs comment (Andre)
- Fix space on various comments (Andre)
- Fix regmap typo on samsung_clk_save/restore calls (Andre)
- Include error code in pr_err message (Andre)
- Add macros for dcrg and memclk (Andre)
- Avoid confusing !IS_ERR_OR_NULL(ctx->sysreg) test (Krzysztof)
- Update kerneldoc to mention drcg_offset & memclk_offset are in sysreg
(Andre)
- Update bindings commit description as to why the sysreg is required
(Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251013-automatic-clocks-v1-0-72851ee00300@linaro.org

---
Peter Griffin (4):
      dt-bindings: clock: google,gs101-clock: add samsung,sysreg property as required
      arm64: dts: exynos: gs101: add samsung,sysreg property to CMU nodes
      clk: samsung: Implement automatic clock gating mode for CMUs
      clk: samsung: gs101: Enable auto_clock_gate mode for each gs101 CMU

 .../bindings/clock/google,gs101-clock.yaml         |  23 ++-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   6 +
 drivers/clk/samsung/clk-exynos-arm64.c             |  62 ++++++-
 drivers/clk/samsung/clk-exynos4.c                  |  12 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |   4 +-
 drivers/clk/samsung/clk-exynos5250.c               |   2 +-
 drivers/clk/samsung/clk-exynos5420.c               |   4 +-
 drivers/clk/samsung/clk-gs101.c                    |  56 ++++++
 drivers/clk/samsung/clk-s3c64xx.c                  |   4 +-
 drivers/clk/samsung/clk-s5pv210.c                  |   2 +-
 drivers/clk/samsung/clk.c                          | 200 +++++++++++++++++++--
 drivers/clk/samsung/clk.h                          |  55 +++++-
 12 files changed, 386 insertions(+), 44 deletions(-)
---
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
change-id: 20251008-automatic-clocks-249ab60f62ce

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


