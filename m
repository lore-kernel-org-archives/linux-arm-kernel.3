Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF10C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 18:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5vCfoIraXSZbKgf5sxlAur5joa25OqF8eoVqlpSdUA=; b=ooQZLwcdWWPstWxGk74jnzUPT9
	PX8hN3bZWmvcZCIITF3X+Vu5r+kjgbgbxqFqvQIkH3nM2KiOTB9CfC4N/upMYBxzbhnSe6vLZ2bXY
	zIjzHen8YERQFwHO93Din78ljtRDKK2O7YJcfWIs1SAuVIx6huVglTz0d1TX18vzXwUDR6UEFRaK+
	Cj5XOCsjG8mWrSHVmrthyLB07ut6QLl6zy2fu8T7J2AaiJjMbHEj0CD+lS4iEIzZAoh3mqDbtPKtA
	SQnZXcwFs6A2w6g50/0gO0Ag7KDRVxT8seuOQLjzRgWa8U2vLFkG/bYJ7HHOYLzfFr420HAB64+qL
	MXBIBMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXYC-00000004juC-0uGx;
	Fri, 23 May 2025 18:55:24 +0000
Received: from mail-db8eur05on2060f.outbound.protection.outlook.com ([2a01:111:f403:2614::60f] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXW7-00000004jao-2TqE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 18:53:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5VHfan4A/czimuhJqKQSLlWpnaR1NKFGALWb1NrKE4qxzPT8YltwgCfz19nQdHpPkTYGwiiXtaKbTd4uLsV675wLOhtXe9vk49Z2QdSqSpkSUuFy/5cwS2OWjQaBTFrY7DCfe8BuTD9eM86ISGEf+EYfBz9P9ql1vx4Xd5ajbr8f3I9Y8uOJl3Wc1hbz//AqlYjRarUbE3cUXsTzSWmAy9Q6B6exorRVBcNKcKkwazIv7MHLZPJU4G5LZhQi+UyUbViK7Hoy0v1B1pQ8C7jWZcoc7J9JLLZYlKvf5N1U1+Rpv9LWqmRMaqs7s3biqPvNHLik020/G9tQtAlVMEutA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5vCfoIraXSZbKgf5sxlAur5joa25OqF8eoVqlpSdUA=;
 b=Pz5k4lRK01DKc56W0EwoDqM6fLqayS5bq9VfJ5gVyBS6A8P/BjwEG8rFIeaODCMa3rZzPgh6osLA3aSiaZ/jf0S8oCv3X9PkgC+KwjdTyzQd3IsBZvbhGIr2CEcVbTq5UNI9YsDvaAuw6TiKRo/EnD564lWz+NprIhXHC8zJkBSLqMXSgG9JaQRGcRJmWNBZVEre1zuTaFzMzd8vkwbHb+mEK61+EZoh+Ta8wESObHoSQkY+DNWYXcHhkd4rSydYwMfuWq7CCkAxSfLFRi+DKeErJGubMXnJ3Kkmsz0D6qqSIwFNI+fkZi0N+RNL6W4683/QYOw6Vl+cxvD1Wskt8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5vCfoIraXSZbKgf5sxlAur5joa25OqF8eoVqlpSdUA=;
 b=K30SXaqbFVIZd5FdIEC2QCeWKsHyiJzWnYoJuFVhR2/pRXWwADUCRTV5zLtr+lWJyGtI7mvQOwXsVbgrlGKVVKdEXRWXSl95vGuWo29RR3EUN/aM8DaOljvozvpyyq+k1+8uaFeUa3bPT0dUxnURbsvkZPTjNxbraUKaxfEZxi8YB1cxAP9FHdfZ7tJxFOEPq4U+HTeZc35s9tGA/p76hnOt2wwNiKpvOyu6hJ3gmsNqaNYsV4UmPc0KRYNojylRcbd8n34E5e4Hl4pzALXdQHv4BokHYleQnpDsZfs7UmDoTpmXypVuCKIlTRPFqUs7o/cs94ydqGxdt4vaHikENg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9775.eurprd04.prod.outlook.com (2603:10a6:10:4ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 23 May
 2025 18:53:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 18:53:11 +0000
Date: Fri, 23 May 2025 14:53:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, tony@atomide.com
Cc: bhelgaas@google.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, kw@linux.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, tony@atomide.com, vigneshr@ti.com
Subject: Re: [PATCH v2 1/1] Revert "ARM: dts: Update pcie ranges for dra7"
Message-ID: <aDDEDrHz4PNOY4Gk@lizhi-Precision-Tower-5810>
References: <20250411153454.3258098-1-Frank.Li@nxp.com>
 <aC97HguxSt56BkHa@lizhi-Precision-Tower-5810>
 <5a8a4f18-d5cc-4fd1-aeda-2e739502e0eb@ti.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a8a4f18-d5cc-4fd1-aeda-2e739502e0eb@ti.com>
X-ClientProxiedBy: BYAPR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9775:EE_
X-MS-Office365-Filtering-Correlation-Id: 149f92f3-c254-4dde-0c88-08dd9a2b10de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IOCLmhJSA8v/x5L7WklErxlCM0AdFT7ObC+yb6k41TlwcPFzjlCjJZ3EVj/q?=
 =?us-ascii?Q?nVnIdP50t2l6IH6pABJ2AGWLcffVVvELb2o/U37BnrSjvGQGdJk93phHQ7js?=
 =?us-ascii?Q?BXWwbLFKYNkQke7h+NmdFbbF49R6SvEEwfZHSRcOS1XWNbI0EUsVt+brxlC2?=
 =?us-ascii?Q?6FaZq+69GtE9U2TsG+i94zeXIDfu+qSU1EtFc2vRDNQwRe0JwDQBEEkbVmt4?=
 =?us-ascii?Q?Th96hMB0vQr9vAUEGn2tgzgNIg+yYr2MuZoHQFsNWrR6sLoC3JjNoWEKQcxF?=
 =?us-ascii?Q?YM2IqZdkFvMs+ovG300x5yav/0zbyz6fJLQSwPD2ciuc9QbSqBHD0SmNzKaG?=
 =?us-ascii?Q?isiSKfP8YYq7VJtwdt/Ay0deFBi7qTeJVVloyp4g2ihi8FTWz347T3/vLLrz?=
 =?us-ascii?Q?xn8hnJYj+5g1gfwZtJFv1jrjHcJ31fvEvfc1G+LVzt6x2ZzDTaGsQVF7IwZk?=
 =?us-ascii?Q?t6Qht/300bv8ztoPbeAjRAIyPuUdpDFFV1K1aUYjmsuFupy8DiaPOG9S659R?=
 =?us-ascii?Q?/dRKpon+sKc7z7YjUbm9o46rrGzX85TdLXo5ozKrSfNcIBmR5r6muppg8ZUq?=
 =?us-ascii?Q?jS6wOeK+9W74uAPoWy9pH6fAuRP74Ld0X9F6MeYMZ3iw7G0AaRuxu565kZ9A?=
 =?us-ascii?Q?2vWyk5cGZVmYv7bC/PdbnBw6hPiLKl6NVkSTnJ+aF75JUEyoZpuyjBGpRzOg?=
 =?us-ascii?Q?6qUpEOltBxBi9SprRCfHolT6I7618lyvzLg+nwoOIdhu7p/KFdMcaBKiDLni?=
 =?us-ascii?Q?wIl2M8C2hpUFqMR5MHx8cp4kQ2VSvVUHs2T07BhXsxyy8umGcnx3gr6ciGvc?=
 =?us-ascii?Q?B1Uj4XbQb7DLm7Gm0dwupaiAcGbI1QtCv7EApjf16nnsuxh2MZHDrwz7DLcB?=
 =?us-ascii?Q?nnwmDGAtG5HybGibFoZzD5cvmKDCjq0KdGwiIDgw19V/RuQLpMYuRg9kv2Xt?=
 =?us-ascii?Q?0DLZE9H9eieLMKmMVif0izoA84ytEbEAzJACappKmVtzATK6shrnxSgISqRy?=
 =?us-ascii?Q?RchfOShFTMykG3hY8A1rX08xZ/udUH3u7PUojOhfeQf/UGupYHA/jlcxM07s?=
 =?us-ascii?Q?lUfLuHA1WunmtwdekA4la6PhlPpqxt2u/x5GktSH1/4Dznl0l+RPsMwYVxHB?=
 =?us-ascii?Q?zJ60BJGAlYPFDaz4fw9h6rb0nDjjjNnnSWjSRT/kQEdyt3//4unjImNkPbTo?=
 =?us-ascii?Q?kGGt37HvU74uTDKrDQrrfNnABNUo47PWYIdZRM8SLZUHw+XTgLR5DMxN2gnY?=
 =?us-ascii?Q?2mQlhL7nHaJ3J8EqPY0Gp922jiL1Y6cYBb2CSmxw2pTo+grgyFhIz1r/RZp7?=
 =?us-ascii?Q?3kBHH9+m2KPlaBF57vU42y3XBjV9VMInulc1NxUOyGi68uEFNQ0HQkXPaeoy?=
 =?us-ascii?Q?o0HQzF6MZl3JigdXx7xDnOp1M2E4sbdY+4bS0GJZ/nxcMwCRyBvz/PXaDsDb?=
 =?us-ascii?Q?eUnILMRljTxyBTrUzMygjvEVUyssZzXsLMtxeIrAtFVpkliN3srhyA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Kajt4/cMSbvO/IORlh9TecioNr+n67moP5lo6QZOM2iahrKNJ3aNxaZHOBJ?=
 =?us-ascii?Q?aQN/DswAv9hpJgzHC175y6+oMUabHiYBDwCG5LGN85iwvElSY887F3SBjaNl?=
 =?us-ascii?Q?wAp0Ge1D/qD8A9QZqTCa3YIYGYc5Y+PzFqQlkDCGC24tFZjYZLsb/gEfhC7t?=
 =?us-ascii?Q?fmY1nR3z1yseE9eYbYr/AcdJBc0o4ssirSVnfoZAGQ2kKX2ubjRg6C0yLeXR?=
 =?us-ascii?Q?Er4PfkJFVQIFcfvg/vXMl0y7SAjOOXya9BrJJlKIwI+CYgvMIB2XD4fkI+GX?=
 =?us-ascii?Q?MdLGPA8v+oCMYwlRk9AsYNCpfR65Mnh8x8rn9EbSX0V8ZGWgPdeRJQvzhazE?=
 =?us-ascii?Q?X2vVt56lHpXGNZvUZdw/bkcFaRnyW56Bj5BomVZ5bvuFvp+M0q38E9/2h3sS?=
 =?us-ascii?Q?T6mkpXRUYgpEux54cw014Tvpxf5MRXZ8W92HdCmDWARV7H/kaLzX21AhjRdF?=
 =?us-ascii?Q?qk2CfAgbjCnFb5rLLyL3OaeX5uGO2nBXcfhuhyV+2u6UMaJAWuH2fN1xJrR6?=
 =?us-ascii?Q?QYxSg0IcV3yLs/ckxB9A0UfQigqGlXueFIvonSCr3u0rgV1GGK5eacGh9r48?=
 =?us-ascii?Q?Oq3lv3YUPENOVNl1bNI5g+AbcXlMQ1IGYWrDpDpaJvCf6SecocPOHCLctxQI?=
 =?us-ascii?Q?vZP+cDNZTroJS03oQwGyWF+YsX53jC+cyLVSesulI/a01gRtsfpbxHD0eu5R?=
 =?us-ascii?Q?b1HLfbZa5eFSK4F7dDL7aGNGUxulzN0ggZhgTw5OgymBahcpxi09n+VdR4DG?=
 =?us-ascii?Q?KbD74UwMk5D7r+1EXZgxxJ8XfWpE69fyB+8uHak0XNuFrF+cW+aAevrL5SPA?=
 =?us-ascii?Q?j5KDCb7A5K6I/3UMzIR5SK1sOxFCz6uXB8PEK94/fSll9D306oIpi5gu3ZbN?=
 =?us-ascii?Q?t+s9XPjsCvopS0UqVQQiY884L8xKpphm1PtsoPzQdNJOXzmyE50eDnR+7/68?=
 =?us-ascii?Q?Tsu6YuDEI6ofQJ6xOD47x6MLh87K49+RoXdU5pBQIEAyccR90K2epfuUkA7D?=
 =?us-ascii?Q?R9BAEQq/mthn4ERwPDinfNtWD9EHnQNR9T51yr5+r+5CcmUAkc5F58KS27S1?=
 =?us-ascii?Q?QyOkp4a/pJXw2HKr1B09caepiKZ8UgDtprxFudtZ1Aeg9/oHAZj3IH5/LenB?=
 =?us-ascii?Q?bmZNCspIah8OXnjWFa7A4gxd11H0TEet4fDkBEF7fLwLy7qkaVjDwIse3Toq?=
 =?us-ascii?Q?VxwHRaAS+luwJIpW/EelpMRNWFxpbNLG4bY6S08p/AIoGdtzyW3VTGGdf9Dl?=
 =?us-ascii?Q?dm/xc8dsBF8GQmmXjFIurZJMEv/zI8nGRslmllaNmPzQmrkjILc45+fO5gK6?=
 =?us-ascii?Q?o6emX2PDeoxUoqXgzM6dpqwGHFbyi954o6bTnrSo1u/MqLcPFHfti3mxUQre?=
 =?us-ascii?Q?684iCh9gpKj4UNRjGC98tGz32w6PWqmsWo293gPE1/u1YtlvppQPC+Fnm842?=
 =?us-ascii?Q?1rSHxMMUglpGvN9j7XHiYNVvFzqXVxsF4nP5xqNnIh9dYqRcJIk/II8vsO+2?=
 =?us-ascii?Q?Me0x73gsCkgyRxOJZf8BW3GlUyju/Akz2J3B+Iw835O7tU7b7pNn2xMxhhrj?=
 =?us-ascii?Q?2RX8PjTAbsCV48Ab4EtnWe4b9h2j5qsBmB9sx6so?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 149f92f3-c254-4dde-0c88-08dd9a2b10de
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 18:53:11.4832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RO8oEfjJZjnTS1vdKQyd69Lokskl656LjJsS2NeRNBoznuK8BBUNF6cloCyJ7CthPZC2yLgbyEnnU+Fwt58wgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9775
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_115315_631926_60C2A83C 
X-CRM114-Status: GOOD (  19.33  )
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

On Fri, May 23, 2025 at 11:02:38AM +0530, Siddharth Vadapalli wrote:
> On Thu, May 22, 2025 at 03:29:34PM -0400, Frank Li wrote:
>
> Hello Frank,
>
> > On Fri, Apr 11, 2025 at 11:34:54AM -0400, Frank Li wrote:
> > > This reverts commit c761028ef5e27f477fe14d2b134164c584fc21ee.
> > >
> > > The commit being reverted updated the "ranges" property for the sake of
> > > readability. However, this change is no longer appropriate due to the
> > > following reasons:
> > >
> > > - On many SoCs, the PCIe parent bus translates CPU addresses to different
> > > values before passing them to the PCIe controller.
> > > - The reverted commit introduced a fake address translation, which violates
> > > the fundamental DTS principle: the device tree should reflect actual
> > > hardware behavior.
> > >
> > > Reverting this change prepares for the cleanup of the driver's
> > > cpu_addr_fixup() hook.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> >
> > s-vadapalli:
> >
> > 	Any update about this patch? it prepare to remove cpu_addr_fixes()!
>
> This patch looks good to me, but I was hoping that Tony Lindgren, who is
> the author of the commit being reverted, would provide feedback as well.

Move tony to list.

Tony Lindgren:
	Do you have any comments about this one?

Frank
>
> Regards,
> Siddharth.

