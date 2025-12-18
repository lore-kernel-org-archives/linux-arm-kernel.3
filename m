Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6428D68BDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 05:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRWADJtCIPH8e8R0y8BiIR9UAWXtqPnRf4l6ZOK1pSo=; b=fAbNoM551jfZiGRf9hTaeCLh8b
	GH+9Pd5tJ7IGyy3KcdeG9yYFKxk5i53vZXMcCO8APj4gSabf3UBjr5QmyjQ6UUBZvcI9ID2mJMphz
	agdl2BjPPueP7bjZR9TUV3pWItR28dN4iaJ0+zZ382Q7eitrTXCATFR04E5vKZxqLDft3ho7e6Gwu
	4s6lFcGxmfx7QNsq3asR08TiK2IRl6clZPDrLclhfWNS8JvAOXJ0w2PVL7Ut5fPVCf+lQzB7G5Xji
	0OuUljVQYInyDyqLFHeYmwcCSSuMSeRtP0xviHZDhIPwXbk69BxkLYCZLl8LJpyCW5HH/pXCvz5+5
	VLVY78rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW6S6-00000007pna-2SJr;
	Thu, 18 Dec 2025 05:21:26 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW6S4-00000007pmx-3EZE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 05:21:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHgNK6jLUcy6X5MpBHQeYbPx0b7Yp1SPRhJLeX2rBWLMamfvJRyHIzOq3qa8bniLhxsfxGxWovWfxQOSW8Xc8qntjlz7LwHcq++tBgWUyVzJMC73I5AGlKagozlQOUTcjnJd/3CokVmZJWf8GgmnxiHuMuuXA+SWZuydXtKf11+GgpW5tT5/TjWbB5mkeu5644hgwV8qg1GhZueaR/s5M5Dh/VkPNCYBvpaxKOFTSYLJqGpT2TiRUJA2/oJmsrameR/nzuLFz8YWud+fOTdmZNwI83mLe9rsA6Um/Xdy8O3B5q/0LMprr+BmMdEvhEcJSv5zG8a5B3TbqxYN/5Dfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRWADJtCIPH8e8R0y8BiIR9UAWXtqPnRf4l6ZOK1pSo=;
 b=vupy5HnMaorYnQVYfUTj2TBK4rIjD/6eEE0b5g1ovgbvKRJxOhgN+W2RUsU/MRyKEPmVuJivECnjQzGJF7Yjj7s56kIoh7PXhr5cMj7VtYYYVV3O8ZZtucKHaWi63ID8+iuqcv2ceYtOEaEG0pDlPnSRnIkACcYsqNx6TDljhKcmTaTiBYwuhnmwLBcbioJr4f87Hbxu5ZShb3JC7JnoAvLw6FnR6NJpZYBqb4W769au951TswfUB4KQcO7ycoqd+hBLQUJD7gzInXGOCXe0z1o0a5IMIbIiuNyU1F40OV58g35o0158o0GC6C3pUtJKx+iFEYCPu+/REUvOowc/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRWADJtCIPH8e8R0y8BiIR9UAWXtqPnRf4l6ZOK1pSo=;
 b=kRuOuvaj8sHoLaA3kB0GF755dmP8llhSSS73qNgDyidSgStY9TrOHrT2gKU7sMMZGcpxRClFr+aQVx94pQ2ADG+glCD9Lb0qiPylmHWCQ6UJwwDPdbdOAVCXgZJTZrE2SZumpT8lCqi4TLETa1LVbYJzxJbkDCFuWaQ0VrHgsy2+07rr9zSDY9Wk7Z/6kn1fnWQuEdcG+sG7ES5OfM4k69sdu5E2TwzsFwJE1RE4VlSE2r/s8w1cQtGFJjUj/1YFfVexE13Cpu9Af/JHvxK+Kwo3T0tChL7xiY2CfDfl2k503SlTO+fJlChNlLecvpj6mtEMp5aKiHBIZfLiKXnUQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAXPR04MB8320.eurprd04.prod.outlook.com (2603:10a6:102:1cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 05:21:19 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 05:21:19 +0000
Date: Thu, 18 Dec 2025 13:22:30 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aUOPloYtbZHCV6iw@shlinux89>
References: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com>
 <20251216-imx95-rproc-2025-12-15-v4-4-bf1064ea8daf@nxp.com>
 <aUM6aGbSH9ICOL5f@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUM6aGbSH9ICOL5f@p14s>
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAXPR04MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f2d426f-7f62-4600-507a-08de3df5465c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BwGWqc64wJ/cNfhhlOaj6ILZvKk8BTZb16IEvrdDZuiiYGQMD1KvWHhb8MRz?=
 =?us-ascii?Q?6E7Qi2Y54WQxGAfbmz0UT6TOQ95AlvrawrbR8m5udsXIi6URgH1Ap1U0JaEB?=
 =?us-ascii?Q?zqomZ/jfCQJxnKEAMHgbIc2MtpQbApBRwy3TgjrOC/GF1ssS7zclSpEqqd+A?=
 =?us-ascii?Q?wfuq9FaHB+GruBPgQJHaSghDxbGDlmFKOcymVGSOBIClwXSyy4zmOgwp7Pf5?=
 =?us-ascii?Q?5QffhRQudVvtskylsvrM+V7ZqhmTO8BBakrEHFlnuTtB7a6H/26yzarqX86I?=
 =?us-ascii?Q?y2DrH0IEDR1lLypx5K2VJbdrprXaWkBVONx47X4/idleuyR3Cgo/DeI/2HXX?=
 =?us-ascii?Q?w03JED8N5HjhG/5i1MAG3sIcMDuSHHDVclkQ9sP9x9J4qAmJGt35thH1kX7x?=
 =?us-ascii?Q?ZX8I3HiF7NtiPrn305Id98IKmFh14NaxnTThfjhrK9ljkC16yJT1lQGOsIgI?=
 =?us-ascii?Q?3ZHEnzZYBm/mOHApv/ZI0yQfSxdbfe48xpMc+KXLhshH5aXJJMzhp9QqZsgS?=
 =?us-ascii?Q?7IdGMRbk3JDP1S+/EOuSJjwuEps/BJzJUljX4VFCdivVvn1vHtdYl3khr2EC?=
 =?us-ascii?Q?QU+d02H6V+D5DVeqH1qYFpgx52Oo0vuxZGMlX5/O2MvcPZ+ItY11LEnkwbjL?=
 =?us-ascii?Q?hZ8vcLVHE49Sf+Y9w3vOZLhu9YKvazVT/xmqZCIhtjQE2OPtx6Nl/W7+LqSu?=
 =?us-ascii?Q?KI7EfkFDWK0Xa4UNj61PP2/TsqwAUWI8zeaf9OG8HNQ0OnoZXhlr8nfOmd1p?=
 =?us-ascii?Q?b6nOoLuPyL6fAOshB+lNkDbxLl9UxppF9OvAl/6v+1YaFfCM8g09ymJwcsga?=
 =?us-ascii?Q?jQd8qqcSn0eEJ8IkyiDS7MsCOPKiqMVqr0lttQ4jD44NUHrxphfnFPz98NXB?=
 =?us-ascii?Q?LIKtDHeTcSerojDlNPnpMLh+JyJS4L2U24U+pM1k3266diRqv9Am5jxtnVOU?=
 =?us-ascii?Q?XcTAvpYMRkHh5uTTKPjHvN/ka2tjif6h6VBFqGiyAD2z8gdTRI6hJgxLrvGu?=
 =?us-ascii?Q?dmAowUaGS7I5cZnVP9niI0EMi2v/udPmcrypz4aEK6Bfc1uta81RfOs5lW9Q?=
 =?us-ascii?Q?6wfZ4JguCrxurPlA0u7vGgmMr8kfS1ZHo1u0MHUDpRhAKZtD4cXqRxdzSga7?=
 =?us-ascii?Q?p9tXc9UAUciSQo1FAMMnTcWWAq7zH2Fa9ZvxV2avvdwaW6Fv+oa9tPOR3ZtP?=
 =?us-ascii?Q?p+BdZ6LuSSrJLydY7nFviwsJy0XYwgEKrRer1keBSrgA0XMN8n7MO1G5bMzI?=
 =?us-ascii?Q?tK6GIMfmJVE/V9eMndxfOOa99+6KNZdQ2qNIIi+zowmWqDE3K3MOwNDDvJx1?=
 =?us-ascii?Q?I5Xn0ZQG+I0o8taD0MrYPMySaqdp9UpkG/lbJ85RvM9FQg/QCbV0Vx9qjcpq?=
 =?us-ascii?Q?lzd/nyQ4/Pk9nQ/b9xTqoI5uH2DqihkQ//TdJQymthw9xJTpUgk9vUFHCpJK?=
 =?us-ascii?Q?TiCh33i6APrgxW8WWFPtW+Gi5YwCYA2ZhjszapB4pwUfWAp6V0wsGoI6Nwn7?=
 =?us-ascii?Q?MTLL52LiPEaPiFUr8zdJIVzYhBCZRQX20YSw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?odHBEefipvPE24H/zC5m3UPSkFx27Yssy/CduNVAYB6TAQm0Fq8qAfCbFjEv?=
 =?us-ascii?Q?lC/zymGIHihqcuRlMbM/+M9jnm3I6I7fCazjxQQB4KYur95qQyBzY9hbPFZS?=
 =?us-ascii?Q?MeG8naJKuwa2ed64uMk73eRdw3/LQNONHu01ZgzPfZhNdStcO9zJeEKLJmy9?=
 =?us-ascii?Q?KE1n4ucV8Mx4LIpteYQOCkEp9iFhQjfQGJIy+lsfZP7PsD8Cka8LrRPTZ3MJ?=
 =?us-ascii?Q?ViVuDl803scJY3wf0tQ0CioTdNydRSIuvnTRyI8IMvQCI4PViLy72o/6dxWk?=
 =?us-ascii?Q?O6V4oa6POPfvFjzlYjU24cnRnJF8gtliIH8Ty+26mvlL9yA1X4NX7d8AsqgL?=
 =?us-ascii?Q?ay3b8KZPaGbUcd26PK9rIp1BUtCsl6zpDM3JnOSM4V/Cu+3AyddfJCkkweDh?=
 =?us-ascii?Q?hT2BrlGlZ1l01dn5OMlI9jlfxYWQiqCxFpNUNEsZiVVXE094UyhOfxjZJ1Oi?=
 =?us-ascii?Q?Vq6gw9cn0oA5tH/LhYPK4/HbDSgqg9kfaxnepk1GuWN/AmlEf50u2bWs5IFp?=
 =?us-ascii?Q?pE/NZnD2KHFgFnXI05/mgOMqIuBh7Z0dLb3NJ+t+1ovZ7fk1uLwLQXGXHEJ2?=
 =?us-ascii?Q?ykCA0DQv8IlPXZ4eKKad+inEY9D9j9br/WbEVg+ucsZwfD1BqSXL7qBVbzOn?=
 =?us-ascii?Q?WP8cP1D8YmD0Yo/lWV/vCtFFe8wLGu4aUa8P0vpYfSQ7VFCuMqFCd4SKnBtp?=
 =?us-ascii?Q?1Ga3Ghfrhsfj+Wu5QKBn9ikGu703uHagdd/0aje3jZDx5S48l0asqEu8MW+L?=
 =?us-ascii?Q?iRNrI+JxU4VkVz5L+3w+7HSqzHZuAsM0CfHFk5hreZcuRrN7KrqleZgSDCJK?=
 =?us-ascii?Q?5ZSlODZS3V1AMSZAH5apGmgURca3USUDYcdDUqCrJu4NPULU3gH7Y+0+wmDi?=
 =?us-ascii?Q?Z4DPHiSRxfGETPyuBWI4k/33yTr8xQSgDPx7iI54j+tZHjDqmpwXbJX2rOdB?=
 =?us-ascii?Q?q2gt6daBCFc3hoD/CY7waNk9mQBpUF/PfRkMJpMMri7eJx3eGvvNfrByAWiR?=
 =?us-ascii?Q?WYqB7hwtUk1K9zIBdmNI+Sxtt9BiBMMsIVwNPFWeekrRYoLSELMe3bPBbsxW?=
 =?us-ascii?Q?pOBXFpZfwwZLM+0wXJ7gvnk3mCiz3TeM5eGTWd3VTyna/sLjUoy9gRSgCEXB?=
 =?us-ascii?Q?w0ec4WJndUX8DelNVwf8WnCtxyurB5Uy/A1Jo2//5awQY78DnRONwxqDao1z?=
 =?us-ascii?Q?vYZSdIgfQKK5BieIQoD1AIlX9T1HhnMYo0brjl8aLgAkABo+Qg96xw99EFy9?=
 =?us-ascii?Q?mbdwlyqjERV5pk+H+GXmjv2Twg6r4eEjwWpBLd63MfD1ay/af+Y9g8vv1PBR?=
 =?us-ascii?Q?c96bfuf/RSi/g9JF1DGB4qqye9ybe0ja+pNGVJkhISvyyrLpDJH9GuZJ+JmJ?=
 =?us-ascii?Q?3VbCA0YTcChyrtad0M3njBx7LYS9kJ/fPgugT1GXsDLJ0c++KlPYzvjpEGLT?=
 =?us-ascii?Q?OfKxNq/xVcrrf6G9Hl2BfzNXaIbP0VqIsgC9K+yCYSTGbkRthpjOcn8DLN/P?=
 =?us-ascii?Q?30ZZeGsAyE8noq6buTSUaO7rOY6Rlms3MiJrY0kcLaSp0YzbZuOrfDCd+lDu?=
 =?us-ascii?Q?Z6u6kRxjZfJa+ExvvmMahXnClomR7gRCP1Ar8W3L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2d426f-7f62-4600-507a-08de3df5465c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 05:21:19.3455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yMyyeKVe/wlxAfvJ6twSLkWfnpplWX3YNQlZdH82ZFkLiLHCBE9XVVX/oM5l4jW9lJZdWo7yiYjttzjM1RQLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8320
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_212124_815916_6FA7B2AC 
X-CRM114-Status: GOOD (  20.29  )
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

Hi Mathieu,
On Wed, Dec 17, 2025 at 04:19:04PM -0700, Mathieu Poirier wrote:
>On Tue, Dec 16, 2025 at 09:51:02AM +0800, Peng Fan (OSS) wrote:
>
>Why are these not at the bottom of the file with the rest of the
>imx_rproc_plat_ops?  That way you wouldn't have to declare
>imx_rproc_sm_detect_mode() at the top of the file...
>
>> +
>> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
>> +	if (ret) {
>> +		priv->flags &= ~IMX_RPROC_FLAGS_SM_LMM_AVAIL;
>> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
>> +		return ret;
>> +	}
>
>If you move this call to scmi_imx_lmm_operation() (and the error check) before
>setting priv->flags, you won't have to reset it in the error path.
>
>Let's see how the next revision goes...

Thanks for the review.

V5 has been sent out just now with both comments addressed:
- Moved the SM LMM functions to the bottom of the file with the
  rest of imx_rproc_plat_ops
- Moved the scmi_imx_lmm_operation() call before setting priv->flags
  to simplify error handling

Thanks,
Peng

>
>Thanks,
>Mathieu
>
>> +
>> +	return 0;
>> +}
>> +
>> +static int imx_rproc_sm_detect_mode(struct rproc *rproc)
>> +{
>> +	struct imx_rproc *priv = rproc->priv;
>> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>> +	struct device *dev = priv->dev;
>> +	struct scmi_imx_lmm_info info;
>> +	bool started = false;
>> +	int ret;
>> +
>> +	ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcfg->cpuid, ret);
>> +		return ret;
>> +	}
>> +
>> +	if (started)
>> +		priv->rproc->state = RPROC_DETACHED;
>> +
>> +	/* Get current Linux Logical Machine ID */
>> +	ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * Check whether rproc is in the same LM as host core(running Linux)
>> +	 * If yes, use CPU protocol API to manage rproc.
>> +	 * If no, use Logical Machine API to manage rproc.
>> +	 */
>> +	if (dcfg->lmid == info.lmid) {
>> +		priv->ops = &imx_rproc_ops_sm_cpu;
>> +		dev_info(dev, "Using CPU Protocol OPS\n");
>> +		return 0;
>> +	}
>> +
>> +	priv->ops = &imx_rproc_ops_sm_lmm;
>> +	dev_info(dev, "Using LMM Protocol OPS\n");
>> +
>> +	return imx_rproc_sm_lmm_check(rproc, started);
>> +}
>> +
>>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
>>  {
>>  	/*
>> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
>> index 37417568a0ade2ae4d6a4e3d0f139ea52b185254..d37e6f90548cec727b4aeb874680b42af85bdbb4 100644
>> --- a/drivers/remoteproc/imx_rproc.h
>> +++ b/drivers/remoteproc/imx_rproc.h
>> @@ -38,6 +38,9 @@ struct imx_rproc_dcfg {
>>  	size_t				att_size;
>>  	u32				flags;
>>  	const struct imx_rproc_plat_ops	*ops;
>> +	/* For System Manager(SM) based SoCs */
>> +	u32				cpuid; /* ID of the remote core */
>> +	u32				lmid;  /* ID of the Logcial Machine */
>>  };
>>  
>>  #endif /* _IMX_RPROC_H */
>> 
>> -- 
>> 2.37.1
>> 

