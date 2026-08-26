Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68FBC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 15:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7EhHsbAr8XiPbwlEanL8OLWNtNo3puW7/e3JmdAKcU=; b=UXlDLSHAoCcva7up3osdK6oh/p
	4OJHhzgVE4Z3SR/jqms/+cGDox8ONAEnGaIkhYcyPOWXEjYexYX9urdKMdbXmRCOQhFMS4GX4/+kr
	MsPGm3snSz/lkK5kEa0SBB2eMcfWHcRWWlNsp9N/BzlsFrwTb9kMU5b6tAEpKML3Rc7ACjUqkujB7
	uq2Xvcuhmoexkb8GexDK6aFb4ijPb7AZv+ZBqckpH/vpDeEkqIYCD4z3PUS8cOy3qGLEXA1lP8WQF
	nf2W/xCVfGk9l/s+09f5EQ4QgGdmOtTYwJFGzVf1mfE7aLQUEd8v63tH61JSm+o/04gvMSD/AcH2g
	xP6LJG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFSN-00000002fCd-0LDj;
	Wed, 26 Aug 2026 15:22:27 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFSJ-00000002fBy-3iOX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 15:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pA7nEfFXpBM1UxIe+NDTmvwgaU1mTqsbhF1KMa+XTE+HDmstUZwcIyEWwPn9nITY2+m8V/bCzjCAVaTBarBL0NmPJWBB4r7jGesp2SG75l8vGLNYvn1+Z1uIk/Fdi2BBY7ehNZbpEDxguHKl+gse4yXgn8n0JKlrttNbOpYITs8SKVb9mOJ51+i6oUDxSFPaDTb5oePY1o2Gs6r+6ZvOz59gNlfRBAxc8L14mY+1Rxtzf+ACf8Wue/J4BtKDpAP3ygOrGYOxliV+IBRZNlcJRkVASQF4pgfCUb4JVHd2u43UDSyzVnvilc7eapgMScA+uzUZjCRpjm55ewYfDy0Dvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7EhHsbAr8XiPbwlEanL8OLWNtNo3puW7/e3JmdAKcU=;
 b=m4FUDeKQIpP/l8v/NHRqskJzPoqh4NexX4hm3E1FK+X+I7iDqDBflvgnShbB9YEKSbBAat/AFquSZitFHMJcBj8AyydqMfD2lRxOVgpDh4h3A/KOoFyqPvfgUDLbG+tHz899gg06pqvAPKOlVtNs1k+naPqNJua06cu7ZKAR6gXJeobSB8rgtkdcXEm/uNCSaxy/Q/gnACLDkdiLwwF2G+I2mGNdm5vLTnQwz7v/PRELTb4TkiHuiF6uQXPgxmkXJgcIVZuaeXNqVH1CG9DuPplwjICkGE8geEholxkpdY1ZS9/l7GoWucqJrupgbUHaIoo8+TbZKVL8ey8NHAGezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7EhHsbAr8XiPbwlEanL8OLWNtNo3puW7/e3JmdAKcU=;
 b=hNyUx8GivXmT6cUm6B5vfbjOS16gnrPIYzFXGAc2bsBqhers5SogJMc0VAqKbl+pxD/AmPpSeRH/cv5EGytFw878HD+QCk5LkfyS210LPN/XepLuCyTKw8Q9MjEhyAP3RTj7Hxlno5WIkcIEKtQX+qQ5Semq9mBBLH8Yf9hl5Yk7R8+qAPhLkfKaXd43N+9INfDvAVRAG0ykner8JsO5TdQsSeWVXfNVFYrsRVwzKhEKdHTaxCPlW9LaN0tzXzCQUJl3LE0a9bybmH/pQVDxePOFK+2W2y3BOgHKUbym5dsFZS6GG8h1GmKdWRqpJGa8Ip4rzGFgdfM6rn+RkW0hYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB6825.eurprd04.prod.outlook.com (2603:10a6:10:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 15:22:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Wed, 26 Aug 2026
 15:22:20 +0000
Date: Wed, 26 Aug 2026 10:22:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>, clizzi@redhat.com,
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 05/10] scsi: ufs: dwc: Export common clock divider and
 link status helpers
Message-ID: <ao8En1LWAsgY6wzX@SMW015318>
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com>
 <20260826134048.854748-6-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826134048.854748-6-larisa.grigore@oss.nxp.com>
X-ClientProxiedBy: SN7PR04CA0208.namprd04.prod.outlook.com
 (2603:10b6:806:126::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee424a4-383f-4d70-6b7e-08df0385d1d7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|7416014|10067099003|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: +eZjSerIJD6UmEVjJ2i46rlQg+hEuLnJ4ELRzH/KptrxoitADHlw2ATgjFUQE7XaEnZqTUZC2bcx2Vmbu9PDkwuRny8Wpow6VNpjz3kaRDLocIC4NZ17HkNPRUe4jOHylfkix570rFXMrG1S5nB28DNSc1lLSjRFvSAkmVj+L6BbcZ57G2a94iAuhgzv+A8GJq/K8dV7uLcFAZUCCoOgvUmYShr8J2LbTq4pjUx5cxAUIbTPWhDhpBUNvidS+QgYGGf8UreLzrlSbHCaZlKg2VDq100eozJGByn/JdFu6YoIb2wUgGR5K8XWenGWZKS1cGlCiy5eYKdsFW73QaOkB1yxBJADyi0K8wSmMedShjyGKtXqz+Qx9cHtGtQKNOY4dPlTCMWgn02HJKfEVoeiOqwQnp/mS84uZgkn2wOwQ+HLPDagwIlsGdYGU60+pNh1p98JJrng/DMkdujQwlAHn6cQGKbvPac0QZQJ5EN61tum0MfFwjjvc6O4YnF6bDMHNZGU4AnKPP8JFFhmiM6ekH7hoN5kW7L5OgcXyAwlAWoeh0ilgMbUed2+QRQu1QKnqMIKKfLm4Fpt7w9NEzB10oKMoTGaznLIGAV3OvJWQungPG90MaVV/Y4DTQ87K5t5BNgRN3EmnbtMjAUDhl2PDH6EtAGB04uPR2Dwc7ZlUMk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(7416014)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7/sNYD8eZzP9q37kBq3FUVUbblLnh/wWsh+Jk0XNZqTfs2mRcRxfEMkG0SPj?=
 =?us-ascii?Q?tUKAKLpxzvv8bOvfci13vWD9TbKPSwwEBplC4occFGG7FwZnbj2MvO6w7fdU?=
 =?us-ascii?Q?4G4ZcZgvX4023rkFZup47p6CUWy9mFVNnSQd/C2aT04N0i7MKbFWzcUxR1xe?=
 =?us-ascii?Q?gMfoghxoW36jAMXKU3CesadZR3N+5U8y7rPBXwoBkq58G9dpMWAuM/m+Ula9?=
 =?us-ascii?Q?6r4vEoE/wMLmdV9+Ba3opCeHshym54NcMkXukra6da6pQfjtcX5siYugUj3X?=
 =?us-ascii?Q?9eD05YulockqrIlsAwJRhR/YQ19T9tJFgZz3+TLIOkJRDdqIgdMCKszo4W0g?=
 =?us-ascii?Q?z2zCo9ADIT5I099/vXvAFR8ICma2A0GFTBzK/kKCsMUXEfzvVIvtWR8ME9c5?=
 =?us-ascii?Q?qxBJ82B5cYAb3GXkjr2N1v/swi86Xez2yHrCjZXHTJnGIRNjniya5j06QV1Q?=
 =?us-ascii?Q?gfoQhSzuf6EWja9kwGDFNyzBkIDXwD7q4HhUEVwIZDFky5lKzdCmMAofQU8u?=
 =?us-ascii?Q?JnPL1baN6NXGLibKrdpAVD9XP2whr5HWpsWmaAkW9x2KRcaHTmk6BvMbWJX/?=
 =?us-ascii?Q?818aAl/tlJRlHKlxGgibYx/f+Kj8IVUjpMm/0xRxuWBa/1beJ61hBynn2Mow?=
 =?us-ascii?Q?wu0+vlu9xgAAtM0r4JToQ+Prdj2MbneOtmVf3jEGRbJ0JKtMT1L/DrT0wllI?=
 =?us-ascii?Q?DsskPFeG9iSyltJkbVJq5wxmwL2Q8W/xWgbfAPwghf0UCSHA3IsB8sj3hFw+?=
 =?us-ascii?Q?LYI6H+56TA9RI6mHE+o96+qLCytrCf/ptBY3SIVK6irrx9M57ibashy9ZONa?=
 =?us-ascii?Q?Tv7rlhqTMe94cDGJvaJJT8JMmOVjmAT1VA1iILBXmQw6sVzoA70YTM/43Xw0?=
 =?us-ascii?Q?rEVYEaY3dbvZx1MOT8khJcwEgXXW91fcwEu/y77KodqbbXwoyVolwSzWbJxZ?=
 =?us-ascii?Q?dRipdBYVNbopnzeMrg8L6sGwnqj9//xn2D0YbQ5P0L8OiiH+ECOtHs1WXiVG?=
 =?us-ascii?Q?fFdh+6dx0z+cY/CaW7HRwXfxmnXp90nOpRrgpGNQ7lVwJXTIthl1kQROMsvd?=
 =?us-ascii?Q?HFRMNDPbGL5ftQd4OZj2G3RGme1vL3zRuMts9vjRgEuHSeyfDSLfZLl/MF0J?=
 =?us-ascii?Q?kl5/f4N6z6WcZ20Y2LfGaf8BIwxasU5ps7dzIBRp7dRfJOCcZisxOlsx/mWV?=
 =?us-ascii?Q?8V3rbbPrlePqpy3vYFYE6PSQ3LqnrNmlnedLvxSTPkRtTjZ+5+fN70nsrmGj?=
 =?us-ascii?Q?brABtXqb/hzuhxDDTAkNqTvpWTKsoEnwm+SGVeEkvUI/pMjNSQJ5G+b4PoSG?=
 =?us-ascii?Q?J7o9gpjxeoiXLrPgC2K8UPM4Ra7lr15a1+4/srT4Be69J8EbIJz/gXUVIoIc?=
 =?us-ascii?Q?Re9uNzHOOxU1WNq4UFdvY5yB4YCt/OiZficrGAY9VrYNB1EsEwTbKjj0mRWM?=
 =?us-ascii?Q?bHfp4pfIBDQmsKrMu9h1ulHTOzOsnmdYxdB3gp0+3V3ajJ2oNxFDL28iXtSK?=
 =?us-ascii?Q?2bQpitrSdE2MjyQRkCDvw2aKi6neWbrFlb1TF52F9SGEgr6ZsV1vCBqbliqV?=
 =?us-ascii?Q?5bkE81zJ2kC0oOK3PEWdILTQ1aFL5gttYcPui3LNnCiaZjAGGITqPXzYmu3X?=
 =?us-ascii?Q?6WdQovbWew3ywBLRs0BYeBwA7zjQSlQPaPXhfNuEkbqOxC2gW2t8HVmQqRSG?=
 =?us-ascii?Q?LcMZXxXIqw6jtNjTeqQTSx290L+iOfH068Z8CKHts+xbHO197ze5/dv1nS9K?=
 =?us-ascii?Q?DOMx3OJRB3EAlwZi0muyggnWR1rBPK9Xwkmd515PSQ2q0EZu3lqz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee424a4-383f-4d70-6b7e-08df0385d1d7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 15:22:19.9369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3wQkYBC7dHVDWLopAlxQ856g9prn3ELzwO2WBSP+EFY+To5XfSmoHnJEsjlVW7UZxWco/m+xomkX6RZWw22qW/Nk5M46oYVqPGy4Wnzhv5nG5mrNnM2UB9VD+YPmVQp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_082223_930889_4B8F28AA 
X-CRM114-Status: GOOD (  18.49  )
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

On Wed, Aug 26, 2026 at 03:40:43PM +0200, Larisa Grigore wrote:
>
> Make ufshcd_dwc_program_clk_div() and ufshcd_dwc_link_is_up() available to
> DWC-based platform glue drivers. These helpers are needed by platform
> drivers that must program the controller HCLK divider and verify link state
> during their vendor-specific initialization flows.
>
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/ufs/host/ufshcd-dwc.c | 6 ++++--
>  drivers/ufs/host/ufshcd-dwc.h | 2 ++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/ufs/host/ufshcd-dwc.c b/drivers/ufs/host/ufshcd-dwc.c
> index 45920793d1a8..4a689d211e81 100644
> --- a/drivers/ufs/host/ufshcd-dwc.c
> +++ b/drivers/ufs/host/ufshcd-dwc.c
> @@ -39,10 +39,11 @@ EXPORT_SYMBOL(ufshcd_dwc_dme_set_attrs);
>   * @divider_val: clock divider value to be programmed
>   *
>   */
> -static void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
> +void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
>  {
>         ufshcd_writel(hba, divider_val, DWC_UFS_REG_HCLKDIV);
>  }
> +EXPORT_SYMBOL(ufshcd_dwc_program_clk_div);
>
>  /**
>   * ufshcd_dwc_link_is_up() - check if link is up.
> @@ -50,7 +51,7 @@ static void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
>   *
>   * Return: 0 on success, non-zero value on failure.
>   */
> -static int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
> +int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
>  {
>         int dme_result = 0;
>
> @@ -63,6 +64,7 @@ static int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
>
>         return 1;
>  }
> +EXPORT_SYMBOL(ufshcd_dwc_link_is_up);
>
>  /**
>   * ufshcd_dwc_connection_setup() - configure unipro attributes.
> diff --git a/drivers/ufs/host/ufshcd-dwc.h b/drivers/ufs/host/ufshcd-dwc.h
> index d8673cd54d4c..53b523ef59df 100644
> --- a/drivers/ufs/host/ufshcd-dwc.h
> +++ b/drivers/ufs/host/ufshcd-dwc.h
> @@ -47,4 +47,6 @@ int ufshcd_dwc_dme_set_attrs(struct ufs_hba *hba,
>                                 const struct ufshcd_dme_attr_val *v, int n);
>  int ufshcd_dwc_phy_reg_write(struct ufs_hba *hba, u32 addr, u32 val);
>  int ufshcd_dwc_phy_reg_read(struct ufs_hba *hba, u32 addr, u32 *val);
> +int ufshcd_dwc_link_is_up(struct ufs_hba *hba);
> +void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val);
>  #endif /* End of Header */
> --
> 2.43.0
>
>

