Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F02DCF3195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utyQ56Iwp0bE0o5k8NLdtz9Zyjjs9puPqvgpDBjrhts=; b=pfP4TNfQ7FgdEWbXvJXaOeFjIL
	V6mCaf8Qa759t3ePo4neTVw5xHSF71JrGAsTN9n0smuOvXO7M8tZkGwqBk/gryUnxvXwwQ/DnO8m8
	NacU7Occy9s05ZDqZIYixUUczh8l4AtMHJsTnMwawLRnFFWidgsmJ3N8g9xG7LKVcz7sfQKzCAU0D
	uEb/Iikz1V+Rqk5cunAFezYx8NaO3UWBulqOXS9eKPFOmWIe76kSWkif2aeJJ44hfrgOxjNeT68tN
	Udi+cx7EH9Ctfsu8kScPB1u0bcEqJQTRGfWDuWUKRiEBv4LfeqXsqrEpRdSvcbhzjN0Gvo5MJQ/iK
	fhifJ3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfyR-000000030Dj-0AH2;
	Wed, 19 Nov 2025 11:03:43 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfyN-000000030DC-1SsV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:03:41 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251119110333epoutp0270a8903059ff1e8760663f131b0fb67f~5Y5NREQR91624716247epoutp02o
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 11:03:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251119110333epoutp0270a8903059ff1e8760663f131b0fb67f~5Y5NREQR91624716247epoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763550213;
	bh=utyQ56Iwp0bE0o5k8NLdtz9Zyjjs9puPqvgpDBjrhts=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=srfoqts+XkaVcY8e7Sn5kdV0lCsbTtpJ22b+7u6hBfvHtjCfH4XCY+YKX594jyM7b
	 4bZshuCUpQCml8WA/SkJ8m2TcAyeT15FGAYdFlPp4IH1BJJe13ra7MQmi0xiDVU4pC
	 9ML2ts1t18FJAUW0Pzn39O/PV/zyCrmRze0GzhHA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251119110332epcas5p1e7576a2f6f2f68fdd692f43fa6b456b7~5Y5MUbs-q1958119581epcas5p13;
	Wed, 19 Nov 2025 11:03:32 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.93]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dBJW72nQWz2SSKZ; Wed, 19 Nov
	2025 11:03:31 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251119110330epcas5p10fe5035ad50ad1f5cfa3eb42830ac401~5Y5Kj0FOb1937319373epcas5p14;
	Wed, 19 Nov 2025 11:03:30 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251119110320epsmtip214c80850a63127e66a162ef624825255~5Y5Auz_Pp1541615416epsmtip2X;
	Wed, 19 Nov 2025 11:03:19 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<jesper.nilsson@axis.com>, <lars.persson@axis.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <alim.akhtar@samsung.com>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>
Cc: <ksk4725@coasia.com>, <smn1196@coasia.com>, <linux-arm-kernel@axis.com>,
	<krzk@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<pjsin865@coasia.com>, <gwk1013@coasia.com>, <bread@coasia.com>,
	<jspark@coasia.com>, <limjh0823@coasia.com>, <lightwise@coasia.com>,
	<hgkim05@coasia.com>, <mingyoungbo@coasia.com>, <shradha.t@samsung.com>,
	<swathi.ks@samsung.com>, <kenkim@coasia.com>
In-Reply-To: <20251029130731.51305-1-ravi.patel@samsung.com>
Subject: RE: [PATCH v3 0/4] Add basic clock and pmu support for the Axis
 ARTPEC-9 SoC
Date: Wed, 19 Nov 2025 16:33:17 +0530
Message-ID: <027f01dc5944$239f6890$6ade39b0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFuBG9fI91CU/dBRNhjuFekaH32YALr0KoHtb8gl/A=
Content-Language: en-in
X-CMS-MailID: 20251119110330epcas5p10fe5035ad50ad1f5cfa3eb42830ac401
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251029130809epcas5p3cd5341d86ffac5fe18d8541c8018e568
References: <CGME20251029130809epcas5p3cd5341d86ffac5fe18d8541c8018e568@epcas5p3.samsung.com>
	<20251029130731.51305-1-ravi.patel@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_030340_004992_30055B29 
X-CRM114-Status: GOOD (  22.42  )
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

Gentle reminder to review this patch series.

Thanks,
Ravi

> -----Original Message-----
> From: Ravi Patel <ravi.patel@samsung.com>
> Sent: 29 October 2025 18:37
> To: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; jesper.nilsson@axis.com; lars.persson@axis.com;
> mturquette@baylibre.com; sboyd@kernel.org; alim.akhtar@samsung.com; s.nawrocki@samsung.com; cw00.choi@samsung.com
> Cc: ravi.patel@samsung.com; ksk4725@coasia.com; smn1196@coasia.com; linux-arm-kernel@axis.com; krzk@kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> linux-clk@vger.kernel.org; pjsin865@coasia.com; gwk1013@coasia.com; bread@coasia.com; jspark@coasia.com; limjh0823@coasia.com;
> lightwise@coasia.com; hgkim05@coasia.com; mingyoungbo@coasia.com; shradha.t@samsung.com; swathi.ks@samsung.com;
> kenkim@coasia.com
> Subject: [PATCH v3 0/4] Add basic clock and pmu support for the Axis ARTPEC-9 SoC
> 
> Add basic clock driver and pmu compatible support for the
> Axis ARTPEC-9 SoC which contains 6-core Cortex-A55 CPU
> and other several IPs. This SoC is an Axis-designed chipset
> used in surveillance camera products.
> 
> This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
> 
> This patch series includes below changes:
> - CMU (Clock Management Unit) driver and its bindings (patch #1 to #3)
> - PMU bindings (patch #4)
> 
> The patch series has been tested on the ARTPEC-9 EVB with
> Linux Samsung SoC tree (for-next branch) and intended
> to be merged via the `arm-soc` tree.
> 
> ---
> Changes in v3:
> - Resend all patches in single thread
> 
> Link to v2: https://lore.kernel.org/linux-samsung-soc/20251029125641.32989-1-ravi.patel@samsung.com/
> ---
> 
> Changes in v2:
> - Decouple the device tree related patches which was present in v1 (Patch #5 to #7)
>   Device tree related patches will be sent in separate series.
> - Fix the division issue (in arm target) reported by kernel test in patch #2
> 
> Link to v1: https://lore.kernel.org/linux-samsung-soc/20250917085005.89819-1-ravi.patel@samsung.com/
> ---
> 
> GyoungBo Min (3):
>   dt-bindings: clock: Add ARTPEC-9 clock controller
>   clk: samsung: Add clock PLL support for ARTPEC-9 SoC
>   clk: samsung: artpec-9: Add initial clock support for ARTPEC-9 SoC
> 
> SungMin Park (1):
>   dt-bindings: samsung: exynos-pmu: Add compatible for ARTPEC-9 SoC
> 
>  .../bindings/clock/axis,artpec9-clock.yaml    |  232 ++++
>  .../bindings/soc/samsung/exynos-pmu.yaml      |    1 +
>  drivers/clk/samsung/Makefile                  |    1 +
>  drivers/clk/samsung/clk-artpec9.c             | 1224 +++++++++++++++++
>  drivers/clk/samsung/clk-pll.c                 |  185 ++-
>  drivers/clk/samsung/clk-pll.h                 |   17 +
>  include/dt-bindings/clock/axis,artpec9-clk.h  |  195 +++
>  7 files changed, 1847 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml
>  create mode 100644 drivers/clk/samsung/clk-artpec9.c
>  create mode 100644 include/dt-bindings/clock/axis,artpec9-clk.h
> 
> --
> 2.17.1



