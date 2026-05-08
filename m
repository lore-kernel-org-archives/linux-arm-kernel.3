Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6343ACD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 13:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EjecM1gDshVMCc/gq/rLOd0+iGi9q25UG3plg3a5Sk=; b=WDBjQG5gyDSLIxpC0+YKgngd2s
	4tdMgY0E/YzzgdT8bw9AKLYVLM0D+HByLvcklXgKtuOGc0engk3DGyfsjwBMfdm4vgJe7KEuctIVy
	tlGR0y8Ft17wShkcxyDvjoK8iENhpMmc8yWerq2r4UDR5oyCQH6raYMGdRSBq6sMnEpZcx6cW0VDL
	xnCtCbFQXdADnsTyvq2XavE0hlCn4iOdRoTX6aC02saBaShTaN8B/tYOM1rYOjdiw+jGL8ixEHWfZ
	QHM6M9qjotSMT8ywu6NnN3aw89qnXf4z2ZUR4Va8AkbY0DeFNtrGqifrx29K/qskefD50wCEiwiOt
	J5ZJ1uDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLEs-00000006XbB-2kLX;
	Fri, 08 May 2026 13:27:34 +0000
Received: from mail-westus2azon11012054.outbound.protection.outlook.com ([52.101.48.54] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLEq-00000006Xan-0mtG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 13:27:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlHdTwJLxy4vs4OihcY+KmmR00eC4jhUUr4aFYv987/odG7i1Cpty+htNFiSFaZYkE4e9PyxUelEhhPowY5mzdKvuthxrIj5RD3Qw4vhVFbQfkDdRPeXNur312p5y1r+7bBGw5c/3jeFc79mZeoUAC2V4UwHq2DjZltclrAsiWAFtFihRJNXukXpu8ZN5sr/uZKwe99oRPYWeHsd9QavIWVjBKN9+xNWx+b3gkLZuekJNkB7O6YTnJyfaN3eC7hlVeX6vaicIWP2VZjY/LuPO5p+lXdNRkZ5k2lMX9Ab2imzpekIBKzey4iFTiqFYxeBymP+JgnKeNibpo87fEiMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EjecM1gDshVMCc/gq/rLOd0+iGi9q25UG3plg3a5Sk=;
 b=Y4AZ4DF2WZ3nnE1zZoY+/TuR7wfyiZHFJ2GcMihoiLiq281Nig7UAQdZOd3/UAapgsqlKNGMomQF2lrQih+8i8gWurITvAgSDU/N4iAIlYbh5/XGMeswjwfDp0k87dgoIn4o25vDvQck2qWCqc/JOai3opXe6sDDbSkhGrOiRdy0iR3BpaBwoWA6sK1qCQn2qq9Wsvwm2UmZOd7YTSa+e0qA4QMq/Tr4BbowbyF2IZ/57nIEH+rybfaH2g2cLScIcX+iePzH6TybFwGEzcOYx04LJ6GEW7F+Ky0H+tIdSgixBAFSzAe38u0yuWDkDVeAHtPM/iKy8TnVb6Ks/w+owg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EjecM1gDshVMCc/gq/rLOd0+iGi9q25UG3plg3a5Sk=;
 b=WLHtm4BGB2PXTQzG7DJi88etxvT1kH7J1fDBnp+WNnE9+Rl9MLTgY0SnA9CK/0+bEstW/ZyHe5yDqmoABeI1YJFSucbeN9zfCz3Oc9BMWtC7zzikM2F5bNgiMkJedFkw1qjeRI4u/TpfJGZ5vpoeMSCcQs/IY4SypQppbkDDmUkP3z1cx+s05qCUyWmu3UbG4icYf/IOrreAuO7R+qBK1XduEUgTqkLzGixgxyzGwb8Yv4Z9b85ccCxzZYVja1whr5hw/6E1+yxz3ex0jsWH0SBMOYbRTxsQiNiQQ6EcNLuxbc/oV0tojDpGCYwBJ4FWLT2DvEimN0NcwKXFR630UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SJ2PR12MB9189.namprd12.prod.outlook.com (2603:10b6:a03:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 13:27:22 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9891.017; Fri, 8 May 2026
 13:27:22 +0000
Date: Fri, 8 May 2026 10:27:20 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Enable Hardware Access and
 Hardware Dirty bits
Message-ID: <20260508132719.GC9254@nvidia.com>
References: <20260503135413.1108138-1-nicolinc@nvidia.com>
 <af0SdkjQOZxnnaQb@google.com>
 <20260508123550.GB9254@nvidia.com>
 <af3hWGp3etGOIdEn@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3hWGp3etGOIdEn@google.com>
X-ClientProxiedBy: SJ0PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::21) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SJ2PR12MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8e6631-6953-4729-ae08-08dead058929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: QhUfvwfIcN4PgGwVIynEpGwcEUBlNzCxvPlxwid4S4CKaIAxoQQwdhpBmbNgIdF4cKOMgoxAqUWdQQnz5B+Ygs5XyhiC2IJpqSvgHSvLGChpq/6/n7Pd4lHqm+BI6zf+3yvStxJa7B6c9rb31ctvaHBhi4jiwcNlUNDFIs1FmMTVd3Wxd+4wz+wt+qyc7PdGsQYAZ44q93ipSaCQES0b+V+TFx/03pleGm37KMJy892JJ3aODcPP2ampGBWPMQ4W3WidKY9zi9R6dfwh8Z12GcAXvyUFwxj7bw1uDrKbugXWKPi4Gi2fkTjyUV59CdpWJTqTB/eE7eXUmD7BliaqfVmyDLlXsbCQPKAxrYqMJBRLaj/aPoZcSCuAZYdE1HPZRj1PVmY9sZv0vdJh3ODQV0RMkUput5EzmfqL5B9UFgWgOBqz05Up7mixM6B+7t3qvjoTzchRQHle8kxFQyt+6gYx6mnt1wX2gBjEKtKz24niDgJNKioX2+ekbpz+2vxHlZ+3cU3zzCCjdo+K1v/n2IqIRxKSi4A1lcKdcJPr6V+Jp39pO23QaxkBI4mjNWpqDkOU3FxCGOXbm40eFKEua0sxVcMY7aKdEUoEHpy53h7Plt4iUJre4uqpCAIlcNnLe5F9fl8I0kfNHiuD615Ziq9d7VWkMAswfUahtKHEaDM71W6+m3AUzEsqy4ONYy2I
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MNP06yYLRMu1+VkyavYTeavCnAtSOSwrdPTsPyLjbgvAS6g+/gYsf9tGirIY?=
 =?us-ascii?Q?MoHqIeqH4dsUGY/J0ypixujuSPPkOZxD9oEoV9pGwf8AdyP4l/p3oqD9bd3j?=
 =?us-ascii?Q?/qP+rt9snzBW9V8e+oBxneY5+1vygOBTcABaubf6cKLSA6dTeCMqEznYEoeG?=
 =?us-ascii?Q?Ye40w40+zK6aZb+/1c/9J+L6QHQrIUYxCjuS8t+zL8KsYB7rQlnvrlxV0ybf?=
 =?us-ascii?Q?d1+TkVoL0Kwg4aDCZD9fTYVXqLPGJ5jdpApmQr8I0lZ6iEtmJE9+ufYjYTRz?=
 =?us-ascii?Q?SG+wnuWpAw8PrakdGIhaSq6G579JU0LMJApIwlrLOclvPIYzo68VGJCuVx0e?=
 =?us-ascii?Q?BfeAjC1lkWtFv/NVfMkico6hLdi5cLbVk4/M8yRb1lQs66faRykbBtoTpHG6?=
 =?us-ascii?Q?f4Iqg7KMmpQ0bJsN+ApTf0a2fK3dXjd1UPKgW52SmuszMlMFW7sA9xHJBx/4?=
 =?us-ascii?Q?EggZocH9FFUgGa36APL+SkJqNoGNRInl0bzsDOQam/CFxKJcA0spahe4Xgyq?=
 =?us-ascii?Q?Z0Sjn27pKIIcMu0nKY8RC4/3HlsgBjTFnWSaDeNoCTupLlzEXE+QGNja6PHj?=
 =?us-ascii?Q?q0tCinQSnqf0dgECrdi+/0Vc78kxxSkKI/4ZTPogo3Jo0VobhcPZGJiC9xja?=
 =?us-ascii?Q?WTm/lFCD1emrVzjE3nn7VSvkjQjlp8Evr5oMbrK7KWU26A7EK1A4mrwJiRe4?=
 =?us-ascii?Q?YxTRMq8csCeP65QiW8pko7nCTIvf+9h6wfzY5xmZ1zC1MbNO7YYMUQQo/tQE?=
 =?us-ascii?Q?OxDPsc6O0OlqhjLA5lGLkJcqu0GehUYwOwMRbFfzFC9Pe/xPKqzW79rHOEX/?=
 =?us-ascii?Q?n63auVE8l9MdwQdYpOmpxJT32RHJEnQdVU611MvWCRGm/tFFlg63auxustPn?=
 =?us-ascii?Q?XQAxrLH86hUlIQbHzgUw3dSOvLZlpUqLZGfBDkDoxRkZC2TvilvflCgEBSSI?=
 =?us-ascii?Q?JyQXz5Ht8GVtI8+AXi9Y/9A3L6Y/GMAWE4PB5FJjS6iysKTfyeJDMl4hKtTk?=
 =?us-ascii?Q?nGWu0bD3afp61hY/AZeVZM9tjaNVlQbreHzw+kBSnI1SunYKbxtaND35/R3Q?=
 =?us-ascii?Q?pJvofLRJYNKFq7t69XpbuEs2JQOKGCuQD9mW/H2uUzKrXn44wAfz9ZilTKbQ?=
 =?us-ascii?Q?QJ1Uw5/YrAAHCSaAMVONQxCrYYkBN47EHHXFhwbNWOErNg0kBOZrl22ErPt8?=
 =?us-ascii?Q?NtcaL4CQ6NhHZHCEtLdsqtPGpuMyDIzIsrXLhAcZhiDB1KJUGvBevZ9pNmCB?=
 =?us-ascii?Q?H+c7KdqiVnSTb2A6V4CMGDxIEjL5UmTNygLFL+9O19Vf6SpIX23u8TYM3L2z?=
 =?us-ascii?Q?Fo8KqDUwPK5lJ8vAYlJgcepXJ5nJ+ugWGKPGurh12TDXfUvGPOKLbXqBePGv?=
 =?us-ascii?Q?LgtqQoAYRy9/QE4woITS9AJP2+NXdqkaOKd5EEepFaaZFNNb5D8nFzGmTTEs?=
 =?us-ascii?Q?vS1QlDsk/fzreV31cqfjLzknE/tKJfUawOOO8iRvlNhYqMucT2YTHGk31o8H?=
 =?us-ascii?Q?cNKX9zCQKcHU+rTthrCqcxsB1BISj++zlYsLm/EXwEPiY18jV2jJOhw+MWyr?=
 =?us-ascii?Q?+XCSJRMNHdLf6qKiFyLCc/ZCCS4BR3hx40GCm0103BTmSKLjDBFoBRg+y+ts?=
 =?us-ascii?Q?e1qNLr6DlVO51yqsqYTqY6rw55WkfdWcIL0JR6NJ+48ZXhTY7Mplve4zP9tS?=
 =?us-ascii?Q?orlc+rRMafGvPxuiowjCg5vsSYgRirCsp8UoCEXr4yYPbo/n?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8e6631-6953-4729-ae08-08dead058929
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 13:27:22.2062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UP7fWJVFvV/4bgazCNkiYBWUiloZTX+KuoqbR0V98fUSOum8IhO0N1Saj0WORC2k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_062732_244102_8E1891C9 
X-CRM114-Status: UNSURE (   8.46  )
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

On Fri, May 08, 2026 at 01:12:56PM +0000, Pranjal Shrivastava wrote:

> Are we assuming that if the SMMU IDR presents HTTU capability the MMU
> would also have it? I think an unconditional enablement is risky as we
> may not have system-wide HTTU support.

Oh, yes! That is missing here it should not be turned on unless the
CPU side is also using it.

Jason

