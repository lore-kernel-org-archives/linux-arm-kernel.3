Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFA5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MmCkUJr8R/kRpoOCJTj2tfjUd66/jpXi5fsU7B2WDVo=; b=4yOJdla7dJBpw7N7qCnMuHAn21
	6uW2VVUKsVMmAWf3NKQu+JpFxScE0KtDymuX/3wvASDI1OfQnPn92UBxULr1JDpkf6vgrkfxb3YYL
	/mmljmwlvoz6DKbEpiq3hG2yvaSz3Srl5UWrxFeWiAunRzNNojTFOfZUGSJSBaPqblbBXqrZPIbuI
	8SoETPI7NGEqX+rfZDNDT2UcdVzweq8voFf2J/Yo+2OabdGtq0TfxtXanPC4iH8V3Tf3pEg7hvqqt
	L1iXEjVyyXm6yFHCl1fYTmf3H5CzzowS/M1ITLVAYfI46Ld3fIxGh9WXEGYK4jSNhc0blPxlRfhUH
	3XyFEUZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we85B-0000000E7fO-3Cpl;
	Mon, 29 Jun 2026 09:15:13 +0000
Received: from mail-japaneastazon11022104.outbound.protection.outlook.com ([52.101.126.104] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we859-0000000E7dR-01HK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:15:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hiTQjcLwlC8rS0sIqFJ0ZDxvlEPfvRoOTAxZnInhFFbFXH6pr42QCVuK9HRdWeQ31bwzcX/PmrxGxejgD71dMIoI+/EYkmZF799Mg8xLeyYUeY4hGE2u0fls8mazW6h2d8C9lq/wbqylbPNWg9KDpx5KOzTVUmm4c7k9vvpDiaGudosyWLYaqjediCD4I1mC8AVl0IY5MwzqmmrcVZCTi+4tKEqn+m9sY3vd6zKQsb9qlQjNaE/nJFnn/tqCnISrjWMeb97KXLWNhi1IrHhryChOZ/ZITRTonjO9QVy1mYciEHbvcI0LFQbjZTU4HilI3iKj/5TCw9L7K6Jr0aY/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmCkUJr8R/kRpoOCJTj2tfjUd66/jpXi5fsU7B2WDVo=;
 b=s8ClVnKgJcjYZi5qffcuydS9EG64bVv/UVPqWhZ1L6/F8ZUTjWU1H4q64MIqtllLfkgl1gHcH/+UZTPj6EFdi5DmxIUVV68gHOuaTWxzMGWXji5ZqWR/UZicQVdwuRhf+BCFCWYgltpOSFqm8xDU+MxHvDSh/d9yxoxx9DctuIBnfOD7rvc9roaNFGyMUdxbIAaV8zt0bp859GSzvZE/ffLMTQi43BsSHqe7kVc6RDkPxWFWLv7p+7uJ3zzOdfji6tAAwifnMHVuAM06pnoU5IHW8QmeELTnbXRW9PtnqIS+pwrl67+r2eetLzVsIM2pXsEmjAukVh9JwPYn/Lix7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0007.apcprd02.prod.outlook.com (2603:1096:4:1f7::6) by
 KL1PR0601MB5512.apcprd06.prod.outlook.com (2603:1096:820:bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:15:04 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:1f7:cafe::4d) by SI1PR02CA0007.outlook.office365.com
 (2603:1096:4:1f7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 09:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 09:15:03 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AF17040920FD;
	Mon, 29 Jun 2026 17:15:02 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v7 0/4] Add Cix Sky1 AUDSS clock and reset support
Date: Mon, 29 Jun 2026 17:14:56 +0800
Message-ID: <20260629091500.52540-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|KL1PR0601MB5512:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6b57c157-d2a9-4fb2-c005-08ded5bee771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|23010399003|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: dwgb/5+Iji1SFspypZTyVKAJWH1KsGDOgcuT11dCTAhvzugQ7el1DdsiSqf/JBzIdk9hv8EdRh4Im2EaVydEmdePdnprYpdzDGJDNSkfqIGD3vt+3E+UbnS1OEWFj0dY0sClRqPcdEuTN3rEogoJvRQ4crY6rnpzsTD+KB6Pi4VZIjW99BfoXTzaSNJfI/oev168fYDQMdwFIyB9zI1jIlKfeBN1jJnjKY6n5oXutCb8xSQaTbvnZJblLjiGRKYq0NLcG4ap+5eK7pCDFjlVDxuj4lqVEJbzdQaKrQQjZ2nzgUDt6WCxQ2Et4fog2KryrI9dsOyi2b9EF8kwdFWKdH+LQcxGcIlpUSha/uVWnT5Gfyd7KxuK5MJGkMQ6i1wXQkNEW4o0mUoil1m/V7MsdpED+DB0sRPk08suOK8VlzLzwZQWHw5Dfb46LLNLoBJdXeoxutf2GJVPkuswz8sSGnpQFpR9/fFpeg4pJr6LmhgsbH2LxUnF0UT2hAFqnmY1VpY7NZ9D0KxMg1k1lC4/II0074QFR6O9QNWOil10ZPa2ASmI6JkjtotXFHzS/XiVaFAhmZJQoTJy6xCk27Drz77aRuHASz0/8zKYe5WrmNwlm95NZlb9lm10JhuSbX6oddK4yTamRUY4bvgrWfugfUEOzq/OgrR5/Sx064tjkGi+dYF0D6I9SgpuXhrAnhU43f3GyauWcWBu+8vCU9epFA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8vrmb8shT4eJoDzDzCNpQ1ob4TLpuwcKM+hbdiXmmJV1UVUBta7PE0zQypQ4j6sfPeTDMWE4Jgj877NtrrA1zXrvF+kN8z1e2E9iNzmCLguPNqFJmV7A8W7N6cQjMep3UPLCBANbVVumZ2wKNQkBOosJg8cAH1JBH4bqcOki2AwXDlfj3HkoxhIMWES4CFjMNWeW5BC3zjIZh68hBt/w5NeR0JBOUkqblYpnspp/zy+p5jhXdtNRvWlwD+D71VurmPQ98zExPSqXvnrQy3ANsTr9LIsAA2kWPhdod0IS4LFltH95uW5rJz4DZCeiwlkF6Oh1dsPtaOT9npZw01KVJYC5scT80ObqdKq6Xu9h4MXUf8XEWJO2cbxdPW3kpQtzKXP267ZPj5TokfThdJ1ZU3XF5lRM7KvBUIhwEe4oWsCCGrBjSp+TCJIWQtH+Ppe7
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:15:03.4971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b57c157-d2a9-4fb2-c005-08ded5bee771
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5512
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_021511_069070_D59B17D3 
X-CRM114-Status: GOOD (  14.08  )
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

From: Joakim Zhang <joakim.zhang@cixtech.com>

The Cix Sky1 Audio Subsystem (AUDSS) groups audio-related blocks such as
HDA, I2S, DSP, DMA, mailboxes, watchdog and timer behind one Clock and
Reset Unit (CRU). The CRU is a single MMIO register block that provides
clock muxing, gating and block-level software reset lines for those
peripherals.

Clock and reset support are submitted in one series because they belong
to the same hardware block and share one devicetree node
(cix,sky1-audss-cru). The binding, clock indices and reset indices are
defined together; the clock driver maps the CRU and instantiates the
reset controller as an auxiliary driver on that node. Splitting clk and
reset across separate series would leave neither side self-contained: the
DTS node needs both providers, and the reset driver has no standalone
probe path without the clock driver.

---
ChangeLogs:
v6->v7:
  * reset driver:
    * propagate regmap errors in assert/deassert ops
    * drop .reset and .status ops (no consumer uses them)
    * remove regmap fallback path; use parent regmap only
    * use dev->of_node for rcdev.of_node
    * drop of_reset_n_cells and dev_set_drvdata()
  * dt-binding:
    * Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

v5->v6:
  * rename dt-bindings headers to cix,sky1-audss-cru.h to match compatible
  * drop status = "okay" from audss_cru node in sky1.dtsi

v4->v5:
  * refactor the driver, using platform_driver for clk and auxiliary_driver
    for reset.

v3->v4:
  * move both power domain and resets into parset node (audss_cru)
  * remove "simple-mfd", and change to populate the child node
  * cix,sky1-audss.h -> cix,sky1-audss-clock.h

v2->v3:
  * clk part:
    * devm_reset_control_get()->devm_reset_control_get_exclusive()
    * assert noc reset from suspend
    * clock parents changes from 6 to 4, and rename the clock names,
      explain more about this: confirm with our designer, In fact,
      there are 6 clock sources going into the audio subsystem. audio_clk1
      and audio_clk3 are redundant in design and are not actually needed
      in practice, so they are not shown here.
    * refine clocks and clock-names property
    * add detailed description of clocks
    * drop parent node from clk binding
    * drop define AUDSS_MAX_CLKS
  * reset part:
    * rename reset signal macro, remove _N
    * drop SKY1_AUDSS_SW_RESET_NUM
    * switching to compatible-style of defining subnodes in parent schema

v1->v2:
  * remove audss_rst device node since it doesn't has resource, and
    move to reset-sky1.c driver.
  * remove hda related which would be sent after this patch set accepted
  * soc componnet is okay by default from dtsi
  * fix for audss clk driver:
    * remove "comment "Clock options for Cixtech audss:""
    * add select MFD_SYSCON
    * move lock and clk_data into struct sky1_audss_clks_priv
    * const char *name -> const char * const * name
    * remove CLK_GET_RATE_NOCACHE
    * divicer -> divider
    * Reverse Christmas tree order
    * return reg ? 1 : 0; -> return !!reg;
    * return ERR_CAST(hw); -> return hw;
    * of_device_get_match_data(dev) -> device_get_match_data()
    * add lock from runtime_suspend/resume
  * loop to more mailing lists

Joakim Zhang (4):
  dt-bindings: soc: cix: add sky1 audss cru controller
  clk: cix: add sky1 audss clock controller
  reset: cix: add sky1 audss auxiliary reset driver
  arm64: dts: cix: sky1: add audss cru

 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  |   92 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             |   18 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/cix/Kconfig                       |   16 +
 drivers/clk/cix/Makefile                      |    3 +
 drivers/clk/cix/clk-sky1-audss.c              | 1203 +++++++++++++++++
 drivers/reset/Kconfig                         |   14 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-sky1-audss.c              |  137 ++
 .../dt-bindings/clock/cix,sky1-audss-cru.h    |   60 +
 .../dt-bindings/reset/cix,sky1-audss-cru.h    |   25 +
 12 files changed, 1571 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 drivers/reset/reset-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-cru.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-cru.h

-- 
2.50.1


