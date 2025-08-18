Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F34CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 01:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjlF9Udmzo1YkLHagZOOGKLWgEZPqh+lO3Vi8hECe18=; b=1FrNGkULijUXwWyamL7R3yI66v
	1fYOAbw8GeuGjqEtBcySUqmTOYYBFNyXWvn0GqrwF5BYYcWaDqhVb2pkVUROvB6xDrkHtn9NNTz/z
	k24JUvyFgWIV1u+j22UWZMjCa2ekSUFOlkRu9F6y7LnWvZzb5ZsW30A+gejemVk5zhzeYLFzwQG21
	Ttlvi5WhLC0YueVSD9bekskFX0OGhcEuo/FCNOP9K9CyR63KMAkbOqKLe5xM5oCbcbKEQS7VwKACJ
	Rb6QInYMjiLAGUgzPOn4f9IrrxwdazTsxFCmeX5OQCrVXJnarfKLV+85WLfP8433pjYd60tqSr8/w
	FXjWW3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unonc-00000006GC4-3NFN;
	Mon, 18 Aug 2025 01:36:36 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unodR-00000006EgN-31UU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 01:26:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJbYAPewAAFgM+g6GI96J9un4dQ1GNj5trpiS7aybAyVJhUi4yArgH+Xh8iqH+472p/jUp8y8ExejWklPLPxlSwQLC13YSPWEmd3gT6v1pqN2BD97IvcEGoy1rW1ZrGTZSzwj8BBVIAaFVh57RooTdp8F5Qu36mqPsyh4TD2y7Ifs64cqgcWtc/kfFRyDyRvkVhdzlwc9eACK5sPsr50e1FEHDF7a3QEfsxreCz865aYi8OCGR5rLTx/gIJZUXUbmiD23EqMEcUjidkqoDmkEKi3HbzJnc/5BDYdpXqAaGCRJiKMIFGjgXzQRm7h8di6jihyfx6Sqa/E38j32aUTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjlF9Udmzo1YkLHagZOOGKLWgEZPqh+lO3Vi8hECe18=;
 b=f3dqj9VZLy4o66Uh70dzjcsfX2/i8QeMULaBwrMg+ZL+u6OI//i6K+FdyCTZKNaIr317DblKzv4ayeQkljBteGrRpY2aB3DqMO+VARVEprgzG/01fYleIPekZFz0aX5YS4gASojRZPoay8nsYU+/6hmSJwe12BHQ6b79kOSxKNhTKucsW7o/7Kckc5tGAhCdjsbDHvbrPDQ/E/q2iRbFe1diX4HkyxrJ+syxiQFNu3ykJgxfbDhAMgjfv2sWFEX5pbxN7Rb4WQw1oGyIPQ/qG3yMVRABY0bTRMeb2zHxYbh4PDnq01lG/7gbnhxO6LKGc5EVTGMul8SqSeWYQK3miw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjlF9Udmzo1YkLHagZOOGKLWgEZPqh+lO3Vi8hECe18=;
 b=i01CPsFivpwc19v/CV68poWXnnXQtSoFHyyfkpU8aMITcjB1TNjCjIIpCYckqthUuLQDe4gHV7dSibYQRyWef0E3JOADit7r+EHXsAhwy3TiUwGktTwsQKPmQq7GLKsErd0FKhNF6TM4ixe3ibf1yUgzM3lb6r3peQ1gM2lyp4yH38RQc7UKJ2BpyZz+OiEpKaSoZ3AmKbulyWC8EuZMolHc+7DpN9ZhcgXi3gwxGe0vsfl7AHYfvpWEw+MjItQvBmSLDQ+IlMcwuqrBMmXSl1pKMqjZIzXUruMhRigF+bQFUeLZz59DVY7qZFskyyqYO2XbRYv4XprWO4gX6VB/eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7388.eurprd04.prod.outlook.com (2603:10a6:102:84::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 01:26:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 01:26:01 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 18 Aug 2025 09:25:33 +0800
Subject: [PATCH v2 03/11] arm64: dts: imx95: Add LMM/CPU nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-imx9-dts-v2-3-8ba787fb5280@nxp.com>
References: <20250818-imx9-dts-v2-0-8ba787fb5280@nxp.com>
In-Reply-To: <20250818-imx9-dts-v2-0-8ba787fb5280@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755480343; l=876;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=SnRlgD/+vxq31It3U7pZ+tQnMHySpUP/OPMLTa+74eY=;
 b=KsPb6pZXxxc1n+CgOsU4N+oWaSoobMjBks8z/y6U5Ozx3X/RdW0uGSr+do1PZkYYeu6aQe0oj
 CnyUeOdIUKnBjc5TabsnLcpkthd5kC44UU3AmeIDWwrzPlJ9ETvK8GM
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7388:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a874d04-de3f-428b-604e-08ddddf63150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N09Ka2VnMjVaakJzeldsaUMrQUovZ0NBR0RYbndZTTE3SGF1SEYxb1NpckRy?=
 =?utf-8?B?ZTkwbkhNNXFpVXFnM0hsbzdPRnJQNDF5NUtzZG5hK3JsZXZtMVhWN0dhRU40?=
 =?utf-8?B?OFE0NXJRUFkvOWhSTXZKZ29kRmtMZUFDMXh6RHdsdlZjcGd2WDd2K1J4M2VN?=
 =?utf-8?B?NDF1S0ttRnViTlVPMU1iVGowYkRkVXRlcUhWQ0F5L1p1WHRSa0dNNDdLY0xU?=
 =?utf-8?B?ZnI2Rk5QMit4NGMvRVg4ZThaMHlVK05TeG9TQ0xmdFRtaXBLRXUycjBwbUJl?=
 =?utf-8?B?bC93bEExVExNVkxQQ2cvUnQxejQ3bzVYaG1rQzF4TmdGaEVFa29ONUYvbURC?=
 =?utf-8?B?a1piTnYwNXFxYU5DL0hNdjZrQWpSRVRKYzFTTTVSK0E0dkcvMEU1WUdKNU9m?=
 =?utf-8?B?NnhUQ3FnSXIrRm9ta003cUZjQllUTlQ0NkpveVlkaTJ6ZDZIOGhkN0szQVQw?=
 =?utf-8?B?SEg4bEp1UHlJMDhnNmNRb1hxTWxRTGhqSUNaRGdnWnMxamdHdEpQamdUaDZq?=
 =?utf-8?B?Mm9oU3Jsdk9KcVY1Y2RxZGRnV3JoSTFUV2xaZGxuL0txcTgxaXR6Vi9GRm9r?=
 =?utf-8?B?azUxRk1wQ0hkdkJscFZMVzgxbittT1lHRXJPYW5mS2U1Kzd5V05rdXRSbU11?=
 =?utf-8?B?N3U3VTByYjVtQTlvTkdzQTY1WTJxMGo0Umh5TGdLRmkrNXhsTmVHOVZVdnp6?=
 =?utf-8?B?TFRGQWRWcWFsT21hMTVtNWgvWkVMejErTHg0TmZXZUJadXAyTVB2eC9LZjV6?=
 =?utf-8?B?bGVqNlo2dlRydHYxcEVaZXZjQmRaUVBHNzc0c29tQ1VYdzhMdXF2REI5dE4w?=
 =?utf-8?B?dUZBd0E0aFNMekJqamZMK2ViTDJ3RDZNMEx2WVF6K0Q1UHNTNTlBZlBwRkt1?=
 =?utf-8?B?SGdzeTZ3SEZFQVBqSFdIRGN1cEJXb2VVMFI3dmcyV2dPT3JYWVgzNlhDdUZP?=
 =?utf-8?B?dDJQNFRqVEU3VFpuMkp6TEpnRWt2S0owMlZJUkZTQm1BQXVlQ2FXM201R2c1?=
 =?utf-8?B?aVZCWjlOR2lIZldLdS92VEl3MW4wdU9zY3RnRDh2cTgzZXIxbHhrcEdzMk9j?=
 =?utf-8?B?Q3RtZnZmVVNRY09FZGVuWEZpK1Z3OVl5N04xNEREUCs3QTFKMDJvcm1BTTB0?=
 =?utf-8?B?eEFDd2ozanRqc0NKRllsTHhDNmF1VDQzTXlmdXY4TUtmKzNmSFdkcno2QzZQ?=
 =?utf-8?B?czB5S3o2WDN2SkRpOUgzL3dVUUlSazJkZDlUb3dHODZnV0UvVVN4NExQaGsr?=
 =?utf-8?B?S3JCL2FaaXJCQnNnM0VramROMG5FeW50eGJKWnM5YlV4VW1kSGIxcjlKclVY?=
 =?utf-8?B?TU55QnlCZTcwTFhUTUU1bGMvRm9GUUpiUktqZVVpSno1UTQ3Y040bjFqUElU?=
 =?utf-8?B?d1graWlONjMvQ3JRcFMyaTloNW80Smk4VVNoT1NGbGIvVWRBdzNWUnMrVWM3?=
 =?utf-8?B?eFBXMXEvODhjT1dsMTBhdk82VFhqazVQdlJydXplYklONksrQWhLR21aL2hX?=
 =?utf-8?B?bEduTFNrUGdGNU91elh5bStoTWx1NjNsZzFwNTVmZWlRL004MmF6aUpXYmFL?=
 =?utf-8?B?WWtlZk8xZnpmcXZ6YVk4OU5UZnF5WHVFNkljTDRwcWs1blFLcmxCMEx0VzhM?=
 =?utf-8?B?Zy8reFRzVnZrSzhwVmZLVGJldG5Xcm42RzA5eng3My9RNGlJOXIwaHhsSEQ0?=
 =?utf-8?B?aW5ob0JyZCttSUVlVFZRUWZCc3VvT0k2Sm8ycjNqKzh6NUtoNWFxbjNOcWFl?=
 =?utf-8?B?ZHNsNk1pbXVtbkpBOEI3bmI5YVY3cHVZUHdYanBkS1JvT0lrTGdjU3FDQUQ5?=
 =?utf-8?B?NDFUVDZNL3JpOHdnWkpYajVCQkdSYm9oR054MHlOWllFblVzTXhaTUFINXBB?=
 =?utf-8?B?dHJGTUFQOFY4N1lZcng0Vzg5dDNMMVJjWnRvL2NxdDUxL1Z5TkxnSWdoa21j?=
 =?utf-8?B?L3UzNGszcmwxcFZKS0EvQXZFckJkbjV5NWpZZk5ZZS91c29RNzlobGM3akVM?=
 =?utf-8?B?YkhnOFdWTnhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU9MdFRaWTNMYmYrc2U1MGYvSDdsL0VidmZ2L1NYYmE4Ny9SSUlnZ1ZwbUo4?=
 =?utf-8?B?Q1lmQXRHQndxd21HS055cytncy9pVk1MVTJFRXl3TlM2NWxjRGJqZ3R0NlJu?=
 =?utf-8?B?Y0NqT25GOFNqK3pnUmtRT3JEUGw4czNVQUxXTCtzNzIxeERobkg1dVptQ1Y2?=
 =?utf-8?B?MUNiL1RETDNTMlJMbUNJNy9GZm9ZS1JvYWQ3YWNmditjZ05BOTJ0MkJvS1l6?=
 =?utf-8?B?cE5URXoyREJyRERNT0w5MWZSV295ZGRHNkZ2eVFSN2hqM0wzVkpnRDJJMGg3?=
 =?utf-8?B?UEdlUUZrUDF5dXlJMUlpa0tQbTk5Sm1sdzdiWWpjQkwxU0dBdTM3aTJaNEJq?=
 =?utf-8?B?cXFRdFRtdXk4RE85dlMxdXo1SUp5Rm1GZ29WcnhqalphWk9qVEtaa1NVTFRW?=
 =?utf-8?B?OVZWMWpNWldpTXZ6ZU84citNV3RvdW0zWFcvNFVFNXpTOTNtNEFFdTBpUHFm?=
 =?utf-8?B?ZmRPc1NZcXhTS05VdXhmS0sxT0JialJpWUJpQkFYM1VGRFdEYnd3R1BIMllj?=
 =?utf-8?B?UThVOUpTQjBuZVVSY2YzT3lXZTdGWHJrK0Q0S2lJeGpCWnRONkNZQWdnSk16?=
 =?utf-8?B?VWp0Wi9sS1JyOVNRb0tlQ2dWRUJyQ3kwTHBNUDE1RFZkS01xV2U0SG4zcC95?=
 =?utf-8?B?dkVsMVFmc1dzckZrWnBmYng3SUgwKzExYUY4ZkRxaWpvOGNCMWFJaGFOc2pv?=
 =?utf-8?B?cjhiaUNMZ1YwYnRoV2hVK200Si91ZWhmZDFZaSs0OXBsLytwOFRMOFhuZmJ2?=
 =?utf-8?B?RmsyTmhnOFJiVWQ2RDJOVUpUL3NwQlBnUXE2S3NQOFpQMVZ0Tm1ZcS93VG52?=
 =?utf-8?B?ejVXNlBmc0gvVXNOT013VVZ2emFhZU41QWtsZlkzZk8rS1R0bW1rc3hWa3F2?=
 =?utf-8?B?MHVSUDJMSVZOeDViaWVwSjM1Tm9mbUVaNlVweUFtRzN4UUxvSm1uQ2tGVytT?=
 =?utf-8?B?dlFzSmdZMGdyaC9RYXlDS2RjbFQreVkrVzF5Y25xQlNXdE5zd3Jqbk5pdldG?=
 =?utf-8?B?WWN2R1NLMXE2RWFpNjVQM0hoRnBPRFRsdnZqNitoMVJ1UVNGYzZpNEtkSU1M?=
 =?utf-8?B?OUJNSE1FRTVnZVBHQUNxVFlzSU1vSkw1cGs1RUJFSGFjSTJ0WERkaE9pQzk2?=
 =?utf-8?B?c1hJTEhrVkpVd245LzNoOUJrUXpvZ2tLSTRJTVdRQjRxY1ZjU0VOZVNGcjlM?=
 =?utf-8?B?STUrc1VWNEpWUnF5c2p0U0hmZ3RKLzZHRlhiUjEyeE90RTM2ZmVsa3JLMVBV?=
 =?utf-8?B?QlJIbGhQbTduekF4b3FBWGVZUUREOS84a2tid2F2YnhFNlFrd0pSdXNodEx5?=
 =?utf-8?B?anB6QXVYa0pWVUNLdVVkZkFTb0lmYVppS0ZvZU4wK05ldkxWb3VZTGxxekhl?=
 =?utf-8?B?ZXpvUTJHcm5NSHdjZTdMTkJHcVV6d2RFcTNLenlyM1RsYUppcjhsc01nOGVr?=
 =?utf-8?B?dlg0Yk5hMnRxd3hwRG44WnFvSDN1NWRRajJnc2VnaWhKTHdwQmltb1Q0T2tT?=
 =?utf-8?B?UmdRNENxNHl3dDVYTnZ0M1BxQnMwYS9NdXdyQ1daYjRKTzZoRHJsREVHcW9I?=
 =?utf-8?B?Y2NLNC94MzFOV0M1aTMxb1hTVVFLdVl5bWJOZUREZ2dXZHlLekUzZWdVV0Yw?=
 =?utf-8?B?MEoxalY2M3lXSS8yZnR4VENGeGpUdkpiT1JoSWV2TlBtRXpxZHM5ZVNzL3lJ?=
 =?utf-8?B?U2FKZ005dmYwd3FFR0h6eWNqODdlT05iMkJhWTVBVS9BZTcwZzBOQzRWM3Fm?=
 =?utf-8?B?T0xKL3VQeUVlNE1QampKRnlKZ3dhN3VwczN4VEtKaGxCKy9JNmg2R0tTUjdM?=
 =?utf-8?B?cm5SdDlDdjhXd0k4VmlyaHRKc2RSNnZoV1lHaFpzV3NWa0M1MHdUMmtsVlNX?=
 =?utf-8?B?V0d1aDdaSWVpRzhtV2gybGdhYlZWR09lb2VvUmRzZlZYK2xtVWFIM2VUbXhy?=
 =?utf-8?B?bUUxUWZ4eDhYTlA5NG9tNUlweHI3d25ON3A3bUF1dG8ra2h0Z1YrRGpZTVo1?=
 =?utf-8?B?U0JJQjFlM1pETlU3dThvZWxHTVViTkJZaldjUlpYRXEwNTlnQzBVczJ3TW81?=
 =?utf-8?B?aGkyUFRGeXNwM0Q0Y2U2eit2MHpMOTdtRHQ5NS82ZFg0TlR3UnJUazdxYXZC?=
 =?utf-8?Q?/76BpLNsxwITwPp5XoeCU0iF2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a874d04-de3f-428b-604e-08ddddf63150
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 01:26:01.6763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSCHt27N/F0ckt29BD3asgs7Y13Iyh4j/Ih9UlSBkHB85WxlXsJ7swa6v9UZg3BKCrpAUQTl2itDKOi0z+8A8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7388
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_182605_778307_576E7E87 
X-CRM114-Status: GOOD (  10.16  )
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

Add SCMI LMM and CPU nodes for managing Logical Machine and CPU.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 642dc4b7a4770be50960f53a73db965ea4374e24..e20feb1bcec6088949e7dd1ab2fc1c108393fb81 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -351,10 +351,18 @@ scmi_iomuxc: protocol@19 {
 				reg = <0x19>;
 			};
 
+			scmi_lmm: protocol@80 {
+				reg = <0x80>;
+			};
+
 			scmi_bbm: protocol@81 {
 				reg = <0x81>;
 			};
 
+			scmi_cpu: protocol@82 {
+				reg = <0x82>;
+			};
+
 			scmi_misc: protocol@84 {
 				reg = <0x84>;
 			};

-- 
2.37.1


