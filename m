Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272C9CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56Trww10RjbA3TRhWEMmNfR3bXg1NvARVJXeIw4Nk3s=; b=eiuq3fb4YaezV5vth6DDT0wjeh
	CtuHrtyqz3EtyGBHC03lgBvW9w4yDKdtgdPwfoKaJ3WUjVCqRwKE+UoHwFi8c/WfTAfi+4a/uhuhG
	m5uwXvlPeq+tB7RuPs1GZBrkXigdRVhTtT+z9EFBwvPpm7e0vlCzPecWAOFPoFymQqcx8QL6SQKjT
	kYNndRQu4sKM/EFFwHZrYGJo1JLM8+pZbI6yuosRKX0telPY1xoDnza3bzJAuKA5f1CrITh8KaOQ6
	fMBgR7+UVPAirSgw26nX0fP+YGXCw4US7ujt7UzAw2D/nIDpklRkgNLm+ybczulL1CN7j8W7yyeqx
	/EzazvMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8mS-0000000ESTf-1JsH;
	Mon, 15 Jun 2026 14:59:16 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8mP-0000000ESTM-2HXv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 14:59:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNxXvE9YxIXmigMvFgP4vapVWNRcujQIjvHx+4ilZR5M0gFj5SDVlE8u6wqmWB1/xF/SJ6Cxk2IF6x9oEVO7EzGl+TG0iUzJCGIaFn5KVzmBPlWrNRSaQvQqbO+NPPI5OLp+0YKBxmvgNrniLCccT6cu7Te5Fsj8NEgjUXThvCOMZYbsABcJ2JPxI2ea8lEaA7L3BbSTNfLnT/4B6AMHwhOuwa0GsHlyooGwO0a2EvRN4hinyik4z9VODClcFO0oUu3rbRzh+ydfdQ1Yi4CwlYpM9MzMIOoDK5lSfzof6a/o+paWKe+jIfpRd/NtHmDXh04sC/nbbwp6UCjF455RJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56Trww10RjbA3TRhWEMmNfR3bXg1NvARVJXeIw4Nk3s=;
 b=y69LQLUFRVa4C78aGyczjvo+Gw9E98e1dlMMYGmqMJc1kgvaZY62RL7YPVtmhWVFDDYw0lfIo7ZHvY58WIc3zWGWc03NULLZ9VqZfjHtUFzxn/LLrbAhgSEwfNp8nIUPR6rSRKdDQVTnDJp56knQiUjNw0LdHIJ9EH30fcZ1f9qL9b4CoxEHldO28Y4Afv0f9qV+M7rmDcj+UzA6OdroC+xjDUjAo49VGg0f6gGF/uHaAQ8zwvdTdD8LIVMtZXbHZv8Jet07+jnG2LSwdD4C1eBktXMiB1UzFvo+fpbtCd4h1bO6jO994VcI/I2g4vIZraF+vnbEEzHyfVt/54lP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56Trww10RjbA3TRhWEMmNfR3bXg1NvARVJXeIw4Nk3s=;
 b=xL8IszGFwWR0FhQ5BDAprmjwNhVKzg/4irXWEYvxdAwahav6p/UDR7Di+tg3TXgXHRfAMVK4oY0O+TgBZ7/FNfBLO/UDmzEoJPOK19SkNx9d1qqkj9hwi7FPyYX0LbXAs2kEMXqKykUkx3KZCnvM/c0drlEfQrxCGW/HqNWxnbrWE9kH32b+jSkCWHn8BGqUwn4eq1MO5BBL3xJYH39h1QBa+QIVvfDwCVFMIZTRCHrx4eWkJlJPJ+CbfBm0JYBrndzvQk+sVpx0EpGnwKX6ukTSlayRgRw4yYgX26mtYtxh2buyTxwjkN1544B8gMsgzDk5BohZEvAkghKCP94bfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB9128.eurprd04.prod.outlook.com (2603:10a6:20b:44b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 14:59:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 14:59:07 +0000
Date: Mon, 15 Jun 2026 09:58:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Ying Liu <victor.liu@nxp.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v9 5/9] drm/imx: Add support for i.MX94 DCIF
Message-ID: <ajATLz4QbgfyZeSa@SMW015318>
References: <20260612-dcif-upstreaming-v9-0-8d0ff89aa3c5@oss.nxp.com>
 <20260612-dcif-upstreaming-v9-5-8d0ff89aa3c5@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-dcif-upstreaming-v9-5-8d0ff89aa3c5@oss.nxp.com>
X-ClientProxiedBy: SA1P222CA0080.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e1eb9d-f947-4e0e-4fd2-08decaeea592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|23010399003|3023799007|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: w47QeT2260GbTPsD7MApwDsazH9drhj5hEd53Cgg/fYldgrakSxwaGlTy+FS4NybKpgGl8cBXH7otBhpI4VWMUKKtb1Sg0jAtDmwOf+55KRDuswv0fQ97aTdTxXJv/9hvmV3/THcTGCNH1VGrgN9h3NW1fegMGzoHGFINsrfCPzb6t1H7coS0zNf4nGaxHVMA26/5I9dJP04MFKtpMKuDihxKHI7peNijjO8OYX0Qmsc9MIm8P57nszFBfhY8t5wRJ/oF8XEvDrhLzCl5Zdb2pGS+VkAGIkb5nVQo1Un2nrec5yIYxYO3Vk4fDgYmuUWBtnrDj77nj5Fw0rWaIUXjOUpfj8ZqSaoTC9LwuPPxmEIXLNeh4vynaWu4gAZqZsd4+7GJuI7bX6cvW/lfLgY52J99shfzSdvc/VFxv7NWnUNXJ6RkkzusubypqdqVzpRiDtfWPxU4c+NL4P0s8yGFk+3dw3vkh5ASr8TSr06m6WASGQQpQBllXQc3a8a2yFyW62SwaYVq5JGwDw8RfpS9kipX8TlqSpFx7Fm5ZP6UUgc+FitMWLdju3AUoQCQAS+Lvy6tQAFPHCICumtZsqi6duy/fO3fLqdMepDGeSnKWsgBCIuMEH5roLxvQFWFfVCIDGxZcbBdMBCm0an7XMNhcY7ky748hjPFdmoZA9ZjzSYWwBNFz4sYg9eJS2uYoBv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(23010399003)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ay4DDUfLndYkJ4bqgqtk8zw+bSxvI9PdvZzkKmIgm4cx1fcgYEWLBOk8RrSy?=
 =?us-ascii?Q?7UkQfrposupxcF52aIUr7MC+jcquAPEXilTnjjz8/MLZPu5QINrMSP13HwaY?=
 =?us-ascii?Q?EQT8FEKUBF+gmhr6Zfiq2TOvPMyPFUYaIHj0lBwNhcUxHpftfwpkUSeiotGW?=
 =?us-ascii?Q?FidFHTrJzIbd27kFllv21+KQOlilLF/Xdl5BeuzDTuHSfwd6aM5pHFgAEIiU?=
 =?us-ascii?Q?6FEa7IJhTpyXqAtmNTHDlT43JH2QFJjt4ga13UBrytTm5uBpHDn5hdqXtESJ?=
 =?us-ascii?Q?UCIKjs94gs6T4mKROOdoVwf8upRW7go2QE+h4TscYJnWco4UPPFrk272DhVF?=
 =?us-ascii?Q?bUJsyIZSmx02n7NROVVfqUQ8BkfjgvivAmdJYFY1UMzyCWw/FAIJz1Y7gm8f?=
 =?us-ascii?Q?G45DJu8Cv/zxiH45ent/wUp3ps3kh3MgKcSy3E4cqrFPndQIFC5/twczlhmJ?=
 =?us-ascii?Q?i4nSmuC3sciMVrjq1unAKkroU+bwHOjtfPyILOWGWTYMOtOtPpmEVB4KGX4L?=
 =?us-ascii?Q?nbqY1xQ1C0Xn+ENbqjtKxQvtpWcN1YWS7bg4JCDlGTHRmciwcbPtY5TImY4o?=
 =?us-ascii?Q?qTG1+zzBQ+TAfButqht0huydKU70tatQ4qMMx3FTSbYN8I1jvtF3yee9dWH4?=
 =?us-ascii?Q?bsRNwF6qBhf4C3xEfRV/3mt14ApYnkL1VtKojpJQFPMEY+aJ8j1pXx8Xf21e?=
 =?us-ascii?Q?rEHSNdjkpXIbcr5UhKLILBIapb7pSHnwS0lhESFhZGyinOIQmF/0fN5SNOqh?=
 =?us-ascii?Q?XwlofCmGR7rsfnu6iHDrxslCkN7bZvbRQY4KC5ewYs5+84uahiIU7IH0zUq+?=
 =?us-ascii?Q?szTtmCrGsN99JBzs6IjR+6Ij5rkbBDXO+olYTPwxCqjFG5P428AqY+cyb/sg?=
 =?us-ascii?Q?4Yk5GJv2Rxa9iB+7fh4a1KkfN2VTmYKulh1G44fR29sEghH2ZyFeREU/09lx?=
 =?us-ascii?Q?0kei7FbAO96XqHFS3ddaNN8Aw3Sk5dIYKY1NwlgkYV/rDEWnJ9UEE2cpX1sM?=
 =?us-ascii?Q?ziaEEdwnvhEmYD8a0jGSClB7oFCh9F8GIRYAgnXmSLu1GEh/t6E4xTZ96cPz?=
 =?us-ascii?Q?nK5fpv5gTgb2G59UJLlet1us/jFMRUTAlvUbo4OqjrW7RPFMNCdrKWEP5KLF?=
 =?us-ascii?Q?KHHK0gJLt+EU26iBySdIN4R3977Mc5l1WEK1OZgDw8HVdKVNdzsNMjZ/R+25?=
 =?us-ascii?Q?PNtXLJyRIbHoAmdkV62OBmma6o/BXrMlZz4pAi16AeHsCFYfeqbHcp0rTsTX?=
 =?us-ascii?Q?dldTu0x14STUulGu6qkIb6GcdMIx5gXwSRuYfG1NKW4tHreHHbOaDyXtKUgi?=
 =?us-ascii?Q?C1+58A5mlbyskT3emXwWowVLdwVaHgaCazbC3jOY8wtQ4ZtPIpCzncP9BxtA?=
 =?us-ascii?Q?QBnku70Wl+cye7KP2fEbjv9TEQXRpfMuCNsFb9DVr9CpwvXNEjf0TfBay171?=
 =?us-ascii?Q?gIBiMlKFTnGx0wWwF3+u57QdMxPf6nbb9vhvk9moNEgpRQfrZFdxaY54VtpZ?=
 =?us-ascii?Q?dG4vos0BucZgzk5Ahz0f/RHg+qK4dbX761ReF1rvsXWlS9z7XrM5J09LI+R6?=
 =?us-ascii?Q?OAtkCZjwaLZYIm69sb4lsvJe7QSRWW2U3E4Ucj7/REoRms0Qm+Qz12JUfCx8?=
 =?us-ascii?Q?3IiKdWrv0jXCGh7lCSCxXR5cDD8uZmQoJ3of2VTOoMObdqwVok+zrLs3oi9/?=
 =?us-ascii?Q?Swzps4nny8tsiFicGGMJ8QaE3M+Y73kJxx+Qq158+pX3qKRiN6N9o9u9imiM?=
 =?us-ascii?Q?tR09U/6SAQdjVgQlFtvQaEq826jK/KyodWeSl7/PgDHXNBJRwWRb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e1eb9d-f947-4e0e-4fd2-08decaeea592
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 14:59:07.1933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smAaBzp4YFwAXYIXVE8xyTmviOcd1RpsAA2dcUNVfDEuJdy81Nm/tmydiibv5YWygiZpBDNiBDbeYXNJjwACMj7K23hNEZslV3ZyfI0dN5rGqg0Oe/O1OJ+WUsAcAOxX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_075913_586850_4C742F68 
X-CRM114-Status: UNSURE (   8.86  )
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

On Fri, Jun 12, 2026 at 02:58:36PM +0300, Laurentiu Palcu wrote:
> The i.MX94 Display Control Interface features:
>  * Up to maximum 3 layers of alpha blending:
>     - 1 background layer(Layer 0);
>     - 1 foreground layer(Layer 1);
>     - A programmable constant color behind the background layer;
>  * Each layer supports:
>     - programmable plane size;
>     - programmable background color;
>     - embedded alpha and global alpha;
>  * Data output with CRC checksum for 4 programmable regions;
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # bridge refcounting
> Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
> Co-developed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

