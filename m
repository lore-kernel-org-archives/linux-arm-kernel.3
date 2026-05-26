Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68878CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2F6sf0/S81egmwvSWsSPKQ/FlZ5Tu4PPXjAwNhBijU=; b=pNrWntNifJpfKnN1M23yR84ZNa
	NigniU1Av/BcNU5HTRYXc+3dVxDusKmn+soQskN6ugZ81uD2fwkkUQ/+rj/YyfeIeLvlxUQ7CGvE3
	h7dukcCt2easm6EnR0+Z294xonFRpfEljok/mS5vsV+hpGaDb95nhAK5sIaDQtAiZALSefa5QyK83
	p9Ufz3GSaFuPSgUCe8PLHpcTam+Ac97nUgYM42n5MiBIA38apysv/YhxrLavS2IgaCBbwKk+zO+T3
	DjaYyJ6bY2kOXqaEzYdzayNz2lRMeyTxss3JIdlsY7cGNq6m/zkyvTmvjqWBxNmY8oh13bskX/4lo
	mDhXXwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqKY-00000001qhq-1f1X;
	Tue, 26 May 2026 11:52:18 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqKW-00000001qhF-0KhR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:52:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToJc4Arwa/Sd5FO6Y9G3icd8Rcp+hhXhhTs2ZolJ7a12DE0C0laD66MGspNraNjGE/EhOXhFxPBjR18YmXzyr4Jj9FkC+HzN9ogYuhEcK0XCUaaw36H66L12YFcxVua0qJ9M6XGQRpWxu9sS2YWOC88lBQ2s0nVuSmnbi8WwkqEkF+Zky4NvVvl5wQUNM37ccCFUFpDMwMlBImTMeWnjFUi8mgzkLyMKjpiqL1MNSiUwPpDgnAqmmL2M4LCS1OXoCB0WkTbcxwX6/RHmYC+MhV4+TZi+v5FyTe4PCCK8bSQF8Fx2HvnPrkwr41n6RJYiaib8+t+3wo86yMKYHgDB2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2F6sf0/S81egmwvSWsSPKQ/FlZ5Tu4PPXjAwNhBijU=;
 b=Seg0xWqmIZ2Ecd/KJeMPx2fYjyb2YCPKj0A7jtgapxhu9xTC5QWHb7dxx3q15v/dkqRGNTCHp1WIZuW+Af6C33MUzvSOtLB2sOQtEXIEhl3ekpfogBOTvlxXZ29yGgvyS7phBFKjLPxPGfYe/yTbnLKjjXX24Fpq6TDbDzoEveUmbsgCZgkjH4ZWbZMusZeMuLJ2feb5W5LxneuaY7t112SANPOOv0Q6vXxV/O+JIY/LUGc4PzpyI0CnJJsNE4e6NrrinsKe+B/iqVtvVHXo23iuxY0L+fjsBpVJveZ4S+h6kdP9IA0p/zYrKVkXZkIMPxXXUGUDZNXVdWLDeh1Y6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2F6sf0/S81egmwvSWsSPKQ/FlZ5Tu4PPXjAwNhBijU=;
 b=pjWM2fFf3/vQoqU6cif/UdH7LuDmEF1XNtaUf5QC9e5taTZ+x315eLZueyckGHQrSYQwdedzdXFYfsMpkFNOtWodvzmwH++qreOASrn2SGdZwIMdWAfA6AmtAA4ClFgKhuTL0ZjCbRFXNK7Ell5z7KqQqe4YSFFegbTcMLVjeO8=
Received: from MN2PR06CA0007.namprd06.prod.outlook.com (2603:10b6:208:23d::12)
 by CYXPR10MB7899.namprd10.prod.outlook.com (2603:10b6:930:df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 11:52:08 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::6) by MN2PR06CA0007.outlook.office365.com
 (2603:10b6:208:23d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 11:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 11:52:07 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 06:52:07 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 06:52:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 06:52:07 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QBq7XT815577;
	Tue, 26 May 2026 06:52:07 -0500
From: Nishanth Menon <nm@ti.com>
To: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, "Thomas Richard (TI)"
	<thomas.richard@bootlin.com>
CC: Nishanth Menon <nm@ti.com>, Gregory CLEMENT <gregory.clement@bootlin.com>,
	<richard.genoud@bootlin.com>, Udit Kumar <u-kumar1@ti.com>, Abhash Kumar
	<a-kumar2@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Kendall Willis
	<k-willis@ti.com>
Subject: Re: [PATCH v9 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode for Jacinto family
Date: Tue, 26 May 2026 06:52:06 -0500
Message-ID: <177979630821.2038855.1091375399579983370.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260519-ti-sci-jacinto-s2r-restore-irq-v9-0-c550a8ae0f31@bootlin.com>
References: <20260519-ti-sci-jacinto-s2r-restore-irq-v9-0-c550a8ae0f31@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|CYXPR10MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0d6627-e105-4128-b1e2-08debb1d36c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: M+E3bdHz3OBlesat3OfLqenBxuG47cp3mPhqUTSF6g4BQzrRGy9z7Yd5vCTzeEmj8e5qROvWmljNhlo24UjGT31H47orXOBxO8Z3nJRlbVBKJg1l9r87Zk82/aHSr4rl69rG5daWXY+TPjwUJGMV4Hz/1iDj6wnfqOvGwZA1a60I9cUgUfl7Imoreg2zuBs3OJfG1N9mtGgHaSDTBVCyK1wNsUBUF9WHzr4hLNU+M2MmiMTxAx37PuCN5i3rPFJWrILfaeAdJnA60ippAOlbIzy+e9p38qmaAEUQE4isCOQvyicAozibO2SqEUZ/4JEBUlT2EACg9nKWnNeo4oCTFopIMmKhGMSDge1dsaKTVlstuFuOw30/uDCVOlYLrKXpQCGWNEgz2X6GbKeAsPRyWb3F9/7Jj1+B0lx2ZNdvVsQZz3w7NzeINa7jIM+ablKgUpKqg1cQBRlU7R3D00zrfXAwXLhrtS8via5vRZVD9bgnzYBxhpLkIhOby9eFvHkkMmmaZ+/xr7DmxynBaON3K2NGTbRuqSA/N3k0wv/iqJqg2UJzRwGIQoeiiGp/Qh5QIPigMpl+JZ4//uI5uBb9JhKb0+ckHda85VgK+lbXMx5h/4MAvkFz3GxFxPtdDzJtt/MrZN5o+ijfNz3jJeTDu5biXKz8DKvZgeX/o1lgve4qBQa1GL8KO20OuEJoHNsacaYNXMcw33HU9quWFEFefDmIDzCaHkKIeK/Qeb4FpIE=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: b9fZqmeaFf1DFdoocU/zHB7XzkZJ/9Z1CVdriNCm2YLuGBchk8o0r/2/8m0h2tSJJ0UgedDvLF6exqQJM5FUvScptcF2VyTO7VFiXZXpG9n5vV18tlNsX6UB5PCg0Pkh5IFp7pQBlRNuPxWWj/2IfNb8ueoHQOLIHc+BYH2NXj/MprzvXRFekD+25GZIkGPD6NAYXDqqGKJ4NUg8irA2gfeKvXW18rVHC/oZVM/C710x5mY5ZhNSPYKQAh8cPapvhUAyuJ6GssmUXEG8Fd39WB7YMcJHK3G05Q1AjiQc+wfITtNS47+3NwB+VjWrbXXtgGmFgivibwL35KtySDze4CG6jY9l2G7jC4j6CKEqrb+wsPeMmgXma9o16R6RNg163/VjId2L8QaLFrVWTdSR/tD1wc0Z8ayBi71fB05Jhgz+SrlD8agD7g530MMa9XIU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 11:52:07.9049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0d6627-e105-4128-b1e2-08debb1d36c2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_045216_121694_D7D5FE39 
X-CRM114-Status: GOOD (  14.89  )
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

Hi Thomas Richard (TI),

On Tue, 19 May 2026 17:06:55 +0200, Thomas Richard (TI) wrote:
> This is the 9th iteration of this series. The only change is that now the
> irq_lock mutex is used unconditionally in set_irq() and free_irq(). It
> makes the code easier, and prevents coccinelle warnings.
> 
> Best Regards,
> Thomas
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/4] firmware: ti_sci: add BOARDCFG_MANAGED mode support
      commit: e9f06763b9b88cb1338ef8a3f113b0fb94d714dd
[2/4] firmware: ti_sci: add support for restoring IRQs during resume
      commit: 703b341fdd875c2d9c30a835021689e5a430a39a
[3/4] clk: keystone: sci-clk: add restore_context() operation
      commit: 3c5912373340cb79db6585f0fcd8107198d4933d
[4/4] firmware: ti_sci: add support for restoring clock context during resume
      commit: dc51f820bd32415445655aa6e3af9011b9e3e0f3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


