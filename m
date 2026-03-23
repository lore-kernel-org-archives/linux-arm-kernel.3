Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8409DF483E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07SDZXFCKqng8eoszyi1QoNcVmTC8ksAU6GAoyt/Ujg=; b=NmZ1g4tKaC20KfxcM5j9L6TBu0
	kaUbB22em22Wg1Dcj9qzRxdftFeFKTvUMm5VlqMqdmmupgyvHaLr8yfDvfwTRyII9x9E9dZgDkqzD
	Mi1gA8B216br3YiujROCu3e9iV16K0kBsEbcY8wTzzVpzMmMgFlADInUe6yhiDPz56zji8gilHKpH
	0mqXof676Q40g3IvYgrmJo0KqSR0HfNir0rcyq86Qu+Q397lw+8og36FF7065qVYPmmDeM7uRid2h
	cDOjeppK2HVzBsxw184Rt8gLW75GAQQZ2VakmYr+jPNJmLVZJ57IFQahwR4I66cw6ypO7+eJCLUYM
	gmDhLZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kg1-0000000HQUy-2I0J;
	Mon, 23 Mar 2026 19:11:01 +0000
Received: from mail-northeuropeazon11011013.outbound.protection.outlook.com ([52.101.65.13] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kfz-0000000HQUI-0L3Y;
	Mon, 23 Mar 2026 19:11:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyvmgVLrzPPAxWOKEKK7KufO7oMeb82GwS487yUHGNW6U79mAVzUcaD+Qi+mEjBfm0wWkKexEgCOpDFhZwxN2313blq+HZTsMWXoTgvfiO9Y9JWnku5a1VXhEG66px0lony+SmbSphyjC4lBQakfLgZdWTqxrHCjzgDC0NSGv/P6XngW4e2lpb/jAX6PDPe+i9i0abgFBoSr+uE2zkDZOzOl922eQB2Um+nkqSe6j6aMJbqHHxDdESUc+dj5J3xjDtFA048j6xiqTwGINb8+GzM6CMJV9dEcC2M5XwxW7Uz0VSy+/CqsvBm89L0ElzFs5C6tb500sgdc+RHn8Mu25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07SDZXFCKqng8eoszyi1QoNcVmTC8ksAU6GAoyt/Ujg=;
 b=ZCCpTdNjbzTsjk3vJzC8TS9Ep42kORlnCRvhXvIjgPiHeVdNwxuE1iyHLTJq6+iXeCjWuW8y9gAjCf0rmKEOPv1HUc12NEwWl4tab9Y3+g5F3mil0otkIDaf4mBYkOJKxPah/4SpRviW62v7jS8BcA5kwWLpfcfOnPiOI9XnwA99AAmtspZ8/5sHBlW2+NilVQygsDoTh4DA1BPQtgD300DAWVVGzMpaX5GhFATlerAOh2dDl7I9bQNxEGknag7DX2ChY8bTSHkATpmYUwOUXhlNfVhGyc/dODMl2dICaCyPEF3w+2U46xJ+D5R6RkEw9qYYSFrAtDdw+ZM8FaG7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07SDZXFCKqng8eoszyi1QoNcVmTC8ksAU6GAoyt/Ujg=;
 b=hcE6xiNddACfigavzEEv0YsHa9UG+FoMXqXfHtYJb+h0n9+954yMWFTDY4xx2HrQ2lcV7kPGE926acfoC2v4Vgiq5RMJFNIXSyQKj/ATApSgK6mnG/S77Vrm1LyZ8ZGdN8gyGP37ilQixDpjOAtTJb+L2vHP5bcCFa3rhuqDr/7xiOrFis/b4/T3BXxZMjZ3FAAhiucsrPxkI0KHXVUBrzNlzRr+nlMv9+o53/SvX9sRf/pF2TBnHREOp3KaH0iALvNniuDkkbPwUglPzf2iD8PdtrVT+Qas0LqX7O4bR9W6UHzCSSpMyQ7kCFqHK1Oa1dwCUxAoe7LIMjyDO+V1Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7655.eurprd04.prod.outlook.com (2603:10a6:20b:292::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 19:10:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 19:10:46 +0000
Date: Mon, 23 Mar 2026 15:10:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev
Subject: Re: [PATCH 0/6] media: synopsys: Add imx93 support
Message-ID: <acGQNIUKqfh8eWNB@lizhi-Precision-Tower-5810>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
X-ClientProxiedBy: PH8PR21CA0021.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2a54d2-d9c8-40eb-8276-08de890fe334
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|19092799006|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: aWKzQwjAoQydVFkIWr/vl9nx8a30HsdzkTRmCS58p2sPSxNsEOU6aOuhxDCLt2wtYk45v1kk+6mXf/JKQZLRStiXCP0rvZNe3F4oyVPnVK5tj9w76lysH6lVxcdNAnL15MkTa0W3dKlh02VLCj5vJMEVN7FLpOd0eMb0A81ADsn/W15qvQaLonlI4vMfQ7bfvqOV8IzyaOReg8G85eO94zhJ+pMWoZWFKIUKp0h5NMyH06Gj9RPZY8hLNSO0Bpb0ch4q/Yi5Pjdr9EHcAdO5LZVMjGw08xq2KKcQZFkGASK+foX+smSIi0ENG2E/5D19bu2Kl/ac4yH31P6QRAdc8Ev/wiIJCvaAplQwGVH4DYhsb/EUTTsRkdqWuYw2ocyQcm+HGm88+DQTOcrqZ6V8mI1XOF0fNvNZ/EdYLsiAMvcXKt4GTLCJPhTGte6InKLhj+rvZKcN+rOm4rl/ysdtRO2hJXbUw/1YZKPlhresVdtEXG/RDVRVWivF4SwzF8zr872xampxB9n3uwg51lN9h1p8YTc8PM9TPBdDrHgKPKKfvBQlYyNWjNJKzIbUyUV2fE4AUM8eJYR5v3DjuDTRh2kyZW+61/zKR3YII/9On4SyQLS2AevbamV/XrEDxmhNyZWGGz3j1/obEdN+cV8NVNerESzynQEyPOTfaYdJDxcAxXiAdhhWKcll8YNi3bogEhNmIoPqLHWMgllfvd+YBEOVrSsYv00XVpnganTu5r55OrQBOXls+KHEnFLAKu0nTmzpizyNMpk8GOgkzA/K3QgKgjkTINniVAt9smzQ+hA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(19092799006)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MatWXGa48Rfu/sjHwg8Di4xGs54T6z6beFBYcwM7U0HYhXmNGl0S3S1ssiI/?=
 =?us-ascii?Q?x8wLg86MRd41iwBH8NVijYwKyOwwLAhwYrZpYjR+7O4tCR7zG+48tJFXKj1+?=
 =?us-ascii?Q?qiRvH3tjFLOdT1Y/R7MjSc8v5kMkn4+wbYxqMR6WstFEF0vUuJQqkYQmfHCQ?=
 =?us-ascii?Q?h5jfOIVhhYTiBhujMe1N0HWisTzm5mD4NXm1PprSECrKR36xjRH6J5+38JHm?=
 =?us-ascii?Q?dEMEeZoGOaLTn94Fh7MPYtHASjmZJBRSjVBD3+0x51Ui7aAh6lZEBZ2M0+4x?=
 =?us-ascii?Q?d/HQ8/rx/0aQNCS78wKm/RY696V0hUK0SoXJ4A7AsTjHH7orL7nly1eneOp9?=
 =?us-ascii?Q?wfHN0B+d6yLo9kYI2DbziNJZo/mFI2rLTnT1/OWMK6orBzlRkm6ddY62+lSE?=
 =?us-ascii?Q?+tOE4eUxssTyk/yS9p3xTNzEKVoeqI0S/5j5TDBFf37eIpFXpvM+Ev1o4qk3?=
 =?us-ascii?Q?DcV9BUhJ4OWkHyQdEvOVWCs93OmjtfBuq1pe840hcPazNU2SRk6IaGRovf5X?=
 =?us-ascii?Q?EV1D8Qpf41yF4E/spn9JWztMeTi98/DTzMKcQC2K71vRfKXXIBV3e46FNcPF?=
 =?us-ascii?Q?+MsXli/GX7NHlPsHAXcN+asyLLSQ2wUdqdtj3Fq49XVrwgRQqvsQJQnB6Z1i?=
 =?us-ascii?Q?Mm15AjvVZufUQ99SOhxDb9G5HCxHRzqtqXITWTuEz/Hm8GHTPMPMfV5tllnZ?=
 =?us-ascii?Q?FqxjVPWhJywRBsw0C8+mJ2mNGKuCy2JDNu3sdFktYSvUEX3xseCFFk/XEDZW?=
 =?us-ascii?Q?YcovuGsb1bbnXASt/zsNlJIyplFyDPxkNaTnH4j9l8glNQfl4B7BRHOAD88Q?=
 =?us-ascii?Q?+N9Fo6VQECx6aIFNgGZzg0qGjQ6Yl4UiDMePEcTsneTLTZleusCl9xPzDoLG?=
 =?us-ascii?Q?oqDU31Tw+RX+ff8SBMax1Kn7xtv9BD97x9AZvOkJsdJD78h22C5MJFrzUeyc?=
 =?us-ascii?Q?30rKOCadl6oomDqRCx81EebwfV6Uh5uVdPJQXo9y9SOM4Wq7JDZhltDcZ6Ro?=
 =?us-ascii?Q?/lHA7eGHC66l3UBx54FL9+PeT6NQq6h/yySeQ+4qeF36W2I0n26I7PkHsgjo?=
 =?us-ascii?Q?3NyOaIYXJMrj3wSbRSZyTeAbIaWHUVLVgwnG4rsbGP4f1HhpQBXo243nMfGL?=
 =?us-ascii?Q?skmSLTePRHMDOZt8uBErxDMESbuMof6sztE4E+tKqArJSLYg/3cIirnIL5jy?=
 =?us-ascii?Q?sVcShoEOG2H6BjwtBfNun1kbfJr8JSUvlsvf/EcF0EAqHH3BkxmTIaGUSy56?=
 =?us-ascii?Q?ygOQayCGloJX+QhEDjKjGqeId1lnTLzknRwGFS3NM21Ft0NBsVgRz2pXC+4S?=
 =?us-ascii?Q?ZJWnRNwhGtJK3l9xvEG9EYn0tCHGvgE3r4tiEcBdnrv/zKG2Vihtb2Sha2T9?=
 =?us-ascii?Q?/CpzEV4VCUj6fs+1VFNRunpdrAGIw/nYa+E8x64yDHo94m33QevZctIB+thS?=
 =?us-ascii?Q?4xZVrrtEmgQad8nbcFNryszaWnBpVPz5x1XNQeZF4TAso6uu6ozm03K0Gaby?=
 =?us-ascii?Q?XBAvJ/s3WH/np7EGJhsvoAGYgYZr8AjMxBzZ7Y4sl27HsFWi6ELIg4kgwy58?=
 =?us-ascii?Q?pfY9FTcxiXUDmW/kn0Ir1dJWFvAsfE6qvyO1Yzyy3yzLdNSxbVtQJyAe1P5r?=
 =?us-ascii?Q?JkfdBYCiWV+10Pk+leFy8D4RyEqJVCpfurNkB7W6J4+D91zzDKuZL46ynQlS?=
 =?us-ascii?Q?SHw/DCh30wQvGvhUj7wGbdYrq7ahRZNiRyjm4waBOXVyhOW85V0ljohnCQxQ?=
 =?us-ascii?Q?b+szubnH6g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2a54d2-d9c8-40eb-8276-08de890fe334
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 19:10:46.4651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGWUvLzPkB5xuPg13q2JWOODK/opuSzYKQaaERU+PBgSABNZdKJLDSUuBtSoHevRbR5eSBcyyW35ejCZH6wIEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_121059_281190_116E0EDB 
X-CRM114-Status: GOOD (  16.80  )
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

On Tue, Feb 10, 2026 at 12:11:07PM -0500, Frank Li wrote:
> This 3rd time try to support DW CSI2RX support for imx93.
>

Laurent Pinchart and Sakari Ailus:

	I am not who will take care this patch?
	original drivers/media/platform/synopsys/dw-mipi-csi2rx.c picked
by Sakari Ailus

Frank

> 1st: Create new dw csi2 driver
> https://lore.kernel.org/all/20250701-95_cam-v1-5-c5172bab387b@nxp.com/
>
> 2nd: Based on legacy imx6's DW CSI2 constroller.
> https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/
>
> Now rockchip create a common DW CSI2RX driver at
> drivers/media/platform/synopsys/dw-mipi-csi2rx.c
>
> This time base on rockchip's implement.
>
> i.MX93's version is newer than rockchip one. i.MX6's is more similar with
> rockchips.
>
> But i.MX6 is too old. So start at i.MX93 firstly even it has bigger
> difference.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (6):
>       media: synopsys: use devm_reset_control_get_optional_exclusive()
>       media: synopsys: only check errors from devm_clk_bulk_get_all()
>       media: synopsys: implement .get_frame_desc() callback
>       media: synopsys: use struct dw_mipi_csi2rx_regs to describe register offsets
>       media: dt-bindings: add NXP i.MX93 compatible string
>       media: synopsys: add i.MX93 support
>
>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  47 +++-
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 280 ++++++++++++++++++---
>  2 files changed, 293 insertions(+), 34 deletions(-)
> ---
> base-commit: ada3fa02f7a95623b724dfe300fce6f49cc2d75a
> change-id: 20260128-imx93-dw-csi2-b472ddcb176a
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>

