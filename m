Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3099ECD98EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=16t1swX9E3DoDDgaTiCcWxCfxC/3ieCbtYwPAByc6ek=; b=oDqSEZFzQ5/epIg1V32tanO0Jw
	3Y5twKZIlEMwmKyUB3sdT9h/7hvoOn87YLUAMvy7f2MUnHdDXu//o7jvEinr9q8gp2ijV6+fNBhY2
	8HC7n1GYN3frenRSh3Dmo6S8xWtEe6HnLO+FDn9w1fS/5MK5xX+kDn4XVz8qWgEQZseCiPuoqW6yd
	fK7YD16U9jMJ7YMrlC0rFlZ82kKocOmKzrIqkiRCsopCYVWcunjvb1hMCG2CEpAcK79B2PefPA1Ak
	8QfPgtae+WWJAga8Tj/hVb18IhmfkEbaSo/6gPU3MB3o3cI679mb7Z8iVhbGRJvt8zks1fFIap0zp
	v4hcb+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjOd-0000000GgUb-08J8;
	Wed, 17 Jun 2026 06:05:07 +0000
Received: from mail-japanwestazon11022130.outbound.protection.outlook.com ([40.107.75.130] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjOW-0000000GgQl-331s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:05:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAzaB+oYSck547Mar5M8/kn6z2he6wgE8eY09ARqcrZYKPQRGcfOdGq0XSYZcJpoA8OtuNoBSMfjcvr2ZIjb89rbFkwKJM0N9mCwCd/viXzX6LYBePleCkx2va4oaTOIgw0cTaqDVPhX+1BDSstw6FgKb7yQj6+yE0WaAXVRaIV8MRGeJUCBASmCCUDzXGL8BN64mR1Fqo4Z7n9S2H/piyU/Rz6sKxTmu2DnPvGJRilk58QwgZQnJWOiY4Owj/tckQQo+KmkoXaLhTcaGVrBRfDw3bPA5Vgy8OH9FVYNvK9sBkyHZDAxA0NEPi+7zRpoyxiZulTbYIn9pxu95A1KeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16t1swX9E3DoDDgaTiCcWxCfxC/3ieCbtYwPAByc6ek=;
 b=viITgXLH2M+yw9b35/S9JfgPpEVfpypb6vMksRbSyUrTXIuy+SzE6SvZTdpzJ1MbGUN91TsoJX2vM3hqWI1RvNDQ/G4aUQkedl/wu5j2GAUgVP8JzZFg06EPdqg+TTf3L635lY2wwql08sYSG+KphwIXONjVCacfnUfBQMpZOeE8sYj5p7jsbgyLKPgLiaAPJw513E5xAEVjaOdLR+AJ8xVgsYWErBQzmGcXMtnBq6Sfkl5BmD6c3aYQNsn0LMmeakbafBwx7GxMTYIiCIs2w4lWyO9dR7ejayV1wnjeUtwPP/u4E7QwLrBw9bv6B0jTv2d6R8/YLcSdgRnz/bA+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0039.apcprd02.prod.outlook.com (2603:1096:4:196::9) by
 SEZPR06MB5592.apcprd06.prod.outlook.com (2603:1096:101:c8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Wed, 17 Jun 2026 06:04:49 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:196:cafe::38) by SI2PR02CA0039.outlook.office365.com
 (2603:1096:4:196::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 06:04:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 06:04:47 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C914B41D4003;
	Wed, 17 Jun 2026 14:04:46 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v4 0/5] Add Cix Sky1 AUDSS clock and reset support
Date: Wed, 17 Jun 2026 14:04:32 +0800
Message-ID: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|SEZPR06MB5592:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b3ffc43c-97c8-4176-2a32-08decc36564e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|82310400026|23010399003|376014|1800799024|56012099006|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: UjJ01e5HpfyH08YkMDvpfXcoU34qxkC/pl4oW/P+vrpN5VDBf1dIIBkbirEFJUOAgutmTVPY2No/UHvM4UlI0aoMMN86fJWZiPwtSqPd/4gLFHr+Jv1Oyo5qG96Q8Rrg4mbLkFi4DKupnJLbcmQKH7+pJ6IEzYD7cxXRUt0kvoJSV0YHIWN2jyvoiZ8TTL4F5FN3eUMoYk/eK1slz1rCwxnA+IdQxeNSl75p7IwqYK0alIW27FWjur3GXB/O6WoXYTVczzVQ4fkJvMdEj5x4xPCY2NtczXJrSqCZAbSEvcAzkEexGDfobRF2dRwCsJ+p2LUa22OiEPaI67uqeoldl2GMgAj/Rc0mXWJkrSL+p6nvol7s0wOfwz4rsWzwfw7drn62KhfX77bs3nzC9YXLqdz+RPQp+WFNmM3v3BHiMkfdESHkk7hpIAY5EELE/HLIlSqzXPhSTsg+mRx0TP9riCVEHh6qlpISvmlKfAo68i+M9r66YFRcSFv/AIcRPimSjNs1v48M1b72HpaJLhGa6yx4RpKdxS5L3I2uw4M5mvoGcKX/kZC4QG6CrtCRt/Kqm2BDMNPKLwtG7qA5fsegKvrgVgdPJ6PGGwyvaIYvUAmMM2OnuqL5JBBbP4BpDN3Az9QlBoa3lB50kzYJy0ehXp+Ox/3a+Dks0jp29bEQ7O3BX/vJqh/Ql0itc/6LLAS7d02NHkDNdbqOwOAgL+6S+HjQ0GbAvr0GfVTIB/nopdE=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(56012099006)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VgBVDGvxp4n8P+8HsS9HURUpfzwpZOmOpu/20kpKx7Ee2GfHFl41wXRCoMxl/YNY1HPYFdbqEmUnZfZG+DEhKyOBxPUbyUkPD6xP4vyan0dlIgIuZharHFJin5sBPeP4xAw0w98pLbKjFAQTtn+alZskbof6Uiz1Trut0tl32MVB0ZS4HEspyle2Gsnt2yoKPNojrLmN7+HIhpvpp1uN8Zw+XxOa8zz/lqSp89KZGZnvxTh3dKslVAi/XP8Yqw0fEuDioCWo7zZ75HDgCNvuMzLN09JjYgAaQ81xEbmxpT1NgfYmGAzw0P9QbflCfPOmVBWeqyacfNSni1M+xr6zBomaLMBOIX0Ia4oKAqqujcrNHaaTPGDOgyfRxxb5LKYQI2G1EJ8iCpmz5XSORifPAlBtRLxU18JLRBL+yfTsfpANbjR321euxj8jsnx2vPkR
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:04:47.9360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ffc43c-97c8-4176-2a32-08decc36564e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_230500_778278_C9FB450F 
X-CRM114-Status: GOOD (  14.91  )
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

This patch set adds the clock and reset support for AUDSS. The AUDSS
groups audio-related peripherals (HDA, I2S, DSP, DMA, mailboxes,
watchdog, timer, etc.) behind a single Clock and Reset Unit (CRU)
register block.

Clock and reset changes normally belong to separate subsystems and would
ideally be submitted as independent series. They are combined here because
the AUDSS DT bindings cross-reference each other: the system-control
binding describes the clock child node, the clock binding documents
reset lines exposed on the parent syscon, and the DTS example wires both
together. Keeping clock and reset in one series gives reviewers the full
picture when evaluating the binding layout, dependencies, and
integration.

Patches apply in the following order:

  1. Reset support
     - dt-bindings: soc: cix,sky1-system-control: add audss system control
     - reset: cix: add audss support to sky1 reset driver

  2. Clock support
     - dt-bindings: clock: cix,sky1-audss-clock: add audss clock controller
     - clk: cix: add sky1 audss clock controller

  3. Device tree
     - arm64: dts: cix: sky1: add audss system control

The reset and clock parts have each been build-tested and checked with
dt_binding_check independently. If reviewers prefer separate series for
the reset and clock maintainers, I can split and resubmit after this
round of review once the overall design is agreed on.

---
ChangeLogs:
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

Joakim Zhang (5):
  dt-bindings: soc: cix,sky1-system-control: add audss system control
  reset: cix: add audss support to sky1 reset driver
  dt-bindings: clock: cix,sky1-audss-clock: add audss clock controller
  clk: cix: add sky1 audss clock controller
  arm64: dts: cix: sky1: add audss system control

 .../bindings/clock/cix,sky1-audss-clock.yaml  |   72 +
 .../soc/cix/cix,sky1-system-control.yaml      |   48 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |   24 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/cix/Kconfig                       |   16 +
 drivers/clk/cix/Makefile                      |    3 +
 drivers/clk/cix/clk-sky1-audss.c              | 1167 +++++++++++++++++
 drivers/reset/reset-sky1.c                    |   86 +-
 .../dt-bindings/clock/cix,sky1-audss-clock.h  |   60 +
 .../reset/cix,sky1-audss-system-control.h     |   25 +
 11 files changed, 1500 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-clock.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h

-- 
2.50.1

