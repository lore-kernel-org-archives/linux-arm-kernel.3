Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A02EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 02:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzHrCeXb9Nr/xHYJkgmoch4P02ik+2zMgLdeSi5Jgnc=; b=Dmvd7ymA9Y+HHlGYRDXm4A64as
	aTY174aaq+Xl3w7+aP7GiGqmlFvaNs3FE59LRCJfHb4EFDDsCxhadTUOPUsW0EPv1KnSy5un3lc6B
	YzXRmj5EZJHvqQTs5lWV2sTWMmfOYbbJZm1muhChBLGSxdUUBceFVHRbbyKpvkjMjxXBo0PnE/sOV
	5fqeVNI3uUr7fJgCZ7ehU61zOevf5koLttnpYLAu+ayp4NukL2t26QBTqhbdg2VcQv5unCUitzPyU
	pQWBHTovlQl6e18o5zaQ83yOdT7n/xfTRW0TtMvBI7S4HMfSzebqA1tt78TuhfolZm2DqP/vRcQAn
	ujTaK8TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZRr-0000000AbgU-27GZ;
	Wed, 19 Feb 2025 02:04:27 +0000
Received: from mail-am0eur02on20628.outbound.protection.outlook.com ([2a01:111:f403:2606::628] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZPc-0000000AbOz-07Pw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 02:02:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eidOVZ0mER4/ZEyJWQL7hivou0Qm+MZJd60E+gao6GpsPcMvinqGxaK/qjSLaSQ1n4SJMGdHWtmN6fKx9q9RMqsGmdr88JCO7h+G6f+gvec3VJiNo9dYCjlwFaEd5zTFqTZsJqlYLirM+4zXrvf1ZmidGYR13H+wA9Vn/ozboNF+CTcny/zd9pwIeNMo8cPiZS8V6BXPrDen7n++kHUPPNIgVgHbHwA4UQ4hyMmVhWkKwsT9NxY8JFjk9G3an5SlrBwJc7RVmiXueYb8GKc+fkbbKQugqYz5LOILSLEGqXFII1lXEuid2e+sG8x4DIwg+LsUnvww/Z/jcIZ9n46w8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzHrCeXb9Nr/xHYJkgmoch4P02ik+2zMgLdeSi5Jgnc=;
 b=kirIuwek5cVmyyFDSgbNSlPhqWaa0Uwo5djTv9qtzcQ2idyqvNCiCnFkIPLtUTDTm5tKAzdz/rrewb1zZOzpd5pE+Fy7LA0+pLQZ4G2z64BavgzEtxb/vWEg4rZHS6oKM8SA8tGvAF69KP0JljdGQe5ca7bIxVjU6X0vQ7dCswn3DciPo6LywhPwFbeiyagWqduDjpP7vrOFRmil6eNghIGQnR5fgLRtBxBwPdjxILgEd3sLCgXwDNWga/eWmWeYu54C3IUNpvQcGJAlP64jc11YOmFsZxZljJnz2WjfPuZGPuLRonGgc779dbJOhWiICmrGn5XUoNR/QsHf2TY71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzHrCeXb9Nr/xHYJkgmoch4P02ik+2zMgLdeSi5Jgnc=;
 b=tyydMCIfmGHJG5Fsi4s9CGGb4kAVHgR9wYe8fbEAZ8feRAA3kfwjizId/pXqLglEzKj7IYmtQh6gdEXh5AIsWcDUD0IrmzRWueBwCFXorkdz4jsLHv2zlFlXU9IrF9mBBPB4DxuQjuPN2CPTyA2rUfCjgNEd0S7+ZL1UdjlUnK4RPIvLNpx8PW9OMogMN/+SyyChdlkW38GMDiIWNILyt1/tOoUCffPm0uEwlC7OnCxKGQadc/Az8vAEQbnnUNkyRqIeY6sC4HGRUQrpUjdsfgo9EJhCFhlLs/TS2t6vq48xl1qZA8KzesPsyBcukJe9TEOy+gXhODpyWVsxFt7cTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 02:01:58 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 02:01:58 +0000
Date: Wed, 19 Feb 2025 11:09:02 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: p.zabel@pengutronix.de, shawnguo@kernel.org, mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com,
	krzk@kernel.org
Subject: Re: [PATCH 1/5] reset: imx8mp-audiomix: Add prefix for internal macro
Message-ID: <20250219030901.GE6537@nxa18884-linux>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
 <20250218085712.66690-2-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218085712.66690-2-daniel.baluta@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe4203e-1640-45cc-6e05-08dd5089647d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YASz42o0eYgdZ/eweIDx91/2XQN/9xXDSGQAIUf2aDjgwfsFvaGdeVFEPqOo?=
 =?us-ascii?Q?c8zcif5qLmo7rdWAnAjI2X6nNPKZ3y5wJU4d/ekFEpAajzNCFrFe+1NE3wJz?=
 =?us-ascii?Q?PAXRFyKx8DC+r6WvIWoG9UqyZdQwuu2GTBT9dOqsBiP6cOnTNIfMR9foXuOd?=
 =?us-ascii?Q?iPu3v1WIgspIhM3M7ieMHED7XUqkKLdEdBckLgdcp14PetmZ18SKQwyzSVc4?=
 =?us-ascii?Q?amXR36REgS8jA5ellKMrraoIHzcRsCAZhU7yn5i3OjNe/l+3Kzy2pcA13Cgm?=
 =?us-ascii?Q?tLGqgmzTnXdwqiMe/krGRP6cXVUNBEYy9tkGDs2meDQIWoyIMIVOJg0DBBWL?=
 =?us-ascii?Q?r0bCc3fjvzYEpOa/Ny9KvBGsA8WgzpikN/Pd8IPk1Tp+gWdxugw6Ys137it6?=
 =?us-ascii?Q?8PwAA5sMvuULfROstCLO8k+6tgW/dmYQZ8ji/J52tqSIRWbKhGaDOEKcQ6R9?=
 =?us-ascii?Q?sQMbAxcvjVkeZB8QrXWcuaLivlE0HItC0chZjIsxFJfvhmw6fh9OPFVGtFHl?=
 =?us-ascii?Q?SRijFJ+Jak3v0zKlf0/zll6AjlqZfvAoz4GhaAeNbmo9as0frR80V8eyoqpO?=
 =?us-ascii?Q?vQdgRc0a6rg6OCzBmamTLYSqVBPTDDBjlmKgTd8VuSOyv8HcSAei/ZOdQtp1?=
 =?us-ascii?Q?4qO3qPUpDXWauoxuSkQ40DtUisvhlxrCIJNpyGbhOzIkHmxBkuTXdOov1et5?=
 =?us-ascii?Q?Gdkee7KXWT4YpcccXuaDx/PyxuZkGIi0KcszCHNj6YFR/DIW3hZPxHkvqzph?=
 =?us-ascii?Q?AyJe0Lu5mJOORY/z/qnM/Ch84FA02gFAgED/ecBuM9LTekjOcP+ntEPA5SYt?=
 =?us-ascii?Q?SJDJisg5dvm9/BrmEZNhWRInjB6gSaSZfMhHlycYmalKMlA2I/bM2cTKs3ZS?=
 =?us-ascii?Q?RGCYop9YC4wWcUEymKrt2NKwvalvKqaoBGVhIJyTcn1PUmxVaiWf724QU+ZR?=
 =?us-ascii?Q?pb9FE7H1iCmsNo690Kk4O52o/08pDfjMVkU9iRUoLVkUHbCyo4AWUeGT9WuW?=
 =?us-ascii?Q?mbLOVpi8PflRsM2bd3yXOOmVUTvc+Okxi7tYelERwf9IOHv6IrBh5+6vk/OG?=
 =?us-ascii?Q?PChHJ9m50wTNBo3rAcaakru/51g94S3XcfY7krdFx+NUH+N8U55fJg1WIiHq?=
 =?us-ascii?Q?CnfZMLW6Stx87Bw4YGFy1JtjwpOZ8Y3HD7ryH9flGYJp1fJtrwigMpE1NUgy?=
 =?us-ascii?Q?JWiaXawph7qXX3SKf6BZg48mt8nRJ+vhfR1SlaIuVx/tKcrCJFnD4VXjDUKa?=
 =?us-ascii?Q?tcz3d5woakJbfaLN4DnxsTUXQpwz9a/fKPU5N/cgDbln4AWLt4BhShrED2Ha?=
 =?us-ascii?Q?7IDWfhA/bVW1PoEbjmy3iPbjdcDp+D8ULSlYi6eir/3FKVU3bJ9YH/XOzL/L?=
 =?us-ascii?Q?Z5bkRayANrV8HA0EWLfZ4cC4kDVr89oxZiQkdcNJG0GDUk5rW5pHj372SEmI?=
 =?us-ascii?Q?JxI7Nu1ocfbWcWpBlRYRWfuYJT0f+9iv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+QbqGJ7qQm6zL2YJ6215PA7Poj/xJDxXlWzihasN5VZ8pw6+hwHAcldagrtD?=
 =?us-ascii?Q?Plxdp5uPB+tVldrjDmAZydHLayX0BJSQvib9YukwF9ASkuVjEWH5J8nj7GxF?=
 =?us-ascii?Q?r3o8B3AT6T+IV/BD4eQix1BVmHW8fm6cUtaTd/rZqq7sh7FB58JQagN+nU3y?=
 =?us-ascii?Q?DrlOpYlLa0HTPfZLAnDxf8ea2UcRH+Y37/NT2EkWKFCoGwfmqtE1tbnCl/1O?=
 =?us-ascii?Q?USeAmiGIqXDluaIZbfqnBLEIl4GMwaCuLaS86FDRpGkrNZTagN4PeWeufR8N?=
 =?us-ascii?Q?eI9w3UUrXZxXx9myPCFnDwEyeATLv+GfhvrJZmP/7sFLiuJN8TAD3qEYiLcQ?=
 =?us-ascii?Q?FJTzJPzNwe30gUW1V3kXdc7eYqiRhA/uWgtr8RDt2pbyEN0IH2+lA3ECJ6i3?=
 =?us-ascii?Q?oRxFcsBpC6gOdF3LAGMD+pOogOAWT2FzmSO1yy8p7c3U0yEX4nxz3q8CxpVT?=
 =?us-ascii?Q?pu5HhrZgWUwexh1KBKdv9gP7aLOqGMBdCUWGjh4C3cFco8r2LmTITmsZNBtR?=
 =?us-ascii?Q?gIg3Oy/iQ+WLFWaNJXYX8t8KqG91PMSXRbEuiCC+d0wFT/3vwblv/zfHDoYN?=
 =?us-ascii?Q?ZRohqOAflSb4VK6T+RT11z2HqmT+OBqTSmJMU+LRpC/nzYQW15RiFjw49UB1?=
 =?us-ascii?Q?sXrBxdKVydEXOAHyGxzw7zViC0HnvwbNLfX3kW3Q5A83NySxHTXT1gcPmhA3?=
 =?us-ascii?Q?bQs13KjrVaeAf6D0mDoZ3AlGbwUm7YkLbEdLHXt9WcKjQy+3Scox48tLPZ8n?=
 =?us-ascii?Q?waJTnc0KCuxrKNyfwPPgsJvcO5PZZ6C85+8I24+mJBta/XU2iIJygUsee6ap?=
 =?us-ascii?Q?+Vu0Ym5na4QlvkJ71/BCShQs/g2jvkHSfW+z0D8jVFUfOKstiHauCqmMA8JK?=
 =?us-ascii?Q?WR6Ztj0vbXgv806gyHi3DAD3HHgCjMKdZx3G0qF7I1wf1J8RbDYNmr/U9QjS?=
 =?us-ascii?Q?IRhXTPNmuzR3ajeR1okMrCUitpVYS5f4Ey/5lYWdruJ226MMirYLG5gYKk0K?=
 =?us-ascii?Q?E6VCS2LO4u189Tc+PRzQFIWN3a0BjxGQisdTVcoFFtt6UK6zkkW/3KEWHJZQ?=
 =?us-ascii?Q?jwFJ11NrAgiEZcm0J4ZVCW6Z4EZOxpd1ESL3nQkhldcZQdosdft4dPMa5+9C?=
 =?us-ascii?Q?S57HdoGP4ASY23YuLoZEfpsV8rj5YwfsWCNROtcXjKcY77MR0y6djpcIcAWN?=
 =?us-ascii?Q?QVpXIMU8qYIZKm4u3PuMS0FqF4iuudz7YKTFJEFlhT5RMOlqpKOfeVFB0u+S?=
 =?us-ascii?Q?5OzmXVtLmNCrQrnywtcut3d7diTXIMcu+d+5ii9Px0ksc0HxKTdC8IabYFR2?=
 =?us-ascii?Q?3v1lQmzgKVAPuCLhdr/2sICiQmR+nqO8pYNLcGerx1+Ua/xuuTRINeLXFukk?=
 =?us-ascii?Q?D3xsegR6WteSmdswDze0QytxSNYKkVHcTSN/0evlDNOkkBHbRTU/MZumo8pm?=
 =?us-ascii?Q?WNNa6MKiEwW1auQlVgFs8N93xXaxDeZryKYZX2jKrbfCf0W+CJpRA04tBO/E?=
 =?us-ascii?Q?8A1xbq58pHR4rhbMDd5UIoR2jjhkPA97BXGeT/Bqb69Ofv+3iulAyica6LOO?=
 =?us-ascii?Q?nE+gagOt/rfE8iaJTTAqJjfNtvcmrccGtjEC5GyB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe4203e-1640-45cc-6e05-08dd5089647d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 02:01:58.4861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9d69OowYsjQf/+7C23QtM5jq4gU5qW2RNFp29ltB/QczwJv8lUM94FrV/oOixzc6krBfciS0c8Um0dzmceo8xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_180208_066512_262A26C8 
X-CRM114-Status: UNSURE (   6.95  )
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

On Tue, Feb 18, 2025 at 10:57:08AM +0200, Daniel Baluta wrote:
>This adds IMX8MP_AUDIOMIX_ prefix to internal macros
>in order to show that specific macros are related to
>audiomix.
>
>Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

