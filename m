Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1B4CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vytFf8ahPHa/kYFAOqisVqFjMNf4HGQkmChNANDz7go=; b=ARuOJ4H+C6VkD/OCdUjpTI4m7W
	IzEAZ/sj98HAeTsuAbniLlGBfNhjdnOIBObYbd2ebD447Jx5NgZ1lgniHWdLKMUnvDrTfGjN3MevO
	dsOJgkZ/43SSgqJk1VwG5XvpGE0CMAwGDqV/09AygGXBjAZ8qJ8pzdTlUni8KQoyGXhuyXNvh/CTp
	dGa4uve8Ig6PgDySW0lONrmRLBvui64rCHA2Y3kCE5Q5M6IzoGgJ5afSgyCrYbDlqXLEej9ssmbKu
	tnH1m9lv9TgpObVAjxcDI8dhii6lWnc2agB6EVNseXgNr4GtvQFTnVhBmC9T8o5P0T3p+okZ2cx5a
	dmW5SqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKWY-0000000EIZ3-1cSn;
	Wed, 10 Sep 2025 13:06:10 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKWW-0000000EIY6-10P4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 13:06:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvHX7+nqFJXmGlq47QivimgLA0qemMrCy3kU9xUSVcE4fIxY3e2++CbOoe6OYkcZhSdN9NW8rm4wRoyAptKhD4+fLlhKjizZjnuqMmaepdOSLzslX3wSMjVVrSRFdro+vSrIzwVCRkcWAXnH5TuPIaT33KPgu7+R7vdbjoU868xvA3GxqZerc18Wp58wqd4e6AVfqud6rdA6AO84NnW3M2jYLIQPkODRtRikfM8jqPR3/RHZuOrf2kdeanVXcSoMJ7NtUSdUiKkJ9XzXPvAgT+/W+v3eiwyotFnyzMMaHfgiFfjXBcJbJ+qvVIlTRphRlFB3Va9BdDqrTRiirim2jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vytFf8ahPHa/kYFAOqisVqFjMNf4HGQkmChNANDz7go=;
 b=D+xQvywY64DU3e/vkzmiMio4rYubOyWd0/S13ocZtSyDAd+wwawbYj0Ebl0xNAlwVkx80IFmwhyNHCLTRPFRqDzKT/wX3R7H+YkVK4CAgEH18MYf1P8QduRtGF491xKdX52ss8TaSQcrj8aFWNa9sxMSg1F29rkpVHxq7NJdehZNfrYEKpq3hOImvO5gA8Lje03etRf0arSkDicNdQyPDcLLSFv3/H1r4mByvcNGMSdSbwbPJ+xojjdZHVHIbw4/ipWp+5KKXzVznCZhKXp7fmGDyU9g0835PMD8ESOcg8SDrLiec2lgERneiyJriJDak4xXR+25GzcpVeId/5G00g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vytFf8ahPHa/kYFAOqisVqFjMNf4HGQkmChNANDz7go=;
 b=SBKt3h9LRmnb4FNykSxl5CfSqTwRgDujLosWSIGw/b72Lc4rHFaTQI6zIl39jPb2rdhyW1ZCuXpFgVJDd/VXtCIuzz3i2b4CTX/y0PYfoGqHDleb4YgRXwBPte8S3mKklFgm4r2DtyasE+HVrnU+K2mZ/K/mxE7QqftHaA1776RCti9HznandmzNkjWKhUQbM0e7OwJzI7GbQuZq0InzRBmBVPHIUFfEbytbHVJIVIX8n+LCpaK/skNNZ3dkrWdUGQrrvVwnMk5qf3nYXoC8BLwIZODwYgAXEnaG2ONrAFDUjChS61981LL/ozdlyDG9A+XTt+khBCmApwBYrDIt/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9435.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 13:06:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 13:05:59 +0000
Date: Wed, 10 Sep 2025 22:17:30 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andreas Kemnade <akemnade@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] ARM: dts: imx: e70k02: add sy7636
Message-ID: <20250910141730.GB29628@nxa18884-linux.ap.freescale.net>
References: <20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org>
 <20250909-sy7636-rsrc-v2-3-cfd9f44fd259@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-sy7636-rsrc-v2-3-cfd9f44fd259@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR03CA0130.apcprd03.prod.outlook.com
 (2603:1096:4:91::34) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS4PR04MB9435:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eba3fa9-7580-41c1-d8fe-08ddf06ac939
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|366016|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FiRgjtuHUV1gyHDFTT81EzaYqyv+GPhS2SkPd8oXAUIVVGZj1AWcek84H9do?=
 =?us-ascii?Q?Nq6ZvPYVZRWY7G9wwxsJnYAyTd5Svrzvo1RTkboGn2np0tQdpZzM0BNbT34+?=
 =?us-ascii?Q?IH53NEXC3oz9fmXM1va8CJT3br/8wYJR1fPVQCwNTtXVwCdoEES8mVnOBr4Y?=
 =?us-ascii?Q?PnsMgaIZobSC+ZHuWMip7waTgVCozpXjfxJeP9dM/eCAE4beS+4Rzg8/yjm9?=
 =?us-ascii?Q?/BctOVFwqTy0SlvEV+2O4ynwaXtGT5cpPOB71tSo/RJaMi9ksVGOgmYg4Rg0?=
 =?us-ascii?Q?e40ewpKFkuzwjiAAgG3b3oP7Qqc9fZwzpIjXEiOSl1Luv460lJrh1wRoK3Gr?=
 =?us-ascii?Q?OocNDZHwTvsCvT4v/AUTevWM3gRNT+4HqZdOz8DlXtXRJB/ZxJ/WJOy9o4cn?=
 =?us-ascii?Q?1Q6Av0hxEXhDVdmegtscVGm+Y0bIs5CrBJllVngMFkaiJjIkoyKOxQ3FK+5O?=
 =?us-ascii?Q?hgYZL4DpQ5sH1IM1YVCdoQWw9RzMIB5CMlmFefqh3SWZ24q4L0N1ig+8bSTQ?=
 =?us-ascii?Q?zHFEQMquPGXFRRRcIvR36B/8iRhKr4RYHJZpD6Do0T/8lOu1Q+lgkuEet1rD?=
 =?us-ascii?Q?04/7BNYubw4Hjb/QS06lnwk1Ze0w/+4tCz649xiuJxZ12V+SBQ8D3qqGyLhg?=
 =?us-ascii?Q?QiUikhVrzfC+VdQwCUPbQVYwRWs5R1Q06SLuMbxvL3tVjCxAeuIh04n+Mjku?=
 =?us-ascii?Q?NfNdiV8YDUnNvMsVGFW+KyrrF2HX99rAmROECnC+oUp6E5b0qxwRJ0U4ibKD?=
 =?us-ascii?Q?aG2ihtsVNcSPcCrCmr/9Qgn0k5ZcdrTuwIRBIjLgdNBWhLWD3N11zUWJZQyF?=
 =?us-ascii?Q?sX0dtPdSLzCx3N0UoIZ+rMKpK90TIU5YABsICJGmtGvGtZcq7lNZy+KMbKHm?=
 =?us-ascii?Q?yKHo4vMmu1vsFxYb3TTcE7vO5OXNtWJfyoCmytoco8hfN+XPMk5V2oFWNwLB?=
 =?us-ascii?Q?nS7s19I3vBnhKNxNKhlUtRHIjgvG3qf6TIBRYEoPnLULtNK/m1b2/L6H9acs?=
 =?us-ascii?Q?0e+579SRrqSVWIkCnNizNiZK9X+2Fkcm3rS3aj1RpziUpUzvdXXDzMHJ5O8B?=
 =?us-ascii?Q?u3VVUnDYGJETJwrztz97lC0dsG/J2eMg+bZXyKI6urERp04CAgS06yjq2SuZ?=
 =?us-ascii?Q?qjMHQulmzLaYL//YONBt7/bvfV4sBRo4sQnvfRwroYUVMhhYYxTnUffMsvXz?=
 =?us-ascii?Q?6O9AiCJ4+1HrOwis87jdoqHCswsalvgSIcWfiZLN4sEydtnfiJcAiyV+lstF?=
 =?us-ascii?Q?vmoYB1FNByIhRl4rneLsIKflCUwvxGDOmJAdv3xJukZ/Zz26ttOdhDph/SjB?=
 =?us-ascii?Q?0W75Fs91Bp2C65EVLrJbHImqBSOVWLGht1DA1JxvLV1Cx5VtDTSypX0RTQs+?=
 =?us-ascii?Q?3HAZ/QhXs6hnjJJbG9vt0AcM5zWiPGwwArfuldZeZ2sbdW3+2BBMmpAswrmt?=
 =?us-ascii?Q?R8DlHfrYr1obL53Z5RoWeQtMSnVUH8dYg432iw5B3LYwwvj5NNOa+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(366016)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mELbiaDnJjdHxJHDapmByF34pgk13GcZ98oPXC5IkI5nrixr64xp0btJAUtH?=
 =?us-ascii?Q?wXckxvgBHhN3ZFKjS+C/RjVLnrckHBLCCg3Mu1Swu1qTd/I8TTC13R9gOt6x?=
 =?us-ascii?Q?3zWOCeRMgohnEBLXoyqMnLZIP68C4+8hg+HksPkVughFWl8VE4oetITcyPXm?=
 =?us-ascii?Q?nZWdsTuo3GgElug+FMAvoNsl4bfT/imm79qkgDA8IyfOKfmHLgKcarR0bBIt?=
 =?us-ascii?Q?kKO9Rn9KqYpjQkJeJVOw5XXKAdHPBrH3sm/OG/R1h9F0bW4Oz21sgW+gU86u?=
 =?us-ascii?Q?RO7uo72gKcnShIFsDWUfA/ZT4XMB+sgCMFmjAD2sQRtIjqUfLrl5giJrFvD1?=
 =?us-ascii?Q?4occA4GslNByKkrEMqgeTEnZRQEoLmtghT/OsZaRZN3dE/AG4v84IYfGO1Ur?=
 =?us-ascii?Q?yQA88iOu65AiUmsWlEIt2umwhCJRl3L45ZUzFTKZPQ7CQxNbRSYbTElshF45?=
 =?us-ascii?Q?lj7bAsFqBjcAh1jm7XxprCSdQsQ5k9/o35IU2ZyXJlcUcA9yXnULJ0UCyhG8?=
 =?us-ascii?Q?DX4WVobWvx51J1Ok8X6T2JLqwemEfa/uWpUBbSZob4hCwemacH9RJtCrg+Jb?=
 =?us-ascii?Q?lls0KhSCxvgs4rxaKXOIXs6xeCVpMbMBHf/a+szEdmPZbLivtYpxC39hj7+5?=
 =?us-ascii?Q?EUfaIRRi/nCszYFOcdcu7Vn6bm0J3dudgjlQh90/P0qQWGayd1/rQ8CkZJAP?=
 =?us-ascii?Q?1SmJtuHAftFGg+64Lv3s9hwx9FRLtDMJU9QZSZdk/tCBDDg2+J+79dnHMtWB?=
 =?us-ascii?Q?eQOtkzZe4DVIeaocO0Oy39EF8jumyVTjNdB41PoWMl07Ych70wtQ7Y36Uqyz?=
 =?us-ascii?Q?ebffIdPVYzlDGDAZyytDtQ9Wycy0moaRbamqeN3vVkgGN/HnFJSPCoRpkB7N?=
 =?us-ascii?Q?l687e2h8vk2ARaTdYLbcUJbYNv0T/GlwzdZkenre1z69WGO+jVKk/6aLIveU?=
 =?us-ascii?Q?9ZKywRyDpiagAOu4LKikUPBkc2p5mZ436/BeaJQ+xqToeFww2vXOP3v4oGpm?=
 =?us-ascii?Q?4qTiYnFo+FeV3aDrbkuogtpVF1ytojEIl+IetREyz7E2UyIpa9dGzyG3DSPj?=
 =?us-ascii?Q?G/QXgc4YB2i281fo2ymu5epAJ6fSI9fGDrJpoV34hluezJj+QK8bNLXNC4H1?=
 =?us-ascii?Q?Xcytm+nNibss+mgiBeWagsXNt4vEZgF2ebwhIDgOUCp8BE1aye0HbseWRZht?=
 =?us-ascii?Q?fyD19P8mQIi8Y3Po024SRfvEPCcM0Ci6tXveYyIGlD7FsDgjm+X/QwlA3A8/?=
 =?us-ascii?Q?IGZXdwFxeVQ3oMI/v76qcKswPnzFiYUm0OTs8qmQoGmiITMFZz/ZeIr3BKnG?=
 =?us-ascii?Q?7L1EXlpIGWO/aKHiqrhBdd1YT08/QD0xYXSbuBp70y0vjB/t8T+8p8QVow0i?=
 =?us-ascii?Q?lJlPGcVQz7Qb7t98PBPIU6F5MF41ORWrtUX4wcVXfUHkvmDVqvGS6HAW29h7?=
 =?us-ascii?Q?6pJW6eyv7JtrrJf50S2MXASTOPY3UJVMOfYhqAgASZn+4b5tygMrT+XFcDTA?=
 =?us-ascii?Q?LOy39neISxZFAYuKeLdHAIY/ljRXr2yD+drXDZ0QfqXGsu1t24z5/c6ifkvD?=
 =?us-ascii?Q?U+9T3iH2AOl5bBxa83FDIsOsX/FnvfC7PTxD5jRN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eba3fa9-7580-41c1-d8fe-08ddf06ac939
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 13:05:59.1233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YaOZKj/P8YmDzdxjWW2j29U/mcxPNNwopPb3rByP787g2wCNXUi7OFYzgCmCiwNJga/PcNxNSpU75jmRMTPyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9435
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_060608_289051_49849533 
X-CRM114-Status: UNSURE (   8.09  )
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

On Tue, Sep 09, 2025 at 10:33:04PM +0200, Andreas Kemnade wrote:
>Add the EPD PMIC for the e70k02 based devices as a step towards full EPD
>support.
>
>Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
>Acked-by: Alistair Francis <alistair@alistair23.me>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

