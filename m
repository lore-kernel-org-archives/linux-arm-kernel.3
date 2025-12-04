Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB96D1CDB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 01:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLXsg8l2HotvEYLRwR3uftAqIH8eecM+3iXvxdQHaIk=; b=joQYUp0fWzPTsHVJNPcayDeQr8
	cStlWaTkQhduI/VWBDxw7v5BokyL+J9Dv8aD9MLdu0evlurfAMGduEK7Ut/YntRe1rRb3ghNT46cC
	z13U5l5qCioIDvnsv9tVTx2qK/d8ZYliz/fgmAQhcKDm0gM75phSzhhqdvj8dB6PX2m5Z4+/GUNiX
	VR7cshe1f39Ch3Gq2WkOUj2LOenaJfv4Rkng3nRVjjfBVrscUEpB6CxvgKkNOSIQE02sh0I4jdot9
	2Bpvh7Hb+5yh246qb6uZ6CtHZbJMByoK62V4dsCxMwIyj5ygn1Ha3aKhuUvfOTAnJjl+hxHT1Sdha
	+Kzn9U1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQyBB-00000007KsS-43DQ;
	Thu, 04 Dec 2025 01:30:45 +0000
Received: from mail-northeuropeazon11011052.outbound.protection.outlook.com ([52.101.65.52] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQyBA-00000007Kru-11VW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 01:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDZbR78VuMLkjOW0MqP1g2nr7dDFQtChOVqVja/q+tAyEszi3cPWn0vMLHlgIX+Ge0r5WhcpvILD4v0RUopppzvb1xC4ykx9dlh6AIbtxkwHpWWnMPNcWd0ek6VhXW1jCxxShVixBs/km6vIjQtWRLEwH1iPhHkC8EJosJcp3PFN81G4Tjji1KqR3uQAnV6nN1I1G+ETqe5MQdtuZPc8632gNKJmfEfsfNP+sY2Cv/ZG19/RiLUg8zVlM07cvAMarqVCRIsl3+DtfYqgsEOLnISe8EeuPAl6QC2X4U//trqun0+pENWPTaf41mD/4Ml3G7J9p4Me/+y4eK3N5jvHCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLXsg8l2HotvEYLRwR3uftAqIH8eecM+3iXvxdQHaIk=;
 b=s9HzToZXa6IDrjXougltKv1xsvXh+Eujsq3hNcdAMNr4TvbxC5fcediDedrNWMV8J7NJ573437orGgF6wd32awYNEA7IQl01OTXyTpWXp27V+bbLlMNcvd5pq9rT6coWcdlf510tTEd3gn1TnPs5FOd0mCVPUTyI6VtPGimNjrAmW61j+73+uNjWcpZ/LMjY8MPhQz9+BqxtXitqlfahS+DLMouA8oyZmUlf7hDOjKlpW612kGWHdSNESUE1QkTMUkKw4MgAfozuvlVX9moqyuO5Xr8u60yAV7NVK4PfpkOHGmWYY7rFRIyrJeMjjfQiG67h6pU+hb4QSxN+2F0DvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLXsg8l2HotvEYLRwR3uftAqIH8eecM+3iXvxdQHaIk=;
 b=mbu8iTCe9F06zfSL4mlhol0pyW4PdsuPERkB3SuBE/KGycHbI8tCBtb1tmOh+b236qUi05QkTUPXo6LwWviEk4d92uix/T2pekfxTPxmNdPsuxwNnJoNAVhCfDC6CmGMU0fd7MZPZFbC+2KxIE1vyQWFjpPKvydubBt/nSMIcaG3rIGkFvH30blZGTBhzobLQchSQ0pgXE59vx3zBrWqF5NjSqrps5Gm8Al/OHFClDdH5jE1n5FQ/14EcOZCzD2MFMEwkbzlwm33orMqGpxjAigKaOQfoUJUztQJ4dMkf0Wgnajv7e+Msp6PtasWWIf80W3zCfO+NYMsIx4PeZU6fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10994.eurprd04.prod.outlook.com (2603:10a6:150:224::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 01:30:39 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 01:30:39 +0000
Date: Wed, 3 Dec 2025 20:30:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	carlos.song@nxp.com
Subject: Re: [PATCH v2 1/2] dmaengine: Add cleanup FREE defines for
 dma_async_tx_descriptor
Message-ID: <aTDkODHZg0JfrZJC@lizhi-Precision-Tower-5810>
References: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
 <20251003-dma_chan_free-v2-1-564946b6c563@nxp.com>
 <2c457a46-2b7f-4d66-8555-3b3cb52afe64@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c457a46-2b7f-4d66-8555-3b3cb52afe64@intel.com>
X-ClientProxiedBy: PH8PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10994:EE_
X-MS-Office365-Filtering-Correlation-Id: 32745078-d22e-4dfe-84da-08de32d4bb95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|19092799006|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Aji4s1IXcgf3pPNdl4CHncBL0qHVM/yV/hSGn3F4JQCsH2G5C1l6LjY0Eiok?=
 =?us-ascii?Q?iRdYNJ+n7o0MgRReKOACa45qG/ZAEJtL/nfBGEWHPd2HpMdQZ16Xd5VOGO7J?=
 =?us-ascii?Q?vzuBbyAX5YOnpxOPrzF75rrfzCAfUw4tH+nroQyhwy+aH3+uO/JcxriD0vT+?=
 =?us-ascii?Q?/d6SAARtY5f8+nftBSaWGAVAbywomFstbsjmwsFSHn6V5RHnBBFQCEtsKxfK?=
 =?us-ascii?Q?nqRGTdZIinrS9/FCqDaKc/IStS1mJ/5N/xkA0p03qhleGKcKp9PRiGqwIQBJ?=
 =?us-ascii?Q?yx5/LPjzfFySZTmCP4Wp711Ag8MRYYdamAsu6e5Rdzan+lMj3DZBHes2yAV1?=
 =?us-ascii?Q?uOuTLE1eNEkhvi5DfSQaeCOF2P/LimlpVYvklkl+XaWIyXLpjYO4oT4A7J9w?=
 =?us-ascii?Q?QFzrvE3kr6qyLRW14bTc896H1L1en2dG15Q2AnKh8zFJeNfEXMcnitgw3q7z?=
 =?us-ascii?Q?Kth4xfGxhXyFp4apP+16X2vYG7hTJbUBiO1ipC8IXJR3wlCyDZR+HMZK1tlH?=
 =?us-ascii?Q?OUOdTe8dUbRtxH52/7aviy7lpW5w8rFjINgfDmEczdbpbF30xXq/5plCgSSx?=
 =?us-ascii?Q?F5xivjj8hhMU30pOdH7bpkg5FCVJcyCS/oHtwPzfE64HzxQ2mRnki20TDBwF?=
 =?us-ascii?Q?Z4ZBkVEV8tf2msf1x3QSGbvWXyuNbQEyqjNlN001OQeM0qCY7IP9lm6nsllj?=
 =?us-ascii?Q?uPpsyluDccLlIWc30EDBkA3UTp/sexMSlc8Pj6EtdjnQpkQvalSNFgR7fe03?=
 =?us-ascii?Q?jFYdC/2lPMYYekJ3+D9anEIfRkzr4Q7BjDWZEGC+7otU/6oUd7KfcUSXzVpp?=
 =?us-ascii?Q?+BJyxVHRBEQCbBQlXFi46sBFZq2WXvnlnoI/vv9hvnT5KQeHrlOHcppPWjn5?=
 =?us-ascii?Q?x4QHSJiu2xz2g2QeBWlnyWvm8/e+GcXH7VwV0jpEWi8o3O0InNGcVp3ZiQOB?=
 =?us-ascii?Q?yjTcSqB8dS+1wdbDOYZSTbDWqAWYdpcvKgHPUrV3K9vZGHMmuEaH9E8gknkO?=
 =?us-ascii?Q?BSZV5udVFHFoexn2N6QIr3JZ7ofPiWSKC8uXEgF5Ws/5XlucpgfirfE5odmC?=
 =?us-ascii?Q?e7trknnnZ2JZVyadYgJzbP/j1qdl1N8fNs15LP3W1Jo06tta/CBxrWV5d3fH?=
 =?us-ascii?Q?dWZJMRUlYE/MNsYMsiy8n25PSZRwqf/TQYk6QaGDNiGEbLOZ2Y5mJLoe35bo?=
 =?us-ascii?Q?K6d4au9ThU+ga59BOZ9EfQAOQc/ics0gNxh36Ysgz5ygLDjuZya2IGvDy00X?=
 =?us-ascii?Q?QDCPDiBazP5/RX+aZEgYZz9sqNpEz1oev5svvvkzzOhvkUS7ll3X6Wg20CbX?=
 =?us-ascii?Q?qVk+Z5s4ANwJ/PepEzDaQZ/OYDwVQnyDmuqzNU23gtXKxROR7UoHz/0Ayfgv?=
 =?us-ascii?Q?1PUBT95/gSJmlVWCftgaTGjEHx7hHddlgPJppG9PmUgNcuJDiMCAVsTFKNtT?=
 =?us-ascii?Q?R4dr7MDnlJSpRVGpLPJgzeQrQvrlYWRI5EMRdDttdCR7KeJ+f6zK2GNhM7WK?=
 =?us-ascii?Q?mPpCseUNdcW+SzKucHpK/gyht6DpMFak8TpP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rd0laA7F8MCcpHMOAM0LEQiXDH0RzOEivLfY5o9by57vYGG4Y/jANfscB8TY?=
 =?us-ascii?Q?aMAe1GI1p5/WfOk78upxCZ0IBHxkq5NksNVn5ETj63NSBHaZvxUBvmWQmd3t?=
 =?us-ascii?Q?3XyUMG0+JckqoF0oP45B1B37ctY2nDtnm7M/c+2PrMZqw6vtxkPQ/kwkIQyH?=
 =?us-ascii?Q?H/VIe8BfhPd9NK5mtp81LidhX8K7KsIw9mhLVQiVxH9CktdFnajgYdHqY+Ku?=
 =?us-ascii?Q?ON89wzY2vX+Cg5HeT1Qfyrsi192JpaeObbbPJ+rskKbirAk3nhtLMxOVkcu3?=
 =?us-ascii?Q?a1TNzH9E+0UdrKh7xw0OQxYzGD93E2ldqJzrcd8IZADZ+V/PDaO5fp/Gs3oq?=
 =?us-ascii?Q?w6oxVrZRfcHMmHpiIio5sxjiZ87a9UoRDGpVlgp9FPKDqXzjduPj3KFvkdqw?=
 =?us-ascii?Q?X2qIP99dDuX3OUpJiwDDSvCppesCTFoTJ/lJOdmQXYwddUBWLN11hylN+6SU?=
 =?us-ascii?Q?n7+X07+DU6/Zir4ODW65sQpug8GGyNaeNn48Qbun6ZbyBZidTrhhJU6ZTJrA?=
 =?us-ascii?Q?FY1cAPhjPQpoE7VjsNbFkH4iqrN4a6/o/AciKS07lSBuCVZlRI+nlbavFGsq?=
 =?us-ascii?Q?Usl9TGMFDxwR5kKXvd4UkZDZmtsUZKqQmcZhZQe7xx5JRQIRbi4hOAdAMIPq?=
 =?us-ascii?Q?7mltgnka1BV9dDLo5uvtCi9mS3aAAf8KDgyT07y+gFAhm4noxNNQ/HYKMBvY?=
 =?us-ascii?Q?N7ChIrUdbEFZVIdTwBQbHiZAP3pQMjh1YUaqUeDLp2XDjfaY/2Uvhpri8W4n?=
 =?us-ascii?Q?n4Edia4AEg1WxWY+IvRgRZwB/xkYD6sDBB4TfoE/EILaH+/fMfFKUig4L/Fh?=
 =?us-ascii?Q?4Y7mr2CvWi/pWpn5yh/CJ2PaoUJ4yPmiX1VyBdIROtmXxlIzOmFxQ5Giutay?=
 =?us-ascii?Q?62T7Utmegfd/ASLFvpbYQ4tSrBCFgJZTGikE5EvJ6c2ZHdyC6Cs6waMV7UsH?=
 =?us-ascii?Q?K2AuhiUR+bwp9YKGUrXMR4NdzZSWDqJQAhPeKDORtEEUBAQrVGuCzvEIVkQE?=
 =?us-ascii?Q?CA8bcdMdXkSgiCqCU9/kGQkbKEKEJAZoGq1yv3AhiZ+3gcV/9+/HmpYcnQPO?=
 =?us-ascii?Q?C/jLTumiZFcz2SfZd3US15P7LaSfEOUPKxM10dsD8ppqWcn+WqWQJJGI+2Y8?=
 =?us-ascii?Q?C6/w5GXi6DbZgySYPOaip1ufHdfSzU1MlpOoB6UMTwPLGJpxIGhDzqP2dYZt?=
 =?us-ascii?Q?de9jQwXrg48uCdqFfCsvmpL1AP+DJd1yNCBX5GigKyI0OvSiTHr7plh1XiqN?=
 =?us-ascii?Q?ADL1nEYAjctfzePFokkpyHYSvYAtN0iTH6MGuPVKw/tb3uHJD4Yy4SgsclAv?=
 =?us-ascii?Q?V3Nfp+R5bpE6yf6wZjucbOwpmrbdq2t37FEdGOj+WoSo2/YhtTan8vBDpNhH?=
 =?us-ascii?Q?qYBwrh9bxSEV/yhMcdSNns7UKovyE+cmJ2ImQpKmfv7owY5mOjzVVOFNIz+F?=
 =?us-ascii?Q?hz+sJAfMD2C9Uv+3is8CRcGH+sLCicUvxeHwhMbmdxf1lCw84pOwQyJS4xVC?=
 =?us-ascii?Q?4SALgKvISqC0OE1ZkgSs51A2ZBjoR5RNTFiccvfR1sFS6AMNiS4sJl0ggH2r?=
 =?us-ascii?Q?KofMvsstvMGLV0b3Zaq1IrRnL69znnLc9yj7kYIR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32745078-d22e-4dfe-84da-08de32d4bb95
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 01:30:39.5871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UpfeOGoqhzS899WjOJZhR+Cqu6BJct3+X1Mon5u/i36bO50ZNCxbAPCRu3lM3sfRMMmD8PjT5MseaQOMMzIOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10994
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_173044_288187_7B4CC2CF 
X-CRM114-Status: GOOD (  20.69  )
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

On Wed, Dec 03, 2025 at 03:48:41PM -0700, Dave Jiang wrote:
>
>
> On 10/3/25 9:26 AM, Frank Li wrote:
> > Add cleanup FREE defines for dma_async_tx_descriptor to support automatic
> > cleanup and simplify error handling.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Check patch report exceed 100 chars, but it's still better put into one
> > line to keep consistent with other DEFINE_FREE and better readablity
> >
> > change in v2
> > - remove surpoiouse remove empty line
> > ---
> >  include/linux/dmaengine.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> > index 99efe2b9b4ea9844ca6161208362ef18ef111d96..27fa1646a807c49c781e1bce9e3e7d9a3c66f41d 100644
> > --- a/include/linux/dmaengine.h
> > +++ b/include/linux/dmaengine.h
> > @@ -5,6 +5,7 @@
> >  #ifndef LINUX_DMAENGINE_H
> >  #define LINUX_DMAENGINE_H
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> >  #include <linux/uio.h>
> > @@ -1612,6 +1613,8 @@ static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
> >  	return desc->desc_free(desc);
> >  }
> >
> > +DEFINE_FREE(dma_async_tx_descriptor, struct dma_async_tx_descriptor *, if (_T) dmaengine_desc_free(_T))
>
> maybe free_dma_async_tx may be clearer as the name vs dma_async_tx_descriptor.

If that, 'dmaengine_desc_free' is better because avoid create new name for
it.

Frank
>
> DJ
>
> > +
> >  /* --- DMA device --- */
> >
> >  int dma_async_device_register(struct dma_device *device);
> >
>

