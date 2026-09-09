Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F8FC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sSBbj47812SaQ+jAqx/rEDA44UrUN84Iomtwdt6boBo=; b=KRXyyKbFgrof2NNIJ1BCfM4OwQ
	UMqN+LbQXOebvQ86PNxJBHyqAuCd4JjcJ8GjHWLKsLdGveK/xylgjXc6VAYrkRGNqxpMTz0lG/jK5
	E4wrE5fBswLyn9w4Gbhb5GXy4JKrnIN3FzsBniz2JM93SYiWz+eixO/Mx95YPw9N4cM+8uFenf5Jq
	BZenZ7i0QJDJUVWeOdLt1Gn+khla8wjnSSqw/+DZUyXVmm2fX9be/NTciuWxPXfiF/CqNW7pgk+kU
	t9iPXZbr9pN81kC6xP/CrdwGN6El4pzaocsNFtjsSH+ilrJq//RhzRgsiRWbGusoZ0AZF+rrCb3zr
	bRHdeLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Eb4-0000000BHji-3YSs;
	Wed, 09 Sep 2026 09:28:03 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Eaz-0000000BHi6-3Yds
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:27:59 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-85377c8bc96so5183189b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 02:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946076; x=1789550876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSBbj47812SaQ+jAqx/rEDA44UrUN84Iomtwdt6boBo=;
        b=MM9yD7/gdl6//0qRXQ5qLErHNMcA6iQU7iu8Mk9WIk17M+wImSUYEWzYBwYC+g6/+v
         XYC3gnB6fIs3mfU8jLfxt7niwW/zTVnIwuKqD/upb+vl4e2rAleOhD+i+JUYuj8w+IdQ
         DHYh0BTZn1Qmdr3jtIym17+8nCQHIWjirM3S2EAEXAEL8ZOfGGiTaM2Y8G2vrmYDffOs
         iTe+4nBbxn2Qz9ju1BmxN9zaIAc2olf2uGt6j+XprHJV3flEk1S2doZQglrLE4p+lMoo
         kwBLMI1iICsFKm223b64lC70BrhZtZOIhH+2iwo9yEsUBsK5YxJsYsP0eBlRDOW80KGt
         C2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946076; x=1789550876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSBbj47812SaQ+jAqx/rEDA44UrUN84Iomtwdt6boBo=;
        b=OxKf567lRM1hB9xFjdkE7vY4PB37rtduq+efn5jU3x7yb368Rf8ZoL9Ul9ZqkreXbr
         IjoU7eKT701CfxyPXkdxjCa+8PX4GrAXexfkbqfeZuGyV6E3aRusZ2BzQ4L19dh4LKk8
         V0mtU4XZ/ZjkIruidN7PJFLLLBsobYjsKtCjbVqj+wB26Eu14GK6VbtG0melHJqPafvk
         YVnMyFEk2OuDRbXjCcrLxb16NcZu9l49KgNPx9rH+Xp83GB3ZgoM0pOowHy/Cyk5Cunp
         3sZ+Fn1B1mtKpBSXZMUNbREJ7mgkf8o3yZXw1lALPgYpXwtDFvkZwXQvV2lGROoqyrTI
         RJvA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ4UB8a3bLRTzWsc/ZPPJN/lNnn3DSlsrSM6ORLT9y0EYCAMUfN1l7HJMNGttjhFU0sLAI3yeyxVO5UpCDMA17@lists.infradead.org
X-Gm-Message-State: AFuF++nyRJaAePdD7/jus5OKBWfOTlHxkLnxgTqFqJA8RYIe25dxkRr+
	VGotkfHx6ZiOzhM8LgoDEgchA3cheOqPuA7zrb2g+8KEfdjqYJ9MGbp1geVk4QYp1etv6w==
X-Gm-Gg: AYBFou1uWB5xh/yx64M548Thlrt030i5r0XlBrER+giXJ8eQKUtAoIa1Zj2YPiZA+CB
	qQD7PW1zvgLffNX4fmARFH1nuwhRdYl944VYvd682fhiVTzWVzoRnNAU/ea0qqxZITIE+9SCaqk
	sqXIxASN178THYTbn4DQAlRkCqLakNLP5/2/S6H0tul5p/Kyn4DAJZo6NIcKk0Ii2c22qlWy9mT
	WoYlIHQnb46LpIoMNSBGUDai+wEii4VPuQ/6pJfn/hjIVKLiXXoc6/FIAUxHRm2HvhdOW1GlVSi
	a5k0ICrhgCMW9MN/WbdsqmZS4tCmZq8Mi9WRgMIJZqzSjVZzgQ8KXpfq94yhb65CIzRdPcehyXg
	mE2oHcAFaiZKQYTLBRd1/piHPE5Z2OXcSivQsILzbuciJG+us4vtTZw0zc6+Gdj67hDrjML0gym
	eNU3XfwKGGew/xmkAxOKBvEOi8YZ25In5LjBAa4s/CkOOOaHMNdOISlssgKCOHp5tf1Wy/h6x0I
	beVGqT9Hjgk
X-Received: by 2002:a05:6a00:398a:b0:857:72f8:dc94 with SMTP id d2e1a72fcca58-8616947c104mr46288815b3a.21.1788946076251;
        Wed, 09 Sep 2026 02:27:56 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm484904b3a.22.2026.09.09.02.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:27:55 -0700 (PDT)
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
Subject: [RFC PATCH 0/3] Fix poweroff restarting the board on Firefly-RK3399
Date: Wed,  9 Sep 2026 17:27:25 +0800
Message-ID: <20260909092728.1859-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_022757_912517_0B790170 
X-CRM114-Status: GOOD (  23.96  )
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

Sent as an RFC: the open questions below are about where this belongs and
what the property should be called, and the patched kernel itself has not
been booted on hardware yet (see Testing).

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
cannot keep that pin. Why the board powers back up in the failing cases is
not explained here.

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
power: the board is gone during the first active-delay-ms and the rest of
the sequence never runs. That is not the case here - driving a line low at
runtime, with no PMIC access at all, left this board running for the 10 s
it was observed.

Open questions
--------------

1. Does this belong in the PMIC driver? Releasing the lines inside
   rk808_power_off() keeps the ordering against the I2C write explicit and
   needs no second handler, but it does put board level wiring into the
   PMIC MFD driver. A separate driver registering at POWER_OFF_PREPARE
   with a higher priority would work too.

2. Property naming. power-hold-gpios follows the <function>-gpios
   convention, like the existing dvs-gpios in this binding. If the binding
   should describe Rockchip specific board wiring rather than an RK8xx
   feature, rockchip,power-hold-gpios would be more appropriate. The
   vendor DT calls these pins pmic,stby-gpio and pmic,hold-gpio.

3. Should the DT also carry a pinctrl group for the pins, as the vendor DT
   does? It works here without one, so nothing untested was added.

4. Dropping the backlight enable-gpios is required for the sequence to
   work, but it also means the backlight loses an enable GPIO it may
   genuinely have wanted. The vendor's backlight node has none and is
   disabled entirely, which suggests the mainline property was a mistake,
   but nobody here has the schematic to confirm it.

Testing
-------

Tested on a Firefly-RK3399 (4 GB, RK808) with the shutdown captured on the
debug UART at 1500000 8N1. A run counts as "stayed off" only if the
console produced nothing for 150 s and there was no ICMP reply and no USB
gadget afterwards; a restart is unambiguous because "DDR Version" and
"Reset cause: POR" appear on the console within seconds.

The patched kernel has NOT been booted: CONFIG_MFD_RK8XX is built in on
the test system and a full kernel build did not fit on it. The series
compiles (aarch64, W=1, no warnings). dt_binding_check passes; dtbs_check
reports only the pre-existing usb2phy diagnostics for this board,
reproduced unchanged on the unpatched tree. The functional evidence comes
from an out-of-tree module using the same gpiod array consumer name, the
same GPIOD_OUT_HIGH, the same per-descriptor gpiod_set_value_cansleep()
loop and the same msleep() as this series, against a device tree carrying
exactly these properties. It registers at POWER_OFF_PREPARE with
SYS_OFF_PRIO_HIGH + 1, immediately ahead of the RK808 handler. It does not
reproduce the RK808 acquiring the array at probe time.

Every run started from a cold boot with both pins at their reset state
(inputs, low), verified by reading the GPIO registers beforehand:

  both lines, as in this series:            3 of 3 stayed off
  GPIO1_D0 only, GPIO1_B5 left low:        3 of 3 stayed off
  GPIO1_B5 only, GPIO1_D0 left low:        0 of 2 stayed off
  GPIO1_D0 released, GPIO1_B5 left high:   0 of 2 stayed off
  nothing driven (mainline today):         restarts after about 2 s

Note the second and third rows: on this particular board pwm-backlight
does not bind, so GPIO1_B5 stays an input and describing GPIO1_D0 alone
was enough here. That is not true in general, which is why both lines are
described and the backlight property is dropped.

The 200 ms is the value the vendor uses; the threshold was not
characterised. The gpiod calls and msleep() run in POWER_OFF_PREPARE,
which is allowed to sleep - the msleep() was measured at 200 to 201 ms on
the console timestamps.

One early run appeared to show GPIO1_B5 alone was sufficient. It had
reached that state through a warm reboot rather than a cold boot, so the
pin states were not what they were assumed to be; it is excluded, and it
is not fully explained by the description above either.


This series was prepared with AI assistance (Claude); the analysis and
the measurements on the board were reviewed by the author.

Yaozhong Li (3):
  dt-bindings: mfd: rk808: add board level power hold GPIOs
  mfd: rk8xx: release the power hold GPIOs before powering off
  arm64: dts: rockchip: fix power-off on Firefly-RK3399

 .../bindings/mfd/rockchip,rk808.yaml          | 20 +++++++++++++
 .../boot/dts/rockchip/rk3399-firefly.dts      |  4 ++-
 drivers/mfd/rk8xx-core.c                      | 29 +++++++++++++++++++
 include/linux/mfd/rk808.h                     |  4 +++
 4 files changed, 56 insertions(+), 1 deletion(-)

-- 
2.55.0.windows.3


