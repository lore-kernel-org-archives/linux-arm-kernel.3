Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBF0C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TaN2NTDmPgA7xbWSLdWhOHnIhSnNjTOIfLYsD08nTAI=; b=2CFxNOY2l0XUtzJIOOhYbcP7ES
	F/d+HEPsPcPqeYXAM9AmO2aapyBpKRm0L9YFkXD+tdnf0WOhag5+2+m2Uo3NjCJDK2SY9SRdmZasn
	+R3WijGDz5lQYQYdIXuGzPd1g5dQv4C+bJZfzebyDLfVR231vf+DhB39WUAdlbgpQPNYvVzkSiLTO
	RuNORh949FgGGwbLCr+80VCm8wAyjeO2L8fpNVhAb4tkjM2GaWukAlFUc8vypyNBE0E1FTUir0Ipg
	A7Znsqut8+Lxp2qwlImnUwMmHiIA6RZIquX8DBH90wO5A19oewnX6aKaZT7lgvvxEb6r5pL/vMGWI
	Ji2XGOFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3su-00000008Viq-0fwT;
	Tue, 21 Jul 2026 06:23:20 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3sr-00000008ViO-1sHw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:23:18 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8423f236418so5776955b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784614996; x=1785219796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TaN2NTDmPgA7xbWSLdWhOHnIhSnNjTOIfLYsD08nTAI=;
        b=NUDIw1Fi9nYkJQ7vYYrUprv4yUWrpxW7ojAm4d78ZzbpCB7veVRu4IRqnD0KzMMbx5
         qJdNrFLl87Km2ys77HOWaZEPFCYIIRt7mw55GXn461Xxg6E/XE1WWxgkLzpHhZ8MEvEW
         m0UbPwcasAdO/PvbJTqyTpYoRAV/YOMtCUtDAL1O5Nv4IrqAbQR1hSMyYk3XmPVKVD+L
         sBZHqErPxmLv1OWIi/EaJEwqL3Q9fhmIvzHHRe4xAdTbEuuLwMigpvFqt7B+IhcvdKpA
         n8U2K8JU1/z7Wr+oMEiNSEi0q46UGKYTvHAkP4y36bjvy03zPPdQw+BhPgIM15ZujjSd
         RzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784614996; x=1785219796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TaN2NTDmPgA7xbWSLdWhOHnIhSnNjTOIfLYsD08nTAI=;
        b=ERW1N+WX77wxMurU4NC4L7Phx0P+5AQfYypyXLfGIHowDtd2HG7Jiag4Xyh2Gh1XWw
         a3+vSjuAnSuzMeX0NEXTGvcetHRqiJS5+YuRx2kJam9hYYW0YkpS+J+J1hGAol0ZuB3c
         /WhpMJ3/hthTndkpa1b/4x3AG/bIaX2+gh5nh9uVOfnMZ00xxfU0EPYVkP8A7Gq35qDn
         aFlK3gjn4MYAqDKlTnPZ7iT9LQZsmv+BX6xniCs9iBe1AQ61qSpcBlUpZc+LcNFpLgRU
         DKHTV5qcG6DFoQ7tcIUr6TF8CSqteWoPMaX6gnn6JWfznCOaIrqQHexJp36Asf5xwYgI
         P2eg==
X-Gm-Message-State: AOJu0YyOMtrNpVIB26cBXxHB9Dzd5TEBKKWqPcl/Ve6C2/qgp7gO7vqv
	ukO8hm/D6LqcoUvtI+6XAaGboWfeQaBqs4lYQYR3EtBTEEZ41wys3c/w
X-Gm-Gg: AR+sD122UgZgdvuHWfLJmgVH1Lty+Nc1lu78IAV15KoM0ImZ29dqFc5hgqezqREMFzP
	KK55FFiDR2mJlgZCiFsNG/rOMtumoH1BjLr8dAkl1V1LStiLF3tWbtkRpzhn8ZoA/pUzHlxm3JR
	/WZSrXCYsUpu1mX2EUCikIFNoVlmLWqL+z2rHTgQObmCWiSO2nJS2VI3RWP5OGQHW+TNFs419OY
	RbILbYgFAbQrsEyH2CyWLzv4s2eSEW53OGFLr+w+M0m+U9ThAjQLbQlb7nUT5zwkwUrn9aLTqeE
	Yw9YrgX87NfgOJBOer8y2xlPpAq0P/emxxB9YorUXAFD3PSGJ2ZvbAJz+kEPfw1Ogrw/5mdqocL
	Ruusjxskwe6P5+qndC9r4o28gXRQZkOlRgc0A3EtK0kijqMN0Ik7hIHansVJOFbGfdwr/vV7rA/
	E/seQqDj8N9WB7x7/bcq3DQPK3kB8aYszRGroDkAvMUZ4DnPnfTwdvuXqC19ik0bWV
X-Received: by 2002:a05:6a00:228f:b0:845:3fe5:cddd with SMTP id d2e1a72fcca58-84c29501125mr17502562b3a.36.1784614995643;
        Mon, 20 Jul 2026 23:23:15 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c4b640050sm4020710b3a.45.2026.07.20.23.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:23:14 -0700 (PDT)
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
Subject: [PATCH v5 0/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Tue, 21 Jul 2026 14:23:06 +0800
Message-Id: <20260721062308.536947-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_232317_512451_59D6DB87 
X-CRM114-Status: GOOD (  23.12  )
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

PERIOD and CMPDAT updates are buffered by the hardware and take effect at 
the end of the current period because the driver selects period loading 
mode by clearing IMMLDENn,WINLDENn and CTRLDn. When a PWM is disabled,
POENn and CNTENn are cleared, and the output pin is put into tri-state.

The driver does not modify the PWM controller during probe. This preserves
PWM outputs that may have been configured and enabled by firmware, such as
a display backlight. The counter and waveform configuration is changed
only for the channel passed to .apply().

Since the independent/complementary mode selection is shared by each pair
of channels, the driver refuses to change an active complementary pair to
independent mode when the paired channel is already enabled.

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
  - Update nuvoton,ma35d1-pwm.yaml
    - Add maintainers entry
    - Increase "#pwm-cells" to 3
    - Update ma35d1 pwm driver
    - Make include header and macros definitions organized alphabetically
    - Rename macros REG_PWM_XXXX to MA35D1_REG_PWM_XXXX
    - Add macros for register address

v2 resend:
  - Remove wrong 'Reviewed-by' tags.

Changes in v2:
  - Update nuvoton,ma35d1-pwm.yaml
    - Fix 'maxItems' of 'reg' to 1.
    - Remove unused label
  - Update ma35d1 pwm driver
    - Remove MODULE_ALIAS()
    - Add chip->atomic = true

Chi-Wen Weng (2):
  dt-bindings: pwm: Add Nuvoton MA35D1 PWM controller
  pwm: Add Nuvoton MA35D1 PWM controller support

 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      |  45 +++
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ma35d1.c                      | 380 ++++++++++++++++++
 4 files changed, 436 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ma35d1.c

-- 
2.25.1


