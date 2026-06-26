Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E645C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40s7TcusmbVpSD4mywsXg/1SqKXUxbh5GPwVnhY1cYc=; b=lQbNZwPYB6l+GE/ZV9Db+1WQQq
	EJRA+hOezdW1R7NEboaVi6YBW8B2ci3lE10WV7CqliUzeI/cT4V/Okc6eksRD3sMLcSCYgxQOFJaT
	zufyhJdHx4fLD/dVm6466zNYzNk60ALWME3cf/9N0a2wdNOjuNMgCNijksCrDbwDNm+7/3Lf+XgPF
	eyKFoJAJQ3YnV4cii6mbyqMOaxRdq77Mv/CuX6/TaKvfdq5WRYI5AsW3d9fY5zOXhJFr0yDWTh2Rp
	lXAvsavcHXZV8a7ZOpJoTrgN2virLFt6ituawVskS0dVDpc6lvVOh4KYcTHYklBhnIBC6wBxoZZ4U
	ZgqeE2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9F4-0000000Bc6v-0UYV;
	Fri, 26 Jun 2026 16:17:22 +0000
Received: from mail-swedencentralazon11013036.outbound.protection.outlook.com ([52.101.83.36] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9F1-0000000Bc6T-3tt3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 16:17:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dF79yXr7OV7NoSmEWk+GAEE0ipcPkMgq0pWQN1t1Y7eISYQ958MVOL/nylPWJSg1yHCbD21zvsf7EMaZfoWiCOatAc8RMdeY7iP7GWVV5jM6wue91jkR14sqUFxYf9PtqhjKU6VnR/VJ5+cqzeUOArJBHeaDtMq/BWcxWUe2DjYuEIvjNlHO0F7r+VWyfuLOct7pt7itb51N5unbmnyjNc4hjYN6V65Om7xJOeKI364KJWirDdA6ovZKb4pk2PVD1nrxt6Kkb6AarvsbG+rXvYerzQePnfQe93GM4ka9vvSRy+xWXZueaKvlu+djZhtWVWF2kAc/C2F3WJ8tvF+hPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40s7TcusmbVpSD4mywsXg/1SqKXUxbh5GPwVnhY1cYc=;
 b=CEcOdvebudajNhMeNXO6MsrFTr9S8OQcgsFDvnNshP09tTMg3trc/tH379JXQocLWk4+d1IT2BFKIQAAzn+zLcS4c/ARob66vej7ZULAfpAlMfqDzZ0+EsPjk4whLUGkTYrNL4KYJiPVFX6+mpkUg0C3RISBE16tOvGyhvXpQvrkVTi9wmlEycc+GZyLOHsgJKVmBMxIFqFbiSiHh3Dh1H2e653SL+O1VC/5aNOaaIB7mEY5TX+nJiiJlAg0GX1/QcpQP/9J8oPLTsL/zKf9Il/AijSjjx0+7LLglUhG2uh7qJQJ1u1DKUjsmP4nCfmUHLEXz6jwZ0A4xob9MVZYIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40s7TcusmbVpSD4mywsXg/1SqKXUxbh5GPwVnhY1cYc=;
 b=S3Tlq6yPiTZwJR4m/up8N7ZnT1z8hwqxNJmFBFF2K2PXIUyg+vLwnkksa+Qo3dJhM+fu2Lf/cNT7owKd1HHozWAtytTd58erCSUf9iwXMENdY6XrLs3pvcaP3/rXZ/0vnEhgaPPCg2dCEu2ldGgWaKlOsGIySt/sivzhBO+ZjnQvQeaGYdsJ9UyBQiUXPD/J5pnkOVPZbL39MlwwJLS47ut+57ztnfyem50YKvvIgd7Vjxh7vDBFZ+kRFYOobubuhjPPpPE9jAkbSRD19hZCPw3nGMHo+hGTU+Kn9iFewEKGr0mFQaymOYmUeZe2NK79J5611j/+562OTgwP73C4sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB9759.eurprd04.prod.outlook.com (2603:10a6:150:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 16:17:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Fri, 26 Jun 2026
 16:17:12 +0000
Date: Fri, 26 Jun 2026 11:17:01 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: imx8m: fix clock reference leak in
 imx8m_soc_prepare()
Message-ID: <aj6l_eMFLvQVq2md@SMW015318>
References: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com>
X-ClientProxiedBy: PH7P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: 5551e3f3-e971-4109-94e9-08ded39e6118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|23010399003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: bwzCiRrEpf2ipD3Zf3veqXTBZqe6+JZ2KchaP2qZPNp8fKxC+qSxZ4j5++oedFZw6nP0frINq1AdYuhFA8w0dE4A6uWe61j4TaW/WFt2CpoWCYRSWIm3Dl4ZStKEjQQrq/T+6FiVLJD6V1oszcUQbAj6FM6RtEu8a+3A/0wGD/aXNDakD4zjyLHMIdHEVRpSUUNGUjl7FKU4DZ/OX3eye+IYuHXOLBIi2zyYj0znIPZhmo8PU/afBZM5Nl2Ahvu+nrs82GV/3EIuO3Ko6JvZSeFa9VDVT8mrJS3HwSQK12i/A23qposZk03UQMQGnGDJ00bBZKOWawxSkC/FWsKYpXMLaMSa0s3OfQfihlVqauHqYT8QkoOvqk26pZPqDkG29P0PJVyWOl2KYDpLVHyLUWs1WwObMp2MLMCBUMeAzOaNF0QXJyFPiL2hiuQqs4p9yfNNzwWzz1pjKQtUC0C+gWsiFGstsKAuy6rXjzHHmGzb3msKIPdbRl1WRezjU8fRI3mG+o2UQQdxakKcpaGeS4PWc4g/HSsTGYU/LiLU32E8/P7Lm6YTSc24I/nJnGuosos+RAR2uwvD+4rFqYrzd5WC0tW0mQOPEl4sT1eNAQn6iFfQr8CRGk6l/Ghb5mdWeEYlV80T3oJ4Ve2vX7QGyR2bQKevVJiTZRZJzFi0vmk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6qN19kk0jowITMZ5P2oLHE2EVlqxe3tgYMrz40iLHdmZPx0Ir1QwvMnJCM/W?=
 =?us-ascii?Q?3+noT6MmINIAyNkagvMsIltqQLZ2KZ3mZZgOeaOajWh4JK9TaAgKm2XufzeO?=
 =?us-ascii?Q?9n0VI3ohqJPbDwzCHbcEpXD0Vr0Fb8D4tkeUsv7iOdagr4bhJWAIIc/lff0a?=
 =?us-ascii?Q?mLT6QjPbf2w6RbpJ37wWQY6pXAiW2/DLWa3rlzsiu9m/ssjD5S98p520y56R?=
 =?us-ascii?Q?8m9nYIXQsfSMb6a8wfzl1OosJ5zLEM0ZlpN91cF1BTItY6VfSoli+Nk7gyiH?=
 =?us-ascii?Q?JiiTR0x01/0VPDbuSAEvqSPnB6SrnI5V3MJl74TbZ9GTUiGm6Pv8JSRAF7Al?=
 =?us-ascii?Q?mPyz2SUHO1XDLfvYiNZD4sl10glKo0e8DEQ+f4dB2JAP7HV08djf8c1jp9wH?=
 =?us-ascii?Q?b8Q3ueid4Ex8wsSBKOTz3vUX4F2r1pBZO99yZHM1H/3oeJbvkc+qEohqcKkt?=
 =?us-ascii?Q?UKlLpg3WgMyclyLKjJno8xCJbSetyaK6WaYSYECWbQStwlUqw25JGTKWt3+5?=
 =?us-ascii?Q?d1IMNQbVH7bNeQee6IuZlKLuwmYF/MLqI65RHs1pAuuosKjVA4xR9tORQGXm?=
 =?us-ascii?Q?W2qTUyeOxukIi2jmG7bmakSnR6oY3df/P/Oy3LQB02wAZd2uPgyWSRbFDmG7?=
 =?us-ascii?Q?a95LjDgHNVmWPdxllcDE+q99R2cr89tUVnu5kq3Q7wcjis4ushIgyNlKcaNU?=
 =?us-ascii?Q?qQghrzbeF1OVf0dhsBFoYemMy+XF+Otm2YqMXkFI+3d5rlxTIW9x81qBOlY+?=
 =?us-ascii?Q?z6BgwXuv90UurwXAQjhyP8Rq55a8JNVjvF75FJJofga+1fKin94QCdSxux11?=
 =?us-ascii?Q?2+7Tmz+br20mT058AM0Yj9F8ROFJtVGyyuNLG2FipPMxB4luy3yAzS/IiiTk?=
 =?us-ascii?Q?dSo3cZI53tXbzXif9OTewPiBO6DG+1ydtW0WqGboOth3Izv8rc57LoWc1XNR?=
 =?us-ascii?Q?JJnjS+y96jc46+VzvpPqXIlJu7SLnyJ+fzNBBA37X8OYrBIPx+uynLfReaXs?=
 =?us-ascii?Q?ULv+MzgZQsBXbIEawBPe/pCqk9ZuJ1H7wskOZn8udY1M19FOqYssRW1V2+7E?=
 =?us-ascii?Q?UkDKMjdbncjz/Ndj2yV23dgOBm1/TUA74OH0YlrcA4dm9OsoTPQHKKZ4mX/K?=
 =?us-ascii?Q?yA5Sq8TLhseKQQ0/lxokJ0YvLiVD3jbRXJwFac6YY0y3C9hTdzdH8woA3CRM?=
 =?us-ascii?Q?t29eifzfBBkgs8bN8l1l9o984lT+WEkO3yvNTrMPkXYY3Fx9V5b7yD0jcWBT?=
 =?us-ascii?Q?wbSsdMd4rNes2zbtGCvROrEcVGwzokLDSivlMRJ9e1zfW+H8pMq7b0qCb6D1?=
 =?us-ascii?Q?YKzoH44c+FWTM4W/b3tS7t9/V5G57cUoqnEgUYOLcC8n2Lb0brMK9pZlbckN?=
 =?us-ascii?Q?AP92d3P0ndxJ0mA5uVMDPkPeJN5+A4kOqDY1wIbOViwZH4AiwmJ2hE80B1UC?=
 =?us-ascii?Q?Q5hN+vMZBXTCcxKWvdNSltweDxs5beZEePCrmaYdNz0Z3GHBq4vLaehBVoT6?=
 =?us-ascii?Q?ryUuxUx+/mGQi4Etm8whxnWODrB7cjO47qPUlgFJOXAH0ym/IMWBYLgtuEcg?=
 =?us-ascii?Q?ytxbNs9scp+xxbTdfkhiyDlZx3eqwwXv42+90ipqRig/e0NQhRPmfzpuEUwl?=
 =?us-ascii?Q?stHZ8m9DphmOXrDdacwBdFrRhhi17ywYN/Zt3xOFirA954gu+Ms56T+ri7PL?=
 =?us-ascii?Q?LZZ9tvCM2n4lJ9LXJTQjtvob6L02zB529Fj9S/nPF132SjMj2yyqhYlibbaJ?=
 =?us-ascii?Q?PQ6WjDaN3Mm2DGSRAo/mnCji/hRwWNeKvn9G63E5P81DhuYbM8uF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5551e3f3-e971-4109-94e9-08ded39e6118
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 16:17:12.3522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFkQXN1R5YQWjI7nItSdm7QyHKRnbvKer545YP77EViwXda9pinsAEPyTNs4JJbVN4QaSL9Jfkc7m8Rymf2wF4Gr/G5CyPX0qNtxQxOYsHfsaaeXriz4qgzocyORweZ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_091719_993810_1891E0D3 
X-CRM114-Status: GOOD (  17.92  )
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

On Fri, Jun 26, 2026 at 10:37:35PM +0800, Felix Gu wrote:
> When clk_prepare_enable() fails, the error path does not release the
> clock reference obtained by of_clk_get_by_name(). Add clk_put() to
> the error path before iounmap().
>
> Fixes: 390c01073f5d ("soc: imx8m: Cleanup with adding imx8m_soc_[un]prepare")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---

Thanks for your fix

>  drivers/soc/imx/soc-imx8m.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index fc080e56f50d..de19972435f9 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -150,10 +150,12 @@ static int imx8m_soc_prepare(struct platform_device *pdev, const char *ocotp_com
>
>  	ret = clk_prepare_enable(drvdata->clk);
>  	if (ret)
> -		goto err_clk;
> +		goto put_clk;

imx8m_soc_prepare() call be from probe(), can your use
devm_clk_get_enabled() to combine clk get and enable together.

And use new patch change ioremap() to devm_ioremap().

Frank
>
>  	return 0;
>
> +put_clk:
> +	clk_put(drvdata->clk);
>  err_clk:
>  	iounmap(drvdata->ocotp_base);
>  	return ret;
>
> ---
> base-commit: 30ffa8de54e5cc80d93fd211ca134d1764a7011f
> change-id: 20260626-soc-imx8m-938e89104044
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>
>

