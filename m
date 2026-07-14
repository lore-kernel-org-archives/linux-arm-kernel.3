Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F92C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 14:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8+afvQokIIjf8emmFCxxSdlaZKH0vgPv8QeExGbzh0=; b=b4Vgy7zVNyAalKWVynQM+mjeCN
	GA3PFbgfeau+XrFPGCuq89cdT6rY0Jvrk9INnF19BH6Cran53/rIn2FLB6SCS7ElpI5NOYtuo3Eod
	g4z1eAdEwtgDGhn2C/L8UbVKgzd3Ucck5l84Pzk/+oo395D3oaueRmpVVvjPRL8Pleou0k/f+06cO
	CzHQ2+Kb2gbuuw+pEW8D0jGaDUSNFi6umvlTyjbC7MkoD+QCJRYWe9c1RHKmfAXH17VQJXeQ7TYld
	yd9KFEzCsZCn8jc+uJj+C0LerWb+e4ufvSsx+N1IRwTJCGSq/x7MVa5pNeipTj1xamDGEIw14liFK
	97s6C17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdoF-0000000CKWb-3yCu;
	Tue, 14 Jul 2026 14:08:31 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdoE-0000000CKUZ-1XAy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 14:08:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXmLE9+ZtxiHCZD06n/7DTHjtSkdWTPiyJ6VxtZSfy0PFIjSCwRzqch0MchUnmnRNOG+JOcZBZgwr3j905dKRmCkmRoS7vIG0Te053l9FO1LAwjnaXPUPX090ZhGU9aIBz6QjqywuadUvY/oK6UEHMNZ+K0067bVfrWuLOjj10VYY0nJYWRscM7HUYqWI3XJt2QRkMec6N2KOWRhXM9wOzYGT2VG8nSBEpdmRbNXKXm9BCj/itkAhG7cElxNREmYMudXJZVYQjNea9hHkdpbjk4rkH/7RvvQW5gB1H7z4C89I6vXWDsqyniZL+pXzBrL/QzfsPhWmrYS1BNnplzVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8+afvQokIIjf8emmFCxxSdlaZKH0vgPv8QeExGbzh0=;
 b=l4TzgyoUUdgxMg6yhMfDnQ+ekzhMcuYKM5PwbUS43Trc9e9UZOUkcZPYsGms9uYblyE3USomHNIKpY9O3SG8Kalxy1PoKD0/iCwWy/adZ7x9H+odPoRs0uwukJoWCGqN7Ty6CPzvWIFJoqXPl/wdrHCU4S59vCNOS4aSni2JGHJtiUDcb2s5DzU6WLZaWExzOGkc9jkzs30WFAadDfN7BTL7aSucFV88rMJmOMjyaDVl5Psz59hgrdlBUTf4YF43uWuGZIXXQSxw1OveYqEE37YjcEK57zdTT7Th09R/dG0iUcxkcaOjBZbAoYL+UUe/UxcTClP6zKHolLigXcEeIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8+afvQokIIjf8emmFCxxSdlaZKH0vgPv8QeExGbzh0=;
 b=bqbiUT7RFRoWhAiUDNwrYPKzj5B3A+R3YGCfUXtcKcZ5+U7yp5ZkiZ1AqRGaQ5x4rPRiNWGMTBkJO+mzQTaA89Onr/Akr+c1YizDF1uz2UyNH9k5aLQFMq1V3n7Rk5VyIZi5guIOEOQGmz05kTtC5KLiQNxOIrihjc0RpTNClJZlHjyrXkTeiZXA0mIJPANYO9HNm2g6qC2uh8XuJ8pm9gCN3OF2kzoHKfRvwHx5Ol/iweY+Nu+wiITD14F8FVZ04jA+sOFpwGuRA92tv1HMFDzaGG35tX7E4YtSKeft9MyQx59FlN7HSstFtWY+xMa9O6F0U+EKHY1fuOwf6IRJGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 14:08:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 14:08:24 +0000
Date: Tue, 14 Jul 2026 09:08:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2 02/10] firmware: imx: ele: Fix indentation in
 ele_base_msg.h
Message-ID: <alZCzD0An9GTLZiy@SMW015318>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-2-b8266d93514b@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-2-b8266d93514b@kontron.de>
X-ClientProxiedBy: SA9PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:806:28::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 32811196-171e-4033-e533-08dee1b15e2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|19092799006|1800799024|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: L5gNi4LuCAy+SeQMCeau3vVaMGoFzc5m3GEFvCdQXH57vmlF9GbMDkOFbKvzcrzXSw49042N0YrAMLA1Wgx/WZFrgEHQcKV+1Lgzqrnjj2PlQg/5ogJBPqzDFctWl/WmCt+5FYaQi7EWVL4nXIli7OuLllGlFrni9iFVZYHHFdFSbanVnIfXLZT+65OU77Zwte/JZPgFJ8HYkdcQnUibpkToVFBFJ4MdqkDVPCw6AhfEyTcDkmAg0hiiavfah/1bNc4by/0JasnHHg45ITHZuztuO8B5BfWOPTnFTOyKer9H5DgOA61sM1A1XzlQlrHKhjuTBKTyeCP0bzdCQboP9gELjKHLyID+D/oaEqHTqIPB3CUFZr/vCkb9+7ULd4F5siCpXkS5T1MiEa3FbtINaliu5DcIItoeVlqb1fpWkpHDOuR002MInZPCDaJ3I0XAObQE9Iy+vtpTMtTbcWxpbQfP7NQciJ7tc2vQcmR55DJIJVD8yYVo2nphDlf/TvXD8IDQAfBYQna4H/8R5AqspKFG1u4MI/O5RhX3EUwg4FJ7hdElJ2rn91zgdlxIH2bGziDPuZTfrHlkGQbiHLL7jQa7yWblqsFT7L45C1jh4GA9+fcV32qDB/X3w7663RIGZrYfSJDoQ5bGbE/qp0W0LVMdngLJkh7ZfNQc1zEvBKU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(19092799006)(1800799024)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K4rOvV2uocwEHSD7tFVjySOBLx6YTU2HS17Q9kx469Q6aDMlKV8XSALEC1UB?=
 =?us-ascii?Q?cvOeB9bADkcJZHKE5CtSNwoF4IOXhyiGTbcHZSPQXakcqZQH240hqExSbeyo?=
 =?us-ascii?Q?01EGZ3UyNBzn3DoeJgXJ2jUXFSXJd+ddjk2LwbcIs0xLeehDpo3COoPfPzKR?=
 =?us-ascii?Q?7WcvihtE9bh1R4xKccPdqY1P0Qs3jVr4Jp4wJfq+S7Tu/uLpWaF6tQXD9p07?=
 =?us-ascii?Q?SUOLrIi1Ea4vkAW65RUK6JwQ1sFMp+NVHjOxjIiQlFPqnAj+FQ2zSOQz7XI5?=
 =?us-ascii?Q?oL8KQkcD3i/8EeNDdd0qqnEywP79Sgao4jeTz43OK+loYkDQsr9nxl3ZjfkS?=
 =?us-ascii?Q?mlV399hrlYmchLvsxGmJvH6WAVFr/Gb3jr1oFbuGoQVh3MWaDFlsiqg9OZuw?=
 =?us-ascii?Q?Ysr0/fqKHpMjl2yPnt/7ehhyJMxgBD7KdZ8rfKDl4zOH/NAg77d2U9X54R2k?=
 =?us-ascii?Q?k8atHLiqYhsmVCrmmgpPeXyNB1Re6q9CbytuH0d6FhslfHK3xDSRq9g/9Aq9?=
 =?us-ascii?Q?jGQyq3ErJBjoDgXMcUUxvJyKfLdhFgm/eJQbXzLKdtkxmiYQZ1mBJkDTjQOc?=
 =?us-ascii?Q?lX7CRV95cFaFJSdgsnjZXqjAfw8qplaH2j397VKBXb9UjhbzeTVkojhYsCL3?=
 =?us-ascii?Q?vq25h9WNUvvwAvA0rUemJ9+7F/0YoQpUB61/bvn1YiC0qvKnxzEq33s9j/KE?=
 =?us-ascii?Q?U+QmWWkfRRyb5/bRSnrV8cRrvHkd5nadhjXUBiNTOTQPBT1r8tjtOy2ZaKqI?=
 =?us-ascii?Q?+l9uD2UauDtYo+YFtWhnFjjW4HO0ejlY40F99luAUsBYrNhmx8sC2wihy9Ra?=
 =?us-ascii?Q?8nm945T+6+RI62ily7aBNW19GfUgeniETNVpCs7jBbDwj7BV2fnT+V+mYwBR?=
 =?us-ascii?Q?JLiQDQNQrZwTesSWqk5iPaAp9YS0Wmgm4jjFR2w013Mm+JseFUXB1kCvsAWb?=
 =?us-ascii?Q?MyQFc7jyES1v0nhfJZeRju89LhctVHWcFVG4v5dHJOhxnqb3BGNu7znF1bJJ?=
 =?us-ascii?Q?48nLaDA0ZiO0zW06MjiQX+PLoRbSBNJ2rao9d/17uep6kr7/LRPRN4oLzRbR?=
 =?us-ascii?Q?7KFDZynPNiVsspwE+5LEN42o2KLE4DDIIie+ULIUIXDIQdVPGs3JyH3r1Zu+?=
 =?us-ascii?Q?Wwc5Ja4DvmM6LwKf3kpgQWX+RmJSNBW+hc93GFBJqdzxfPjAcTTXxZdQSqFt?=
 =?us-ascii?Q?v2db2X9F+nRFXtSs0+G4sTw+GlqKt2snZICui8w1EwuWlvKIoNG0POpVgNOQ?=
 =?us-ascii?Q?OGhnAPHkk5ZQzDCbJ2n/C09wl6wMnLZWQEYnd8xw+lE9VF5vL08ux9Jl+rVS?=
 =?us-ascii?Q?o+Qu1i3bCna6v/xXLMq3FnZ1SOIUWCo4LKOD3ntusjarivcoUnUfHfOIJnru?=
 =?us-ascii?Q?frDZhJfoNlQXosVejech5QWNQUcUcB+cin+nO7gDcTnfSABOXFY3PLWbGqke?=
 =?us-ascii?Q?nhWj6VxIrDoFUdpH8YdkED2N8V7gj3m6EQyN9gygln7Vcz7nXwwzc9tM+UOG?=
 =?us-ascii?Q?dmgaWtWPUdze7gcCiQKG4Ag4fkUw6kPKP5XcHb6vKdTpLY5HWZOGsm9E23O4?=
 =?us-ascii?Q?mR1JyLNcBiek7/6Gv5RjCPfM+FtvHaVcubpLKTfF0U5SLz/gXgZdKeqLfKQh?=
 =?us-ascii?Q?DiACjQBObKwXc4hx3lQPYjCF1HX8+poOIgvidE/hExjAiI8PXaPwMzuaBc0/?=
 =?us-ascii?Q?pNiVLb0uUn0D2ndbe8iC2EYNUCCamkSE2vNaucwRAJbuqZXi11aQNWKXwIcm?=
 =?us-ascii?Q?V2Oi2nNS9FQv/xmd6mw7NaOfOJLARhMllfV8fskJ8GW65v7BKnZq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32811196-171e-4033-e533-08dee1b15e2c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:08:24.1258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOc8LmscuH8ErB9eRKE5dQsicEUpOVqkZw7qipGV+TVJ+1Zw7NvWFSvZhcnqUPpaal1Gz1g/5epVj0mAJTviwQ+3cZ9nZ+ipj6EE4Ws4aUkhNLWYcu5935T2jebiEIcn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_070830_412807_F7711A28 
X-CRM114-Status: GOOD (  12.78  )
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

On Mon, Jul 13, 2026 at 04:53:38PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> The file uses mixed indentation characters. Use tabs everywhere.
>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/firmware/imx/ele_base_msg.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
> index 75e65e279193..1c5d6791b323 100644
> --- a/drivers/firmware/imx/ele_base_msg.h
> +++ b/drivers/firmware/imx/ele_base_msg.h
> @@ -27,19 +27,19 @@
>  #define ELE_GEN_KEY_BLOB_REQ		0xaf
>  #define ELE_GET_FW_STATUS_REQ		0xc5
>  #define ELE_XIP_DECRYPT_REQ		0xc6
> -#define ELE_WRITE_FUSE                  0xd6
> -#define ELE_DEV_ATTEST_REQ              0xdb
> -#define ELE_WRITE_SHADOW_FUSE_REQ       0xf2
> -#define ELE_READ_SHADOW_FUSE_REQ        0xf3
> +#define ELE_WRITE_FUSE			0xd6
> +#define ELE_DEV_ATTEST_REQ		0xdb
> +#define ELE_WRITE_SHADOW_FUSE_REQ	0xf2
> +#define ELE_READ_SHADOW_FUSE_REQ	0xf3
>
>  #define ELE_GET_INFO_REQ		0xda
>  #define ELE_GET_INFO_REQ_MSG_SZ		0x10
>  #define ELE_GET_INFO_RSP_MSG_SZ		0x08
>
> -#define MAX_UID_SIZE                     (16)
> -#define DEV_GETINFO_ROM_PATCH_SHA_SZ     (32)
> -#define DEV_GETINFO_FW_SHA_SZ            (32)
> -#define DEV_GETINFO_OEM_SRKH_SZ          (64)
> +#define MAX_UID_SIZE			(16)
> +#define DEV_GETINFO_ROM_PATCH_SHA_SZ	(32)
> +#define DEV_GETINFO_FW_SHA_SZ		(32)
> +#define DEV_GETINFO_OEM_SRKH_SZ		(64)
>  #define DEV_GETINFO_MIN_VER_MASK	0xff
>  #define DEV_GETINFO_MAJ_VER_MASK	0xff00
>  #define ELE_DEV_INFO_EXTRA_SZ		0x60
>
> --
> 2.55.0
>
>

