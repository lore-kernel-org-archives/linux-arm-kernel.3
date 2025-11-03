Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31B9CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1YXNIVu4F7PeIM/myo7/Iqc6fAs5G0bcqdkExPd5Ww=; b=SS/YEm+/z/VPnFrsubCUDvbMm1
	ZI2MQceAoIwX2ITWS3LmXWsS5BkO+dyMdW5TobzTKpOhVKZKhjBqm7PjTkfw1TVV2GW0JtXQiZf4f
	+F1qR5bBltmNxwdh2uH3a0UR94XtNAdxYhy6HqG2vWs/MaPEq1YKxmcDVtQ0TQaeM8cpX+VQYn6GZ
	U1zUhQlSeyXzJyI20a4DVxZ+p7PxicC63Q8QZP7Rxlq4waGfc3UPzAhWx6hVlSFXA6uU1SImXhgwe
	iF2gds8WiVeSOk2Invf3JvntwCjJvdP/37sB5valn09SMUPX7uEA7fr2r0DXKo8T0bWn/VfUyn1YS
	HEDKWXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwH2-0000000A6x0-0f41;
	Mon, 03 Nov 2025 15:15:12 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwGz-0000000A6vK-07d2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:15:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CT+ooJGklcHQOlGVfPXc7WmCdUklBCkIPGihW4yFZXN3BLGj3ux5EjXIWohbk0DIXmwLpbGfr0Z8A2P3ICWeI7ZyBNbwE/PQ5GpvwnT8oRLrmLi9Iw5qNvpGF+VqWyTZPqNQ08b2Udb1re/fhnuQsCGRHbuUVDwGCefKZ3xbRC95fYutG2nRAUlSiiEoFOl7fCjcuccsyxcobolJM1WJ8CixqlY9pHkuKSaJzZgn7g5okaCx3JwraH3iIT4fc3CdBru79AjtE1U3yWhpPuAAarL3lCf2xQqXUqJfTDYtVLB0FFca5AFFnbEX8kKEUJIXWAad2AM6iuKIWbDcm8Iujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1YXNIVu4F7PeIM/myo7/Iqc6fAs5G0bcqdkExPd5Ww=;
 b=J9BX8DWQKsvMpnCO6f3X1JStOCvC1wT5LCfoorjkMuNftJJ7KdcQ5FtALT9Vu/Gi0UhQC4tZiPEqIXv0zX+AnxQ0EwJrI+ncukeabPK5PEzCCr73meb5mkXMtjBOl0yAQYC0mvlWMY9L8tlh4qlouyhiirHAW6gqTpxJG78nb3wX179ukyn+GGTdPPZBpVGzDBMj+a/jU3q/wyq5iOUqsn8KrBwTpw7LZXPJIRFllB/xUIdRpENGWod0sccrBXnpyoShM6RwOJW4Xx7bQUL9Tdmeck1FhfPjcLKsXlvxmcVGZY5zLx+/HsFulJLnDgyP4VoHq1eKtr7lf2nAueIiOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1YXNIVu4F7PeIM/myo7/Iqc6fAs5G0bcqdkExPd5Ww=;
 b=fmTi+U07KC0AbsrCongZaDoFFLqxbUJZEwyAp/2tu0lH27/xrT6YOf+LwhFuc9d02FFcUZhyJID9dhglJIZlzS+ZtgSKS2f313prp1oG1nGhlBf6Yhx/Q53NaMdEQzW2OvtXa+Q+dKGljJ5+Ebzi/i2/UXompj74bQwb1PftDGA=
Received: from CYZPR20CA0009.namprd20.prod.outlook.com (2603:10b6:930:a2::20)
 by DS0PR10MB7317.namprd10.prod.outlook.com (2603:10b6:8:f8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 15:14:59 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:a2:cafe::a8) by CYZPR20CA0009.outlook.office365.com
 (2603:10b6:930:a2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 15:14:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 15:14:58 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 3 Nov
 2025 09:14:55 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 3 Nov
 2025 09:14:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 3 Nov 2025 09:14:55 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A3FEtrV325063;
	Mon, 3 Nov 2025 09:14:55 -0600
From: Nishanth Menon <nm@ti.com>
To: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	"Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
CC: Nishanth Menon <nm@ti.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, Gregory CLEMENT
	<gregory.clement@bootlin.com>, Richard Genoud <richard.genoud@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>, Prasanth Mantena <p-mantena@ti.com>, "Abhash
 Kumar" <a-kumar2@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] firmware: ti_sci: set IO Isolation only if the firmware is capable
Date: Mon, 3 Nov 2025 09:14:53 -0600
Message-ID: <176218288382.3559260.12524155435608432109.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251031-ti-sci-io-isolation-v2-1-60d826b65949@bootlin.com>
References: <20251031-ti-sci-io-isolation-v2-1-60d826b65949@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|DS0PR10MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 89da82d9-03d3-473d-688a-08de1aebc082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|34020700016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mi8vcXMzVFI5NVdjd0VmNlEyYTRDZnNOOHBKVlZicVlwY1QzUzU4bkppK3Ur?=
 =?utf-8?B?UFBBQm9sUWlYUUpuZEhvbWpwTS96aFBERXIrT3ZaUGtrQ0JZMkV4RHlKY1VM?=
 =?utf-8?B?ZXBYSXQvNmxuWXNwQTdNVk1xNGdHSThBZFJKNkRmaW1IMWcwd1RtdGQ2REdV?=
 =?utf-8?B?UTZ6V0paVldvZEQ2UDhCQkFQQXozaDJ2YlQweEl4SWhMTCt4M1NucXlOQm85?=
 =?utf-8?B?bEZRQXF5ckpHMFp2eGFxcGVLWkpHSFhVajA5SmxMRWo1MkVpd3VvZVh1TXpu?=
 =?utf-8?B?UHlTTVRtNFlDRU1NR3NVbGY0TkF3SmNLYXQ4TTB5NFl3NnFJMmZZUVNnUTZ3?=
 =?utf-8?B?K2NjdnRkbkxEaHk0dEJGcE1iT2pNNk5jckc2YTZUN0k4ODJGWW5rMVFuUkk3?=
 =?utf-8?B?cWJwejZSZTNxdzNmVlhuQW1TS2FWZnlWUTV1eDBoTWV6b0xUamw3SEc0TEsx?=
 =?utf-8?B?VFIzSDI2aWZtanVJVmFEOHk0enpWNjZMcWlqaEl2TlJCa1lNblMzK3RRdW1Y?=
 =?utf-8?B?WHFZRmgxSG1Tclo3bCtCdDh2S21EVWFvaE1tRStzTHlxVkFEdTA3MFRNeWQr?=
 =?utf-8?B?dUdxMEo2Nm9JZHZUUEpVOUdhWmFDZnJvNXBtVHpoNjlrTW54MENjN3I0a1kr?=
 =?utf-8?B?dC9lTFF5VXhkM2ovTTAwbHU4THNaR2p1RXoxSEVPQjdGUDR4YXFBYW02RGJO?=
 =?utf-8?B?YjVMbWFybVdkRVdnemI2WlRkOU9lSHFLbURpTk9BRlh5dmh6dzlKanVuT09s?=
 =?utf-8?B?RGZFa1lLZnByekVjQmxXQ1V0dkFGYXBUMDMvSWZ2Z09WYklVeEh5c3pMMTRN?=
 =?utf-8?B?eXg2bFFIN3NtdzR6SDBhRVlRaXF2TllwR1B0UzJNUWp2bXUwT3FheVQrR3B1?=
 =?utf-8?B?RS81UmVnRE1OZndJNTBvMWhHU3NSeDNEZlgxaHZYT3RlaHhYNUJvSUwxSU5U?=
 =?utf-8?B?RXVWQjBnK056TlBVbmpIcDFreHd2VlVHYXlUbkNtR1RXSDgzNmc1QnpVYmNZ?=
 =?utf-8?B?OGZqY2tSZStxZHE1ZTlKMmlVdWd1Rld3OHFudlBXSk1PMkpIeW4wVFpxamFH?=
 =?utf-8?B?M21IQ3FzMWpic3NDelY1MTJsRk9CU1ByT2grV3RkdXdJYUNIbGVudnM0d2tN?=
 =?utf-8?B?TGQwaTlpZDN3NDdqbzBrSi93ZGVUWG9aQ1Q1Rkd4c3NEbmM4eHRuYWp2dHl3?=
 =?utf-8?B?RDVpZklvd2I2YnpidFJ3NXJ3NGpqaXhuNll1MFhSRTFtUndxaGwwcEhTZW82?=
 =?utf-8?B?N0RmTkI0bnAzR0NBZVpTYjBUNG5UbU0yaEE2cTNQSUw3UENOQTBaV2xNV2F6?=
 =?utf-8?B?OGJDdnRiMVR2WGJuemU2M0ZYVUhDd0RXeTBScnVyeDZkTzREOTRBTUkwNHY4?=
 =?utf-8?B?RjdyMklNM0VWQXM1ejUxZXc5TmtQMFNJN3NhYWk2U1VCcXVUb1dhNkpQMFRJ?=
 =?utf-8?B?OGJnQkNxTkU5eDNTS1Z2KzUyY1dBMHBCRm5talhCeTI5NDVmeEp1cXkrMkh3?=
 =?utf-8?B?QjRvU0E1d0VIaUplNVd0cVRUa0xBVXpQajRKejVLTUE2cStPbUZiVmJrVXhT?=
 =?utf-8?B?NGhObWpsczlUY1lnNWtxMUlXZmVhby9WMmZlbFFrNHFsdS9xZGF3TVlKU2Np?=
 =?utf-8?B?U1hnbm9FTzJsenJqSVpIUk9EVXdMQTJVZGF5U2lOMVZXVE5WbXhEU0tBWnZm?=
 =?utf-8?B?WEpWdDk2NFUwTEk4OEhOVnhLMU9veHIwRWJBR2oyOFdtQkpOemNZWnNBQ3VD?=
 =?utf-8?B?N296SU1sbnQ0ME1Sa0cvOEQzei9Oako4bmNwNTh4aXJwTmM1VzJsZi9kRjdp?=
 =?utf-8?B?YUNoSnpNYmkrNmxxOU1tZGx3K2Z6ekRLcitodG92V3FvWllwdndmRmJNQVBl?=
 =?utf-8?B?VmE3UUl6b3p5Tmc2aThkR2s2Z3JYaHVYbmphdkpEdzVsOW12azB4TEJZUXJC?=
 =?utf-8?B?dVgyWXBkMXNvMXFyZW1JUy81a2RsVUQ2V1diOTNlNWQzYlBhVXpTNkV3d2hP?=
 =?utf-8?B?WUV3aDJHLzJQY1YrRHNUQmltN1krTXplalR1c01Ia05xUjNrTWJFU1hFM21B?=
 =?utf-8?B?Z0d6NEVkUUpwMzR2T1BRSXpabHRYNWFndlNrenRrb2hmN0wwZ1IrbVlBYU1s?=
 =?utf-8?Q?ydFA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:14:58.1704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89da82d9-03d3-473d-688a-08de1aebc082
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7317
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_071509_075974_7349DDBD 
X-CRM114-Status: GOOD (  12.66  )
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

Hi Thomas Richard (TI.com),

On Fri, 31 Oct 2025 13:44:56 +0100, Thomas Richard (TI.com) wrote:
> Prevent calling ti_sci_cmd_set_io_isolation() on firmware that does not
> support the IO_ISOLATION capability. Add the MSG_FLAG_CAPS_IO_ISOLATION
> capability flag and check it before attempting to set IO isolation during
> suspend/resume operations.
> 
> Without this check, systems with older firmware may experience undefined
> behavior or errors when entering/exiting suspend states.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] firmware: ti_sci: set IO Isolation only if the firmware is capable
      commit: 999e9bc953e321651d69556fdd5dfd178f96f128

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


