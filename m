Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12BBC88E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7GG9giMI29wn3x6W3uRNMni+msBraAtSxPD+uXArV1c=; b=RJkcYlF3B6BeF7FuNHbtYk8d9B
	qcL+iEH/kOnQHgU9vMobqH6Y9rxIY6WCAEU5gAf7YYIMcaJkQIszBA7n7Qm6fWzcBs37DoF8kGKcG
	0zPYAtDDMosCNQjEpWoD+xITKMA6tM9+2kfdmKHrC4jYYHBCVOdqcAm7rqtresvm8aCysOMOQGIvL
	XiJic8e49KB7hWSoKQb4qvzzKUT5CIAfuYiISlhbbJJA9q9xNcIqSc92Bm00WqkjPVGyNeibSy8iG
	rHCk/rHKcxHRotqCtz9HWZySi31cw6N7uNhhH1h3jAyb03pD/rRauuDhBEjF0HXo4u9p3J6O6kMIb
	31Drzp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64XR-00000003CmX-3mSz;
	Mon, 14 Sep 2026 11:07:53 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64XL-00000003Clj-1Shy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:07:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2dd6665a10fso7213715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789384066; x=1789988866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7GG9giMI29wn3x6W3uRNMni+msBraAtSxPD+uXArV1c=;
        b=r6C7F76rnYGBIBhw9DTEZ1Aqf+v700PAr8MWuwEhKHv3zfsNcud1lga0u7AFUcChw9
         6oXVQm81DmFp5T+DALegtazunwgUf73HRDgSJPWENXBwkchgqStBxM7cNyOEUjVGd5yr
         6LgtRZhNHL2scU5uGiywkDOI9oMLPazrYrTFY9LKeZpclxQo5XcwudabgUJDeNRQ/jfL
         MFtieb4DZUoxgkT9dr8IAE5C0lPTJi23P+qlMQ7RbaYQlLj8UVa+QbtKfDd44RSlqN6Q
         QXHdheQiJr6atdIltTXppOeHqcqAnImcKKpE57u3GcLwu+fqMfgmC2cy8GI99tmpRry1
         7x0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384066; x=1789988866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7GG9giMI29wn3x6W3uRNMni+msBraAtSxPD+uXArV1c=;
        b=PnE9YfVxNmepwIKTYJJ5yTwtEom/m3WlkmxP6QvWz1v8JRAUew8ccV7Hai0tUJ70ea
         /bmf7SG9sRIO8dpFtKzr56OdZoqq0hCDnbwJMQ07kwadcGEiRN1Q1F0Em46v7B6jukxC
         n5bDsyYHcSKBVhWIik31pn8z4BBugioUNjaWTDp2AjJGk6HPwZC0qdl9m6eKXcyINC1d
         rY4AIk++0CdgYQ0gezoEULEywGCwGeaYgvZ1zRrJgXZHWX/G+yBZ0ndYdYUEd30wSwDA
         NsWjU8G7sm1Gr2fYykX9nxx23XboG0v9bC43HvBABNt6pUpUevCm9TaDvkDglPeqob0r
         3bCg==
X-Gm-Message-State: AFuF++l6dx46tzzXVpq3xybSZrYLnZ+jIc8PZEaOwgNB3CL11tQbr7jd
	Qh5KtolNQoismuQ89jJ5BpXRCCpsfGysRWyoOqvETfnct7N0iDCKX+Ow
X-Gm-Gg: AYBFou0oxSvZrWyVC6zoi121TErxZ4GPfHpnbtkQ1H4Xvm0JSzErZbq9NoEWhxku4vo
	FEnQ77AWrduTDIM0x1ox55fXvd34QfyiqCcx0g/29Lsh9jG0m95mOzt5X3kIkmWx8apu7zoWZHK
	AkDKWPq5r3SwcV7NceePe8jVaQjicoBaFpCJJ9w9WHHPWnANKKNoc9szq+KThJDWlrihWXRdxmC
	OHcsO7om1yWz3vWJb+rcnE3aEO0qwOf//+XxJBOfio1atQEyotK/d1CyARKo7GfZm+6fQDmDzga
	mt54pzzfqcaPFir0YKZ5NTbm33GHm84lBg5DtFFzokVhMMse3v7Aswe173NzIsJjDnn6fSF88as
	FvHNarZ4NXN8GxH2uCJRvKGV/fuw+0YU+4hDYCvuekdl9HUoC30erc+RURT8O2p0OMSjhTPV94o
	97b6/weAe8zrEUKXbMDyJT5mQTBLXyjApTH4BFg4ihh1fK+jOuedwlJ947U/L20ZycNYr6v6XPb
	0/1nt3Z5BBWj/mjmv7692Unu8uwae/YIjgQ/5/zOf+rs367RN1gJR9pb/Gf
X-Received: by 2002:a17:90b:288a:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39debfc0f51mr4690532a91.8.1789384066403;
        Mon, 14 Sep 2026 04:07:46 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9540fd76sm22996627a91.9.2026.09.14.04.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:07:45 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v6 0/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Mon, 14 Sep 2026 19:07:37 +0800
Message-Id: <20260914110739.203479-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_040747_694949_D4914881 
X-CRM114-Status: GOOD (  24.12  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds the device tree binding and PWM framework driver for the
Nuvoton MA35D1 EPWM controller.

The MA35D1 EPWM controller provides 6 PWM channels. The hardware supports
up, down and up-down counter types, auto-reload and one-shot modes, and
independent and complementary output modes.

The initial driver supports independent output mode only and configures a
channel for up-counting and auto-reload operation when an explicit .apply()
request is made. The waveform generator drives the output high at the zero
point and low at the compare-up point.

In up-counting mode, the counter counts from 0 to PERIOD inclusive. With
the selected waveform actions, CMPDAT = 0 generates a 0% duty cycle and
CMPDAT > PERIOD generates a 100% duty cycle. The driver keeps PERIOD one
count below the 16-bit field maximum so that CMPDAT can be programmed
greater than PERIOD for the full-duty case.

PERIOD and CMPDAT use the hardware period-loading buffers. Since the two
registers are written separately, if a period boundary occurs between the
writes, one transitional cycle can use the new PERIOD value with the
previous CMPDAT value. The following period then uses both new values.

The driver selects period loading mode by clearing IMMLDENn, WINLDENn and
CTRLDn. When a PWM is disabled, POENn and CNTENn are cleared. Clearing
POENn disables the output driver and puts the output pin into high
impedance.

The driver does not modify the PWM controller during probe. This preserves
PWM outputs that may have been configured and enabled by firmware, such as
a display backlight. The counter and waveform configuration is changed
only for the channel passed to .apply().

Since the independent/complementary mode selection is shared by each pair
of channels, the driver refuses to change an active complementary pair to
independent mode when the paired channel is active.

Changes in v6:
- Document that clearing POENn disables the output driver and puts the
  output pin into high impedance.
- Document that a period boundary between the PERIOD and CMPDAT writes can
  result in one transitional cycle using the new period with the previous
  duty cycle.
- No functional changes.

Changes in v5:
- Remove the probe-time controller initialization to preserve PWM outputs
  configured by firmware.
- Configure the counter and waveform settings only for the channel passed to
  .apply().
- Keep the disable path limited to clearing POENn and CNTENn.
- Check for an active paired channel before changing a complementary pair to
  independent mode.
- Return -EBUSY when changing the shared output mode would disturb an active
  paired channel.
- Document that the initial driver supports independent output mode only.
- Remove the unnecessary <linux/mod_devicetable.h> include.
- Simplify the WGCTL action field handling and remove the associated static
  inline mask helpers.
- Rename the PWM field and period limits to clarify their different
  semantics.
- Configure period loading mode explicitly in .apply().
- Preserve the pair-shared clock prescaler and account for it in period and
  duty-cycle calculations.
- Limit the period to 0xffff counter cycles while reserving CMPDAT = 0xffff
  for the full-duty case.

Changes in v4:
- Add a Limitations section to describe the hardware capabilities and driver
  limitations.
- Add a link to the MA35D1 reference manual.
- Replace register address macros containing the base pointer with register
  offset macros.
- Add readl/writel/rmw helper functions.
- Rename TOTAL_CHANNELS to NUM_CHANNELS.
- Use unsigned long for the cached clock rate.
- Use devm_clk_rate_exclusive_get().
- Configure polarity before enabling the counter and output.
- Add controller initialization for up-counting, auto-reload and independent
  output mode.
- Configure the waveform generator for zero-point-high and compare-up-low
  output.
- Fix the period conversion because the hardware period is PERIOD + 1 cycles.
- Limit the maximum PERIOD value to 0xfffe so that CMPDAT = 0xffff can be used
  to generate 100% duty cycle.
- Use CNTEN and POEN bits to report the enabled state in .get_state().
- Disable the PWM by clearing POENn and CNTENn.
- Fix error message capitalization and trailing newlines.
- Fix coding style issues reported by review/checkpatch-style tools.

Changes in v3:
- Update nuvoton,ma35d1-pwm.yaml:
  - Add maintainers entry.
  - Increase "#pwm-cells" to 3.
- Update the MA35D1 PWM driver:
  - Organize include headers and macro definitions.
  - Rename REG_PWM_XXXX macros to MA35D1_REG_PWM_XXXX.
  - Add register address macros.

v2 resend:
- Remove incorrect Reviewed-by tags.

Changes in v2:
- Update nuvoton,ma35d1-pwm.yaml:
  - Fix maxItems of reg to 1.
  - Remove unused label.
- Update the MA35D1 PWM driver:
  - Remove MODULE_ALIAS().
  - Add chip->atomic = true.

Chi-Wen Weng (2):
  dt-bindings: pwm: Add Nuvoton MA35D1 PWM controller
  pwm: Add Nuvoton MA35D1 PWM controller support

 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml |  45 +++
 drivers/pwm/Kconfig                                            |  10 +
 drivers/pwm/Makefile                                           |   1 +
 drivers/pwm/pwm-ma35d1.c                                       | 387 +++++++++++++++++++++
 4 files changed, 443 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ma35d1.c

-- 
2.25.1

