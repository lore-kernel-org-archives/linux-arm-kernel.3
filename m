Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757C9CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLVCxmgdPTxOkrtRmCtbGCBask5b7vJNCjtt9YKrfvs=; b=p96IwyCDiWPIXH/m7HqiDyM7to
	QehmEUEs/7my3YFST9/48e4oUmskVn+eIdfCXAE0X2YHo3DHfTna/BDgmALdrCne6qAqfIS8iYI31
	Am3297jBFJe6KWT90M5U7Ap5yFHViAl6eH/GrBq94mEDSZfllmLpcFGZeaaOg9z6jV4FC1ShVhBtg
	2SHHhe6nWoZ+5Ieg5jVlRqgmnOCpOBkS3B49CIKRhfPXz/UGwtTmIZ1cDs/4niziFYHQwnxlsbxPD
	XgnlpiB1NB170sq7t0YJvnshQYU0DA8PIZUN2ddShidI3TiLTduw/Gh3+/TlrW6rHEs5VX8BZIVsh
	MYttHOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqYv-00000005W3U-049z;
	Thu, 23 Oct 2025 08:20:45 +0000
Received: from mail-japaneastazon11022142.outbound.protection.outlook.com ([52.101.126.142] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqYs-00000005W2G-2x90
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 08:20:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RotLaInNXBHNTx+k6TCGHBoIBKlV3plO+eUibTGYKtC4BZYfrH8esiszzP/KcoZRZm2H4wl9BPS6PxoePaRG1svisuuLdBM6wX2gUSRvpZ+Qe0U0Zu589pgNke7X4o5bX0WdsMUcuuahwpWX+qQSMS9E0bgSmmn3IMRsRAidAZF1VA4DEeIMWbMKVy/DpU3Z7+NQmjeAMdp6ymZA/0aJqdkcV95JBP19IYnLfl6MGBvY4OcKXsKeYjRJ+TU53dFj/Z6HpAiWTOsz2lO/uhHneOMS28v9GBYX7jXOXTWU7364ZUXIHNPldy+9Vqsp2nQxlEz4l/s8qUxKaCsO0V0s1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLVCxmgdPTxOkrtRmCtbGCBask5b7vJNCjtt9YKrfvs=;
 b=aiXhsux2w23JB3z7F3sA/FA4yC2albaDttAjzYrPHNgjjfs2qIfJFCC5K9FLlm0vt1MNSqS3qSfWGUtoxUEi6bV55t1XvOvJu/TP/Kfv+0lbXIm8w7rIbkTpeY25jTgU88n0buikLZmXOHodvgCpq7/dIB3j+ZYlF2uF5ZWfB9y2p/oRZEXkrAORhtK8nhtFNy2R12JpQ7xAP/VVSYKzfuz4XZzIqwaCefaBh0smuqHNuvLeTI4akH6mleDCYFtSSsPEG8K+p8AkGxcnP5FAEZ/hgHgrf3rzriOcC/aByyvqgUy9T+mTn9QNzl+T+GrUvxrh4sDa0FTH/ifEB1H7uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLVCxmgdPTxOkrtRmCtbGCBask5b7vJNCjtt9YKrfvs=;
 b=BdSPMF7Dup6UupOLGpbA0xDOHzzb8PFhuwO1/9q47wX8IZUOlbAc8WbjS5zUZlOzqf9OlbB8QoS5PCYVw4tquNEON4eK50xHXyO7fHSmpGo31aG04I9SofAzUf5jREFsXdYpzujm3X56lIzsBkFhB8OHNruVjQ/3K3nVLKxQmNCKieF1jRJOTo2OEIl7DLWWoUiFVldUVXrh7sER0dogd3dthz7nzL6HUUPtXdTUZohzsOYI4TJsDMgXrv/VlMNO0vM1drZ5ivsTa2PxmLHcCPLQCZUZbYIGTNevGpf03gqGrE5DFHq3W1hOfiik5F4LhCGU38kXvItoJ3nAp5plug==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by KL1PR0601MB5549.apcprd06.prod.outlook.com (2603:1096:820:c0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 08:20:33 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 08:20:33 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Kevin Chen
	<kevin_chen@aspeedtech.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH v5 2/3] Irqchip/ast2700-intc: add debugfs support for
 routing/protection display
Thread-Topic: [PATCH v5 2/3] Irqchip/ast2700-intc: add debugfs support for
 routing/protection display
Thread-Index: AQHcQyDR1tGnofTzaEGq5MiftiNfKLTOXiAAgADym1A=
Date: Thu, 23 Oct 2025 08:20:33 +0000
Message-ID: <TY2PPF5CB9A1BE65F13FC00C09F5C1FAE68F2F0A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251022065507.1152071-1-ryan_chen@aspeedtech.com>
 <20251022065507.1152071-3-ryan_chen@aspeedtech.com> <87h5vqyjs7.ffs@tglx>
In-Reply-To: <87h5vqyjs7.ffs@tglx>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|KL1PR0601MB5549:EE_
x-ms-office365-filtering-correlation-id: f0dcbff9-49c1-4c08-0c5d-08de120d0956
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?b7uaR8dLSFQ89Ds8CsMs2h6aO7KLLOfgXHoAUgMLrX39T0Nm19uhmxsHphSf?=
 =?us-ascii?Q?RHrZ7zwYZzwIAjwMduqxdsQ7ex1uCzsMiV6sc8fJ4G1sGIUVsAYOpcdGbmRC?=
 =?us-ascii?Q?lQH1a4Pd36dbVWmBoaAYIe9bhG1JbBQqvSC/NkIyhJTzxYpvkQzlUubPaIF/?=
 =?us-ascii?Q?y3uY96AnpupDNPv8N3+aGLWw7sstov6BxV/9MDMPdopKY1iwHXKJ/MvZ0ZsF?=
 =?us-ascii?Q?QEqjZX3U+A5VzPs+RfwXxmBItfFJV+Zj0qxWlFHweSmyKk4n31Xc3JL7gDXW?=
 =?us-ascii?Q?slusIn96SGWc+ZsMdkAdHCss0Rco72RP6eKGIxRQ77NBAFTfeDLoMgAlFetQ?=
 =?us-ascii?Q?CsgLx2TWomPf+mAmcZ1CyDQ0VGz+oSC7tS+DF/ZY3m9CUwWygpptlDvi6xRH?=
 =?us-ascii?Q?3HBbQ5jdmIsHMbbLO9ApUufs6EDYdvPDOtEHbl3VAm33pOlH92dUUlqVr+Tq?=
 =?us-ascii?Q?lSILgnwZBZlN68Nwl1jfcpMrQwDJIVAMEdP7xnmEs2yPKrB2IgHVWHQFrAa5?=
 =?us-ascii?Q?tqZquAEyK5UO9+LpBAJrfXd2PwByP5IWQBPasjkPFVBhkrXzyAesUOwJNSWU?=
 =?us-ascii?Q?aRVJwCh/T5z34cQWhQLvOhe6LuWojfBCkp0tTrfBUvDhB/X2LkZjzMLsr2iA?=
 =?us-ascii?Q?bNHnK+XvvmpgqRWV1WaXJ1ZjNLHTYKhohSQ6zF7ykwmogt6aOHHq91VqaEmQ?=
 =?us-ascii?Q?WaDRvcMGfOZqOBlTg7LZ65Rj7dCUdmZsSEK3PuL7vBO5CJtU1c1Aw3zjSL5T?=
 =?us-ascii?Q?KcVR4lc5Z7vrAgF2/bXEA87Kz1fJpPXFFWeAJ+dN8HCHTRNTcEs+M7lr15P3?=
 =?us-ascii?Q?Dwf+nOWjnNiUX8RnQxnc/0CsvHGdBfXriyIjB8r9WnmMcldmrMhLAIICSpCV?=
 =?us-ascii?Q?GIejZd3dbCUpoYDZd026TFGiVz1AXLySAL8aXNcXTJfJTuu1okVcqEpqVH6W?=
 =?us-ascii?Q?CW2f94vQVULR8ApBCKcxIan+tqFeYp1rPmBMKaMfeW8alnOaN0KHBg9D9Mpr?=
 =?us-ascii?Q?+VTeAhzWeDErCzstb9wOgOwFU40eQoaAYys1drSKrZs2TvYOxz3X5jsctSpm?=
 =?us-ascii?Q?lQ1ks+q1ta1mH/0rdRb2p98fYbAwmVr7c/F4cV5eyjEkiHdjFlzyRXVEIH3i?=
 =?us-ascii?Q?MrYClHSdyuu5/A2qVKWN37ZcYrGv+oNc+0ZfkxOtrg4rTdPGb2fJ/vaRJIv1?=
 =?us-ascii?Q?hgfxvJk0UZYuYyhqiJZk2OX4eG+BLfRlxHH/hZIKVqtun7T+M3Z+ovo5iQyg?=
 =?us-ascii?Q?OoIb4zZg5VKYFxO9pkljnyeP8JpVq819hcaY3uVH64Hi6ML8UKHPwxxlUcOn?=
 =?us-ascii?Q?kBa4CemaZbyDY6yaLWFBwp7Xe1VgRCHVXLSpmE4g+04xeZXnCaSKs0b61H5C?=
 =?us-ascii?Q?uuPVx/OIWF3Pwkjr6GOsI0DZRLPlL1gJI0+Y9zEfFDH6aHO3UiuUG+FVQf5A?=
 =?us-ascii?Q?ExvGXXzNpTRQBB4XZL84L7Ga5DNrSuzokzRMGVmw1YliroAsyZiZIKThouSF?=
 =?us-ascii?Q?NHSsK4lJXU4JqxoLUZh77k+8IohlRzZxV3szWtnIMmAuK7O+QTmuNJFXWg?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MqbZ3b/Is1+lGq5aZTq/odPuZ69aVRrtO2LBKR6uwAfwYgg2bNf206c/aNN5?=
 =?us-ascii?Q?aqgpEAYk20/L8vT62VTHMzdiPe/OSzG0cFN5dwB2FSaTIfRIuP+vCuifF5rG?=
 =?us-ascii?Q?q/khOzV0o5+od2mLOeQaYbXbCY4BDytld+u0P19FxRbQOnlcRrHXnJBnEbpW?=
 =?us-ascii?Q?dRYAZhglQqz5jv2Yl9EnT1FnkVxgllPs3PLMtgz9BrCmxWPMXnpaKiOhpuzF?=
 =?us-ascii?Q?/VRFhsnnOTL7lLLhwapCI71UiT7y6VlKZAZS9KKgJrRBjz8DqE28uArkx5aF?=
 =?us-ascii?Q?RmFobNNZgtx3v0sxRNXlRj926SbmbczX5nPWxbDDTIDY9wecIOi4v570/2LR?=
 =?us-ascii?Q?1aTFaHRq43AUkhLSSfmHw+0KZhIoIkTOnIPounvSr1J1qkJ41OhvSxRr82mp?=
 =?us-ascii?Q?Yr6jw8KV9s5tIJhoT6Qh21L9TT6X1PijI77avB1xaOYCMWMHQgzIImKbh+zm?=
 =?us-ascii?Q?6PJL2KGNk1VTik0Qfuolpq4LsV7APlYTBhAQ30/YAlXkYl3M5D6UiDOcdewC?=
 =?us-ascii?Q?VfKODvQFOK6QTCF/3ZH7/vfVpgB3ZEXPuQxvW9lIXDIO94555Fw0iFW3Hvnk?=
 =?us-ascii?Q?9a3luWMo6ZcVGwtUR4cepsIkg+C00ozL1uFrTkWHMA1mZ7IfjIULw/SD/b3A?=
 =?us-ascii?Q?T/kJBaBvxrDtDAdMXAQdwqcC/NLNRr5YjE7Wxc0wGmobI+2b7wOVwjMxCq5M?=
 =?us-ascii?Q?BJFS0L/YsfaikAlvATjHe99ZsRApMHUf97usDpWMbOZUy1rlJQRuWiXVkdds?=
 =?us-ascii?Q?MrnWgSejthrrKWHiQ1+lyhUfd0GrIuYv10nnfcfIBST716EdrJFdKv4Eblcd?=
 =?us-ascii?Q?z51DlACndqHYmaBHz8xEuIz9RAO7b/bSAsplMTJ0y+/AKh0iQ+I9zUFvcG0W?=
 =?us-ascii?Q?j8z/n6mMBABEgr5YfRbjH4mDsvyIsv33mIJMVMW3VerCJc+ori8Q9MEfI0Co?=
 =?us-ascii?Q?sj4WoSKgRvzt5de6Bmde2TrChs1xX5pY4ILJBLXskXTpI4NeOpP1Z30G999C?=
 =?us-ascii?Q?L+I2NBwoepzrRsviSzGRBAV+lGUx6eq5I0nSUaZHfE9JqNoGhrLav4prUPTK?=
 =?us-ascii?Q?VnOMpPi3+dF1NKytD7Dl8gK4QD5hw9WjlfKlaQT5ibttT4vsHQbvILXZiWmC?=
 =?us-ascii?Q?s3CPA/nNx1GHJ315pMZ33jCuv823W+v65qmTfgLPfQeaYYP51BOyHdQVs+83?=
 =?us-ascii?Q?3TGqLcHAHo2b6KyqA/Aqb4cylPIOTtbEOXBMsRPww+b+1RWo4sfi1Bv+8nHW?=
 =?us-ascii?Q?ISyoEOx8YCm/t+hxwP2lhQW3CBDAhw1x2QoplRwyAJ4PI44UB9ZKfubFd/1v?=
 =?us-ascii?Q?Ztd2oxnMQhjLXVoqyb9/jVOkxq0OARm2oBRdChNxihvITUS+cv7IRJVdkXUY?=
 =?us-ascii?Q?GVFzhp2N57DKYqmmRHu6Gav7c6VWtc4wNkIl44yxlJCn69FP3pSO3y5yLIDO?=
 =?us-ascii?Q?Qp/xg+icqkbh69+cBjwfYA05YMHyqCRxbVe5mZiWyPVj3rylKBdSlRvyzeeI?=
 =?us-ascii?Q?xr8Id66VyRs9a6WJVDS2M0qsh55rMKm687vzcfD3yNwQeTqxGnadP2RLcUqD?=
 =?us-ascii?Q?Q1VnzuDXlQ72tTnGBhFe4+HH2XhDZvClygEKmKmj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dcbff9-49c1-4c08-0c5d-08de120d0956
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 08:20:33.3287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lwrFCKvYfX03U2iNP8fvn1O+J71E3tGlKBJgC4hoHoPkhtjofSTJfkew8ljTzJinsNZu76umyPU646qiYGcjwyQV0oRD5pkTvZaSXlNGxAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_012042_750435_764B03B7 
X-CRM114-Status: GOOD (  16.28  )
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

> Subject: Re: [PATCH v5 2/3] Irqchip/ast2700-intc: add debugfs support for
> routing/protection display
>=20
> On Wed, Oct 22 2025 at 14:55, Ryan Chen wrote:
>=20
> The prefix is: irqchip/ast....:

I'll use irqchip/aspeed-intc:

>=20
> > AST2700 INTC0/INTC1 nodes ("aspeed,ast2700-intc0/1") not only include
> > the interrupt controller child node ("aspeed,ast2700-intc-ic"), but
> > also provide interrupt routing and register protection features.
>=20
> Lacks a new line to open a new paragraph.

I'll split the opening sentence and the follow-up paragraph in
the commit message.
>=20
> > Adds debugfs entries for interrupt routing and protection status for
>=20
> Add

Will update

>=20
> > AST2700 INTC0/INTC1.
>=20
> But what you are failing to explain is why this is required and useful. J=
ust
> adding code because we can is not a real good reason.

The INTC0/INTC1 routing and protection registers are set up by early firmwa=
re
and are not modified by Linux.=20

When routing is off, interrupts get merged/misdirected silently.
A minimal kernel-side visibility helps confirm that the upstream interrupt
topology (e.g., which INTC1 groups are funneled to which INTC0 inputs / GIC=
 SPIs)
matches what the DT and drivers assume.

The protection bits gate which CPU can write/read specific INTC=20
windows (PSP/SSP/TSP). When those are mis-programmed,=20
Linux can neither steer nor even read status in places it expects to.=20
A raw readout lets us verify that Linux isn't boxed out by mistake.
>=20
> Thanks,
>=20
>         tglx

