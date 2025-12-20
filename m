Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC68E668AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 09:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bFMhA15AnZZkBHkOxypkP9FvWp2weXL/FALdblTG1mc=; b=kWRmnsCyf7XriO
	i/B8Sb4uA4HI3p3cOoP9h/F9qtq+5ZHAoOCcVFRnbBpTK+fl/QYuxa5oVFR2S5KpmPEb3yqIMGxPr
	x+0WhYvwIicFoauJwKBufh7h7FsHpiAOfilRQwPR3olKtxWpPB4uYpQ2Yb99Mt7Evkz/ReEsZgk/n
	FKk8e8/jGEVBrpLu6X5FpJ8NxSTy8dHPwpd6ke+WbXkM/3vMWm0rPnpSo5jF//YGPH2Hu44o1FKyN
	jxZbECiJAPasDEb7ZBp1g/AC7gbXHGOJxidyL7oL2RUku0ScgpIcUnHr7xUGoGQMH1ODv12HamiRv
	F6CdCaSnt/vjDQrHprVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsuV-0000000BRR8-0GDY;
	Sat, 20 Dec 2025 09:05:59 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsuQ-0000000BRQ3-3k6X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 09:05:57 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so16969385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Dec 2025 01:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766221552; x=1766826352; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bFMhA15AnZZkBHkOxypkP9FvWp2weXL/FALdblTG1mc=;
        b=k91U27JdpqS4wtQjPbRBPHVw8VCAmQtR06Fsb2oy6uDqb6k59lNM9a94Tnux9jpqKy
         Gf6ESLqwdN0ixYUBVCkHnnPPh3Dr0NNixiBbx8l1KC/YlkYUWThqucvkiNsJk70LuIoJ
         fre267opiyp6Lydz509xtPEd4dpxfK/AlX3BBRdUvOPAPrVf4l6F0/ENSladUxTnMI2Z
         6oXSanpOWEpIt6wF0uVCaq54FLipv/jmgmatfpJSWz3TF5ZpBNY4odZmwm2Xw4n6N8A/
         CYYL0+ckJyFOc25XOnpgzHpOJjkLJSdOe84XB+0eEusJyfv9lNanuZJUWlAVf6oRW0wv
         JQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766221552; x=1766826352;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFMhA15AnZZkBHkOxypkP9FvWp2weXL/FALdblTG1mc=;
        b=i0ud0am5u6cGOcGCiL9jb31QQ9F86uO49P+biP3M7OewE4sqchlCi2oPrpKyu1rlcu
         tTvOaDXNYUk4AAbhZSuNwVZyvUtRz8kJFSEUQIaA6UGEuwECuXF96QzYesfSFqHqxkoW
         TxdcXatF7VVoBPGGHEaz2i9KVOepCg6ZdYnIJ9IF5o1Ixjm7IGtFbIUF7Ar7x3vmNCw8
         Jf3GzpryrQr95Miiaqx7NRGiNhhAt6i3yOEAoDFsnCzxijeJLKTYIv05Yd6unsZIyfUB
         PHRxTxraNHnOoj8o6NF0uzektEQxq598Wmc1MpNEuGi1sXo+lYd40HcyLr6yq9FCsN/T
         u1DA==
X-Forwarded-Encrypted: i=1; AJvYcCWJefAo2V7XdtZiS3wnX3N2jZniFCVoBJsP2xHCBJGuSa0VWrebRfi4pB3flwMwRIzohddP0lRy8crQ63XFpu81@lists.infradead.org
X-Gm-Message-State: AOJu0YyPN4iBYtd4v/XJ/1/qzW4ekxReNhtDNwGiUH52m93pfonevSSP
	TD4uzg5elNp8gWV284h/TnMmOa8/OSuA7Q2SRUdIcLqg+7CDYXcK9fYUU5xR7QXjQHk=
X-Gm-Gg: AY/fxX62NLo1z4rSKELoOw8IuOQLbHItlUIQDrS9N9RzxrvgLgvyV4Z6sTtXHb2b9/R
	iGA+plxLQwqCVWDgxZ54dNmNvR63+xIbZ9DgUBkL7AY/wYwfNhVXqwbGr5dH/V2snOnXg4Abfg+
	bLbYmdUS4pDn96Hs0PlWkWm2IvH4yAHkuZD+xats8GTvBAh06JujCJGe13MS197wbjiuRbmSKiZ
	jHeeXBnoXfyJC75/21eKAZZ47NREU17GExYQRZX856NEHC1ZPNnlFBwki/RgSW3qfwwe7hx1/mI
	cLFG4NdjFnpsyC8BDMKZRmA4wFL2827v1gH6s1P6mv7iRABgmBWQ5Du8fMMv3QjqRU4FdTrYH/p
	kk9IpUqzsbrtf2KCddCBvw9zXOI63OEdyWyaZuhrK+N0WxFjTG66vNdNIpPAB8uGmH3iIVjXM7w
	L8OfGOTUrf7iIRcMwZ+rL4Z1HlpzNUxKXBPHJdGGQ=
X-Google-Smtp-Source: AGHT+IGTFt8xSAiM49vZjNVk1KJSFssC5ukYxotoKf59TklT2COwePyitrFqpeG2x5VoR0hvc3/Abg==
X-Received: by 2002:a05:600c:8116:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-47d1953bd09mr47900365e9.4.1766221552248;
        Sat, 20 Dec 2025 01:05:52 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm88466685e9.8.2025.12.20.01.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 01:05:51 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v6 0/4] Implement hardware automatic clock gating (HWACG)
 for gs101
Date: Sat, 20 Dec 2025 09:05:38 +0000
Message-Id: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJmRmkC/23NzU7DMAzA8VeZcibIcT6WcuI90A5p4mwRo0FJV
 4GmvjvphERRe/xb9s93VqkkquzlcGeFplRTHlqYpwPzFzeciafQmiGgFgCWu9uYP9yYPPfX7N8
 rR9W53kA06Im1s89CMX09yLdT60uqYy7fjw+TWKa/mJBbbBIc+BGtFkQAEuD1mgZX8nMuZ7ZoE
 64E7HYEbEK0FIJ0GCz2G0H+CY3YEeQiRAHkIhnh7UZQK0HAjqCaYKMyHXZRQ3/cCHotqB1BN4F
 i37WVGH34L8zz/AOveMr8uQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8951;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=//GIb7OAmVjsWQKBizLr0xALXMpGX2EA3Daz0kGWYqA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpRmbsjvTmPWdF9+O9fl8lYtSQcJ3i1uNlfNGBb
 PMdF5DTVjOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUZm7AAKCRDO6LjWAjRy
 us/qEACXdSRPSQFsDMMij1Xsu9Fhsbz1TVM/vnTTFYW/zDKRiM6Oenfk+iugKx57Ll2QIY8kWq4
 +WkJiNW+ILZanYFV8RHyLf/fD+k8cZhxFt10g3nzfTJGkCaJ+ORyNFLY2hg2bHhK0e+/43YE+Q0
 pvZntTwYe5kFcVnvVPvFKQUJATj5A7ChK4cMVq/T7N/9q+STAYVJFwzM1ZjTQwC4CBzuRVDYfJD
 yhGaWa6O7uep/1/fhGBanYFT4LESntGu+W/2hUY99vH6A136jhWpJd/BV2beIIFpl9KeoGdUrMw
 4IVYzJr/Totxy0h22BRUuueyEW5uQDaWahrcGb1xwtHZPPRKDUrR9uepqZ0bTf1WSjbrkAQFS8u
 weu+uOYkADWeExlmMJgFkpyMT1SIYkHVZJTcpZksTlyok8R/AFA2b0R0OLojc3Y+G85VNIGo5vD
 UKJpK1c8xCrWNaFeJ7ZrQ4lU/9qsDZSSYDge49cTkicKv4zBz3NPUnxNS2OOR4AHPkTYFDfJIUU
 IXOr4Mq3j6lK+h5vzY+CH0WnX+hQbL9Kp+9ZYsZCRRUA83sn5FWophC8qPyfjKIT0WTEGbdUGTg
 XJ7wZ2MXCXVsirwb7PyzAj/PQVZ9BDUMRwjwRbXRife+UoHAJ9sskC3pZfJQ/oygaMOA7NoQJlP
 EoDfKbLysXKdwvw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_010555_024935_A20B4BE2 
X-CRM114-Status: GOOD (  31.71  )
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
Changes in v6:
- Rebased onto next-20251219 (Krzysztof)
- NOTE: linux-next has a regression atm 
  24ec03cc5512 ("serial: core: Restore sysfs fwnode information") needs to be
  reverted for boot testing this series on Pixel 6.
- Link to v5: https://lore.kernel.org/r/20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org

Changes in v5:
- Invert the test in dt-bindings: clock: google,gs101-clock (Andre)
- Link to v4: https://lore.kernel.org/r/20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org

Changes in v4:
- Update commit description with additional requested details (Krzysztof)
- Remove unnecessary header of_address.h (Peter)
- Link to v3: https://lore.kernel.org/r/20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org

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

 .../bindings/clock/google,gs101-clock.yaml         |  19 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   6 +
 drivers/clk/samsung/clk-exynos-arm64.c             |  62 ++++++-
 drivers/clk/samsung/clk-exynos4.c                  |  12 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |   4 +-
 drivers/clk/samsung/clk-exynos5250.c               |   2 +-
 drivers/clk/samsung/clk-exynos5420.c               |   4 +-
 drivers/clk/samsung/clk-gs101.c                    |  55 ++++++
 drivers/clk/samsung/clk-s3c64xx.c                  |   4 +-
 drivers/clk/samsung/clk-s5pv210.c                  |   2 +-
 drivers/clk/samsung/clk.c                          | 200 +++++++++++++++++++--
 drivers/clk/samsung/clk.h                          |  55 +++++-
 12 files changed, 381 insertions(+), 44 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251008-automatic-clocks-249ab60f62ce

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


