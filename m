Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7D2103E302
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZ9Nj47ZfLux3UauiRi3Y+zFkyM3dEn00zjUPLAE1GU=; b=3/Y78C+xnMg/0qJL2PoymA2/FY
	UMsf2X3mqIV1yz1JcsWVcTZ+FI9A1cgKKxYmlTY+5L8dp/NsJ1jSNoZvvH2vrwhpTWcoUVY7kzZ01
	JpTqF/40Ro1cKO900pM1LMsNn9OR6Qgoe7wQLHA5JS5TpEizaeif56QLPcJxru0x4nliApTusILe4
	UWzvdg+aL+0rpoUo5SLi6RNluIGwiG2cXBZjSZeVQydpDMcCDVeDnjlt8HkxXSmP5BfTnaBtlzQ7M
	xMrRlbIcwY+P3PLJhZP4mqEn046kkF0u2D5MUeyzMl6t3AqaJQ34SRDQtsE3bmy7PUfyl18kZU/vO
	Oji6hjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14P5-00000000YBi-2NTM;
	Fri, 13 Mar 2026 15:26:19 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14P3-00000000YAo-0dXh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:26:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnWzj13F3qlp/gN54tNdCf1nfo7H8Bbxsq4X2SWv7ezULfgtReCZFlBf+r0CuVA+wU8gN7pTSrwYSGg3iZ1HkVmmMFI4XrTF0VasXHIanO/AmT6rbxh9Ai7Pno10f4v6OAB3BtYFcb/j2Rb9Ly3NUJ0BYoJe8RXs8ztB+kanGlhPFdXb0Ky4/pXlE6/15xHZscpoxzQHxSkel6/wMSnZJhsLoTVedRADGBOEFzJtcq9gS4CFMBfz+ZnvM6e6OtGi7PDsjR8hNNtu30kuAokj+uJvP6zA6q8J4DSfSDHkRLiAWsf+bhm3w5q1cY3gQIEJNzC+BarJ7LLXeKYtkRtdYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZ9Nj47ZfLux3UauiRi3Y+zFkyM3dEn00zjUPLAE1GU=;
 b=eMykJD20EbF6HZABi7YnuwG+U6d78IKpSKePmSqK08y/cRFIyD2IxaiIJ/YhbALYJbmYM1IFs6FMHhvbtjshsrvbZseSOP77t62HPKY48snEQjHEPGDh43gCfzasrAVAnzLCfM32eiZYRrUTLBmetbMSwjaw5GNDWCOVFHm8hARfnDoptcOJIxEo2DCKQmN39zi3WMd/xOFHmh9fw2sh/Tx0011bpA+AA7Tz8LM6qOCXcn7nMIZChi/joxoe4sLDhcYQULNsmKPPS83sKJs9fxLhcFYPGwb8GQPR6QELVKZmN0D0kbClTyZ/QKc7OE4Xj+eKBv99lP+1kzoAqXWOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZ9Nj47ZfLux3UauiRi3Y+zFkyM3dEn00zjUPLAE1GU=;
 b=Ltgu8xG4cWBySEjEl/+OEF69Vbvd4yGhKFMHWnLJiT+bDbgcJR6zisn79Tal2c6+7GNTbByWmpXch9rm39eo8LW/T4D9FB7eq4eZd+zXiEG+zIssbNKqoc74jTGnDSMgezskZ2ZAOaQLQuM166qbzX3pcql771FocFZW+7l9LnYAy1dTs5yL2XFxLCs2LQP1rdoB9pO/JJVzh4YNNcVdpkrvqumhU/+VjLugpL826Ym3tiN+FbFcpb7kBwKsJsByGR7f/yj5S3bjSFvBPXEtcFhV32SRoAxRo+5VDhzNjaL8ko0NPYqCYYbTMsMGB8Nba4vsxvBys526T7nM06EXPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU6PR04MB11207.eurprd04.prod.outlook.com (2603:10a6:10:5c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 15:25:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 15:26:09 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: imx91: Fix TMU reference
Date: Fri, 13 Mar 2026 11:25:57 -0400
Message-ID: <177341551131.76261.353175266395826963.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305164223.2650908-1-alexander.stein@ew.tq-group.com>
References: <20260305164223.2650908-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU6PR04MB11207:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1e1131-394f-4c07-cfb2-08de8114da12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: Nfb3Uy2M+GtwP0Wp0yzsblIVA2BXpv89w01zNJzHL/K48rafY9g106Yre3hGHOBW0t+u8dWRifZZSMBouqHcDrIMcyuE1OBbKfLtWRljrc9OXJnGU9VqOdX/rcaDMR537NH7CmL2Qvw+lF3Hf61OnCIQc5ROiTrbzvcV/X0WZk6mGPUHx3czhnXveuhqjGlGEhkbeXnE9Q8tY36ybVYAXPFsBRes7IHP4uk+OV7hnUg+tG8B7LMpwrTNeaJ7w3R+OEEDtutDynjsqksp4gi7cNFRXiBSRJE4hDXsSre5yKNAPConcbZGZCHKMWL95lrp//9K8e1TeN7+1cZlcRTknxHODQveorRDO6gqZ7lyd/7rA8TppNlSevFfuqWtBDp4F4ir+5j2WX6DeE2Vbzwqb1fC1jdIwYff3QJ3jQYHwtHxJMevLrFQ9bJFTGyy1hPw/BFB+ljccBJygC9Zntk4JsaLqLCnJ1PWgutWsWlge+tQylyK2avb8F/ze1w3fSpRneVMwDEH5+j4fYuB52bFJ6U41eo7Y23TOiyxjQJ57wrcsbjuiv3YJDyoPkaNkwcdYspELY78fU/PDofzYYUCR8Wasqh9zbIU1VcB6XSBSf741KvuJeZntnVCckNhYk7Gn0DPuB+7DwAQ+OezCYbPo6QK0nNg1gKVit7yTTT4GZahPq6SdkLu4j+T4YGDRz1kA4oBupDopFaR9RSR6Dgp9QFj1pSM1EDaO5lzQl13SKKNvPIJ4BreShQstYuNFq1/ia1vyEP+CH7B5j7N1ety4YSE3ld5G0iIou1GyhYg7F0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T25WcUhPUWlJMmV1SjEzdDFVd1RFN2o1THhROVVXVCswYlBJZmc2Nmw4aUJ4?=
 =?utf-8?B?QnlOeG45b0twaDBuOG51TnlsN1NzUE1xVzNVVUdYdnNHYytwQVBzeDlzNnhz?=
 =?utf-8?B?OHBTMk5sNUJVVktWSTk0MXhoUDhhWDFUYVpQYXRkdmVlaWVrdkw1Z3l6bXpK?=
 =?utf-8?B?dHh3ZWF6SU1rdHNpaGk2aHZQY2Q3alV3VzBpNkdzaGJSa0dFZEZOUFJWd0tF?=
 =?utf-8?B?Vmp3WkliS0dSWTkzWm95Nkg1ZWZ5c000RTg1YUU4MFFlUXM2Rll6R3o0bHNl?=
 =?utf-8?B?SUNydEtHOFJjcmtXckpQSVdUKzVTS08rR0dIc1VvM1FDZ2h6bXpXU1JDL2Mw?=
 =?utf-8?B?NE9FWWF3dVp3alRpclZLOWlVbnRhSlFicnpPcVVBcUlNa0x2aGgvS0ovVFpl?=
 =?utf-8?B?dzhJRXVZSmFXZGF1WUZNK3ZxS2lwcTFtTzFZbkFhVEk5ZURnQWdXRWxwc1VW?=
 =?utf-8?B?bEFwSU1RUDljYkNkNWZTVDcwd2EwdVZQN0EraGd5b2Vxa205bXd4Tmp5SHNq?=
 =?utf-8?B?MVAvaEhvaTdkZUptc3dNUWpJMkJGTVRzRTI0Uzk4QnBRQndSaXE5Q3AwYTg0?=
 =?utf-8?B?STJ6VlJMWEZhYzc5VTAwVVp3Q2k3emZTbEhiREdUYUtvZ0NyRlFxaFQzd1Uv?=
 =?utf-8?B?UWtHY0s5SVU1cytXQmF1cjRTQnlCVm8wV1RWelJTUHp1Mm5RODE0N2g1RXYx?=
 =?utf-8?B?d0w5c0l6dDdJWFRLbm5KamhKWkdITVFVY0xzWlp4eHZvc2hGcUJkTlQ3V1Ar?=
 =?utf-8?B?eDArOFFIRTYyTmxFUk1BbWVOT1h6b1h2K0xPMk0zWlQ0VGJDVlI3MGpoU1Fl?=
 =?utf-8?B?UnhkN2FhQkVQZWs3aTVGYTNVRXV0MzlJWHh3SC9ZRnVuUUJMOUd6b0ZQZEtl?=
 =?utf-8?B?a204dEYrLzNXWjdOdFB6b2l4MTFsRWFjRndmaW5pYWlHb0RPSUs5UVFzdWxm?=
 =?utf-8?B?Zm9kaFVrcStON0c2bUpDc1JjMkpvZnJEcjJpYmVwdmdzam1MaVNTQklsY29v?=
 =?utf-8?B?ZitZUnhrZzFRWlBqS2xzOElTSktmL2FkY3lvd3d5UkZEMVA1YnloOVduUTgx?=
 =?utf-8?B?M3BsZnU2U0ZBSmZTc0c2V3J2Mkk3Q2JFTTRRaTVJU1AyWTJXU1lHclROekIr?=
 =?utf-8?B?WExaL3VBMGxvTDFmL2JJWXRWWTNyZmw2SEY2T2Fhem9VNVY5MVJKNk5PR2VF?=
 =?utf-8?B?WGRBQ2YzcnNyOVVrZmlSVkprc0lKWE1EbURlZ0VXa1czb2RVWGE4d3QvS25l?=
 =?utf-8?B?MlRJMnJiWjdjWHVpVGxhVVZBcFNpeTVrMVVzQzBsdjdWZENieGRFUlEyTDNU?=
 =?utf-8?B?WmlpMXhPaVY1bW9oUGFsVXZvYk1mSDUvWDduSkVPWW9DdVM1NU1lVUg2YzBw?=
 =?utf-8?B?QUF4VUJIaFN0S2JlWDhOY3RnS3lEUHpwWXJyOWhiUVZJN1o4RzJxNTkwdzMy?=
 =?utf-8?B?d1hwYzJ6Z2hxaW9BcnB3ZGNpZXRzQktQMGpkK2RHTkRac3JJLzZkOVJid0l5?=
 =?utf-8?B?YWFGM0pqQkVjNTAyT0JWZjNhZGhHbnBrT2dUMVYyek84TjVML25rQTBham90?=
 =?utf-8?B?MEs0aVJ3eHVMdGZ1QVV6Sm81UXppRURQaG5NVW0vL1pRajR0RWJOS3JnSTF2?=
 =?utf-8?B?SmJqbGtJSFVRL0Nia3Z6SVJBZS9hOWtTbDZPUk02Um9sNUVsM1hkYi9QdkJt?=
 =?utf-8?B?VmpxMXg3Ulp4dEllemdpT1FTNityeWZmdnR2MTFnV1IyeHFKdXNicURlWTRG?=
 =?utf-8?B?aEY2V3BTTC9zSUhqemllNk5oNEJzQzJIM05NbG9mS1JCL0J5Q0NUcTFKV0RJ?=
 =?utf-8?B?YUVtZHFPZU9qaTV2MDByQk9QdnhIa2J1OWkvNmFRZDJvV2UrbmxYN0hOazZR?=
 =?utf-8?B?WEdLVjdBVzlVaSs3RkRoVGNuMHBXLzFWOFpWQVc1VWtGTmw5Z1ozbkxOdTZP?=
 =?utf-8?B?cndEUTZHQjRMWU5KUzVxRFZicU9OcFNLdzlvQ1hFY0JtV1B2SG5ZalY4SVBE?=
 =?utf-8?B?TlBxelV5YUtkeXBwS0tqc0pkcGhLaml6NWtRa1l4aWs0OUZ0aFltSTNFNlBx?=
 =?utf-8?B?VjFYQ1pMdFVrSThneE5MRVkxUWFVc3NNSjUwN3lZaDdyMGdWT1VSQkVOUXVU?=
 =?utf-8?B?VFlIQXBvRTFOdjc2L0ltOVdPUGhnai9QbmthaGR1TjFqMGxlbG5MczJOMUdC?=
 =?utf-8?B?MXdzZGJpTCt1cGwxLzNtVVdOYjRZNHZJc3gvbTczci9ZdEsyVHN6Q0tLWEo3?=
 =?utf-8?B?RDZmRjFxNjhkb2s4aUFpRFB3ZWMrNXNPOGRmcGZYbTJILzNCbzlzUW5CUnB2?=
 =?utf-8?B?Snp0SE9uVWE2RDEvZzRyWkFjb1ZENmZ2U3hhaUFNWmVSUURKTmVKQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1e1131-394f-4c07-cfb2-08de8114da12
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:26:09.4136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pODjiSix/79cvR5orX6es1VRPSRDNPCl76CqrO3YPTLKZ19/VT+JgzXdBCMGjqsApYHOWCVkRj44MtDr9ppUTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_082617_188852_7A24B290 
X-CRM114-Status: GOOD (  10.19  )
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


On Thu, 05 Mar 2026 17:42:22 +0100, Alexander Stein wrote:
> Currently a sensor ID is added to the reference, but
> thermal-sensor@44482000 has #thermal-sensor-cells = <0>, so parsing fails.
> This also has the effect that other hwmon sensors (jc42) fail to probe.
> Fix this by removing the superfluous sensor ID.
>
>

Applied, thanks!

[1/1] arm64: dts: imx91: Fix TMU reference

Update subject to "Remove TMU's superfluous sensor ID"

Best regards,
--
Frank Li <Frank.Li@nxp.com>

