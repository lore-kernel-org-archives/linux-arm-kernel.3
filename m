Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DA9C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w+Q9frommDA1jxYT7PN66+gmpag0qJtc9CREHiU22eo=; b=FeES+SzFCGBdlC
	uHiJVL52de8hzp//D/GKaqS6TA4klW/vaV7+oxLUNm1TUVSlNP2F8H22nv/X66E9k6zcnuPj8t9Zr
	xfNvybWzpVPocMXhRL7hWWL+4QxKOh09X7WRmCAGQ+RNFH/1pweytfUb6tWC5A45jmsb7LO/uPO2l
	+JKQRH3cUUSY/PahoSm7MTtftuq43rQWVnSkYZAs8E5r5cj/3664p+ELoYkFaLX4mwTeaZzuMwpUR
	Wk4KCnAeviRKFj2dfvstv4YqsYS2AE19fXZXSVOD8Q+4icNkaGNQ92JsMA838H8S5dYwna9tgPDFa
	loeoQ/CgAyJsgf7J+bzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMfl-00000002ojH-0oNa;
	Tue, 04 Aug 2026 21:27:41 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMfi-00000002oic-1Um7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:27:40 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4a475409044so148143b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 14:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785878857; x=1786483657; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w+Q9frommDA1jxYT7PN66+gmpag0qJtc9CREHiU22eo=;
        b=IhgFERrboojyU3q3KaI/1EkVMtRxRqGyXi5TF1EsvFXfpcAuLw50PR5DAA7mQZkjGi
         PsFDjF2YZwGLqFYly9OW0eXi8TSjyXoQWqYtB+iYlSwmIW/FI97nsbGyv7lUX06y8RRw
         By0wAmZMxWrVaHqTW+P7+B+lm9+7FKoS9lgPecLcwGyza6ACDKgG7jUdsoyUfDqjNrVZ
         p0UjDVg99a9fgaBeMv4bOKyu4dRD4H19P8OU/mjf8gysWK6i/dYy2Mz5D+BwT2A9OrXi
         QS7pILYYA6q+sIpygU6Wz+rHiVa1B/+tpI30/OsxiG20wkBMlwSaXrCvYS10qXSpjbc7
         ULYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878857; x=1786483657;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w+Q9frommDA1jxYT7PN66+gmpag0qJtc9CREHiU22eo=;
        b=Vcj5VV8HTXHV3vHqK/F8Y5V7J30DTi5kC1HH8K8bmkoHIyS14/9DECey6YQG72uwLY
         IBrgbaNJOKHIWmatGO5UqnRVpgOrd0HrQCpart8lMVm4aUe2OUqN/O122YUjZDDNBLDO
         iIMTRE+swxU7Y9v4dHkwwCkEm572eHyg+IWV7YYSqwwhFA2n5f5Ke2DKhLUPC8w8OQLT
         CEegnfSrmjfv6uEETq9xRHg9qD2gqk81piBy580+SGM2+UAQrW3z676ENi1gfqMcBo/Q
         Wn5+WYk/8QX3dL6Govl8TN+Xqzhm9WjW57rfcgBvpI/3XZp+KdfjKIx9wCZUjZY1cue3
         XYlA==
X-Forwarded-Encrypted: i=1; AHgh+Rpo6L7rxg9w0PhNCsgUkIPJYMR5P7oYfxVSlJszVMRDKrLCNLk6WiJw6M8TeO68oQIN08psspxG+gooYJGfy3kX@lists.infradead.org
X-Gm-Message-State: AOJu0YwpASb7KaR6nCGidc35xdn1CAEzxxacTIbRnsT9DV0Dv6Bo+owr
	CeKNsRmnesDeeV87f7f3FYFo3i0tSH5rGMrzkeMEsBcP+5A06E88kpDz
X-Gm-Gg: AR+sD119Gz4irr8GR1HSvMg8ixQaBWsSUtpNmFwL4n4YxIJAgzNroFN7SMoZodiuYAD
	8grm/Sk3R257zlWeDIbbbN8n6/xMc/20+cfSsEkEf7je5u8PP3/v06GesfApZiKnbgdeFTtfJxC
	rmHr1ssTSsZmyQjn7CLcPZXtvk7NFi4Gy2aNX9pj+dk/MT5qZCghzXm8TccjDo4RJI9C6daMuan
	uobTWfwcUhu96iKD9B0/qNvQtHOJZo2dXXDLaXAeTei9iseRBed4zeLFfJ/cyTMkKxDeOIMbpRV
	RRx5TgL5pzVnjVICmXdTTDsXGY7kpvu2nlMVcRxDdLjSgUFDQwQ4BrjetWTK0yDY5k7+80yIEbH
	lb4mhN2hs7uUwpri+lCd+QNiE52K+uDbOYu2r1xogQkKOXvgZzo8d+gVseflBmmg/MGuA8BYD8V
	spK9bQ76/BDjIr+1xl/aO+0DF3NOX98od/6qYdUpELM7CmJ83vt3iKtExO6Wzy4sVlhITZD9Pbj
	vPndYJ82LG2X0cLHXI3iS9cgYOZUsxAmkFzZNJVSP10rrdkbYnVSclK4jYvIOFh5TcBAcAoQWvw
	rQ5o8XFXPNvUN9bfwsdZaOw4mRwea7hjlUFch8/8EbEZsTnc3qk50RaAPKrTDmsolZBPKhFcCss
	N6QKZx2PTzaj0GRTN
X-Received: by 2002:a05:6808:3506:b0:496:3a1:e44f with SMTP id 5614622812f47-4afadf85227mr1137479b6e.6.1785878856956;
        Tue, 04 Aug 2026 14:27:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae7c50e9sm451659b6e.17.2026.08.04.14.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:27:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v8 0/4] Introduce Allwinner H616 PWM controller
Date: Tue, 04 Aug 2026 15:27:23 -0600
Message-Id: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XRy07DMBAF0F+pssbWPPxkxX+gLtrEbYxoXDlpA
 FX9d+wiFMQChZV1JZ87I/vajCHHMDaPm2uTwxzHmIYS3MOmafvdcAwidiU3BGTAAYveoBHnt5O
 YnQiEO0/KgiduijjncIjv97bn7VceL/uX0E61ot445HQSU5/Dbmm1wKiJUEv05LQXKHIsw3Mnj
 2FIl+5pn9L0GgfZplMt6eM4pfxx33nGOqwWaSTQCEDsJWrDrPnvprrhTD84WnCkQUkHRGYF5m9
 sAInBMxNJZLLs/AquFs6gwaPXXpJmYKtWcL1whQYZFXpZn7KcK7j5xVUZW7gBzXYFtwv/3wdub
 7fbJ/VHjml3AgAA
X-Change-ID: 20260803-h616-pwm-v8-e21a92470923
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_142738_485299_E6B55410 
X-CRM114-Status: GOOD (  23.80  )
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

The Allwinner H616 PWM controller is quite different from the A10 one.

It can drive six PWM channels and, like the A10 controller, each channel
has a bypass that permits it to output a clock instead of a PWM waveform.

The channels are paired two by two and share a first mux, prescaler and
gate. Each channel then has another prescaler, which is bypassed when
that channel's bypass output is enabled.

The clock structure looks like this:

            _____      ______      ________
OSC24M --->|     |    |      |    |        |
APB1 ----->| Mux |--->| Gate |--->| /div_m |-----> PWM_clock_src_xy
           |_____|    |______|    |________|
                          ________
                         |        |
                      +->| /div_k |---> PWM_clock_x
                      |  |________|
                      |    ______
                      |   |      |
                      +-->| Gate |----> PWM_bypass_clock_x
                      |   |______|
PWM_clock_src_xy -----+   ________
                      |  |        |
                      +->| /div_k |---> PWM_clock_y
                      |  |________|
                      |    ______
                      |   |      |
                      +-->| Gate |----> PWM_bypass_clock_y
                          |______|

Here, xy can be 0/1, 2/3 or 4/5.

Because this is unusually complex for a PWM controller, the driver uses
the Common Clock Framework to manage the clocks.

PWM_clock_x/y serve the PWM function. PWM_bypass_clock_x/y serve the
clock-provider function.

The PWM driver acts as a clock provider for the bypass clocks. This is
needed, for example, by the integrated X-Powers AC200 or AC300 Ethernet
PHY co-packaged with some H616-family SoCs, whose input clock comes from
the PWM5 output.

Normally a fixed clock can be built on a PWM through the pwm-clock
driver. That interface, however, passes an integer-nanosecond period and
50% duty waveform to the PWM provider. Its clock-frequency property is
the rate advertised by pwm-clock; it is not an exact-frequency request
made to the underlying PWM hardware.

For example, pwm-clock represents 24 MHz as a 42 ns period with a 21 ns
duty time. The exhaustive v8 PWM rounding happens to select the H616
bypass and produce 24 MHz for that waveform, but this is a consequence
of the PWM rounding rules, not a contract that the hardware rate equals
the rate advertised by pwm-clock. Exposing the bypass through CCF
instead lets the consumer request an actual clock rate, conveys that
duty-cycle and polarity control are not required, and makes the shared
pair source visible to CCF's rate arbitration.

The H616 block is therefore both a PWM controller and a clock provider
when bypass is enabled.

Why v8 substantially restructures v7
------------------------------------

The v7 driver registered a composite CCF clock for each channel even
though the mux, div_m prescaler and gate belong to a channel pair. That
model made the channels appear independent and allowed one channel's
rate selection to reprogram the active sibling. V8 registers one CCF
clock for each hardware pair and programs only the channel-local div_k
prescaler in the PWM path. Each Linux-managed active output protects the
pair rate, so an incompatible request fails instead of silently changing
the sibling waveform.

Firmware can leave a channel running before Linux has acquired either its
PWM or bypass clock, so CCF reference counts alone cannot describe every
active output. The pair gate and rate-change notifier therefore also
inspect the hardware channel-enable bits. Generic unused-clock cleanup
preserves inherited outputs long enough for declared consumers to claim
them. At driver sync_state(), channels which remain unowned are stopped and
empty shared gates are reconciled through CCF. This prevents both premature
shutdown of a late-probing consumer and indefinite unclaimed outputs.

The bypass clock remains a separate child of the pair clock. PWM request
and clock prepare callbacks arbitrate ownership of the physical output,
while CCF rate protection covers the complete prepared lifetime of a
bypass clock. This models the actual shared resource and avoids encoding
clock intent as a special PWM waveform.

The waveform conversion was also rewritten rather than extending v7's
single-source heuristic. It now enumerates every reachable parent,
div_m, div_k and bypass setting and applies the PWM core's ordered
period, duty and offset rounding rules. This is needed to handle
inverted waveforms, constant levels, the 65536-tick period boundary and
equivalent settings without overflow or an arbitrary parent choice.

Hardware updates are now transactional. The driver waits for a pending
period update to latch, uses live PPR updates only when the input clock,
prescaler and polarity remain safe, and quiesces the channel for rate,
polarity or bypass transitions. A failed pair-rate change is rolled back
before the previous output is restored. This follows the documented
period-ready and PCLK constraints and avoids disturbing an active
sibling. The driver records the active and newly programmed periods to
derive a tight timeout for its own updates. Only an unknown firmware update
falls back to the maximum possible hardware period, and an adaptive sleep
interval bounds the number of MMIO polls even in that case.

Pulse and active dead-zone modes remain unsupported because the PWM API
cannot represent them. A dead-zone enable left behind while both pair
outputs are disabled is only dormant configuration, however, so v8 clears
that state before programming a normal PWM instead of making the channel
unusable until reset.

Finally, all clock topology objects are allocated per device and
registered with managed helpers after reset deassertion. This replaces
v7's mutable static clock templates and manual unwind path, eliminating
cross-device state, lifetime and probe-failure hazards reported during
v7 review.

Runtime validation was performed on an H616 system with a co-packaged
AC300 Ethernet PHY. The PWM5 bypass supplied an exact 24 MHz PHY clock.
PWM waveform tests covered normal and inverted polarity and the 65536-tick
full-duty boundary. PWM4 was exercised concurrently without changing the
active PWM5 clock or Ethernet link, while conflicting PWM5 ownership was
rejected. An injected firmware-active PWM2 bypass remained intact through
probe and unused-clock cleanup, then was stopped at sync_state() because no
consumer claimed it; its now-empty shared pair gate was disabled as well.
An injected firmware-active PWM4 bypass on the same pair was also removed
without changing PWM5's shared gate, rate or Ethernet link. The
firmware-enabled PWM5 bypass was claimed by the AC300 consumer and remained
at exactly 24 MHz with a 100 Mbps link. A dormant dead-zone bit was cleared
before programming and updating a 100 ms waveform, while an active
dead-zone configuration rejected the update without disturbing the running
output.
Full PWM and MAC unbind/rebind recovered successfully, ten cold boots
completed with the 24 MHz clock and 100 Mbps link, and more than 495 MB of
receive traffic completed without RX errors or drops.

This series is based on upstream commit 31996e14bd59.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Assisted-by: OpenAI Codex:gpt-5.6-sol
---
Changes v7 -> v8:
  - require both the module and bus input clocks for H616
  - clear the complete two-bit clock-source selector field
  - leave rate and period registers untouched when disabling a channel
  - distinguish PWM-owned bypass signals from clock-owned bypass outputs
  - round shortest-period requests using the fastest achievable clock
  - encode constant levels without overflowing the 16-bit active-cycle field
  - rebase on upstream commit 31996e14bd59
  - require #clock-cells for the H616 clock provider  (reported by Sashiko)
  - allocate clock topology state per device, use the fixed two-parent map,
    and use managed clock registration
    (reported by Sashiko and suggested by Philipp)
  - deassert reset before registering clocks and keep the reset handle local
    (reported by Sashiko and suggested by Philipp)
  - arbitrate channel ownership in clock prepare/unprepare and select bypass
    only while the clock output is enabled  (reported by Sashiko)
  - roll back failed PWM requests and serialize channel release
    (reported by Sashiko)
  - protect the shared pair source while either sibling channel is active
    (reported by Sashiko)
  - preserve the 65536-tick duty intermediate before polarity conversion
    (reported by Sashiko)
  - keep the hardware-waveform state within the PWM core storage limit
  - clarify that either co-packaged AC200 or AC300 PHY uses the bypass clock
  - drop driver Tested-by tags after the clock implementation was reworked
  - quantize inverted waveforms in hardware ticks and report their
    physical offset
  - force released channels off so stale waveforms cannot restart with a
    sibling
  - track the active and pending cycle for the period-update handshake,
    adapt the sleep interval to bound MMIO polling on long periods, and
    honor the PCLK rate constraint
  - quiesce rate, polarity and bypass transitions before reprogramming the
    output
  - clear unsupported pulse mode when programming periodic waveforms
  - describe the bypass clock cells and simplify the fixed parent topology
  - avoid resetting active pair registers during probe
  - model only shared pair clocks in CCF and program per-channel dividers
    directly
  - make pair-rate changes transactional and hold exclusivity only while
    an output is active
  - implement formal waveform rounding across all parent, divider and
    bypass choices
  - preserve firmware-active outputs through generic unused-clock cleanup,
    stop any still-unclaimed channels at sync_state(), reconcile empty pair
    gates through CCF, and reject pair retuning while either output is
    active
  - clear dormant dead-zone state when both pair outputs are disabled,
    while rejecting active dead-zone and pulse modes which the PWM API
    cannot represent
  - correct the hardware topology to show the pair gate before div_m
  - Link to v7:
    https://patch.msgid.link/20260703152215.192859-1-richard.genoud@bootlin.com

Changes v6 -> v7:
  - rebase on v7.2-rc1
  - Cc Common Clock Framework maintainers  (suggested by Uwe)
  - add missing static before SUN8I_PWM_X_BYPASS_GATE
  - reorder code in probe to fix potential lifecycle issues
  - set pwmcc_data[i].parent_names to NULL in sun8i_pwm_unregister_clk

Changes v5 -> v6:
  - remove trailing junk after the patch 4 commit message
  - remove Tested-by tags where they do not apply

Changes v4 -> v5:
  - fix bypass handling for channels greater than 1
  - add colons to clarify two debug messages
  - switch from H616 to sun8i prefixes in code, filenames and module names
  - fix consistency issues in macro parameters
  - rename confusing macros
  - rebase on v7.0

Changes v3 -> v4:
  - gather Acked-by and Tested-by tags
  - fix a pointer-to-integer cast size warning on ARC
  - add a managed action for clk_hw_unregister_composite
    (suggested by Philipp)
  - remove the unused pwm_remove function  (suggested by Philipp)

Changes v2 -> v3:
  - use U32_MAX instead of defining UINT32_MAX
  - document U32_MAX usage in clk_round_rate()
  - define clk_table_div_m using macros
  - fix formatting
  - correct the parent clock order
  - simplify code using scoped_guard()
  - add a missing const qualifier and rename to_h616_pwm_chip() to
    h616_pwm_from_chip()
  - add missing error messages and remove redundant ones
  - rename cnt to period_ticks and duty_cnt to duty_ticks
  - fix PWM_PERIOD_MAX
  - add the remove callback
  - replace DIV_ROUND_CLOSEST_ULL with DIV_ROUND_UP_ULL
  - add H616 prefixes
  - protect _reg in macros
  - switch from apply/get_state to waveforms
  - shrink struct h616_pwm_channel
  - rebase on v6.19-rc4

Changes v1 -> v2:
  - rebase on v6.19-rc1
  - add missing headers
  - remove MODULE_ALIAS  (suggested by Krzysztof)
  - use the sun4i-pwm binding instead of adding a new one
    (suggested by Krzysztof)
  - retrieve parent clocks from the device tree
  - change num_parents to unsigned int

---
Richard Genoud (4):
      dt-bindings: pwm: allwinner: add h616 pwm compatible
      pwm: sun8i: Add H616 PWM support
      arm64: dts: allwinner: h616: add PWM controller
      MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM driver

 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml      |   33 +-
 MAINTAINERS                                        |    5 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |   47 +
 drivers/pwm/Kconfig                                |   12 +
 drivers/pwm/Makefile                               |    1 +
 drivers/pwm/pwm-sun8i.c                            | 1542 ++++++++++++++++++++
 6 files changed, 1639 insertions(+), 1 deletion(-)
---
base-commit: 31996e14bd59840692d6c1c6e41ef878b77a2967
change-id: 20260803-h616-pwm-v8-e21a92470923

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


