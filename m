Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BCCC44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVMK55xDG6B3zAQsQTMbDzUHCdtkVL0JfcOKf5RzWhk=; b=lMCi8wCnTYb+eGCHXJJ5wW4Mrw
	8RH1tVmyuoQLl44eG2/Oolzq5eZJX9JLEMg/3K/2uaGlxL+i3UuZ4NeO5oIkY9K0uNi4Yqhee2vNf
	C76P3Pva8Z4brcOuocTAG9Wv8V3yGrm1r4an/NZ0AHKA03TgSH88MT+3UeLEbA5YBt8aGWBoW0B8E
	3B/6kYP71C3O7K0UJQT4b8otVvk8m8R+um18AIAxZyejKAvuZQf5QWz0Gt/HomESXQlYkxw07hgSx
	3SEjGY3HVrmceo+j73tWQcI7vsTLyHrYU2W3TXjBEWm3HmtxBgiWKplMBMRBe7E+Pjo6XALOwURdy
	hu3ri+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUhZ-0000000Bbl5-1fga;
	Wed, 22 Jul 2026 11:01:25 +0000
Received: from mail-westeuropeazon11010035.outbound.protection.outlook.com ([52.101.69.35] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUhX-0000000BbkF-21P7;
	Wed, 22 Jul 2026 11:01:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/SwW2TRg4R9d8wzAvRo++VQ8QjihDBEefCLWeMiDCCQ+t1hxcgH9BFOE3RbvtP1KW6wqRkiIoj0xQwbfuvyW3qkgzAfP/ZtVMJWyD3t7uncOyY0O/a1YKZAR9EjfRoSgDoxPVojtX1HoJ/mIR0QqUylKs9C4kyixPWMjRE1xxuX7KXn/f395IICkgTYev6yEEJpFsft5MYtH/+EcKrcOVkTsVVA8aDEjNfuZlGCvxX3ffQunl6u3vWtnpFKxVDyl2Vhv9ykvNT1Uqvsc1eHWqVl1Ob4v/Vrg5SyFZSDORGWdFJfoccp43IX47q3JWznyVf7phgToEX92kvA+UWCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVMK55xDG6B3zAQsQTMbDzUHCdtkVL0JfcOKf5RzWhk=;
 b=W1xmZDkmy8j67iRDxxsOgM+hS0b4uow9EsR3tj1CECZ3lrxH8IyRq0XH+2wjnX7VCXpz7B8bPuLMVrRsp9V65tkuhgGh+JkzaDNvEhLZrmltthCOTg+eeA7YpSjM7S2w/CpLKoi8gHzXc09T1vlf4C4zfb9kLSQxymF9LKuTWfwxQkQdOPGhXuzHXpGiW3Mjs6ZZ/RC7fXaMBcLBSaX8RJBZc+A8Va5DvuCpgn+Cz7g+eH5Yeh0VhkGlhGHcq3hAaabPtsDyN/WCAp0UyaSSorPvqCK6MTkSN4KKfiyPfUWzvDxwhD8fAUcEW2/94g3nnorT25MIZ2UCxrFz9cjchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVMK55xDG6B3zAQsQTMbDzUHCdtkVL0JfcOKf5RzWhk=;
 b=OL4Fjnxl6Xed7JK2NKozlSckAOBj9GS1VZW7bBYEw7Rxr9xC0r5lZQFMoKVZ53FWWE/q0YK9s6UhwfiBm9gWa76f7D5RQluFfRb99jL0VOA//s5f6ClGwgwAYjLWNslC+55Lo+12ouayN3l7MbVwOu2BB0VkxzyN3IqY7nEU5i6y6jvLL4ITrs/wnOEdeQ4UFPknE1/T40vDSsh9eWN/IiJaq0RLa42WpXN3ezhAheCBj4uokd8kYMcXmjTlwQp0O+zJylysTWkWCOch1lrandOlXJX/+M011Fkm8vAMOWPLFGdRmGtXvLSvOlWpGpMopV8ZeThxfUmzICUeGwg/iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by VI0PR04MB10805.eurprd04.prod.outlook.com
 (2603:10a6:800:25f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 11:01:18 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 11:01:16 +0000
Date: Wed, 22 Jul 2026 14:01:12 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Tanjeff Moos <tanjeff.moos@westermo.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 phy-next 8/9] soc: fsl: guts: implement the RCW
 override procedure
Message-ID: <xumth3wb3bvui6ywrithgazf6fombn42hisikprtywkbuexypn@kugdqyce226c>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
 <20260721231603.67865-9-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721231603.67865-9-vladimir.oltean@nxp.com>
X-ClientProxiedBy: FR4P281CA0398.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::16) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|VI0PR04MB10805:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ac55c5-a0cc-4f4b-031f-08dee7e08d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|7416014|376014|18002099003|22082099003|4143699003|3023799007|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: gPhVywYvXAD6cxc/nEnVAwOIneunXOWblsvzWXrgxIigLsyTmVs+Pcde2Q1LxZ8wbo3v8UX125tZg95i7HRibOxt7iSPqtssAaFsEGF5ns5+URsHnXyZacmtuzaiCyW+nu6OTJHDs20fXgEdT5F/j+iuTgN6Q2sRl9lOjVJaL2ZTj2GkdItE3l26zx6wWShYzl1VYNSs2ZU7ce5TgoAQdxpaXkjhVT/XdcPDBugNc9Op+Yld1ts7r4zwPxEfq0ogQG4ZU6GZ36oNBE1DxTowMYDa+RF2JiHDZ2WlUQCa4p0rFe9N03w6KbXcqYQf4WloNnyxY1cfQFrYRvXoWm8i1X4c6wTpqRJ3qwBMW6DwW4LfkP93CH5UVrDmBIE7LVxQdHLO0eo74im9wOnz6a4wOUZnn+nHlxGYWyqV3u/B3mkAzENL2zkzz5jUG2vP9UjJ9vN2LNdVQml3PwKr1SJaY8pwWuebFfGyh80DR6JWs60j0r5XODBwyeSGp5vVdcMVyN+tYGAQw/P6OJHejI/akuIl7AV16fiM4KkDWCjghOPNhekzNWRY2P5e+niXWeQtTCQ4/ebAC6LJajiOLDqvfwHWY/bzQlDuQhPnOARkIrzgH/wd0yQgKDIQpbTuOscfprVd8eWEkl80HvBuHMnYGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(7416014)(376014)(18002099003)(22082099003)(4143699003)(3023799007)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1i5me2SzcPvYHupJr5lL7hv7F+asRuH8H/zUJWxna7FIaw0sRcBEsSy0t28N?=
 =?us-ascii?Q?hZsb75u3kXNrq5rAxSWEVFQmqsrMjv6tJoQm4b8FeNsS+rp26HhmqMlVXc0C?=
 =?us-ascii?Q?3X63xa6oWAMv3B4mpPJX4fjPG0grd19SabfxPVL0+5xNEs+nNHjN3XUdEXy5?=
 =?us-ascii?Q?r7CVeEOBVedwVb/lbyRVklVFWAXENOmaBmJ0S4bixvbzHQAqEBvbXJWM0fqe?=
 =?us-ascii?Q?xzVJEck3rJPkiFeAYHkuNHthHw/Gnddfm6ExxUaPTOsw0/PHbWQiKmUY8eoW?=
 =?us-ascii?Q?H9SNj1Xkosms/s3OD3slmehN0MqW+e96wPmPXYqvzVxlKdSvQv2JbZQ7XvgU?=
 =?us-ascii?Q?L4GC0+3059bCm6Tj6VDodnFBsCUl/tMrk1wHUg6Mn6bXMYD2s+dZo9OVGiEi?=
 =?us-ascii?Q?fVCpicI3myiwoKuj/OA+ruMDjJBLgmHLAPxaPX5udP3KyO72NDDGbwb9tYTP?=
 =?us-ascii?Q?BSpR2KoTkXqIDE8TKHhOAY5hGzci2S+dRcyc/C0xcjpLkqIi9TN1t3cgXvZl?=
 =?us-ascii?Q?0LKeuIopB2CbdDcgx0eluU7/Y9JOQn31E4RiQQ1ysdFdfE+I9C0E9CcpWi8W?=
 =?us-ascii?Q?NN3YyvmRh1ItK0k3hgVCAKUwYPmc718gC3kwUs0PvjS2NOqy0IUoPj/nGUf1?=
 =?us-ascii?Q?0tghR6C1WFpaDCYerPNrnpp+YxWj8XmRWxWqM8C+72qqdnwsTi6M0guuLvuX?=
 =?us-ascii?Q?Xch0FdSa0ClxEOYlcYjXFbwGxno9S9UpoTHnwAEHgl5LYal8WsCXY8yhRlV9?=
 =?us-ascii?Q?ceShFol1Z6jX9gdzXEkgqe5Mr46CEve1U4XCZdCx8fuGahecXkQ9e08b9rzw?=
 =?us-ascii?Q?44FDU4uERf6JBDCL1DecCViyfo9jvMfAlqe8kAuiRZQr5QDrTAHhc3vsznly?=
 =?us-ascii?Q?A9gtJulSoNzhEuYfjZVkHbZP7Do83821vvmT8VfC/gJkoRrx2PQ9KWnAfqCo?=
 =?us-ascii?Q?vQ5j3n9bIIp2lIoUXc2+U0T1IdtVyQ8TtFeXa3AqQllvwAjab4in9JPOjZ8Q?=
 =?us-ascii?Q?tMgYyxwP112x2RXv7TyNuV+IqtEIVdrh/R/yfaVl59FMiZMtZ1TwZtAmP1bw?=
 =?us-ascii?Q?6iKzAlhmgdeZ4vcKeL4bhBB0Yr4twobZQTp/2BjZiDOULlUhUXrxxZ5fEgE/?=
 =?us-ascii?Q?3sGP2RLpnkJql7dFKiT1payYvUh8ttarx6RQ9yCuoqq4TIcVLP2snfkLs37x?=
 =?us-ascii?Q?1RdaBgDQ8uXOCJMLmuluNPKKklGUJgPwVW2ZaVth3uibtd5QvBajYj+tS5KH?=
 =?us-ascii?Q?mYKJcn3YSdFxluD+5xGE9J6S7vqUue1blWVsQlYZ9G57Iznsxf9X2wLlq7Ki?=
 =?us-ascii?Q?a6UhELgsbB3LtvCIGtK40P6tMqxXxRHkspKQ57a2f0JbP8zVA2XkeikqgPKk?=
 =?us-ascii?Q?DD86wSuRyHeFfxmddsHOBbzSCvbSPr6NBfR6IolrcVnoxDZsftxIduNHmI29?=
 =?us-ascii?Q?nI+KhbORfmWvvZ7tAWMsFC3+sqGhdMRjLmQ3fijOFs9TkwueIAI01OKRrsHW?=
 =?us-ascii?Q?gzzvjO9U3+uodHyWXnWAtP4YoMw5H/G8wij99TH2PnMqAXf6YI+u4oNpqQGj?=
 =?us-ascii?Q?LQSPFrD+i6T5/9zA5+3zLe+XUvn7IjgM975m4GOSWjk7v9HIokHAbOUQZkH/?=
 =?us-ascii?Q?drpHss8Hf2ZUDatPljWf8AUDO/GXRR0xtDdvofEusQUZFN5xhG4zj+E2YMyB?=
 =?us-ascii?Q?eTInKlIaqzZGK+rap5mIIrhBoReM3ObOrjHuFlzu9LoNvMAwng+6snTMo3AJ?=
 =?us-ascii?Q?V3ifIL9tqw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ac55c5-a0cc-4f4b-031f-08dee7e08d5e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:01:16.4864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1i7dCdyiGJ+Qxw/f+Xv8fFr4Oo6m9qilIi4vWB2xVHcyQO4Q0L7SuBdkwm9HdrJ8JFTfRFvRaebq+8TKW5VF9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10805
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_040123_538549_08B032B5 
X-CRM114-Status: GOOD (  17.20  )
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

On Wed, Jul 22, 2026 at 02:16:02AM +0300, Vladimir Oltean wrote:
> Add support for the RCW override procedure which enables runtime
> reconfiguration of the protocol running on a SerDes lane. The procedure
> is done through the DCFG DCSR space which now can be defined as the
> second memory region of the guts DT node.
> Support is added on the following SoCs: LS1046A, LS1088A, LS2088A.
> 
> The procedure is exported to the "client" driver - the Lynx10G SerDes
> PHY driver - through the following functions:
> - fsl_guts_lane_validate() used to validate that changing the protocol
>   on a specific lane is supported.
> - fsl_guts_lane_set_mode() which can be used to request the RCW
>   procedure be executed for a specific lane.
> 
> Since the RCW override procedure is different depending on the SoC, the
> private fsl_soc_data structure is updated with two new per SoC callbacks
> (.serdes_get_rcw_override() and .serdes_init_rcwcr()) which get used
> from the generic fsl_guts_lane_set_mode() function. These two callbacks
> hide all the SoC specific register offsets, masks and values so that the
> _set_mode() procedure is straightforward.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>

