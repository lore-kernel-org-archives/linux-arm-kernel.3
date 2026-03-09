Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAE5FCA174
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 18:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:References:
	In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSOXq7lqerSIhu6A270i+ld2eYg+1wmEwMTMNbH26wQ=; b=332zL7Bk/Fj7NFUTiqtcZJmYj6
	17DR5aacyfSNRj8tHzL40BuU8oyJGed3BTvBrYmch3OXOj7TbDuFLK/kb6eIWMUnIaiTjSqJ3TCIZ
	1SWfKksli8IZRf/hHbMRy+tiK+DM1aPZvuV5PKMCLRl2T0J658KumdwyJqfaySe4hm1wIT/ho0+3I
	geF/twxcGcIKDXMbMSCgrYNSeqAbtsUl0aWqjnli/uG6XME/XugVr/J6Fkkt8bYry09f9sRVekFrk
	yH/Y6V1CtDVFUom5RIvo0fuxtVmMY/SXNletLjoy+mh1kc82kj2ikoSYwN2PGf50CCiGGrLyWw5ij
	84cxbtQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfZi-00000007vMI-3EPp;
	Mon, 09 Mar 2026 18:43:30 +0000
Received: from mail-westeuropeazon11013047.outbound.protection.outlook.com ([52.101.72.47] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfZg-00000007vLr-0ucA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 18:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zO1m7XNUUQC/vA+cD5xxk6mmr+slN9jXfrJRpGIqE66dtptAJ6ZyWnQH2+zc2vZ3WiyPIzaJCIHatvZpEDS1KY5LcpGZ1PSTJtbBdZpkgdZ9HPUkLEyhE0SpHUfx/OtPI2ca/SOvMnKX91G338i0zusCvbdsUY018QR0G9ctS1nImGg0RSBSRArhqn6k9n3+GyQ85BM4Va1KjE7iGD2CD8brhYtF8S1JX/Au8J+vq1x/g/roNoxvkAqmZUc4pZGto6z9fv3mohLrqoiafYODehCuPmpWoppso53NkrDzSb2yTtioLxTrnD0lWN26h0v0GBvA4kuT3m2SjFp81NAHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSOXq7lqerSIhu6A270i+ld2eYg+1wmEwMTMNbH26wQ=;
 b=hvxrdPPV+zO/C7OpVqMyvmsAukrY7mMoUxEDIDGa/ig0BsG/xvnADPEQpWapzn94m4b/oZpKLvac5L/rzRZpgCglOr2DetdZYLUn39A1qjEgMsKR7lZAwaDR9ca9ejV98eoKky/OJDE2yzZVp7D50OoMVChoeox46KzY7U5E1e5irRbQG9h/8f4KFCTcCLFIiKBrW2HNLDBfVRwOSi8Sv/O7dZ2Tq4q+hdaC3WCr0ulRCArcynI07jpsVlv0/gnojwUXDC3+Hb9dfz/N9xmTXohmm3D6GdX+fTjv3tktc4rA5SzrIXGl6/tsOpDUTc+ny6yZzdIFySh05d/WgQMXnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSOXq7lqerSIhu6A270i+ld2eYg+1wmEwMTMNbH26wQ=;
 b=DwX3eMgh5CDW4kQJdRGBejR90mhH+LnbN/rnPIGvO9aM2qzbDyRaev+OncejkF/qPUGFGuqbAUSCmFVyep3nu2dac4yIszjqjbQm4H24iuvnXXdyc0SsCBeoh/s129HGA9NT7dzH+EzlLQqe4EGaLW5g2W+UG4tQQ0SeG0XbDlElQ/b13SN9NBBXi+PSxNhMEZvGO4HcQsiBxIEwP97Fm12OVeOp50zBVBnpNPEPDUa5bsPs80mnXwMTRZUOx5dLSDXKhvauV1Z1isx+QA4jItb3k0C7vZCCb7ZBfUix+qTIXtDGVJQYMAd/K6k1uZbREGv1U2Alz1zbTVQ04mpoig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Mon, 9 Mar
 2026 18:43:22 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 18:43:22 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, daniel.baluta@nxp.com, 
 dario.binacchi@amarulasolutions.com, alexander.stein@ew.tq-group.com, 
 Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, 
 y.moog@phytec.de, josua@solid-run.com, francesco.dolcini@toradex.com, 
 primoz.fiser@norik.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260227015837.1915384-1-shengjiu.wang@nxp.com>
References: <20260227015837.1915384-1-shengjiu.wang@nxp.com>
Subject: Re: (subset) [PATCH V2 0/2] arm64: dts: Add NXP i.MX8MP audio
 board support
Message-Id: <177308179870.1759015.14950038164095567649.b4-ty@nxp.com>
Date: Mon, 09 Mar 2026 14:43:18 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA1P222CA0169.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa4c0a5-fe3b-4822-2116-08de7e0bbd79
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|7416014|19092799006|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 3DMnVsI5IZ8Ifs8mkIrO9z/uOpsOLnfxvQe3Y6v6hXn0rAys6w0vTLdABb06IGNFdIp+vwc8PYQMth8I82sfYDPoV/iQ1in0RU5iyvIeNt1po/fUpwPcIrofKhtn8jiAM2yERdlbFXP79pEgRLbHR+8JanBx8rRGDRQHSsA3hp1wfCtIicda0iz7iqWjzvw4NLMeSv/a2nDzYu34UnqSW/wWAzUcHKS/sL755jYI2tNXzVo3IgH0sEnBqXqBivsSezC6MMmz6x26PxEY1jTqKR2MOAYw1pMbmLgb4W+ZOcpHAKqRzwHyyYlkpERaNwdVuN8VhoMq4cze1ZB/3EP6xYgqinzueg9tZUU2apPBV6et4s8DbWTP9csXGokb0hYofDvSjYIRuBfS39Ut7jOwQ9zf53dged71U0cX+lF5qnYzHoYKnOOgeasFDU2rVBB03rx1oZDbY0k3TxHAixSD+ZUzggWwoP2lQej1am0s26GSANkai7BkKhbex5ExXRHVag+MxPzqTBhdxpmTTeu7Y/CUJ3CA8PMj/0ERyb8LOgeBYtSZfoVytFI8E8rU+RZTXSA2Ei3mh7KpEMZLFBj/HPvJW+CtziXV2+JglXldURzsQyytSqGJMIOIBYSaGwEvitdHIxQrHYKCnIAEl1gjNFPiZ/vHTv+/Ax20o6ID8WliwgsR/LrNg+vmfgdoIIreEyVD5etKlZmYKvhEObpYY5v3TRh3f+WhuwunxRUsCtn222Df9bBYw7dwvEs3x1Luz+GYOHROJtBp0ppIvCpIEh3VPPbuKRvbGNS2TIiZN6ePRdU0fe9iyVZNjgDa9LfK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(19092799006)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?algzeWlFTEMxREc3RnBlU1F4N016YmUyTWtIa0MxUFc0THQ1TG9VTWlnVXVW?=
 =?utf-8?B?QkxmQmdpa3NTTHJ6alZMcmNpckpzVCszNkpLdDY3Z24rWUpJR3d0dTVKNlVG?=
 =?utf-8?B?TjE2dmRCaDlWMDRQcHFaRzhHdEIxa3pXV1VOL0Y1VFNBTHlXOXdmNitwN3Vn?=
 =?utf-8?B?NkxlcDI1ZThEaHEvM052VVJuSjVGRzdiSEJldWJOSmpoQ0tEQVYrZE9JS1Zv?=
 =?utf-8?B?Y3dqU3A5bzdVRzZ2RURNZk0zdFpBOXBLTzlIZXJHM2xTRUp2Y3NIak9oUFdQ?=
 =?utf-8?B?clM0bWY2TVhZY01iWmVqcDhjei9jU21JamVQQnpZWnR2TFF3SFg2dS9TS0Zz?=
 =?utf-8?B?MkU2WklkMC9kWXludVVHNlhlTUo5SlA2dk42RktnMkxkMGRvM09TcjZ0WGpR?=
 =?utf-8?B?MG9lL1F6VXR4K0ZRaWJJK0RTYURjcnBIRXF5RmNBMGhxckVQY2R1RVduV3Ex?=
 =?utf-8?B?Y3c3alFXMnlLZ3dXNVdoR3NsUEUweVRMVVBpM3Y2d3Q3VjBtRDAvQmZXWGdk?=
 =?utf-8?B?V3M2djgxWks0YzZNdzE1NFZMZGczd09HaXNqYlFFaEZ5VVdiVndFMXZ3bjVo?=
 =?utf-8?B?cUZRQS9vYTFxMFVUbzF6MVRzTUdHcTViaWw0NkZja0FOMEp5c09EZnZNVmQ3?=
 =?utf-8?B?SGlJTzVRbEdoMnBHMkJkcTBOWnU5dTljcUdhZjlUd0h1MUhJU2JTQWkrKzVO?=
 =?utf-8?B?M1ZVdG1qdklHOVk5bS9YVW5tSHRmQThqOUg4b21OQXdnQWZYcFBoVkhWWDY1?=
 =?utf-8?B?ZXdPT1JZOFpjYk1tQS9scithSE5OZ3VySnhrKysvNFM5bTAxRzY3ZlRWUTNY?=
 =?utf-8?B?ZXpBMTgvWkcyQWJGeE8xd3Q1MnFxZStoN1RGcHlmbTRGU1FoaWZhR1FqTGJS?=
 =?utf-8?B?Q1dhUmRkL3M5RUJtUWhtNWI0azlrY3gyd0hnL2Z1UFI4aUdsbHR1TWdveXVN?=
 =?utf-8?B?YkcraFNvL0V5dUw5MGtVOFM3ZTBZYnJ1eVpaVkVWcFUySVhrM3h3WndvcTFk?=
 =?utf-8?B?SHVMOVVOTGt3Tmg3MU9pc3hvQnIrdElnRlhqcUY2MTRTdUVoc2hWdk8ySlM0?=
 =?utf-8?B?QU5GNW5SZDIyTVMwRy9BS2l4KzQ1SlpjZXM4TjAzaVYyQkdFNEhkT1RYUDJk?=
 =?utf-8?B?czFVZU5KVnh6a1haRmFOUlVsdi9iUjYxaURuSkpzR2R5NXdrcW5GUVdGdkxR?=
 =?utf-8?B?UVNpbGtibG0zVWl4VDd6bFNzU2N3NGNnbjNMcVROckhsdnVEZzM3R1h0Y2Zt?=
 =?utf-8?B?dkxQWmhlTFgwMEIrSXU3bDBoWWMvUUJCZ2VkU3FndXZ0cXdHakthdWRHTEp1?=
 =?utf-8?B?ZDdoL3NtdC93Z0hXOFoxTHRsMVZySzJCWlhqZGFTbzZqS25YaGczRDNiWEJh?=
 =?utf-8?B?QjRoNzMrYnNpTUM0cXBwdCtKUlNFbzcyaHFxTWZzUmx1eklqcXdsaDVPTWtl?=
 =?utf-8?B?cUZoVE5oL2ZVNDhROCtHQmtLc3RHN0JWSU1OdWF2QVdNRjAxYjBuUjZaejM4?=
 =?utf-8?B?ZWNhWkxGZ25zdGNCZXJNU0MyblMvV1IxMFE1YUFEQ3FqZ1BTMHlQRkdqdFdR?=
 =?utf-8?B?UktTSGJtb0JUZ1RhWExiZStvL2NpZkVaZ0JNU1pOaExRYk5sOS9MYUx4MjF3?=
 =?utf-8?B?T2FuMFMzZng2YWZvLzhuR2xWWVB6K3ExbkJTU1BWbENFbnRIYmlnQ2dOOCtF?=
 =?utf-8?B?QVh4ZlQwUGlNNlRQZ0Y4OGZxd3NSUjZ3ai95RkVXbFh4eDFPQ3g5VlBHaDRB?=
 =?utf-8?B?dTJqMUVGSWM1NmY3R1BXRjVheGdHYzlpbHVDZTJqOHRZd25OY1JtTTdMRVFN?=
 =?utf-8?B?cFYvY3ZwUWhaVkFKeGRqVWZhL2R0ajU1Rm5VNHpDVFlONE41QUNuV29YQTVs?=
 =?utf-8?B?a1k0V0JJb1VHUC9jb0FLNkhydkdUdjFsWC8wOVlIK1lxRnh4TnBkSWJYbHpV?=
 =?utf-8?B?eTJJSW5VOVIxQlROVEhaOW5SUWY0YXprWUczS0VoekhYVkJVSFphTFpnZjl5?=
 =?utf-8?B?Z1FpelFlZVRvcEhYcmRIUElTRE1xaUN0UHZBVDlkQ1pyQkRzcFpiMkhCQmZw?=
 =?utf-8?B?R2NqVDg2c1NwVHNDUHQ0d3VySW8rRldWcVBSd0JsMlRGMWFxU3pjU05zYXdN?=
 =?utf-8?B?Rnczb2ladEdNSzRlaEhnY3NkbGlEdGZHZmRDcGowSlJVdFNzck1hdGh2MTA0?=
 =?utf-8?B?MitHZWpPSG1MNGZiWWw2ZzNwSjBTU2U4R2ZpYmF4cUlHeHJFdWxwOXEwdHZj?=
 =?utf-8?B?eEVFWEkyYkpKRERTT3VRTS9zMnFMaEczOGlBVVFlLytTWmVMMUk5c3paanNK?=
 =?utf-8?B?b1dtSytkcUpYZC91ZkF3WUhQYXM3RGppaW14QW9LSFRHLzlKWW1XQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa4c0a5-fe3b-4822-2116-08de7e0bbd79
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:43:22.4322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeQEJ56P73whHeM5alWJw64VoSDG3m0anEnznurpidkk0gUFSiwQrgHQ7h2/uSqGvw7Y7gOuq2Iu2FNHgPjehQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_114328_312870_4445979E 
X-CRM114-Status: UNSURE (   9.67  )
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


On Fri, 27 Feb 2026 09:58:35 +0800, Shengjiu Wang wrote:
> Add NXP i.MX8MP audio board (version 2) compatible string and device
> tree file.
> 
> Changes in v2:
> - Add acked-by Conor Dooley in patch 1/2
> - remove ecspi2 node in patch 2/2 for it is fake device
> - modify codec node name to 'audio-codec' in patch 2/2
> - modify pmic node name to 'pmic' in patch 2/2
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: fsl: Add compatible for i.MX8MP audio board (version 2)
      commit: 82520a90533ed16671db4b5eca488bb020bbfa78

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


