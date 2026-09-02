Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9C0C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pJqwdWZe9Hp0I5xyr2vQgi9tkUCIeJggyV1DIcC1SHo=; b=JI95XPPEaEeSj8/nUmlw3ooFAs
	2IQDP1YUuzX41GLIxXZWMyaVMoJf/SNDBIIUcJ8hSxRIRytk7+3UeO3yvHEg/IXN6RebSFhgXC3jT
	HRcOqK38SrQ5FgWG2q5HuaeLpvk68zuaEtT8L0wxHsrjocCrNUdi4HJJAXgvi3UIBKhwjfB3MAaNd
	t+gUr6RfiC8nI46pVRKa+sKir/sfXjj7OBUfGgBc/P8wydHl8tR0ma9ZO0FcAwZM9/lGw6dZ68Fxe
	b1dYwsKAqNvDkiTVWkPrXPcgDPnNPW6XZjTs4Gs2jPuDGj5TbdCJE19asaf6oZA+JfqWS23S/VBw0
	G0pKwyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1i0F-0000000EJwo-0sch;
	Wed, 02 Sep 2026 10:15:35 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1i0C-0000000EJwT-2TYr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:15:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-482fc3327fdso614996f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788344130; x=1788948930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJqwdWZe9Hp0I5xyr2vQgi9tkUCIeJggyV1DIcC1SHo=;
        b=R63fYF8PaO3XgQkE46BVXd4IEMWZbVSJLuHGCYR0Mb/Qr8ed+y6XhDwrF8SWwcdQcV
         kzyKYfW3uiQPhY9ePMPo9D1mWkYd5kLkvk4+w9dnlCQwsAldqyWeun10Wwb9lryB7lBO
         J05xJWvVtEQ77LXx47JxCMWrwVIJBRfTOuerM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344130; x=1788948930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJqwdWZe9Hp0I5xyr2vQgi9tkUCIeJggyV1DIcC1SHo=;
        b=g8d+ibI2Zflv/BZDeudb0SCtgVOfrQVsY/lFikwHJ5hTVCf/3EP2xwkh8F2mL1xrqh
         3iAFIWrTuCoMML6UhGy3F3klTFio0OHKH57vTvuoi9tIu0qwwIXLY2A8s/VXsNmfJh2G
         i92LO26uybjondS+Txt3pM0c3j67WnHLAcAgNI2OQdz+HjgNhZrAWcUFcryA+As8JU5o
         W/0Oli9BxU1pvcwaQEz5BI8L+AqxkUmPqvh/S5s1z9B7KWbA5OyGk11gYfWpf/gT1RMA
         d88C4YZlx02cdCOiIjNCLLwBcDJ2n8QXIaTeHOJWZN+dl9BimO4j2ioyuiCGfsg0WP/Q
         x2SA==
X-Forwarded-Encrypted: i=1; AHgh+RqMKoHtyBu3/rhNQ0FVEJgqswraEY1BgpzJmaiw7vANn5WjukPaq+pkUM3bP+/e3e1EZTCC2PBrg2WNqpp/1KAe@lists.infradead.org
X-Gm-Message-State: AFuF++kXhgcuRpHqJM8XkAldnngThRYmTsyM2EEjsaS0ZhvtNsPa65fA
	VYXkDrN0E2sHp2cjGtj69/qMQCTOTMxp602E+80dcsC/qX2t1DxDSE8r2M7YFDiiCxw=
X-Gm-Gg: AR+sD12sGRuaONn0vjSoTC60FO7ehG8ZuHxKyy7DcV3UTjxhjII8fnR7wMuWYcsP4mk
	cnQCcUHFTKfTMMdabcVVlYl5mNulrFQXYGeZFMaaUK8ACYKEG2EF84m/5OQhW3RCYvWTo1+Fdzo
	0LrTjbKkDE+Mwp5Oyegra/Ric4KGprFxC9XLa6sUJVlxKShISGGa5lofh5x9XPCF2UEKgSlIUwz
	rm/GB1mMdsnXu3+AfWmSEW0+cGoj2s1HxeftMzOsMR/q83d3i9lI95vdxq7LMZVnIMfnrYTNkEK
	3/w9Za6wxf12bqla3wWoIXUrGnQ/fyhGO/JD9A4/lgklGphURAsAurCLXgl6sRnqv5a0dTR25WX
	X0K+FWyjzZdHCUcBJ/BarXIlwYUPfhvAFyZ0x9CNFmb8SuyfmdCOutWPDqdsPcMmDWeFNZflv97
	Fia1AClHX902deRVdfRFFjQfh3DiSNHx+NYpiAbQ54zPBHEFoQN+dQHwyPoQEHSheoeYXZvY5hs
	IX3gBJZMgANqkRCHXUnjQ+VT/uWko+LEXylQrZj03pbpvAVD0wIjVwB/AfM4uHQ5mC+zv5oht4G
	41tYNSpOKmXR4/bcyFTfJf0QhGbkaACnHwjuetNaokttLy1l7cR2tKg37SJu
X-Received: by 2002:a05:600c:6208:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49ce57f7113mr70770465e9.8.1788344129574;
        Wed, 02 Sep 2026 03:15:29 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm139618475e9.12.2026.09.02.03.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:15:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v12 0/3] Support spread spectrum clocking for i.MX8M PLLs
Date: Wed,  2 Sep 2026 12:07:32 +0200
Message-ID: <20260902101515.167819-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_031532_665388_72EA4FB0 
X-CRM114-Status: GOOD (  18.77  )
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

Dario Binacchi (3):
  clk: scmi: fix SSC permyriad conversion
  clk: validate spread spectrum configuration
  clk: imx: pll14xx: support spread spectrum clock generation

 drivers/clk/clk-scmi-oem.c    |  2 +-
 drivers/clk/clk.c             | 14 +++++
 drivers/clk/imx/clk-pll14xx.c | 99 +++++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+), 1 deletion(-)

---
base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0


