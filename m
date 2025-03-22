Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864E7C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLqANp4ef6QYH2nVJ/MdJHoobmsJVSv2KjmPtdMWdds=; b=Z3JYXSLYblTF7Kuy+W1TKL0wIW
	h9qzIXCfJUM2rwOv+cvf69Pm3uybmE8oWXddNr2RUa9eF1ce+3wU+R8ngpXQwWQBotY+3D3gtKe0I
	kaIG1L6KuFUeyWakVwi8pWZv3Uu/7ia4gMvmBjZtbmCnyhOQE1eE4T+OwWrgu7QT7Uwl02S1B93pj
	sZUHgUnZYI/V+WwkWkmTfpiPRlIGftKCG9WL/Qu5dauF6CNgYk8vgFJ1oa9FpsZ3ohk+eqF6b7WFP
	7vb1+nST7pmXlXIQcCVdRoU9oR61jhY28OXn/sD0VZMhpt5oCsMoCHFvIjrkINI70NnyBV5y7br2p
	mYWPcMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvzKt-0000000HTJ9-2V1w;
	Sat, 22 Mar 2025 13:56:27 +0000
Received: from mail-vi1eur05on2061d.outbound.protection.outlook.com ([2a01:111:f403:2613::61d] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvzJB-0000000HT5p-3rEX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 13:54:44 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DlnKHK6iOwwn5pbPr4rbmmvqCxko+3TYME/bZ00sNY1qLuybGWWCvUF0GFFUA8qYVwjXN0s1l48802oxog3s8YqbOaH8MoJOFh1g9b8MfVMMtRf4h2QI07FjjGYIZknLQ4lM5lSGC4zS6TzUfWx2h3UEm4o8kUWscjkFINNhxrYaPnKduFtONUUG7WKfiJmV9dcsejsgVO4A80XxIVdVBYs2Os/J4O+iXoKonTqw0ev48GvVPZk/cKT6spBBnq6+ifJUnD82Ygu/Iapo5bXuhCJyAxDKpPSPPK2oBYhBInG7rapkL6Bl97Fld0bvzjGHVj1LthSVvqhwSYChdPWBKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLqANp4ef6QYH2nVJ/MdJHoobmsJVSv2KjmPtdMWdds=;
 b=eMlDASUlqrIm2WdbNjjBUq8FCm2aXHCNxhzTUIYzhBtS3fCxDWKwF/cMkEqCAyXORWoSIgaawTdrtumYZktFOifN2zjl/LcuX58oTGlpgInkbOqJ9Q14rsV5CQNyOaKQlklgcNp4nW2ysKnz280VZhCMwi8etiIg0ygkr7w/f5/v8fTWTPvERxanRyHdC+A5ii/W8Wdp+1TwT5M4CU0nk62vJImPcAI50A77Ls93l4WSNO04VJ5y8pOysA+2rQG4+uzh5o8X2bPqlvPhAdMi/9v2JnAp7BRu8KQQxQ3vBxLzQd6OyxRQoR3Rb1Q8H+g2NNRX0G2vcQTKb9u13hHzBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLqANp4ef6QYH2nVJ/MdJHoobmsJVSv2KjmPtdMWdds=;
 b=mP5W1oGwZN2j5XDG6QXGaApH1e2bykyPGX9XbMrFAk6XNB8NyZi4sh5PfjKpV+X2KiuUpGqSn02o0pS5BbrzQcx+F1OGMGkIbxtgdWk5jPzsMR0YtUzlHx9Era6Q1P/+GLRQ/SpvtWTndmCiAKnwGtfS9teg8mo6yu4mhdHa+Rg=
Received: from AS9PR06CA0105.eurprd06.prod.outlook.com (2603:10a6:20b:465::27)
 by AM8PR08MB5665.eurprd08.prod.outlook.com (2603:10a6:20b:1da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.37; Sat, 22 Mar
 2025 13:54:30 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:465:cafe::4d) by AS9PR06CA0105.outlook.office365.com
 (2603:10a6:20b:465::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Sat,
 22 Mar 2025 13:54:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Sat, 22 Mar 2025 13:54:28 +0000
Received: ("Tessian outbound 79edf4140b33:v597"); Sat, 22 Mar 2025 13:54:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f197257e67d43246
X-TessianGatewayMetadata: FQimT0uNdnrxc3SEn67aUEzPihdgyH0tCWnmK0jbQojZDKYKBf61BC3GrpraIdRM8JI98LQAiGvzN6BX9TXl4sz1s8ikwvcS/6zU+kqjxNePTEZ1gYFXPV2RdcLKMP0qd0IkXq1fVsbplOT9RBWXJ0Mw24ubCzwWAudpmRtjn3MoEd7XJUPrOoiaLP/benosr/CR4LAc3OO7BdZMXHDpCg==
X-CR-MTA-TID: 64aa7808
Received: from L2e4e36ce01ff.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 259975D4-04E2-460A-A360-D6761CA52D46.1;
	Sat, 22 Mar 2025 13:54:21 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L2e4e36ce01ff.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Sat, 22 Mar 2025 13:54:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1m+kzWl3H6I8pRtsqeyOKWC4fmQJhxr9QsWqD5/uUgrVXewo3V4htoZohBabuOkpZNvoCFyhswaKpD4d+x/kO7azDO6x3Geb5OyY7PO1LLzbnSIcNZYNO11dafnWC6qWWzgHSYz/iARDKa3zXxJv97znq8be0FvHQRMtxI3feG2QKtEkiy3hJpwXus0QjdtGdDfCbUAwUNxoYJleODYqrZIX7YjjCG7FPTqzk3iKERdbLVFHEdsrc5O814/2DEFOYLV7RZpX08RlGYtO2yI3A8sUirN0embL6yDi4qzWOqbZNVAWplAZQLI6Oo6Okx4oNUqgl9HLPVweIlNpcy9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLqANp4ef6QYH2nVJ/MdJHoobmsJVSv2KjmPtdMWdds=;
 b=rVi1E3A727wcsBP1paL6kUid6yW7bbE7wn+qZ+KKQQLZYzyj8H2UyX4k/L6+UQcmzRwupVY//Yiq70wpOGlgSx7O42P8odML5pnMq9/bgRbi32lUS4C1ng/TfOptwbIKDPvXSUd4FwC0OZgLOb4i7YwW1zqOwUfI1/Kt2l2PzIAwtauO7/aOFBXUvfOHr8e/BE4XMOYKAU777jIdSH8NoDLsV+ENDYbQD5Hy+gEJKV7SQQ6gv7UwqEmNNfnxp17oXIU4Ue/kFJ2MeXuxYW2seEi/z6aKk5oBdVKQROV7HKzBplo+kHRiEnCfmu+vLnDLD7ls7kuDFtHZGkBylQbSQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLqANp4ef6QYH2nVJ/MdJHoobmsJVSv2KjmPtdMWdds=;
 b=mP5W1oGwZN2j5XDG6QXGaApH1e2bykyPGX9XbMrFAk6XNB8NyZi4sh5PfjKpV+X2KiuUpGqSn02o0pS5BbrzQcx+F1OGMGkIbxtgdWk5jPzsMR0YtUzlHx9Era6Q1P/+GLRQ/SpvtWTndmCiAKnwGtfS9teg8mo6yu4mhdHa+Rg=
Received: from GV2PR08MB9206.eurprd08.prod.outlook.com (2603:10a6:150:d5::6)
 by PAWPR08MB9121.eurprd08.prod.outlook.com (2603:10a6:102:331::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.40; Sat, 22 Mar
 2025 13:54:19 +0000
Received: from GV2PR08MB9206.eurprd08.prod.outlook.com
 ([fe80::d431:f1c3:a2b9:5162]) by GV2PR08MB9206.eurprd08.prod.outlook.com
 ([fe80::d431:f1c3:a2b9:5162%5]) with mapi id 15.20.8534.036; Sat, 22 Mar 2025
 13:54:18 +0000
From: Justin He <Justin.He@arm.com>
To: Marc Zyngier <maz@kernel.org>
CC: Oliver Upton <oliver.upton@linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Colton Lewis
	<coltonlewis@google.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, Zenghui Yu
	<yuzenghui@huawei.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will
 Deacon <will@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] KVM: arm64: pmu: Avoid initializing KVM PMU when KVM is
 not initialised
Thread-Topic: [PATCH] KVM: arm64: pmu: Avoid initializing KVM PMU when KVM is
 not initialised
Thread-Index: AQHbmt23+1t6e59BE0a5Mo9Hw6bOt7N+7sYAgAA5YWA=
Date: Sat, 22 Mar 2025 13:54:17 +0000
Message-ID: <GV2PR08MB920679CA30617D465B69D79DF7DA2@GV2PR08MB9206.eurprd08.prod.outlook.com>
References: <20250322035115.118048-1-justin.he@arm.com>
 <867c4hml8v.wl-maz@kernel.org>
In-Reply-To: <867c4hml8v.wl-maz@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV2PR08MB9206:EE_|PAWPR08MB9121:EE_|AM4PEPF00027A60:EE_|AM8PR08MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3188f9-a5a5-4706-d594-08dd69491090
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?YVFCbFRIWW5LVmtQVFlyRDFrT242ZTBVd0lZUlBVTWFpb3oremlQUmh2bzFI?=
 =?utf-8?B?S2h4bldTVVNtTTVYYS9yRklCZllPcXlnc20rd3RJbTdxQkg3djlwMVljUmdO?=
 =?utf-8?B?WTBYMkQwTmxqRXZ5ekFMQkxNQlJlR0hEa0FqVVVJUEhucldXa1JySDRlaU9M?=
 =?utf-8?B?ZDZKVDVCZWhvekQ4TU4rNlpiYW5lcytuZXJYVEs5SlFuNlkzcnZYY2wwdnI1?=
 =?utf-8?B?TTB3c1lObzlRaXJDSEVvaU9nZCtiWUpwZlBMbUpuQ1dRY1JENEthdWVRbzdp?=
 =?utf-8?B?a05jT3NpRHZsblFrZC9rM0NKeUpHTlBWUWNLY3oyVWh2Z0RVeHU0bW4zZkE0?=
 =?utf-8?B?TjBoZThpOEo5T1lFSVhQdDNrQWRKRzA0ak1kM01SeDRqUDRGamppdXc2eXgz?=
 =?utf-8?B?YTFPV3ZidUZJVGFXaXFyR2FiM1Q0ck11WVkwUmpLaFUydnRuVmxrUUtGc1VW?=
 =?utf-8?B?OTl3RzZ4QVNoNVk5QnUyRVVoNHYyOVRQR1p6d0FuSzM5WXZza0xSUnRxRXRp?=
 =?utf-8?B?S1F0UE5HSHR4ZWpiMlZ4S2NWNXpXV3FLekp4dGtlQU1YcCtCb3M5YTBHcEN1?=
 =?utf-8?B?SVloYlZkWUZlYlh1MnE2Q2VMNy9Ub0VRbWlaRWwvOVZLc2FqYmtYYys3OUIy?=
 =?utf-8?B?c0dwajdFTFNjckZIdDFtelN4T2xtL1lzdEVHcGVrcjgrb3B4OXpXb3Vuak1y?=
 =?utf-8?B?WWZYTE5KZ1FoYUFuRTc2S3hWWnBuSC94K25KWHF6em9uOEloZDhqUmd0WFg4?=
 =?utf-8?B?UitLeFhSbGh4ejdKalBmYVpqOVNHWEgxNDY5Uis2WlFldmpHRW5hbFEyUmp0?=
 =?utf-8?B?ZXdwVFlXdWZiRmRWdnRiTzFnTDJxcUFWV2ExaUYrSHJuZmJtVDN2dG00bWxi?=
 =?utf-8?B?cjBPak9ZL3pONkVSalY4OTVmd1ZnVlp1c00rSVZnYk52MDB0MEJLVmJNTk12?=
 =?utf-8?B?MDMreU5yT2JwdGJTWDhuWW9FNndUUExSQzhkZ3BCYUtRaDhjc0ZadlJITmdQ?=
 =?utf-8?B?T1JxQnlHcC8ybDczU1hJWEhXUG0vWkJzTmxqS1lzQjhkMmNuWVpDR3BjTEs1?=
 =?utf-8?B?d3dqL1piMjNSZlpHVkdUQldZUVNIc21VVkgvNnZOaFpSM3RaeTg0VWdNUllr?=
 =?utf-8?B?STQrRVpFb2FldDdGREZaaWZXTUdETzBwak9BNWQ1V3pkcTBvK2pNdmFRdExD?=
 =?utf-8?B?d3RrZWdzeGJZYXYwOGhnbGx1Ym84OWRYeHNVclNhMVdIZXhSbzZ0dUpOYlVB?=
 =?utf-8?B?bzB0VFFsTmc3RHZXZXlNQlZmM0dXSnlJS2pUQ2srbFBTUVZiZndNSjhlRTJq?=
 =?utf-8?B?S2I0VDNNWHhWc2EycmwveEFteFE3RjU3MmpaazFHSExYenhLMGVqdTl1TmpI?=
 =?utf-8?B?Ym5LZi84R3pIUzkxSnZzUU80WTBxckdNSXZ0RmRZL01tOUwrOVNHajJMSE1M?=
 =?utf-8?B?THVKOVh3TnJ1cjJmUFJKbXJqT1ZuUVhSaGM4RUhCYStYZDhkVlVJbjJRdmdr?=
 =?utf-8?B?SVpUd2FMcmVYSzB2WWhtVy9oY3hPd2VUTnhqOSswSk5HVGxVWFdrRXZaWG11?=
 =?utf-8?B?SEFoMzMyYlB4Zm5zSDgxaG4rRDNUdVE4MkJCWXRsdE5oamhCaEpPNWNacndO?=
 =?utf-8?B?amVOYzJZbVltVHVibnIvdGdZcktqamlOazRSbmFVWE5sM0ZXaTY1MFNxczNV?=
 =?utf-8?B?bEt0ZU1FU3VVUGFvYm9QcVlmYzJWNjY0YWhwcThOQUlYQ0NuSmJVWVNacFo1?=
 =?utf-8?B?b29NL1M2QUVOMzJ4ZXVUMmFFUFNXVTQxUURXU3VjUk5lNkZubnBjdk9tQ1V0?=
 =?utf-8?B?Qm5rTStMNDA3SThWTWNKVDlISWJ0c3ViamJDcjA2cVlLRXVxc2hpWjhueWl1?=
 =?utf-8?B?aUpvek15L3N2cnN2U3BiOEtUc294dVErVkFSNlhDS2g4ajhTa2E3MjNzYi9y?=
 =?utf-8?Q?mWNr57KhrO/znRDx0f4saCm79wgeOgFX?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB9206.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9121
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:d5::6];domain=GV2PR08MB9206.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 89e5ac36-7c5e-4eb3-7f16-08dd694909f5
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|36860700013|35042699022|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXdJa2EyWTd3cldyZWYwUTlQcHcvYXJNUjVKOHZvZ29qT21ZcGsreVlCVzRJ?=
 =?utf-8?B?eGJOMFlaVVdEU09UWUVVUWpJUy9VYTMwNXk2ZFBNM3Y0VWJKRWpzRiszVUJn?=
 =?utf-8?B?MWRIRnV2MjlFUjRSd3B2aENEWEZrbzNCNFNLR0tyOFZQckhkNEN2bzMzdzlX?=
 =?utf-8?B?QmFIVXYyK28xdlFXRzlQMFBZSXJVN2Nma3JVNHgwc2d3bE1FM2kvUGxPbFZH?=
 =?utf-8?B?TXEveXlBVk16QWI0S1dYYmkwSC82cHNjc2lDUDJYRHZtckZteWxBajE2NGk5?=
 =?utf-8?B?aUNLVjFDcE4yczZ0eWJ4LzVpc3VKK0owSkpMVTl5L05aN2lYbEgxa0dlMG93?=
 =?utf-8?B?Z0ZIM0lpTEFxazFCWW9yT09ieUVBYU5DMEZqMStOTEZYejE5UUZHbTliUnhG?=
 =?utf-8?B?V1VCelpjMWdoc2NnamtWTGp0MXlQNUVyb3lRemhsOHc5NExDMkxPa2hYaURC?=
 =?utf-8?B?empEVGlIQVV1TE91emV4NGIydGxHR2NNS0hOT2NuMDUwS2dodDhlR1plYVh3?=
 =?utf-8?B?eUE4WDkvNk91ajFCcUdUL1RiaTJLcHhNejh4ai85aUttQUhtNTAwUnMzNWJZ?=
 =?utf-8?B?dElaREJrUFBFcWVnVTJkVnFzVzNHRTRFbzh5SnB3Qk1WNklwaTNXdFFPa0h1?=
 =?utf-8?B?NHpUeDFCTTBsV2NrWW5kbnNxVC93UGlmZmc5czZ3VkY0SkczVnUwTURUa2x6?=
 =?utf-8?B?UVZPVW1nM2FwakFUUkFFVjNQek9paGlwbEtCRERPZ0VPWDNxQ04vTVdOWm9v?=
 =?utf-8?B?SHZlZDQyaE1uSzBablRLbXZEUVhwcHlkZEJMN2M2MFZvNFZmUkdPNnRvTlN1?=
 =?utf-8?B?U1VPdWF0eXFGWkl6bjVXazRlNDJhbFYxYmwwODVObTczYUVTSDNGSVc4bHZJ?=
 =?utf-8?B?Z0JxTWJjdjJNbGZsRzA5MktlejVUdCthVXlBcEJlTEhmSTE3YWVPdmI0c0kx?=
 =?utf-8?B?RHgzVythcTBXMlJJc3AvcTZyZWNZN29xRXlubkxzRzJOWEpjYmJ6WmNwQVU3?=
 =?utf-8?B?TWV5Y2NZZGdDbVV6ZUt3R0FaQ2pWck0rWDhoMVRwQ3FuZ1hFVWZ2T2RhNWsy?=
 =?utf-8?B?N040UFpEbUQvVjR1Mnc4NG1PWlQ5YXY4ekh2Wm1JcDhBSHBzUVlyUlc2R0Rw?=
 =?utf-8?B?OWU4TUdQZC9YM3VRV3FFU29QTzU4Z0lGVTB2M0lTY2ovMmVRMnJPTWduZ2E5?=
 =?utf-8?B?YlJyL1BnUVZ4WUhnZnZjY1VTU1ZtcmJMYVBvR3hRblhBZ2Z0NUFVQ1U1cE5w?=
 =?utf-8?B?ZkhTWjJxa1dDZkVabUZ0V3dEdk1JWXJvTHJkSnArTVNsZExvcGtjS0dUN3J5?=
 =?utf-8?B?VHMzS3hadWM5TXlPeWJEcGZNd3E2dVNSWStqdXczeHZjOUJTelRjeHZDSFIr?=
 =?utf-8?B?UVlUTEFEa1RhaGUycHcrVllQR3R2ckwzcVdUNjRjOEp1MjFlcmkyUndVZ21G?=
 =?utf-8?B?akVGWHFrZFpmbVNqT2ZlN0kvcS8raVh1eGNpV2Vtdi9weGxRMjhaeWQzTTcz?=
 =?utf-8?B?bnRLbTVGaXNtZC9BVEplbExUaDN4cVg2WkM5NXJ6Q1Z3TWY4a1FPWHRGWi9w?=
 =?utf-8?B?S0p2ZlZHV0ExZGZHcG5ISmhqdExUdXU3Z2pHRVo0bExEU3YvSDgxckpIZnlh?=
 =?utf-8?B?OHZxNFVNVDJNS2NlME5hSENzUnd1aGxDRGdaTHdOaUlSMWppd1Z2WTUxWFVt?=
 =?utf-8?B?aGhrS1AwakIyVTZ2cnpKVzA2NXpDWkZiWk1Xd2lVZkFscEhCdDU0VEFDZzc0?=
 =?utf-8?B?dzBYb1ZPWDZEWE4vV2xuUGNBTXpHWnlHaDJtODFsMDlEMEJGN3dQa2UvWXh4?=
 =?utf-8?B?MzhxQlR1MlNjYllCVGt0bjFSWUZJM2Q1NGI4UWZNMjBMd1RaTCtrRGZuSXQ5?=
 =?utf-8?B?dU9QbU92ck1wQ25oazVKR1FhNlpSSTNCNjJySVZ2cUFqWnBLM0E4WU5KVVZl?=
 =?utf-8?B?VFAvc2ptUURMVGc4eHZaQURtdE5QMWlQcnUxS2g0Rm1XSU5EbVhELzZ2UXhT?=
 =?utf-8?Q?HDIUcLG2n81C8nA01z3X8fNfXHM8e8=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(35042699022)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2025 13:54:28.7153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3188f9-a5a5-4706-d594-08dd69491090
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_065442_312390_5359E473 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
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

SGkgTWFyYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJjIFp5
bmdpZXIgPG1hekBrZXJuZWwub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgTWFyY2ggMjIsIDIwMjUg
NjowOCBQTQ0KPiBUbzogSnVzdGluIEhlIDxKdXN0aW4uSGVAYXJtLmNvbT4NCj4gQ2M6IE9saXZl
ciBVcHRvbiA8b2xpdmVyLnVwdG9uQGxpbnV4LmRldj47IGxpbnV4LWFybS0NCj4ga2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmc7IGt2bWFybUBsaXN0cy5saW51eC5kZXY7IEpvZXkgR291bHkNCj4g
PEpvZXkuR291bHlAYXJtLmNvbT47IFN1enVraSBQb3Vsb3NlIDxTdXp1a2kuUG91bG9zZUBhcm0u
Y29tPjsNCj4gWmVuZ2h1aSBZdSA8eXV6ZW5naHVpQGh1YXdlaS5jb20+OyBDYXRhbGluIE1hcmlu
YXMNCj4gPENhdGFsaW4uTWFyaW5hc0Bhcm0uY29tPjsgV2lsbCBEZWFjb24gPHdpbGxAa2VybmVs
Lm9yZz47IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIEtWTTogYXJtNjQ6IHBtdTogQXZvaWQgaW5pdGlhbGl6aW5nIEtWTSBQTVUgd2hlbg0K
PiBLVk0gaXMgbm90IGluaXRpYWxpc2VkDQo+IA0KPiBPbiBTYXQsIDIyIE1hciAyMDI1IDAzOjUx
OjE1ICswMDAwLA0KPiBKaWEgSGUgPGp1c3Rpbi5oZUBhcm0uY29tPiB3cm90ZToNCj4gPg0KPiA+
IEN1cnJlbnRseSwgYGt2bV9ob3N0X3BtdV9pbml0KClgIGRvZXMgbm90IGNoZWNrIGlmIEtWTSBo
YXMgYmVlbg0KPiA+IHN1Y2Nlc3NmdWxseSBpbml0aWFsaXplZCBiZWZvcmUgcHJvY2VlZGluZy4g
VGhpcyBjYW4gbGVhZCB0bw0KPiA+IHVuaW50ZW5kZWQgYmVoYXZpb3IgaWYgdGhlIGZ1bmN0aW9u
IGlzIGNhbGxlZCBpbiBhbiBlbnZpcm9ubWVudCB3aGVyZQ0KPiA+IEtWTSBpcyBub3QNCj4gDQo+
IFdoaWNoIHVuaW50ZW5kZWQgYmVoYXZpb3VyPyBPdGhlciB0aGFuIHRoZSBwb2ludGxlc3MgYWxs
b2NhdGlvbiBvZiBhIHRpbnkNCj4gYW1vdW50IG9mIG1lbW9yeT8gRG9lcyBhbnl0aGluZyByZWFs
bHkgZ28gd3Jvbmc/DQo+IA0KU29ycnkgZm9yIHRoZSBjb25mdXNpb24gLS0tIEkgc2hvdWxkIGV4
cGxhaW4gbW9yZSBjbGVhcmx5Lg0KSSBub3RpY2VkIHRoZSB1c2FnZSBvZiBob3N0X2RhdGFfcHRy
IGluIENvbHRvbiBMZXdpcydzIFJGQyBwYXRjaCBbMV0uIEFmdGVyDQphcHBseWluZyB0aGUgcGF0
Y2gsIHRoZSBndWVzdCBWTSBmYWlscyB0byBib290LlVwb24gaW52ZXN0aWdhdGluZyB0aGUgcm9v
dA0KY2F1c2UsIEkgZm91bmQgdGhhdCBob3N0X2RhdGFfcHRyIGNhbiB0cmlnZ2VyIGEga2VybmVs
IHBhbmljIGlmIEtWTSBpcyBub3QNCmluaXRpYWxpemVkLg0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2t2bS9wYXRjaC8yMDI1MDIxMzE4MDMxNy4zMjA1Mjg1LTYt
Y29sdG9ubGV3aXNAZ29vZ2xlLmNvbS8NCj4gPiBhdmFpbGFibGUsIGUuZy4sIGtlcm5lbCBpcyBs
YW5kZWQgaW4gRUwxLg0KPiANCj4gcy9sYW5kZWQgaW4vYm9vdGVkIGZyb20vDQo+IA0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogSmlhIEhlIDxqdXN0aW4uaGVAYXJtLmNvbT4NCj4gPiAtLS0NCj4g
PiAgYXJjaC9hcm02NC9rdm0vcG11LmMgfCA3ICsrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva3ZtL3Bt
dS5jIGIvYXJjaC9hcm02NC9rdm0vcG11LmMgaW5kZXgNCj4gPiA3MTY5YzFhMjRkZDYuLmUzOWM0
OGQxMmI4MSAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L2t2bS9wbXUuYw0KPiA+ICsrKyBi
L2FyY2gvYXJtNjQva3ZtL3BtdS5jDQo+ID4gQEAgLTIyNyw2ICsyMjcsMTMgQEAgdm9pZCBrdm1f
aG9zdF9wbXVfaW5pdChzdHJ1Y3QgYXJtX3BtdSAqcG11KQ0KPiANCj4gSHVoOg0KPiANCj4gbWF6
QHZhbGxleS1naXJsOn4vaG90LXBvb3AvYXJtLXBsYXRmb3JtcyQgZ2l0IGdyZXAgLWwga3ZtX2hv
c3RfcG11X2luaXQNCj4gYXJjaC9hcm02NC9rdm0vcG11LWVtdWwuYyBkcml2ZXJzL3BlcmYvYXJt
X3BtdS5jDQo+IGluY2x1ZGUvbGludXgvcGVyZi9hcm1fcG11LmgNCj4gDQo+IEFtdXNpbmdseSwg
YXJjaC9hcm02NC9rdm0vcG11LmMgaXMgbm93aGVyZSB0byBiZSBzZWVuIGluIHRoaXMgbGlzdC4N
Cj4gSSBoYXZlIG5vIGlkZWEgd2hhdCB0aGlzIHBhdGNoIGFwcGxpZXMgdG8sIGJ1dCB0aGF0J3Mg
bmVpdGhlciA2LjEzLCB0aGUgY3VycmVudA0KPiB1cHN0cmVhbSwgbm9yIGt2bWFybS9uZXh0Lg0K
U29ycnkgZm9yIHRoZSBtaXN0YWtlLCB0aGUgcGF0Y2ggaXMgYmFzZWQgb24gQ29sdG9uIExld2lz
J3Mgc2VyaWVzLg0KSeKAmWxsIG5lZWQgdG8gcmVzcGluIGl0IGlmIHlvdSdyZSBpbnRlcmVzdGVk
IGluIHRoZSBmaXgg8J+Yig0KDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCBhcm1fcG11X2VudHJ5ICpl
bnRyeTsNCj4gPg0KPiA+ICsJLyoNCj4gPiArCSAqIFByZXZlbnQgdW5pbnRlbmRlZCBiZWhhdmlv
ciB3aGVyZSBLVk0gaXMgbm90IGF2YWlsYWJsZSBvciBub3QNCj4gPiArCSAqIHN1Y2Nlc3NmdWxs
eSBpbml0aWFsaXNlZCwgZS5nLiwga2VybmVsIGlzIGxhbmRlZCBpbiBFTDEuDQo+IA0KPiBTYW1l
IGNvbW1lbnQgaGVyZS4NCj4gDQo+ID4gKwkgKi8NCj4gPiArCWlmICghaXNfa3ZtX2FybV9pbml0
aWFsaXNlZCgpKQ0KPiANCj4gVGhpcyBpcyBkZWZpbml0ZWx5IHRoZSB3cm9uZyB0aGluZyB0byBj
aGVjayBmb3IsIGFzIGl0IHJlbGllcyBvbiB0aGUgcHJvYmUNCj4gb3JkZXJpbmcgYmV0d2VlbiB0
aGUgUE1VIGRyaXZlcnMgYW5kIEtWTS4gUmVseWluZyBvbiB0aGF0IGlzIG5vdA0KPiBhY2NlcHRh
YmxlLg0KPiANCkluZGVlZCwgd291bGQgaXNfaHlwX21vZGVfYXZhaWxhYmxlKCkgYmUgYSBwcm9w
ZXIgcmVwbGFjZW1lbnQgZm9yDQppc19rdm1fYXJtX2luaXRpYWxpc2VkKCkgaGVyZT8NCk9yIHNo
b3VsZCB3ZSBhZGQgYSBwcmV2ZW50aW9uIGNvbmRpdGlvbiBpbiBob3N0X2RhdGFfcHRyIGluc3Rl
YWQ/DQoNCj4gSWYgeW91J3JlIHdvcnJpZWQgYWJvdXQgYSBrZXJuZWwgYm9vdGVkIGF0IEVMMSwg
dGhlbiBjaGVjayBmb3IgdGhhdC4NCj4gDQoNCi0tLSANCkNoZWVycywNCkp1c3RpbiBIZShKaWEg
SGUpDQoNCg0K

