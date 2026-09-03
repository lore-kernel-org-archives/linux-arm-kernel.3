Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768DCC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cfbXs+O7gl4kgXTDO65gSIX2ToO03QaBPpDK6T1ajt8=; b=EbKmwsiu6PEWfisIgjvblLwt+t
	OmuO6xDT+tqIHJepuacDeJOEQJsexQqras+HKN2bUTwWKtMKFDXpfg2ZxBaFhPvLK2ZXMbtj+yICu
	/7kGgNtz/DkawhzWczHw6umqLUbfmhdamBRzuP1z3hCXAsyY+163ov1kfTUbQ31hHByr11Bb2E1Gq
	w6W3UbrpPY9vBAShH2Jgot3G2HSvo74U2IeWdgii4/6GwgMFvPHmEnstVo9qD6kMXFA/ki9H7eo7x
	CUaa6aIV1xXBrkJfhywMzNJ3OBalxZ+KaND/uFmjV4DnO1A3t6omUli23AZ/Mk20Enx5xeef6BRsn
	vvJ/ARtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29Wi-000000001k6-0hSV;
	Thu, 03 Sep 2026 15:38:56 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29Wg-000000001iu-07C3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 15:38:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-482fc3327fdso1658282f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788449931; x=1789054731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cfbXs+O7gl4kgXTDO65gSIX2ToO03QaBPpDK6T1ajt8=;
        b=aPahXrDqMwPQjFbJNPYXZOS/G/fspR2zRPKCL7u0dZkNU56Ppqv/KQsoMNmgUUzYcm
         XfgXY8Q4On/x+es6QUJliw6DxOPerxuitqUA/Kq/aLvTAJ23VC3sg1TwLmyzj/Qz3Jf1
         nGeYV9IK9PN+Qo3KfiVcp9MHNMoho7+TEpH4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449931; x=1789054731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cfbXs+O7gl4kgXTDO65gSIX2ToO03QaBPpDK6T1ajt8=;
        b=XXa5A+YwttjO6VpKjOwg4v8FHEIt1LXtSrQ6n7NN2eVOPk8kf4fw/BqM7GZvAOKugU
         fNeitiVtaozhPToiXeLbujSuz4Ox101VthfaB/C0yPHQ4S2O7yQQKCBd8FldKTEXv+39
         J1jjnSnNXwoyl2pMTRrEMkPtLsH03GWSntxxSTqXcSqIdwymv+SQurkcmYSQClsrwD/c
         XYY7/1tkAp87+cmmVRafpANPUfg0HHpK2dR/4fDgPJTI9+oF4X6Ds8h6JXEQWYNdWqP7
         x+rNYq00XBB+hCwH4C+ljQJmePuQ5xSRt7QU/BAbGP4EnYrbwKKpXrfOXVpiZ18txrk6
         HkFg==
X-Forwarded-Encrypted: i=1; AKwUvBxC8s4kuhsu1halsx5o3xMfTmnqLLzmE5HABp5rfKG2JQPiy2kw5JvyxTwcAkpt1uPZ7F8dbN+rFNToHT7fDZ7M@lists.infradead.org
X-Gm-Message-State: AFuF++mtc1EeLOSV38k8Sy5CO10yIpFwWdtgunTNXJoZanwFlFIZse3Z
	/V1h4p7qxWXuT+LrxSBRR+NMokvChhzjohnWuYNrRU0DoTyagEua8Y4LvrotQT0rkJQ=
X-Gm-Gg: AYBFou1ndx6c4SQp1ljeHROgo9JQrfqlAd8yXSh83bhtarVZtMB6NDrz/sqxQTmpPNx
	Wmc2QuyFCywQeyEtJ1wCFX8Uvor9tgFaVkHICwBR+c/zM+AIXoB1O04MdofjinIW1kWRUxEp/MK
	v8wMEqFUhtjyW1awCKYVbpJutEUWv/HFJKPgGRyAEGrbOmRRvX64SYltncGyr96JnhzlTDTh2Sx
	Ej+DzXRx6YLoAXW30IzVrxdih761w+WzQqQWtdVIeWatoap6CVlB0F+bDWZqh+dR2wlpb7xifOm
	EqpQyUcEtkWU/oc/SH2Z66rxan8x9dJOjFjXOjVr7Ppu2vhfcAAFtAqAnxs2AF4Yl2JmvVzLMCL
	FCeVXrfpDFbQ0qCGX5adRDGgs20g6zz3KPkynsmr/aPR6BHYPvvC/wmd31iFCwWCybicC/6TwrO
	eHBn41+RiiQSXDgYU3fP9GfVac9DEVsCD/BBIQN+A3QsZy25iPSxay2Lf5gkOTCQXsZVa7g9yG+
	itML5eoUuUpE755GpVWxp6bKWeG4Y7YavBlTZSzTh4YfQPY8puD44Jv1ltvv5hJM2eq/0F6haZY
	qlcEfJ81FBgoUHIwYszDJ2MojK39ENmJuq3iDclqm1xBtHBGhXsKnQQ=
X-Received: by 2002:adf:f643:0:b0:482:e1b0:8a1a with SMTP id ffacd0b85a97d-485860bfd21mr1751594f8f.15.1788449931024;
        Thu, 03 Sep 2026 08:38:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72df2sm15366301f8f.1.2026.09.03.08.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v13 0/4] Support spread spectrum clocking for i.MX8M PLLs
Date: Thu,  3 Sep 2026 17:32:12 +0200
Message-ID: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_083854_096302_C5A0B359 
X-CRM114-Status: GOOD (  19.97  )
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

The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
boards using i.MX8MN and i.MX8MP.

While at it, it validates the spread spectrum configuration in the clk
core before it reaches the providers, and fixes the i.MX SCMI OEM
extension, which converted the spread to the wrong unit.

Changes in v13:
 - Add patch "clk: scmi: reject SSC configuration out of the OEM field
   range".
 - Rename patch "clk: scmi: fix SSC permyriad conversion" to "clk: scmi:
   fix SSC spread conversion".

Changes in v12:
 - Add patch "clk: scmi: fix SSC permyriad conversion" to fix the
   permyriad to percent conversion in clk-scmi-oem.c, reported by
   Sashiko AI review.
 - Fix issues claimed by Sashiko for patch "clk: imx: pll14xx: support
   spread spectrum clock". See the details in the patch changelog.

Changes in v11:
 - Add patch "clk: validate spread spectrum configuration" to reject
   invalid parameters in the clk core before they reach the providers.
 - Fix issues claimed by Sashiko for patch "clk: imx: pll14xx: support
   spread spectrum clock". See the details in the patch changelog.
 
Changes in v10:
- Drop patches 1-22, superseded by the generic spread spectrum clocking
  support from Peng Fan, merged in 7.3, so the i.MX8M specific infrastructure
  is no longer needed. This patch is now based on the following commits:
  - ae794aa6e88d ("dt-bindings: clock: Add spread spectrum definition")
  - c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
  - a7f16660af39 ("clk: conf: Support assigned-clock-sscs")
  - 7d98de6ffdab ("clk: Add KUnit tests for assigned-clock-sscs")
  https://lore.kernel.org/all/20260826165611.236321-1-sboyd@kernel.org/

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (4):
  clk: scmi: fix SSC spread conversion
  clk: scmi: reject SSC configuration out of the OEM field range
  clk: validate spread spectrum configuration
  clk: imx: pll14xx: support spread spectrum clock generation

 drivers/clk/clk-scmi-oem.c             | 17 ++++-
 drivers/clk/clk.c                      | 14 ++++
 drivers/clk/clk_test.c                 | 12 ++--
 drivers/clk/imx/clk-pll14xx.c          | 99 ++++++++++++++++++++++++++
 drivers/clk/kunit_clk_assigned_rates.h |  4 +-
 5 files changed, 136 insertions(+), 10 deletions(-)

---
base-commit: 940de590b839f71d6dc846160534bf202401b8b7
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0


