Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0308CCF2DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 19:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvstXx/lAoUyOUCYcSwSuJC361zeEuspxrO9X9aXvC0=; b=tz8LzH7C6dCL1/KlwGxyF7J5Wj
	mML+nnhKCU5rbeQqj8ILOyF7MAidguBod1/NyLMzXiMsspwtl7Bkhvzrdht4KTQ8caBz0XPGtGqf2
	GY18fn3q8nhPLWE6BBY0p9OQcMAySYG6LBXz8juB7DCvcaR6vsLTZo+vxoj0HwKDO8ZBhHcuuzlEf
	mnCASHxSPyybhrSwMoXckdbwKFY7vn37TCbVKQBzmtDXWtu84D2Ph4GOjzBxeii10a7PQokdEEpO+
	cY0gLf4yxQ55tPXlmaX0GT9KV4yXZrjq2mS2I92kujNwgIAuwIA0DMI7a1+/ypfk6Ss4TsG42VSug
	WjFuXaGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuqS-00000002ltd-1fJi;
	Mon, 19 Jan 2026 19:23:24 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuqM-00000002lrC-0070
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 19:23:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sj+n9jL+WdfIYTxgQFnBuLKX1V2R/n93v+nS0VBNMIH6K2JX3WozWVlXw3AMmbRewU+2nttSQv3rsTaJe6MDap6yZQ72DmlBGdMin7Bniaupjj1nFoLPgbLY1C92481bugsVLvFiwwOGFnYzbHuVnHy7yzw4mp6v2dYCHPC8sIFJmKMT/YUHqmJJ9tAHwIMhJKsyZalD3Yedn7ze/NlqD7Tr6gPuDNT57QQlSTYeF4eWZEomFQ3nuJZ/PILAaL1RDl90aWmz+366pjWX9uIZw7rT+ohTKcZvMgw6cnFPV7VTE3Z6LQanJlfiLKXsSVYkzJ8q39kuDHrHO3Xzew0Mdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvstXx/lAoUyOUCYcSwSuJC361zeEuspxrO9X9aXvC0=;
 b=t9xNCkXiu03huE0eS+vDdSWnI4zXkoZErp1QbaI3bLYDwfQtgiXet00ejtNg9av7ckI1B8CHrETH1gFvFrc61x/J7LT+6vJvHT406CWNYju0/DqKSdyXOAuyJOq3z41k5fU5aBWwuOSsQQPFgFalur/HyuHohj3aHITR/w1GTmiu2aVZNJiwdRpbsXsNzmkG2GhcWoRqBh7DBbxLWiJiS4Iw2+al1Za8ZvLUqVf5dt+cX5/I7nqgqjGXWeR1fJZF72e4YYBxpEVvVjDu6HkubnVHVjY5SBM/8zJg09kdpO3KTClSUWml/ZkBvSGVDbL54NtmKxFPZxyk/wf8m1BcXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvstXx/lAoUyOUCYcSwSuJC361zeEuspxrO9X9aXvC0=;
 b=hZS/3IPqAC/k3zgaeo/CYfyaEdmq9PLk25epVFYTg7yY3AKcCakLbifmFxm6bpJPh14JX5cjoQ6iEaNXcYAy8gdw2mmLrswBFmk9FRWFHk8t8E50p/5ZrrH7z7Z70EKESsIa6mBZ3KNT+uHWAMpbdSyPkBTtduoyICgAWD7TDl8/ETq9vKDex568KtghX1JUC+0mYGjDRtSRA6fR3g4lCSwhAnrygS3z+b71Usexnjsn+HJ6gCfHdy2pdaKV9fWxgxJiI15x6AF8na6RVrv4wv0My+nhvaWv4weXlrjqrHfnWrg6ZLAV7hzDmNo8GMK107954WYU2F1VoGpEgPTyng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 19:23:15 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Mon, 19 Jan 2026
 19:23:15 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 19 Jan 2026 14:22:56 -0500
Subject: [PATCH RESEND v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add
 optional clock enet[1]_ref_pad
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-ccm_dts-v2-1-efcf9155941a@nxp.com>
References: <20260119-ccm_dts-v2-0-efcf9155941a@nxp.com>
In-Reply-To: <20260119-ccm_dts-v2-0-efcf9155941a@nxp.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768850586; l=2234;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=h7NxkbAMMPYMkHk1k5MSlwVDi0sevBksMHAVgZPxQoQ=;
 b=i+kz0iYH0v3KFXSqgOIe0xpM4JpoDvhk9bNITSFUO7eIW0QtAiqTvwpq6sdfLLULcin692Yuu
 mklYSOml7gnCfSRJUeKMZ1HWIeooymeudHAFcGLVnvx+A9SAjMETZMF
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 02cd3e8d-b169-4a2f-09b7-08de57903172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qjlxc0x6RFNhampvZkdLS2NQaitpeVVuTjZ5V1kvU3ZuUTRCL2d2bzRlbUlB?=
 =?utf-8?B?ckE1Vi9uaHlUTWhQbnRoN0N1OWpPYkVuZmpUcHhDV0RZQUlWOVE3c2NYbVVC?=
 =?utf-8?B?dGlaUi95cERvYUhVNXlBMnhqRW5tMG5rREJyRXdJRmZXOU9kazdTRytYdTZj?=
 =?utf-8?B?b2RYL0hpVi94MG5aYUxEQkVnM2NMczgwK2RxZFloWUpkT1ZOQTUvREh0SmRZ?=
 =?utf-8?B?L20yd1h6cmxzbldpeGJzdVNiUmV1YlhMc1I4Wm1QSEorbUdaUUJZMWN5OS8y?=
 =?utf-8?B?aExjaSt3N2YvT0RlcnNkVXg5UHQxWlhTZmZjWTlJOE15V1lia2M2ZWhtNTk1?=
 =?utf-8?B?L2ZFS25TdkVoWlhlL0JNL1hEcVJYL01vSkpRaEFXdUNxakt6RFJIOCtjU09i?=
 =?utf-8?B?UjNQdnVDZG5SZmc3YjkvSHByeW12VVVMSXJGMkl5Tjc0ZXpzVU9uaGtsYmt2?=
 =?utf-8?B?M3lZK3J0VHdNOE0yamZaK2JMYnFGaXhyTGh6Vmt2TGp6c1BCWkpTMUk4aE0x?=
 =?utf-8?B?V3o4VXp1TzZncUcxTDkrOWdCOUlHbVZQTjNLbVVweTR0eVlQQTg0RUMzeXNk?=
 =?utf-8?B?cUl6b2pIeEpoWko2U20vMDVwYVFNZTJyaWZEYnRObE5YQ0RhSkVxUmtUbEhy?=
 =?utf-8?B?U09FVERHNDNyTEJBdG1kTHM5UFFKS1NmTWxPSmJvL2JkSlR4UXhING92OERC?=
 =?utf-8?B?U2FwRVcrYVV1ZjR1dlZ0M2FvcjN4K2ZCR1dGV0MrVXJkUmRhUHFkeDY1aDE3?=
 =?utf-8?B?aExLRnEvSGVpMmhKVUhmNW8xSTc5RTgvd21nUlVhNktUK0l4TlJONmJ6RjRj?=
 =?utf-8?B?aWc5eDFuZThDTE8yTVQxS056c0Vka0hXN2U0dW82c296NDNpNWp3ckp6ZU5L?=
 =?utf-8?B?V3RWSXZmcFpTeDEzQk1BU2ZBZ0U1RmlZUEZIbmlncUtBakl0VXZKRHhzN29M?=
 =?utf-8?B?ZjV0V1VYQ25YRTFSTzU4WUFmaEI2SWZFVW9ObW1qY0crTmhBZG9NQ2RoVEVI?=
 =?utf-8?B?YmFtNEhEVjNZYmh0TmdOWXhxOWhEb0tETXEvUnRVSXlDNjBaV1J0VVJDVk5C?=
 =?utf-8?B?NWJyLzd6djNGcExWN3dUQTAwZmozSnFtY2FHRmVCVGlRRFJlZDFzMStUeU9U?=
 =?utf-8?B?QzZrdzBEdG5mdVNGMnJodWhoUk5nbTcxNWI1M0dZTGpqOW1MazJpbFk0cU04?=
 =?utf-8?B?VS95VHNoQ1lLbkZrWHF3Qm1SL1I0cklHdW5sMW9FZU9DT1JLWVZqS3d5cjU1?=
 =?utf-8?B?WHNqNm9JcHpXV3pqay9jKy94Y3BITGVnaUwwNDEvYi9ZMUNKdWJIVjVWOGpG?=
 =?utf-8?B?QS9DY1VnbTlOY3JUb1BXc1pmMnU2YytLUU9HRHh0SjlkRHE3N0Qxa3VWL1ZH?=
 =?utf-8?B?alhBdXF5aXpCVW1sbTJtZGJmczk4YS9BYTlRMWdGTkxucmVtdysyQ1hXUDZF?=
 =?utf-8?B?ZGd3cytSR3dqZ1QzT2czTUdGd0JVREVURzRzTTFURDVVSnN1TlJtYWdpelBx?=
 =?utf-8?B?MFhTZlZLN1g0ZVEvYWlROUpKWE5kU3BHa0F1MUdXczkyQ095NWZLOWVXV3Zi?=
 =?utf-8?B?VlVDNVJCYUo5Sld0em5BRkxKWUxIQVFxWUtpTUtLL0czZTljQ1QzaVVGTkNj?=
 =?utf-8?B?Z1RtL2d6WnFDNUtKWmJibjJZRk5TRTFNN1pvV0VwUDNXKzdVaVR0WkxPRFFI?=
 =?utf-8?B?UmZKc1VpNG13eFh3elFGdGhNUU5FSGptOHJ0UWtEUlgvRXhJRlRFL2VjSFA1?=
 =?utf-8?B?VVdGRnNuWWUwQjZvOGNjeEowY2xhTExxd0VKNXE4eGlSNFc5SWRVQUhnRHRo?=
 =?utf-8?B?SDlUR3huSEdxT3gvTnc4Z3NkVjVrTTYvcXEyRkd1d29CaUhrUTJMY3gxSU9u?=
 =?utf-8?B?RWZieUdENWpZcGptVkpxZzQ4bG50WkRPNGYySmJjNjZBRFNzdC9BZnllRDIr?=
 =?utf-8?B?V25RRGdwOFFMMGRJbnlxOGRlRTB5dkRGYTJuUWlIMlZMTzFCZFk5RWVBM2JC?=
 =?utf-8?B?Z3pHdzVaVEhRcUYycnhKWG5BRjRVaHRqVjJRd3laSmZIUUdFdDlNYUlsQUw1?=
 =?utf-8?B?b29nRGNZMXd0Nk9DaCtGSWZ3bVdHcFJmSlVNS2F1RnZqUzFNdTlhZmpkODhs?=
 =?utf-8?B?V0JZUnZIU3F6NlQ1TS9ITFBna1AwN3Q1aVoyd0lpdWM0TWhncGhUbENmMkpW?=
 =?utf-8?Q?ZQpEJ0S3z12/UOoBgDqijKUW2yEmafjjWENUS1CWq9ZF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0RFTDlWejAvcGNTazZzcGdZSG51c1ZRS2JNcFpGZnNtc3p1aERhR3FPMmRV?=
 =?utf-8?B?OGtmOExoVThpYjVoOGRDZUxXQmZmQnRNLzVORFVpYTA2TGRmQ0hUZFV1QzIz?=
 =?utf-8?B?dXN3dy9oYVgwdFk3RGw1NWpvcEhOZVJpY0RzWEFVMzZiZGQraWUxLzhqYlMw?=
 =?utf-8?B?c01XaE9IZjl5U3Q4bXJUQUF2YUw5MitWQmw0ZW9yeW0wN2Y1Sjd5aWk5QlZs?=
 =?utf-8?B?T1Y1U0JwdFdTRFpTQ3BWWXIxQ3FReitVU09kSENnbExET0pNYkswRm5QYnls?=
 =?utf-8?B?LzUvMjRZaXFaZ2V0RlpLczZYbXUwcDM3dTREenBLQU5yOVFXRG10L3JDRzVC?=
 =?utf-8?B?U3NBb29GSG9NTDFJUWRCQTFaSXBUZk9JSnpQRGpHZlI4ZGQvcmdwekhDYWRS?=
 =?utf-8?B?UFZjMUNtd2hINXBNVmk3eVNvdjdEYnF4dGZ1UXg5YlVrUytzUlBpMGU0dXVU?=
 =?utf-8?B?QlR1S3RGSjBpNk9YS1ErOWhJNElMYmFnVVRGY3lXK2tGMmtON1NERGNGRk1k?=
 =?utf-8?B?bDE0Zzh5dWtneVM4aUtSMC9LVFNaR0hQMHRieXA3M1dVMXFRZ1VQQXFHbFkz?=
 =?utf-8?B?SFNsL2NLd1JwTVVNdUpCdFdZUGhrYXNaQ1U1dXA2MnpHQ0RMclE2U0g3dWVv?=
 =?utf-8?B?WFcvTmFRTGE5OVVkb016dlQ5YzJaQTBEQU85aHdVRWZEd1oxam5CNDZ4bnFT?=
 =?utf-8?B?aXlTaDI3Q1ZkTlByWVUwbEhYYmNuVjV1K0UwaWM4bUNnc1JBSkhmWUs2bit4?=
 =?utf-8?B?bVFoTHVxUitzbDZTY0pqVklqNFZPMmF4OUtPTEJ3RmVxcXRDWjdoNytVUktJ?=
 =?utf-8?B?N0lKRTVCNEErR29tdTd4NURTU0pEZ1NhbXlPYnZ6MzRMMTcrRllvREQ1WFdR?=
 =?utf-8?B?ZnhiVHNEWHZLeHRXWVFRZTl1SUZQZnVHWStQNFZUVnFLOXJCbDJxQTN3MUcw?=
 =?utf-8?B?cGppUU9qWXZVdkpxS1l6RTNMSWh3Sko5Z0lPNG4wTStyMnl1eXg0TGFucmNQ?=
 =?utf-8?B?aUNiMVVQZmI5Tm1pNVdqTTlmbWI4eTNUOXJNZkNpSlhYdG85cXQzUHRva0hB?=
 =?utf-8?B?NmVWQTZHbDNUU0pEUFd1eFEwNzB4RVc3bEZVak1HS2xFWHRIdzJRL2ZSVlQw?=
 =?utf-8?B?OUhzb1prOEFDV1Y0cDZUdlVkTE91WExhclVxTHFXRVlsNG85eHdGNEFWQ0ZU?=
 =?utf-8?B?ZllMTk8wekNwUVBEL3dEU3p5eGpTam9YaTRsdnl4K0RhOEZmSGJ4MzhOSVRJ?=
 =?utf-8?B?dVF4dXAyM1o0QTlZaDlabWxBY0pHbStBUlg3SDlVMW10cXhiSWdSQVZ2Qmtv?=
 =?utf-8?B?MW9vYktJdmNpTkFPc1hqL2x2ZlkvNTRtSWxtekZtczJackVJd21VbExIZHlL?=
 =?utf-8?B?NWg3dXIzRU1KbGd1TjRNVTltbXNOVVRUaG5UQWxrTlJ2eitKczVIT3Y0dWox?=
 =?utf-8?B?MlpUVFc4Z3R5SjRXK3FzTjE5NGNvOXZvcnBYTDNYUEhOV2JFM0FjckFFNG5O?=
 =?utf-8?B?TTdIQkk5VTFZUWxTdWJpa3NMUzE1WHN6SFFWOEt3ZFk0QjNsN0dVZDhORzVV?=
 =?utf-8?B?azNXYTVDV2lmb1VKYmxxTGp2a2VRcStNV1hXc29nNnRnVnBDcTc0UnJMV1Bi?=
 =?utf-8?B?L1hBRDF0QmF2Q01PNjRWN0ZDc3ZkeGs5OTVNQ3MwRG1WR1NyR3c5Mlp3dHZD?=
 =?utf-8?B?UFcydkFLN2ZYeGRHK3JvU0YwYm1vNTRiVUQ2RmVhUnFDSGZJd01rWC9kVFJr?=
 =?utf-8?B?dFFvaC8wbEt5T3BLMnB4V0ZqRU8rdGxpcjNKOGRuUk9FWTFzNU93ekZHaUVp?=
 =?utf-8?B?cUNuTkh5YzFVK2NwK0dDZkNjais4RHFhMTNwOC9DQ0NTL1hHOEY1ME82OHFr?=
 =?utf-8?B?TGd5VWZ1WndFMVFMajhUVnBJaFV1VUtPdXp3b2J6OWtqUWltalZvTURVQ21C?=
 =?utf-8?B?NzJhYUJOVnlyc3ZKVWUzQUdjYllyWms1NmVxbDNNRTlWajcxS0pWaGJQTzdL?=
 =?utf-8?B?dWhnM045Nk5hNUNVZm00OUVnZ1ZORVRoOTl5d3NYeHgxSUg1YitxS0M1bnJm?=
 =?utf-8?B?Wll4TjlKeTUwempCSXJuT21FYWZ6N1F2bHRsTFhqYms2bHp5aTNia1N4WUVK?=
 =?utf-8?B?NXpDMjJqdndjb3RuUHRVZjMvSEdkazNFbWxTdlJDRVVOQTRKYjg4UisvbFY3?=
 =?utf-8?B?MmsrdW4vOGk5QjVLWEY0a1N5ZjBKbnkzQm5Ta2diWXNMZHo5ZkJabHFQUldy?=
 =?utf-8?B?NzU3MGExMzZQVnVwLy9DR25pMmFiR1ZJMGIwMld6UHp1c2lyZUcvMkVMYmRZ?=
 =?utf-8?Q?pl0HfYkG421Wb/zhc4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02cd3e8d-b169-4a2f-09b7-08de57903172
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 19:23:15.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhQuSYi96zD6eaLts1CCN714e24vR3QeSxBSaDxP2PBC3cezo441uHW9JWcuPvANnoLUuPZT6iJUFEx+rZz5iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_112318_046054_8CA2B5C2 
X-CRM114-Status: UNSURE (   8.82  )
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

Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad for imx6ul,
which input from ENET ref pad.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/clock/imx6q-clock.yaml  | 4 ++++
 Documentation/devicetree/bindings/clock/imx6ul-clock.yaml | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
index cd3c04c883df4ab02af29582369757df36269cb6..e78a493ffa59050a1b4974c62b14cfd9c0eb86b5 100644
--- a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
@@ -29,20 +29,24 @@ properties:
     const: 1
 
   clocks:
+    minItems: 4
     items:
       - description: 24m osc
       - description: 32k osc
       - description: ckih1 clock input
       - description: anaclk1 clock input
       - description: anaclk2 clock input
+      - description: clock input from enet ref pad
 
   clock-names:
+    minItems: 4
     items:
       - const: osc
       - const: ckil
       - const: ckih1
       - const: anaclk1
       - const: anaclk2
+      - const: enet_ref_pad
 
   fsl,pmic-stby-poweroff:
     $ref: /schemas/types.yaml#/definitions/flag
diff --git a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
index d57e18a210cc1d8a836b50058613dfb0308fbf11..035002721a3b3b65fe67734e13b686b91539f328 100644
--- a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
@@ -29,18 +29,22 @@ properties:
     const: 1
 
   clocks:
+    minItems: 4
     items:
       - description: 32k osc
       - description: 24m osc
       - description: ipp_di0 clock input
       - description: ipp_di1 clock input
+      - description: clock input from enet1 ref pad
 
   clock-names:
+    minItems: 4
     items:
       - const: ckil
       - const: osc
       - const: ipp_di0
       - const: ipp_di1
+      - const: enet1_ref_pad
 
 required:
   - compatible

-- 
2.34.1


