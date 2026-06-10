Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3D8CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31C6sRFZWwuc7BOXs5GwmqgDJ6wjYceVyR7N+wjZ9M0=; b=jUvT8YU53I5c+j9WmbcRu2i6sm
	TR34W4gJFgTYLRGUVNR72Cr2XaWsnKoGbgB/1fDYA1pWrUuYHQfsS6XLleTwHSuvYYeicwxSP2IWt
	QccwbxRPwUc279c9bYnsUQSlGT3FRnZ3q6v6mykEQ7zA4nJykNcyqr/SOccaQxVNDTQo7F1TawjpT
	HYX8o5IRk2lzXDvf2L4hsouOJU5VMaCcnfFCyO6rqm2CzcqaLj8JcNrIbwwirYcZgq1qKrxKPOQz7
	ll3Urn90ga5H9YTxVAliJZY1xT4JRdi2LjxqkZa2GYsFRLRp+v2SY7a+QvHmqleN7IFSpemmZ8tgS
	5vh4gSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJvm-00000007tOU-1jQZ;
	Wed, 10 Jun 2026 14:29:22 +0000
Received: from mail-northeuropeazon11010050.outbound.protection.outlook.com ([52.101.84.50] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJvk-00000007tKR-2aSE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 14:29:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEq+m+hbzC6UXVEGWAhsOd9+j3B4H0pV68lR5A+tVJmxuTI3ScD4YrxaNVujUE0HBQIG6eRKg4zygDiw20FvOtHAWHDW63d3WIyALmC87X3gGJDiD3oKIruixyHC9k8Jx4iBbl/lg2qDXxjvg3fa4Uyu5mJBU1MscMvkkHw2MiFiz68eAqw5D5wEfdjx7AJUNNy0Ub/7RVp9LfVtxQqxaVc6/QbQbndkfH2VNwPxZKXBhkolzll0bSvYTefhTmpb0SZ074SuKcpr820S0qEMkpuwv5nF1u4/Zzjd+7DmHIcJH+iR2SoB5wg7SmfrNlbDVOZR7FavNIsSgEKlFX1x9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31C6sRFZWwuc7BOXs5GwmqgDJ6wjYceVyR7N+wjZ9M0=;
 b=W8ufyZlG1aZnHvIhVYtVuwT12xlYEi3laSAJ1rsYjDY8dd7vseTH4YeyfomtBkpAaRZ6Zzv/22p13tqev40HYn8Ko7W9cn2BAiJmP3ZHBCS4Yx+/w/xzIM/Nkrj7K5WiJimF1o2pVWbNRYMzbNnRcfRjHLnYDxTBYkfSAjGjDjV2s42eVRiOV+0vbpiw4esM6XGVnZw6JEFJ5XhQmdrvcQBd9dqwDrkNMMXCNK7S4uEzzHOd0wuXh5zUvR9NpFCM18R0lFx/Qi+hSSNunCqXPR2aGCnUj6njh7Ht6iP3WOCTDS3RPNRQsbIoYF/npmFwEtsTQ15SjHcBhgbHSuPGNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31C6sRFZWwuc7BOXs5GwmqgDJ6wjYceVyR7N+wjZ9M0=;
 b=bGgXCQ/ZmayCQrQZtiNXP6gE48ApL8ffc4MDCfo09/ptQsH4USLAkvrTp+gA16NTE6d9LF6pEXIALFT68t31RqXBld57Fz7QdWuKU4Bb4PGa5bf6ZEkVHRIFNvp9NZbRYKJb/qIYiyRAw4G0Cu2czYqxm77Gin7MzB6PpAaLFxlXDTl4K+Jcpah59i/lu7wT/iCHf+9brB+qx+Z7WVff6DGFrg/umszNmefa6PDDj00uSVH0PoyvBGf0YkC21K96yDwihSufhL0F1xvS5k4woB6VFDwDKjEEsO2h4pRe3cN7G5AXqbUGHJ6leuzb0wN3MsQTWg96bjyoWUQCSyEPBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 14:29:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 14:29:13 +0000
Date: Wed, 10 Jun 2026 09:29:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <ail0sH1UhnQBPRkr@SMW015318>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <aihB5rVLsVqzg6cb@p14s>
 <aihIIwt_9T7yYxP3@SMW015318>
 <CANLsYkxw6rbWNom8rNfKurKAXKpihqV1LTd51D5YXG4oFP6-wg@mail.gmail.com>
 <20260610-accomplished-antique-mink-cf0ead@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-accomplished-antique-mink-cf0ead@quoll>
X-ClientProxiedBy: SN7P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS4PR04MB9621:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a23904-0674-46c6-a18a-08dec6fca4dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|23010399003|376014|5023799004|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Y8XZrOxZu4iUql5QEqWFJXn5I6KHRHcqCJVOnFJGqbTVTBdB/SalDdyf8XLKhzSlaVM8LkfwQ0unvFRJR2geZhDkXY3+gES0KJAt+AssmSRNjR8CJq0uGPGsZ8xPrzlStyhosDGhgaHarF80z8/ZclDG5TIf5AIUxN+2lV2PxzrjDLGgs1w5hr0E2nHlVXABeo1hzVuU8TSEVlg03c+b3xPXHfZA08Pdhzdczq22ZLbo1anvBhI6bzHKHTsuzTP14IUq1mzR2MffE5YEk+lrVq1WZnHsbEmeXgRPuBbRmWv9Y5YU6kKRsNHEXSTfaM5Xpvtc+TSQojgby3VNcpF3kpky25UQH0c/xFlrUF0O/+3zjvoZM2UDEoreGwmPZJTvXcjfpB7Qvr2JZXxruNIFtQE/4DNC1ZIVGKFxUy0p6+GPsyUNsq3NS/hbIh/DRGQxTQAOPjDwRha66wG0roVSH3O1QAFOfO+pgA30OZ2vk8l/wmZaP9uaxMVNeH8w4GicE71jz9OHnlL5pGp0i+LahMyDu6GdeLxs7hGABVfXtoPkDTABLxqHqanMsE/fI+BrSO75q1aIcXuyS1/N3EnC23xPLhf86nPOd3VpFM3+OAjbMkElqptmjucpvJp/FEc8RSv+P+FZdSvYBnZfPcGZeV2ZBRZo3xg1hkiN94hOXRkGvbOERVtRePoXQIV/2iwc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(23010399003)(376014)(5023799004)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?21q7yQ07OFdhNWc9NrYFgCThPHBkoU6KL2TtntnPY8Yg7aGeoM+br3vKVYec?=
 =?us-ascii?Q?+nmG7QRM+cgJASiSPgPeqrMk0VpDDOBZy/d8wNT6EO98A0b5nXbuZ42x7s5R?=
 =?us-ascii?Q?+qSHo1ByB/mQDpw+pF8PiRzqFOJ9/oX67b85ibKvtqXatTMeX3F0djaFVSVz?=
 =?us-ascii?Q?NsftHpEXREpS0HWkftrzequ+pcglBq0GdeGXy23DQqUXzogY4cvwBidmCLe9?=
 =?us-ascii?Q?8NDSg6dOpoUbvu9TzK64DdLfHgCLHjUyMY5bA1XuO/xJcHlTZ1Tj6RE2zqLk?=
 =?us-ascii?Q?Y8Ca3pV7QbHmOY4ZlDFVyUOsnGwj0iXKhnk1P6ECS51zOmpveuqvPtbqd8/x?=
 =?us-ascii?Q?QD5E9RwZh/II+yQUBTcZT+Q8PcV5D4Vd1ix7+NOQQEljGy9Gqv0/F3EPRJUk?=
 =?us-ascii?Q?P0mS0qLymViz3UDT6nOBjrbxCfvdDeADxO+6Omocq0yv03ouf45KW8oGl9qx?=
 =?us-ascii?Q?IG77JKym0nz3fXXSG1IeSx8cumgv3xtA0E+ksy5z0pGT5p+dNCl08FoEhv9n?=
 =?us-ascii?Q?owOu6+kK6zqOWDKrtvprmN7b3RposCvIPGLf4cj3EbEXRLA2vrIzjL/YSy2A?=
 =?us-ascii?Q?CFrBvKWRm8ix1MqAROExs82ZtxDeptaFLp9q33wYSEH28WCMd/w9WZNhnIP5?=
 =?us-ascii?Q?iDnCQzxtHOdNJ8xV7SdHtTMYvxpDG1eQfPVrXkUxp7RnYT1VNVmW/1hk2Ac7?=
 =?us-ascii?Q?AtlNdIEY3W3eh4HgbPuk8I4yRzEEJmUnCWKyuegFS+oz09UqzA/HKg+kkvak?=
 =?us-ascii?Q?Tm4isWUS7xBWPsEI/xNIJ2fsrH87NTYusUiACzwZZi6jFpc2rvlg6feSVEtD?=
 =?us-ascii?Q?0kmPSYPbNCo130kLXgdCY2tMrwnK1UQ/XihttI46AF4a7RYThjZtOGOfAUOu?=
 =?us-ascii?Q?9X/Lvv6h05y4oGV3vTYtZCNGZYF2mmej8YpvXiIjiouw06O0aq8FnhxGP4zI?=
 =?us-ascii?Q?mp0ShEeqx6JAf5qUbbfb04aKgTOZ3jCWRUVSuCVKq8VswPF82v9uN25vqoN/?=
 =?us-ascii?Q?0mWkGxSMsmbA1YvZ6n4DB7Zji37087qea2S21q26TlLdQcMnqAe+CLBaE7Oe?=
 =?us-ascii?Q?75EB12ZMGjOKGWGjvFBL8G7I9yGdC9ydJ18lZtZgjMix1iIZqq22BY9e3EBS?=
 =?us-ascii?Q?8qyDcF0PDCpK7JohDKQlQIoGvTKdnlvZu0mKQFy9JRVKKwPfa/UlLdjFNKjn?=
 =?us-ascii?Q?o9pY9CzflDsif1ujnpGtzzMbtgRKZ+RPlTdrIzw6iAupsKh2G2Ntunkw6R8N?=
 =?us-ascii?Q?H5Dpm9E3KNT+TVNeidxuH7gPvU4Pg1ytZzu0PWVmQsN04BXEym84yQ94ctNR?=
 =?us-ascii?Q?TKO1I0end5CqvJFbDT/p4WEasMzc8r5AAcg8mg33nVw3ErtoO4yTlWyKsIrk?=
 =?us-ascii?Q?nnXrebpcXxla6PYOCQMPjYdqzia64UIzrr4tmpFI1ZMj52JRUM4uLhqFx7qB?=
 =?us-ascii?Q?83jRd8P5KJSS5PAtLHw3tZueIdJS6kgUvz5XnzdcENAPn3tb4E98bidQTKZd?=
 =?us-ascii?Q?EKVef/XDIU0FhOBOLwpFZm/GC2S7c+htzNf7vg+g9LBPPSX2gTqGMhY26lrx?=
 =?us-ascii?Q?MYL8jJqSOeN8mSwTQDXFoRpU8lZCQ7ZwJXnjgQroa/Mtrlm6IikYZ37q7X8L?=
 =?us-ascii?Q?ndYKnwmRbS1Xx+ixIu5Ae/MazChNu1aTAY9KlhFz+qFAf03aRhtvJDVY9ViM?=
 =?us-ascii?Q?QXBrMQHy3zkpnSEmNllO3o3iZW326PDgiAnat6kbI+RjVmBVWDBW3m8Df2xj?=
 =?us-ascii?Q?gpB7TzvAUr1+GAvuM/Nm01xljfL1S/RtjPgqzBNLcb6aZjXwpGfp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a23904-0674-46c6-a18a-08dec6fca4dd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 14:29:13.6936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTMCyuUB5bG6JU4QVv+XuHw0WRuIg2UCZxusqTVyIO34Jnrmz2tuW7M/UmnxgsmLpQaWbbXg7ZZMNkoHXQzacS0ySb+Ood4wmyKkEdmP1mNV/7N83OCt7JcZ7v8vSACW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9621
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_072920_688121_71C5A2AE 
X-CRM114-Status: GOOD (  28.64  )
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

On Wed, Jun 10, 2026 at 09:39:25AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jun 09, 2026 at 11:33:03AM -0600, Mathieu Poirier wrote:
> > On Tue, 9 Jun 2026 at 11:06, Frank Li <Frank.li@oss.nxp.com> wrote:
> > >
> > > On Tue, Jun 09, 2026 at 10:40:06AM -0600, Mathieu Poirier wrote:
> > > > [You don't often get email from mathieu.poirier@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > > >
> > > > On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> > > > > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > > >
> > > > > The names of the carveout regions are derived using the names of the
> > > > > reserved memory devicetree nodes, which are referenced using the
> > > > > "memory-region" property. This adds a restriction on the names of said
> > > > > devicetree nodes, often bearing specific names such as: "vdevbuffer",
> > > > > "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> > > > > specification's recommendation, which states that the devicetree node
> > > > > names should be generic.
> > > >
> > > > I don't see what is so restrictive in using the node name of the reserved-memory
> > > > regions.  Function of_reserved_mem_region_to_resource() is already doing all the
> > > > parsing, packaging everything in a neat and easy to use "struct resource".  What
> > > > will you gain with this new "memory-region-names" that can't be done with the
> > > > current solution?
> > >
> > > DT Binding check can't find such wrong if node name is not what expected.
> > > Binding can't restrict memory's node name because there ware not specific
> > > compatible string for it.
> > >
> >
> > But what "wrong" could that be, and what kind of restriction are you
> > hoping to enforce?  What specific problem are you hoping to solve?
> >
> > I'll wait to see what the DT people think about this - I personally
> > don't see the value in it.
>
> I see no point in this commit, but maybe because the commit msg is just
> misleading. It mixes node names with names for phandles which are two
> separate things.

For example:

rsc_table: rsc-table@90000000
{	ret  = <0x90000000>;
	no-map;
}

m4 {
	...
	memory-region = <&rsc_table>;
}

If you change node name "rsc-table" to "memory", driver will failure
because it parse node name "rsc-table", which phandle point to. but no
binding to restrict node name to "rsc-table". So rsc-table became hidden
ABI.

if use memory-region-names, we can restrict memory-region-name to
"rsc-table" earsily.

Frank

>
> Plus this change actually makes nothing - no names are restricted to any
> meaningful values!
>
> Best regards,
> Krzysztof
>

