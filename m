Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9457D3CCB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 06:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YB5CBYWaKJGAZkKzHX2QdDfQ/cFxogVQ1SsU1+MhLYM=; b=35aeK6wcDC35ir961P7hsxejO+
	qx0j9s8hX17thHdW5l+uw74i8YJbCtEigfLrf9n5xzFg5/9eGHGW3DtlaYlvyiGR9OYAcpw4KN5C7
	+xLbDTsK1nFLO70E060GGPCM8a0xGP/tkkic2Jj4/tQiQb+yk8S2oUmGzGAN1ntnOgVGLuN+CsD7L
	ia1EYflpSCkchO3q9LV+L8lvwZLXGk2kQcrMAU3JnEAn+YYhoM7DVdKyscQR3ua5Zf36BwPMP1uh1
	uutr3wQcky4JegUPIkOK4J0w1IjI2ie/Aor99OOa5XqkSjRmEtVHbD4lTApv8KJfX4qKRGVBmgx76
	LwZRCx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGdN-0000000Bpvg-2okk;
	Thu, 15 Jan 2026 06:15:05 +0000
Received: from mail-westus2azon11022088.outbound.protection.outlook.com ([52.101.48.88] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGdK-0000000Bpun-0fdv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 06:15:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDuTevgz16FjswTWZuEUSepfFeZaghQ1xHEVIzoOMb2WM284bMKkMWmL5yzgDd3mCDb7Z2DoQZk6CuvWWJskO551/ZDd8af69HMBDwJNvZzJr2PRCeSZS9dlbObzU8lh4v+ibfpAkqltvzsuFAbGLEn3WoGmP8jkt/uJ0LTfSPm7utNWEjE+YKXC+L1K3B9Bcy3C2zaGqrmndSiCCSxLj+HEORvWhJVVNJ6XuF619XlZPlQhJwpQqmhc/nUjgva0xbUCbla/yFOJRf0hE2SmuRZdqyDak1LHSiZtBL2lLc6/hhYCyi6rgFB1Q/xOqyi5idmumTfvzT4pWyCeJAgtzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YB5CBYWaKJGAZkKzHX2QdDfQ/cFxogVQ1SsU1+MhLYM=;
 b=az7g6DPLn7c+/cyaxNcGzhN8mfwX7aeYgP6hwyDKmMEEt16wudEixDJ+Dr6Q+UDvuNlCDIAKp8xMEhEGZkL3974LQtElnd7l7OHTHnKFTynCcxwBWW1cwhOYZKkq/CLI92Wq0aAeN9W9IBDBpVr/sHsrI0mCxm6SXaCClBhG7EySebZxI/DuwkzTtvUUZzkSSLxIlIVhMIvpI2UcktTOFsFOOLO8nHGTwCIaIE+8ipsFOIz9GowpiiU/KHOnYYMgjQS+3iQNgDbfnOOK74eFzKuj1ZLHJbcBt0hYVrS73HLKMGxX0SsdoulTgfXy+UaQvaNDWwniFP4IFDcBoSbNwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YB5CBYWaKJGAZkKzHX2QdDfQ/cFxogVQ1SsU1+MhLYM=;
 b=tQ2W4IY8U3Rv0Ttkg/WVAhAIB42NyYz+BduVGhFZyH2ATc14SvdMP4AXVzrHiknFZTjLXOtpp+/V0fFVLl/6IHn54M7ubI9rTqKrTJV4q+PNsc5ASBMzBY7+8T1vaY/BVGI3JVfItYfyTphSjEooOijmemNe+oLfILNsJhG+2iFCXjYizmu1ex5kNwg83hnqYZg6FLjTfZD2esVwAR1bvRZjUxRRdydT9nxXGeWrshPEUlsgWPJdNgkMc+wHEGiXYoqSRwhwGTlxw9mnfSL97KyaqfnVdpjC+NviaHjZHR/f/PGQeVWTGKg26pZowFF03zxduY54v8n0JBcMtsJ7UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by BY1PR18MB5876.namprd18.prod.outlook.com (2603:10b6:a03:4b2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 06:14:57 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%7]) with mapi id 15.20.9542.001; Thu, 15 Jan 2026
 06:14:57 +0000
Date: Thu, 15 Jan 2026 14:14:55 +0800
From: Tzu-Hao Wei <twei@axiado.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: axiado: Use lowercase hex
Message-ID: <aWiF39xuH6n9LVRV@axiado.com>
References: <20251223152432.155299-2-krzysztof.kozlowski@oss.qualcomm.com>
 <5cc6b959-4424-4d34-a8b4-eeff237266e2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cc6b959-4424-4d34-a8b4-eeff237266e2@kernel.org>
X-ClientProxiedBy: PH8P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::10) To PH0PR18MB4558.namprd18.prod.outlook.com
 (2603:10b6:510:ac::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|BY1PR18MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5fd2c1-a65e-4f85-06cd-08de53fd67f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|42112799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nrmMQxtVnf9gtDCaZ+qQU88bgsbSW37lmXxbq/j9htjSASXqhsQ88n+TBNdE?=
 =?us-ascii?Q?7/ZOmxvY9dXJqdm698vQMrrTwtNeCi80fWmiK7135fljAt0Tp4k3iPPKXDiM?=
 =?us-ascii?Q?BkmOyNwG70A+A3Rx6hus9h+QyvEv4dck1oAtPy+v/dyd4nY8ubTNjHnsWWNU?=
 =?us-ascii?Q?EVqTiswI4UDM5fOzU9Ty62curLEQOIOzb61uBBw6EFCSVs4XcAXWzTcYxHKu?=
 =?us-ascii?Q?lwWxUAeXoyi+7J+hIt/zPeRGuIjxeN2gP+MsQ5UXt9NDJ/srEtGVZ1FVnv//?=
 =?us-ascii?Q?QOSQMlIZbICGLRTdpMtCxqqY2GNxoBhVq+O4Owcj63Wbl4S9havJcH09UX00?=
 =?us-ascii?Q?FbMmA80liwgxR46WVYDGjNEF7FZMrJUm+eIq4VU+0trUoiThQ6i1Sdnm1jE+?=
 =?us-ascii?Q?NsMl5m08Wy4LHgQ6BXUMD2tj7elb26uNoBcrRhZcDFZ4QBNqH1N5c6OXV/Ob?=
 =?us-ascii?Q?LV2SN9wgcukYR80uES4TBIY51BhjJyo+RtmJKV64e4mVkTJGDMFuFDQ+2inw?=
 =?us-ascii?Q?6edmzKe1EIKteBupc4DNEJRtNORtuywWghZ2rzrhbyMyiqdykKfgjpbCV1gq?=
 =?us-ascii?Q?qpbmfLAU8OsNeFgHScF/zK23OVVYYKBzZoVRAZoWpHQu+9dnbK58WabbSMT4?=
 =?us-ascii?Q?MRe+dsoxTQSvk5MHxO7INS9V/wSJIRNTLG+qd7ICcZSHyPG/n6UJm0/Q3Fgo?=
 =?us-ascii?Q?DzK4kqL7ZukARRGfru3irpDO0FFV5iZTlJIUArDNyernz6P2/INZraa9OC4M?=
 =?us-ascii?Q?Ll31pQ6gMJ/GAQoap6inJcFjYiuD4lWO4z58vXYcBzodg7sc8Xd4lUcZkiMg?=
 =?us-ascii?Q?up4vFf9Nj1DknYzeUPN7xHx61D2YasXr9+zQXM7IuvcFAID8I9yxVtV6f5aD?=
 =?us-ascii?Q?j1kES92HpWEDiltfSCJTRAvdL/D86n2DpodI83PEJ/zvDR88J773qNW17EHo?=
 =?us-ascii?Q?NibE3JjM5IrQXNsoZKY0zEf+0ZqDfPW+cSOk3GXqVBMsBIXjvEpE3spoUY14?=
 =?us-ascii?Q?f/Fi3QzOFErT0RAorvoorekeT7VdRk1dCu3OtXZPgHyBa66Wc/lHKox5txMr?=
 =?us-ascii?Q?+grFFDqAV/WWrvLCvpz3LtByycPf2A+p2PokP7YV0aZi7b+gyUFtBPAWJS1S?=
 =?us-ascii?Q?I5mK6RbJqRUR+Iqk5+v001Bm8cU9fsF9kPf7Bu/3Wjrb2QVjRfHQcxr4CBQq?=
 =?us-ascii?Q?AcVaK5H48I4qJgCo3RbFTXUXNfvzUqJn5p487/jDNxiZ3LxPAVan6Mhqplcv?=
 =?us-ascii?Q?PQXRi1z+0jFloqlzQIuifvym1pEdrcZgFMQJuO4AHAl9mlxwkZ2+d3y4qnCQ?=
 =?us-ascii?Q?feoxqEExvc/Am2PmAj5L4byvzfV+VhzR+UYK/m00QVWFf5UoWLZqooYN1PVS?=
 =?us-ascii?Q?q92OwV+eNjJ5em5+En8/tOrl8Nm/yz4kuF1q2PUPOHDoAMEj/eb7AenGD5YA?=
 =?us-ascii?Q?RvEHFn4y87/HTA5YzYkNs+JTgSGmLurV1krDrnvcaQZepVjrUzK5oLeAWT5M?=
 =?us-ascii?Q?L/0vKmflycgaqlQM7VDqr+6nERbwm3gn+PbpoYIIHqhBeEhgXOVI0MkCBakq?=
 =?us-ascii?Q?CvWk9A4gZsMOdxk1StV78M77s8Nmoq8PMYLqVL0bj71HhTxQu0urb/7fp9mR?=
 =?us-ascii?Q?7fKHEWlyFgHE9Qh6+VYdFLQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(42112799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kHzy7zvRmaSNL8SY2iVEAxDzvQXy52CQLDzCgdtx/WHDpuvvkl6AWNglj+0n?=
 =?us-ascii?Q?cxvqPfppuQUqu7Hhl5DUPkzws6LeOnCGegH5D7hkeOe0NYfL/D/P2JQXVfqx?=
 =?us-ascii?Q?Twk7MlpF93GYDZXO9UVGNOl/RlkTLvMeAPcUTJITXhldvUitVtW8M/QCrNtr?=
 =?us-ascii?Q?gMsm83cpte1obP6gQBrsfILZ+0H2ZekEoM3UgDXM0wnFqhVJyuML/+EarVzR?=
 =?us-ascii?Q?vbnViSCLn2kL/YdCwdrFMJgx2lJBvM+k+KrhwRW3Z/oVqp0NUshySP/SeRoZ?=
 =?us-ascii?Q?jWKqbEoxkXTr2AnHR5i4WYAHw/f1pFsBr5wu6LzKjjj42fjDbKQh6ogEpeqo?=
 =?us-ascii?Q?EHxBkVu6IgvTmyfeLwK8L9fqTfbFpk4zkvMgMv20YEpl/Va1EJqQv97CHNF2?=
 =?us-ascii?Q?xaQw8ltuVqpPQpA8hY0xjh22qgjZDhBAN6t7J0wLDRvsx2o8M0Xrs7MZfnPr?=
 =?us-ascii?Q?bQFUdTYE8XY3EnLKFzjE1iLxmmc4CMVc4vbFGmELUpVBwhho/IdKkbe0asj/?=
 =?us-ascii?Q?0eo1kmdTUnG8fmoDqa+J/+AJivBJA86HAS+SpAqy/2qGVAKObu6zzPT9ykVg?=
 =?us-ascii?Q?QazPz1euzNTBbAgCPNi9SHE93bBCFv4iGwfOB8APESuhnhRJhcafTly2cT8t?=
 =?us-ascii?Q?AtM9JBJMsW19dEAWbThQHycn1ajlMvhVpl1+1HWxh4rIcH6xm7SlRYiVovQA?=
 =?us-ascii?Q?YIcnQIu8kWwDS+HwqNrPx79z7TOZ1zonBDb+4xtD4+xicGbHSSMEZkthfSyX?=
 =?us-ascii?Q?/mCeOyszO4uG6zNa+UR6Qtjv9GGx58+BWbY73fNfjh2gQw2xf4g8iBT9Exw7?=
 =?us-ascii?Q?YOgbIrdk7L+h5MoYv4Lv/zpm+SElEM5ENFYdffKf0+H4AEfoSnEeOYZbfzKY?=
 =?us-ascii?Q?u18SukJKq6WE22xdyWgb6AGe2fge6qGOUfJkXHKFLl3p8Q3D8gHVxS0tDSoc?=
 =?us-ascii?Q?Q8YFhqlWPgIaSgPNjETfXQFBhu1VMJvVGCKCqtohRsVrg1spZ7NWL09pwobk?=
 =?us-ascii?Q?UiJnccsU/uZpWQ0DeEMXT7x3aCpiodqRe6uTN+36GE41Kjjo5J2liev1gMMQ?=
 =?us-ascii?Q?uEMkPU7Q2/X05NAGprt99eP8YFaPAg5ctWNFhRy28YIWyigdJMsJMynjSb0M?=
 =?us-ascii?Q?QtZimAv/4XeMsdCCMnMgq3izF3zYbkj75YrhRHVTpsNC9bSS30ugyHGq4LQv?=
 =?us-ascii?Q?SwpukMSzA6AlMTlQvmuey3N1dAjm3j+tGGwTpNGLbKIf9+ZVtYiHh1lcH4AK?=
 =?us-ascii?Q?+H2Wmakl8Ng9eeR30RgjXGoalWpk8CxrvzSHAALcT/n+LTw2AAZwn+1O52A/?=
 =?us-ascii?Q?K9dndkEF/yZMJO4TLQG9gEpFMSjMq4EZhNl4bCEhbVsghJ3k+c9lpcyN80RX?=
 =?us-ascii?Q?lB9PRXeM2HSoqWK22jLvFFw4FzsBpsYr+uKUB8WIyOJtXUgqHH2rpHQ9ebMA?=
 =?us-ascii?Q?Hz+cBkM+SL8kEav1xIdhftl7OhKvcDqOLDun0ghDxbRddPtMc5WpSijVjoj7?=
 =?us-ascii?Q?ynwIzzOQL64/sH6v8FiCLmG2yEKyeirj/rh74vXAgU/DP9H3Rj+iFaJAycXr?=
 =?us-ascii?Q?VoQEdpXflGxrQYn+T9cuPdSJJP30z1KCfiHjzPw4q8VBiMjZfWhGtXCN8hio?=
 =?us-ascii?Q?aJJBKKpysr5bW58vOcy5WPCbEUJPXOjcYD0MLViV1zUc/iKcArN3NnDELZId?=
 =?us-ascii?Q?9W6ncwNsHykusd5GfZC5Yor7VwwnxgLBsZZdNQdl53WKnu3G?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5fd2c1-a65e-4f85-06cd-08de53fd67f8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 06:14:57.1018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQW78A5eF0Fm4FvfBm2Kuj9+rl/QwjooG3vOIhApzpejxMm6iT63U4kJ7Cex7Far
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR18MB5876
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_221502_210423_61A15AC6 
X-CRM114-Status: GOOD (  11.40  )
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

On Mon, Jan 12, 2026 at 09:35:24AM +0100, Krzysztof Kozlowski wrote:
> On 23/12/2025 16:24, Krzysztof Kozlowski wrote:
> > The DTS code coding style expects lowercase hex for values and unit
> > addresses.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > 
> > ---
> > 
> > Patches done with sed, verified with comparing unflattened DTB and
> > dtx_diff.
> > ---
> >  arch/arm64/boot/dts/axiado/ax3000.dtsi | 2 +-
> 
> Ping! Anyone in Axiado is handling patches?
> 
> Best regards,
> Krzysztof
Sorry for late reply

Reviewed-by: Tzu-Hao Wei <twei@axiado.com>

