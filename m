Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9A0C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 11:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DoOnZ3Y5OuCPaJSe04VL4I/hU24z8+Cw4G4Ln/A/Lw8=; b=UmeElR/XECA4gDTLmgu2g4++6i
	JizDQiiEPUlUcxumIwK2dbZfdTvx0z43yt33zlHD+T+OEa4wRYNyb0Q38YKQ90mpc68WWuV6BBDAD
	8zrxWUUQzjheUCw7Qbermxlo9IQ+/falgPF2uDkO/3g+Db3OvYSinvYIMNwV1OMYLzBkwqCGUPji1
	8Jk5oOkPZsoo+izG4luIcrbTfLGtTQ/3d4F/+O3f0z8WMkZMbzmfsxsdLlgc9wYp3wCuorFgwSM/3
	RRVGp0c5VtAFk2ddjuKPtidgOhYLW6d9GRY7XVO/I8uMSyBJBta3IFAUNg2WYrOThixhdVOEmAsns
	Rfv+2pHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZXU-00000004vwB-1ekE;
	Tue, 01 Jul 2025 11:52:40 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZSk-00000004ubI-2Bet
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:47:47 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-553cf020383so6211383e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370464; x=1751975264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DoOnZ3Y5OuCPaJSe04VL4I/hU24z8+Cw4G4Ln/A/Lw8=;
        b=Bm4mktfx0W+1d67roFPOhPiXLLO9GxgkPAMY6q0allwSr4VZqdyvAwBxIl18vyPcWt
         egxLFAmAK5UOdmY3SOaHrep5l78NwNBVgLPA57EDYrSt9get8Ta8lCLjPgBrn1+4vslE
         8cBQIvMQwVuUsbCNmNU1NJhzXzCOBL8qYFFRUb9nKnPC47nB/eA1EWYhrzxTu01fLzWH
         pQwURCuCz5UyG7fzGWixLNb0SnfHJSh+qEoL6bAdgRsy+5U8fgEQ/VLiCynJNxe4q2aN
         xnv8jLHz0TpDL7S223pmMgeFy+RSYFnUztIiTZq7Iwglk/sZny61ZXyxdvVNQWLju96j
         Btmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370464; x=1751975264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoOnZ3Y5OuCPaJSe04VL4I/hU24z8+Cw4G4Ln/A/Lw8=;
        b=aO2iq3OvUivOWfcL1o8Ilc0XpnFPPDneXjpEnNN4ay7kaQy+Y7R6LK6pzWCY3hnmSs
         ERcElpJyeWqcgQ7JFcfywYDG0FX5GAmgc44GpxB10CC/0uZ1aj2C+xTfh9rehv0hdl1R
         i/WjaidWj44iChwwGCrHmuBNQfJQHpbUHkBz35N5DtqCFBjEqTHPFrFUFOU+g73gEI0G
         ebBhFj5k34uGN4i/INsluIPRXeq9xlWdxbv8nSyyQqkYZPuoBOPSHxlSzQ3Q/atiyJDr
         +jEzsN+2IpvZ/5bhsmMdQYCiVsJIZ82vKI8J1b8Fgf4uldA4lStmJYf9uxVrH/5QGV7o
         la9g==
X-Forwarded-Encrypted: i=1; AJvYcCWKCRZ69oKjlT+cKVqiUi1oIj7m4S945klSNTJrqLOuFLA25yE9Bj7EwgKN6AkhUW7Wy5cveJGpT9G1VopW2C8q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx297AlPgvTMSHvEj8xFBKNZHX7rbHsT7qgluM+VL0DnWQ6vhHq
	As0k+ilcGF/JdFPwm9FORCW7ukRFXjE1JZacDsJF2UJAczlPHJmqXwwmPLOXWehhELQ=
X-Gm-Gg: ASbGncvG5EB+xehEE9jxHXwejoqMehUpPdpeQYWzI3suncBj/kjrldZFR3CoK7s0s+n
	sn70oBUZGvPxCp6I2JHb2EdluqJwXvm3YNRjrpOSrVnIrcQcvyW7fX25uK0NhpIWh2v2GDmHqJm
	bzVuhVYSfkIGklCVEhoE9Mbuk+RbA9gZRHlLkumkDRoZnR7Ut8C6xEwaXTQePNo9YlaL72FBrO5
	LBmGJw/tnsn7sNTnqpZQwfYGhvYn3KfFyQ6/t+gC0eov45Bob0C5YwnZk5fkZZk/+H3EcTc58Q5
	Yn//Igt/L9PwFombBNcWkIAEvnernjy+jDUpEdfmE9t6vwof1Yrg4H5w7UNn99mrU14PLm+Pdiu
	1xC0eRlNf8zilzYfO6hafps25FeINFRtypcvF
X-Google-Smtp-Source: AGHT+IFEnI8edSGqM0HnhUhPwpSZ3r1Gp9Zq3NgqwGOKGx5afReOxMS/S22NLgTkPgvFIWV29dureQ==
X-Received: by 2002:a05:6512:b86:b0:553:5429:bb87 with SMTP id 2adb3069b0e04-5550b9eedfdmr4938325e87.36.1751370464185;
        Tue, 01 Jul 2025 04:47:44 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:43 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
Date: Tue,  1 Jul 2025 13:47:02 +0200
Message-ID: <20250701114733.636510-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044746_581199_1177CB6B 
X-CRM114-Status: GOOD (  16.17  )
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

Changes in v3:
	- Added a couple of patches to adress problems on some Renesas
	platforms. Thanks Geert and Tomi for helping out!
	- Adressed a few comments from Saravanna and Konrad.
	- Added some tested-by tags.

Changes in v2:
	- Well, quite a lot as I discovered various problems when doing
	additional testing of corner-case. I suggest re-review from scratch,
	even if I decided to keep some reviewed-by tags.
	- Added patches to allow some drivers that needs to align or opt-out
	from the new common behaviour in genpd.

If a PM domain (genpd) is powered-on during boot, there is probably a good
reason for it. Therefore it's known to be a bad idea to allow such genpd to be
powered-off before all of its consumer devices have been probed. This series
intends to fix this problem.

We have been discussing these issues at LKML and at various Linux-conferences
in the past. I have therefore tried to include the people I can recall being
involved, but I may have forgotten some (my apologies), feel free to loop them
in.

I have tested this with QEMU with a bunch of local test-drivers and DT nodes.
Let me know if you want me to share this code too.

Please help review and test!
Finally, a big thanks to Saravana for all the support!

Kind regards
Ulf Hansson


Saravana Kannan (1):
  driver core: Add dev_set_drv_sync_state()

Ulf Hansson (23):
  pmdomain: renesas: rcar-sysc: Add genpd OF provider at
    postcore_initcall
  pmdomain: renesas: rmobile-sysc: Move init to postcore_initcall
  pmdomain: renesas: rcar-gen4-sysc: Move init to postcore_initcall
  pmdomain: core: Prevent registering devices before the bus
  pmdomain: core: Add a bus and a driver for genpd providers
  pmdomain: core: Add the genpd->dev to the genpd provider bus
  pmdomain: core: Export a common ->sync_state() helper for genpd
    providers
  pmdomain: core: Prepare to add the common ->sync_state() support
  soc/tegra: pmc: Opt-out from genpd's common ->sync_state() support
  cpuidle: psci: Opt-out from genpd's common ->sync_state() support
  cpuidle: riscv-sbi: Opt-out from genpd's common ->sync_state() support
  pmdomain: qcom: rpmpd: Use of_genpd_sync_state()
  pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
  firmware/pmdomain: xilinx: Move ->sync_state() support to firmware
    driver
  firmware: xilinx: Don't share zynqmp_pm_init_finalize()
  firmware: xilinx: Use of_genpd_sync_state()
  driver core: Export get_dev_from_fwnode()
  pmdomain: core: Add common ->sync_state() support for genpd providers
  pmdomain: core: Default to use of_genpd_sync_state() for genpd
    providers
  pmdomain: core: Leave powered-on genpds on until late_initcall_sync
  pmdomain: core: Leave powered-on genpds on until sync_state
  cpuidle: psci: Drop redundant sync_state support
  cpuidle: riscv-sbi: Drop redundant sync_state support

 drivers/base/core.c                         |   8 +-
 drivers/cpuidle/cpuidle-psci-domain.c       |  14 --
 drivers/cpuidle/cpuidle-riscv-sbi.c         |  14 --
 drivers/firmware/xilinx/zynqmp.c            |  18 +-
 drivers/pmdomain/core.c                     | 211 ++++++++++++++++++--
 drivers/pmdomain/qcom/rpmhpd.c              |   2 +
 drivers/pmdomain/qcom/rpmpd.c               |   2 +
 drivers/pmdomain/renesas/rcar-gen4-sysc.c   |   2 +-
 drivers/pmdomain/renesas/rcar-sysc.c        |  19 +-
 drivers/pmdomain/renesas/rmobile-sysc.c     |   3 +-
 drivers/pmdomain/xilinx/zynqmp-pm-domains.c |  16 --
 drivers/soc/tegra/pmc.c                     |  26 ++-
 include/linux/device.h                      |  13 ++
 include/linux/firmware/xlnx-zynqmp.h        |   6 -
 include/linux/pm_domain.h                   |  17 ++
 15 files changed, 291 insertions(+), 80 deletions(-)

-- 
2.43.0


