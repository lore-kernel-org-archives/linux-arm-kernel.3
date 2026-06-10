Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD3BCD98C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 07:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a11WD13BGYgOuihN7nsHLdVz6hOp98LdWU1LuUqAo1s=; b=dYX1iuV+AKg1oBel5hDsT6y0Dk
	vxR5pa5jvqXilhyjh59DQ2FKmui/1smnl6F1M/cej3lbelfZk0yxZvodqWj/+OFODMzG+0DowLoTc
	OKlVLULUyEZvDz5CKyJwjcpQOfxmtPgJZk73vB1Ull3TETTxiq+xNgOM975LlOS8euujYD1V2P7Bb
	fx1up4lqzu/UCJKt08Tzviv+KL5vt2Zaxy86PAJy2UBAvE4BIytpv+E3+VXQtRHNcIs/w0faQh2Gn
	6KV+Wm62wenFUmO0stnQt99VKQBR31Bb5DMOgCfIK5eX1ZQC1FXKErWBX+I4R4UOEqE4V6uSbbo2z
	bJIPwkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDoA-00000006zmd-3Oha;
	Wed, 10 Jun 2026 07:57:06 +0000
Received: from mail-japaneastazon11023138.outbound.protection.outlook.com ([52.101.127.138] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDo7-00000006zk4-3UBB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 07:57:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJUJ96PgnmWLbqncgB0gU7h9a7EmW3ew3JYoKnno22XfF0psTOUjHmULnVe24Y6AitZARlTXlQ324p+ABfIFnB6mBuRn16zwc8yJBoMm4Kg5O1XxC55e9NOWoAZUXv+AUd7deNbQU3bcv7J0T2qWlnddL2owG7HM8vwMEYih/FSLwTpoO3k6ZonBKN7ADjMUqVcadSzyW0dgZVOZgCZHSGE4Ap/o27AKC8rjqs1OtUFi30ruTUfriWgg1ozJ8AgmbZdzwqJzQaE01fqM7zL4XmUZt6vaIInFnr8MQ4BOJ9saXgr+uiUOWbBo0DtB1zl5oV7hlxhPyLkX6g4MOqejCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a11WD13BGYgOuihN7nsHLdVz6hOp98LdWU1LuUqAo1s=;
 b=KtITK6rlRMV9Y0gx8VzNycbtFb0eV4eKtruWxR1qleiDQW0uZ5COF7U9kmVt46FXq9vxi3YB6yks9lAxWsMhpEfzvjBnXAPrxlpcOYAX30yYM4x1qessNrSZZ4iw0lirygigq85UlbS91zNZaxKiIIeGfyE/PHMwXNkeeltm7kL+lnZawlHfAPFKeVtXhSuGQ8EDYjVzswUL3rbZ/vemAzZJgI3ECbhmNHF4eX2mafhRf8lfPPAc8igAWxA5Mueeo0Ua+p/0JN9WTopO2e2A15QDUPudvVJevtjcZxwzT/u3i/3R0O3I/vkbDdIGxhaBlPcf1rJFe9sKk1DbPB9GTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR03CA0018.apcprd03.prod.outlook.com (2603:1096:300:5b::30)
 by SEYPR06MB8245.apcprd06.prod.outlook.com (2603:1096:101:2f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 07:56:49 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::56) by PS2PR03CA0018.outlook.office365.com
 (2603:1096:300:5b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 07:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 07:56:48 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 304A04084274;
	Wed, 10 Jun 2026 15:56:47 +0800 (CST)
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
Subject: [PATCH v3 0/5] Add Cix Sky1 AUDSS clock and reset support
Date: Wed, 10 Jun 2026 15:56:40 +0800
Message-ID: <20260610075645.3581145-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|SEYPR06MB8245:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 13c39f69-dff0-4b72-da14-08dec6c5d374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|7416014|36860700016|6133799003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: Fp4gUT8jkgD+TMGrnlg5vjLxZ2oLtAMFfEqPTRDA2EfheNq9rS2nP9TqB90DTzFXW7GKAz0eJgBSPs3cHWwl5HAKH+nATwiS5GB61ZfZ7NvimRk+SAgMDBlfDAkm5jihbhA37cqElIBHVGCxEW4gws6o3Xx13CFkArIKtDCaoxpL9k6fbb8+wnTMAhRCtO3OKqK2DZPzjY+FozVquUobblRVtgSJvXAsAH/hHmsEMnfpnnhO+OaM8/KbVOf5G8sNM0VIXI5UnGezUGpTIWzOrsZdMsNHlhuDf/OLt7XSzfpUEZfpIy4Nv1HhPJuuQefexU6ab6wfmlj/N5+ZRqSr2tIbgINpzWKyfm+p0L/CGNj7lNvZlzB2te1xW+nBIr0KLopJFAZQyfiKabs5bPIUHZsotWgk33708BcNmT925bEOaNPEuGnaj2smcKb7gOPDyQE7fxSa9C3tq/R1otEgEkCupo4wvIrUTZ4lnIakrgFx1DYBZAqXtSRYnYeanvea2JRiY1rCTFTzIPYDdpbMOBHFdbwDZ/0muwmNtR/ZUBY7JcDY6aUIt7f82laPi4V8Qlhj9wK5fHgxS+kLwkNeu3iJW4hSn813oEmHOiRZrZIS6l1UMyONYo3TmCn1x8SEeTGaKPX7CUUE6sfNGsbf+WEykodhadaLV8/LVdJlEf4CNRqdJufEuEMlTFgXxrcFi6Hpi5Od27jqYTKiid87tG2+5F/ph6j503U/tLgxpbU=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(7416014)(36860700016)(6133799003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: b9I7TS8cddWVBvfxxI+EG3Ew8fI/y4aJAEi9Fud82fehB0Joe/vbdqq2Y5/ybgOjew9TuaYsy2wd1XbZPdhvHKnyiZKNd9rHCE39TLiIYiLvAWKRDR2S+3g3TbVaiJMCpnOTB+6fPQBTSMRUMNcJ198Qz6nonYO37s17jgqIUoiCwAsJ/63EFhs0cPxavmKtN5U72BijzDqVZRgUqn0zIfW7ysplgRDK7cngAW58TiecrzZkBdzkVN3Ew+Dr0HiC4VAp7NZelVJvh00UJIw2IyQYFe8gpR/bjTyn7pElknd4Z2Mw6CdbQxofxTIMAeoh+4W92HupKSsCGk/hrLbcv29Ar1Dce57duUzKXKwquzYOWsOXo92944ZytcVbQ8rk/cEVuT7hM7s5KwDQv5R5jLJcGYZlVUWE9monOKwzA3EwL8VPtB0l9xf79hLWPU6M
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:56:48.8354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c39f69-dff0-4b72-da14-08dec6c5d374
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_005703_882399_64C13BBB 
X-CRM114-Status: GOOD (  14.48  )
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

This patch set adds the clock and reset support for AUDSS. The AUDSS groups
audio-related peripherals (HDA, I2S, DSP, DMA, mailboxes, watchdog, timer, etc.)
behind a single Clock and Reset Unit (CRU) register block.

Clock and reset changes normally belong to separate subsystems and would
ideally be submitted as independent series. They are combined here because the
AUDSS DT bindings cross-reference each other: the system-control binding
describes the clock child node, the clock binding documents reset lines exposed
on the parent syscon, and the DTS example wires both together. Keeping clock
and reset in one series gives reviewers the full picture when evaluating the
binding layout, dependencies, and integration.

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
dt_binding_check independently. If reviewers prefer separate series for the
reset and clock maintainers, I can split and resubmit after this round of
review once the overall design is agreed on.

---
ChangeLogs:
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

 .../bindings/clock/cix,sky1-audss-clock.yaml  |   80 ++
 .../soc/cix/cix,sky1-system-control.yaml      |   47 +-
 arch/arm64/boot/dts/cix/sky1.dtsi             |   24 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/cix/Kconfig                       |   16 +
 drivers/clk/cix/Makefile                      |    3 +
 drivers/clk/cix/clk-sky1-audss.c              | 1175 +++++++++++++++++
 drivers/reset/reset-sky1.c                    |   36 +-
 include/dt-bindings/clock/cix,sky1-audss.h    |   60 +
 .../reset/cix,sky1-audss-system-control.h     |   25 +
 11 files changed, 1461 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h

-- 
2.50.1


