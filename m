Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26A5E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F7te/mdfDITkzd5bHNxgqCwsPTiQMmaX37BqCKR4E/w=; b=EH+Dfu+CvhlfBj
	Rb/3jL0kiDAK+h9DwUnBPRpk4PuYk1/4AnKxOp0novmgOS6SDHxFG5FG5i5A7tz+Pz/dXjBDaKJRk
	aQBWJtSk2jvHGG39F/LlrXWOir90iQW8BuDfT9v53jlv2ErzlVZNdLdDa8tsaUH9TS8Dr7o+F0FKv
	LrwL2LJKJORBU4ScbsY24a57qnJ1nwsJeI7U4+fGpfeKciSBEd3xjgXDaN74lbIAAanqFNXxCFpdo
	jFuFqHC/5zva0j1mvikZaKTfRzrHC9h81NX/NYvFuLsTyhLzcOQ2iz4Gx3ngtjOFCOrC2yKkRYtfQ
	ozgRFpmXHmgjcDHGCnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd3d-0000000DbwD-3eie;
	Mon, 22 Dec 2025 10:22:29 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd3a-0000000Dbuf-2CSZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 10:22:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so1731920f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 02:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766398944; x=1767003744; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F7te/mdfDITkzd5bHNxgqCwsPTiQMmaX37BqCKR4E/w=;
        b=zdsEVQQBLQWkHrDBAUSd6Rd2GHTAY8VSK/Ns8bI6raSEz9a7zMxIKI8eDTnuqBumdC
         vKomHzPcx+giO8GIitgoocbo/gEd/ZwDSK0tSHi9luxwXmYZD7Xhq5VNF7zk+1On3Xpu
         ljlbX03Xl2m8ZFanMpMHYiZ2CDe5QEfZnyd1K+iHeWdMIUa+wM+jatXIh1ruQ7Hystz3
         sHZUYh7R5rgslEda3sSANTWOzWuNd5T2ACUjnqOhBWI4OFh681NH4RonD+84zpCVlaBT
         bYjm6p+E+UvHKoDaFEBU2th6ywmIfoo+DFPrisOzBIA/faklcwch7ClUjnSvH1aTJWkz
         jcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398944; x=1767003744;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7te/mdfDITkzd5bHNxgqCwsPTiQMmaX37BqCKR4E/w=;
        b=DQvGjJX9kPzgaJV9aht9Jcdeg1Q4dT7nrk97CnrV/6kU6D78zqtk5VrjXCGQ23bqPQ
         kp72R+E5/xDMGZZ+T/yQZ4oMQml7CA0C51a7boDvRfTfXjSgcs2bxErfEZ+pv1iTo3XC
         ggIYPV303zr1im65cbj+pUv88TcYylZFqiMD19cSU76mszepfV8kE3z8cq5DxSv5ujPG
         /wnU3kq6VlT3NDngS3BS44DiB9agk8/bwVZfy/JnenwHKfhh/FK3yJJH3BLyt6SyXxtW
         pC4NFsKYR6g4Gh6QwMpRDLFUTEwT18pbNhX1WehZCyJx31FnF4PYonwXn3MaLhWAXaSD
         Ythg==
X-Forwarded-Encrypted: i=1; AJvYcCX4HDWqwZ/xYrTKFoFJBktlh/IarKGBGdi1+Wj/d/TIlHrhbZHlqIq+60bMMGfBK49tfJhv1jHdOBMo5tELeRCx@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrmnt35kRm4dZTB60xu/0vkWzB+l/oe0CMtxK+TlWD7eONmEQp
	uIzBxwQfgop7fHlrI4cEolUe0pSSLxNhBTuHsoREF5rnMmkmTyiQbRIGG7DFRw28oh8=
X-Gm-Gg: AY/fxX5BIBM2tpPDNONc8sEbIw4pmF3y2qPVxoDG+/1tecQRrUCYOebo8LTrJzcPBWG
	a6OqLYaWvDaFycD2aYhNTBZ/pd7OgBXSXo94OIZXCfAhTcVO2hW4qB8dImrmOsDafYqpU52o6+m
	BrsRMTItEerK2xczoYGPC8WmiUXDzeHpG6p+38hQGxqCD5Yn33m5HAtDSD4wtgZ8Us7dKgXvoy9
	w+c6lz5gy4MG7r0NcRvRnJRg4uh6MiYggLzsSOVGsI48DdvAKk8OAoZSh4/RHRfuQsg8SvNZa12
	bK4AEJrU9oantk5eUgPfRP5Lz11kwSMIl0hIbMjAkEP+/xAVekgolH9XiUsv1vY/7QYF4nAXz/i
	H4xJOJdu11ILxuBSsf1s7V8eL4+pgSAD+qk9nRt1lfaRoWqCeegIHPQpYSd04TJdGBKuW6GzYUc
	5oTn8AEymbRfT5Bl50DJ8W3kFwM7o1B9g1f2huxBY=
X-Google-Smtp-Source: AGHT+IFYKW7hkHs+q1hwkrDYxKVTdEJ1enXg6f/ErtqKpyVndEVkh+q2ODFn6SiOENNuKCfUVmQiIw==
X-Received: by 2002:a05:6000:2dc7:b0:431:266:d13a with SMTP id ffacd0b85a97d-4324e50a238mr11551035f8f.48.1766398944429;
        Mon, 22 Dec 2025 02:22:24 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82feasm21082813f8f.24.2025.12.22.02.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:22:23 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v7 0/4] Implement hardware automatic clock gating (HWACG)
 for gs101
Date: Mon, 22 Dec 2025 10:22:11 +0000
Message-Id: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANMbSWkC/23OwW6DMAwG4Fepcl4mxyEh9LT3mHoIwW6jdWQKD
 HWqePeFalKZ4Phb/j/7LgbKkQZxPNxFpikOMfUl1C8HES6+P5OMXckCAY0CcNJ/j+nTjzHIcE3
 hY5BYNb61wBYDiVL7ysTx9iDfTyVf4jCm/PO4MKll+ocpvcUmJUHW6IwiAtAAb9fY+5xeUz6LR
 ZtwJWCzI2AR2FHXaY+dw3Yj6KdQiB1BLwIrIM9kVXAboVoJCnaEqgiOK9tgwwbaeiOYtVDtCKY
 IxG1TVphDtxXsU0Dc+8EWQduAjLX1Spt/wjzPv+WOisn7AQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9101;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=pnrtE374durfYWYGWJuhCa4akX05g7TvuOetRABij0A=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpSRvYGroqAvPDBBybxubEfLKyunoje23Utldl8
 mxcQKkS0NyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUkb2AAKCRDO6LjWAjRy
 upmYD/9TWoBe3O615A2vunn8KNgQ9e9kV3ZgkhsDjNd3mhyoo1VVuWbMJ/h+G0ZaDVtZA6bEmjd
 WclkgDOC4Qt9CuNvyjFwFOWZ7C7ID7gDU7RaJRWLMTmnAPtoTlgCeSKkVhdlSAci0jBGosErY37
 H1b2oBmiux4kHRadomxvyWZSHVYNhCBwZnkGA9pjTmJelotdM7S44LZCZgd82J7JogfNJcbeHE8
 S7dY2DpdQWg6hhpzBsLCIlzYs+/TcA0qpfJjjkCf2UW/qOUnk+7AIiM3Y1T8x1edcr19+P3Il0C
 qgTv7c9aqYolipScejcThOmR0+gCZoCEeTcEorHzNAXjgx8mYUF7QadkQ3W1HWobmXeNO+mfFYt
 xvrStMGa+aBTnRQK9Edi24jQ1tS13R5h5dcsr++p/0iDXhq0+z6AEgQH5jOLKLE2hSsQAkxIFE1
 pgf3k9rgMbjrIn2/Xt+t3igMM9qTML0URMCKSX4CT5eVfpjg0zVkkbIemQ2DaeJuWfb64nKfVUD
 qYTsDotZBI+dgtogpeWVg9JcO8k0th48oSVpdPEcVpW4x0MTIekI3sicvp/txZ/rImvhLsOazOt
 R/pdvruQQJKcEa1T23AjHA0gDgMQz7d75Qi7gXfJxL2MEh7DQLryYIQwFYExDbK+znNrmdXRk0o
 6KrTUIAiKYlMAgw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_022226_675740_528DFC9C 
X-CRM114-Status: GOOD (  32.23  )
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
Changes in v7:
- Add Reviewed-by tags (Krzysztof)
- Link to v6: https://lore.kernel.org/r/20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org

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


