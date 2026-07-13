Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DBCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vvnx6YeWFbVxZOO8PLoQEki2YPQ9SYyjGUWIRF/kJ5E=; b=KXLo67fh6C9YMHnU5TqfqGFQl7
	TzPxO7ELd6zP/pQ1tzKO92yoGy89Kv0Mih1Bn3B4bcZutzFlaoQ398/qkmLkJib9+JvzpwHCIi6Uq
	hBuHk8MFziZ0QBUoOtfoNyqsWgyFWbEusL6PTEP7YCuPmsSM5ukRMqr70MbexFWI/hpULtGijfikB
	YUDEK+Aqp93ndhfoyxhjnmpTFkP1LKsGJqBbxanFQ9M3B25RAsYMUY5OyF7pZA/jHWDlTK2kObuKO
	k9AsGCgCikDl+5LpwEIdu31hJnpvASsXfll45aTMsHbu6CAl6dNGbzfqx/XPijm8DbvA4VO9YHnos
	201t1b6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJYf-00000009yvo-2rcQ;
	Mon, 13 Jul 2026 16:31:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJYe-00000009yvB-0KYn
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 16:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Vvnx6YeWFbVxZOO8PLoQEki2YPQ9SYyjGUWIRF/kJ5E=; b=e1cxaCauBxZabJLDqyRsFCKrPo
	c7N1DWZXA9PvJlivBnqJr0HG66/mphHiLW23g439P+s1fOulNptnrLGaQHIPIwkRZothFHwpV1KgL
	VI7xkrptj7ZJ056eptEG5W9ATEijZSiOr0NrVY83qYacqDog1mvb/szfnamyRO4QA0TDsq/psQCHN
	gCRqAWR8XM2/I/m3MSnIgewg4yUtBiknds22LGtDtQbGbyvYr4LvgqpVUSeg8wUfhh8afUvW+rY8V
	l/tCEMmcEq6AEcpr9RD/A4CelaQYU2G8PMDBZE+lCrfzB1PO173ZGtU+S8KBj3X+kc+4GYxI0Jn6Z
	s95L2+eg==;
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjJYa-0000000BqmC-3xUe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 16:31:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVodRlMTfwDyXf/OmOwv7T/Uajwg8C2lLt9RktwUXALiaAyMMM33oiPux208NaA5iKOAR7o2dTzPw76sAr9jY+6FejSCg9ybQbld3cW+qQtiLal2f8AaYdt2J1EJa4G8rLx4MykvjP45fx26/khEICqj3hBF+P3j/J/b7cAjKRxIhz9VLxU7SxP5Do+DUBHpNr6AtCQdbR+vrDIqh02wl5ytdfj4KdFzfdFgXoQsgVw02t9Wwy1TJ5Q4QIUNqntcxAVYS1PCL26N/e7tKoVwMzL7tst6bYpBFCsuYuTcKCPd9NqL8iJQ1zIz4h+F7wY3lxGTsKaPZ4VmOpIPgmMWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vvnx6YeWFbVxZOO8PLoQEki2YPQ9SYyjGUWIRF/kJ5E=;
 b=YD/bk9uuYtSABwuERsIDxrictRIy3qCpXUJKis1ooWOQCMn7CdWli3AoqxGg0W+rdTCeJwV/R0bzk7c+N5LtxV0azGfYRpjopfCWW5KWtpDZNKzCz4TotiiQtr4XXXV2FPJ9v28v7yrryRxNoZOt+vxeM73l5z7azIuIbtd9nzMzS3z1ikjHyg2tnaJ+Xv4kazV+GkmS233o5XmExTNb4ueSXfepIpnFhLlyUM438bKTzC2qg77dh8D8ksQeCJBHVFmhlzYaY3vuTbvC3NT/BR68U30wwNkiY8C7VXcbbzwb3KexCAF+ZZrS015afhb1wb67TjSnjKYS2nOZJUm51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vvnx6YeWFbVxZOO8PLoQEki2YPQ9SYyjGUWIRF/kJ5E=;
 b=sb1nX/mptCcgbLtkmnyHrWA5QZJXZo41m04h9S3axdPlJtxPt3rrlbLoGRVBNy0dmjH/WRm33gZGdQ6uIwoBCDcRmmqGa1FwlqR/6jeKOw9cV8SMytLa377UgPgU7MVbIJuGUZMbVyyKpN4HQUcAx6FnotKIPGqS/x3i+lcqQkw+ZsCC2Vy1XxzbV2gNhvgYC1hnLwErDBMUTz5TbsUKxTv8GYpl9x7hSG6qOnf54aYt0gBy7SYVyx/EfyCDw/C5nUY1FZ5Y/p2iV7CXmTLMa209KH19v2LZS5SSP9bmycBTHkn/3GkXcJCBOddYuY1ZxQ5G+m4Ys4hFDrS9h3ZSpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10854.eurprd04.prod.outlook.com (2603:10a6:800:25f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 16:30:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 16:30:56 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] Add audio support on i.MX91 9x9 QSB
Date: Mon, 13 Jul 2026 12:30:49 -0400
Message-ID: <178396023704.454496.3835404584034007791.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713022248.1262123-1-chancel.liu@oss.nxp.com>
References: <20260713022248.1262123-1-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10854:EE_
X-MS-Office365-Filtering-Correlation-Id: 237deb3c-31d6-4f90-138e-08dee0fc1d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|23010399003|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 5X7nsDXSCOjEyPq2wbSoa/odLhJMPxrT2+g9dvkTgJ+8i2bWOaUte3Z8tGm7oPsEXInrNf34tV0NE/1IJIVwD5sHz4VoHP0dzCZtsX9z+Kfk7fgIdmc+SSY5EZm5YRspzJiwqd5xX8Rpge0v956ingBnPhkV40XznDI47Wq6TA/en8ZZvpJDt99GPP3EUQ4nRV2vNV10lpyPpsJexza1I0JH6A2vg4Uo7m3bkU2dMI0PprSeiaNwbH8eBMEO3Ua05GzBmRfnDY0s+xmZfDBqkecxr7c3CLvCnRxv9aL+sRWDX3R0+yYr4AdwpBVaVnqvIbojlRdYtxHMDV+Ag8Z1VZQ6Z3rt3dc2ekWf2ni0dqWY9OBI2ezm8kcoupsAmfAMowOv7HdVaRNM+HBAi/XRSkXlHIvnlUvXRlm5gzBc/STnXeF/VAsul71gVl9r87FMmAJXUC0FTBltSJH8lFI+cb8KUqMO3EVBaYBjEIKvOBGofRFg1eVi63L+CKFeLvCMkOKTF/LSrN0iTfBt76dz5PFJwW8+6Fra6ZgdF+oLALyJTjz5mgyEEpbTEvPag1roTbumflTVVCL2gyhVzYdKoQixTzRwKFCTqziN0vdnA1vGvWNG1XksZeFOluPGd56u8BNbsHAEJu3qUkspCOCNRcdKirZhdp7EmPNnPsAhzeU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUxZb3JlTGsyMmxHY1k2VXMxNGRMUzU2Nm1pRGk2SDhFREJ2QmQ5SlArdlBi?=
 =?utf-8?B?NHdmNVA1R3NkODBscXNkYlJsR1AxZ2JFeXE1SytXQjFNRVU4MEVha1lIYUM4?=
 =?utf-8?B?QVRXNU14MTRpcE5TV1hsR3A3RURVZzkyUTF2Tjk5MVM5VC8xOUNaR3hCbjdm?=
 =?utf-8?B?dXdSL3IxZVhaU1BYbUhqTVFNcUptWC9ZdFZidUFNQnhrYkdVVDJsNU9TUGpO?=
 =?utf-8?B?YWxFWFRuWjRoVHcvWXZNWWFQcHFpeEYyc2tSSmtpcUkvK05mOS9ZcEdBMHlP?=
 =?utf-8?B?MXdpN1hicDI2OXJpT1lnZzZYU1JYK1h3c3g0cyt4Y3ozdGFOSkoySEV1NjFk?=
 =?utf-8?B?Uy9sSGtkUGdOaFVxcHJ5WS9HR3g2THo1YThkWjRzaUZHQjIxUitYOVljSlB5?=
 =?utf-8?B?YzJKc2E1czE3bDlEWm5FbHZGNGI1ZFV3aS9BVkNxcWpCaUlscnduRnNSY2FU?=
 =?utf-8?B?MzFTVlRMQmUxMFFKZkowbCtFRDZEZGRmenRGN29aNTlkQmdCNUIzRTR2SlQy?=
 =?utf-8?B?SzluWXJXcTlWd3pRVzJzbnhVdVVmS0NlQmFmTVhzRnhUN1ZuNHQzNUZiRXU2?=
 =?utf-8?B?Q2hobWRaRFFuZUE3YWQ2MGE4VjAzUWJrQW9JVHlnYjhublZWcnpyWU5ZVUla?=
 =?utf-8?B?Y045cmwvb2YvTzE4MVNMbkF5eU05SmZEZFFTSVFxajI4dGM2dExyeG1GN3A4?=
 =?utf-8?B?M0xFL05nbUN2cHNOa1k3aGRiUHpjdWp3L2tzS0NiaEQvOGtMSytQVVNCcmll?=
 =?utf-8?B?R2JLVFdkelpMRUlFQzcwRnAzbllTTkwrMVNTYXNHRlpEOW5yakxZSHBxaVZC?=
 =?utf-8?B?VXB5REYwREpPclF2M3ZOemJwcWU0bDhmYkJldktOU3k3RzJHc1c0WTJMb01s?=
 =?utf-8?B?MUl3eXhRbHY2dldiaXN4Y2VwYkFCZ05NT2Z0LzNrYXpsdTNMSnhIWHJYdC9p?=
 =?utf-8?B?Zy9sVTJMRW1pdGRaR2xLeDBNbmhYSE90c25rbmN3SEpOL0ZKTmorRFMwV0la?=
 =?utf-8?B?ZWFsT0RQYisxMVlQU0s4SkpyNk5PZDJ5TDl2TnFOVmY0RCtmTzZyZWFaKytU?=
 =?utf-8?B?TTgyYTlkbWZ1L3JDUFYzZG13TXVaUGFxeEVqZlIydk90MHkxZEdyVHhqZHc1?=
 =?utf-8?B?MTlMNG1kT3R6bGtCMXNMK2VQS3d3bkpXL21qcHduTlhGMU5oTG9Wb2RveWFT?=
 =?utf-8?B?ZE90ZDQyeXA3Y0JobjJYS2RvbGplY2VwUGcxMjBFM2wrb1FEcjhPMkhZMmJK?=
 =?utf-8?B?L2F4OEF6Ly9KdjFmQTV4akNGQ29FM1RDUDBNeW96UlBaUUpxZ3k0Wkp4S1R2?=
 =?utf-8?B?dmc5RGVUUDgwTTh1MTIrTDROYmxZUjhXMnZ4U0dPdHNIVjRNcURXY3BkajJB?=
 =?utf-8?B?MFR6YXZHUy9vSTZBYUF5OW0rb0JsQVB0WnUzVCt2K1pJUVI5K0M5UjZEYlVW?=
 =?utf-8?B?NUVqSVJuRmlCZkN6OVFiK2VQelB2MHpIbGE4djdUOUVqaENRL2UrY0dDdDEw?=
 =?utf-8?B?RGNLNFZvSUVKTkwybENFMFNZblh0K3BVelp4QVlFSk5haW0vditDbTA4ZTVt?=
 =?utf-8?B?bUF4YVdLeVloc2hQb3NhVGo0OVAzMHlIbkMvMW5DclE2b2h0T0pKN3MrVUxU?=
 =?utf-8?B?TWY0MUdvS202TnBiZjBCcE1peVF6bkpUbTE1VXBpMTkrUjVBb3ZXTU1XN1U0?=
 =?utf-8?B?VjhlNDJORnhjeS9oc1RRMWhpaXZhcDdZWFR0cVQzUVBBQ3lrc0ErSGE0a29U?=
 =?utf-8?B?dXh4M01ZdDN0cU1uRHFmdzA2MjBXZDRvK0ZjalFWMEl1bVBtbHFFZ2JoRllJ?=
 =?utf-8?B?ajA4YXhLT29PbGt2bzBHSEp4bFZhR24yWWRTZmdhQmtpWjNZZDNxYmFVclRJ?=
 =?utf-8?B?enFMZTVSaFdmNnIxMXZsMFBiUEtsWng2NFdPb0ZSYmUwRFBiNnIyZXJvQlYy?=
 =?utf-8?B?VTAva1JHa0s4VUJPZWVKVngySjFvUnBaMXNsd3VRck45UmNqdUFRNllVREdx?=
 =?utf-8?B?TTlCVWZMQVBpWWwxdTVkajZqSEVUamVRY2dPUCs2VEVwMTVBb0RTQkpzMDF3?=
 =?utf-8?B?Q3ZtcnNEVitMNmlVNTRJUlIrZjFCSkR6UklGUm5iODBCOERYUGlSZnhHNklY?=
 =?utf-8?B?MERpN1RxSVNHSmVqZmJFV1lCOWZMbkVwWXJyaGROVEc3Sk5wbk5PZ1dlRHpk?=
 =?utf-8?B?YTJUdmw3WHd0OC80RkdhSVJ6TjYyZ2lXMlcxRGttOEo2a2lEQmpkZWdYTzgr?=
 =?utf-8?B?NFFObVJ6WktTVS9LdHphOFlpZVcrUGc3bTIvM3JSdkQwbFVtd2ZOQm0zRmhw?=
 =?utf-8?B?ell4THhxbWt4VHdDeWphN3NLeU5lY3ZxemROb3VPNEtrK2ZObEdPUzhVUGxR?=
 =?utf-8?Q?n4HtZ1qce6WDd8XwqzpnIOt1Z71REg5B/J0c4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237deb3c-31d6-4f90-138e-08dee0fc1d6c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:30:56.4740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbirMipx5cjY7Y8QZTEppyOfsPwmKHiMiQ4bmnP0BkqtxhyoZ4ujgLOgqzBUtVvu1BNGR2f9LUVLzPriWYIR2FQJ/+d8IMUd4HQqgXMohGYuCmkLuAR847UebBaC1PTE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10854
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_173101_084528_EB8AE225 
X-CRM114-Status: UNSURE (   8.78  )
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


On Mon, 13 Jul 2026 11:22:45 +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> The board routes audio related signals through on-board muxes controlled
> by a GPIO expander. Add the mux states required by SAI1 playback and PDM
> capture. Add support for WM8524 and PDM microphone sound cards in DT.
> 
> Changes in v3:
> - Fix node ordering: sort root nodes alphabetically by node name, including
>   Move wm8524: audio-codec before mux-controller nodes in patch 2
>   Move dmic: dmic before mux-controller nodes in patch 3
> Link to v2: https://lore.kernel.org/imx/20260710024204.3462444-1-chancel.liu@oss.nxp.com/
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: imx91-9x9-qsb: Add audio-related board muxes
      commit: e5f7c88d3ad8c617db4c8bc381001d272b02ca21
[2/3] arm64: dts: imx91-9x9-qsb: Add WM8524 sound card support
      commit: de6ed1fd9b97ed143b10de7064c6d30a9b545379
[3/3] arm64: dts: imx91-9x9-qsb: Add PDM microphone sound card support
      commit: 25f7d6026e2549a73e529bef85c80579528ebb33

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

