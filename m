Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2CACCA476
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 01:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WfUW9BoX4617E1vv7Rtd1snLlKsi7dhy69k68YBfYc=; b=Cidi9FnJF8qJCLYir/khpGf0UK
	djbLwS/Vd1VF2q5dIgN/vkt47WuJl4hZOuu8CzvTExZtGAg6dyqMakbV8ucLFylxxd3CJJvlWCQxP
	MPCnbQyBSkHFqvDhXikDb7UYpUFCfDkFDWZ/gzD+5IPQZYuZutXiGleKZXcGnzdtaN3bG5PEZsc8y
	UOOrlb8JCEBoc3O/A2a8Kx+iFIRJRcoqccrSQ6NN1cWGq4o2uu0ZeI4xSX60tujNHn8cwnw06iJTy
	tGgmXAnN7Koa1y27YtKP2E0L2Df6rm0zUO8MY9/JijDzgKGtgLYwpX+DKUPFsH7yDp04Uv7jY9+MI
	a3NqB3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7kpt-0000000Axlv-04la;
	Sun, 12 Oct 2025 01:25:21 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7kpp-0000000AxlG-2KyY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 01:25:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBwifTIRMEqwr23V1irWps/NaEXg+vRE0G14NQvU1nVr+bDMq83Pmx6s39G2U18Jot/iHrkMqSz9rd+0O6l3FB9+bsznRuI5dDyimsIcxtUkLv0G+ZsaBTXgb+XveI9C+Xul1oRNOMi6XoVluc/QRILWQiZzcc6fndvQwTY5k1jiNSpg6aQXsmHQARXmh+DU4wz3jEpGp0w7S3MZN3Z5ephACOKs3PohF1fTVp8mSgp2kt+txKJgsm8Ha+yFDWGBw1gwGkw4IglywBz2uAnGPY51Ax6NdadLTsKstoniMwQ9l82idPpvKbcIUNu7cNDmP4oPMOzdPlpIZyeJj8jRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WfUW9BoX4617E1vv7Rtd1snLlKsi7dhy69k68YBfYc=;
 b=mQHza9yo5X2H6INGZ8mH4I4TLLVJIqrvfliWsk2wD6FOkTm9DFmwe6l0DTnI/lMfNtuFV2Q86LXtCeE/fOlM+0FVKYQ0GG44MTRwsABJUnvCCet6Thi+kVmBUc+ncIff2sX/o/aES0A043DiWCqey7MufvRdZmVWgZ3d7VPWpbML17GtR2O9Z1UlpE0DHIh6roKeKFNe3IEtegrRg+xt+c8qe9FQ7GpA+dQpwF/9vI0W8ikYzkcyvTWq/KP8iZQvaY8MNRFKsoyV0zy3J+FozgcFFLtPM8mDxLejcN+CioGUlF7BsEKcnLKeIjgM14eVKStB9nGnW+zhNiOiY+DhUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WfUW9BoX4617E1vv7Rtd1snLlKsi7dhy69k68YBfYc=;
 b=NyUFUlXJeyGWCE3kHO4Pr5W05UsDAZULmC5rlo/ZCkGpw0pGBwAj+Nkci2CO5qxftVuP/LCpul0yG9b2CUcil2MR39uwn8oZp6x9QXnVBBB+HWDQG76SG3TFFuveiaQc3nCXTXdIKq4XnrpfeVvDFSu++SixBtkCzWpIpZTm+ThLDdo16UPf2j/QTXTfUtU340e6HyInnZVpg0kIWlccrQhAMLEJx28OTxIECTLZ6BZ2UJzaODU2bJkGFuW7uxZ9fe9r4PXl1jP23Gt/EPFW6Zcj1PErAmmNb0ApVt8w0tubhAoObhLj6VuFbnmU1FjjL+XlEJOSt0maDq+fxehUXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9625.eurprd04.prod.outlook.com (2603:10a6:10:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sun, 12 Oct
 2025 01:25:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 01:25:06 +0000
Date: Sun, 12 Oct 2025 10:37:14 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	David Jander <david@protonic.nl>,
	Lucas Stach <l.stach@pengutronix.de>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v3 3/3] arm64: dts: add Protonic PRT8ML board
Message-ID: <20251012023714.GF20642@nxa18884-linux.ap.freescale.net>
References: <20250924-imx8mp-prt8ml-v3-0-f498d7f71a94@pengutronix.de>
 <20250924-imx8mp-prt8ml-v3-3-f498d7f71a94@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-imx8mp-prt8ml-v3-3-f498d7f71a94@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: 0930b4ce-2aaa-4daa-f19b-08de092e2ca4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wd6b9ywvnvC4OAzfw756AkA9WjOciMBvlNnT8eCGRpqu2tkw5/yOj6RoY6Dm?=
 =?us-ascii?Q?o/xtho2oD8AkDiflkQl81qxTW3Ak/tem1DrViOzPrNuZ0N2NNJlkUwzjdfC5?=
 =?us-ascii?Q?VnqzALjeNbKb8rm96WkpcZ14jlSgM1/1umY0LVAPyLc27wxb7Wy4jiSoAHjZ?=
 =?us-ascii?Q?Hzop0hBIdcy+6Pk2M/qPYtw8dHcHzbT1PWusenVUcin5YUS/NYWoyvIo5j77?=
 =?us-ascii?Q?AZKnkbhzQhdcassq1kvbbu/TWb3l8pF7off8uiB+eUXHd5Ct8C1sYD9VF/9c?=
 =?us-ascii?Q?uvwA0B+B7s3MO0PE8KEAD0U4Pxp3j/RyfMLHyG9wex8ptzP+QBQSQ0NoXL4G?=
 =?us-ascii?Q?VkCn7H91EDE8N2dzNljIEEP/xy/NzbAQUdc76p6yXRkk2+PMduSeaDg4qONz?=
 =?us-ascii?Q?st2CVOretE2qPsf+q9HVRWe17WdjtWCR29TMWMEXFt09fJBw6i60vw5MqW1z?=
 =?us-ascii?Q?KiKxpeOWGpMmMWMqQVN9HV7prwoaOnNbE91YyU27EkUgxngjFDFKTENArSC6?=
 =?us-ascii?Q?ziMRX4Y4BVh4gSrBH0opapMBMQl34dNBBeoh5yS5WHlnzUFuPzSUnFiV9T/g?=
 =?us-ascii?Q?nT+yVHYZeBNrnLaWAIUQUBmc1dnRo/W+sl5Qc7tFwpD5tVgsTD+mTd4KtVL1?=
 =?us-ascii?Q?Qef7oUQRubI1pt8j8Jo43ZcReM799duzk4ZGb+p8F1pC0RuH6QxUQliJiY9K?=
 =?us-ascii?Q?+ZcM4MjZinajtwytnr7Gx9yZd4fb+g5rDwA1iLDhe5GV5cPLw6WuLWeLAmsy?=
 =?us-ascii?Q?h0PztRsUchcv4byz9aO6MkFWK+tjv2vmYuBP3ICDIXw0ouKn1eK7gdOdg9/Z?=
 =?us-ascii?Q?il1YdJv174oFRngh+eHFSHi1fNf/DSXSm14uE56BdG1nwpHrgoaHG/MvxwCy?=
 =?us-ascii?Q?j2LWcVx4Mm+X3dicQIlKhnNgInsESZb33b+3VeJ9WVgo0Fl3DGNqg0ArPvm6?=
 =?us-ascii?Q?p64A40Qkl0kaedxxmyRcWHouuePjfGCkFLqROY80nhFcA+hCTsTjKflFTfOa?=
 =?us-ascii?Q?FmlC7GwQmAOFyoFUfGdPw2IfhU0bAP67Q863dfwnWmMDUEhFqe4yiZDVyHCF?=
 =?us-ascii?Q?wcwOFBqTCsdC5CFWSDC3Wxs+fT0OCldJOgZ1/1CYq5Cgn9KA/hhWm/v+0S0Y?=
 =?us-ascii?Q?/TiQ4sVYTGZ/VSYMG2DYfKNCyJj3ftvuPtw4sFggi0WCp6xzneapBbzJzhDk?=
 =?us-ascii?Q?+RX2T7ISAAs8yWWv7eOFjREMOvMCTVib1FwQlQRLMgZvl68PLKA5mBYrDkPt?=
 =?us-ascii?Q?vHXtZJQNb7Y6CipSaP2FgEEcQdHLT3zlkW4aSQgwCMz9Xa/oKXTVVXE+M/S7?=
 =?us-ascii?Q?MpWOBzsZaq4GNgAmqCd4wpSojJl2VgHQVtKP++gcmsTO3ZRuXAy46BcWJe/q?=
 =?us-ascii?Q?UeDgcs6M8aWJ9vT0GKnBK9vTOdBDjkXFTNKZKbEKXC0i7TuFaMhMEaICCyVM?=
 =?us-ascii?Q?UsY8idHU9eWlA8R3NGGOhxJltCUHr71kAbr586lbQq4iyOAw3B3UNKxcDu5Y?=
 =?us-ascii?Q?Xyd1+gTvHyvw5fN0GzsowAngXWmPC7u5W8N0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/nqycyAyjJWcFagHOLIqwyx5Jtfnj2h40pNQg2MqnhSzWD5qHfSTpg1NGWfL?=
 =?us-ascii?Q?j/MLkqDPL3okUTUpB91PuiUV0Mykgv1nNC9EoPxlv2/GKmbmdP+rmehC/pxk?=
 =?us-ascii?Q?jG4+o8L9kNEV1PoBQIcUsIV9CwxOIL+9jN3BlmASDflDCJLyKV0j8wgZTu7u?=
 =?us-ascii?Q?99KxHsSkSFmeB2kkwPAoSi50cKEH9pfOC6NcuPDLp9McXMz5qPLt6pCYiieP?=
 =?us-ascii?Q?/cdDOTNDW0ygVaq1Xv5hvzYqo7xqxHDp+7dku5dnd/mBaGffvVFWOZj7YFON?=
 =?us-ascii?Q?ySNb3T7Hu54c7XjMIjb9SnlG6EJiGx556VIzqKf2IVGzyHhHkpoL4xIdzG2X?=
 =?us-ascii?Q?R5qu1hAoPNTi2dW6qJ6snuNHQyS7QqWx71OSrqkuW2uWZPaMYyuYjuinW/Sl?=
 =?us-ascii?Q?u3MpUssG3NqJrkwu0GIQ8VLHv0f31ny0f+JxKPeci8r91EJwxN6abFeWog49?=
 =?us-ascii?Q?NnPldW8h/LqndrET4B/G1bxBf1zT80QbMkXlXvxA7nS0mXgLSLXZcAk/FQrT?=
 =?us-ascii?Q?FMAUg1cfmGmuXZFSLA6/liympgfXc0pcCKHvWe522ZhKyAXTETrjgeRtO6Wv?=
 =?us-ascii?Q?kQA94gKPYeLR9SegzjEyotynVyS1Wp52gP+cczgEC+RtjcxwdXv26GnVTSY7?=
 =?us-ascii?Q?u0o9i1SL5+STmjidFSn6l74MhlY8v7roRmBrr5FgGojKXhsbCnFVAhP1Dmjn?=
 =?us-ascii?Q?+ln3k7mnrqasPGmx54g4fwZBqIxnfZyH6ZtBJ/Ht/vec+ei1/zY4y8gBH78l?=
 =?us-ascii?Q?5acq35sKoVqTyzSuxJhQwsyzcaNLbNyDpkpTCBg969stYa/VyHeU2v+CWQjO?=
 =?us-ascii?Q?/yGAGFVNsNT08IBIrubcGvAbjizkaY/Ji4lPpaGOGZHdX9QyiDjF7xHeBmOk?=
 =?us-ascii?Q?lkDYR+vj1SX7X0Le1M82brNqaPV3DAXg0jimpbb6g/aMJLyAWCRE+I69QVP2?=
 =?us-ascii?Q?O+i8dR50ZFFKQbzvLaAKYBKDpXoISeBPzmUGA4pWkGAIX0WBDWhoNvfPqfdO?=
 =?us-ascii?Q?aPiCf+0V2YpGc2Yo5tOmcRD9nwK+HS1qJeBjMs4L9qvcH8OF0f5jC2sn9YkN?=
 =?us-ascii?Q?UmD89aCCI3kQxLDwHhooYJXE4danuPw2LHyaMDglWnTt6mwiF3GSGKjDWM+W?=
 =?us-ascii?Q?t0odVr68YWqxIib/CkDKPfFsIio1RtoCgxKyMtQmtf416gBnDL33Qw4QC5+S?=
 =?us-ascii?Q?elfztkMoi0Mnl0ywJbIWa2iy6Z2/l0c5tfrJeTckSNK0mlwIJaV6fIrpK9a/?=
 =?us-ascii?Q?4nWcGBsh1WnjvSiNH4t8UQ56utb9wWWO6Nmg9dPcWK504MkeKupkG4cP+4Pg?=
 =?us-ascii?Q?agnCxfww6ZuR2YYYKYNNYTWOmVYkPXwBpIeiaLwGnicELicM6GD8SbBp3TK5?=
 =?us-ascii?Q?TTKj4hM/t/FbuSNBPFzeV4HpHxks7RHMR0FgIWV6hQs8iqJ/QWiS1j+Tkt6Y?=
 =?us-ascii?Q?pYXM3Wgb8EZvhshgRj5+yd39kNWyy84IWBHiLn+VkXV8O5dUiwzEgZzD4WSZ?=
 =?us-ascii?Q?luo7+hPqoiG6xAMtUlMB7nCb3MiCT8Rj+pS6qQ08H1GS+D4gqO1vzY+aQs/h?=
 =?us-ascii?Q?LTdG8qUy9i6zeNsP/kvq8YI937RKfONp43pPuW3M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0930b4ce-2aaa-4daa-f19b-08de092e2ca4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 01:25:06.1908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vcmv6DZceZR/e2QD8O8/4UPgT3HMIDFW/Uq++R16rV8D2tldWdkh/nDn8vlXGpSE8E03v5cCDHyH1DuS8a6cqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9625
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_182518_042339_A721166E 
X-CRM114-Status: GOOD (  12.21  )
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

On Wed, Sep 24, 2025 at 10:34:14AM +0200, Jonas Rebmann wrote:
>Add devicetree for the Protonic PRT8ML.
>
>The board is similar to the Protonic PRT8MM but i.MX8MP based.
>
>Some features have been removed as the drivers haven't been mainlined
>yet or other issues where encountered:
> - Stepper motors to be controlled using motion control subsystem
> - MIPI/DSI to eDP USB alt-mode
> - Onboard T1 ethernet (10BASE-T1L+PoDL, 100BASE-T1+PoDL, 1000BASE-T1)
>
>Signed-off-by: David Jander <david@protonic.nl>
>Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
>---
> arch/arm64/boot/dts/freescale/Makefile          |   1 +
> arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dts | 501 ++++++++++++++++++++++++
> 2 files changed, 502 insertions(+)
>
>diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>index 525ef180481d..0c9abfa8d23d 100644
>--- a/arch/arm64/boot/dts/freescale/Makefile
>+++ b/arch/arm64/boot/dts/freescale/Makefile
>@@ -228,6 +228,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-smarc-universal-board.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
> imx8mp-phyboard-pollux-rdk-no-eth-dtbs += imx8mp-phyboard-pollux-rdk.dtb imx8mp-phycore-no-eth.dtbo
> dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk-no-eth.dtb
>+dtb-$(CONFIG_ARCH_MXC) += imx8mp-prt8ml.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-basic.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
>diff --git a/arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dts b/arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dts
>new file mode 100644
>index 000000000000..afca368ea1fd
>--- /dev/null
>+++ b/arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dts
>@@ -0,0 +1,501 @@
>+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>+/*
>+ * Copyright 2020 Protonic Holland
>+ * Copyright 2019 NXP
>+ */
>+
>+/dts-v1/;
>+
>+#include "imx8mp.dtsi"
>+
>+/ {
>+	model = "Protonic PRT8ML";
>+	compatible = "prt,prt8ml", "fsl,imx8mp";
>+
>+	chosen {
>+		stdout-path = &uart4;
>+	};
>+
>+	pcie_refclk: pcie0-refclk {
>+		compatible = "fixed-clock";
>+		#clock-cells = <0>;
>+		clock-frequency = <100000000>;
>+	};
>+
>+	pcie_refclk_oe: pcie0-refclk-oe {
>+		compatible = "gpio-gate-clock";
>+		pinctrl-names = "default";
>+		pinctrl-0 = <&pinctrl_pcie_refclk>;
>+		clocks = <&pcie_refclk>;
>+		#clock-cells = <0>;
>+		enable-gpios = <&gpio5 23 GPIO_ACTIVE_HIGH>;
>+	};
>+};
>+
>+&A53_0 {
>+	cpu-supply = <&fan53555>;
>+};
>+
>+&A53_1 {
>+	cpu-supply = <&fan53555>;
>+};
>+
>+&A53_2 {
>+	cpu-supply = <&fan53555>;
>+};
>+
>+&A53_3 {
>+	cpu-supply = <&fan53555>;
>+};
>+
>+&a53_opp_table {
>+	opp-1200000000 {
>+		opp-microvolt = <900000>;
>+	};
>+
>+	opp-1600000000 {
>+		opp-microvolt = <980000>;
>+	};
>+
>+	/delete-node/ opp-1800000000;

Why drop this?

>+};
>+
>+&ecspi2 {
>+	pinctrl-names = "default";
>+	pinctrl-0 = <&pinctrl_ecspi2>;
>+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_HIGH>;

>+	/delete-property/ dmas;
>+	/delete-property/ dma-names;

Why remove dmas?


>+	status = "okay";
>+
>+
>+&iomuxc {
>+
>+	pinctrl_tps65987ddh_0: tps65987ddh_0grp {

tps65987ddh_0grp - > tps65987ddh-0grp

>+		fsl,pins = <
>+			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12	0x1d0
>+		>;
>+	};
>+
>+	pinctrl_tps65987ddh_1: tps65987ddh_1grp {

tps65987ddh_1grp -> tps65987ddh-1grp

>+		fsl,pins = <
>+			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15	0x1d0
>+		>;

Regards
Peng

