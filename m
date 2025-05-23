Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC88CC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o8UsG0Cv+W+SbA3fwsKYtIRZq6NFodm959GZlb0m+LI=; b=gW/MSnAmn7roFc+ToCGb2Akxm2
	KgoIpkDqi8S7d6P79jo2qRBPi3IRH9Tc39okLMa+nyZoUaxterK66eg/ZTq17AXSRFk+GiL3E3Ouw
	JmSZ5j8XolM99uW4m4zoGAWiyhMExP0HrLBL35UEW2vaeEzp/FNmPSkWhz/nfGLQxTDqq2tnHAWOt
	gWcPTu2GC7W9YMuzy/c1TcdPeBMVnA0yuv5cciHizHKboNjOia1gqwd0pFPF25OHCjadkk9Qcy8Tm
	0QteRW6ab5w0jtUwhTuEyw+WY9jmqRPne5d38NdjtTnwCk0hs0GgGMSIJjtjfIPJ6eBD2cmoHkJFI
	mNr8l2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbC-000000045dA-0aCm;
	Fri, 23 May 2025 14:42:14 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISdc-00000003zGw-03WN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:40:41 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-550edba125bso7882910e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007638; x=1748612438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o8UsG0Cv+W+SbA3fwsKYtIRZq6NFodm959GZlb0m+LI=;
        b=C47Dc8FDInaoqPQtdgIR1YqStj/BX611DoAsSPYMY1wBy+CaQm2dsRP7g3K5p1XFyt
         I/onXud75+cSM801f6bBm8POLuBYLyZshaYcS05dkJDf+qWpywLtbfiKj/IYW4zqmecr
         qb5pNMauA9nIWxaWkHPlMzwRrKoxwa0E8nMKY+7fyrQQr28klf/pNBQJIf4SOdsv6XIj
         1MduBAiG9Jn3nCczHzFyN+j4f2JA5NxjIadX8mtSWubGf4TBFrg+plfrChifPe5j2/nO
         WHGWVjsSbIUgwTD2s1MDNN4DP2Fuz/gKSh+314o/5wgY7s+spbOVUYIf3MzCa1R+R3LB
         CJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007638; x=1748612438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8UsG0Cv+W+SbA3fwsKYtIRZq6NFodm959GZlb0m+LI=;
        b=OOLgJJO+HSlBIxuhzmbHjXgWvGSx5G93veGRMwSdATykw3Ib4cXWNfmsUdKL2VEam1
         f7QOk69kwYPQu7sMtxc4/qDZC9kof72bjG5n07aMkl5x78ekF0IqXB4qudgjzXiSv1b3
         HmvlKxuazl1Bzu41L0HttBVAydCcdZEAu576hema/DWGUtKc+KRdBAWH9nFb+ecc/Z8q
         z+XS9lh+JrY2w2/JN/RJBbJFRlgQ9bgROhyLSP8BVNOoLFVrWLIJBYtBnPtNJxQL34mE
         tmQB6U2d1UFy5P2AbE9fvbZNPqSks9qTt1ZgwDsdqENhqHPK5DP6bsnHJY95q2sYW25H
         5duw==
X-Forwarded-Encrypted: i=1; AJvYcCXBVCbVE6egxj78UAn1W24hL71lkDCPtonWW7fxlZA1chrkFom09mmw6lVZRYez82AIV5u1uhRn2CL2ws86Gh/f@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe2y3f363B3dQpHYeP9366gTp1iDrA5rS7vw0esj+c0kI383g4
	EYo/9Rrs8JnVdMQqyhsC2lo8FoGE2Ep86jqwmwYXeyvFA44NUMNMO56/kunTlgbqnNk=
X-Gm-Gg: ASbGnctWrU09RlDgEr3PR8/WSCygby45jJccWsGsltFimfqqSJe91j0nxtz2YuiApsi
	z2cqbIBEQArFA/6QHCVSheuyhtDoVxh8kV6ABRqMoZ3cNVoX/kiSBvNmLU2tT61zB1b0e8cQlHY
	YYVCcD0RRXUMRTqs4rbtecuZWguHS+9AFoGTwH80WqjYcnEDIPHK0P5z6AzMuc626nrg1CmsnC5
	9+UoGLm0aXiDCuTPhjalT/PHI8On4vTGtJmTtSDIbFyL8ytVKDh5RzGNkMoB/AmLyUHkr4wE2fZ
	k5BGN0Iyw56m6ArNdclgpk3ar83Lpw8V9TJjq4ZeOdiyP2hCRkU3GxaVejpKkUB0ffa/3ufBhgq
	AuEizWVjC1TUSewJhvrU9sF/ynA==
X-Google-Smtp-Source: AGHT+IHnygsP+tGAk04VZnCfGgEIdN8EfQ0ZCgQ471fg+idaH3A0yfEu5eg6xgFw+xqxxde3XVbpbQ==
X-Received: by 2002:a05:6512:6081:b0:545:6fa:bf5f with SMTP id 2adb3069b0e04-550e7195284mr7962698e87.2.1748007637808;
        Fri, 23 May 2025 06:40:37 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:37 -0700 (PDT)
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/21] pmdomain: Add generic ->sync_state() support to genpd
Date: Fri, 23 May 2025 15:39:57 +0200
Message-ID: <20250523134025.75130-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064040_072137_E8C69272 
X-CRM114-Status: GOOD (  14.21  )
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

Ulf Hansson (20):
  pmdomain: core: Use of_fwnode_handle()
  pmdomain: core: Add a bus and a driver for genpd providers
  pmdomain: core: Add the genpd->dev to the genpd provider bus
  pmdomain: core: Export a common ->sync_state() helper for genpd
    providers
  pmdomain: core: Prepare to add the common ->sync_state() support
  soc/tegra: pmc: Opt-out from genpd's common ->sync_state() support
  cpuidle: psci: Opt-out from genpd's common ->sync_state() support
  cpuidle: riscv-sbi: Opt-out from genpd's common ->sync_state() support
  pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
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
 drivers/pmdomain/core.c                     | 239 ++++++++++++++++++--
 drivers/pmdomain/qcom/rpmhpd.c              |   2 +
 drivers/pmdomain/qcom/rpmpd.c               |   2 +
 drivers/pmdomain/xilinx/zynqmp-pm-domains.c |  16 --
 drivers/soc/tegra/pmc.c                     |  26 ++-
 include/linux/device.h                      |  13 ++
 include/linux/firmware/xlnx-zynqmp.h        |   6 -
 include/linux/pm_domain.h                   |  17 ++
 12 files changed, 294 insertions(+), 81 deletions(-)

-- 
2.43.0


