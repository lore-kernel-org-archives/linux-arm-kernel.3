Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95EAC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 20:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SB5cditl4IJEdVZl4CFh4Eehci8aHRTZZbm4J1Xil3U=; b=JSIM86wD/599L9eXCSYzn1SoEF
	Q7GUMJHXg4dLn6eyujRy2Uosgw2uV52RBWmVIpwmziZ3c9rC1rXvA2BX9KKSlYprywUn6X5XQQqXc
	8f4T//KlVrTvwtG/gW9rlR4NmV0urIOVCvlnl9lhQVuU5ba2ioQgvSrl3mPes7MGQh9iS+ts5aKO2
	v2YBCo1AmYpeNOKWcx2npfsSMfVnTicHkmPnhnSDoDwNIdkIzmuWpncLr0rrIwkA2uZQ99olPjiyB
	ygqXhfrlvB+9rUobUqpd3H3vbwhHkjuRZ26RviG8XL3JzWvbhcxpngLkXw3LTzBAu2mbAbFY/mj/j
	84J3GRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4Hw-00000006czB-1keH;
	Thu, 06 Aug 2026 20:02:00 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4Ht-00000006cys-3sEj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 20:01:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZNmrd7Ofpsx06YL1p5ZPmAUQkB9bNdtCo3KyaB70sXpYRKhUGHV41QzW7mEUTtTUyiPPGL3x+qt29peD4T6V0757bzVc33cqVY1oi3z3J/CT4y6KxU+d95vd27wv5GWEP1uge3XO+pFjSACmK9VtJ4AKGCNjY6W3GtkMLazGkg3PxTdgdKuR5VgWCqcdw7yD9Uy0Pl1TAlryWRm5GgJ1SLQYow06G7E57zkzaI6vym2RG8eqZPLpO8KENscRg4kGOvh4Np9zw5z3dE07MIWehM2R9/pENTgs3xdhmtzjijwOezhh4OjLrXzhT/BPbloMex56y0TbGmGDSQp9iVLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SB5cditl4IJEdVZl4CFh4Eehci8aHRTZZbm4J1Xil3U=;
 b=CZ1GK6gZfBSqDgcPfn+MSHsU/tb8R0Oo/Yqp5xRg11laMLJLZR+Ussd7wfBxRjL0qFYDEtkw1/TWGVcvD4WJJbh+jaGCeQYQ8VMhVdHTjll0IU2pOuEtvJ4rIZfygPry0NuvMHwXsf9QzzT3KV3OgnUbYYAvgSm5OLX+y1rfnw+aaLeo3bqywa5pr6RCuvAl1ziuhM4guJLzGJHehrzqcSGdHZQpQdz6riVwDuH7AT9abKRX5ZOonW5jA2au24HE72LYmEEdEWzw4+hMTCfT9rJJUIlI29CYh7k6cqveDXXVvi1oUAQktH94Cr0JpU/ffkuOPKvs0y9iRqCy9hkV9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SB5cditl4IJEdVZl4CFh4Eehci8aHRTZZbm4J1Xil3U=;
 b=MUBKhjHqkkCz6BHXUPzSukmErQs5XBVhpUeQgSrBTUpfX/5RmAXVPdrLHzs1w5RKolUyL7dyy5lANJR89r5pWSpTh+4kfh8d7/9Nn5ISs2IL1CjSRaW/zy6DD5FdxvnMYmLvqngbgT+BdpLqd5E46HLVBAf+YDgbJmnan3HHCO1Tu/cH8GgjmKJ9A8EAwQAg4w+VCpTrknTzmZNvLW4a90toJoNlLhYY2L7jha3XM/7SAZtG5nVsoEKIlzFik7FV/Y3R9Dx0JNaWtNDDq54MyYpexDwDBgaveNP8kMjuLMj3gfu1yWVTvqWPKJskD6byJlHwQZ77gGiJdYnjLW1cHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB12002.eurprd04.prod.outlook.com (2603:10a6:20b:742::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 20:01:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 20:01:53 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/2] ARM: dts: nxp: Correct white-space style
Date: Thu,  6 Aug 2026 16:01:45 -0400
Message-ID: <178604640242.434686.7416342880856525289.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801210420.383984-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210420.383984-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB12002:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c0503b-d24d-41cf-2ae8-08def3f58f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|7416014|1800799024|921020|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RmTcu8xP4vJIDJK/qLzEPZJH9dhg2PFuguH7inUNoq8ZkMb4k/oJsnOJBVf2owbCL8lB+tm0k/W4oPEDlccJzasTpprez/+NQpkZxfNAlh1Ba0cYC8PwAqZkDQK1g3Cx1mV7G3L+pvmQ7L1oowBT82SV2t6tVaPRwiavz4RHThFkz9zSD74YAA9PIpTS584V3UYuB5Hdffm5wtL+4J0SLO8XVpN5g044j1XtXY9qaN2RVDPJqii/A2bBCj+XAmzqV0zNNrYQ00WxabICWUe55bNnWEBLtqyK7fGiKNtGqxqpyDzeTk91iSDM+6sMo2PNjs8xctzgasj3LS8k+SxfPLJO7Dg4dG5pwxCLc0ZLq0TmNrdduM/IVWUCwAF1LT6w14+2O0kJtSCwn1vv8qyaDsmyfMKunttK78Q5sUrzka/d0uExnf6onrWDEP0jhiE70mrGUZ3kSdfHH2vHGVkbQ9D5Z23EFhQwoT6ObVFS8eF+ZbF0PURNWtGBGKPsPNVDJl6zmERXWzekzYlI/tdgcTzXDatZS6J2IBuaOFtenHcshLTD1ZVUfqMHohqLLFGjLJF9CRAhle3eXuq++cj9g4A9uqX589TWY8Dlm0koKEP0fAUq0DlZuosetXuI5jCt5OWF6G7bz3qUa5OQRzodorvYq6ePUHBeDbhsOT3LuDo19wC+nwaCsKWLY8TyU2+5ho8bdLKVWSW23eM1MhVg7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(7416014)(1800799024)(921020)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlE3N01FWWJpeUZRY0hnS0gwMGNGbTB2UytkQnVHc05GbEh2R013S2JvN1ps?=
 =?utf-8?B?LzVuZjZ4MHFNVWMxc29DWUVpYmdSU3JRM3FIaWxMQ1pFR1JZSEdpMGQvYzR1?=
 =?utf-8?B?VWhZa0VzQ0F3SGVianlaWDl6bXZFOVM2N2ppTkVYQStMYzF5ZFo0TkwvTmNU?=
 =?utf-8?B?WlNFaktlb1FPN1VHN0EwYldseThmaTgzeFlJZVlMZnFXRGFORDh6RXZ5UmIr?=
 =?utf-8?B?UllMZWkwTHhDK3k5UHdCTjBkcUozSEduVDMrbGhvMUVwNW8vanFZTG5oeHo3?=
 =?utf-8?B?TXRUUE5iMkpyZlZ6dkNFMWx5YllqZEZFSmxKYmpVSEFlMWpuYkJjSCt1RWk3?=
 =?utf-8?B?UkphOTRXeXQySXA2VkI2UVJWeVhPT3BabVJDNDRZaldSQnF4RVkyZGZRWDgw?=
 =?utf-8?B?TE10bThZTTd6WjFmT3hWRXZ1QTR4cHhJOTVPSlJ6ZUNCdmZwWnBaMGhFTXZr?=
 =?utf-8?B?Qm13azhuVnRCTWU2cW9NNmQzMll6MWRuUXJMUG04aXgySGE2dm8rRk02cER5?=
 =?utf-8?B?aU96N0kyMm1WRnJkMnZQZlhiMCtTUjVQYjBydng1NDRzRmJCV2ZjU3hrV3RN?=
 =?utf-8?B?M0xEazJrVE9QeWEzdTBWVU5uWlBKZjVGWlVtRGtsUHdZaEh0a1pZdXFvbnBT?=
 =?utf-8?B?OS8vc0lLcGc0MVA0dnJVT05oQjEyQ3BtMDZkTDhYMVEvM2ViNFB0eTcrUk91?=
 =?utf-8?B?V0o3aWxrdWJCZnEzVm9pU0l4QWVHa01rQ1BGdEthUWRCS0JPcnhla0FOa0ow?=
 =?utf-8?B?cXdwUzJ5UUhDNEJUdUVoYXhsOFNQZ2wySk42WEtuME1xQUNRM3ljc2FSSXFk?=
 =?utf-8?B?MGFsV24wTjJmbGhpZXdzdElFL2dwZlhPVG9RbEdRVkJhRk1lRDZvamt6RTRm?=
 =?utf-8?B?cHVvZGt1NDFMNmgzNWQ5WXp2T3k0MVRydmp6SHpOSEwxcEpFYnZaR2pmMktm?=
 =?utf-8?B?cld2WXFFNitxbGxVdVl2TFZweERZR2RaVlpzRjhXd1F6Q2NkSHFzQTAybDN3?=
 =?utf-8?B?Lzd0a25MVmdOYVVUc2lQRFpVbDh2MGVpK3d1UlhQdHVUMjFoUWJUaWxRbVV0?=
 =?utf-8?B?d1ppUDFoalh0MTlGaEtwOTZaR3VSQkZPbHdycnY0V3VjM1Iwa2oxZGcxVkRo?=
 =?utf-8?B?S0I4M2s1TXg1T3drZU5HNG1RWEJscmk2anFxVkxHaHVXbG9NWTZZdTVvbnRC?=
 =?utf-8?B?cndNOFVyR3ZVQ2RvQ21ScFM2RUhpeVZOUW40RnRsVHBvOHRsT2JHaWplNHNa?=
 =?utf-8?B?ZmJtRk12dmFSUDhNSU9IdFJJdUdxaGdteEJjRTJjNVhpWHpLZk5vaEJxdkxS?=
 =?utf-8?B?VnJkdEpZQnBScFVWRnhCTkN2Rk1wWE1UNUxYL3dkSThCMllZVE1HSVVzNmJs?=
 =?utf-8?B?blNkOGMwMERhWVY4a0Vnak84Z2U4Yk9HMHZlSXRianFKcTlEN2hiemp6aFRh?=
 =?utf-8?B?cnJUOE9aSStJeWtTUTk4bk41dkVMRjJUT0dYMmlaZW04dGNWdFJQZnhOaWRq?=
 =?utf-8?B?OUREQmY2NDdJMjVsckdOb2hLeDNvVnBrVkRiY21kMkQwNkNFL2ZhcTdrM0hq?=
 =?utf-8?B?U21rVkRhdjlKYXNHb0tqaFJqTVlXU1RHTWVyUy9UQmpya25Bb1JIRjVwbEhs?=
 =?utf-8?B?MzQ0ZFRmU0tuL0tDQzhGYVlyZGxYdW5xYUpKN1g0a0JhM0hoSDVmaUY0SDk1?=
 =?utf-8?B?U29hSjFxanJOeVJiTHAwSXRXOGpBdHRNVHZUbFhsNk81cjFPZnV6amRVYTJV?=
 =?utf-8?B?MlN5V0dST3VuNkhKS1c3V3orTDJlbzY0S0ZaY2Y5STdkanFKYksrRi9pemcy?=
 =?utf-8?B?UFhRUk8rRk9BQWFaM1hmV1lLMXNpaVhISzlPZ0x6WmhabUYyWUZLYldHdnRn?=
 =?utf-8?B?akxaWUI5T2poNHB6YXJHWXdWUTIvOCtFUy96ZHlYQklCTjJCcHdmZVk5cWhM?=
 =?utf-8?B?czh1dTZjMm9VVkdrMmNBYVplTlVsT3dLOWxseStHdE1URURQS1pRc3BNdkpl?=
 =?utf-8?B?ZlY3clBDYVVlOXk3cnN6Y0hMYXBoZUFXL0pyR2xVbzFQY2pRRVJUYjZtQ0lE?=
 =?utf-8?B?NXUybWtLV3M2M3pnY0NIUUlkaTlLdDZHampndCtjcWx2V3hLck1hSHJrcSto?=
 =?utf-8?B?ZkcvbmF5bFVyQUxSWTJFU2lqd3ovakpocmpKSVdzZ0dwMVRucTRYa21qdStt?=
 =?utf-8?B?MlVqWldxQnpkalJJaEdNSGl5VmFNWVFKQUtuaitvcURzZGQyTTU2cTRYMHBR?=
 =?utf-8?B?UGs0NUI0TEwwdE4wN3E3SnQxWEt4SURLSVY0c3VML2lLMHU5ckpmZVdONFBN?=
 =?utf-8?B?eHNoR0hlTEZaMndoSFBla0dYbmlCTzcyOHQ0QVV5VjJjeGxNblpadGlwZmpP?=
 =?utf-8?Q?cjnZFsYbA8jq98FEcFMB42AkNOjB18KCB3RlA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c0503b-d24d-41cf-2ae8-08def3f58f80
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 20:01:53.5222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5iX9KhsFi/EiC6gNfA7bQjYrMB76lr3pJX1KB5QztggONQiWn1FSxz/Yi96eMZMfwhGp9s7J56aOwzbCtfdO4mR01Cmpwp4i3A6bhqmFsAmnmNJhNnT6JL/xYOkoXIdb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_130157_983697_A1ED8410 
X-CRM114-Status: UNSURE (   7.71  )
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

From: Frank Li <Frank.Li@nxp.com>


On Sat, 01 Aug 2026 23:04:21 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

Applied to (imx/dt-indent, imx/dt64-indent), thanks!

[1/2] ARM: dts: nxp: Correct white-space style
[2/2] arm64: dts: freescale: Correct white-space style

Best regards,
--
Frank Li <Frank.Li@nxp.com>

