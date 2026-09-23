Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AABC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNaxxXXPvtOmT6KakgHQZNtB1e6SHnE/cUrCncXaa6s=; b=m+JK+P6u96UYA3OD6Ff5sGizaF
	nFFnA8PMD3OiFHHSepmSUCN8INb0++W1kCxNhhFT7pJeNkN/vTyFgxyKFTYzhAtAc4Qmn2BiG5tqo
	eHnI5jnAbONMZYylUYsziIMgyNBmGCVQyUmr2WsT/xI6xGXFMQ1lyU8CgLXkpA63uXKxDYhtB4IlP
	na25aWR0YaZ5KR13Mx0eEAbTkfaJTrugi9ze9/aiECf2Xe15Psekx8+AsKT51aDCwlQjfOYMFnP7G
	2OJTKs8hMBiKudwv0mzsDs6xd4TZueJn4DbStgnlzm7gge8oSXjEQj3RDAElWBM4oOgsne3nAOJ1k
	YxzyfbYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TVp-00000009SQN-2J1p;
	Wed, 23 Sep 2026 20:24:17 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TVm-00000009SN9-2LRb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:24:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OX4qSTRlO7itms1TlQMowGXdlQb78lY5bXzAS/Dt1btujLWfq0p0oZyRsAamAT3c2puxi5U+s1QbQqVRmaxThBe7fozkURFcgpcuRdK3GqK4mhS6TtZaQyrxEbC7ybu5aDG4s3sr54N8HDs0L1Ov1wBfCBWzyND0MM4bF5cFnNr0zlZXtOt6DrdYL59liqOw1kXu6mgRYXnez24HmyQkX65ZI3UvXCEDHXozFlSKVOmpP4TQyq3sOduth6StbasXedxJzxFaOFRb35V5ahJw9J61DkVkgOSnND5rgK2gKYWrwlp52s9xOf4QxyjbG//zvTflPgVDdgof0EMHZRr4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNaxxXXPvtOmT6KakgHQZNtB1e6SHnE/cUrCncXaa6s=;
 b=llchWVszFjQSJSCQJPKGxoPqNjJdHyiEXc6PJC2/4+FYq7aurPxGfGFbSxgZha6CONkn+eBeYwV8FmwcUcoQ4cxYcHJ2OB8p7MLlTnLTMldSIj1gjgVz3H9CeAW/Dy/nDqIqKhMTaokucVUm/mjAajTrl0wBtd2G7P4PLg6981ZRJfDbquXjll34dkOt+PShdL9nvjRwxGj0JFd/NovTtm5CeP5lYlWqHEnT6RnS8ycg0IfL9FkNg2tQAMuoUlC4ZA/wX+rcomoYeZuOIKB/J2VItOI/glT7wXDz5Vuuhjm/LyA/pmlC7hbNOrNyhOwSSHV4X3D4FRjXSUrwTcsOig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNaxxXXPvtOmT6KakgHQZNtB1e6SHnE/cUrCncXaa6s=;
 b=UtZdzydBtvuEfYr7ypHf6e1gs73tRuRyovYNU/bGCAmp0sqs42QBuz3Zky+kBNLOzp64E1gE/f8jqioB9TY56dpybzKvnn1vZa2lwxc3/MRukia8CalVhvq6xKKtHIrXTQYDQEAk1u+1B9FVNUSFbup3UStkgPXoStPgrGJx2WI8lFlJnvauqtx77Thv3FdTGhzg9kAGRDtp8TiqE7VpUo/PR/Ga/3i+FHiopE6MOY9X8fB3/2T8M959HpBaJgkURLfFnYtwRTgErT4cVUHMv31NRpZ67gdGhyt3xRzUXIKR30NLF4Ycdvt4tiieMWMDENznEYv+ycG3/ZttTNJHkg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 20:24:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 20:24:10 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Joy Zou <joy.zou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: imx91/imx93: add rtc1 alias for external PCF2131 RTC
Date: Wed, 23 Sep 2026 16:24:02 -0400
Message-ID: <179019503861.3753202.5641676911933667829.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914-b4_imx91_93_rtc-v1-0-daed1cba0714@oss.nxp.com>
References: <20260914-b4_imx91_93_rtc-v1-0-daed1cba0714@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYZPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:930:a3::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: ae314c8c-934d-401f-5c54-08df19b0a035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|19092799006|366016|11063799006|56012099006|10067099003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: b2AfH1o8fvyog1erqd2KwRQauvokQy2xL0/kqVNmgjm7FSwkKdIbPOuyAqlomWH/Go2MsIwysQ+Jyt5qPzm0DtC6GdODxEfTRvGSMZUDIq2VSnROZKYTOpPNIwaWyzf0oRzdpW6Xfv+vOc8RJtgqECu+0aKtZkf3ZBaFOC9V+N+N4UGHLSl1iZqdAjshwlRRRHS39d/G6AKt9xL7UD3aOeLUWmBOKD5JSOO8uIvqNcDxxVOweOYZ0RHhopTOoPrCr61IwI/2qLYpJjSKNqBPE1YDQeEkYhiyftvL3XYwp8k/KR+SRejrVAAKqar1IC3VJZzgbGVNEOdk59Yq4YL8BYkw5RZH0cHv8AoSGnqfFVFrTqSg6qhNvP8hZH0ASBRkdcFqpTOqMvk54ge8qV/hrBV1vSMeOEqewXdi7lXeck0gG1oNhjEiEiA6k6szDTCK8qkoN8TYXH9I8moizRxOZHdH7xpH3XR20RdRqjdvxKIXNs4CVXDK//f+P4dv3ZpJuqvG1f7w5YLmSSXGweYIGn0fYhDgtErGXmrOgjuXPcHX2i+6+zTs75JQvsRghkGOxuAGHAtzetZwd3hRLteDdSkQi44gGAxeBl1Xgm9SnBuCjlYfMl9kq5kAXg+uobzqHszVBuL1n/+SRyK1Md4Q0F9jTgi/VSdxIiLNOe+pr9IsZQZdX63YEHrI4CHJyxDwItvbIheONwZDWWbGAbxZsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(19092799006)(366016)(11063799006)(56012099006)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW5vbW1OdnJIelhDcTA5WldoQzYwaGF0SktnMXNEMzNKU2dVcEMwYkNEQzZN?=
 =?utf-8?B?U2RoL291RkNoRGF0ajVpbGkzK0ZaOHJGeGtrY09iaitTdEo0Y29WcUwrWVhp?=
 =?utf-8?B?YnEvTVUvZ0RwQmZPN0pKY3NjUDh1YzJrb092SmdMTWJzODF2bmcwS3RIYS9O?=
 =?utf-8?B?dVIzb0VUT3RNQWY0QVN6TmE0ZE10ZWpseTR2WXNpcldnTVpXTTdVZVBRakpS?=
 =?utf-8?B?VWxyZS9ScTdOOXRHZW1VUkN0bkF2ZFExcCtEbmVGSVAzbDVFNnZabTNhMWI4?=
 =?utf-8?B?MVQ3RU1VMllSRWZkbCtMQUlYd0w0R0J0dlpXVUlLR25zMVRLK2V3aVZpV2FC?=
 =?utf-8?B?dGFnVGpSbWE0S2pGckRUd05wVzdpTDFDaW9wWXdFYXJpMmtnWnhiVHhDb1NP?=
 =?utf-8?B?UE01OHd4bzYxWEE4RndNdnQ1ZGhkWXlhL3d1TWY4enJtTk1Cb2s4NVJPaDRC?=
 =?utf-8?B?N3BLVkF3ODZSdSsycXpOM0k5SVBLcCs5aTZSRzRUeG1wSEFVY29kUmg3M21x?=
 =?utf-8?B?allzTkhLTGE5cmhRNEFXandOZ2FLZ1pBTGgwRFJwdzc3TEEyMjdvdzBBanFo?=
 =?utf-8?B?MG1pWFEwdmdPbFhZZUtYeGJGZGpWbWZIbE1aOEUwVy9paEQvM3NVaWdCTTRG?=
 =?utf-8?B?dEtPeEZJWGhaTXdDZmRaTER1YlNHbWdCYlJFYzMzQjV6SXRaRFNzQ0JHWWU0?=
 =?utf-8?B?b2l2dWZiUzBUNnN0Y0FZUjVBZzZlWmVtWVhmaTk2RW90cEpSTjVQSlgzeGQ4?=
 =?utf-8?B?aU5mK09mM3hnU1l3UzhMUTdVOGw3d3pJVjhWdU53clNuUjJqZzZ5enEzSlov?=
 =?utf-8?B?VyszK0VuaW5oRlpsWEszcjl1VXhpb0IzQWFNaHBjSGJZVDBBYnduTEdMS2Rl?=
 =?utf-8?B?STRwR1VoK1BOaVRoakF2cTJPbWhYZnI5TmJZdC9lYjE2WmZMN1RhMXhNQ2VS?=
 =?utf-8?B?MjZXWkNOWXY1Zys1SXkvZHlvV3BBSCt3UUViM2UycGRaUUVhK3FMRkMyNU5Z?=
 =?utf-8?B?ZUdnWHRBUnhYa0VaRGdQZEZMMGh1MldjNmhlSFRlNkN4QXluUjNtcDBnRDJ5?=
 =?utf-8?B?S2FRb3BXemltRk1IZi9Zc1A0RVFNV2xHTjhURUxIWmtoMDVwZGtRSFFmNzBa?=
 =?utf-8?B?ZXlRUGtyUStTdHBuLzN5QXFuUU1YbnBLV0hzQjJKaXZoaDQ3dktWZ1JlcitD?=
 =?utf-8?B?bjNKYVhJUXcxTkxtRmg5MkJRZjNLSXcrTjF6OVkrZFBORlVGR3pwVkVhdFc1?=
 =?utf-8?B?allhc2tzVUg1dW4xcjFaSVZvOUJMRTRlUW11VHF5cXdxYStWdE9LT0RVU1ox?=
 =?utf-8?B?Z1Z2b2ZSZ3RWM1Nzd1l5c1M3cWRVR1hWQjBTenNiUW1lR211b1dodGM2SFJn?=
 =?utf-8?B?WDVLYVpMK2tINURDWThaWFJRY0hhWFFHcXh2dUZwTzk1OFRNMzc1YnFhSzRx?=
 =?utf-8?B?dU5LZ2EvN1JsVU5KcHh5cGNXN3B4ckVIZTZsU0RNNGVRUUk4aGNCQzdpc2xD?=
 =?utf-8?B?TnRaWkpkeDFPc2M0RnNyRWVaL2NtNnBrYWFjandRSFUveHF3ZittaXpRdi9G?=
 =?utf-8?B?bkpXZGxVVldLcmZxYmdSNUh1dEVMWlhVQVBTZlhTQkNmWHB5RWRJUE82aTk3?=
 =?utf-8?B?d01BbU16UVpCdjZEOTFuNXJyeVhWTkJvYlB6TlJGZmJzRXlIS0x3UGRJYXhY?=
 =?utf-8?B?Tzg0WGVUUkdhRTRub0g1YWtzT3VsMzhLMDJtVlFqWlBrYkM4cGd6ZmxqeTQr?=
 =?utf-8?B?aU5mVHJUL2tReWozRUZ0ZWhuRGg1NVhlcnZzL2VpK1BtN2ZBN0lKKzVFcjdQ?=
 =?utf-8?B?SzB4THpaL3dyUmpFU1ZUaE03TFZ3K1FpVVlnMFNwcmxNbitBUzB1QkNZcGFV?=
 =?utf-8?B?VXV2cVowTVZvaW83emxUZXVJd2VzVU42aTZvRERPYzZjbW1oQXZRalFickNu?=
 =?utf-8?B?azZGMjlOYk9JYVJVeXhudHdycDlmVko2bVhkYTh2c1Ftc2N6ZTVXU0haU1Zn?=
 =?utf-8?B?Y1lIZFFDT2IxZGROZzFIN2Z4dTBUR3c0Q29rV2hVeVNtNFBVYlRjMW1NQUMv?=
 =?utf-8?B?M0ZsbEpDTHNpdXgxb1RUYU9vNCtuUlIrY2NGSVhuWkc2RjFSUDg3b2NlSG1t?=
 =?utf-8?B?WjJwanZ4NTJzZkVUTEU3bkpBZ3RKSGdFK2g5N3lEQTJEbTF1a2IweDljaTZq?=
 =?utf-8?B?TEs4OEd1S3cwaW45bmlndHJJOEt4S3M2UlZuR1VtNDkwTEpiaHhYamlVdTAw?=
 =?utf-8?B?djBodHRpTk53ZDdPN1NaM1NTZlBXYlNpTVR4UlZEbktreDZHeWNkUGFOVlZO?=
 =?utf-8?B?WE5KSEpVenVwNHh4OS92SGNGcmNzWFBoL0krTmJEL2lETHlRcUE3R2Rxb0Uy?=
 =?utf-8?Q?Pwx5zMcUjlBwVpM8s+kEpoZ70OwgeBKmEmLbz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae314c8c-934d-401f-5c54-08df19b0a035
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:24:10.5998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2OYlycQ2NIfxB4i2LiFryMnfs8tFkWkxrXxkoo4NZFY+/MOoT/oncDI1lrzIeUmWdRCWt0ciL7XkPiyxpgL/T3omzqs/+Bp2Mpi6SKKu/oGni9EHCLTAXxjaCEHmc7q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_132414_624599_3A4F9FD4 
X-CRM114-Status: GOOD (  10.37  )
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

From: Frank Li <Frank.Li@nxp.com>


On Mon, 14 Sep 2026 11:21:06 +0800, Joy Zou wrote:
> Only rtc0 was aliased to the internal bbnsm_rtc, while the external
> PCF2131 RTC had no fixed index. When both RTC drivers are built as
> modules, the pcf2131 may probe first and take rtc0, pushing bbnsm_rtc
> to rtc1. Since suspend/resume wakeup relies on the internal bbnsm RTC
> being rtc0, this broke wakeup.
> 
> Add an rtc1 alias for the PCF2131 on the i.MX91 and i.MX93 EVK/QSB
> boards, so the external RTC keeps a fixed index while bbnsm_rtc always
> stays rtc0.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: imx91-evk/qsb: add rtc1 alias for external PCF2131 RTC
      commit: 92fd18d609ff13e27ab9d19c4764633acde593ec
[2/2] arm64: dts: imx93-evk/qsb: add rtc1 alias for external PCF2131 RTC
      commit: fa7d47a05b464c5ec3af39ebd06b8b73abaa42ff

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

