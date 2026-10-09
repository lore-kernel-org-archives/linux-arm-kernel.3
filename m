Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97F1CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PfrrYZXzrO7AEuhEMyRkQE8EamUmCjpiMyrdpid0h0g=; b=nhN0251SXjs4nmWxvtG8yir0wd
	f7DMDQ4sh9QwYgPc1k+6+apNiV7v736THFA6y83mIhAwGntH3ZSLFw1dB8Xr1O/OQvmYHFJBKR5Bh
	FVoZtF5UdkU0oaSzGWO1GftUuy3Px/vIDSnre9gxr741+Xn/2ZPGuYEDGSrVGIBlm/WSwNBWawCJt
	KuMrqNzYaO4wPQiqqFS19OTgjMTpXcRoK8OvSruJenG2+Ojsvqkieyr69WQiNZEJU1Qs2MljxvalB
	mrLim6wh5RrVqayGt3jDpZhfTvQiydMO+JrnvvPFbM/R1GD2EmyK6Pam4+oeSWRbswZjFX+Rw8hIH
	z0hWVjxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6rj-00000005uXd-1aZE;
	Fri, 09 Oct 2026 09:26:11 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6rg-00000005uWP-3bns
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 09:26:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbpKx5I2C1QkTyodU+efRhIp3fwPaKHD1kW52jMvdz2xvLKXWe2zF/O/643/TtA8qBT111BtpNVcUx8h71Djj46oIppazt3KU0EOhgF/goMBWbnfX9Zpib8X34MMnyWGGJSdkPMlzhuOh1SD4Y1hFf4mLJi1OpRT/d78OzsWi8kOiQC64eZFJe4SOC0xNoOlFyZQOJPbfPEfxmfzW2cQUuzdGPrkHQq7fz6S4VduplyhAgl0z/dlrLFoyXhgn1vbd5qjOLRHKDtdkEOMzGETRi8sRu8vpV0bf5mWECUCYqJuozu2r1b+lmPiXfmHC4+1TGH1P801+9N+y7m6WbalDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfrrYZXzrO7AEuhEMyRkQE8EamUmCjpiMyrdpid0h0g=;
 b=SLGIMMFOU/sMQXLccsbpzvWKjZODkoXcn++ewVj2CaY+HyyL+90pCyF+DASmhr+ZXWUgyYZKPDqfzz9SrpzDu7f2CTl671xb/XSlXuwr91j2M0WQ1kd6KxrMmEA+jV0qDy9Hbpg6TnRfcDHor+XG0oRO8h4/sFnMhTb9D72deazT5Bk2s/znJuqWFVLbhWU8lhvmPIu7DC7UcQ2cfApxIw9ym6YX+IiO1vGrZO8LEXikTZ6ahlfWug6eYfkNSDHOU4hiRPmPp6JnVVuXY+k/j2Ja/3euNt1XJLbfg3y3tcqOU5URHPpkI7E+FPOHxHgZfSUQx/L2mllEHQc1UOtZzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0043.apcprd02.prod.outlook.com (2603:1096:4:196::12)
 by PUZPR06MB6055.apcprd06.prod.outlook.com (2603:1096:301:106::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 09:26:00 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:196:cafe::33) by SI2PR02CA0043.outlook.office365.com
 (2603:1096:4:196::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 09:26:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 09:25:59 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7FAAB4091E02;
	Fri,  9 Oct 2026 17:25:58 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v3 0/4] ASoC: cdns: Add Cadence I2S-SC and I2S-MC controller support
Date: Fri,  9 Oct 2026 17:25:48 +0800
Message-ID: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|PUZPR06MB6055:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7d67f23b-1e48-49d1-5bad-08df25e754c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|7416014|1800799024|6133799003|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: lZSmfAvSDKjUJ9pf1Qc0UJA+mpajDk9gEoW01et4J8KxQBN3813d/jwd5Dr/ZD3yHN5Y8d67rjrX8zaP2D4cUMs7M/6hFCCvpmFc8zEhUJqTB3Vuls8HUoSmC/nrAJLsPl5g07gGR/9E1v3/zaSObwgWv1rdowUBTbpfqGfEzBVzrfmLAXQscE6eJ66KgxMH7Km9Jd8asvbhjgsgA2OqJ9ysKP/juL6+TiAM34FNP/N9xI0aKznyfZcI9h1V0CtvveKJi/+c8TjekmU/UBpk8Uzfk4HghOmPpfXq9iiltBD/YqdOtIb4cJBhFyHdMCXnGXKbpWIc25coKcbti2lmtL/GvlfOfWKFuP8VFvMw8Jf4+SYTzYNM/+tw+bvh2RLqUpfnWbnoKqrnKGjXJEW/iOD3BnyANMlrn9xEPU1cUoP0PqMjd8WueR7tNotxNWQE9u9wCt2dYzLoY8PBZZPcM2S4ejmcLG3tu59mGTpGZBgpNq7lnnHScokpw88d54mA5ct/kfIA2K6kyAwytdSU8ctm87+Rxh0k5FGboEKhgyzd9f/fBurfVKTBRrkEZgcC5fJ0Yuq7jMvsSfE38PifoVOlD4yXKgwC9d90EkoRCmA1XkColMVKhgyYkGIRhfelDRQm+7bGlURO6AgkFMoR0ROtFk91s8LZCeXtwUPtkp/lUlnjdzLmmFeAWmCtduKT9JLSiTD0kJi04cob4t0tJQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(7416014)(1800799024)(6133799003)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4DsTXR0cNAYM9oman8KE6ksrKJYeoneKVlQluDAnxPan1W3q5Asrr/8mp9Pq1gjsAGqZvZCmODr2YZ6zVUiX03IMJ6T1dHUr7X1WNjfi3uFqpvnwjFQuTy8F9FaWz0kYAX1Sp4P0P1TcuaXVBi8laRgoA1YqmA6G/lEw4jw8rnnXZn2xEPI5OkXZOmkjigcXhG2Sg3vxV11VO61zlR5h5msUG1d1INvE2kdFoIpme/LIuusv0qr7jSzUqCW6XgwI+psyLMKz6Xrw5jVpN4TZ8Gt2K63LinYDrGri+xTEkD3R41uiGqTBbrt7XIPEz0qop7Ffat74JI+oY8V+BxpiTCw2orkxocBXCRnwarFvFTj8srA0JBC6jiS/Ra+yLi6YqdSTOLVJL8wivzyMNNl4SmmuE/dxiIOFUTfVsQITO7UTl+0lQStQi1r4Nctyl75A
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 09:25:59.4718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d67f23b-1e48-49d1-5bad-08df25e754c4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_022608_902345_962C298D 
X-CRM114-Status: GOOD (  16.56  )
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

This series adds support for the Cadence I2S-SC and I2S-MC controllers
integrated in the CIX SKY1 audio subsystem, together with their DT
bindings.

I2S-SC provides full-duplex stereo playback and capture in standard
I2S, left/right-justified and DSP modes, along with TDM operation
supporting up to 16 slots. I2S-MC provides multi-channel playback and
capture through a configurable set of its 8 data pins, described by
cix,pin-out-num, cix,pin-rx-mask and cix,pin-tx-mask, and exposes a
transmit DAI and a receive DAI.

Both drivers register the dmaengine PCM helper, select the audio
reference clock parent for the 8 kHz or 11.025 kHz sample rate family
and keep the minimum functional-clock to bit-clock ratio required for
safe clock domain crossing.

Changes in v3:
- Add the explicit <linux/bitfield.h> include, which a W=1 build of the
  FIELD_PREP() sites needs (both drivers).
- Fix the probe error paths: disable the manually enabled clocks and
  drop the runtime PM usage count on every failure path, unwinding
  through a single goto label (both drivers).
- Return dev_err_probe() directly instead of logging with it and then
  returning the error separately (both drivers).

Changes in v2:
- Move the IRQ request after the clocks are enabled and the reset is
  released, so the handler never runs against unclocked hardware.
- Disable the IRQ before switching the regcache to cache-only mode on
  suspend, and re-enable it only after the cache is synced on resume;
  check the status read in the ISR (both drivers).
- Replace the manual runtime PM bookkeeping with devm_pm_runtime_enable()
  and drop the remove() callbacks (both drivers).
- Switch to RUNTIME_PM_OPS()/SYSTEM_SLEEP_PM_OPS() wrapped in pm_ptr()
  and drop the __maybe_unused annotations (both drivers).
- Serialize the shared transceiver clock state in prepare() against the
  trigger() state machine with the existing spinlock (I2S-SC).
- Disable clocks in the reverse order of enablement (both drivers).
- Sort the cdns/ entry into the vendor list in sound/soc/Makefile and
  switch sound/soc/cdns/Makefile to the '-y' object syntax.
- Clean up the includes and initializer style (both drivers).
- Add a NULL check for the match data in probe (both drivers).
- Factor the MC transmitter and receiver configuration into a shared
  helper.
- Drop the compatible string from the DMAC stub node in the binding
  examples.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>

Joakim Zhang (4):
  ASoC: dt-bindings: Add Cadence I2S-SC controller
  ASoC: cdns: Add Cadence I2S-SC controller driver
  ASoC: dt-bindings: Add Cadence I2S-MC controller
  ASoC: cdns: Add Cadence I2S-MC controller driver

 .../bindings/sound/cix,sky1-i2s-mc.yaml       |  123 ++
 .../bindings/sound/cix,sky1-i2s-sc.yaml       |   93 ++
 sound/soc/Kconfig                             |    1 +
 sound/soc/Makefile                            |    1 +
 sound/soc/cdns/Kconfig                        |   21 +
 sound/soc/cdns/Makefile                       |    7 +
 sound/soc/cdns/cdns-i2s-mc.c                  | 1127 ++++++++++++++++
 sound/soc/cdns/cdns-i2s-sc.c                  | 1166 +++++++++++++++++
 8 files changed, 2539 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
 create mode 100644 sound/soc/cdns/Kconfig
 create mode 100644 sound/soc/cdns/Makefile
 create mode 100644 sound/soc/cdns/cdns-i2s-mc.c
 create mode 100644 sound/soc/cdns/cdns-i2s-sc.c

-- 
2.50.1


