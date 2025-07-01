Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1C5C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=az1BYiuRo8xj9DZzecL70DmB3QYKkUrDDiR449w1o7w=; b=ubkcqEd2u8fFhaHU2/pxOwPHQU
	IpyZf1tE8nQlrL1BId5XXDOZ/+yfsDaxVv7mSwSuXvpjHXVxutvRRrEwzfDqY7XKPhCPZmmSotnAG
	P1BB4Cb3uLL2btkqrkT+0/sYceZce3Heo1D5xV4ovB2/PYd5njQyT4i7puZ0gUO0UqSNUHjqPS0Yl
	j0acaQMmPJYAKpU7b4pZRuSIKp11JYTs+Y97vXi6NcyBhtLPYy1UwJtqPsQdSsTWN6AM8TTzqbea7
	ncT+CEWahjPfAInw79a1FKB/f7jw4Zm7w/p562QLE2vvLqDJV2cIa9U34LCaVeabJUcgDFPBcCrxo
	RcApQmOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdDv-00000005wAk-16qO;
	Tue, 01 Jul 2025 15:48:43 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbWk-00000005cOC-3dFM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:00:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzY30ea17Fy0B5E+o7nBkEETOUSPoeKpCBVzrAiQGC2Rh/7I8ED559wUplrR66i70MIKzNQU+U2EAQQ6O53E3d6V6DvRmARxDEtzd7edTPdnLT5FSnIbj9iDZdVmjEMA+Tp/dJni6944AMkRfd8xkxIE56R0Rckr7VHqSAv/58KO7V3pFs7ahh2NAp8AAwe9lGG7eTzVrk3En6ReGlwoGlH1R5b0B4St9RFYVvMAJK2izpkXjZN/yv/3iJTNgNn6jfZrA1eJqIjMTPRiSOeY2vpdeOvlOV1H1SHtKeCu0ZVC79jgM1d+MI3LhBJrYruzRSdFBrc/4YniF63kjqzH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=az1BYiuRo8xj9DZzecL70DmB3QYKkUrDDiR449w1o7w=;
 b=NcjLcUG5lhKxurqAxPgjr3kkeglYNcVbu0YZldKJUez4jaqDGnzUvcVHSXOzObgy4JCVy+obxaVZG8ObuX0ZTnJknS8XJZp4T4y6w3A3mi9KnNqivhn2Qy2Ih8FSUSbae5241f6CvOGD2yldwHRhUN6mNOuMsfjUl0NGZyzeW3a/tjUUgAzuuKOP1wwtQw+2hgdo7MAWDZo9o3Nju0dQNOzos2LFigCEMGuBATQ6bEw+cGwN8jVZqUaosrtdjnJnrNtGOAiVMum/rfbUingNmm5bBD/zJzCF2L5zZXUyutCurYEm2ZQG8Zs4FH/MBod3/PlsCLoA0z1fmnwoLKQ5Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=az1BYiuRo8xj9DZzecL70DmB3QYKkUrDDiR449w1o7w=;
 b=bmviE7osc8uZaiv1vXKW6yV2AFZM05/Hx0pk6MQmhtnXOaYfbZKoCI44xJMN39hLPRriPnEKL7M6iVQ3IZRWPuhC4adJdbsLIS/zRu/c52KfKo61j6ZG2YEKiI30hyV1U5bCi+eq6EfTdABkk5A6ZQ/G+LCKC5SUAJNMp/AAblAAIogV06zrKD8m2/UKQ/Js2Yy78khpf323hNIbOLsa4sGPvj2josqoa0M5hVUT8+dDIBkhaLWHRxL4h9rifrZ8Oue6a+I/mTz+GZlqZg3RWkG94P3XiUDM+FrIyYLQOAEYLeQPoe4s8SBQW5DnH6Bigg2MlDEniCqTozVYxmT7Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB9045.eurprd04.prod.outlook.com (2603:10a6:20b:440::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Tue, 1 Jul
 2025 13:59:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 13:59:57 +0000
Date: Tue, 1 Jul 2025 23:10:37 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] firmware: arm_scmi: imx: Add documentation for
 MISC_BOARD_INFO
Message-ID: <20250701151037.GE20538@nxa18884-linux>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-1-2b99481fe825@nxp.com>
 <aF6Si846xCR5_z-z@pluto>
 <20250630024558.GB13878@nxa18884-linux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630024558.GB13878@nxa18884-linux>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: 504e26ea-f545-45c9-9c59-08ddb8a79013
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fKoEv1ul1vLs+W2nJMMjbVuvvc0O2n/RGrAO5HHemFRvjrUbVHcQM4VGV/Mx?=
 =?us-ascii?Q?It4PEiKWjMUK0BqRoIcsWhhEyNvTpnQwf5Wln8b7VuMM3VFjMFSH0sqefW5d?=
 =?us-ascii?Q?H1Ro7KoJ+5OfxPomQ6BXw1Aub1eGglPI61MCQ/74HcFZHR/Ir0YB6WjTgFgo?=
 =?us-ascii?Q?J3MiyS8H3HNbq5o1WqV3A2gI73S9XX/G/Ck+ctUb92GRmSMVIGiHS7Esa8w4?=
 =?us-ascii?Q?F54rEEWRt6sxjRel36sk7sNbPQLoeRN2bQxoKteRouJBUs9u6QXq2TVR0zXm?=
 =?us-ascii?Q?hKTYftNp2E27I5rHq1OIBIw5gI0ZMSJCmQNS/57M2CupJwub908ilZNd+MTX?=
 =?us-ascii?Q?yfN7n1amOWTJmsUK9Oc/BfMuT9adJme+lU1eG2kcUuJsqnBJaC9eyrrD7Lsj?=
 =?us-ascii?Q?I2a0ZUnbzXJMR65H9rWGds5IUElshCmS623/lPwPCks7rbdp876UvqLNgZvt?=
 =?us-ascii?Q?RwXytwU505JYK7WbsaXOlltXm++A7bS9Pu9fvfb9wxStHksHf4E5wEqU9Ebt?=
 =?us-ascii?Q?pRKT9BoXj3U8k1lxhKl5f+1Umn/5w8negroNXN0ssxU7XPLiV1+BVMhph4UJ?=
 =?us-ascii?Q?atptY8lCsrUeBbqAwLhmij5o6RjNOJ9wDIk8KFRg4GeG0bdN3IY23MDQhU+k?=
 =?us-ascii?Q?Eyqotz4/Sw7bHZ0v2oCq21F5YPTLfSYO75v8cRAG7s2btXfyijRerBaxCW/u?=
 =?us-ascii?Q?mdpmsxJBnFby6PgPDYQKwMKhT0cWaP412ML1/30XCPRl27zf7MQpiGpmCArr?=
 =?us-ascii?Q?KhYDAJMTplPyDjCIbyNEfNQ5E0+Ht9uXxlItIbwx07Cw3RaOCYCftlCUq2V4?=
 =?us-ascii?Q?KN9CKEd55Rq2Zq66K4zMZARhEZ4Qs/Uwny3TOTvKxM5rsGFRad3o9E8vlMAG?=
 =?us-ascii?Q?MFGMytaDY1ynca73+uQc8IhDUEYOzPhvm/B6u84l7fl56cgrYNelDFTCzQm1?=
 =?us-ascii?Q?fsMwRrwjsJ+9DmKb6Azy1bKpnDG2jnlN44veEQhzyWrcVGtN4uPxvna8ZG/o?=
 =?us-ascii?Q?AKMHLCMwosyLd3W3YAwBfPNxCRCZ3xwa7ay3D3a45fOfPnrIwRsLaeTXfwXj?=
 =?us-ascii?Q?BzkbML/UudAc4GwFwD0U4OjUIcJcFJfgOJr6oz+NjNEp3eARbipIjCXETRY4?=
 =?us-ascii?Q?0eVSbJipygr4fC6S6RMt4TeipUQ6pv/WijuOOFsvmDL1ZaTYZyliaGiEq36f?=
 =?us-ascii?Q?rD1twVwlYMtvp3P8crXZx4DaR40Ji+kMtURH9lV+rgRbuv0jRSZhwblJRntc?=
 =?us-ascii?Q?riptCdr37uj9WayD3qtpeuafjlpdkZdoAAOQjUBd9wEo6ANN9qzJezp5wH9Z?=
 =?us-ascii?Q?pNOBxDUMRN3HaS8Quq8/esrS67wFoFWOuNxqVJ47cDk4IkP1R64osHUcHCZY?=
 =?us-ascii?Q?ivqNJyUK1TxAgSYjiTcHSQqB5JUovKozZ/X3+BHu8XK2ZSLPS57B2lC7XEwc?=
 =?us-ascii?Q?jl9VH1Iw4xaynKXU27Ud1Cg9Hg1scG/DHlGgYbDc+K8Gw2AxYHkxgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NGsJMYkkLTvuVlCSNthIlqaz+92P6HnOJLJ0AB7i/qGaVIj3DnoMu8njSyam?=
 =?us-ascii?Q?0mpSk/2FUppu5uiutvpAaYs39Sf5rMDRogMtEjoAfad3DrtFY6tdiT+03BdO?=
 =?us-ascii?Q?Xxl38kZnGfA/INczWkUGoyLT3N/oE6OPN1XsLpdXluxsK4VqTAbivQUqPNRr?=
 =?us-ascii?Q?LgeGMVziIja3AyOSUXCmqNPpLVHlsqKttg4Sy61D2K/Mm3CoYq6oAQqo79W9?=
 =?us-ascii?Q?3g7DnK5XlV/EViBYwXKT6yjDubTR1ymQ+Jq/ZMC+Xn4XBtjEToT63YYFilsz?=
 =?us-ascii?Q?Zx7jFsOWJ+cP6wGuMX5wXUyKBf1STSbZAG700/QBbT15jOKJ1hJsrjVYhzZJ?=
 =?us-ascii?Q?9DlSO2uctAZH3/jYLuK+ycwbkfg6I1jUs0baFw8gz8AMb6tZgcXUZtbUr8AV?=
 =?us-ascii?Q?KVRkRhUCQzbvVvgzPONi8+LnVJCswrn/MED/KU4zOloiUXHW8ceepUKtBVqL?=
 =?us-ascii?Q?H9O6CbefXSeLu6r41/Ycdo3jWBoNqbzQclTgAviUiZ/z320CisJjK2UItpps?=
 =?us-ascii?Q?l1gKO6jfoXdI7SPvQfNc7C27KrbEfL45AjHofO+NhxXcSJv8IuKcp5ZRyr5v?=
 =?us-ascii?Q?M/xmEoV2z2115O+sYLUx5PcIcpTKo/ixN5SJyDIbVG8I34cQ1B9MKAJKWFQU?=
 =?us-ascii?Q?H8s1LzH9wTK+o4PsmK7IwU/+P23Vlv0oMkCt0HIJ5bidCZx/l3TwzpsbaTzm?=
 =?us-ascii?Q?rtC9A46TOVLFSGXWwMGDGlg9+RUUG+zID7KKaoy5+bqMcFqEtGUNChc6Cbw+?=
 =?us-ascii?Q?YC5fRGJ7idmBt5aLe8b8iatpcyyGl8QtXfF8tZKqZfx5SoTqH8xMxLLoTOrt?=
 =?us-ascii?Q?+JtRCoQQS3NGf1j/MmAPfAOyKO4grMLws5f1ulqhG81rHjHS2E4HImX1jDy1?=
 =?us-ascii?Q?BCwy5V8vHm5T31qE4664/Z+ZCrm9MzSovyLYZ1bvLFHdDpMhrXPTvu37wcK4?=
 =?us-ascii?Q?WDyD/H/D7uxTgnxPDraanZRFtlItSmDoCQPyiDx+Jdlj1wN/FWfS7DjPIgI8?=
 =?us-ascii?Q?hjVdb+IntGgiYppN4PXXwLYW6gQp32F8Mh5cYQSTXxWl+XkyC94Gi1Pk0C1u?=
 =?us-ascii?Q?vGYdhpUaQV+BOX2tPGo6vOARWnPRlT1b9GhIGjjdNWce8AyY1z79XNFRpSoL?=
 =?us-ascii?Q?Z5U6l3JjIK8ws6U5FYpoQZA+xLBouscpHCvafdgJrbPY5SP72QwXOujMpDrT?=
 =?us-ascii?Q?PsmqZ0l1R2uaPxKGO4Sr9x71YsmbR9peZVBUmbuxI0GnATuMYMwObw3aTjmX?=
 =?us-ascii?Q?nT8YD+R0/VtaXeDKgmMH1zw0jFmdlH0Q0dxBKzEuEjlizVPbRf7KtiufOPPH?=
 =?us-ascii?Q?ubccHbhQ/cGRwJ7pDNEFUAMOePewusix3pTSorKabBtLLINr1X3Vk9M+oODF?=
 =?us-ascii?Q?oTlsCBPLuB5QdXMzzlo6d9DHFcuQSpHtTxIfHEirSEjjWExfhf8lcLy+2TeI?=
 =?us-ascii?Q?107CcywG1Re/lFwkXHJYh5wNJT0hK5XAAfc2GBuvjs69GncWABJXoO9mcpXx?=
 =?us-ascii?Q?U0YhktU45Xr5Ktvlb36kQhsx1HwToKA4AV5oVskOLTeTqtQB7XkmoVeB5m5A?=
 =?us-ascii?Q?QRxyzcg0WHdXmNygf792MGVwXtWSoDPbWWD5t99N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 504e26ea-f545-45c9-9c59-08ddb8a79013
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 13:59:57.4618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ro8oMxjK8oCcGs64owXRh13qxVW628b9JKaWSzM5tWMZrycH+6hLHT/3sR+VMXZJd2WuTGdfI0DkUjySBFheA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_070002_907313_B94EDC3C 
X-CRM114-Status: GOOD (  10.54  )
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

On Mon, Jun 30, 2025 at 10:45:58AM +0800, Peng Fan wrote:
>On Fri, Jun 27, 2025 at 01:46:03PM +0100, Cristian Marussi wrote:
>>On Fri, Jun 27, 2025 at 02:03:44PM +0800, Peng Fan wrote:
>>> System Manager Firmware supports getting board information, add
>>> documentation for this API
>>> 
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 20 ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>> 
>>> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>>> index 4e246a78a042a79eb81be35632079c7626bbbe57..ac82da0d1e5ce5fa65a5771286aaebb748c8a4e6 100644
>>> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>>> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>>> @@ -1670,6 +1670,26 @@ protocol_id: 0x84
>>>  |uint32 syslog[N]    |Log data array, N is defined in bits[11:0] of numLogflags|
>>>  +--------------------+---------------------------------------------------------+
>>>  
>>> +MISC_BOARD_INFO
>>> +~~~~~~~~~~~~~~~
>>> +
>>> +message_id: 0xE
>>> +protocol_id: 0x84
>>> +
>>> ++--------------------+---------------------------------------------------------+
>>> +|Return values                                                                 |
>>> ++--------------------+---------------------------------------------------------+
>>> +|Name                |Description                                              |
>>> ++--------------------+---------------------------------------------------------+
>>> +|int32 status        |SUCCESS: config name return                              |
>>> +|                    |NOT_SUPPORTED: name not available                        |
>>> ++--------------------+---------------------------------------------------------+
>>> +|uint32 attributes   |Board specific attributes                                |
>>
>>..what's in here ?
>
>It is 0 as of now, per my understanding, it could be to any value that
>board owner wanna. Anyway, I need check with our Firmware owners, then
>update you.

It is for future expansion without breaking backwards compatibility.

I could add the information
"
 Board specific attributes(reserved for future
 expansion without breaking backwards compatibility)
"

Thanks,
Peng

>
>>
>>> ++--------------------+---------------------------------------------------------+
>>> +|uint8 boardname[16] |Board name. Null terminated ASCII string of up           |
>>> +|                    |to 16 bytes in length                                    |
>>> ++--------------------+---------------------------------------------------------+
>>> +
>>>  NEGOTIATE_PROTOCOL_VERSION
>>>  ~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>
>>..other than this, LGTM.
>>  
>>Reviewed;by: Cristian Marussi <cristian.marussi@arm.com>
>
>Thanks,
>Peng
>
>>
>>Thanks,
>>Cristian

