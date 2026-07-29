Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426B8C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQI5cHNmt+69lGqmBrBzLU15gIo7kmo9k0G4wIIHaqc=; b=aK24I1mgC8qY1DBlYbG8aKxu+9
	AXW0VM0dwPEgcVFvqTDFali48Kck247vvYD1DRfDDs5+WttyXOYEjYG2v3lg8+Qnp/8bH0Gh83q3v
	1UyFbpv3aVj33NUAHLDVldUqchvWdsE6FwPTqjwIpI283AjaDRGBi2eUdFM1oTvsbCrcqoe4l5qS3
	ANPk+yWhCpYzZqTB6jUUXBcZ5gPN40+Vcoj20Xc48IQ+5LNU93l0WOLTYw7fcfe5vKmTOwrhNRnzw
	mFWUO++I88rNE7AKE3D3crTvBqXHFLqNukGEATNnDsdYmGbiceu/keV3Xh71ghIpm7LgJQhYG+7pb
	L26drceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2MC-00000007hvc-1KJl;
	Wed, 29 Jul 2026 11:21:52 +0000
Received: from mail-northeuropeazon11012012.outbound.protection.outlook.com ([52.101.66.12] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2M8-00000007hrF-2ql2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:21:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqH+LJUDdYTM3CLHarP9ieDXvqJAfjBS9ESefYrae64I4r9hRxkiyrR18Tjz0R+frhw28Os3WtHSl6l8lrPCHKqtAFHUFPTIZ0FNMe7hz9j0mwtdSqnVvgSj6IBvcuUUMn8Nb3SSZF3F5t7ZLJj2uPvppjZjhx6yIZps43D/Q7mVOps2BzddY0qD8V6Yi3fiCavtgbMhNz6LJN/GgOt+8ZM9S4TBDZcPLj51KUXJLJwWyVrXg/ZNZWA5A+w8kaniNxSkHXeTsGLj67VRO/JvIl++bAoT1SLlCDe3m0D1izidljh7E294lfLvwG8fYWVYBYJ1cQaGvDofXCihf8jxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQI5cHNmt+69lGqmBrBzLU15gIo7kmo9k0G4wIIHaqc=;
 b=mFJp3t786jVB6jBnzGCpxavFeL26PzCaQ7kEiOAUhPak7J4jJ8WUAQPef0Sq4puzvjobky5OzM7fqRORvzQ9a31Qm6SeW1KWX0DdIzfytzRy32fKfSVVeiw0jd/k28r2n1qQTjXY5XYJAsIDbRquvA7h2INiHQeyFoqIOAkUK8Q/Rx7sobowxjFIbZKONlhtsKjL/mVNQcsWD8fckIAsVov3X9SuQBEqhlCovra5lk+o/cL35edD+gJ7fkelDCbvLiAhpiKE5e4rnz/xenxt10eZsqIQeBuDMBgAT3BId+oKg8mXAUE426yqZ2W8eiQAuNUMNCX0FybAEWVuqm1PMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQI5cHNmt+69lGqmBrBzLU15gIo7kmo9k0G4wIIHaqc=;
 b=nZXTko+fGmGkBqFv+KjcPWHYP0wc6hN6ZWrUoullhdR7dnftmrKHbEIRoGqNDIYL+9Rg4bM9FRaHOR7LD5fy6dPc/lFlE01wbkga1vRwAbU2oUfK0i4oU77GVFP0yYhggOqlm5CtDCB9PqCQsadCB0aSigdTJHEOgfjFNXSQNdEBjs4Q4lF9KwI5dzyaW6N4jQS95wF+uOJQgHAyi+BrqYxVyittExYbCjG7v+UKlZcO0kzae4W0HmYyAnD3+x6rOhQfPJ1MB7D+FDxShD0f2vP/i9SVp3Ce8CvI42xXRGLezD8UjhHVeK8eiJv2/nPUxNTDoDEjfiYOfBUDNfmOPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by GV2PR04MB11093.eurprd04.prod.outlook.com
 (2603:10a6:150:278::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:21:40 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0245.012; Wed, 29 Jul 2026
 11:21:40 +0000
Date: Wed, 29 Jul 2026 14:21:36 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Guanhua Gao <guanhua.gao@nxp.com>, 
	Roy Pledge <Roy.Pledge@nxp.com>
Subject: Re: [PATCH v3] soc: fsl: dpio: fix kernel-doc typos
Message-ID: <lwmexm73uer6md654ov3f6u2asmrkzzyyzh2dckikqvohfnxup@jydxhjbw5kvg>
References: <20260728004938.905415-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728004938.905415-1-rdunlap@infradead.org>
X-ClientProxiedBy: FR4P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::18) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|GV2PR04MB11093:EE_
X-MS-Office365-Filtering-Correlation-Id: b1589cb7-2339-4d77-6290-08deed638fda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: KbAq8XFD4pZzS5zpKxREEbw0bwRyDxdoClFkYdRHbc9tI+RKsq+N613WVGTgUCyKOPFD042YL7Ccr7oPXyO7TIOh//Q8j6Rfsr/aQmpk40IDEBL8ZLwgTi/+s8TDsS/FaloKbcJvay3+cciFWJtmrgeBNHja2lQwkBGDsoKZb7+kdrlwlgRTLaIiiYcPuWzIpaPgbxo60xzdCIt59dnxpKGzh69zDqhesJSHd+SYba8C/JsJCmMhRFqX52R2N2BuRC1aYgPaO2sQFSxqbKxcrfjTzuPO+ULpyXMU0Y7xE2CWCfREsANgk5BwSwhZrbiCJ/V/iy7BGxF0Qe8puDOnlr5vdC4JQ+GEiJmO0KK4ZEf/4Fye2VcOVNLgi6SeQngT90KmTXyloiymKa0ZWSPAtkhtDogz077tTTyFUycRJX7AF+zpRBwfOCsrQmJPqGNOzwgSgf/wrVLD/9gUaAxGxAwWpRpoPX2Dc7MfZH+lXkOE7qmZXaBzPpT/plsusZym21N7KL9ZcnpBhwkcGL32PdY2DEeBSJndBCE5WAC0T5WStOXy69A589AqtCFE3dQG+NfxZ15Zh2hultEQZII0YZ4o7q3StEvxrNsTti/9zQCbCfJgGv3XJfWREJ66hBxoTAiFRWyq4tMzb5o49DR/b34r97HOYhiKmhF6fCLwIxM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tZ6RWl9Bw5woIlRKSlO6b+RPbJKXYAsveo6QAY2s8MG6N2myYfvkkEtIfKQm?=
 =?us-ascii?Q?azygY+sDvwBl/x1ywh3WZ6kiriE/iG0jlwRRTe6nyXkZY56C8zrhtn2g67Gr?=
 =?us-ascii?Q?1qtCLLNjIb5LfwbBgHOrg/YmsLoPoMa+ssPNvrjiYPr2HmRrIbTc8qtu53Yj?=
 =?us-ascii?Q?xWrwu3HKFRJ+9Uc+K1pUkCIsuyD/C/GhLsupohd2OAumCw8b9Gkvi3LADu9H?=
 =?us-ascii?Q?Ur22CUczUWWo3PjOzASuc1EUAr0+7zTJcfqhK/Rst0ONbZA/+omNoQbv0sb6?=
 =?us-ascii?Q?gPZ1u5TmJ8EQC3o6axhYHjEDaWxLy+E5R9LZWHxGdOtPuQfqVgBzwG7U3Pxi?=
 =?us-ascii?Q?wQKUxfaW3+NdfQhbXKVyDjfMOsnb7eiks5/TGCgz6P1xQzLG46XBwB9uMM+v?=
 =?us-ascii?Q?OpoZarNo4UiLR9g2xMjYnUzbHKCzvYkmcDiV8DCa7XRWWu0TqGYkKCg5m99o?=
 =?us-ascii?Q?SOBKSrcvHqarR8vdLJbp79ODFE9xqjXWSUInmzDJi4390eI1h2UeUoQhEtAh?=
 =?us-ascii?Q?ewZPjjuIqWbmnJHgwbKlbmClUCZtPxWIQ0n+BULrH1UUeTvDPdRKu+3/kVgl?=
 =?us-ascii?Q?AHmfF12bL9IjH5kQpcuHe4FVg00hiNMJiUmg6tKUx+yrgT/B755XxsjPvnM9?=
 =?us-ascii?Q?osAbOmP9RJqH5JFxw8sbIaRo1KpS0qZPwk+jCDWGBNbEW4eHNZkT4a3L0mLS?=
 =?us-ascii?Q?208lKUR8qJjA6Zc4Rfx8ogfLQV0nvmwyRreZS/biFxwLqsyL5M1F8KsVE37U?=
 =?us-ascii?Q?1xEcIJ9bfKXbVRQYEdNm7G950qH9GpwroXdEtUUcV0fuBa4+/cSiYDHCL0EL?=
 =?us-ascii?Q?0Y8hWal+9LkLXalAjntb24d8ysjOlEgwMf0t8qLp6BCKKnbClksn9L3xcbsz?=
 =?us-ascii?Q?IY3ohj/Rd4AZv7gtysy+c1Vpo5lAAzu5r11DDXrsf9zshM5KJzG2x7mHJLnX?=
 =?us-ascii?Q?eotekxVPk0yywKtPlBqCU1/OQlyoDYTNSfQIbRNIMwcvmfwZltSBqluktFud?=
 =?us-ascii?Q?QIhZPzmpyio9gXmV9fxb1BjXxRdjexpsLLjHuszl0uIxb+RKxeGDzLtlR1VK?=
 =?us-ascii?Q?xLv1ZT7fDirbEXwVlqB+h0uczQa6NW2UggL5hLZsFsyqouWdiTfo5cTJcwRC?=
 =?us-ascii?Q?APxu5Vzfeps2LNMvn9JwHd/23tisABjgftIyGGzxR3/qmzKHxq0HUKfEK4gj?=
 =?us-ascii?Q?2yhALXDYGbOvAurJyrR8wZqIN/aLlcuABamKIHQZf/3XmrWZnguVoF+n0eWX?=
 =?us-ascii?Q?2NmioOy8VBaXlM0aCMnThs5KfFs/J6ICoqD5LsQvqj/emZIJw4KROJQU9lHx?=
 =?us-ascii?Q?iDqVYFnLvDe/ns6vddZ3pRZbU0jaTS3SlX9wv/KbMOmoecDriFoPWi6zOiAb?=
 =?us-ascii?Q?nPUTr4482m5SBpDcSqitjth0hPyJY6H1BWOf5RImNmmgO/jWOp+5iPC1C0c6?=
 =?us-ascii?Q?vqaHjXO2VDuThooBPNrb7p2Yw/cS2O/ehTKH6t5Q+Wza2G5c31GwwqpP/4py?=
 =?us-ascii?Q?1YdQWtMfCDjCkb1mkUNv8ohyWTUetIHAU9za0HyK0MNYlJHS+Bq7B5OrndZl?=
 =?us-ascii?Q?gf/YPZUOqgdF3V7ITF2w+RdvUR0YOC2olOwuUd9xuap5ePDSxW6CQ7LdxHIj?=
 =?us-ascii?Q?xgZh6xkybEzorTLHvHXPSRhLo+juwDSPU1Hdn1+9EHmFmZHSHok4CbYfaduB?=
 =?us-ascii?Q?YtqBv8x+0OlfjSZrpk44bcHRhUq8xniM8QyglhSnC7+qNYbctnEfbAmwHJIl?=
 =?us-ascii?Q?muDBWQo27A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1589cb7-2339-4d77-6290-08deed638fda
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:21:40.5415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BN4I2P+cyF+mBI2Cb95biXxMGI2GYihCHV0jSeJUc/UxdFKnOfHjmkcwkGEigdnbWoHK56yK2h3ez5enTj0NcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_042148_735769_E6619E45 
X-CRM114-Status: UNSURE (   7.55  )
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

On Mon, Jul 27, 2026 at 05:49:38PM -0700, Randy Dunlap wrote:
> Correct spelling of 2 words.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>


