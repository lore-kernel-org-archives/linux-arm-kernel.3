Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B5DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0qk8EJZswr1l5GUeCZJe/QHH4LtlXFQwGAYJPQoNgg=; b=Vrgtu/u9Y7/YXNy4f3ECEFl9b9
	erM8ue0lEf8fJjUugVS6Xg9Ilhkr0bnF4KdykhD8SFNTim9C2D/VvWCgu47sNPjSgbgQ084RsxV08
	TpWdJl+0Y90QiXEJ3eOUSIU7ItNhOjjzNcVqS1YX2kbL5d37LMfSlV3Da0rKvCg5lSNANtENSN2tT
	kVfKqQZ528yxW1rWDWPB0ShQX7SdXBqKKBCK/NFWOtZCgVzhjcds0GZWjGv1uWkmn54t5bP5LPEll
	weYxOvyNPP54hS9SrGqYIwBt46ykA9LfM7D2FQbQtSASrqatqlU1y9rRr1XRYHJyX9hTS4aLBlr4D
	nMEzkB+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJM2-00000009w6H-0WNu;
	Mon, 13 Jul 2026 16:18:02 +0000
Received: from mail-northeuropeazon11011064.outbound.protection.outlook.com ([52.101.65.64] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJM0-00000009w5t-04wW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 16:18:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIsNUbAn0hRfCpUiBGZI8jjrM0/0Q1UJpDP0cbDrubnvAfmZmuxYGwRkEo1cLNNExEscGQvcXpXOjgFKx3TNdrQKX2EDrhLBUi2kuu/M26OiIqfDsqvofE36Gr0HCFEdi8nEFm0d01clIyj9CJmIVu0B1PokFBFPG1gIo1c0yOzBqE24uA+Yc6ADyfUU5j19aeQQuGQJvTPjSjG36Vn35e8Y1UszasrjrupiTANC4uutg2YJe8NftgNYn+RFVauRN9QY7zMs+4HqEcpGbIiCYj2BDL8LZ66Z8U1CHcb8ePZSIAh3nOaj0LnmMy9HE6RQ2NuJ6B21h9dqzMm6RZbgrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0qk8EJZswr1l5GUeCZJe/QHH4LtlXFQwGAYJPQoNgg=;
 b=q4ZOPjyx6QwOEcBXqBzplMb6qVc9GzrumJ0ZvNN5sHe2JffDUnm3BsImuMFI0JIQM6mnxQMMTdnugopt9+6TRgxkLrHeWrgTGTzuuXiNBBe583vILscc2xDObU/PShRTq6Kffwm2jnGbUIoJG3OvR89VnqRcF4q6ilLh1ONn/OEf685V7Q0B+lH8HFvZ/OWGmvei0tMOj4tgjvyAwO/PF2sy33NBilKoT/NUPKatv4FkfpFIbR8B4wtUtuGl2zzvKKmsbn6pbwV6ghAPQ2KIec8844/NxGGYdw72pIvme/ah8W3E+llZ9fa7IfI6ZEIUqjeHFLfDfelpUP4oNYd/4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0qk8EJZswr1l5GUeCZJe/QHH4LtlXFQwGAYJPQoNgg=;
 b=Sn0ANH4yvwjZuJdScFk4iD8119gTohnOy0HtI1/BGC8JJZvssdXX2t3tNcOYb7fRqdh6kC/+3T2bzdsh+LcvruArY8JdlkIX/5sA0vUDcqT9ha9r2+xVkAXOwYTbbIPSfDkSNSaKVk0s6D9J3y/hrOb/B0cyVRHDnizVMuXmcBhjJR8yKlRnS1LTUsZ71MFQXT0gzJ0EUXhCjUfuibYHtmtZIqJQWcFPFLlHa6pgd1xn0V8Q1Y92/8rQSNpMEIw9AvudzZw1R0/OymHflYDxunP3hwOvIt7HYOUAtceVq8ibB2bg/Jrjg0MjQtGfZK3qNq4tJgFg3CncNuO+mXIrLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7459.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 16:17:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 16:17:55 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH v4 0/3] TQMa93xx on MBa93xxLA/CA/LA-Mini LVDS support
Date: Mon, 13 Jul 2026 12:17:48 -0400
Message-ID: <178395946226.444830.13395688359934093092.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707065151.1079667-1-alexander.stein@ew.tq-group.com>
References: <20260707065151.1079667-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH3PEPF000040AE.namprd05.prod.outlook.com
 (2603:10b6:518:1::59) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: cb499f1f-351f-423d-1be2-08dee0fa4c24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|366016|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: oSghS4xeHRviXajtTJJUq6xGAV1prOY8jx/JOQ9ToCJIKeHN7DXxFcNLhamTCHnEj6maYNZkEE+aRTqqppehuxDhF0MffpGBjaeUCXbAbPx2iROuMtqAm/YYR2q2ySWUbE3Aty5GBm6l9MA8Z2+TW5H228QlcCSBY7XIlmETEx5+f7xhcwi8Mn0Nfc7yDAZkau71YMOKa7gkVVh0jELsXCtuLNEMLl2YgCYPbQKHMLASdtI9IgBms6J0Vjxf+r4w1VETOkv2HzLMFyv+iBsk0zyt8bRBjfOJ6OciHHgHYZITwljwtDymAi56xkjtRkx2Qdyo9fqNYIv1/FJ66+gwPIFwM+KJpXI7sNIuaFo1b7kYiMOSt5iR/wrI3aOGtgtrhqruvzzv359mqCMkfgCZga6vk9UB+4cCO4uqxbtGg0FQMaDoGIFnPt2/qWQKrc7Gpj2JDP4RoPgPyjUnm7IL+H2DjyVjO9i0P6xGwj64b415maEMHxQLfN6w3nnjWw2BzcPwtP6VluOru2j77WuC3SLmVjadiB96or3thIat7iBwH+gl781CA5Dl6ri95F5FVHoHpeFTZKBP0YsZAKlBFzThjas7/J4ckxpMHNKEbaH/m537bEN5IUAWOuJeLNhCO7LHu69rdYJvhud6LP3uB1zZgJvr2FiZT1x7nON54uc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(366016)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGdCUkQ2MGJkRy9reU9tVTFRVzNTSkNvbGp4Z2Z0RTlNYk5nNllQMmNDTGhH?=
 =?utf-8?B?dUdoN2tKM1YzS2JaT0dEc1hpdFdiSXVNdWVaeDU4d1AwekdlTUp2dFhBUCtX?=
 =?utf-8?B?d3FDRUl3RlgvN1o4bk9qNVFWQTBabDFHVXp5Y1BjRzJIVmZVcGtXdG5jbm5X?=
 =?utf-8?B?dEZQKzJqSjRwVkJNNjFVK01FeUlYUkRhL3U3UUphYkNGSHRWUUdwekEwczBK?=
 =?utf-8?B?RDhDMHhhWFgrZ09URW5SMHdSSmRpS2NlalJtQVNxUHozSlV0RXlWVmNaUkJK?=
 =?utf-8?B?K0FLRXg3QklMQ3FaOEdtZm1Hd0owSnZOL0FETE5ZS0dUeVRHbHRDTGhya3lD?=
 =?utf-8?B?azlYTERtazdZeFJGbHVzTlB1Zmlvd0tlcURydlRHNGxsdHZlbjFIb2xGQ0xH?=
 =?utf-8?B?OFRPK0NIVFVhOXV4Rm1CWnVHODZhRTdkOTJid1gxMDRIdlpkdlZ0ckw1K1hK?=
 =?utf-8?B?WWxlN2VpcFhCMEZlMGtlMnFFZGdnL0sxOGxvRHZwNHZ3QzF3Ym0xMkYycW42?=
 =?utf-8?B?a3R1QVdIV1AxMlZ0Z25yMTM2MDh3Yko1MHlsYzVzSnlzUUZKcHBqamh1WC8z?=
 =?utf-8?B?OVZ4YW5hZ1hZdDVlZHhJVmFseHJidzJKWlBCK3N6c2FsTllHTzdzUmRLQnpU?=
 =?utf-8?B?aUpDdmprZzIwT3N2Y2hRcVRnN0lFK3FOSjNMMzYzbHl5MEZ6cXFndisxTHF2?=
 =?utf-8?B?czFBUS92RG4yRUlXbFBpcjAzTjdxdFpSWWRzOTEwT3NoTTdtUlBrdlFVSm9R?=
 =?utf-8?B?VWNJeWhqRVhkVWVCRlBzaTExRTQzaTFCNUpQbXMvZnpWeE5JKzYvVFcxeGFv?=
 =?utf-8?B?Nk1KVFRxdGdLL0xyWEN5NGlBMm93bncvaFRCMERDVWRNYVRxMEJCT1ljMWVl?=
 =?utf-8?B?UlREQytwTHEzbHpoM1p2Yis3ZG5OVUJpSDRERkZNOGpab1BqQjdQRjEyTm0z?=
 =?utf-8?B?OFV0QnZIZ1RTTzFXRldPRzdaSHdNNXBWUTVUdmFKT09NdHljLytWdEpIclBj?=
 =?utf-8?B?Z3dLLzYxSkoxMTFVeTNtWjFDVDRnRkFHSmZ0TGxqUUo4aUt6NnBFcHhXNi96?=
 =?utf-8?B?Ky9ZbFFiUTIvdFFzK084TmtYbEhkamp4bXdjSVZJZUVNZ1J3UzJSM1ZFVm5J?=
 =?utf-8?B?VEl3WmN0Zk1ndktFclRqemZzMEJ3dnRPcVMrWEJYVGF5QTVzRmtZbXpBKzU0?=
 =?utf-8?B?cHhPZzBMamV3OGRWV2V3dVBxdm1EdDZRcEpScVNZWDBWNW83d0xsREhFSCtB?=
 =?utf-8?B?SS9LbGJNckdWSkFZaEVlVGVpNTBmWUZkbTArcWRObEk2QUJSWTdsYktuK0tn?=
 =?utf-8?B?TUYzTkFGNHhZZHI3dDk0WkVPaEhrTE55SW1zb1V4T21EM05PaFozQmZtditp?=
 =?utf-8?B?aS9zVHZiMGY0S24yQzZNVkV4TitCTWJWZm9WdUlIdTZGa2RnVkJiS2dUOVZN?=
 =?utf-8?B?TWF3NjlOZS9OZTV4TmhiUm0xeHVLSkd0NTZhUnpoYTFXVTdKWUNuMHlUUFVT?=
 =?utf-8?B?dzBCS1lUYUIxaHoyTVk3Q3cvSlNhZjdISXJ4RG9iem52T0hwVzY3dDJPVWFY?=
 =?utf-8?B?OFltZ2x5cFAxdlprd0hFTWhuNlNRMlFlVFBpdUJ4ekxXem9rSlFTZXdqU1BS?=
 =?utf-8?B?b2E0MXpDOEd4WkhzNitqVUVIdGxVMSs2T3dMNzZpVUtUeGovWnloTnI3Nm9i?=
 =?utf-8?B?c3F2VVdZQmFMMTFnemNuM1ozVjN3YVQzRng4K3dsYmNNRTdLNU1BUzFkTDIw?=
 =?utf-8?B?N3BJZW43ZDRmbGRtT3grQ0lqbTU0NEg5S1UveG1RN0hVM3hZbHdaMXp6Q2tq?=
 =?utf-8?B?QjBWaGN0RHUxZXNNQnhBalVnd3laaDNvMWJXZnhlR3FDOFl3WlJ6TFY0cVRG?=
 =?utf-8?B?V0w2dUxNbHRaeTc1M0F0WFE5eXd4UWJIUTZaSXkyOVhiOVlvRzRiWFQxVCtG?=
 =?utf-8?B?NEtPcW9icmt6b1Q3bGZaL2ViZXMza2tUQVJWVzUrSVN3Z09JWUM2T3A3TDl1?=
 =?utf-8?B?dmtzK3Zia2NNejV5ZmFtYmhvT2VWekNJVWdDeUQ5VVRmZE1ERU5ZbThNazAz?=
 =?utf-8?B?NXRwSStEQ0RmbEwvTC81S2ZVMjRoMnRLMERYQzY5MmxNRmNNK2RYMVdYemVw?=
 =?utf-8?B?a0ZFNC9maTZWZVFNOURXZFZCZDE5aTZabWlkbXdiSmQxL1huY1ZSdUh5RFlG?=
 =?utf-8?B?eDZDWFNRU1JkOFhsM2hadzY1aVBwcHRjRHN1dzZqems4M0o0RkN3aW0vNWxK?=
 =?utf-8?B?Q3BwQ2xlSlBDb25HZU0yamcrUklqTVFZdCtZdFRLOVFQeTF3VFZyRjZLS2wx?=
 =?utf-8?B?eXhLZ0dpZGpUbU42L21GQlNRSDlRUlVpSWRhY2dEb3hobWtTUmlXMTNFRVhh?=
 =?utf-8?Q?zv7Ahk8LnmzP5mc2Oau0rk6UU5/VvB+B8K/0p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb499f1f-351f-423d-1be2-08dee0fa4c24
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:17:55.8897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1wrIrn1zjyz2Fyt1EcAZGvkDOfAr2V/xZzMzO+pC31xC+YUBKL5+wknZPQtwKqIrinT+YpusGpnFNt+NQoKKRjzcRXdLzauQbA9fjF+Gp81rjepu/UcK+r+Qp1TtfGj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_091800_086150_CE932620 
X-CRM114-Status: GOOD (  12.40  )
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


On Tue, 07 Jul 2026 08:51:46 +0200, Alexander Stein wrote:
> this is an new version of the series for LVDS support on TQMa93xxLA/CA.
> Now that the LVDS bridge support has landed the final missing peace is in
> place.
> 
> Changes in v4
> * Dropped all patches upstreamed already
> * Adjusted for new imx93.dtsi node names
> * Fix clock settings
> * Add support for MBa93xxLA-Mini
> * Reuse DT overlay for all mainboards
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: imx93-tqma9352-mba93xxla: Add LVDS overlay
      commit: 3d04a8aa8e7a274b2ec2218d4e863b3befcdc64e
[2/3] arm64: dts: imx93-tqma9352-mba93xxca: Add LVDS overlay
      commit: 2b73b844564e4099fc43c4bbdea0c7abd65fae5c
[3/3] arm64: dts: imx93-tqma9352-mba93xxla-mini: Add LVDS overlay
      commit: fcf306c5f504e5dc4e25a0e81beccf29a58af261

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

