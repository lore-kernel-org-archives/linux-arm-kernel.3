Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3600D10F284B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7Nob2cvqQMgVv8m0k5at0xHQgEtfA40XCp8AXq2fMY=; b=eGLoPdmJfm75pkPXrfBF/6Xai1
	WTp+WKGvojo0CJIJQVAoNEO2XdrkLYAdAjnTznxJ4vT+xuE0wHquf2cCmBVXwkXUxRsWrhme9f6ij
	++smEV80ayDKuT827Ytb3/fpsjcIEkoLFKZs8dbc0V0AoRq21vS0EjmiVhUl+NhomtTFFyHJ6sj2d
	nc9/8VaJF2E88Li8w+scom8EBTZGzMtxchzuYX4D3dSazB5WtPPSZq4sAQsJ88CoCE4K9sgGeiNoF
	lGc5PTOqXmlQ9c4YR+2Jm5MDlR6ZVP7H75ec2qMaY0V2uPXY46WjhumawTSmXxQzWTLMtlJPmT5WH
	BeezSOxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69xZ-00000007lWd-0ZQq;
	Fri, 27 Mar 2026 16:22:57 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69xW-00000007lVM-11DF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:22:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eii1W1KlUrmns2LtdBo3H41QlVYcm4rHgROvy7jdAPVo0jsrN/h6GPsTNnTSeod22peUALBmpV5EFycrYHuDfy9f9eL0fUU1yJA2zc05r7Th12o2ohHB+XcnXhHvfJuWuizOrEaZfglAxRe7kPgewctf6igC9gPEidAIywWoVkznI3r99clBLL8upz+xzH7rmIMzc/bATaKlq+EZj29HSPG/+a6vGLGum4CjC/AX0Mx/81b4nAQcpxoXtTv0gReLqe6ZKn+HYpUCkYsqKWSCC6b/GPQHOd3afGr1n+XzwEVcJOizSoKyq1sGyAUQqEMs5smbdMOXGlLLAvPEZA0y+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7Nob2cvqQMgVv8m0k5at0xHQgEtfA40XCp8AXq2fMY=;
 b=xluzkkW8R+WJj1TYMz3+K1zCcVl2YkEovJ6LCiFbukUB6QPnJSmLXqQdc/MUo5Dnf227VXthYEFXbR+0HGgE1xproeHqvqMHuxQx3x+EYyktzo259uAWvkRlKlylme1+amyb1CYJwnSgEf7VNNqVn2saVnlmZMm2lV0holKttcO2ZxYEjps+f0RdwjT0zsxxQfWuMZ97lG1GiEQ27Z82ArLYeFW2j4yJ8UzYQ52mMnCzMuCB7icqMIUt9Ncmcf6/oCqJEwLNKguJrPhVwytHl7w4gAH6OZB1UAiaPKNKCFN7wEhti1VRciCqL87ljES9T4N5VxdzWn+8QYDh/Pxh2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7Nob2cvqQMgVv8m0k5at0xHQgEtfA40XCp8AXq2fMY=;
 b=clsEIBUb0e2NC0nAduvci/eVL3jCJGWoqZB0cYQXVjXzy3snA+dF4aoRyYS4xVGcm1p7J7YhUv/yvSTKPasWsB834LZVvTyYENG6HwHV+W1zSUKVx+xKWrYjxUCEpq9nDKDH6nJZksxLe/1UojbB4GEhE5xSIHxDq7+dMtGalbgP5HMKyrZmy+yaFXHyz+XT563k2Si/gAuZ0ZaktBItwk3VRgQnr1bsZiUvrseUIOdXJszAlasaUTtNV1reQ/3QHcshY4O5csf/YWM8HVqKhoGA9+QuY4gQvVVIvMu/zWn7Ev2hvadpHGogML/alP2OGSVI27oxLRVjhuqs7Tgs6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7367.eurprd04.prod.outlook.com (2603:10a6:10:1aa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 16:22:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 16:22:49 +0000
Date: Fri, 27 Mar 2026 12:22:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2] PCI: imx6: Don't remove MSI capability For
 i.MX7D/i.MX8M
Message-ID: <acau0qZNUqEQmGKS@lizhi-Precision-Tower-5810>
References: <20260319091823.446030-1-hongxing.zhu@nxp.com>
 <abwFVpxrriV7Bt2L@lizhi-Precision-Tower-5810>
 <AS8PR04MB883306406390FCB4106C3A978C57A@AS8PR04MB8833.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB883306406390FCB4106C3A978C57A@AS8PR04MB8833.eurprd04.prod.outlook.com>
X-ClientProxiedBy: SA0PR11CA0071.namprd11.prod.outlook.com
 (2603:10b6:806:d2::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: a48d8f03-20c5-4653-5b89-08de8c1d1638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|366016|376014|7416014|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: hKcF9hXmrjJkiT05o8hyXl7NFpWkG6Lm0hkUsKhCPJMnuIrWMRbGDUG9GwoAYGW9/SjgePqEb3pwrtLDM+bheQP/iquUD+uJggMfS1W0t31pGkwname+IpFu7hC745s9Ax68A7z37eVCsP6tp+3UOgtpxL0xWEAu7D2sFHaPvP6mQw+kyjTWPhdifaV89CL4AmnfUZDCQ0NHKARm3IiYcgwfKtk99fnoNirMU49UY7DmC3/0KK5yc3emzBJQfJwEZWKqVnNMx0/KvpYrEwzQepO+gK+D1Fz4Rw4f75HBekzvwIqt/FH0oUHkU5ZVwkpx6wdntRVim6KVXWFAD/RYKHBHwxLtc5f9uLCQvdH3+KQNCA72bNs6XhhFtZIUYB/1ftwGkdcS+fu+xGiJqcK10v3w4G1PcCvLy61G1Cmuwnf+iVwLkY87Z0JKrLIfeiXr4yxY5+Hef2s3az0P3dLuK+qXN2wBqtzquQP2UyUHunayMCqK7zEIvfvkrOOu/cKGGdNQkUDy6MVys3VCAyOf4I6Dc3LiwFrejSBUW4W0IzpEAwDLYQo7QgfkFgLO1XIAJzUANZfBZHOy10AUvR1eJYVn/L8+TaieqAg6JZR7aVO7Bg5hSPM7Ztp6y3qiZMltDgivuG+llP644hBDzOKFThBmyX67cofy6wAtkcuNGbFDiub/QGoANvemSzoO5tWKorGact392RZCsqc2ADCoKGjIzz4SDgKSr2qSY1izAnwSDLjYEURemv0BXQiQNrpRACMeisvhJYBP6Mjf+6608HN10lqRiBXMW9rJziULQCc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3RkbXp6SGp2VllqSmJmQmZ3UUh5c0lUVkUvbGgrdGtBcnlIQ3hHS25jaGlk?=
 =?utf-8?B?Ulo4SUJzTlhrL3lkbzFLZmVOTGNVckRYTktYS0ZJYUtxemFsbERXUERHYjhy?=
 =?utf-8?B?RXFraWdMSGdyR1gxT1VKaE1FUU8xUnV5Y3dsZzNsOU9jR1cxSWxTL1pJSjY3?=
 =?utf-8?B?emN5UktveVJHd3dRczdXMTc1eHE5d0c3cEdvZWduMnFHZ1YyYVFrcTdIdVJB?=
 =?utf-8?B?U0ZWbW1oaktwMmpFakU4SHBwTWtxZEcydnNsVTFvL2ZjUzlPNkVhWGw0QUt4?=
 =?utf-8?B?Z1U0Wk53cndPMFh2U1JNd0daZDN5dVA3dHVkbUd2a1JmdTlma2FlVDNBb2xq?=
 =?utf-8?B?MHF0b2FjazJQZ1o0S2JuUlZrMGw0clF2QUsxbjhHU0MrMFdwRFVDKzlJMWd5?=
 =?utf-8?B?dGZPUjlvRlhtWk1maWtuTyt3SjBzV0VXYmVXWDZpTndqU2FEc1NMTXJrOFZY?=
 =?utf-8?B?dlRlaUswZHJwREtoS3NxUWhPVGVQRzhhZEg5RExRYXRuMkx1eVZQdUx6ZEU0?=
 =?utf-8?B?Y2tXcnFtK1RZeVdIeWhlYmxPUUhtY2M3TXl4UDRhVlIxQ0hTekJZdFhVRlc0?=
 =?utf-8?B?dCszcDg5dS9UM0V4K0NCbTlLRG9wZ2VUM3hhd2VuTjFHNTNSQlVkSUNGbHNk?=
 =?utf-8?B?Snh6c1R5K3kyeGc3bUI3R1lvT1RKZDg1ZEhGbXg5emZna0JwL0cyWGpEWkFn?=
 =?utf-8?B?SWpJSWhZNkM3ZnNidnA1bHNJd2YyeUhZeXJYY2FnejJJazBNZjVNYmJJOXhQ?=
 =?utf-8?B?UkpRS2IvakRkU2swUkRNekovVUN3Tm80V1RGaEhzRmFlRCtBNURVVWg4eElR?=
 =?utf-8?B?bXpkVGxoRCs0a0NZeGRkSC9NZ1BaYVBkcFVLMGdscS92VlJoaWM1ak94dGhO?=
 =?utf-8?B?RDlQenVLeStrM3dvUlpjQ09TK1dsYitvZksxT092NWtySWZIb3UzUi9oVnRG?=
 =?utf-8?B?L3lVc2dtVGx1NWdvem5ObFg2cTVlODM2R0FrNmFOT3FZZHBxQjlOZ2s3N09U?=
 =?utf-8?B?YVFYSDRHSnVRMG9iZmxjYXBzZ2xkdkxTYmpyL3Z4a0ZrTjJ4WnRhd1kyTzFS?=
 =?utf-8?B?QUF5ZDRDRWJZbmw2bnpOa29TMHdkSXRFZStrRFFYNEVkeWlxeDZ5VVdsNFJT?=
 =?utf-8?B?VDFBQ21MUTlHUG1JODVzZzdSV0o2aVR4cGM1TllJZFRld0xwU3Q5WEdvc3Vp?=
 =?utf-8?B?dzdodXdUSWpXYUFheGV2cXM5SUlkZG96TVlwZTNpZk9sR1B6UGhBViswTDVw?=
 =?utf-8?B?VzBkU0pYaVQwWlJCYW9UOE9RRmUxVGt0dkwzb2ZHN2JFK3RrNW01YUtrbEJ6?=
 =?utf-8?B?dUYwcVRucFB6U1RER2Niei9mbHFYYlBNQlh3a3RXYVpJYVh4aVdyQWRHMkhU?=
 =?utf-8?B?VWRqK1NyVGRZSHAxemJKU0JYYmtvenp3YUowYmp2VFlJeHEvblpTaDRYQ29T?=
 =?utf-8?B?K1RrZExYWURXcFk1SlVhbUwvYnpsbTJMQ1hjWFJzQnhmcFJHbDk0WENPWjZw?=
 =?utf-8?B?Y2hkdmR2aXhDTXVYVFY5YWFzaEJYYUhEbXN4WlZZR3dQbVR4ekhFTy9yWmND?=
 =?utf-8?B?SWd0eVgxRGNGbmtQeEdQTVlIMFBLVlF6M3FEeUE5REorNDE4KytMUUhuQlNh?=
 =?utf-8?B?dHp2K0UxVm02SkxnaVFjbzdTRTdpditOcWY2OEx4TjBiUE5QUW1NcUoxT09k?=
 =?utf-8?B?dVp6VnVmeTNuWFpDbGI0Q1kxQThPTFZmMFJKSjU4YTNUT0pXVXAydVBuRmpZ?=
 =?utf-8?B?VlV5MmhmdVRWMHZhWkVGNUZSWWpsdjhVaUZhZ0VoZlEvZFJtWDZhL2w0bHoz?=
 =?utf-8?B?VmhiN1J5WG1UWXVpOVhuajlTTW4rQU5vbWE3UmlQV09hY09NbG5CTE5Cd29J?=
 =?utf-8?B?S241UXYrU0xUOHhYN0VPVUczR1R5M3FmY2NqUW5MMkJ0SXl5ZTIyckVQUHNY?=
 =?utf-8?B?MUFjMldwc1BPVFpGeTV2VjJ1RjAxNnN3NGdPZWVjRCtZOEZNbHpFN1RxZmNv?=
 =?utf-8?B?Y3lQU1JUWkVkYjBkekx2T3E2TU1BTHcrZXNhY0QvWU9XN0QvN2FMa1hrRjAx?=
 =?utf-8?B?bmdjbXlTYkRCQjFBVm1EaUtzdDdNTVJ2Qll1TkVUNGx1UEFteVhQMmJqZExp?=
 =?utf-8?B?dGlabEJPMGNaUUlsdnF4TzNycVE2d01DL0ErZzlpMUZqZzZhS1V5eGZ1OWFU?=
 =?utf-8?B?YjhUR2hTMGhrazJ5NEdtcFNzTzV0MWV4NmRrU1R1SHN4WXMxQkphRDZqSS9I?=
 =?utf-8?B?ZVFJYmlDdmZQRWc0ZEQ5NlkzTXZxbHVqaGJORVBUNkRpOFZuWHA3ZGZiMCtl?=
 =?utf-8?Q?QMs/ua5+wFvih+6jft?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48d8f03-20c5-4653-5b89-08de8c1d1638
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 16:22:48.9553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IlUI5orc2QLtoq5s0l0LKTgz9lrme/rJ0cr40HirU7EFEhMsS0/NkZVNDl6HeENsMms+ZjlJYKa074RnOR3Csg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7367
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_092254_297094_9BCCE079 
X-CRM114-Status: GOOD (  22.19  )
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

On Fri, Mar 27, 2026 at 08:12:29AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Frank Li <frank.li@nxp.com>
> > Sent: 2026年3月19日 22:17
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: l.stach@pengutronix.de; lpieralisi@kernel.org; kwilczynski@kernel.org;
> > mani@kernel.org; robh@kernel.org; bhelgaas@google.com;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > imx@lists.linux.dev; linux-kernel@vger.kernel.org; stable@vger.kernel.org
> > Subject: Re: [PATCH v2] PCI: imx6: Don't remove MSI capability For
> > i.MX7D/i.MX8M
> >
> > On Thu, Mar 19, 2026 at 05:18:23PM +0800, Richard Zhu wrote:
> > > The MSI trigger mechanism for endpoint devices connected to i.MX7D,
> > > i.MX8MM, and i.MX8MQ PCIe root complex ports depends on the MSI
> > > capability register settings in the root complex. Removing the MSI
> > > capability breaks MSI functionality for these endpoints.
> > >
> > > Preserve the MSI capability for i.MX7D/i.MX8M PCIe root complex to
> > > maintain MSI functionality.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: f5cd8a929c825 ("PCI: dwc: Remove MSI/MSIX capability for Root
> > > Port if iMSI-RX is used as MSI controller")
> >
> > I think it'd better add another varible to check in f5cd8a929c825 if
> > (pp->has_msi_ctrl && !pp->xxx_broken) or direct use IP version, which
> > already auto detected.
> >
> > Previous patch have not consider this old version controller.
> Hi Frank:
> From what I've observed, this behavior seems tied to the specific controller
> design. For example, neither the i.MX6Q nor the i.MX6SX exhibit this issue.

Yes, should rename has_msi_ctrl -> disable_msi_ctrl. Set it according to
difference condition, such as has_msi_ctrl or skip it for problem platform
such as i.MX8MM and i.MX8MQ.

Disable it and overwrite later will cause confuse.

>
> The intention of commit f5cd8a929c825 is to remove the MSI capability from the
> Root Complex (RC). From the author's perspective, this change should not
> affect the  Endpoint's (EP) MSI functionality.

Yes, your patch fix  RC  mode?

Frank
>
> I'm not sure do this check (pp->has_msi_ctrl && !pp->msi_broken) is proper or not.
> Best Regards
> Richard Zhu
> > >

