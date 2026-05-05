Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435ACFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XV1iwyr6wC3DUGaHqRVCz74DIqhqLDlzJnusaSTflFk=; b=f+3Sayxbo2bz2JNWDQEWtAkDZ5
	OYiD9+m1rXdGYnhnx9AvIQ/9WRhbeQXunJS2JtX9TXvOVhSXZG7xXR1z0wQCqnAXEUwurB5nh3o1v
	3tpVDgzcQ003WVHFB4AMqpI8+M2cm7+kppF1LoOT5Fpn26v/yjJRSgFVoa3hqFfmc2mWHI1CyYvBr
	XZOnGKZAHBcyDe72PcRQPFYDxSNVyosMBN7bA8hzuzNLINlENlGH08c2rVR1BY7g5To3vZZBU+0jz
	IOvBiCbtu9FchVAUEfUm94X/BSDx83bhfFrnnEOF3OS3baTgUpTS82Ql5L9MTe9WZXij5cIXyATVb
	cANCkV8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGKe-0000000GPqb-2hsn;
	Tue, 05 May 2026 14:01:04 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGKc-0000000GPpP-2Ff1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:01:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldGOYhw+ZCremK+Qyf0UTgXea2SPSbPVh+KTVU4fjwfmD8zwIRIb9yELFmwVYiVFPySRn6+LwlqEL+BcD0N2jRASh1wxsIs4DZz78z1xSKg46pAz4FeRF76cNXJALhlnoHr1xt1cjkmlbLEzBI5w9rH8e4vjOyG7H09jCFTetEFZtp08be9RnrCzv9WfI4MeJmyM/3Jyyllzef1UhjUQxjoGP0Gk0T7l/UQ2T+GdfHfBYD7hjkTZLK+LVqFqnNknIwRCTKPTCRXUi2847q2ZN7AAlHOsHMYbJJ6HD+YKPJxGGvVAunDdtetNq7axTrmH9Rr3smo9vC2pZFZAG7yj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XV1iwyr6wC3DUGaHqRVCz74DIqhqLDlzJnusaSTflFk=;
 b=wr7WpfJE3ugKiaqbV4y2J7unNlv+UAcXXHivwyaAFXBuQFo4ypg0NSaMZNfFxqqHqHAcwdD6R/H6muQ59G9EzdrC3wOaoPfvAFKtToeQ87YooC414mUcXWQI+L0RziwQDTRXQAioGMbzUVW7JD0tOtDHHjTMlDDw/tRH0dzRuYjX8QbG354OGmvAaUh0RC4/B9Qf69jEOHeEmUhFrKV+aenlZgyDGGMTdf6cLvneHmFn30kFkk06WB42LQt5a6Mt128yKO2hh99Gw53QEtvSXkdeGZn9wSXnuC4wr4M9ZZBp4oUJUTa4S6PK0Hylmhane9oJOzUumGrQS8isTZuAxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XV1iwyr6wC3DUGaHqRVCz74DIqhqLDlzJnusaSTflFk=;
 b=P8RFPQUTQ6tYsna0nUVDCs0AN+ZOspOrrYEAgydOdqtZCCLkJRQOpcGnw0SEpuFEi/EmarYyPi/LSOaR3ysVoAWWlsHFUtyTfrWfAAyF8/Z1wrYfRUhHUAmp5CA45uO0h/SEHTqLEwXKJxSo++cXM3oVQ+26pAXQHNmnXgAC6qg=
Received: from SJ0PR03CA0148.namprd03.prod.outlook.com (2603:10b6:a03:33c::33)
 by IA4PR10MB8519.namprd10.prod.outlook.com (2603:10b6:208:55f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 14:00:58 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::16) by SJ0PR03CA0148.outlook.office365.com
 (2603:10b6:a03:33c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 14:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 14:00:56 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:00:48 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:00:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 09:00:47 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645E0l0e3391058;
	Tue, 5 May 2026 09:00:47 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Add bootph-all tag to vqmmc
Date: Tue, 5 May 2026 09:00:45 -0500
Message-ID: <177798963982.336682.2277023026704390547.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260324140247.1200631-1-jm@ti.com>
References: <20260324140247.1200631-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|IA4PR10MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: c094ecd0-d8be-4f40-3536-08deaaaebaaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: AlW0y6nAwlaCTc2AP6VUAcdhM4lasfapTrqHe8AMxpDWMDZJuvQdsOgkku5029ac/DmU81q1o+Q1uz1k41jP0DO0ts1z0bY8l6NJI2/eUHxWcRpf8KcFOZvfktBrG9n7Wmu+dxHBdvVWVGlTOhADVKFuwhSBEWBkN10+rp6j7cWOn1ctx2GLecXNU6c50ieVOVcDSaYdREg9dLZWBOEg9GYg/XuDI2y2kc4X8db3dbC4+sLWQMwWtOhDuvn1fpswQb5Ih200bMM8LH4/JiWGvvtrCUF+H9wYk8ZYqJnGjmJRtabwUAeI771G9xBthildpZGRSF4/wOnTWBHEtrTWVmeOZHuRLv/EXwZdIrK21ooKoc7IIU1TZ0k+Oq3JcJ9tOrvltPeM30Zo8m268Jg4kuxXGdSUVXhCpTUAAcWrUUZrAbaRIuHgpYAkfZRDeciJKIC+HqhzOyxPQP0IcKvjE2Q5npRRgrAQogbmQfrNy4rz/RmR7huUjHgM/x6ZrPI5WEYaEcglmAkneAP3NuKgDR1zCNwGW6y/UjTd81mxfeBs9OQkg4KskSwWwQKS4Pphccd8Q01MhVEvZxjfjhlcxe8HGJ2CWexn45I68kR2LxzF0oYCWME63oZ42DRb0oxQJJP0do6MnmG3Bwk3gJfTk6yCDbI2vKd9SE+jnGH5iAv3+VylRCYV+P+Ht4q7gZ0Qe4nw5vW+XxmXXCNk6xxFQ62Qd8mtlLBXtfWk1+h+3qo=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NyjYVkIDvLzVxjmvF5eAhVhgeLhXhjvVWAFdc770Fq2Ln6wWVcdZD19jfRTS2JCvtEnMbwmTszjvKvIF4BAOJkbNDFx6Dkzx++WO2PdgfNION1Y8orrUertCSfGuzl7DgESBYuY46Uft05SrTsmxiox+S6aPrIQLhfMbbPJjA4B8nH1Amp2yMh293n0zvleBj9kNXGAr0bfxm6q9WxPjtes9nz/JOIrfSoqdbY7G9H6GOc5Y6EiF6MuvgDz5wrTbXMjRDZWBOOPfeAWFSx0p8lcARRLQI+gpa59x2xaSoK/ahLFfRXd5suWFKUr1SC1KQ6VTGOQnhAh2JiDpW03kKoADqaz5vnwPRIPiXnVNQDCuPUkTbdMMP4F49jPUXBWWvpyrtZo3MfeR3y5r8PNYMjQd9ovI7QP0h8YpR0/Zu28Wdg/fAjXMT2CYua95AGWg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:00:56.4996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c094ecd0-d8be-4f40-3536-08deaaaebaaf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_070102_576923_1FB5A47F 
X-CRM114-Status: GOOD (  12.12  )
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

Hi Judith Mendez,

On Tue, 24 Mar 2026 09:02:47 -0500, Judith Mendez wrote:
> Add bootph-all property to vqmmc voltage regulator node and its
> corresponding pinmux node to make it available during all boot
> phases. This allows to run tuning early in SPL stages of boot.

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62a7-sk: Add bootph-all tag to vqmmc
      commit: d8fe8442366ffd8306575028bda92389d0dfb674

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


