Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53965CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4qCSkLgehKWlNjuRgLdH18rb4tEJqKMKMK52/sGF8g=; b=NhMlkB/KFWLSSNnrxvQvZ0eMZi
	cTzsyhlgmIMwHR5iiyLzgqx+f4MV455xbnYJAHz2dZcFBLW/ydwFVjS/2Tq8qZ7vzOuJ2YBi5E7zw
	1amCbrfP4ryKiE6KQJSBW1Rl6kRmlK2nSUSvEXABLAsR33qKcbwlrEMYeC3XNkR9hooqIcrMVavPU
	v37wm/0NNTA1oHQd3tA1SwGg1Mm48cmi25fqFoJjqhLZPhWWzWFvYlrtiQ8nUa7D2sFPkQ1a//eTC
	RV3DASDjDH/DlXMor3Vdcq0BktWJ06xLVMmOQAxb8KxKl3kcZeifSAspWh2vQQ0qZrBfNu61Unplh
	oy+k0TPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHni-00000000g4n-0M0V;
	Thu, 18 Sep 2025 16:48:06 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHnf-00000000g4G-35gf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:48:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/YoJQ9Y3MQ/rCZtBAHQYdi+eDbUMrxsEHOQ5u50er5psdjkAoO9zBnEZy7xah6xBqMGLN2P5eX1EovnmP4BAti6ORkC63Q+UvDTwJ5RwAEA9lnN5QzJ+qI62FZK1t+Xx+bTypvBsn5iMFnAiqlzHMs9a7ub2v6DI8WLCFOskH/E48mcdHI5lymqn9FDMxJ4WOWgqAFpSdaTGAQqXb6xOKAW04qJ4Fx7YUDJC4wfbYCsCvbwgCD7oO5CVTrqrKvEKTzudOpos8HUdFRQG5fxz2Udu1hY5YG/lTV4B93SVODZhfwU5QKx6m946kgDvJ00NYO9pG6mxGNTDe5+vgcYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4qCSkLgehKWlNjuRgLdH18rb4tEJqKMKMK52/sGF8g=;
 b=dnwuxBRiWuzuYDHFXgMuzCpLdou07BlR4JgUDa8MoFlnXIXc5urN78t8tw6oLjOUedu4+zyxVhH9ljOGenT1NHqAFGUFfmltaGgoRZFCQDVMGXPMCVMmPoBB4b4GuyqyGA/PixTzM9yBRtzPZzyYFKuXaTkOJOzaH26xH8T6byLzSYsTIplwDv7ThpZSdA8gRYR33urtOL4613R5ll6BITK/pnHl7I9eteVPsvqsdL77CE/zPQg22s2JOVPdptiIbG2MU91OhM19cBsKLllowmelN8Y0DmFdp9nDksN3HiAmE1VAoeewDlPdsSeG8Dp0I9MNSiWC0aOb0dgC2Rf9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4qCSkLgehKWlNjuRgLdH18rb4tEJqKMKMK52/sGF8g=;
 b=e9YuBALLzCZApMa16yz94NRb+lP3yjbY6G4/XNTnoL1hiZs0CryKJhL2180VVJRVLemgHpln+Xso/HZHTTgRtcKhNBetU1IVGzBE5CCArYfIizH+73gPMq8kIvNatYZUdKkU8Msh5AnYE/ZwQS5r7ekJ47PbZZrHU/anhWOnVNT1vkc22LzgD/JcOo7WPfa4sdxsTCAKpQeig4EcLqlKq0JtIDfv6Reie+ieeT6IfRPLOWxIKR+xY65dHV30vOv1CXN1FwYemXb6GLgkVjOcKQNsgjGdu80KqSCYOWKhYh+9DlVEffQSnW/urMJ5ahHT9t+6LxLeKLX3XSzAjRH6cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by VI2PR04MB10089.eurprd04.prod.outlook.com (2603:10a6:800:227::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 16:47:59 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 16:47:59 +0000
Date: Thu, 18 Sep 2025 12:47:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Mathew McBride <matt@traverse.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: embedded-controller: add Traverse
 Ten64 board controller
Message-ID: <aMw3t691HHwCQc+g@lizhi-Precision-Tower-5810>
References: <20250918061441.5488-1-matt@traverse.com.au>
 <20250918061441.5488-2-matt@traverse.com.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918061441.5488-2-matt@traverse.com.au>
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|VI2PR04MB10089:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e962e72-9b66-4c05-d2d3-08ddf6d31fc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|19092799006|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R4CQc1UVE2G4Jmgt93bvtgHQmEZ/uWIdVeLTBI3xeuGNPcBSROv3fqclb1qB?=
 =?us-ascii?Q?G3CI+QfPO8MWr4DQVAkWo9/x9I0WQpdv0DzFOizdfUu5YbX4qrXycRLNcdHD?=
 =?us-ascii?Q?wqmCt4+wbfCRwPh4Hv4ubns0ePlocImvBTVwX4fhbBKfsuhYc2awJU1CXls+?=
 =?us-ascii?Q?mCMRUZCc1TuMRbDgPAX4tM9YzjksyqJoYMIXgPbC4Q7RP21Ek615UjEofGUw?=
 =?us-ascii?Q?PcDVdl6wzIAyk5RhvvRQS9WzpMro6w0ZXNOoOflabhmd8C6opRfM/1OOTl1V?=
 =?us-ascii?Q?PQu0viKC8FEbgjTP2dR5Mg5IbxPysObxGdIG6htEYmk1sE2s4CFd66WV3xy+?=
 =?us-ascii?Q?fR8yjoHvjhLp8ULKFUnpLkfCcH3cyb7ynoad5uaGaKpZj+dB0N43HTlMtHtB?=
 =?us-ascii?Q?XiY3VCUt+UTJRatJLZo4Jxh3fjj2xB2LLHF5yVNFfeUJ7XteS+J599FX6Us8?=
 =?us-ascii?Q?9hxKmo40GQlVSypjqzqYyjfXkHgVx+nojNYlK4UbHz0WEk+A2mgjkrB9ZK8b?=
 =?us-ascii?Q?t7iZK+jePe7YeBFuzuLXLZOr5GfcPWdRArm6tsYb14EKp4MQnwOgjmZtXtac?=
 =?us-ascii?Q?Hwtrt91H9QII4RbSt0A1gVOMSuwxJGnk7iADHsHQBKEfxqVJqGv4ZkWrHJH+?=
 =?us-ascii?Q?C3W9WS25DYmaVF7CiWnOS5ZNCc13OaltTJUTKpOTORqnE6yzeF2+flz0kkfF?=
 =?us-ascii?Q?i2ED1ZNvVed0iIp1Qj++Zewjz34eTe7LbnjRBVczpPro9qAKkWgUlGAHaGvi?=
 =?us-ascii?Q?6sgk33U80weNqt0pekjdynLhe51EhOBrOxzCem4XyFCV2PiDmUqLscOiih52?=
 =?us-ascii?Q?l6yoxNmNopvumRTaWeKM7Dt4N8aQIC1SnbZ7iV5v5/BdKy8kb84xE2yEwgje?=
 =?us-ascii?Q?nMbMYwhAL0moGm/K2UGH9UtZp7473b3rYfUvuyD1sVkzg7s6MDNW+PZFIeob?=
 =?us-ascii?Q?w/+f+dF859mrKcI49npyNpKf/nHdtowENZR835+nwRLY03o/7L5W7L7ejw2O?=
 =?us-ascii?Q?tGTAZ3eBDxT0yU8rprIs/hHHjQTUzdJqdVdWG9c6MjgvlVURUvG9Fj2pMBuF?=
 =?us-ascii?Q?iu9jx/FF2hKe8mO7oCE6CZKbcH/tq3C9eYpR4/Rkx5JKPY02bzy8N7EAX00l?=
 =?us-ascii?Q?WlgBRzDzlszbeQhrrKpW/e/tORXLQRY3JpvYrBJh505UjSG+p8Lp6xr6RleW?=
 =?us-ascii?Q?GZIGsAelmxWSyCWmuqP73SmMcydNcRhm90JTQd2SEdwh4lEW2CftIvyzbFVL?=
 =?us-ascii?Q?OgQQa7b3WbX+5tlhW9Sx9qN3X6lAZS3IwSKfRiYjM17EgU4uwWFmLdwjiukn?=
 =?us-ascii?Q?LGqdGxM/OCZi9SZqd25ksAjzcUrpAkoI0z6ER5kWQUFTBR9VqI4TXNL7d7oJ?=
 =?us-ascii?Q?jfujXZKD21kj3AbzFhV5YbaCke+aqA9Wj7ZBkZHjd1Ho7Zt/qnRkljtK8TnG?=
 =?us-ascii?Q?nYyLrAYVwteKclJ7gz6kDzNnYqfM+wsn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(19092799006)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vvDTP9vD4pL1iLyqhrRsIIaz0thEAw/TOmTnAbagJEAoZDaBOS4s+pGXDvnH?=
 =?us-ascii?Q?03K68p+d4yu0PqeDbDARmL3GkzdHkKB7pRaIC2iZa4XDJrpVBy09lxtMk6I9?=
 =?us-ascii?Q?TvCZIs9v8Rdv9VkaleOQAggJZuJjhju+/pKtOotRDMLCdLilCuCwqvrh529W?=
 =?us-ascii?Q?QYGHR7CraQbMTg/jXlRjWcA6TEQYa4l8lhZaD9ZERILS3TBksoP0/9EQwfji?=
 =?us-ascii?Q?KS/DlUpBDQzDvbTUAWu1SgLcM1sWwNKQy/4g3N3NiMcioiTyAPcn2eMebZz9?=
 =?us-ascii?Q?4Qfp9Cd+WudjRG3UmTnmQe8ybayb9Y+QTJFyP384Jky+d6lSunXLq+uDDuAn?=
 =?us-ascii?Q?m8lQ4bTBSur4TbFuhoGiXxPWrg9ksphnZMzwWinfhstLCyuDv8kzETFqMjKS?=
 =?us-ascii?Q?1rZ3sIskEAOn2bno+UqirI2/uc/6lI432SF6BuYpfHc803g54vcr2MEAY32B?=
 =?us-ascii?Q?S9GVZ6xD2aOXid5UCCy7UmCyH3npoh2AKy1K1JE0WDBgSWr8QxzCOnPUSRzm?=
 =?us-ascii?Q?2pAD1Lo3dciCPNAIW2h5I4pV6zZiWmE1ZAefe8gC4Xo94sKQOrwQRTTnlTjj?=
 =?us-ascii?Q?FO3f6wMtqlPgiZw27cb98oRqnWFXNpv8x12ixplWoaD1b5qCR6LDMlv7lz8d?=
 =?us-ascii?Q?vuO6YagFhXNRHoFNCrotROWWo2rPUl324Gtmqx6QmXL05myiTC5XFmkYMCfW?=
 =?us-ascii?Q?YizzUlGcGqRCJXVtNXq9ygi+yMzJRg1bYBTzoS4MExL8nk8mZD9oQodaTrIT?=
 =?us-ascii?Q?LfQGmpZbQW/8otuIJI3sg4zz+IS9TBR9bedfIGeRuU9paCft5rVMBzjal8Tk?=
 =?us-ascii?Q?P47YUrPuc4RPwtYW+ti0oYvRt++0zKSmpMHMQMhUvBiJdPhM5wLepP73CTqk?=
 =?us-ascii?Q?OmuBL0cT2kIPUJFD5wD62FSrJcdQ68VBNWpsXpQlKhool48sOXIiJPNGSZH9?=
 =?us-ascii?Q?tJHkRtoOZbNlhlGQL5nK47kDBpsFd60HgrkR+3zK9odTaLkffpWuSORUvKUb?=
 =?us-ascii?Q?r0fxRC3zekm6e2mUtivJVEh8xZ6NGUqTkSmxpraJByr++FISd7XmHSMaUvrA?=
 =?us-ascii?Q?Vu1V/JyVldak8YeI7PLt6clf7+2wPYru1DsovQNaIKaHuhbFsk8OkKGEa13h?=
 =?us-ascii?Q?kHJstTM6gjBKKJn4n/8rDQ6t6TLinRBCbsCR7lwHGkEeQYr76aScePnVKUvw?=
 =?us-ascii?Q?ZwoYldDG+7llQOP+GhERG+Yypt+JGO8SNDZr1bkQREEtgd2lHA5g3opTvjgZ?=
 =?us-ascii?Q?h4KauYGD/J7enEnJlAXJYBzc9/ibFmHLRSKfWC5KINwjDwkkfgZkyJbXy24L?=
 =?us-ascii?Q?zWzdBH+4YvcRSCpPwsfPqvdH1xI8RfAZVC7xw4pE5ICpmhk2/5mGliMGOWh9?=
 =?us-ascii?Q?vS7LK4hNtYbq7buOZQQ25eJfQ92jn+kEB7cJsjYAlG/Hg5vL+IRVIOF42K6T?=
 =?us-ascii?Q?jLIK2qdUGDG+rZ2TIQTQffToLFIQ4xMUjugo5viOlW1rcIkbjeOpv0IGXazA?=
 =?us-ascii?Q?8ktIrUygyikW36u/kDFVIFMeyNMG7KuzOq2SjijXaMxzXCih8A0jCF5DIKmM?=
 =?us-ascii?Q?+ZTuuDD2aaAUYfD1Sx7C8yuDyDexg0r5LBCEcrQW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e962e72-9b66-4c05-d2d3-08ddf6d31fc3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 16:47:59.0056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHdTnKnF3kDynRYwUPAn2hHY0WlhH4jWRlV8PwO6VBj3ua/1eXv7vlZXo2PJ39dzRACKjGL9pqYcRBBF98XIJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_094803_779674_541B6F3D 
X-CRM114-Status: GOOD (  24.53  )
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

On Thu, Sep 18, 2025 at 04:14:40PM +1000, Mathew McBride wrote:
> Add device tree binding for the board (micro)controller on Ten64 family
> boards[1].
>
> The schema is simple and is (presently) only consumed by U-Boot, but it
> is possible nvmem, watchdog and other features could be described in
> the future, as well as extension to future Traverse boards.
>
> [1] https://ten64doc.traverse.com.au/hardware/microcontroller/
>
> Signed-off-by: Mathew McBride <matt@traverse.com.au>
> ---
> Changes from v3:
> - 'reg' property was changed to a constant (instead of array/maxItems:1),
>   reflecting that the I2C endpoint is on a fixed address which cannot be
>   changed.
> - Redundant paragraph describing functionality of the device removed
>
> Due to these small, but substantive changes, I have not carried the
> Reviewed-By: tag given to v3.
>
>  .../traverse,ten64-controller.yaml            | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/embedded-controller/traverse,ten64-controller.yaml
>
> diff --git a/Documentation/devicetree/bindings/embedded-controller/traverse,ten64-controller.yaml b/Documentation/devicetree/bindings/embedded-controller/traverse,ten64-controller.yaml
> new file mode 100644
> index 0000000000000..08d02c4df8732
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/traverse,ten64-controller.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/embedded-controller/traverse,ten64-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Traverse Ten64 board microcontroller
> +
> +maintainers:
> +  - Mathew McBride <matt@traverse.com.au>
> +
> +description: |

needn't |

> +  The board microcontroller on the Ten64 board family is responsible for
> +  management of power sources on the board, as well as signalling the SoC
> +  to power on and reset.
> +
> +properties:
> +  compatible:
> +    const: traverse,ten64-controller
> +
> +  reg:
> +    const: 0x7e
> +

only have reg properties,  can you put to
Documentation/devicetree/bindings/trivial-devices.yaml

Frank

> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        board-controller@7e {
> +            compatible = "traverse,ten64-controller";
> +            reg = <0x7e>;
> +        };
> +    };
> --
> 2.45.1
>

