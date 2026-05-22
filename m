Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E77ACD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 18:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNEOjVzES0rYYSXyj5TslS4hE/GKLlMrmeAgorGcFeQ=; b=iTecJ4tSLB2XcFu80sT+Vxq/O+
	Ze6YCi9OZTlNL3TFbHxF3NPnbd2nqXYMbLQk/8vMG6MU16Gb+jm7FzKA/b1dw/C9Y0QByahBNcM7l
	QzIN6NUwSJ6D+VuD2IzLabr32E1bZavQWWn3ZZ4RDeiVK5DgJdHEQz27Km5Ukjuc5zm1OPaOSoFNe
	UseqYEsh+iWO/45WN/kk0wOL5nmKfL+4r3hkpL18IR/q6arPbeBDd5L9aT6jYiGS8cg8RhNFMR5QD
	zbJRxcGv4tNmu4r6UO5LFLdHu/KEPVFkpnu3H5uqeyH/AqDv8Ps9Up7JhxxaPR1rzYBsCdDJd4CcX
	Mu3/AOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUAV-0000000Bcz3-0UU3;
	Fri, 22 May 2026 18:00:19 +0000
Received: from mail-westeuropeazon11011052.outbound.protection.outlook.com ([52.101.70.52] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUAS-0000000Bcxq-2ghm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 18:00:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1q7gghJQVHdVUUKpjG4q/IxiiA+zPvDopDHWdQJTvyo5L64sDAbRhJPK0MkJCC37RYTzbGaljul89WBvnXqx87QUe26jIiJUifz47OfLK8+Mfsq5YuGQH9zRPmYe2neOb9qJHR+frEAkXJuVy3C0dwewhoKY+MtbiJTshWM3fsCYBsWeMLhocWucWvb4Ng56UemixK79kF2q+m5KbsSFZJifgtmVZsdyBEli9lXedKiQsGhoe3M8lGcH7Yf0lUwyWAr3h1cToC2bstCuQ8bUV4eauvoS2WSVf3eBEvvsnYInRg3PKiZrljm305nircrb/JOPn00gc0k3rSlCpx5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNEOjVzES0rYYSXyj5TslS4hE/GKLlMrmeAgorGcFeQ=;
 b=KXaB46KliehqraTtp3a88KA1HgZgQ6TxR3mFZt+XEiD9DKcPbJGZMKYDz+tqR9zbjq+CAb2iV/XUj0J5IDdnyq4TeasXyXda+DxNOzDHAVtLzUcjtXutKygyG4Q2Rz77aCTPV/nP3hfLtiF3fMOwRyksGMIMaAw+z+SsSOAe3zR7VtYs3rFrT9VkHN+razt2AwSzL7QccsJq22coGeDBRLZEcDpw4Ry/mXbQ72AJH1gEITYShJLFzlSkw7ofSsm8rAFxWsggvxsJbSrjqMBwT64770fdwoJaXrIj6F8Ja83ibtuFZ06SQGL1aFR4jiN2V4+bluDdRDqmcg+JM2MoIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNEOjVzES0rYYSXyj5TslS4hE/GKLlMrmeAgorGcFeQ=;
 b=BeOVLRZigmTxYV4vPH5IJiy+mh5z9C41+j3RX0s0s1jcsTIZVRWq6uocKquPQnHQ6pB63RDRBoLTVumUApDDzO/JGJG4CjraMz5qOrXSGzkje4DlvPwfLmifZVVYbjrsghNOhsBu6PlRXp7OCO3bSfU4izGo6HkpZ4GwDZOqQPg5On3vdEDP778o/wvzk1HHW47xrHHPMIzaxXbmk4rnux70pktjQ/QBCkg2cBUR3/le/LEsxiVfsI4Z6BnuKejJxZwm0kwchQ2RnSieH1Vq8XsyeSeEy1JPs2LuTwhqQLlQDqFGlH1phkDpFy07jIHqbqL6Mt9g+3IYSAuuFFMDVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9300.eurprd04.prod.outlook.com (2603:10a6:10:357::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 18:00:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 18:00:10 +0000
Date: Fri, 22 May 2026 14:00:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <ahCZonHSLyHH6q67@lizhi-Precision-Tower-5810>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522111849.783-2-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: PH8P220CA0046.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd381dd-92fa-4fcf-bca2-08deb82bf732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|22082099003|18002099003|56012099003|38350700014|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 6untASrq2si1VGch9NhSzM2FvAksYDoQ/b8RumEXx3MFlDpkXfLPp50dZiBDQPMr/zyGl/w8cTm+XXp+dLvQ36f0b0XLt/VGVQ+Au0NSUtDIw7ulUWciAo8vF3xuWC2D6avHGBCrsgcDQ8KJYUx2CC09y92GbKxLu4ygi2kLtQ5aSP7AM1p9lKeDqHEqENkvSKs10MdeuuB9MJI4yOfIJlcAg0VI/NDSOm71WeXzrPNdKJnOttU6BvfzLFljIo5bp6NhdHbkYj2WD8fRQemGVJVw2cjEnFfzcILSEr9QWWO1o8R5t5UTm3ZoFGIGXbxmcqybEOyJL1Mr4YztEJtW1VDO6MhZyuFK+2Vxxry5YWDgBKS+8TIFCqwEyINgoeiBCKd7ziDKh5/J1p/ooRli0RgGiXUwNn4/xK+zkNzehbWL9F6fQLRIWPxPY7lxjGL//KsHBcfibXAyMGwBw7MauuE462jrmUxrubAm7bAB593EQI7h7EQYcjHZhcEpxixtsYukcnZwEsBu7Sm0I1g3wDaVAicNLgbuQTrreHA+g+pBZstH0nQM6eDfA5Yry4Xj+dD/qMJaCbdW0thx5mFdWkNavDVRPYl0ohOnwLSj62rJeeNeJZzOy8rOkfy63SoJjD/C6tMvPslFn821xAfrx4LrUUyM5XCls7JK69udexlkTWCKb0bj6FC6aiDku//6P/CCeDNLTfIGkNK4uWvqt1d0ybmU4gNcIRJ7yl1neZ9XFgXqV+L7IcOewRaKbGqW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tqH1RQOkGtXdbnh6AgwmM2VdrnKP8rY43cpku7N2kAcqIEO1f8B2zN125MpX?=
 =?us-ascii?Q?xaPG2B9FiAL+lIOFSF1V2ZG3CIDd3mrqv07LfEmy+EvZx/+z0zT/UoyF5Z4y?=
 =?us-ascii?Q?Qq1HYR83dCojSIBcaRGA9NK/lnuehfn+gABDJM7G7OtHLucHGQ4Vjqa0GrkS?=
 =?us-ascii?Q?h5An2wi0sRmtQJLE5W4YmURaBpZhp5N/W/oAJaVLqMMPOAhlygWvDHp6eLWT?=
 =?us-ascii?Q?okf3DwHEalsUh+Mp1tae1MEDP2KfiwhnQ30/1oqm6wypByyhfOhYeLhIEWee?=
 =?us-ascii?Q?UqLJZvk4zJ6OLW/BiAq0ouR4yCpU+pZBw8/TaNF0j/ju/hM16lX0gbVX2ynl?=
 =?us-ascii?Q?yMcf+BLsUgpUlu6Wl4HI/TKvQQaHRLcLJjkvJTiPkvnSI10bcEhLfbhsQBS9?=
 =?us-ascii?Q?icFls9Z1PTN9YEruRwBC3QK70tIGXGjSFbJNeWQ63GZvDdEflKwKMouwSzYQ?=
 =?us-ascii?Q?fv8HPWYEyKJP5P/x6Kueav6pOEiawLOevW2z5CkGyPM7uWXLurtn/BQPSN2M?=
 =?us-ascii?Q?GhVFUE+zh3iapqC7fsvUbY45VJpprhcFDhYiH/OZJXD8UYMnhFEMDBTnf2P0?=
 =?us-ascii?Q?nJS8o+wqCvRqFsYU64/qtw4CfTUklB0/PDwFK1zDr3Ywh4XPf2+OXt+6BX93?=
 =?us-ascii?Q?H+wUS6Xw6Gblw7Hc71C8x54BS0EQjK5VXlJRUWt0UgLV8FIEfLLzl22tP3PZ?=
 =?us-ascii?Q?H9UL+k09kLXVuEGY514gwkrjsgGjNLarsNneIgBLF/gyapv/Y4dhiaw6y8zL?=
 =?us-ascii?Q?FF/d/SDqKQbHpEJMhV0xn3qxi5kesUkse14y1CbreaFoFCwZUcrMLNc+Lped?=
 =?us-ascii?Q?ymVVIMelMR8jhmdkcr0E2BrwS3d1k589ONF834IAi0GuPcwfJnB819mbJzk3?=
 =?us-ascii?Q?jGRpfnoo1mg2XXYZhhxvndq5XsWR/xTTiXjGVj4yjJi0rsnJxpzPsN+ODbF+?=
 =?us-ascii?Q?NVzMDZH25Z2mgANVV7I5M+liXM2De7OsYsUvVkOeFhJkq9YgIPl0CZEPHC+y?=
 =?us-ascii?Q?NJ70GLqzj6L7h9i0HLhpdRJoqY4E24gOs4JEFI+HxSeGzHyRJoeO1K1YgRLE?=
 =?us-ascii?Q?2pGwkAxh5x9xynlUU9Ux9aj+3rgXa4qmZJwyJvblGTwHPb5/gyygmOytfqfj?=
 =?us-ascii?Q?tNI+/NNWuhmjKbH5hzHuII70Me7+htzFD4UuojEPlhVGu+9tfNhLNdK2E+Mn?=
 =?us-ascii?Q?uWxCR8gAvbgnDQCzlGir5QK4xScwlpEP6rOpVSaby87Aof8sQJfNBkK/uE9M?=
 =?us-ascii?Q?CYQa4WVtaOs4Q+fKZD9xxUch3i62BGtt4xajrS9iAIzAL84BOF9e6fqEga/q?=
 =?us-ascii?Q?GcteXd/tZxLNTPCgLGjfrmEcKqrx/yWvpndRn/UJ+magQ4SFhRJUqwQ/peqp?=
 =?us-ascii?Q?bZ0Lge4boiTKw5S85tKvHKt0bUDFbVetdYaVX5oijJDnL9WD5hrAF9Wlshtr?=
 =?us-ascii?Q?XLxbPRWWU1Xpv7lH56o44Qr/AUj1Y72yTqbK0D/SSJRG0BmHPhvlw4tII2w1?=
 =?us-ascii?Q?uc6JPeTdCe0qaJPwd1YTeMurg8U/KUCFc0azRjJvXFTQs0zIBRr2YXi8yPx5?=
 =?us-ascii?Q?4TaYQh7W+DozMDV42dq4+iV9kL7GMHoApnrzyxGJqFd7raOrqVwEUSqZWZhT?=
 =?us-ascii?Q?2YQRV/MO7prm98LDFNyiPrRIIGFaAJfKwHd6AJlNhnobnFzWRlIBGIeMtzFm?=
 =?us-ascii?Q?1qmTrNdRJISl/xmpwYIQEyakU/xRAnOVxcyoYlNP3QgZZzZ5bjuaXSkRecP3?=
 =?us-ascii?Q?eEszuBuQ7w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd381dd-92fa-4fcf-bca2-08deb82bf732
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 18:00:10.4934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXi40ugmZVtf+bHDeIRcpRdjYshDr7EaXxBx3dbKTYRfdUtmabMZHPkaXvqhoDjn2scZAAt3ZKgDn7OAo1Vl+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_110016_689930_1F2C90E8 
X-CRM114-Status: GOOD (  15.21  )
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

On Fri, May 22, 2026 at 04:18:45AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Document the optional "memory-region-names" property.

Need add reason why need memory-region-names.

Try to fix previous use undocument ABI method, which depend memory node
name. But now prefer use morden memory-region-names to fetch related
resource.

you can rephrase it.

Frank

>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml     | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..6679b10f9da5 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -62,6 +62,14 @@ properties:
>      minItems: 1
>      maxItems: 32
>
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 32
> +    items:
> +      oneOf:
> +        - const: rsc-table
> +        - pattern: '^vdev[0-9](buffer|vring[0-9])$'
> +
>    power-domains:
>      minItems: 2
>      maxItems: 8
> --
> 2.43.0
>

