Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12327E6F089
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rx1H4nwEM4BU3MfVZ1wJHIxBpKl5b6QPhO7I+AWiVlg=; b=WZ4r9HJgpBv7TjIXcMnsE6E/8w
	OTREXhminnjVRf5ejbzOz838ea5iUVKITJp2wVdqKOd2r4HRRC/wU51OexsY7ShqPxH+AuKAtHCK2
	Wx/E8XeXLBL1iMb9PfnMiAjyNsRO2m2x3hJRxiLbL4XCM9W11fsSRWLSc2jk/VWlDhdbbj7PogrNB
	ixCVdyTalIV4O4LsuzupMzlkdH0Fys5YRshvGIRGholr89bWZZD48lNK+HKaUOJRtZMfxbyi/WAay
	aNHlUjFqYKIWEWaEAFjBTqqo+ZFsrc4dSnfXam2wyCMhjheoW4bGAnjYA1taaZLOAbspOFqu4zGlf
	X2XB1lkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1CU-0000000FObK-36pB;
	Tue, 23 Dec 2025 12:09:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY172-0000000FHhn-2Igh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 23 Dec 2025 12:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Rx1H4nwEM4BU3MfVZ1wJHIxBpKl5b6QPhO7I+AWiVlg=; b=bfwXacCJ5LZw+jBpqDYYIMrI7N
	NWLixOheUdUhHuA7NS3y0AvWaCtQtpvS0ROH+m5vQ973lnZiRxPIYRqRl17/5WPnzZZvPoBaM8qd4
	b+sVDrLqrfO1ERq96GjQZtN6mBPEmyLmWz5dfwvNqNb0TkLqL10c3/DTMDJYVOM0bc/pWt2uV+4XX
	jA3Bedzc9jA3DjgVnX2XiDL0tXvUknTRQUnrbrP2y5ayqKEUjpUmY/yn7mNrlM5lcdhhViMDTEFst
	XLZzggVMff9/kvXNbPtvBmwA7C04060epZZeIDf9vgewNzErxyXnm6kGzzNYtwMjvKvAiG+VFjIBg
	x8ocO6TA==;
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0FW-0000000GgaP-3wq8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 11:08:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnHTudPQFlSJv1XZRbWee/dxa5N7iEF/tyIbJjBFxUrEFrBuO2+7alAQOd6srSHLU6PLip9Ho22fQBaXrb7b34eB+SVXfbrwVZMwOi49mbJzrH5X+Nzt+oGHxlkOhiR2OdEWhOBqOM47BbnY6cjNtl3gSAYLmcgJn7SnJVZd1Vprw37zUqy0huGU9WnLEyC48rsMjZzAOmvPmYQvprCM8UtcshUbS6q8SRhxg7aLW8Qctf5aPF9+Ql8SUEhfWnf7vtW+XYFjMbGbvf2JUO0bSTTN5GakLxBH6PQILQhJJzLwJ550o28z+IGGfoe7hkyK3jDFrbLEBGLXeLWtMQCHHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rx1H4nwEM4BU3MfVZ1wJHIxBpKl5b6QPhO7I+AWiVlg=;
 b=YHrb+AGdx7B5aXgND8xQZBbVORJC7Dh3gfwFN/3TLuRlU70WlESoR65zkNgva83i2VRvjxa7/6LCSeabGusOUsRUgXXA2/8glpBLGh5Yh5fBkfYbsd/pXjhBmG++7KaaJsMwjVdZJAlldo+nNiIe4Z+Pv+LdnuSKtA4vV7yfDowV5Xz97CYw+TFmiPh1Z+7EFGbrU2GQ0qh1GCHlcrL18UuoaJ1gkmbw5CL2MNfT/7ejl/U4hw/7Ph280XW+lMem+/LUb09HLb/PtSew6A6RtqslDMdweYfWIIyIDtesb8m6PKbCie8W1aMa+wF6watpFyy/ZKD6WZzONiGztKzuKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rx1H4nwEM4BU3MfVZ1wJHIxBpKl5b6QPhO7I+AWiVlg=;
 b=ZtidVaicr2PK5OXmYaT7VDIoWyNvABbvU/fYixJQOu4o6aDm8YBPewDbbuyA/16+L2Sdomv7uv+gf3nJG367FMCRKcWtDjaDyobxeXzPdGKSHSHEFGFxg524hPiSjLqN/wB7PUyAblgSQJPQqIfKTj6RH2ZVYsX5KGTi47gBzxM=
Received: from BLAPR05CA0006.namprd05.prod.outlook.com (2603:10b6:208:36e::9)
 by MW5PR10MB5737.namprd10.prod.outlook.com (2603:10b6:303:190::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 12:02:56 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::83) by BLAPR05CA0006.outlook.office365.com
 (2603:10b6:208:36e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.11 via Frontend Transport; Tue,
 23 Dec 2025 12:02:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Tue, 23 Dec 2025 12:02:52 +0000
Received: from DFLE20.ent.ti.com (10.64.6.57) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 06:02:51 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 06:02:51 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Dec 2025 06:02:51 -0600
Received: from [172.24.233.14] (shark.dhcp.ti.com [172.24.233.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BNC2lip3073701;
	Tue, 23 Dec 2025 06:02:47 -0600
Message-ID: <e547db61-1ce3-4b55-948d-28d3257d68ba@ti.com>
Date: Tue, 23 Dec 2025 17:32:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] clk: Support spread spectrum and use it in
 clk-scmi
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Brian Masney <bmasney@redhat.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Peng Fan <peng.fan@nxp.com>
References: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
Content-Language: en-US
From: Sebin Francis <sebin.francis@ti.com>
In-Reply-To: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|MW5PR10MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: 6629e175-bc81-4ba0-db39-08de421b3396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWpMVXdLLzlZVXFTQU1QUkYvM1p2c3lFdHRzS0tKWmgzNDhTNDRIYVdBL2Zi?=
 =?utf-8?B?a1MxS3libnE2ekhTSHBqczFjRDJ5enVRTXNZUWtDRDcxM2hEUUtOcVdLbktq?=
 =?utf-8?B?bURheXFxT25UZ25jRXlaVC9vN0dua3Q3WkNqOVlTbTBMVURmNUNNK0p4S2c4?=
 =?utf-8?B?SEhnTkVxejRpOXpOOEFVOUwyZ3V4bkpqVXl6VXNHN3JQS0l5RkZLenR0NStS?=
 =?utf-8?B?TkVWYlBDSFJrMlBMQ2ZJYlhwdUdvWkVGR1Fycy9GS0NwcEJHM1ZPWXhhdVlj?=
 =?utf-8?B?MGt1M3B2OW9jUzJtaTZOQkNGN0xiQ1pULzFxQzJKUGlUQTN4UHNBdWhTSUx3?=
 =?utf-8?B?dkZrYnFoUDBiN2RmQmtvRG43MWhBNkpjZStpemZwK0c4a3RVWGlLaFp0NXd6?=
 =?utf-8?B?bHB4Mlg4V1RBRkVWUkJ0dFZmQzdReUNFT2p4ZlllZ0lFT2FGempSODMyeWVx?=
 =?utf-8?B?cjNDQ1oyTUtuOEdvdVdzbGJET3lUZWdIakJjUjhCQ250ODN5K2hEZFdtWWxY?=
 =?utf-8?B?OUFMVFdpcDBDVytXV1ZOUnJ6OXZVWTZyWWpPKzBqcGJVYXdJZ0pXTkZiN0Vt?=
 =?utf-8?B?dHN5TVFycG5TNk9OZ3R6SzIxNyszcEJ2VE1IUE1FeGdrMXluNmNDMlNqM1Qw?=
 =?utf-8?B?anJCYTZZejRFR3pZVHRXQkNEYk9FM3YzcGFWVWtYS3ZYTkNoK29yUytLeSto?=
 =?utf-8?B?dURvak1sZkI0WGh4NnpwelR6NnNyeDFEcmJwNDk5clFkdnFNRzJibFRtQmdn?=
 =?utf-8?B?ODUrZ2dJdnFnQmNRamJlMGs2SlNQaU83VU9TZHppZm9hYm1vZWRWZXI0Rnl6?=
 =?utf-8?B?NXkwaTZrdzRTU1c0ckYxWSttdGgwdlVNWEpiOFVXRHoyaDcxZVJ6ZW5ZaU5D?=
 =?utf-8?B?ZFVoT25zdk9Jdm1FNHJDUDZ3Mm5OSERKUmVtRFJ5NkVnMzBDYUtmZThQdm5r?=
 =?utf-8?B?dFdDakJsRUc3cnlxdVV5NlNMTVZ6T0gzZjJGQjNCczVZOE11QnliajMrbEtw?=
 =?utf-8?B?NEtCOWhxZDIvcWt1a2hDY2VHMmRMalVFek0ydHRMMVZpZ0lpbTNaK1ZaTlQy?=
 =?utf-8?B?TDFmUEQ3cjNWUkNmS1BZN1dzbDVFZjVwQWg2Ym8vNkt2R3RpdU9zVnlrNHpk?=
 =?utf-8?B?cGx2a1V1T1J3eTRBQzlTVE05bjZKWVZVSGZvbW0vaGo1RVpoZEUzZ2lMYlJq?=
 =?utf-8?B?TEUybU5vdVlreVFBUEZGNlozRU1kOGlyNWVxNEhsYkhTS2p3ZzRFTXlnQUNx?=
 =?utf-8?B?MEk4RGdhbmZKSGo4UWtsQTg2QVJSc0VYMkpFUktDbU04Q0dHRzNWb3dhdGds?=
 =?utf-8?B?b2VqcC81VHp0eFBkdVg4bTJIR1Fub3JqUWI2VTAySWNXdnQ1S1YxdkRFcmZq?=
 =?utf-8?B?ck1ucEZPc3kwWnlVK3gwdGc0VkIyTlY3Yno3d2cxaCs3UUtyM25OcVlWam1N?=
 =?utf-8?B?dis0bzYrbDBNbUFHWjUyQ3VVck8wV256S3pqSTllQkZueTFrWnVOSndwREtj?=
 =?utf-8?B?WlZLQmc0YTZjVStoeWZMVUhIUlRPNW9uVkh0NElQdVJ4d3BNaFVoeEd4T0Iw?=
 =?utf-8?B?ei9oNEpOSVIxYnp6N3I0M3JaR3hoNGZUaVhyd3hYaEFPUkt0ZlNuTzBJVGNs?=
 =?utf-8?B?b25LWWRGTmZsamhQK3NpY3F5cG9pVjhjQ2ovdmtHZzN1NUZBcC9wZVQ4QU9T?=
 =?utf-8?B?clc5UUlUR0xBbnNjSmFjN3kzK2MrWG1FeXFOeTdkS1BEL0FreVdJcURUT3JE?=
 =?utf-8?B?UElnWkd0bEhjWjZoNkY2aWt4WjJLa2VOYTIwRG96enZPWVAxdFNtejdzNi82?=
 =?utf-8?B?RnRjMmd5OEE2NWZBQzMvbFUwZkhES1JDN0E2MEU3SEZ4QXRxNXJYRlJCb2U0?=
 =?utf-8?B?cTJDRnUyZUI4Tk1ZZlhsRGhmNzI1R3RmVjVBRThzUCtsN1NvbjF2Z2VOT2Z6?=
 =?utf-8?B?YVdFaVhvSmpJVUpEOWE4eWdoK0tqWXdsVHVxMVc0anVJcXJCeTU1L1c0Vlpz?=
 =?utf-8?B?TWlkNkp4UWtoSnZjSFIrZWhBdlQrbHJCeE5mUi9odmtsT1crNDhJWEw4YlJM?=
 =?utf-8?B?b2VWZE5SOU9QWHRjVGU2U3FndkkrTVJUdFdLaTdkQTMrdEFqYnN5WmcvcjFu?=
 =?utf-8?Q?3QSk=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 12:02:52.9093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6629e175-bc81-4ba0-db39-08de421b3396
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5737
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_110819_103926_FD2ED0C7 
X-CRM114-Status: GOOD (  13.81  )
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

Hi Peng,

On 28/11/25 08:44, Peng Fan (OSS) wrote:
> Since the assigned-clock-sscs property [1] has been accepted into the device
> tree schema, we can now support it in the Linux clock driver. Therefore,
> I've picked up the previously submitted work [2] titled "clk: Support
> spread spectrum and use it in clk-pll144x and clk-scmi."
> As more than six months have passed since [2] was posted, I’m treating this
> patchset as a new submission rather than a v3.
> 
> - Introduce clk_set_spread_spectrum to set the parameters for enabling
>    spread spectrum of a clock.
> - Parse 'assigned-clock-sscs' and configure it by default before using the
>    clock. This property is parsed before parsing clock rate.
> - Enable this feature for clk-scmi on i.MX95.
> 
> Because SCMI spec will not include spread spectrum as a standard
> extension, we still need to use NXP i.MX OEM extension.
> 
> [1] https://github.com/devicetree-org/dt-schema/pull/154
> [2] https://lore.kernel.org/all/20250205-clk-ssc-v2-0-fa73083caa92@nxp.com/
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Thanks for incorporating the changes, The changes looks good to me!

Reviewed-by: Sebin Francis <sebin.francis@ti.com>

---

Thanks
Sebin

