Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A28FD8765
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UpDKiGl9iRPgVw+xTRCmv6BPHCfBO76AJ/ROtm0O4w=; b=e1kQGRR/XnB8mqy88x+fQ01IND
	B+QxeeRtT8T/ozZKLrYtJTA0G6r/3b36fS+SlvhM3GRtgGMieW+G/LMLuNzmsOIq3xHEZh+GotdJm
	qvCSPVZt0QbdkDOhr5SnfwbSEVBXwTxYUKevntyfrf06JavnfCd2klN78b221KlzKXVKBoI9rNdCs
	XcCWomMubDR2JBhTKKRo+m+feu/5w9Z/wGhrVHRCLij3RC8mzYmP7D04n80D5ZNQ7n4N7eg1wK70N
	Suc8tQARAh/ZljFhNgDNvvUSmpQUvFby9KnvCondO1agG8LNDTxT9/O09TCVbLAc8ET4X9Jefy1og
	0fAL0IiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2U2L-00000006LXN-3BhE;
	Tue, 17 Mar 2026 13:00:41 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2U2J-00000006LWh-1Imw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:00:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ra2d2WZKYNY/yhHKiqTGA0x+0Kz1q24CRc2wpqApZznfwja4PRj8cmgaf/N1ndFKDh8VbeU0+7M1BiCvmDYIkmugSa80CqOTt9e0he/h3Fhr3GzaKr2KOA1F0xy58St9sQBw5wTHqIhKi+ARxTUTApwKijQYMnR/ALqe8iZfKadugxCTwZdJ+vPVwG2Ad7vI/JIvxIHnhTlE1Rvf8TVEfHc4dKchIN7oOm+hbCgq9oIhgITwmouzm38Cf9KfJVHuw3m3NZku2JMIqgQ+a6xw6xOdLQf2FgiyoP6LndS4VXXHTa73+nzTvJn/SJVAfQsdpiq8TI0QFeYZe9/IyTdd5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UpDKiGl9iRPgVw+xTRCmv6BPHCfBO76AJ/ROtm0O4w=;
 b=uOIFxtYF3QMwYU56pXUqte+9HPwjtYaTE0jLGgoUyoebFnRf/qTN/Agn4jbamWhKEsRsGlOc9cpzvvTAy+/+7YPQrARVa6n6Sp2lf3hQxkJFExmzZD1BPyKxZJN/e9zIm052QGUKQ+pERvkBaGrdko0bDCQ9jm/I5co1KJ7RPOGTeLLXpeVWbvWWvC1r15xELahFxD5z6gsp5vVy8RsWXJ4tWlFCwKPr3hsfhmIsydOBKiApchrK8U6Guo/rmzGauopmUEdoaganid7RSpgWknQpPZ18vlii6P3H1cNJMIn1F4Lf73J/T3PaG+e4IC5UHsyW4Gme16xWV/Rrr9KnnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UpDKiGl9iRPgVw+xTRCmv6BPHCfBO76AJ/ROtm0O4w=;
 b=Vh5ZkyPSfzFqQaRVgYXIwPNGjjeR/Nb28sDep+4qrU1Uzcq1uSJ7ekPEw/QLHBe2CQhG80M/UGG3W/KQRb+X/5m9IY+dv91aupwKMKvMwejcukQjj+pje9vPLCLHXYyv9h+onR3iQNEAs0sM5sotAHAA+fCvskNW0vdl579Z4gos1q7uqRr1X8zlZUEj6jhJSbA7JU+rV+MsGmthAppdbcwJX/o16zdYMBGZ5DG9dHM1W0SXLGGRIzZHlQRdN1QfghfNmhWmkzZqLeMDMLY46Wx7+WT4YU3jBkikLnIS9S5IYuUwsffu+Z051jEdDfQdE1307pfyqf0ARtoPABHysg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DB9PR04MB9790.eurprd04.prod.outlook.com (2603:10a6:10:4c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 13:00:26 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 13:00:23 +0000
Message-ID: <441697c6-13c9-4a0f-80aa-b4ec9992be4e@oss.nxp.com>
Date: Tue, 17 Mar 2026 15:03:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: add MBa93xxLA-MINI
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-2-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260317111704.1075938-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::18) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DB9PR04MB9790:EE_
X-MS-Office365-Filtering-Correlation-Id: 61099b13-e81a-4aae-483d-08de842526c1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: s/a19+2vlqheqJFT0HRONxGhOErDw0i36Xze2Sje5buuvvD84qXu1F7YCr8alRBBxkNtGuuogSGQOAnwXbu8cBrQn+gZTU2BpA4e0ZL8OMI5/1bsGzLTKr7iqJ2vpqUIpeT1h79MeACuaqmV6t459FPAWzJpkfjDGS7n1zhBDYq7WyKm9Z2ENg0PdMayBEAAF6JM1FKqhhCNWPHlSEgMuq/g/397Sp23UEbcLtW8Sti/r2z0kUe85Ze366UoYkbseBrnKDZHQorEQctnXrYxKU99dzKFqilKZ5GLmKopqVZNIBWnp0NJPia3cUEaDqCgtAs7MqBlLMEoskmnQQuz/LWVIC5KsG/0Ef73rmwCqmuCiL0X5TEhhPIJaeinUWt06EfcNwlo5eHvBD7h1g9jbU+DuWy4cXWy1YhF5S6Bajno2C2km5WyBl9xcGklOnxuALwpJsh5TfvZC48nGWpvY+h5H46XVnUzgCWYyGsn+2rpO4oVACwl+fHqJsuBKhklmKTy0FW5ia0sPeDL6wMduNH9wfk00NZFWy62rrCZqYtY6xHrWRbsQsq+JDZ8bzurjTaOlkxJwKUvrbVXj4JO7X2qYUVgKfMF61nWMyGglulP5olQuTgXmowQjyD407o7tesdvLS+9XYyGZxmp/C2lPc8e/rrO2WM3KQy+EV33lw6wsENykO/wIasfNIs3xl4oWH8JHWld04JitUffj77v1e8/P6udwTHHr6OPZ7JOvA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlIwOXZIOXN6Ty9KbDBidktNd2E3VWJKc1o5STNoWGNSWm5mMFcxL1dYbDRE?=
 =?utf-8?B?SjFSeWlMVXBER0R3cVRUdEFWblhKUVpjQjhJMUtjMjZLSXFkZktlM3lPdDAy?=
 =?utf-8?B?L1dza2xqZTd1VVNMSHFMRDJReGVUWWpjWHBlQUJiTnBVdE15VmROaHdyQlFP?=
 =?utf-8?B?TWMvc0ZERkFza3RHejZDQ2c3Nk82bERMK2lJb3BrdHRyckVvd3ZLTDVMVGR0?=
 =?utf-8?B?OHlNTmltNlp5WHRNVzE3U2kwVzBOZ2ljUGx3RDdyT000L3ppd2tmNWRVcUs3?=
 =?utf-8?B?SnZVZkJETlM2angzR0tHSGYzek5SM0hqSWZEdmxxdTdTNDFDOEVzR2k0UlZz?=
 =?utf-8?B?b3YrKzNJRGc4NDBMRFJJNGNvSDBTUFlGRG9SeEJnN0JNdDRiNGJ2Z1pyTkpD?=
 =?utf-8?B?UjR1UktLM0c3M0dHalJBRVlLODZPN2JCMmM5Vmt3S2lmVWQwb2dCWU5YdGRl?=
 =?utf-8?B?NnFMWnJBQ2xNcldEU2J4YnBhYUdtWjFZM3BYSEtocFN3UDkyRjl0Z2s0Vzg2?=
 =?utf-8?B?cFJIV2pOOUNpazdycnVaR2ZYR2JvWVBYTklpbUhKWFdGRmFiT05ZUERMbUtG?=
 =?utf-8?B?QklSc2pmWWhnblA1dUtKTjMwaXpIa0N3anZzd0RMZXEyVWs3djg0bXQ5NDFZ?=
 =?utf-8?B?eGxRYm5zbXhaVG4wQStHWS90NEZGQkNuUkJ3MG1pQUR3a1YvOFJQekd6Tmt6?=
 =?utf-8?B?R29OMDZxWTNBanY5R3RlY2xZUWpocEVIS1owbVdQeVlvQ3BqTUVkWmN1YTRT?=
 =?utf-8?B?Q0VhOWRHdUpQNHRYVGRqdDhYbzlyOU9BL1FKTzRya2g1RjBmcThKdmNTaXBW?=
 =?utf-8?B?bmNuTmM1enJNTXVVdGo3U2JMV2ZwZWxpNmtsWjNySllWSk5tbW13d2lZVVpm?=
 =?utf-8?B?RUdDWnUySTZQRGY5cTFzN2JONjNoWlloRE9JTVc1ZHJ2NlU0dWVYWWZTOFNV?=
 =?utf-8?B?OXdWMStFNFErTHE4T2VpMVZiNlc0K29ETTVwMlhmY1lEQmlTRHUwRWs4SmFY?=
 =?utf-8?B?M05GVWE2eWEwbm9FdEhmZW9ZZnNPcndMUlllM0h0TFUzMEVabzhWc3pzcWpL?=
 =?utf-8?B?UnliVnJtTmlocFU4bG9tY05HMTl4Z3NFelNYb1IwY01EUG01SWw3U2wwWWxa?=
 =?utf-8?B?RHFXSDkrbTZrNnZ6Qm9OZHkyZEYrNmxYQTl3b1BBbWNhRkxpWTIrSFJEamJN?=
 =?utf-8?B?NXZ5ZGVTN2diRU9jcEEzaG9EZC83YVg3VzdWUlZLRG81U3lRZjY4T3ZUMzcx?=
 =?utf-8?B?aFIyMXlSWDMvWmhpMUVVMHoxb2RUZnFkL25NbFlEZmhDTkltZlhkK2JDMHJP?=
 =?utf-8?B?V3JnRDhDUkVEWjJXY3o4V3JCTnZtN0VHK08vNmZ0Ni9FeWx6WFdOK29LOURH?=
 =?utf-8?B?Vy9OTzNwSU1RMzVtK1JYNFM1dnJkNHhCd0oyVkFySU8xbWNzVTQ5akU4SFBG?=
 =?utf-8?B?cld4TDdDMm1jZlpxRGNjOVFhTkpWdkRRREowbExNN29lZis1ZDcvbm5HS3Ay?=
 =?utf-8?B?T3FqUTFRcVJxdWw0MjlOVzVPcUpLNGZxYXdUcllPSDVqRW5TL2JvSzVzSjB2?=
 =?utf-8?B?RjdzYkdMYlRDVzQwVjZXVUY0NHB1NzJTdWxVNTN6SmlGTWROeFRJSW5wZDVV?=
 =?utf-8?B?SFFMV3NNUkNNWHVHTkhwMkpiVmlBa3BKQkYyS3FVQTNLVVo0Zm9BWnhZNlJk?=
 =?utf-8?B?TzdoVW5sRkt1d0laM3NiZ1QwTVlqeUdobDAzMVYwYW56QUdkQzFEb3lrQndU?=
 =?utf-8?B?YURSYk9kRXh3THhTT043YUQ2U0V1TEE3RjRjV21RZm85MWRRaFk5VXFnS1pW?=
 =?utf-8?B?bG1hL253V3JSYjM4emNsZjU3RENDMlpEYjYreEUzM1RjN1pHNCtQMmJEbkpn?=
 =?utf-8?B?K1B1WlRkTmhJL3ZQekpEQUc0WERURVU1ZFF1Rmw0eWF3YWNCcVVodzJUU3J2?=
 =?utf-8?B?UmJNa3hmWkE5THRwV0R0QnVha2ZYN2o5cHpyY2p2T2R0aFBPRmY5ZmV2TlZI?=
 =?utf-8?B?ZVVOdExkZnlqSDVtTGlXYjJyRitLL3FCbXJ0U1pIakdjSHZ2Rll5UkRnSitW?=
 =?utf-8?B?VUhDcVBtdUZrZU8waGdibVBCOXowWEY4ejBtS0tTNHQwQkd1UG9TbFFFRkpT?=
 =?utf-8?B?NnlaSUJ3UzlBTGw1OGQxZi9QN3ZtVmhxeE1WVkNzOEhYM0RJN2lVeXFrblBS?=
 =?utf-8?B?Q0dYeURiTlcxTkpTYVJqQ1Z5ek1EekFHekcyQTVHRVFtZFhQRmdXMVF1NG5n?=
 =?utf-8?B?Y0ZPMTFtN2t2TDZRaW45WWJTWnpEdUJVQWR4WHdCalhsN3B6a1VYMWVlOEEw?=
 =?utf-8?B?dG5hK1NxUXdQQVNxbjh1UFNIRStKclQ1SEQvc3Qzc0IxK3d6NjROdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61099b13-e81a-4aae-483d-08de842526c1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 13:00:23.3015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELRqpQ9qb0/xaCM1CFIBsmwuQwmJ0ERVFHZL+2mOYWO9TdVeQdYxcVYfz8+QwQ8LnQHv9RWLqa2Zzv1R0FVq/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_060039_356599_F867DEE1 
X-CRM114-Status: UNSURE (   6.49  )
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

On 3/17/26 13:17, Alexander Stein wrote:
> From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
>
> Adds support for the MBa93xxLA-MINI SBC.
> https://www.tq-group.com/en/products/tq-embedded/arm-architecture/mba93xxla-mini/
>
> Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>



