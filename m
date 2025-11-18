Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F2FCEE340
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzN6FpLHyGbpRSrAMIcY7ywwzNsyVcCzZm5nZM6lvwI=; b=zGiM3dbK0TZyCo8YSX+vwkAJLx
	F8YF19DQbKvV2aZNOfDJqsBFouBt42V57tuqBF8ECBCzQABD8Is34796YsjQKYDRtOTp7H1tz/mXl
	yEha8lWfqPsT8OOF2lbW7jVXYXHeurJsk3Db2lPFf4QvTFnajL+OpM2aCWLPlssrF8bc3zVFMKsgo
	4lYuYlBrYdpE/f6oQwOTmsdkwQglGEy9KZlsK5tDYz8ODi4pCAGOeoIdL4FW3oH8zfQgo34E3wh/S
	OYLXdVbMt96mMSU6BR5tnUqn1FrvN0Ue1XQdlo6Fc6Hiiwbesb9bcz3pvHLLZOGBsOkSNMV/zeWia
	ioTVdEPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLP56-00000000nS2-0alt;
	Tue, 18 Nov 2025 17:01:28 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLP53-00000000nRd-0JkM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:01:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C809uic5iIScrQqFxUyY7aJebvXPc+KuXVZ4MUFiMnR4daN8BXOJ4w66PbcdAAZbD2A0A7QrYwbHbDqHgP9SLfKT68PRN5eD1TMUfkHFWaNin4hb6jA5sQV+vH8fKzte4LoGDUuSBC+4K7cysjfN3J6aj0BW2t4gt+FAnnE7OgJLXverkQb0fSxTflA0du/GIOF24L6ESpWs83nMuKflCCFSZ6Li151f5HhHsr0Wb63CsGgJWXt3MemJrr6XlnP5spfufXLZ1Rgin9TpZCkoh7RINhAjhDKe9QDvF+GYRcoOZMOGYKniGXdn1tMU7djM+n5W3mSfB39Vj62ftk28hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzN6FpLHyGbpRSrAMIcY7ywwzNsyVcCzZm5nZM6lvwI=;
 b=VyCrFPnX2uXWhImX5LpAKs5M0Cyv2arSNuakIV5BjV0VXNycubncmSJ0ClDZg2Td99Mvk41pFLymuIq6e/2ZpkU/YBeTGoU1T0mm1eMf8RMM/e9oRnJuvQGQwNbFu5wD8/RSeN0ci8qQ8/uu/Z6WdT9DxZ7A7R2Ou4H82LFthdVmxLBR4cSKzeeb1D2juwdfgP1JvyQHx4ZbWSLhIlGX7TikSHi2qty2NClSWPPDXBF4mxsYmbpwV+Tk795H1BV2rhA1yzqpyhemmBPL+pt+eSMG+166g2VHmr8M1YNV7YJ9LnPXnFC5jtUB/phpy64FveI5IvEqhXW/4eS3pS6Izg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzN6FpLHyGbpRSrAMIcY7ywwzNsyVcCzZm5nZM6lvwI=;
 b=XE/Adj9wBuH97TNq4oEhhRd+wwZDzmZ4FXTiw9wb0GrSz53MD7bfFAFWyXd1RAcP5z6jCEJkzAKtLYl5OhPXYcJu10hjCu4bqjTjmk8SYVPw4wzc6eySC5lUF+DAnI7I2JyIvaVrcEJwOzhalk14uRIYusQ2rl9Rt60l3ikvtmd9BsV+mnMhYBWTrczUYQEklQLnWVeLTMjGYNmqMGF5LSfq99s2C+Bn0oEIvWZ0CYIwAYqleZvHRsUpPqybtozg9wUimL7piTxCe1/frCe6f+q7Knth9sds0531B6PisVFo0xqSZWCPJI85bqI6pqWYS//f2mSujHOSnn3uvjl3UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA1PR04MB10673.eurprd04.prod.outlook.com (2603:10a6:102:480::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 17:01:20 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 17:01:20 +0000
Date: Tue, 18 Nov 2025 12:01:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com,
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	cassel@kernel.org
Subject: Re: [PATCH 3/4 v5] PCI: s32g: Add initial PCIe support (RC)
Message-ID: <aRymVtJKtcydh3g5@lizhi-Precision-Tower-5810>
References: <20251118160238.26265-1-vincent.guittot@linaro.org>
 <20251118160238.26265-4-vincent.guittot@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118160238.26265-4-vincent.guittot@linaro.org>
X-ClientProxiedBy: SJ0PR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:334::22) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA1PR04MB10673:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9087ac-5b07-4ad8-ded8-08de26c41863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mE5wyScceJD5efhRR2sY8IcHXbXpCXXU3jjP27/64TZ0MyMPtMT+DGCRYx95?=
 =?us-ascii?Q?ZIFkpk7JsulHtf3/xEtrBe6XqZT+ZoB0qNZRXFugA5boEev87KM/ziq8h+3y?=
 =?us-ascii?Q?Rz+/AULZi8gUzVoOoOeOhQFGsBhjJhYSMrscDP2FK7jk9uMVfIaPFhcMsBLm?=
 =?us-ascii?Q?6mGI1ytauEnZOHTdHQ+rhm4tL3FQns2m4/rZhyjhXNfaCJWxl3Dvv1YMShuv?=
 =?us-ascii?Q?2TZ8tmaJgqB/IXX8Y3lt2WlgHXOY02QuOfwMVNw3Eor89GB2shRgsSqr882A?=
 =?us-ascii?Q?/FfP/LaPrUdVCF//IWAZnqb9ANyRFqmbrlc/XI1tJDv3ciHd0KKltQNsIHA1?=
 =?us-ascii?Q?447tZlg3P3N5EFd7/iA+4VbnQrcBWEw24uIiw4qUsugsoTet+3x6rOraIOb7?=
 =?us-ascii?Q?MLfBCooz4n4q0DLefXJ65DisD6McefwNA5Iu1vuGDaiLfmd/KfH5cD2HTo87?=
 =?us-ascii?Q?+dxmzLz3kygrmArmKmGf0VE40h7rX66ID4KIgaz0iP8HwtgDM/gBYw2N9rtD?=
 =?us-ascii?Q?+XO+R8CNS9eTEgCO4SZN2BgNf1aWK35EbmxAx8nmDUiH5eISFQVSfOqUl5vS?=
 =?us-ascii?Q?vLZZEsR9srQvKrBe6RMIchHKoP+4ln+QcTxVwgLKO1WhmkUGNPfK2n0+l01t?=
 =?us-ascii?Q?CjMm+sXgIbVLBSh3SKUDtzZQrkYCpfFr4u148KVbehRng2vvba2bLzYV5kwl?=
 =?us-ascii?Q?qF4qdSYun3ie/mn9JHePjbRg19rTWsrWdeKAysv/sHPW54LQwGGP4EjkcZTm?=
 =?us-ascii?Q?td2bYcJ/5+VmGC+txRPmiIWwreMCGq2/hjEN3mfxpgDC4ucqPnglzv3Ov4fQ?=
 =?us-ascii?Q?9JimC4FE+EooTrGIHN3kMQ2eqgYs+tluQicHzkjdCcKNnFMu7RnaIWoEyWnZ?=
 =?us-ascii?Q?dK6762rodUNH7NpAS6rCTUjyW4q6/fcYJ9TezHzMi2qMlavRA+uMf4jGz4Jj?=
 =?us-ascii?Q?sNVjJszH1ATOnuYSkDhoeOepmBCpcs7Zk4HX0o469KyQOOx/YERsLWWqkrDW?=
 =?us-ascii?Q?dqpquTJyItgwdz4PMqkQKYkjkPA5fuS/zBuDrh6xvl1+sB0NnV9VBmyzYYee?=
 =?us-ascii?Q?9H4zZK9mUfK1LwS3WLCZJMvXyPvXon8yL8x8rWWSt/Fn4VC752nYFqknplbY?=
 =?us-ascii?Q?MP06Jru1/hv5BgSUP94BAlKuUnIxrU1/vXu+tNEdmsMt+Em8j5yG7+sMTeWZ?=
 =?us-ascii?Q?Dw+QRBK7PG0qBneP8BYK0iFovpCX0yiTtznDoQrG4PU/NPetByEoDrm42E3l?=
 =?us-ascii?Q?agcN9Bfs7o2tLtrqw5jnAXgUYMwx5lUS0pdpwBnFUyGwlxenUfw7ZFuzOzDF?=
 =?us-ascii?Q?K3oOxz2JCh77Ib75l3as30XjMeNj3uOlMUMIoIX0zfbEmf4jcO2gXKYGVwPO?=
 =?us-ascii?Q?9OjR3B8uw7UiDzAUT5DTzH9Cj4UjSVaWllF9mmPqwx1q0IxeZxuYHQjw9J9h?=
 =?us-ascii?Q?wOXnM6g1oeBY3nYSOHVj+y5528TuBvBY0k8HFjTVk5rQm6yNTWhdzEbCOCj6?=
 =?us-ascii?Q?YcVOoSgGJB+Nv/8Yhb1gtX/lvRPrnMxT6JDE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8lqsHaurFyvQMpiF+owCiWRUPea4YwF3RsxUn9oq5N5MhCu8XTy26fG3p+Si?=
 =?us-ascii?Q?dyttpgLz/NajchB1YSAS0lQzmbcF6/gLQX9HUU5d7DUwpa2+XByDf831BlMA?=
 =?us-ascii?Q?ZfiKVC+l4sWNPTc1dd2mROpRY6FA5hdXxzcmMqOwhj3BJB3OjW0BPF0jVzkX?=
 =?us-ascii?Q?gOv076jyY7nwh2qOZ1sbjyE8fhmQ/QUtNfy+AJ4VHrxZx6QIjiebkBy7mM33?=
 =?us-ascii?Q?uXEHvq3K/4mleLV92k40sCD4o5GTC1JCnzh3EYaWlZIOOgn1xxPdOmg4yruv?=
 =?us-ascii?Q?tElTncFbgsXOFX3uVDsX4sYDWa/53SC39hhx5DBoxvdUkCZuXzsKBgOQhWGJ?=
 =?us-ascii?Q?vnt/AMofBsWKCx/Fb9rYxnpoi8mIrN6UJVKWR+x1LgoXddo4NuaFYLkdchno?=
 =?us-ascii?Q?CE6m4B9SRLsYzNKocUKy+cdMK4kUekMXScDuoaLjeCb4IWaTOxweILxvvc/j?=
 =?us-ascii?Q?QEyFL1mhHv5k7ozuLWBWyP2m0BnPdOGqlmBrp44up6iYtJSdvp49IqlTeHjA?=
 =?us-ascii?Q?k3gXv9zJwCIlthNLM9R5CSdjf2oJ7/QxV827aqNOAlYpnfGCIUUGS4uNhtR+?=
 =?us-ascii?Q?X4LN6SIbsJl//DvEsZldNCLuBHvSuDjfkB6vQEfq96NTYGI2VxNkK8P8WBYH?=
 =?us-ascii?Q?3Zl1P6dcD8LgpkEgtFre2XMsvZLIhBAZ5aFjUFg+SAKPOOhKprdgzxyG+Ac0?=
 =?us-ascii?Q?Gt1YC8rmr99fcSJRFZv+3gzIxy03sgAgdxSFqI6WkXyad/l2rkS1c87utRiK?=
 =?us-ascii?Q?W9kR8ZcO2W/E7Iw+3dsqS+M3ANRukcOCmBl74UZAOJqiKTD08pTFO772H9EW?=
 =?us-ascii?Q?gROBtxmkZfUrMugN98BM5T3bWW61+GOC88NKiHTA1GsobLWbHpUTIXf84Vhb?=
 =?us-ascii?Q?H58GgflDC72HbxvCyOvfoyDG/xXgDrTQS74dN9rv3KFluFli0NXq6OzW7Yoz?=
 =?us-ascii?Q?u+Kc8A2kI0VGFTzCRICKvG4zHmikXQcR+HM1bkuHk/cb745h3/cP0Myollex?=
 =?us-ascii?Q?qgzaW7sSjOCv+af13yrSDSlqM1oz0Os49SXRoSDio6ndLuS1GJHQ8s/6lCet?=
 =?us-ascii?Q?xDxdVirS6JTOW3SMhjmFaeVyn9NpvIDjcEDZLCeAcbetQPIgieZGdkcCnw9z?=
 =?us-ascii?Q?3tB7YAUACl8FEXsaR4IYBU7tAEoKv7dq64+3pAscPPGqgRmNASe34yc53ATj?=
 =?us-ascii?Q?mqNrpBxAMKyrRXNSR5/dTm3W1aL4Q6EG8svvz1fRUZmiohGpvsoDn65MjUPg?=
 =?us-ascii?Q?neRKkGxvnmAOsPjcP0OMquTiYgdyG/ZdhLwrM8+bPKOMlwerfnJM3lZlUoc+?=
 =?us-ascii?Q?8rCapA7+MtYuf1MUEvdcdyCMfsBiWbC8YpSgENBq8ku7VX2x15mLetOvHeT2?=
 =?us-ascii?Q?bbXGDtKzU2Z2r69ePaMtyQ+mspeSn86RoGQ7gH1IdVWQjTDeJbdxbhKYcu+b?=
 =?us-ascii?Q?rEc+jxpuKUdzBDQaZpvQomIwDqV0tghOkqPMWHIXCEeG/GYGibU4VipcOkxz?=
 =?us-ascii?Q?XXEKxCoyfPoVsywMy3iVGvfmNn3zwDH1nepZJb87N3o85iuI8VHL++JGB5Bm?=
 =?us-ascii?Q?6INwUwayJzQglUi+lc7zSQ/CvgU/42J6okHZLvLu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9087ac-5b07-4ad8-ded8-08de26c41863
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:01:19.9460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dt6JRsLPREB7o4+ftR8CJfGij6bK3dzpmU6gYcdbHaAjcVm+H4zZVn1tzho88uHVHlOBVUO9aOY0Sv1qxXuB9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_090125_120939_D670EC88 
X-CRM114-Status: GOOD (  17.94  )
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

On Tue, Nov 18, 2025 at 05:02:37PM +0100, Vincent Guittot wrote:
> Add initial support of the PCIe controller for S32G Soc family. Only
> host mode is supported.
>
> Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  drivers/pci/controller/dwc/Kconfig            |  10 +
>  drivers/pci/controller/dwc/Makefile           |   1 +
>  .../pci/controller/dwc/pcie-nxp-s32g-regs.h   |  21 +
>  drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 391 ++++++++++++++++++
>  4 files changed, 423 insertions(+)
>  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
>  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c
>
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 349d4657393c..e276956c3fca 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -256,6 +256,16 @@ config PCIE_TEGRA194_EP
>  	  in order to enable device-specific features PCIE_TEGRA194_EP must be
>  	  selected. This uses the DesignWare core.
>
...
> +
> +static int s32g_pcie_init(struct device *dev, struct s32g_pcie *s32g_pp)
> +{
> +	int ret;
> +
> +	s32g_pcie_disable_ltssm(s32g_pp);
> +
> +	ret = s32g_init_pcie_phy(s32g_pp);
> +	if (ret)
> +		return ret;

Small nit:

return s32g_init_pcie_phy(s32g_pp);

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> +
> +	return 0;
> +}
> +
> +static void s32g_pcie_deinit(struct s32g_pcie *s32g_pp)
> +{
> +	s32g_pcie_disable_ltssm(s32g_pp);
> +
> +	s32g_deinit_pcie_phy(s32g_pp);
> +}
> +
...
> +
> +module_platform_driver(s32g_pcie_driver);
> +
> +MODULE_AUTHOR("Ionut Vicovan <Ionut.Vicovan@nxp.com>");
> +MODULE_DESCRIPTION("NXP S32G PCIe Host controller driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>

