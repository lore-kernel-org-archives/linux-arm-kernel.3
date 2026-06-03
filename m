Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDCDCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 17:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIE1yyrEzIG5MTZG29TJJMF7jQahzQqg1FzxhXAe06E=; b=0z66EpNbU0cdZ4B46nZf0mTRc3
	QCuNYpoMaX7LWJjHRFqSVoOMJ9r2fiZrqgtdoHtnudUFx7HXJqdU8NXO3pmN9qQjiCes/FGFXz19r
	nsh5551WW7UXKpsFeqhr02Tf/sN83l8WMlAfixBxC3jl7ju4bH5V2rLupXmJaDiUuwcj4xG6BCF+X
	5FMPSCn7EVszepuf/vBSfAqImi5fD1QeKm+saD4CyS6nAkOSnK9e0SrhL9pOcqFnLdyjr18KJBSrp
	hkNoJpAhYdpa+CtD6zKBesPd9z2ok7EWQ3OIsuszk+72AARW0FhsA9jKkLrw7uLoscN38a/hN3UHG
	Nx4k4S4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpNp-0000000Fa4x-2U3Q;
	Wed, 03 Jun 2026 17:28:01 +0000
Received: from mail-northeuropeazon11011066.outbound.protection.outlook.com ([52.101.65.66] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpNm-0000000Fa3r-46FG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 17:28:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlbF30Lu8hpYonMcWtIQeh4qTgxlUseoCveOqHnsSZhB6IfcQEYtz2xwA2w+NdqAqHWshRTzfNYrRg1O0W7qVgyBbCPT0SVQiu4rWQRETXfyz1h/Wq0SmMHXwr497Jq0220mIo0YWhZLSGsyTTW13Psc/oGKTeZOf0bD53r+x4KE4GeBV97UfnpPCtGdiNqb7TtsPYZvTBXGyz7lwDA8/M01X4loiz7g6gB8fKIH0io/NjF9cyjmCtl4YuUffj8LZGKltW6BhCbE9odjlvCMGFT5Hh8MEQU+T6AASiq9Yxr/Hy3iedIBZpXP8IvxOuUim7w53cWPJEDJ9xeZAxnWCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIE1yyrEzIG5MTZG29TJJMF7jQahzQqg1FzxhXAe06E=;
 b=mN2a2CZfvEB87evkHDuXeJXtKoN5vBKggblQBDtB5IWY6+fGMJRe8sHAwu9VyekUZO85ZNjouZObUAqSc4oc8Gs4yW60OB9GaoxD78dxz4dplJW8XOsHQ1HxUgILrh4/hUI6DtdGUxkt6bOJNG4Em0GoNHO6D5KjAq/ydLfCOGCuvnaGjOubCSRVXpLJ9SvWC8TyZttW9xUzz9/+M5wU9OlwhT/Dk7s9QfVEZjVMjCJOYvcZ6Yf4hldg9+nd/zrFezjnCcM2XGyXF+coocAqSPkcVIm9Uw4cA3RvnSOKhv4PinhrXMPejeRAVQAUu0BymdsdWTIY+aYXYLpK4dNFRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIE1yyrEzIG5MTZG29TJJMF7jQahzQqg1FzxhXAe06E=;
 b=g0vOKyXIBwvi1tK2z+6AXXMsE2y8jSClmUpqRA3vugPdCEDcU0d32vYBHTRkIcVBFVNQqPRDcUf5W3HR/wPClZV4w8s8PukGUBse7ixqcqgTZ6+X5ipc0ErV0Tc74UfmBX4wc4MFDRClzLW0Ri/aHWw2hc3WdJEu7gRWbmPAiHzTM07nBi0O84TFx3Q0fV/QgN/AX+6W35w25kRvNeG6xpVQxjRVhro2x5zsw4X/ET0aq1pmz3HMypeHD9NxlF14oNJN/RlcbvuyKjhuku6uEGNJijspdxP79eECAYcM8jEz9oNsnH2Toeab1PbJRuj2bcaWfcZsynQwnX5WqwmwIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10885.eurprd04.prod.outlook.com (2603:10a6:10:587::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:27:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:27:49 +0000
Date: Wed, 3 Jun 2026 13:27:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Message-ID: <aiBkDMaioPq5tjPr@lizhi-Precision-Tower-5810>
References: <cover.1780497188.git.stefano.r@variscite.com>
 <12749af99fa4316a43d5aa9233ad8e99da9f221b.1780497188.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12749af99fa4316a43d5aa9233ad8e99da9f221b.1780497188.git.stefano.r@variscite.com>
X-ClientProxiedBy: PH3PEPF000040AA.namprd05.prod.outlook.com
 (2603:10b6:518:1::4c) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10885:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fff38b-c663-4110-4e4c-08dec1956f0b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|19092799006|366016|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: RQFtdOiLc+DlOOIjTXcDH/ZDopXj5O+TrozPlXnmHSuZN95HsKLVIQlU0X1P874PNC1JppKD6sI70nuKYJlZHgej9Au8eOzUWI+PiPCPLe4vPDpzF69Y9OpenDBHemhhtMqarpe7e6o8odNFf54Ik1MdbuOV64EeMSU9FDzjR/BOD+WXf/ZCv/XTBIlCxwkqjH9WUf0d84TLF+etgO+cwI6hjUPbmGbDN2Lj3DP7khGi1D7CVqkFh3rum2ldxwggPxeJs3QknlKFgMQQhmiPV2Ah5qdGqNhfchyBK5FMrwUVvef58GpRvSoi3gWRR2luhWCxohDpPw2jCSZ0TgeZhr+VgW23fZSn57eDd+JeRMRt5POI+SIbisUU+aA+zptnNPOHHXiv1XSiFm2Y+WQlNrNZ270PDD6DqdOiT9MhPrtuamP8yxReLW7rUC5ygnDSbSzQeouYBNYc6CXJk+elYdd10sfWo7plMrMhoObyfqQ01eBMljhQekvyeljpi9+gMg9nULDdZJqhixOHNsIbN010obJAD3zkesMl84haOH5KYSQEufdSXIdanbKnH/jlumMaETbze8foOFyDowFKrNGJHxt/+1AFnefZARPZbB2tzb/3478dcCgpVynFBqZXqOZOPPwfS6y0V5ifrXD8pBf86uo6MUuuNPyLKL6xDo7Ay9PJa+DQLGh2DlAk+ZgnceLtrNVxu4W8R40ZriL70Y5jbvutmvBwtMfxrgn5jTcpUBLXC4BkbsXPlXz+97Ko
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(19092799006)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MzfHQ7sT1G/RiwxuVK5pLqKxgif9rBpQUN5XoVkwHtxW03FCsLdfS3eug46l?=
 =?us-ascii?Q?E6KVZ+VspLPLLcaMvd4qyMq1ndp9GGY8ijuKTI8Ulpt4AglrFhPKehoNP0dA?=
 =?us-ascii?Q?sqDJXnAy3dOA/omdbmFgfzTGKlXpHHvN/PZAuuHoWmRZ6UxMyeWQHOY7FuYY?=
 =?us-ascii?Q?SLZINjCM8jdiWIRn6LdXGRybAvgQ70Apw+LqWbCmVdHYaftK1gS/Nuey596A?=
 =?us-ascii?Q?cCjDzJFaCnd7sFOkzUlJf49ETxuw9+CTvpmdKT2h8u5qy16bp/Goswh9WFFt?=
 =?us-ascii?Q?F/c+gFzCVRlbWrDqzs1+YGBZJ4pwj5EGY05TniLYTeZeZigoD72KXj6yE38f?=
 =?us-ascii?Q?aVi7Pzox+lD5K5WyImTI3xnNd+Kx8cyYYuKz5cqJHVAJW3qI4MoZOE1TQKKe?=
 =?us-ascii?Q?5JYXVqfMb3yEW/p8MtQBcPfyskrwTN2qTxHBkWUsmyf//s3RYq4qNlc4jPuJ?=
 =?us-ascii?Q?X/9xePFBCGdzi6PaN8pkwFj/Hjx7bJ3l+ULB07rA+s3RCqdbYQAVH8ZPt7kE?=
 =?us-ascii?Q?Uqf9k2ScqZEWK1O25aQ2mpUkhIUUdPfumUnJhRKoqmsOOBPMBQirInLxJZ5i?=
 =?us-ascii?Q?0M86lrRlEY2jLkEB5uRl2OkgKl21JoMdd///icNNC2D9vWmXo6cP2i8leFyV?=
 =?us-ascii?Q?zco+YPNRKtTGi+TmQAw1zdzwH/SKEE2ynn7k6SSBf3n1/Nwzwa+mLkTCqR6n?=
 =?us-ascii?Q?b5nVYZLZ0NsBFiHmqxEMBoB3YEmYIzOx7h6f+ihNm3uNXgLKo7BaUtlxU/j7?=
 =?us-ascii?Q?EZeO+JPPmWGSJ16QVKUAgcc4Jm97+Qtv3xQjc5Ft0RzGc9h+5z7IDenfM05q?=
 =?us-ascii?Q?AyCbAl7d80m4BHMm9m7GTwFQKCSDvhgLu6zkx5eXAhoav38iIp0OAnEdiWbW?=
 =?us-ascii?Q?Jpqyo2+j6sL4LlU0+xh515tch03BgeY4rxQawX1KNySj0GoZ5k+qNAPGs168?=
 =?us-ascii?Q?X/7XKgT56dVf/EBP47ZJxok1cbBAlqCS7pJM+FkfWYT45vVZzoqMUJNTUCon?=
 =?us-ascii?Q?fNw2b5agEma8N+J/KurvGd2ldLwX+gkdkTijZDhCF2hTsS1GAz+Fmo0JSEeG?=
 =?us-ascii?Q?IBFNCawNE/p2zFd9VI7yusZDLc8p93TJzLIcqyZ8lQJxCWNmN1zpHqVRW1SG?=
 =?us-ascii?Q?APyJGLN3etXKXCZAw6gKH4RYtdope1DUFRytRgHllxrv9ddqbznjdMw6nlbZ?=
 =?us-ascii?Q?TcH6di55UtVsZN7RyTlCxPtwzBBTESyPrQ/xi0e1fMliNHMyWRdlQsYqhE4R?=
 =?us-ascii?Q?KMNkg7OBYBWUQCcYFpispz1kO+GxC2DQoSDP2OQ0u+XBB5Yl2yHwEaoJeX/W?=
 =?us-ascii?Q?tZqeclchjabklQ8Trg33uzPLVj7yEb5eFft/d480FmjATgE0wD9YPMlQBgG3?=
 =?us-ascii?Q?VHij8+Rj1SNS+hFCE52cSVUG8GYYzQzHich2EG7PFUtDw76av4Yh6EnaAqbB?=
 =?us-ascii?Q?spQRtaXIaElf4bX2w82Hxp29xwJcLCnk41Pmfd2WcxfCVoaEx/HxQEvI9F56?=
 =?us-ascii?Q?Zjz6wflHrpsOO/ZAuyBLxjK3Dg6aWLiq7XtlWCHbh43lJLk7dAawG09XIztR?=
 =?us-ascii?Q?AFwFWnOsKMm2y7UGg3esDAN/wgiGvWj+HTd+miyWne/Fav7EFd1gcMrUF4aQ?=
 =?us-ascii?Q?HoAZ/SwTWL9Er/L8WgVr4AUcBh0hVZqX1qXa8oxD8pWujJikzl7qJWHrKKMO?=
 =?us-ascii?Q?kzrNCJwGrbSPnKSyjRX4hgnzP/g9b4Ojy/kJoKtXvlBb/45AAnR6nTuqaoqr?=
 =?us-ascii?Q?5YugSvsjfg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fff38b-c663-4110-4e4c-08dec1956f0b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:27:49.1902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKi4h7LY5tVwrhX0OORblyGeQ9OfpJzsq44g8IIG8cTu3xnk0uXlr8BVu3KZNi2YblLSfe4Q6tKwTwglqLBgTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10885
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_102759_023547_F7AD27AE 
X-CRM114-Status: GOOD (  16.88  )
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

On Wed, Jun 03, 2026 at 04:37:13PM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add the PCIe reference clock and enable the PCIe controller and PHY on
> the Symphony carrier board.
>
> Describe the PERST# reset GPIO and configure the PHY to use an external
> reference clock input.
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v2->v3:
>  - Describe PCIe PERST# reset GPIO
>
> v1->v2:
>  - Adjust PCIe controller configuration
>
>  .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> index 9500c9bf0f42..db0ae706f648 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> @@ -48,6 +48,12 @@ led-0 {
>  		};
>  	};
>
> +	pcie0_refclk: pcie0-refclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
>  		compatible = "regulator-fixed";
>  		regulator-name = "VSD_3V3";
> @@ -146,6 +152,18 @@ rtc@68 {
>  	};
>  };
>
> +&pcie {
> +	reset-gpio = <&pcal6408 1 GPIO_ACTIVE_LOW>;

Please new reset-gpios

see https://patchwork.kernel.org/project/imx/patch/20260312-dts-snps-reset-gpios-v2-1-0d5040eb4a1e@oss.qualcomm.com/

Frank
> +	status = "okay";
> +};
> +
> +&pcie_phy {
> +	clocks = <&pcie0_refclk>;
> +	clock-names = "ref";
> +	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
> +	status = "okay";
> +};
> +
>  &snvs_pwrkey {
>  	status = "okay";
>  };
> --
> 2.47.3
>

