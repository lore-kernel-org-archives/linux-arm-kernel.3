Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E45C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Cz2gzGY048RFK6yaT1IK/Bb3cZA3GbpsU47/37Y+Pk=; b=NzBRqRQU5S1AiHTpVCBQmQj0Lu
	+JqIm3/1wH/cYITew6ZrrO5k91mM/ranvMcmQJPrrByQ+zIHILFudfZlN1TQg3/aOoGObncPP95Iy
	crDtWLk3CD/eSP6Iya4RsPo5yJWzu+9zE6yyMhrpFhthoaJLzz4glO49orEHCoX7snlVIhyghulkP
	CxymtZhuZZibL47sBPQNyySJIRBvm6E80DXvPDAF58R9nqZ5sEn5RJPztXj+ajDyNetxJUr06LKg4
	bZDRKQDrMu4KdoF4o8xgypdg2mJbdMoW5/LUUOuiXRU7C99llbvjL+oyZ6wZFigO57mGb9slwQe7K
	bjVSovzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uCT-0000000GEwj-2rEP;
	Sat, 19 Sep 2026 12:29:49 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uCQ-0000000GEvk-344E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:29:48 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ed1368so20866875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 05:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789820985; x=1790425785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Cz2gzGY048RFK6yaT1IK/Bb3cZA3GbpsU47/37Y+Pk=;
        b=Dv2oh4nCHk54RJsC3Xqh+zQxC1BN5ozG4Wvh7DP1e+0tfq2pPLqF+83h64P+vMv8St
         Zyx+S8ly4JdI/wAbTl0S7RPs78i7xadWL8Y2Pxmc9OsIwskjg/fbJFhcJH1pMJfg8IHE
         Lme/RlSyxZ0XeE3KL1BHY8Aaeo1YLO+GtpLSTPoxjqve+rNG84mhanwTaMrtdosJkPSv
         FNChLvb/sTFzx4WUCK+MW7D4HV/1VNQAToO9AzCB3Otqvf209kG+PDS1rRMZbipR5Cqr
         lCaMbtxSHX8PEOvob+0gKwe1fln+ApQB3OHr5Zcj4LlVVAMSEGnaNhzwCi1kGZtNngma
         YVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789820985; x=1790425785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Cz2gzGY048RFK6yaT1IK/Bb3cZA3GbpsU47/37Y+Pk=;
        b=07h500KpRjS492kSW8s5SZd+iVdIuVWjI54jyjltZ9ZGbqOy7O88w/M8y86nHMmGA7
         g9XbC0hQjZlOgXFz8W8bRIr/B7Y8kUME3S353ugGGKPqvktZU6p1T7sw9Ri/XzkVcnc3
         HlF20YrH057GLAgeZjUSOaR/AnWGs377Qnf3qCus0A+k1NHZ5DFKnEdZ+JkQYJmQXBBp
         e2KKs+iDkcifsQw2t3PdgjDOpy5W3//dxGjX/x1GYzZtu9Lo10RchLJvP3y0hgVkruoO
         JaosdnPkJI8jbCC9RyAlcRsRDIjus3lINyR98we8DW3aR2ZoFWE/faryKo1RXHwel58S
         FIJQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8kJaKuSi/q/zO2RmGc1icz5mRq81bhR20OKYOjzgCXjcxmYURd6rF7Rh1olRSubvnaDSozEK77ArlxZNAu1E6@lists.infradead.org
X-Gm-Message-State: AFuF++n5fwjRu/DzmktLp8NT/G8AvxcGFDBomfoPsP8hhgQsNIxWiqc1
	kRTrklMEmEVengeJK8A3SbtUBYohdZaCbw8C/8IkESTA5ey+Qdmpc3Ah
X-Gm-Gg: AYBFou3u6YPkGf8j21ZuA1NTrraNMPjSeyZ2fnoNl06hkylQrTMB33s1joFAwK/SD5E
	hyB3pddfn6w6nGDIy9c+94PudQGURGuPh4fft0Ggp1cqbPhHnk5tTy4L2OwZ9wI2RVuTAKqK9mX
	VWFrEGQc/LV7hIKXN+XOHidYReY+3YOo8xQkh+tPmPbpNl1eS74f2Thy1j3dfr1G3q3WfI4uKSu
	nzFn18E7u8QwVP10g4Ui0WfnsF5dJ0BKJ0MkjQrkMLP/3lg3jaqGamkKZK2PyVm/db5XQ+5aEaR
	nGLmCvczBO+0QEotrfpU2mRKkG0lgxj8+UQRPvZDa9+4HGfLHAkigKfPWd/18GD5GyNmM0OxHgi
	3W3gbcq2rzwDfJPTgIAa6u8VSIbOECXTTWitg5J9UrrYhYw2hGXHpm7h7nxuHuSPSDzkLexmyf6
	UG7nNZcnqlAEKepv52jDiAKQKx20IyPDZCEnJfejsWtfepqmqDyH6YsIxpViys/64TqG5wbcLko
	RHAIr2G3tU=
X-Received: by 2002:a17:903:1a88:b0:2d9:3850:2741 with SMTP id d9443c01a7336-2ddb16d6a6bmr103231325ad.0.1789820985169;
        Sat, 19 Sep 2026 05:29:45 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d7115sm9552155ad.66.2026.09.19.05.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:29:43 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v2 0/3] Fix poweroff restarting the board on Firefly-RK3399
Date: Sat, 19 Sep 2026 20:29:27 +0800
Message-ID: <20260919122930.1418-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_052946_766689_701BE9AD 
X-CRM114-Status: GOOD (  24.91  )
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

Still an RFC: the patched kernel has not been booted on hardware (see
Testing), and the open questions from v1 about placement and naming are
unanswered.

v1: https://lore.kernel.org/all/20260909092728.1859-1-yaozhonguwl@gmail.com/

Changes since v1, addressing the Sashiko review Lee Jones asked me to act on
--------------------------------------------------------------------------

* [Medium] "Acquiring 'power-hold' GPIOs after registering MFD child devices
  can cause probe deferral thrashing."

  Fixed, and the finding was correct. v1 claimed the array after
  devm_mfd_add_devices(), so a -EPROBE_DEFER from the GPIO provider would
  have unwound the regulators, RTC and clocks on every retry. v2 claims it
  before devm_regmap_add_irq_chip(), i.e. before anything is registered on
  the device: the property test is hoisted into a bool and reused for the
  sys-off registration further down, which is otherwise unchanged. A comment
  records why the acquisition has to stay there.

  Worth noting that this is exactly the part v1 disclosed as untested - the
  out-of-tree proxy used for the functional testing claims the GPIOs at
  module load, so it never exercises the probe path at all.

* [Low] "The commit message description violates the MFD subsystem formatting
  rules by using a lowercase letter."

  Fixed: "mfd: rk8xx: Release ...". The dt-bindings and arm64 dts subjects
  keep their own subsystems' lowercase convention.

* The binding now states that power-hold-gpios is only meaningful together
  with system-power-controller, which is what the driver implements. This is
  not expressed as a "dependencies" entry because the driver also accepts the
  deprecated rockchip,system-power-controller, and a dependency on one
  spelling would reject device trees using the other.

* checkpatch --strict alignment fix in the GPIO acquisition; no functional
  change.

The problem
-----------

On the Firefly-RK3399, "poweroff" drops the rails and immediately brings
them back up, so the board reboots instead of staying off. U-Boot reports
the result as a power-on reset.

Firefly's BSP drives two SoC pins low during shutdown, before writing the
RK808's shutdown bit: GPIO1_D0 and GPIO1_B5. Mainline does not describe
GPIO1_D0 at all, and describes GPIO1_B5 as the backlight enable GPIO,
although the vendor's own backlight node has no enable GPIO. Nothing
therefore releases either line at power-off.

What was established on the board is the sequence, not what happens inside
the PMIC: the shutdown sticks only when GPIO1_D0 goes from high to low
during power-off prepare, with GPIO1_B5 low, and the shutdown bit written
after a settle delay. Leaving GPIO1_B5 asserted makes the board come back
up even when GPIO1_D0 is released correctly, which is why the backlight
cannot keep that pin.

Why not gpio-poweroff
---------------------

gpio-poweroff drives the line active, back to inactive, then active again,
waits timeout-ms and then WARN()s on the assumption that it is itself
performing the power off, and it registers at SYS_OFF_MODE_POWER_OFF. Here
the RK808 performs the power off from its own POWER_OFF_PREPARE handler,
the lines only have to be released and left released, and there are two of
them.

rk3188-bqedison2qc.dts does drive a pwr_hold pin from gpio-poweroff, which
works there because pulling that line low is by itself enough to cut the
power. That is not the case here - driving a line low at runtime, with no
PMIC access at all, left this board running for the 10 s it was observed.

Open questions (unchanged from v1)
----------------------------------

1. Does this belong in the PMIC driver at all, rather than a small separate
   driver registering at POWER_OFF_PREPARE with a higher priority?
2. Should the property be rockchip,power-hold-gpios? The vendor DT calls
   these pins pmic,stby-gpio and pmic,hold-gpio.
3. Should the DT also carry a pinctrl group for the pins, as the vendor does?
4. Dropping the backlight enable-gpios is required for the sequence to work,
   but nobody here has the schematic to confirm that property was wrong to
   begin with.

Testing
-------

Tested on a Firefly-RK3399 (4 GB, RK808), shutdown captured on the debug
UART at 1500000 8N1. A run counts as "stayed off" only if the console
produced nothing for 150 s and there was no ICMP reply and no USB gadget
afterwards.

The patched kernel has NOT been booted: CONFIG_MFD_RK8XX is built in on the
test system and a full kernel build does not fit on it. The series compiles
(aarch64, W=1, no warnings), checkpatch --strict is clean, dt_binding_check
passes, and dtbs_check reports only the pre-existing usb2phy diagnostics for
this board, reproduced unchanged on the unpatched tree.

The functional evidence comes from an out-of-tree module using the same
gpiod array consumer name, the same GPIOD_OUT_HIGH, the same per-descriptor
gpiod_set_value_cansleep() loop and the same msleep() as this series,
against a device tree carrying exactly these properties, registered at
POWER_OFF_PREPARE with SYS_OFF_PRIO_HIGH + 1. It does not exercise the probe
path, so the v2 reordering above is not covered by it.

Every run started from a cold boot with both pins at their reset state
(inputs, low), verified by reading the GPIO registers beforehand:

  both lines, as in this series:            3 of 3 stayed off
  GPIO1_D0 only, GPIO1_B5 left low:        3 of 3 stayed off
  GPIO1_B5 only, GPIO1_D0 left low:        0 of 2 stayed off
  GPIO1_D0 released, GPIO1_B5 left high:   0 of 2 stayed off
  nothing driven (mainline today):         restarts after about 2 s

On this particular board pwm-backlight does not bind, so GPIO1_B5 stays an
input and describing GPIO1_D0 alone was enough here. That is not true in
general, which is why both lines are described and the backlight property is
dropped.

The 200 ms is the value the vendor uses; the threshold was not characterised.
The msleep() was measured at 200 to 201 ms on the console timestamps.


This series was prepared with AI assistance (Claude); the analysis and
the measurements on the board were reviewed by the author.

Yaozhong Li (3):
  dt-bindings: mfd: rk808: add board level power hold GPIOs
  mfd: rk8xx: Release the power hold GPIOs before powering off
  arm64: dts: rockchip: fix power-off on Firefly-RK3399

 .../bindings/mfd/rockchip,rk808.yaml          | 21 +++++++++
 .../boot/dts/rockchip/rk3399-firefly.dts      |  4 +-
 drivers/mfd/rk8xx-core.c                      | 47 ++++++++++++++++++-
 include/linux/mfd/rk808.h                     |  4 ++
 4 files changed, 73 insertions(+), 3 deletions(-)

-- 
2.55.0.windows.3


