Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15071C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 17:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/EWlzPxEmZ+XPAtKsQO8KkLB/epvSgbnHytQQbKTgQ=; b=eRC7Yghyaak7SoEq+7gwjmSpzv
	d1UnLdXIF4vkZpgLZpMh1xr4klTDrKHmD/EFs/b3gJY20P8OnK+CcEKWMrgtODNbFdWIjxkO3qfjJ
	o6P/HS9gDjEhlGvEqYziW1XWeto7zSXJId/+QzWzzB4iU8OQ81/fO+xFikY+RIc0971/8iQnH+wup
	duFS4NfE6j7v1EkbEMtrU8kXrd67fZTd1W4LNBzdgrVNBJoxVHWLKqseWeSBmi3v1EaAvGHJbBBFH
	i/t4qNMbgWQcy4cMu6sZ+VZ2MCLUVYvOL1m1yfD66JoHxY3JBhQeE9qzFqF/tMU+Mr6/EB5Kl2VCa
	KJ04601g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3UN-00000006Thz-2KPF;
	Tue, 11 Mar 2025 17:33:59 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3JT-00000006RlT-2weO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 17:22:46 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=h3REOC7vqOJvrBNJUx9uequQOUiJdzcupPzI5wYbDg8V8P9DnzkWRugUyDzWpt9qNzhsEKRed23TitlTOkG8oonz5uaF9lknb0q53f3yJHtkhPopM4krBWDIB8zQLJRprjJbK6/b3Vb1NgAYKTG19QgI58Gwi3GBjzNCkJLTXtBSgxsjIajB0xZbOdXBMvknViwAaq1jWcDUcuZDqYJPU3/MaO8/cFVZkNK6bJR+Mr0V7nZO3FknxlyQwqTaTQXZEwbvywqSZQnNIGISEUN3SFqJDMwYR23E41lTGeCxQrXhXvkDnsEffO11nzqT5f3Np2eZqO8adNIukJa3LpFGOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/EWlzPxEmZ+XPAtKsQO8KkLB/epvSgbnHytQQbKTgQ=;
 b=LRG3LX0kRcafZBiBm5wti7a+2HjAP2EpwzmbBnZw1zgH5qKNHZQtWsFI2TsCycWHX8q09S9CrprgJjlZ+4lzpqSARHyHkLD2yyuvuQCfVXSe03tCbrCtTAbEqedcGtPJm/JI587n0hqWVOy89cbmHHLEIOnn4b/XF8eBm/X7LV9gUIYtbJu5rQasVTHqrxtkvxR4m+rBg2EX2xiSz5vwBZqNatmYsYSKdUOzJ/otmBR/WuR0KWRd1P1umaJEQntezwuRI0kX4ip7eTzTTv+ZPO4O1Eb4USO4/WcWSoK8nvWTBsQ/J7IyyRKMyz6WgN0vsMQnQN4KVkGjk1ChmW2MHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/EWlzPxEmZ+XPAtKsQO8KkLB/epvSgbnHytQQbKTgQ=;
 b=PJuFF1/+G7al/LPt/D3Cu81XwyWV7mmvGL0clHSd1AMxt4cB0um20MHcQf1pHfph8iVq3fKnVKQMMnIaFFgSa2K3JSHCvNtimfVPAXROTJLdkc2gls6Wo2fbGdayb33GgHEJALkXDz2EmSfyST69k9Mn8GOaYVM1oaS6p+LpVs4=
Received: from AM0PR06CA0108.eurprd06.prod.outlook.com (2603:10a6:208:fa::49)
 by GV1PR08MB10599.eurprd08.prod.outlook.com (2603:10a6:150:16c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 17:22:32 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:208:fa:cafe::ce) by AM0PR06CA0108.outlook.office365.com
 (2603:10a6:208:fa::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Tue,
 11 Mar 2025 17:22:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Tue, 11 Mar 2025 17:22:32 +0000
Received: ("Tessian outbound 68993334049c:v585"); Tue, 11 Mar 2025 17:22:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 737ca804d36e7538
X-TessianGatewayMetadata: cOF+z0F8RnSHKQxzdsuBj/82xEp7zPJWDEtnL9nTCbqrJkUBdGAb/XI72JFYFJOUuMtAxa32iqdwoDnH2LqIDRufhx9zcy2NOaM6EtMpWyW8xs7O4jTycBPwzOCLaENvmp4VsZ4k0B7XTkl6fvsV10VmP5Fh1Zn7GZ2cRfX6eF0=
X-CR-MTA-TID: 64aa7808
Received: from L1f4ba46f39e8.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F957370B-573F-4FB1-A00D-9AE40A654341.1;
	Tue, 11 Mar 2025 17:22:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L1f4ba46f39e8.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 11 Mar 2025 17:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4vsFmCspgAB5itN7LrybpzgIwXYhVqJTMKLLfJyCD7ZzZEYPQMxTPMwtGwkeuiz9we3IMR9abuNRyjMULjm0K7bQFAZfXEclNW0RgbiJ6FBElltlQjKVbCPJzk4M2WLU26BdGKEqpHzbjG79kazgr8ADCqKiA3minkB8leXd/e4Ke88eBAlsMsRPvHjpcO3bhK/1v3B+QXYrhdqCFmf6JErb6juHvUwWlK+Yr76PhvozNWRnKKBWcrKCvpmpyytmRNHkUDdKeaJ7ZO/TDADd77HETWyDSP2nVulYAcIXtgdrvEitwlrw7WxaS46d/+SXm7UwdWoA5C2t8Vrb5DFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/EWlzPxEmZ+XPAtKsQO8KkLB/epvSgbnHytQQbKTgQ=;
 b=TDzi93oMRdT2y+nlwjLTXW4l3HyjRWzIB0yEbddh+12aD/Bt9XXRCKWEWCR65F4uJv5H7peyCC11ooM2T+oXU87tHK+FuXZfP2UWhitpGS9BLKdoyoLI429v3OA1V8BM5CUYCIk7W63MfMITOfvvd9CSa8I1j2yrGXny1W+9V8ZxTeyQ2d3rPsMI5Q4wwrUbxPgs/YKhGPYymzyjMjcNoUGfbh5L2yujXg/qUvPrWeKYvL9zsaWnvePsILBqTNPdPk7OQe2UjDlW4NFCBAb4izpGkx97nx71xSt15K4FV8C5Bz0bzSkot7eD32jTGry0IAcaoDnvkPC/6yYSICjUoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/EWlzPxEmZ+XPAtKsQO8KkLB/epvSgbnHytQQbKTgQ=;
 b=PJuFF1/+G7al/LPt/D3Cu81XwyWV7mmvGL0clHSd1AMxt4cB0um20MHcQf1pHfph8iVq3fKnVKQMMnIaFFgSa2K3JSHCvNtimfVPAXROTJLdkc2gls6Wo2fbGdayb33GgHEJALkXDz2EmSfyST69k9Mn8GOaYVM1oaS6p+LpVs4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7584.eurprd08.prod.outlook.com (2603:10a6:10:308::6)
 by AS2PR08MB8479.eurprd08.prod.outlook.com (2603:10a6:20b:55d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 17:22:21 +0000
Received: from DB9PR08MB7584.eurprd08.prod.outlook.com
 ([fe80::5144:343:7017:bacb]) by DB9PR08MB7584.eurprd08.prod.outlook.com
 ([fe80::5144:343:7017:bacb%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 17:22:21 +0000
Message-ID: <431a5acb-4906-4095-8dec-b2d824adaac6@arm.com>
Date: Tue, 11 Mar 2025 17:22:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] perf: Allow adding fixed random jitter to the
 alternate sampling period
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 irogers@google.com, ben.gainey@arm.com, deepak.surti@arm.com,
 ak@linux.intel.com, will@kernel.org, james.clark@arm.com,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250307202247.648633-1-mark.barnett@arm.com>
 <20250307202247.648633-4-mark.barnett@arm.com>
 <20250311113128.GD19424@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Mark Barnett <mark.barnett@arm.com>
In-Reply-To: <20250311113128.GD19424@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0500.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::19) To DB9PR08MB7584.eurprd08.prod.outlook.com
 (2603:10a6:10:308::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB7584:EE_|AS2PR08MB8479:EE_|AMS1EPF0000003F:EE_|GV1PR08MB10599:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc547c9-b903-413b-ca8a-08dd60c14ea6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?a3lBWHhJV21xVEc5aS85UVIzQjZ0TTNzcVphRm5EWFpaZmhKQUVCNElJZ0xt?=
 =?utf-8?B?REJKNEdWc21zdkgxRHBpUXlmVXRvMWdKUzhBU3VWQllPa0RaOTdydGJ3dlhL?=
 =?utf-8?B?Ylh1U2VBVk1MR0NyaDJBWmRnQWdzWjBVVHdTNFFkcUVsVmt6aDdJSTJLdGFR?=
 =?utf-8?B?VzdyNWcyaU9kQmhwVnNmeEdYNjBFQ3BZWWt5aDBsUkQ3TTdLNkwvZ2lNd1Rz?=
 =?utf-8?B?QkkvTmNaWVR1c2FhZDBDZzhFU2ZvN25vVzdpM0J1dUNGYXVNT01FNzA1L045?=
 =?utf-8?B?djVhc1I3MFh5NjZuQ08wb3dTdXRyaHVnUzdaMjVCUnBjeG1vTnBOSjhjK21i?=
 =?utf-8?B?cmhiUkl6eVk2TEpvMGZmdVYyUGVwYW1PU1dzME41MmwreDFkZ2g2dXhxeC9U?=
 =?utf-8?B?SHRTbzcrcTRMcy9XRTNxVWhPNlBsUG1FdnJJeEVLZURIcUd6TE1vNG10UWxy?=
 =?utf-8?B?ZE45UWxmL2tvQXFLaHJ4ZUFYWGFJLzF2cE44QlUvdHZoeDhpL01xQnlvK1E0?=
 =?utf-8?B?ZFRPd0xoV2xSWFZDL01xUFFHK3cxQ1dlZ0FtRDJGamtWaXNXSENzd2c0bS9p?=
 =?utf-8?B?NUJGS2l5b1dWWnh0NWlncWpmOXZLSkw0Y3lTbkQ2c0NiSkFrUE12eEdJUUR3?=
 =?utf-8?B?SHVkMk9yZkRocXhmU2UrQUFBWUNTK2dVVUEvdFI1SG5mKzBCd0ZGMnJFMWll?=
 =?utf-8?B?V0pIWlU3U3FEVndpR04yN2RMY2FlR0M2dmRVYXJwZ2Jpc0d1S2dORVdwd3kx?=
 =?utf-8?B?RFVzb1Z0ZjFzeHo2MzZGQitrN21sdjNvTS96bFhqOE9CYjRmcnZnaElaOTE3?=
 =?utf-8?B?MUhBOG05MHRQQStIZDA1cEZ6ek8xdHQrN2d2RlZmeEMvRko0NGtsd3U3bTds?=
 =?utf-8?B?NUsxeWNOT0JyRitMZHBObmd4Nko5cUhwR01CS1RNa2lRMy91WUg3WU95WXNr?=
 =?utf-8?B?MkZTbWlwS1hidjYrVlUzdVh4MjJpN2w2c0RncXhYdThzQXhqN25pVXlqeDVU?=
 =?utf-8?B?Z2kxMm02dVJEbXFTdjdDb3Z1Q1k0RXlWQ2VKMnpBVWFudUJNbS9Eeng0Y1d6?=
 =?utf-8?B?L3JDbE9GT0RUdjRSQlZXb1dWUTVyc1k2Um9iWnlqc3Y2Z1dSYVkzTURscVV4?=
 =?utf-8?B?VXVtUnQxWFNaNlJoUGxsMUhvemNaQzNLclhsN2FoL3ZNVEI4SkhQQmFnU3dI?=
 =?utf-8?B?UzQ5ZDBYVHljOEJhTk16TW1weFNBdVQ1UjZRMTA0ZTZoREZPbzNNak1VOUFK?=
 =?utf-8?B?WDdsOUk3azZwaXl6K2ZDaXh4Q2ZFekRMSXhaWG9sUXpyTGpiczlHcUJNNmxm?=
 =?utf-8?B?eXJDajN4RlppLysxWXRERmczYnFYNWxHL21EVDdpZWRHb2h4SmY4bmVoZ3JD?=
 =?utf-8?B?OWZ6YzlETlFjQlMyampqYWhqbTRObmlnb3Mzb0M1MzNBK2Vsb3hTZGkvLzRI?=
 =?utf-8?B?Vzh2TVZYdDNXMjdFeHFiYW5xVHJPeFcyMXdrRlFUYzRzQ081Z0JMTFNFSmJa?=
 =?utf-8?B?YkVwUXFKTUhGN3ZBeVVJOHA3b1F5WFRSOXNyL2dOdFhxYmh1OWpvQXhycXVE?=
 =?utf-8?B?Y3RQd2x4MDQ0bWdRWFR4b1ZWejRBcUQrL1R2VmUvanl0SzQrQnRvY2VDZDl4?=
 =?utf-8?B?ZEVyYVFpeGlsLzlSak5uOWsxc2cwVkhjZUxDbllaMGxQL2RQVitMcDEwZCti?=
 =?utf-8?B?S0ltcWxJcGJUN3V4clJXcG9Zak9IOWlINHVKbFY0Q25Rd0Y1dldKcFNsdlZj?=
 =?utf-8?B?bnJUWHBaYVhUcmNsYXN6d1djMFU0L0w1clRXenhwRS9OcGd6cDhFRy85NWdK?=
 =?utf-8?B?N1FWcVdYZnVWTndsaXJ4aVhHSFFLS29YQjVFT1hsVU1NS3JHakZsTmZqRmtn?=
 =?utf-8?Q?CvD7gx98VRPdx?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7584.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8479
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:308::6];domain=DB9PR08MB7584.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e95392fa-3331-4c62-c556-08dd60c147f2
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|14060799003|36860700013|35042699022|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3V5TzdTUE1rbURYOEZXRzdJb3lnYjRSMDVuRXcvR2l4cVlWZ3RYb29Jckp0?=
 =?utf-8?B?OXBDOFluTmhpdHNjR3NKWkN5c1JtQWJlS2FDUVFxRWxTcTlFUFUvSkJ4OHRN?=
 =?utf-8?B?RElwOHExV21jY2hCUGhySmxrQ2xyRXNuNjR2NmxUdHdjMkFKcVgydHQwWEdC?=
 =?utf-8?B?OUZlaG5rYzcvNHpSRy8zeHdreC9pdUg2WlpWZGI0QUlrUXJGWHN1cUVxaVR5?=
 =?utf-8?B?cGI0cWdyTng5T0JiUTBCQlBwZkxYVjFNOUc3WDhLRExWVEp1K1daMFFVeU5E?=
 =?utf-8?B?d3NvVDcvUDF4aXVCbGxZVThGRXNtOU5hcVRraDMxUW80bkRDRnF0azJPSVBw?=
 =?utf-8?B?bUdzVFhXTE1PV1VTTCtnd2MrdEt4TmYza1NFSmpBSFpDTUZrUmxjNHdndEpN?=
 =?utf-8?B?N0t6RWZwK1ZyRDMvV0xya0VtS3pLdk5qWlM3OC9oU1J1OWY2UHl6NVRrTWVB?=
 =?utf-8?B?bEZTZnIxSCtXSUxrelRpRXZRTi82bFBDaDhVQWRDT0Z6S2lXc0tjNEdzMEgw?=
 =?utf-8?B?RUdMU3BLRjd6NVFZQzBhSk5CelVaSktkcFZNQjJCa3ZjT2lWV1d4d01EUllt?=
 =?utf-8?B?SGpYZkJsbzlqaEZpTTB1SituMXVsUGh1V0dFR2YzMUhRTHZyVDV0NXhFcnpP?=
 =?utf-8?B?QkNqTGNvMkQ5Ukl4d3BUYnpwd0E4Rk9tQ2RCZ3hHVy9rOW93ZDN6bThCdGwz?=
 =?utf-8?B?djdxOERNRW1wYUY4M0srY1Z2NnJjUCt4TWlVMUFkYmVMMnlWWDd3QkZsVi83?=
 =?utf-8?B?c2d0SXhlU0tuZHo1ZDNGelBraUxpMzZCOTRJNUdiOEUrWi9iVkZSZHNGWDlE?=
 =?utf-8?B?S2VQZ3l5UmExSWxkTEVRNnZwWTVpY0E0dnoxL0tqRDd4SE9tWG1PYVA1ZXVY?=
 =?utf-8?B?ZFY3VHFDN2tqdDVLWnJLVWNqdU1scTJDMUZycDR3OFBQU0thekhaTDRrWjA1?=
 =?utf-8?B?cXFVY2hCQTJqVDgvMHBvQm0zWEY3SlQ0Y2pZZlNneVJ3TjRqTjk0L1ZEY2tR?=
 =?utf-8?B?eGhxLy9iSlg4ajJSb2pLRHFVRGh3Q3NCekVkYzdESktZc05Ib3lPeGozdUVN?=
 =?utf-8?B?b2czNm1LMUswRW5CaG1tekZWa2Q2OStMZnhiNXZhRmF2cjNXY2JTMVYvakZP?=
 =?utf-8?B?Z3RUVFUrR3VnWXo0RVg4dkx4QVZzL1g3VGpURjM1TWwwb2RTU2ZxTlk2b0g2?=
 =?utf-8?B?dTFMOS9sN212RE0xY0NSOG1kWjFYS3NuTmV3bjZaVlBETENNSy9GNEhrUWpV?=
 =?utf-8?B?Qk05Qm5qRFJOWEsvVFRZcUZRaEk3RkIyUUI5QUZaQU43WG0raUQxN3A3bDhS?=
 =?utf-8?B?UVJ5UDMrQTM0Y1pWb3UxNGhxQjF0Nk1PY3dVK3ByZDNMaDRyZU1XUW9GNHFZ?=
 =?utf-8?B?YmM0dy8wdFEwYmpaSHNMSUF4UERkVlgzWEVySHN2enFVWmpOdmMyc3RUdmVV?=
 =?utf-8?B?V3M1YzF5cUxkc1dyM2IvTFVVWlRBMVBMQnRsYkxLYkxKRThzZGs2MFhNWWxC?=
 =?utf-8?B?V3JmWDdqczA3cjcrVmJzL1hmYjdQSEMyNVdLaFZEL0RJY3B3UFVjaHUva2VP?=
 =?utf-8?B?b2k4MVgwWVp5bVpWbkRyNi9oUldCOW5RR3AwcWNmNFZQVmV4MnQ4aVJFbTVW?=
 =?utf-8?B?NlhMMHRwYTJURHBNNGlhYmhmNms4YThGV2FBbm5MRzloTEc0amdaZHhkOStq?=
 =?utf-8?B?UWFBR2NEQklHZnp2aGhFWVpnOTVXUzg2a3hQWit2NFpONDRHS2I5akhRWDFm?=
 =?utf-8?B?TzZNcm55VG02d082Y3RldCsrL2hJNVUrZHFWeFFwOHFESm9zdUZRTUJyeDAw?=
 =?utf-8?B?Kzc0bjgyMmpYU1FZTU1QTmRkZFVyYkwxT3puR3JqSnRTUjBSbFhtMDBTV3dL?=
 =?utf-8?B?cC9ZM21UazZCT2hKVm11a20xYkhvRVhkWEFxeEcxNHI2b2w2WXpWaXVpbFNL?=
 =?utf-8?B?VHVDenczd3kvUXFveHREK3FOS2xoZ050WkQycklwY0UvVE9KOHV3L0R2ZVZI?=
 =?utf-8?Q?/DOTrMTpUqQTV3OnMXmLPFqskhZzUU=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(36860700013)(35042699022)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 17:22:32.0361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc547c9-b903-413b-ca8a-08dd60c14ea6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_102243_974871_0E899F03 
X-CRM114-Status: GOOD (  10.84  )
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

On 3/11/25 11:31, Peter Zijlstra wrote:
> On Fri, Mar 07, 2025 at 08:22:45PM +0000, mark.barnett@arm.com wrote:
>> From: Ben Gainey <ben.gainey@arm.com>
>>
>> This change modifies the core perf overflow handler, adding some small
>> random jitter to each sample period whenever an event switches between the
>> two alternate sample periods. A new flag is added to perf_event_attr to
>> opt into this behaviour.
>>
>> This change follows the discussion in [1], where it is recognized that it
>> may be possible for certain patterns of execution to end up with biased
>> results.
>>
>> [1] https://lore.kernel.org/linux-perf-users/Zc24eLqZycmIg3d2@tassilo/
>>
>> Signed-off-by: Ben Gainey <ben.gainey@arm.com>
>> Signed-off-by: Mark Barnett <mark.barnett@arm.com>
>> ---
>>   include/uapi/linux/perf_event.h | 7 ++++++-
>>   kernel/events/core.c            | 9 ++++++++-
>>   2 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
>> index 499a8673df8e..c0076ce8f80a 100644
>> --- a/include/uapi/linux/perf_event.h
>> +++ b/include/uapi/linux/perf_event.h
>> @@ -461,7 +461,12 @@ struct perf_event_attr {
>>   				inherit_thread :  1, /* children only inherit if cloned with CLONE_THREAD */
>>   				remove_on_exec :  1, /* event is removed from task on exec */
>>   				sigtrap        :  1, /* send synchronous SIGTRAP on event */
>> -				__reserved_1   : 26;
>> +				/*
>> +				 * Add a limited amount of jitter on each alternate period, where
>> +				 * the jitter is between [0, (2<<jitter_alt_period) - 1]
>> +				 */
>> +				jitter_alt_period : 3,
>> +				__reserved_1   : 23;
> 
> So; I've been thinking about this interface.
> 
> I think I prefer you keep the existing sample_period/sample_freq working
> as is and simply modulate with random and high-freq components.
> 
> A very little like so..
> 
> I've made the hf_sample_period 32bit since I figured that ought to be
> enough -- you're aiming at very short periods after all. But there's
> enough unused bits left.
> 
> So this has sample_period or sample_freq compute hwc->sample_period_base
> which is first modified with random such that the average is exactly
> sample_period_base (assuming a flat distribution).
> 
> This means that sample_period_base is still the right number to use for
> computing freq based things. Additionally, have the 'extra' interrupt
> ignored for adaptive period crud.
> 
> Also, someone needs to consider the eBPF hook and what to do with it.
> I've kept the ordering as per this series, but I suspect it's wrong and
> we want this before the BPF hook. Please think about this and explicitly
> mention this in the next series.
> 
> Anyway, very much a sketch of things, incomplete and not been near a
> compiler.
> 
> 

Thanks, Peter!

OK, I see what you mean. Packing the fields into hf_sample makes sense. 
I'll have a look at the eBPF hook and see if we need to do anything. The 
sample period is always stored in perf_sample_data so it's technically 
possible for eBPF programs to identify the high-frequency ones, but it's 
not a great API. Maybe we should have an explicit flag.

I have one question about interrupt accounting, below...

> 
> ---
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 76f4265efee9..c5dd6442e96f 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -229,6 +229,10 @@ struct hw_perf_event {
>   #define PERF_HES_UPTODATE	0x02 /* event->count up-to-date */
>   #define PERF_HES_ARCH		0x04
>   
> +#define PERF_HES_HF_ON		0x10 /* using high-fred sampling */
> +#define PERF_HES_HF_SAMPLE	0x20
> +#define PERF_HES_HF_RAND	0x40
> +
>   	int				state;
>   
>   	/*
> @@ -241,6 +245,7 @@ struct hw_perf_event {
>   	 * The period to start the next sample with.
>   	 */
>   	u64				sample_period;
> +	u64				sample_period_base;
>   
>   	union {
>   		struct { /* Sampling */
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> index 0524d541d4e3..8dbe027f93f1 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -379,6 +379,7 @@ enum perf_event_read_format {
>   #define PERF_ATTR_SIZE_VER6	120	/* add: aux_sample_size */
>   #define PERF_ATTR_SIZE_VER7	128	/* add: sig_data */
>   #define PERF_ATTR_SIZE_VER8	136	/* add: config3 */
> +#define PERF_ATTR_SIZE_VER9	144	/* add: hf_sample */
>   
>   /*
>    * Hardware event_id to monitor via a performance monitoring event:
> @@ -531,6 +532,14 @@ struct perf_event_attr {
>   	__u64	sig_data;
>   
>   	__u64	config3; /* extension of config2 */
> +	union {
> +		__u64 hf_sample;
> +		struct {
> +			__u64 hf_sample_period : 32,
> +			      hf_sample_rand   :  4,
> +			      __reserved_4     : 28;
> +		};
> +	};
>   };
>   
>   /*
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index b87a5ac42ce2..e5a93edf3b5f 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -8,6 +8,7 @@
>    *  Copyright  ©  2009 Paul Mackerras, IBM Corp. <paulus@au1.ibm.com>
>    */
>   
> +#include "linux/random.h"
>   #include <linux/fs.h>
>   #include <linux/mm.h>
>   #include <linux/cpu.h>
> @@ -55,6 +56,7 @@
>   #include <linux/pgtable.h>
>   #include <linux/buildid.h>
>   #include <linux/task_work.h>
> +#include <linux/prandom.h>
>   
>   #include "internal.h"
>   
> @@ -443,6 +445,8 @@ static cpumask_var_t perf_online_pkg_mask;
>   static cpumask_var_t perf_online_sys_mask;
>   static struct kmem_cache *perf_event_cache;
>   
> +static struct rnd_state perf_rand;
> +
>   /*
>    * perf event paranoia level:
>    *  -1 - not paranoid at all
> @@ -4233,19 +4237,19 @@ static void perf_adjust_period(struct perf_event *event, u64 nsec, u64 count, bo
>   
>   	period = perf_calculate_period(event, nsec, count);
>   
> -	delta = (s64)(period - hwc->sample_period);
> +	delta = (s64)(period - hwc->sample_period_base);
>   	if (delta >= 0)
>   		delta += 7;
>   	else
>   		delta -= 7;
>   	delta /= 8; /* low pass filter */
>   
> -	sample_period = hwc->sample_period + delta;
> +	sample_period = hwc->sample_period_base + delta;
>   
>   	if (!sample_period)
>   		sample_period = 1;
>   
> -	hwc->sample_period = sample_period;
> +	hwc->sample_period_base = sample_period;
>   
>   	if (local64_read(&hwc->period_left) > 8*sample_period) {
>   		if (disable)
> @@ -4490,6 +4494,8 @@ void perf_event_task_tick(void)
>   	if (ctx)
>   		perf_adjust_freq_unthr_context(ctx, !!throttled);
>   	rcu_read_unlock();
> +
> +	prandom_seed_state(&perf_rand, get_random_u64());
>   }
>   
>   static int event_enable_on_exec(struct perf_event *event,
> @@ -9979,6 +9985,8 @@ static int __perf_event_overflow(struct perf_event *event,
>   				 int throttle, struct perf_sample_data *data,
>   				 struct pt_regs *regs)
>   {
> +	struct hw_perf_event *hwc = &event->hw;
> +	u64 sample_period;
>   	int events = atomic_read(&event->event_limit);
>   	int ret = 0;
>   
> @@ -9989,15 +9997,50 @@ static int __perf_event_overflow(struct perf_event *event,
>   	if (unlikely(!is_sampling_event(event)))
>   		return 0;
>   
> -	ret = __perf_event_account_interrupt(event, throttle);
> +	/*
> +	 * High Freq samples are injected inside the larger period:
> +	 *
> +	 *   |------------|-|------------|-|
> +	 *   P0          HF P1          HF
> +	 *
> +	 * By ignoring the HF samples, we measure the actual period.
> +	 */
> +	if (!(hwc->state & PERF_HES_HF_SAMPLE))
> +		ret = __perf_event_account_interrupt(event, throttle);
>   

The high-frequency samples should still contribute to interrupt 
accounting/throttling, right? We'd just need to put guards around the 
adaptive period stuff so that HF samples don't contribute to the 
frequency training.

>   	if (event->attr.aux_pause)
>   		perf_event_aux_pause(event->aux_event, true);
>   
> +	/* XXX interaction between HF samples and BPF */
>   	if (event->prog && event->prog->type == BPF_PROG_TYPE_PERF_EVENT &&
>   	    !bpf_overflow_handler(event, data, regs))
>   		goto out;
>   
> +	sample_period = hwc->sample_period_base;
> +	if (hwc->state & PERF_HES_HF_RAND) {
> +		u64 rand = 1 << event->attr.hf_sample_rand;
> +		sample_period -= rand / 2;
> +		sample_period += prandom_u32_state(&perf_rand) & (rand - 1);
> +	}
> +	if (hwc->state & PERF_HES_HF_ON) {
> +		u64 hf_sample_period = event->attr.hf_sample_period;
> +
> +		if (sample_period < hf_sample_period) {
> +			hwc->state &= ~PERF_HES_HF_ON;
> +			goto set_period;
> +		}
> +
> +		if (!(hwc->state & PERF_HES_HF_SAMPLE)) {
> +			hwc->sample_period -= hf_sample_period;
> +			hwc->state |= PERF_HES_HF_SAMPLE;
> +		} else {
> +			hwc->sample_period = hf_sample_period;
> +			hwc->state &= ~PERF_HES_HF_SAMPLE;
> +		}
> +	}
> +set_period:
> +	hwc->sample_period = sample_period;
> +
>   	/*
>   	 * XXX event_limit might not quite work as expected on inherited
>   	 * events
> @@ -12458,8 +12501,11 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
>   
>   	hwc = &event->hw;
>   	hwc->sample_period = attr->sample_period;
> -	if (attr->freq && attr->sample_freq)
> +	hwc->sample_period_base = attr->sample_period;
> +	if (attr->freq && attr->sample_freq) {
>   		hwc->sample_period = 1;
> +		hwc->sample_period_base = 1;
> +	}
>   	hwc->last_period = hwc->sample_period;
>   
>   	local64_set(&hwc->period_left, hwc->sample_period);
> @@ -13824,6 +13870,7 @@ inherit_event(struct perf_event *parent_event,
>   		struct hw_perf_event *hwc = &child_event->hw;
>   
>   		hwc->sample_period = sample_period;
> +		hwc->sample_period_base = sample_period;
>   		hwc->last_period   = sample_period;
>   
>   		local64_set(&hwc->period_left, sample_period);
> @@ -14279,6 +14326,8 @@ void __init perf_event_init(void)
>   {
>   	int ret;
>   
> +	prandom_seed_state(&perf_rand, get_random_u64());
> +
>   	idr_init(&pmu_idr);
>   
>   	perf_event_init_all_cpus();
> 


