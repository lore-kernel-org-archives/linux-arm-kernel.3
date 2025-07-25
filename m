Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFB0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 10:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PYnqcVVV69CVw0ZAGi9Wfq5n5crV4yuPfvvOZOobyKI=; b=bsAW6gt0lmgJO9
	dMoRkUBrTkAthcq1DH+hRYLURstoM5B1f2Di56aK87kYV6QmrB7+arLHfr0qTSXxsg2DQ4y/1/hNh
	mvTYzk2y7bVf/Q/3wvbJj0o/JzRltKMbA71gQEd1f6TgNVhCsyBEBbuRnZ/53rgi526D6unqqoQgd
	s2G32KvMVY+O5pZU0s0P9hMyfJl//SzYVV1J9fS1D136UWudBnTcrWvZvo51fLSU2wChpVFJ2kqEz
	BYg2amq2oay6fz5HqAOSjuKYPXDhlaQNL+jppAJNdQTrpjsikBsz7heNHfBzBBva+x9jMY+57FBud
	SPFe1ubokVmjMFzVsFeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFRm-00000009YVG-2T17;
	Fri, 25 Jul 2025 10:14:38 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFKS-00000009WiO-43mL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:07:06 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9Zt5N004176;
	Fri, 25 Jul 2025 12:06:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=PYnqcVVV69CVw0ZAGi9Wfq
	5n5crV4yuPfvvOZOobyKI=; b=bHFTrC2ofFRvQnGbH8UfdLQ94SD8icVrC7ugpI
	47kevTHihohx3j+98VG3SD1hg0EmEKydoYi/96oszfXLzY9qsLpoWEash1rL+AL+
	4GAiFDSPD5QbQ4WEz4rQVZ0iIOkl9nKhtyK64OC5HQJ3l/uhqrIU+asIDoHjaUbw
	nvQohT+lb6vf1DBNst3ma7fhWxbiZ9r08zC2Xiw0HMRE6/6ci3CHfOPKa9B2KKgy
	psZnHQWWLLpBjXD6BNnLCWJwQhSFt42PV6Of510NuK9NuFiDLuExY5YK0UZQoAWn
	tTJqXQHjsYrAegnsaY2rYJUVg73FGkahjtaOX40KK7fLD9Mw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 483w3m2hbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 12:06:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CF1DF40047;
	Fri, 25 Jul 2025 12:05:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC8067A1770;
	Fri, 25 Jul 2025 12:04:25 +0200 (CEST)
Received: from localhost (10.252.19.90) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 12:04:25 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: [PATCH 00/12] Enable display support for STM32MP25
Date: Fri, 25 Jul 2025 12:03:52 +0200
Message-ID: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIhWg2gC/x3MQQqAIBBA0avErBvQMIOuEi3ExpqFFmOEEN49a
 fkW/7+QSZgyzN0LQg9nPlOD7jvwh0s7IW/NMKhhVFZPuEnEyNljonKjccEo67U3Y4DWXEKBy/9
 b1lo/9H1yOl8AAAA=
X-Change-ID: 20250617-drm-misc-next-4af406c1c45f
To: Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.19.90]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_030705_298785_4C2216C3 
X-CRM114-Status: GOOD (  14.71  )
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

This series aims to add and enable sufficient LVDS display support for
STM32MP257F-EV1 board.

LVDS is the default use case to drive a display panel on STM32MP257F-EV,
even though DSI panels will be supported in the near future.

The LTDC needs a pixel rate in sync with the bridge currently in use.
For that both DSI and LVDS bridges need to declare an internal clock and
become clock provider to the mux. The mux then selects the reference
clock for the LTDC pixel rate generation.

For now this mux is handled internally in the LTDC, while waiting for
the STM32 clock framework to merge a 'clk-mux' based on the SYSCFG.
This explains the link done in the patch [7/8] between the LVDS,
providing the reference clock for the LTDC internals.

  +----------+              |\
  |  DSI PHY |------------->| \           +------------+
  |          |ck_dsi_phy    |  |          |            |
  +----------+              |  |--------->|    LTDC    |
  +----------+              |  |pixel_clk |            |
  | LVDS PHY |------------->|  |          +------------+
  |          |clk_pix_lvds  |  |
  +----------+              |  |
                            |  |
   ck_ker_ltdc ------------>| /
                            |/|
                              └- SYSCFG

Clock selection applies as follow:
- 0b00: Selects ck_dsi_phy
- 0b01: Selects clk_pix_lvds
- 0b10: Selects ck_ker_ltdc (for parallel or DSI display).
- 0b11: Reserved

The reset value of the register controlling the mux is 0b01, meaning
that the default clock assigned is the clk_pix_lvds.  This causes two
things:

- In order to get basic display on the LVDS encoder, like intended,
nothing has to be done on this mux within the LTDC driver (which for now
explains the unused syscfg phandle on the LTDC node in the device-tree).

- 'pixel_clk' is dependent from 'clk_pix_lvds' because of the LTDC clock
domains.  They also need to be sync to get a coherent pixel rate though
the display clock tree (which explains the LVDS phandle on the LTDC node
in the device-tree).

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Raphael Gallais-Pou (10):
      dt-bindings: display: st: add new compatible to LTDC device
      dt-bindings: display: st,stm32-ltdc: add access-controllers property
      dt-bindings: display: st,stm32mp25-lvds: add access-controllers property
      dt-bindings: display: st,stm32mp25-lvds: add power-domains property
      dt-bindings: arm: stm32: add required #clock-cells property
      arm64: dts: st: add ltdc support on stm32mp251
      arm64: dts: st: add lvds support on stm32mp255
      arm64: dts: st: add clock-cells to syscfg node on stm32mp251
      arm64: dts: st: enable display support on stm32mp257f-ev1 board
      arm64: dts: st: add loopback clocks on LTDC node

Yannick Fertre (2):
      drm/stm: ltdc: support new hardware version for STM32MP25 SoC
      drm/stm: ltdc: handle lvds pixel clock

 .../bindings/arm/stm32/st,stm32-syscon.yaml        | 31 ++++++---
 .../devicetree/bindings/display/st,stm32-ltdc.yaml | 40 +++++++++--
 .../bindings/display/st,stm32mp25-lvds.yaml        |  6 ++
 arch/arm64/boot/dts/st/stm32mp251.dtsi             | 19 ++++++
 arch/arm64/boot/dts/st/stm32mp255.dtsi             | 19 +++++-
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         | 79 ++++++++++++++++++++++
 drivers/gpu/drm/stm/drv.c                          | 11 ++-
 drivers/gpu/drm/stm/ltdc.c                         | 57 +++++++++++++++-
 drivers/gpu/drm/stm/ltdc.h                         |  6 ++
 9 files changed, 249 insertions(+), 19 deletions(-)
---
base-commit: e48123c607a0db8b9ad02f83c8c3d39918dbda06
change-id: 20250617-drm-misc-next-4af406c1c45f

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>


