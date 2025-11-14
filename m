Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866EBCE7B11
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MusOjV15eqd+DunevkywFU1fjOENPwqnBUs/CeyN298=; b=bCPLDu76y6W0wJ
	/zTMoYwcsbVDlsGj/mlmN86pQuIQJ+VR8SvSaRiQ6ib26qO811Df80Lw/1tyzHfhfQ7H0IeZztg2e
	BTBUKFtcm1+vxmGJ3CC9V14kYVWGsGkbSTmymDsHOuJy5AQ1qd6pVZ5/Kk7ngPUvdtkp0uKIg6YlU
	Uqd/Ti0WvBGT1sU0NHb/utJUmSrksqFJu9tyDdzHmvF79I84uWbjDjekOiDZPBGebmzFmwck9ES93
	6MGXhSL1QxI1QQKxR4EC6oiBQutMnNhCxntFHcfZ14a/89xrWPORAUGAavQMvax0pFQtHN2iZ2iMH
	3fjcIiE19Pato8gsRZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJubo-0000000CKzR-1wMn;
	Fri, 14 Nov 2025 14:17:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJubm-0000000CKyb-0QgW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:17:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-429c7869704so1576266f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129820; x=1763734620; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MusOjV15eqd+DunevkywFU1fjOENPwqnBUs/CeyN298=;
        b=ypOV8mUb6jTW+SiHo71YZ5fybEEY7y7C63rmCinEXKd9z0lYHurGdqYrz7jtmW+21U
         3kd3usfrn97uyav2HoLaTdgIsGs8WAE38mxRv4xrJixC4XoPGu+xy3hOH9LqCboAtLi6
         zXd1KNBUiwpgYyi+C2XFFTTeaDGEAXXrcSakV+R2+EIUGm20Q8WCwrzVPZltGyaFdNSZ
         6vC9bKzmj7vbwPEHudysiU0vVRGy0VZXWMcc8qtUSlpe3YA+Vqh0Q4e+xaeAmdC6BgMF
         6Nf1E8Ul9m/VsAujDLkSgk1Q4vXboCgvaQ2IHheSe6hONxeqhlkfhPdbAf5pgrasZi0I
         US0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129820; x=1763734620;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MusOjV15eqd+DunevkywFU1fjOENPwqnBUs/CeyN298=;
        b=L9wJ/rFxJORoBgRc5O0Cv6824WWbCc9IXvADAShifAIDIgk437ls8TkeYcYYyO89kt
         tNIt8IXPBbAz3hQjoQrslC+w9QEFTDFY1GK1zlUWxLR5Ml4CqIiygobFarlJK987gXdK
         5bPqRtfb7Qad4WgO2j0K40UHUP7hJKWDOzlHvpCdqjcEy5IqRWcwHo11DXLXRBGJzmm1
         inq7JLNmqMkZv+L6DFcH9W9Q/W/GQCMza0O9lyCAliqIDkhsIIPQmYmLo5TP8Fxk995/
         jArdQLupEqxSek1Y6XyXNz/6cuCZuwqVDVytqBYOuPCykxzfdemErBxyCgP1QBJsSGQi
         8+RA==
X-Forwarded-Encrypted: i=1; AJvYcCVZIKwlks/LFdrG+PKNDMME2hDUR35A7hg+zwaHKwr3T66DQu5ptMxWuYFDQ2Bm6jh+u7TXC9qMgGL06Ql2eB+h@lists.infradead.org
X-Gm-Message-State: AOJu0YxLPIrkIdIDo+EJWkFwtTYkF3senA5JFw6u6NdSIksEz33B2H04
	OEX3ffGQhWpnl3Ujpq5yi7XdJCSUdL3CRqip6FjIa3Sss6l9o/UveVfJzAEMRwf16nYtsWl5uZf
	dOouNhVo=
X-Gm-Gg: ASbGncuh9gLsQKCb4hzsbk9F9JcQrwHRmRBRd9t75v29iBvc/2k9IdRQHr4NJ0ddWOA
	81woLCQ9uvYDmJ9aDfSlrnrAk56TX++pneE9bTdtyx+pDy7s6Sv6e0vq+03fmTZahewz7A75yKX
	QePH/F3eOcodSaZtedhWdoVJzgsdDTqnW/pkggjF1G0XgXdbHRq1lCGK/L+Zvdis4f9vw0MTxnk
	Uokd3M6rfGCcDzxvXy10rVP4usFoUNtzgKoaXh64D/kBZgoHVUZPAk2vHq4hwB12yxvKBrTpeh4
	SDULtsavvW61T7iKE9JC/3utdaJOeFMjaRLvHYKN2v755XjvLoKuoZxfko8sz73hNyGMwp4EHvd
	SBebWLmdbkVZv6yDeI8RhIEZ9o+OSUWBCDdT919iEJwoK3nvr3i9dryAxUhJDE1Qxx/kt86LWSv
	zghkJOxRDO8hoIinn71D8hWrZwhNYW7w==
X-Google-Smtp-Source: AGHT+IE6lPC2ArPH0y3V1wrM8NgzWtwJMV1G/iavb2IWgQ7qatEUYaxhTgFriUNfbEJWAeBWDN/aOw==
X-Received: by 2002:a05:6000:2888:b0:42b:3978:157a with SMTP id ffacd0b85a97d-42b5937876fmr2947192f8f.39.1763129819719;
        Fri, 14 Nov 2025 06:16:59 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f21948sm10150958f8f.43.2025.11.14.06.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:16:59 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v5 0/4] Implement hardware automatic clock gating (HWACG)
 for gs101
Date: Fri, 14 Nov 2025 14:16:47 +0000
Message-Id: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM85F2kC/23NQQ6CMBCF4auYrq2ZTgGLK+9hXJQyxUalpkWiM
 dzdYkzEwPJ/yXzzYpGCo8h2qxcL1LvofJsiX6+YOem2Ie7q1AwBcwGguL53/qo7Z7i5eHOOHLN
 SVwXYAg2xdHYLZN3jQx6OqU8udj48Px96Ma5fTMg51gsOfIsqF0QAEmB/ca0OfuNDw0atx4mA5
 YKASbCK6lpqrBVWM0H+hEQsCHIUrADSlgph1EzIJoKABSFLgrJZUWJpc6i2f8IwDG9PpboHdwE
 AAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8621;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=PtiusYFomlFJQqIy51+0ZGjb65BzpiYU3h/BnyVhrrc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFznTS0dynX3zzQ8DmGdtL8IhvPe3BaDcVKfs+
 E4hAYhuBHWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRc50wAKCRDO6LjWAjRy
 utvND/9MhUZcCGUqLThDGh3bwlZeQ3tcy5YJJuwAdOuQb+JsQCnjL93xRmdhK5FnmAB2tboogAS
 HKGSCIjAxijjIGCdec06VZTAjzJIuhNmkXYCbgLYgO0Uz09T/rOlk1ACf9DlJeaQHDNoOtlDMav
 w5RA3Dg5wS0E6gC6ub5Inm4LCJm/Cvf1uJxLASMukyIjjlzaA7QD3iZ9kK8sMKN/59dQbOpcv2Y
 C9f7NfCUS7TnhzQKcmWgchU4SO2L1yGNaY6a8wXny5gQ2xIws33y+zb3eSfOuM28n3RDk+b1ScA
 8MAqiAPmI1a+V4z4UMQ5P77cJHgQOe8tPTTVH+Wz+d2P0smyr5MeJIAMImfjYeZmoTw7ZpjMBzF
 SBQWN6MDay0yG1Onnj3QBKYb15Qp/IYjLZKluM+PQrw5PTPsJ+y4rsO821HXl5gSbvniZPk0XCL
 FzOdkY9G1JujsDXBJKyF8xaf18+E0+xXXKBBEtLhlOdmZ2vzg7B0Lyrzc6HW1B2Pnsm5StaMUaA
 zYcmsJnXZC1gtOt0t9Zcq6Lw5oQKoFOI9GQERoBwH3ms2+W4bhOW4XEvnNTcqgzIEgL8EyvLZXQ
 GZU5hLqVsjDti0mf98Wxg0oopkqAPNXAvE3W3qM0MtJOKLmSB79HOUX/A9+YSb1+orKn3Bxv5W5
 bWYoKpwuR7vHwTA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_061702_200897_3D7FFFDF 
X-CRM114-Status: GOOD (  31.63  )
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
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
change-id: 20251008-automatic-clocks-249ab60f62ce

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


