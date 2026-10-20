Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B52C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Xronu0z;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BfOxMnDa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gYTWYWvrx9uxHFEZrx64abm7PgPC6k74EmVy52A5xwI=; b=2Xronu0ztXMXJebrKxESbF7Mzq
	5TRm7CpTS/sd9QEOiXRWw3/JY+sv/RP/EO4APdkZPImQtt4o3rDtJWKNTSQqXlT/tpYhktm7xeykM
	cTGvdKNsRbHutkoTBk2Hq7mr66CCPw6md9JVxWjpqV1ueLHctP1+UzdQmOLIBQ2LnPmqWwSgxeXBY
	URJf5SzTlolL3BlbcdzsUnQXqiyNkBV17BL7VAxeqozwMgLR0jx1Bz+I17uUFP4D2Wq+oNFKvjuhY
	jmhCwRqfQfoNxPNctkqmbtpd2GAkM78MgiHDsReDowNx07fQxXH8wRexHPVz0L5pmDTxk1/0bBPMJ
	0dAMku+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAQw-00000009rvL-1xf2;
	Tue, 20 Oct 2026 14:03:18 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAQt-00000009ru9-2pFj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:03:17 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e9f6a16aedso11463005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504994; x=1793109794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gYTWYWvrx9uxHFEZrx64abm7PgPC6k74EmVy52A5xwI=;
        b=BfOxMnDazRuuY5VXfD1DEdYKoKISzu/nIQzoPsTfA79d4hzURu4lLhQQSEucP+XFIr
         pRTHJfxJ8yNBA92tskalQzh2bvrC6v866Dawm/pa5/5uOLhTKPF46AF7eKSNAVW/b1Dy
         vwbjsIqgx9qSZVSNiqrLeDulK0rYKT8c+PBZ5bS6JlYKeH6+GGguJ7gC+1tbisdSlVFs
         lM79/BIon5LSvwFwWWYDyUn71P1T1Dnwx55OQV2zje6nh15WnP3dm8tSRsK8YdpCvbzc
         lgkXayRQ36RFN9W9NRkCp1bevvr73ID+EZ8e5kHg3PQEsg1gaTHp0Qz6p2mpqfBBZOWh
         zXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504994; x=1793109794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gYTWYWvrx9uxHFEZrx64abm7PgPC6k74EmVy52A5xwI=;
        b=I3Tq0Fj4I98ceLT5SQWSZKwh/h16uVhjfnnGgrftjUiBT3XeHKwwqvEVwnGFGqedQt
         bz4O7uLdOE7sfEXiHeo3LTEssIxAbIiHErPKmNLz5tcX1nDz2ZaYAyot9AhVdxchYeW8
         1G6eleK9Vm710Yc9ukhgCTNbb8CfN0MiXxzvh9ahqJ9l6WRZGhRGYWcwmWdv/2hk3ulS
         7D7xZ70CN/JTaCqsLuG0ct4jj/ye6tqXHziReMdG/S6plUjF7+dtTZHB3iGoW0EzAElR
         ABlBTaO7No3+m/WlYaZcNQgBWPch84Xav3uAKBEWLlJXTPVKsdrtSTmmtYdgfvl80qTL
         mh8g==
X-Forwarded-Encrypted: i=1; AKwUvBw7hv/qEI1Z8pDRwWcFr8MvDUQcW9F7paKySu1985A24rr+6WvjmaAilavmuEWo3u2pI/liWceI2pk/cwD4K4oR@lists.infradead.org
X-Gm-Message-State: AFq9FYKZl4A8bsLvIwrduI0zx5P4r2Ri4jhzJjVuQK6WNO8aGwi1bSF8
	u95N4euTmDrhXyPk/k276xxR26xT3U9c+/3aQCs6EFGI/ufJ1oXXhwh+
X-Gm-Gg: AYBFou2CWaj10wpZRudXc4EUg4greblR4XqqrNYgWqZjlLimb7RKuQNAikGSnkzjEvE
	ovP4eL8iUiYvEqOl2usZyTxzvT81iVn0fYPOukckI15gU9S3izbf7LzH6sApc9MgD4w16R4KWuZ
	3mKOEDN899h+13t2e/gGeZPHsrCj/jFhWHKo5dIal1PawwSmvZumPE5BXqzUVwdD/PhEAwTZIAx
	XEiFtnYMW+7mBSxfuqEiDH4/E/14aoUDzKIr0IQmeGsoDb7Aw04n037+rdozVJaAaSr3BjwNjrF
	Ewr6AivYg4AQOngItwoSX3gkt/LQ23+Wc/5/A+WgKQb+f3q1m0Ll9GeuxGmmIw5zUJMppkRk6dI
	xgostzZgBX0X9EABQWmKECjxLkO7UrRtR1rX0cjZSPaS8SHItEpdQq65Uz0tL2F7/fFJ8t6DS16
	3Tvh1it3J7dtTnl31y5K5FY29EtT0AgET5YKnyj1Hw/CBJbXlo1Zatzf8Ub9mLUjkQjStMdmCn3
	iM0nZTmqL/01yy8QJrah7+EkjbLv0H0nBqjnkIp9EKxrtmyCBpuNIDpnNtmFogIqaXp
X-Received: by 2002:a17:902:fc87:b0:2e9:670f:d080 with SMTP id d9443c01a7336-2e9a6d28584mr100035065ad.32.1792504994035;
        Tue, 20 Oct 2026 07:03:14 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502971csm12434865ad.51.2026.10.20.07.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:03:13 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v4 0/3] Fix poweroff restarting the board on Firefly-RK3399
Date: Tue, 20 Oct 2026 22:01:11 +0800
Message-ID: <20261020140127.720-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_070315_745582_E36EC037 
X-CRM114-Status: GOOD (  28.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the Firefly-RK3399, "poweroff" drops the rails and immediately brings
them back up, so the board reboots instead of staying off. This series
describes the SoC line that has to be released before the RK808 shutdown
write, and lets the rk8xx driver release it.

v3: https://lore.kernel.org/all/20260929140649.55-1-yaozhonguwl@gmail.com/
v2: https://lore.kernel.org/all/20260919122930.1418-1-yaozhonguwl@gmail.com/
v1: https://lore.kernel.org/all/20260909092728.1859-1-yaozhonguwl@gmail.com/

Changes since v3
----------------

* No longer an RFC (Lee). v3 was one because the patched kernel had never
  been booted; the driver had only been exercised through an out-of-tree
  module doing the same calls. It now has: the board's own kernel was
  rebuilt with 2/3 applied, with one unrelated RK3588-only patch left out
  as described below, and the power-off was tested with it, including the
  GPIO claim at probe that the module could not cover. See Testing.

* 1/3 adds the properties to all seven RK8xx schemas, not just rk808
  (Sashiko). rk8xx_probe() reads them for every variant that is the system
  power controller. Each schema gets the dependency on whichever spellings
  of system-power-controller it allows: rk805, rk808, rk817 and rk818 also
  accept the deprecated rockchip,system-power-controller, rk801, rk806 and
  rk816 do not. The subject prefix is now "rk8xx".

* 1/3 also documents that the lines are released in the order listed,
  with one settle delay after the last of them.

* 3/3: the commit message now also says what happens when pwm-backlight
  is not bound (Sashiko): nothing claims GPIO1_B5 then, and on this board
  it reads low, which was tested, but that is not guaranteed in general.

The Sashiko replies are in the v3 thread. 2/3 is unchanged.

The problem
-----------

U-Boot reports the restart as a power-on reset.

Firefly's BSP drives two SoC pins low during shutdown, before writing the
RK808's shutdown bit: GPIO1_D0 and GPIO1_B5. Mainline does not describe
GPIO1_D0 at all, so nothing ever drives it.

What was established on the board is the sequence, not what happens inside
the PMIC. In the cases tested, the shutdown stuck when GPIO1_D0 went from
high to low during power-off prepare, with GPIO1_B5 low, and the shutdown
bit was written after a settle delay. It did not stick when GPIO1_D0 was
never driven, or when GPIO1_B5 was held high. With the backlight bound,
pwm-backlight's shutdown callback drives GPIO1_B5 low in device_shutdown(),
before the PMIC's handler runs, so only GPIO1_D0 needs to be described.

Prior art
---------

The vendor behaviour comes from Firefly's own change to the rk808 driver
in their BSP; it is not in Rockchip's develop-4.4 or develop-4.19 trees.
It reads two single GPIOs from the PMIC node, pmic,hold-gpio and
pmic,stby-gpio, drives both high at probe, and at power-off drives stby
low, then hold low, waits 200 ms and writes the shutdown bit. On this
board stby is GPIO1_D0 and hold is GPIO1_B5.

Its board files use one or both: both on the Firefly-RK3399 and the
RK818-based Firefly-RK3128 FirePrime, hold only on the ROC-RK3399-PC
family, stby only on a few others. That is where minItems 1 and maxItems 2
come from. None of those boards other than this one uses the new property
in mainline.

On the ROC-RK3399-PC, the vendor describes GPIO2_A6 as pmic,hold-gpio,
while mainline's rk3399-roc-pc.dtsi describes the same pin as the enable
GPIO of the vcc_sys fixed regulator. I have not checked whether that board
powers off correctly on mainline.

The vendor device tree marks stby as GPIO_ACTIVE_LOW, but the vendor driver
uses the legacy integer GPIO API, which ignores the flag, and drives the
line high at runtime. That matches the physical level measured here, so
this series describes the line as active high.

Why not gpio-poweroff
---------------------

gpio-poweroff drives the line active, back to inactive, then active again,
waits timeout-ms and then WARN()s on the assumption that it is itself
performing the power off, and it registers at SYS_OFF_MODE_POWER_OFF. Here
the RK808 performs the power off from its own POWER_OFF_PREPARE handler,
and the line only has to be released and left released before that.

Open questions
--------------

None of these block the series as it stands; I would change it if a
reviewer prefers otherwise.

1. Should such a line be modelled in the PMIC driver at all, rather than
   as a separate driver at POWER_OFF_PREPARE, or as a regulator enable as
   mainline does for the ROC-RK3399-PC? On this board the line was tested
   going low from power-off prepare, 200 ms before the PMIC write; I do not
   know whether a regulator description would achieve that.
2. Would two named properties for the vendor's two roles, hold and
   standby, be preferred over an array whose order sets the release order?
3. The vendor calls GPIO1_B5 pmic-hold and its backlight node has no enable
   GPIO, so mainline's backlight enable-gpios on that pin may be wrong.
   Without a schematic I have left it alone; the series does not depend on
   the answer on this board.

Testing
-------

Hardware: Firefly-RK3399 (4 GB, RK808).

Kernel: the board's Armbian 6.18.45 kernel, rebuilt from the same tag
and configuration and Armbian's current patch set, with 2/3 applied on
top. One Armbian patch that adds an RK3588-only IOMMU driver had to be
left out because its current version no longer builds on 6.18.45;
nothing on the RK3399 uses it. The resulting kernel package, modules
included, was installed in place of the original one. No out-of-tree
module was loaded during these runs, and the board's local power-off
workaround was disabled.

Device tree: the board's own device tree with the properties of 3/3 added,
power-hold-gpios for GPIO1_D0 and a 200 ms delay, and the backlight's
enable-gpios unchanged. pwm-backlight was bound and set to full
brightness, so it drove GPIO1_B5 high while the system ran.

Before each run a script checked, from /sys/kernel/debug/gpio, that
GPIO1_B5 was owned by the backlight and driven high, and that GPIO1_D0 was
claimed by the rk808 driver with the consumer name "power-hold" and driven
high when the property was present, and unclaimed when it was not:

  same kernel, power-hold-gpios absent:   restarted after 41 s
  same kernel, GPIO1_D0 described:        3 of 3 stayed off

"Stayed off" means the board did not come back on the network within
5 minutes and its fan and LEDs were seen off; this caught the control
run's restart. The serial console was not available. In addition, on
each following power-up the RK808 RTC had been reset (this board has no
RTC backup cell), which corroborates that the PMIC had lost power.

Build and schema, against a clean mainline tree (28924df2a):
drivers/mfd/rk8xx-core.o builds with W=1 and no warnings, and
dt_binding_check is clean for all seven schemas. dtbs_check for
rk3399-firefly reports no PMIC diagnostics. For each schema, a device
tree with power-hold-gpios but no system-power-controller is rejected:
using an in-tree board for rk805, rk806, rk808, rk817 and rk818, and the
schema's own example for rk801 and rk816, which have no in-tree users.
checkpatch is clean apart from an unknown-commit-id warning for the
Fixes: tag, caused by the shallow clone; the commit exists upstream.

The 200 ms is the value the vendor uses; the threshold was not
characterised.

This series was prepared with the help of LLM-based assistants (Claude
Code, cross-reviewed with OpenAI Codex): the analysis, the code and the
text were drafted with them. The measurements were taken on my board, and
I have reviewed the result.

Yaozhong Li (3):
  dt-bindings: mfd: rk8xx: add board level power hold GPIOs
  mfd: rk8xx: Release the power hold GPIOs before powering off
  arm64: dts: rockchip: fix power-off on Firefly-RK3399

 .../bindings/mfd/rockchip,rk801.yaml          | 23 +++++++++
 .../bindings/mfd/rockchip,rk805.yaml          | 29 +++++++++++
 .../bindings/mfd/rockchip,rk806.yaml          | 23 +++++++++
 .../bindings/mfd/rockchip,rk808.yaml          | 29 +++++++++++
 .../bindings/mfd/rockchip,rk816.yaml          | 23 +++++++++
 .../bindings/mfd/rockchip,rk817.yaml          | 29 +++++++++++
 .../bindings/mfd/rockchip,rk818.yaml          | 29 +++++++++++
 .../boot/dts/rockchip/rk3399-firefly.dts      |  2 +
 drivers/mfd/rk8xx-core.c                      | 49 ++++++++++++++++++-
 include/linux/mfd/rk808.h                     |  3 ++
 10 files changed, 237 insertions(+), 2 deletions(-)


base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.55.0.windows.3


