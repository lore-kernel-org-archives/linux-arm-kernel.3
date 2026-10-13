Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E696ACC6B10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULUPTqhfrdzUsU6OJH371yUj0KwB01rAKh14M6kYp1M=; b=k17Us1NS8Q8O6q+JjtajFSbCeB
	FJutBPQt3df4F4TZHnwEdinT+b5TI3OJPUwAABugKG1pYW07FQicIEiwqtyA2bSxp0VXHCY9jQiYx
	Znf/4uP03NUd3ADiYpPfMdVHfnTnHkg1uGz1LYNxWl0C97qJ/r9GYTUP/s1Iejch+Vjv5oC+85v+m
	aUP9u9VXbIwdemClTqPv9PUpCObo8V9RMuk0eKLf1IUjTTRmSJWcjuapc87a7dMQo3QRb2LGs5iIw
	HETxKmKqElhlkRHx4cHdPcidmuaN4le9diXTSPyuyBpk/lWq8WEkGPFFH4qo23bq/OjCwyqwvIDHO
	rK1Rb4hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZnR-0000000Ca50-2Ra3;
	Tue, 13 Oct 2026 10:31:49 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZn9-0000000CZmD-0CKK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:31:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HN5zKsCkDIdfXkhgaHCtUyYydPAFEmKjiBc4nZ1CdB/xJlO0fa/2gIzVs8LDh5xtWVPaIrE/1Ai0lVYil4q/tA10858tf5Ds71K8sJ1tyg5jDGPvUsvg67IbpdPrlM0NZJ8fCmmv0iMPBBex7SUo8WiedobiZ2sw7qoAz+5vfbeaernj7tw+2zC/fNlnYr7wEZ2DqRKdtjV/z9BQ8a89ebOudmQ8tHaVukQj4htZZdVH/FHR9v+Gu2dLve6s2rAPuNF4VGTJfCavBrLSRdsr7bJadpxYEGps1R8q8GHAnvY+XTYTria+7MjZgXxSNUEdYTBdUawd9ZWOjwC9wOaL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULUPTqhfrdzUsU6OJH371yUj0KwB01rAKh14M6kYp1M=;
 b=vPXOSWEWCNYNVEgiICvbd9Kc6eZx2k5BXMoqDg+PYGE4XlEN8g5JQCcoxmweCNBszO4NNwDxzAFbeXy2H8RnrRjR2sAjjEM9VlkGoNkRbj8wMP8dfXFSrEGHzLThvrsCe4l8ZSFKvR+do2zxprH4TkpkNnZpjOCEOPXRAsG4lM/NO1eNEbqE/OnB4E1urFn/uK+m9wKl2zqKfF2sL/dtDzG9a1AY1Rvkvh9r56frQaXhKfH++tEVMsfn3jPZHdGe9+DB7aVC/R/BjSsgiIUOM9VrUe6zeEwNMLC3Lwgek4hNuVupHPmd5XK93EYoKlEedyJoZS65Y5GRvziGgqO//w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULUPTqhfrdzUsU6OJH371yUj0KwB01rAKh14M6kYp1M=;
 b=akKPSl7327T3iQ9TEnWLgfZPIC+fJGOSPmW5gv03htIqClyUbFBbOKmXO7VftD4NKE+iQWAzc3sn1RaFRHLwOJOBLA0MwKyqrbf6tcfgzGvFsdIOWPpU78Nh9xCA5mTUEv9fbHeljInHL5hL+GYOPWnP0XpWfh115BJqcs40uM0E5JrNwkAx7C0XQRb7e25601thKub7yMQsUx5OPDXDu1zRb3TMRC2Fezs/2xJ2pvwM/fi80/xOz8uyDOsOsmTwq7dtvPmBFa49QapkUKzINExj0zJ2caneUr47DLi2VcRRMACBl+uvPT3ZxYSkLn33bz1SXfuFlZZInR5kzHZlYQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by VI1PR04MB7133.eurprd04.prod.outlook.com
 (2603:10a6:800:126::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 10:30:33 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 10:30:32 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>,
	Hannes Reinicke <hare@suse.de>,
	Joao Pinto <Joao.Pinto@synopsys.com>
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com
Subject: [PATCH v8 08/12] scsi: ufs: dwc: Sort CBCRCTRL and CBREFCLKCTRL2 by offset
Date: Tue, 13 Oct 2026 12:29:59 +0200
Message-ID: <20261013103003.373156-9-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013103003.373156-1-larisa.grigore@oss.nxp.com>
References: <20261013103003.373156-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|VI1PR04MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 61bca629-b562-4b51-e099-08df291502d2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|1800799024|376014|366016|22082099003|10067099003|18002099003|921020|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 1WFJadf197UhZpuh22Dgp3YP85CnZb4Oe53Sn1RRadGGV3tysHiK9t80bCZhUaY6wKpZNy3Quu0aHC67MBjFo61GLIlr2jfiOVmz2tpuRTqRozY72C+xIdqVN1FQC7JijtrL19UkKNzOcE9KWbujAmDZJuPQCkPvn5MZki7sA9dApF0S2IOLl30gY7bWUz01c3uM54jG32lKZRFBZBc4uOlNnnHsR6OlI+D3ASCxRpRRSYSlRB7clcBCR3M2OMSwZirQtV2hZ9mztwo506iEC8hdMfzR3ABe0kKM9Y1RhGAveNV0F7WRdqFSW2en3WOgyK01wcXGi9Ng81SN/PgAQoHRQZrK3ySyb6sOa/bdCfQcc2ohJoJgKYmP809HtIs0/r1als3GcK3wr5Vpx1q5PId1iKK+KD2aW5+BZLbE251li7R/jcJWWp5N0hXAYb420gJMVGB88UGByad2+YEx1Fzz7aCddbcaEHyyUNlXXZObXz2YIVa4+RQhxweixpL09d7iySwYacbRGTa2aOS3JhwXwU8TPNX8vmPIpXXMBBlX59QGwsPT0WmS9xsMmydnvm8OZWLP9HmzqSSpWnaISGdjEwKWrdj9cs2mCtFt5CNJngokY1ciVZ8QPclFLUTPIHjMP6r/ykWVGalTfB3AWu/2cxmrPng6WSPVz5SWfHb+/kXnlTApp75rS3EAS2Zc3r8buQGrMYb2fuoT2MI0Rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(1800799024)(376014)(366016)(22082099003)(10067099003)(18002099003)(921020)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3JheU5QN1lmVjVGTG1KNU9ZVkFQSTJ4eFVGQjl3Yzc1VExQaDNjTUlVdlYv?=
 =?utf-8?B?LzJxaEovdHhyaXFXTlJ0cVA3TEloSjc1ODZPemxtSGtSTDVTcFNiMzBLeFgw?=
 =?utf-8?B?MHhLVDJLcW55cTNIRXMyNTlWQmhpOUpQQnRBcTljMDB4UTZleFNtend4cTNy?=
 =?utf-8?B?RUExb1lDUDdwbi9qaVdsaU56NTcxalMyekgvZVdGWmNna0N4WVo0MDUvaG01?=
 =?utf-8?B?KzlrZVFLM3FYamsrdDJyamxrZWxzTGJYVmYxT3RCL3g5WEljUTFWOEE4TzI2?=
 =?utf-8?B?N1RUSFZ3YXdNRVJqQW9RWUtEMnR1TTN4N0Y0aUJTL3A5bXJxc3VvQjlRdGI3?=
 =?utf-8?B?VDJEYWN0S2hSajIrYTV6N0M5TmN5MDBGOWxycEpuS3plTzZ5RUtUU3ZMNm92?=
 =?utf-8?B?MmJZNjh3MG5oekZGZWUySktlZDV6WVgydXExdjNKT0p5aEdkdmlibHV0a3JV?=
 =?utf-8?B?VEY2c3JuVUw2aTNUZUlsb1VNWFZtV0FmMk5hYzhXYms4MlFkVHN1ODIxdzht?=
 =?utf-8?B?ZU5LdzdnQVM0N3ZpQ3lrMXk3eXMxV2NMUC9qSXFFZDhKMmp6SDJmSlZsSGs2?=
 =?utf-8?B?dlRqUmRoYnJRVFloT1czMHlGbkJYQ3AxNHpETzd4a3l6NUhsLzFxYzROSG9u?=
 =?utf-8?B?YUtYNU93OExBclpzUVhVYzZIdERjb2tUTC9ucXZRMEd0Q2U5VzI4STFCVHQ4?=
 =?utf-8?B?UmJCQTBGaWhLMkgxOEt5bXhleURGY3Q5RXlUZ3pheStYcm1tZm1mc01HTlgy?=
 =?utf-8?B?Z2x1WHdqaml1N212LzA1ZE10TlB3QkpXMWtuWXFrUEZnVnAxZW9rcUg2T1kz?=
 =?utf-8?B?cm5CMndMck9EVDd4NWdDeW8zWEYxVVRubi9XVEtQNU1IRThXcnBpWVdsaE9p?=
 =?utf-8?B?U1ZkblNzVjFYVW1qSEs1MnZ0cFl2ZVhST3Z5MUpiSjAzRlpDa2h3MjdKSlpO?=
 =?utf-8?B?Qmc2YjA3ZlAvT3JWRVVaSGJqWTJ1V3N6ajdod21aU0hjOXpiWS9xRXVPN093?=
 =?utf-8?B?REY0OExDUW1sajAwODc0d2xvOWNDaHRpYlc5Uk54T3hkTXp4TGgzNXZKbXZw?=
 =?utf-8?B?OENmdURRNUNtRnZQV3czUTVab0syZkJZS0o5aUlIeWxyZXB2QklOQlJtWWg5?=
 =?utf-8?B?VzZzQ3Q2MEJYZzBzZXY5ME0xUVFzdzNoNUtRT2tDVGZtVitPV0w3UmZyWnlE?=
 =?utf-8?B?cUpzQlB0YlVqK056dWJRdm1nZ3R4MVV1NC9NcW5TN1N2VmdrSmhmcnp3L3JN?=
 =?utf-8?B?WFgyK3AvYmZTQkpCWStWdEN2SEYwM2FUcndXZGNTWS9QbUpCNHp2dUVkTVgx?=
 =?utf-8?B?UURZRngxRWFqQnI5aW9LU0EvN2padW8xVEN0b2dTZ05NK3ZOTmU2bnl1NWJw?=
 =?utf-8?B?bVEwM0w3OERWN2x2c3ZKcWdyczJoV0dUbnZTU1FJdVBuRno3TnhDQWdzOEFq?=
 =?utf-8?B?d2pRNE5WNXJ2MFhtQTZGZHpqVllhRzhzTkJ3QStsUDlIREp1SEpCNnRVSita?=
 =?utf-8?B?NFhRRzdka0Uza3NqWUxMSHYzUkVBNUNkYXFKSHlVNWZWR3NSdVpOTnlwMGVi?=
 =?utf-8?B?QVpodmY5U3hmYVBjNnBwNWtHYWs5VXNuMEI3eXQyYjZweWsyb0tuT2xkbjVP?=
 =?utf-8?B?SzZWMEpoQjJ1Q2xMNGFGUHpGNEc1Q1R0S3I3N3ZRMDhXcTl1ZkkrcHhlclNR?=
 =?utf-8?B?Y2hkSSt0Q2Z5T0s4OUhOZlBSc0VxV2Zaa0p3L05wT2J6dFZDR2duWFBpRDFW?=
 =?utf-8?B?RE9lVEhPelZyaDI3SFV1UmpneWFYUTlUcEQ3N21Tbyt0eDJvWmcrcUU4aWlD?=
 =?utf-8?B?K1V0bmZScjdsQnQvRSs4VkwvbmN3SDlaMk1xWFk5Z2lvckNnNEE5OVJZeDZx?=
 =?utf-8?B?ZGNhc1d6c2lZdHFFMEFkQjNWdWlhWXNmZnQyalZmUGNYYVJaeGxFUDJyOG0y?=
 =?utf-8?B?VFNna3RPM2JURjdvQXdUV0Y4dDFMUXRDd1V6b0FiYWlGYWJQYjYrWE9QdU8v?=
 =?utf-8?B?TEE4SFpFWU0vaURvaXJlOTZhQlg3UlhuaXRiVGl1RStNaTJ2M3hCV2FzRU9p?=
 =?utf-8?B?UW4rMDJuMUljSFJ5TU4zNEZBWDlWVnY0TGJKaVA2UkZGR0ZoQlI0K3cxc3B3?=
 =?utf-8?B?M3FzcHJHbE9VZHpxeFBianNXSUIrKy9sY2VUK3BOaTd6a0VxeEpMckwzV0hT?=
 =?utf-8?B?aTdJSVZtS0pyZkFTSEMvYUJtL05lUVhnV2ZBa1gzWWRmT1pLWTBVUklzZlA2?=
 =?utf-8?B?MHA5c3dWMWVncGE1N2RPdzlqQnpNZlJFU1dldXpubWhRWExoNjVVMXRWeVBx?=
 =?utf-8?B?THdRUGFnaWFiNmp2TzhBWlIyemszcXRPaFZKZ2RsYzEzWEt0Z2VtUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bca629-b562-4b51-e099-08df291502d2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:30:32.9056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0bI/wRgq69tjU3JIUS3vtmDeRUZPnXBIN0emqyRkUiU9zU7G9RqzjGar2WtL6p4U0KU1nkYcELbPQ28hDDz6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_033131_107683_00258ACA 
X-CRM114-Status: GOOD (  11.33  )
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

The RMMI attribute defines in ufshcd-dwc.h are otherwise listed in
ascending register-offset order, but CBREFCLKCTRL2 (0x8132) and
CBCRCTRL (0x811F) were placed at the top out of order. Move them down
into their sorted position next to the other CBCREG* attributes.

Pure cleanup, no functional change.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/ufs/host/ufshcd-dwc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufshcd-dwc.h b/drivers/ufs/host/ufshcd-dwc.h
index 53b523ef59df..1abf2b1deac4 100644
--- a/drivers/ufs/host/ufshcd-dwc.h
+++ b/drivers/ufs/host/ufshcd-dwc.h
@@ -13,8 +13,6 @@
 #include <ufs/ufshcd.h>
 
 /* RMMI Attributes */
-#define CBREFCLKCTRL2		0x8132
-#define CBCRCTRL		0x811F
 #define CBC10DIRECTCONF2	0x810E
 #define CBRATESEL		0x8114
 #define CBCREGADDRLSB		0x8116
@@ -24,6 +22,8 @@
 #define CBCREGRDLSB		0x811A
 #define CBCREGRDMSB		0x811B
 #define CBCREGRDWRSEL		0x811C
+#define CBCRCTRL		0x811F
+#define CBREFCLKCTRL2		0x8132
 
 #define CBREFREFCLK_GATE_OVR_EN		BIT(7)
 
-- 
2.43.0


