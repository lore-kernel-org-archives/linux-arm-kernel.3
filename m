Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140ADCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RFfsGAYoOvy/AlHmBfGGYsPu7cYnjwOCKNoBfcKIzI=; b=jLfK+vFfWOa6YazYBt3tHv7mU5
	kvylznLSK6VU/CWuM75jc4JVBg/w5KbBDKRpeqJhNcznOH7NeNakHddkPPbLuOX/tgw9mC1NNwqgO
	XlCW/SYUtAIpaEbV8LdCh9py3JKCCIsPkIBwoVjzQQSUEhlwE11HPdCsmyJWY15hm+TnpRcRQzKCd
	bNeLYPgwBWvGI1476ztYp4yky8BxgdxL5dQM/Nrw9my7bmpSphodT9Z2nib4ooM9oyISgYvaUzn+d
	pQbAcKgXLvGr5Er5Ff7n4sNJV8ui/h6Zx8CJDQ7eB4Uak/69QxAXt08NSHghKtv9+2hfHn4/GnWcC
	ChLWk3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqL8-00000001qof-2jKr;
	Tue, 26 May 2026 11:52:54 +0000
Received: from mail-centralusazon11011033.outbound.protection.outlook.com ([52.101.62.33] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqL6-00000001qnX-1JPE;
	Tue, 26 May 2026 11:52:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EytFJ/mpV9jAjrSR1dOdFL6OKBFvnrFqwPa9azN6CHyXPa1ncPWnqbXVxWb4i2mnWVt1VvpPMXCUr8Vp87GA/XkUCe550zclQYRwQarWOxIX++ov0DhfmKMHcIHvNYkRyec845aS3c3bqAwEVfYLPX/0DvipoGGwgEVQRxMOE7IRaNkalvNNH5NLWbZhMrdBMy/ieScdz839AEhbPJRq+/+4WT/uUIINpnGyDUFRsM7lt6x8qiu86D78CiHrIS+toQTvufbS4t2vRG4gwrj8RND4p2B6Z+GvC45y1Iqc/6JWzT6epXyRf7wRl3hkaqievE1x9J+CPpqgr256SyxEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RFfsGAYoOvy/AlHmBfGGYsPu7cYnjwOCKNoBfcKIzI=;
 b=UTfjxprArLAv26LEr1/0s8kpoZghOXacnBOSJS5qC5xCpe9OlkLS1H6Pgf3qxxtYPTYaIB5im1XxBgEqt4SSQp1r8PtMw4xKKfJAtMesR86Dg8llbH+HmoyNl6VyhZHwUiz92dqQcLc5ZHT/rLZiVFO4XR7Ww6+DSoNhJ1xfU88sFd9kbakjUqkqNfck6gM/sk9H9LEVWUrce1RZ0gMOOLqnLECU+SVccto7dgpjoLiU3nGDO+/O4thFz1nJazjdT+GblrVlN7crAKVRM2sIKdmuDgOsE5aFh4ppUMPyMVT7bR1azmAJT8mM+/new5Kw5t961FphgTGQX2NorKudnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=ew.tq-group.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RFfsGAYoOvy/AlHmBfGGYsPu7cYnjwOCKNoBfcKIzI=;
 b=NqL57GyAZbrbUv2oHS9llwzJgZHcf1wU69DjUTb3zjFi5amTIj8G+EEXlZaBd0fp2229teub8Qigm5GY69EGAsav7bQhoSiK1DbhnyRu2C9Y7d4Up+cydPcWtXCL75INdGuH57unsYmz+/9zdfhx6oksX/F2kTUo2TpKv9lzM94=
Received: from BL1PR13CA0357.namprd13.prod.outlook.com (2603:10b6:208:2c6::32)
 by CO6PR10MB5792.namprd10.prod.outlook.com (2603:10b6:303:14d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 11:52:47 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::e) by BL1PR13CA0357.outlook.office365.com
 (2603:10b6:208:2c6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 11:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 11:52:46 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 06:52:45 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 06:52:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 06:52:44 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QBqi9E816194;
	Tue, 26 May 2026 06:52:44 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
CC: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Siddharth
 Vadapalli" <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux@ew.tq-group.com>
Subject: Re: (subset) [PATCH v4 0/5] J722S SGMII support
Date: Tue, 26 May 2026 06:52:43 -0500
Message-ID: <177979634620.2039539.2170816510689676943.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1775559102.git.nora.schiffer@ew.tq-group.com>
References: <cover.1775559102.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|CO6PR10MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 757dc2b5-ea7c-46ff-4bde-08debb1d4da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|36860700016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: FCMnxqJAh0TSbVl5o3cIR0ikR9c7LEfQqvUn1goFoh9ijxqQ8Mmw6BsISnYNmZqBw35meaRGxboM45Zpomg4YY/tmyI2iZ3osDbbNiqao3fMg2b9tQLiGijjcUXWBXFdoqCbImyd1Twrw4/a+ZPRIw8x/uzaadBblggvhfcwszhLOfWnrOXbgB7KmJmB8MO4KVu17gbO8Inb0EnhFqUnaDXMaDnw8cxPBk6JactNxUx0xmifQMd1hZZADq+A2VCFOchgS70ggmhn+J6XVUhoEZrnuRKVkG33GuE1f0EzjSTnMDKGCR//Ja/muAtY6R+LP/zXHiIhA2nSUPGKwXWI9rCjIBsDU3n10ohjrrpIjemXug9KkO1KOeM8piRjAjxFeE7+b8c/pW6aw1/1tG64uc5BsZa6a6GUiJCDt7Z53lzP8K+PMcytSzEAiTMS3n6bqh2BS+KEaFOZ1FEB4LMrroWPKdnsy3GPgY++Ap2zyfZJ1iAgIt34WRf4esnwuf61h5o1HIhY+Pc5816ko4OUeoxxECGZNpjDyt8HO+xJxoz5G1x5hwSgCu76ropIP4FkxoBvz8caIelH90cGlVnePWjNbQFZDUXQ9yGMtftUZpKi9HvKgCcbgFZwMMhXRn5bC18c1TN/qcOAW9xSKirXifjFStAHQkIg/yFk8Q2dEW4gNSRFIZIV1YKRWPBkoc+97ywXREweSdA+9gK7RL1LboaoxDAwnzDy7EHAJdfsulU=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: F3xQi+zeBSP0Jxb9B1mJCAIeRhIV7I1lWljsIfSuC7tk0F1FuyGcs0wPJKqYozDQZ1qkXqEnxGf60zfUJf3XXkFUMueBBpRyUoiRfk5X5A4Y2FGYqi+PSD3OAnM5cuKcZ4fn3LK4M8CaegdjHQfIFeSp2ds82TwHdTdiI4WciQ6tFf+adHHq/UH9P8NBDpGhUWm6by+SPdEqzPrmENgc5d4qPq9ChWBQMhYGkEa006dFxodbjnKb9eqGbaXTnh0esNRRiXw5aJwxvEyKhZycYgZWMs0Mvm38Ss451/DErlK4yO/W+5yKtxtLbtO670FbTmrFPs1hmT06fJ2UMjqT6zknCmDonYc9Ih4uBxHJdWgtPq/XMGyuZAif7dWNeR5kQD1nfo2+AVr65ThLoEqvXPUoV876VghSA/sQ+UuMpjdXXmIUtxigyXxF4KTmRG2F
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 11:52:46.2835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 757dc2b5-ea7c-46ff-4bde-08debb1d4da1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_045252_354614_4E80CC0C 
X-CRM114-Status: GOOD (  15.29  )
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

Hi Nora Schiffer,

On Tue, 07 Apr 2026 13:42:32 +0200, Nora Schiffer wrote:
> The J722S CPSW and SERDES are very similar to the variants found on the
> AM64, but they additionally support SGMII. Introduce new compatible
> strings for the J722S to add this support to the drivers.
> 
> This is a prerequisite for the Single-Pair Ethernet interface of the
> TQ-Systems MBa67xx baseboard for the TQMa67xx SoM, which will be
> submitted separately.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[5/5] arm64: dts: ti: k3-j722s-main: use J722S compatibles for WIZ, gmii-sel and CPSW3G
      commit: 2bdc0ea4e7304f6aa7e87089609fd902d9de7a2d

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


