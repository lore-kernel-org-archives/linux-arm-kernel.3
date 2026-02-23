Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB15E63C8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5/GJW3JznKk1Ujg7WspQGW9naPyG+qh/tuSJLwp+eE=; b=dCpwSoxidYv7nvobkM8iNW73Td
	gZxaTJtj9ed2cQB9ZlmB3LPolZm3a0wMwlvhTGge+Ga5SozGT5lioMe4x3r23561+DfoHDf0+e2Pk
	TJ7GqEWM19xsEXD9AYPxIqrfwTxBy6Ba+qYctqI4WwRnvKVNEsO+9nU7i8PB+bmAUVMnegFSs8+M6
	rd9yKHonwQQuLAvWMMeKe1MWrRHFWgFOTEKjm2rdzieuDsFOF6Pd9k9ri5bD0u5T2+p88c+VTrmsg
	fKLDILip5DamfYqcAxbM7AaTfcC2QJiODkbaBm0+95nQtrVMMX9y23baFLFBWPVPDzFECtU2ylrNK
	AUxI3JyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTcB-000000006ZO-27oI;
	Mon, 23 Feb 2026 10:56:35 +0000
Received: from mail-southcentralusazon11011044.outbound.protection.outlook.com ([40.93.194.44] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTc9-000000006Yy-3UFV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:56:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSC2ckJZXZ9FSRpyGfL4CooYVWxypiU9OllJrYVlmEarERJcXu3SpM20yQhsNsMX+Effp6dK74QZMLPA59mho08BUSyVD5XlvIKC00pSEub7xzY/i3pRNQfnV4fpPvWLkbGo37eXP6EzEAWrFtKws/q4ssJdgfQwiursr/E8NcG98Cg9W7dJXj7mpxxI5GEYnuPGuyhSUf42glsPM+j7i+XJSEnGrv5uLNlCofXLjlRNUliJz+7kZLUWO+P5D7bA1GNkjKyOw4Tv/86HGDf0G6nS99Ni0GIkCXhsMbUSNl0MHyegKmY68XCLHVa7Wu9n1KKkxzOCgF7czMdKxHJ+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5/GJW3JznKk1Ujg7WspQGW9naPyG+qh/tuSJLwp+eE=;
 b=wLui8VOZNUabwKxkl9Y1mHhx6Ah7gGLzD67hhYuRNKRMHKDgjYZLRvmz4jvMb4FYHC/kOX1hws6618oETNfEB4zN8s5Hs1768BO7/7Uv3c+hO8AlCxivhDsaQ4/G53QWjCtTw867Y0h1hzyzRxVRianJZ/LCGKI9mi3xs86g4/RCuDc2qeG173RazMFJ+/tqyzlTIwXFuLC4azhuP8Xr0HYCt26Fv906EwEhhEVvTBTOV5C9/psjUyHvB2JmVbrFT9lPgJLOPrnFnPrQiMCb2SZ+bIGpfsH8Vv42ie1R0QPkWH5WOKYmKg/Ry3wkaNr1rs7AzXp0GKd4yB9SGReEaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5/GJW3JznKk1Ujg7WspQGW9naPyG+qh/tuSJLwp+eE=;
 b=c7PxZOdz1gmoo1Zr2lBrD6t4tuR23JCy7NFjijY6+uJz0Dh+HFfX32+FHYyuGTj58TQxgZW3eZmvf2afr3yX7X81IC4Jsam3sflqg4XobetyMqWxwuNncnc2pIcxkdRL6ZBj+2vNPkmorMWm+TsjIz9koC16nJP5yPNEci1Ger4=
Received: from SJ0PR03CA0362.namprd03.prod.outlook.com (2603:10b6:a03:3a1::7)
 by SJ5PPF0447EC1A8.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::784) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 10:56:28 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::9b) by SJ0PR03CA0362.outlook.office365.com
 (2603:10b6:a03:3a1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 10:56:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 10:56:28 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:56:27 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:56:27 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 04:56:27 -0600
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NAuMVt182135;
	Mon, 23 Feb 2026 04:56:23 -0600
Message-ID: <13dc9b4f55ea69fd1ac670c2e6f7d383add30401.camel@ti.com>
Subject: Re: [PATCH] arm64: defconfig: Enable the J721E PCIe endpoint driver
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Aksh Garg <a-garg7@ti.com>
CC: <krzysztof.kozlowski@oss.qualcomm.com>, <geert+renesas@glider.be>,
	<bjorn.andersson@oss.qualcomm.com>, <arnd@arndb.de>, <nm@ti.com>,
	<ebiggers@kernel.org>, <michal.simek@amd.com>, <luca.weiss@fairphone.com>,
	<sven@kernel.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<kuninori.morimoto.gx@renesas.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <danishanwar@ti.com>, <s-vadapalli@ti.com>
Date: Mon, 23 Feb 2026 16:27:52 +0530
In-Reply-To: <20260223104609.876613-1-a-garg7@ti.com>
References: <20260223104609.876613-1-a-garg7@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|SJ5PPF0447EC1A8:EE_
X-MS-Office365-Filtering-Correlation-Id: 808feb81-629c-48e9-de2a-08de72ca325c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFBFZklTTnorS2dZODd1UGpyVUZRMzJuemFkaXo5QTAvQ1FaTnRjMXVkclpQ?=
 =?utf-8?B?dkQ1WVhwK2VSVEgrSUt4T0hjeDNrSkN1VDU0eVlLUU02TVViMG95L2RuUE5K?=
 =?utf-8?B?YjV1VmVqbjJpUlNMem1FaTA5R05ET1hRTXZ4UUFCMUdoKzZiRHR5UDBsMkk5?=
 =?utf-8?B?UVFPZEpIbTBtcnB5eHpYYkZxQ3Yva3BRY1NLS3FsaFo1ZitJM1pkVCs3N2Rp?=
 =?utf-8?B?WEc1RHJSQnZIVFdOS09sRWVNdHI2UkRWN2FQdzc1RG94azQ5RmRNTXFhM3l5?=
 =?utf-8?B?dWlsOE9pZ2IzeHRWY0NLYUJ3U2tBcGlPVTJDZ21pWnUvaCs3ckljM1A5WU5G?=
 =?utf-8?B?dlpkZFpBdU9MaXBYZlhSRGlEU3BXUSthY1VKL21XMk9uc0RKQ0RZd3JsSk12?=
 =?utf-8?B?N2tTRHpZeXBwdm9CZG9Ia1ZJUGxlalZsc0NPNzRTSmxUbEVXSWcyeTFvTUVv?=
 =?utf-8?B?QnpLRlpxQnBBcWxyZ1hWUkdaeURLMW00LytNZmNYaUNVdGJVS3YvbUFiQzRw?=
 =?utf-8?B?cGlzaHNFYmI5UUJBOGxqMStGbURqQmdkTWJMbnZHaEorOFlDc1pEMjNsRnYz?=
 =?utf-8?B?VmxBMUhxM0NIekZOR05SdUJjaVByY3lpSnFZSWFQRHdENitrc3o2dE5MbS9X?=
 =?utf-8?B?Uk1xL0llTHlzSlQ2N1ovS3BLK3I5aWRnelFFYnNobTgvYkxveW9EdDB3bXFE?=
 =?utf-8?B?T0haZVAwc2V2cGZSYVdMOFZwZ0E2TStNZTVtTTVqYnBubjdYOEtNQ2NuZGQ5?=
 =?utf-8?B?cGF2aWFzWllwaVRNb2E1QWc0VFpmWm9sRmpYVld3clQrMTJZazlRZHoybE5J?=
 =?utf-8?B?eUpsS0t5OFVGRzRWR0xLYk5LaktDMDNFeE9kL0IweVZmTHJKS0Y5bEpnMWMv?=
 =?utf-8?B?SVVsMXBBUE1Bd0IzSFlkVEhpSVRmQlJzMUJGNnN3b01aVVZOdVZNMXdvMkNF?=
 =?utf-8?B?NllHYzVOR2tROVBZVVh3OU9KOG5VTGZ5WS9Xd3VNTnR6cjN2M0JaS2tDQk9l?=
 =?utf-8?B?UTJXTFVWR0NuMnZQZzBBM3dxRTN6dTA3MXFLT2hsYnVLTzJMTjdCMDd0bFVj?=
 =?utf-8?B?M1NqME54VkUrTnpLRDRLVDRiaXhoVDlCaER5a2VXYWZJTnhoZm1XZzk3V2sw?=
 =?utf-8?B?c0pKSkM4bUovb0lCeVlHL2gwa1ZJQUEyZkpQQ2NtU1M3M3hhMTVpYmdpNkZk?=
 =?utf-8?B?RmM0cWV5dkFJWmxvdzRiSFNKbmtTMkJ1YjAzbDl2NFlJajVSTmRhRHdYd1Fs?=
 =?utf-8?B?aVBsNW1JY2ZVVEhCRDczRUVRYS9peW0xYWl5NkJnb3NKdEpBc0Y0bTB4UVI0?=
 =?utf-8?B?S05qSEhTZyswWXRtWGhibTJBOWpndS8vRUJyWlNCekxoT040NnRqdUo3ei9o?=
 =?utf-8?B?aTBLZ1BzVlZUT3VoekpRNzl3aDFSSk9ucHB6N0g2dUNOQzZJVW80enoxeWF0?=
 =?utf-8?B?dFVxZTF1WTN6c3ZnL1Y2dzViUXp2UVVWZjB6TXdONm02ODdXSS9XMUNGRXor?=
 =?utf-8?B?bFFuMUJvTjZpTTBnek9TNXNvZWtZZElETTV4WGFnQURoUFhuQlNMZ3pLOENC?=
 =?utf-8?B?MGZ6VTY5eDhOQ0tqdS9vT0pzclFlNW9OUkZVQk1td0pVd1M0elp4VDU5ejNS?=
 =?utf-8?B?blpzbTA2MjhmcFRPandqYkxJbXF6eVZtcnVaTnliSkhZVjRoemRxaHgyVndJ?=
 =?utf-8?B?S2d6dmlnYllYa24vUmFIVVFYWFo0dWhTSXlLZzFiVUY4d01Mb0Z2ZEhySFZh?=
 =?utf-8?B?VlhDWncxM3BVbVdBcjk0YnFpSXEvVVZRNGxwVVFRMmNwQk5FRzhTZ2R6RVpj?=
 =?utf-8?B?cVV1UlpvVUE3b3E5UVRlNGQyMDFqckw1UmFCbzAvSWtzREQrM2dyeHFxMS9r?=
 =?utf-8?B?M2R4ZFo4UmxMaXZzblg0d0Y2ZFV0NTdxU3RoUHFvL2FhSlJmZ2krTlVvc1FK?=
 =?utf-8?B?QmVsVkloaXQ0NW0rNU5RVU1hb0ZpTGloemFaNEsweGpneDBOUklNTENWOHZn?=
 =?utf-8?B?ZFArYXFHSkZWWHArY1pUdzAxMXZ4ZTNvZHg2a0c1TFJNTHM3THFncVV5TDhv?=
 =?utf-8?B?amxSdDlHZzVyK2MvNzlVVmxRcXh2dXgxL1ZUL2ZaN0c5MlYxeWYraEJFOGZU?=
 =?utf-8?B?NXBUT1JTTkM3RDZESU1HNGw5WkNxYWo2TkNERlFERk9iZVVOODVmb1NnZmgw?=
 =?utf-8?B?TWxNK3VrQ0xUT3NMY1ZJWmdhQzlqRFN2cDBNajFGdUQ3a1FJNEZYMGZHb01x?=
 =?utf-8?B?SnBRcTN1NEc3UFEvazJsM1pjZVRnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Z89H7MxOW8gkP+/q+Nko+BjMh+3TpaMqluSKpFEN3RgypszvOw0RZqHMXoi7NxPAKVZM1nLXyJhcPVweKix/hM3kFOLq33TNuWeIjYwAMlsTXnLujlLUgrKmC63kbH5fUMPclnyC/IkX5xElVgCVGhRlgE67g6iGigDGRQMT4ryGO8JzQQPwMeOFNChBokPRktquh45DrPrP58sbQDvS024RUjTKUg7u64mSYVpEh/Qe/8Oo7jMNsfWIXiVp7cH9alxJ6zGnk9NLwPRamFaaA70eJVquGv7DliP08wmQtHIsZfhSV9wvfrJNKyZa3i/hZ6ClPykoyd3O1eLkwBaakryDzggY15ZTb2fRBixi8nQgS//bgHYyBRFuZZRVMBgeCZsFtu5zLeYLo72aEh3iS4DEHWu5UDYO3Rgm+G1PbS5mNVgGlM1eq8dDJ8FaZaO0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:56:28.5870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 808feb81-629c-48e9-de2a-08de72ca325c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0447EC1A8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_025633_873162_30846441 
X-CRM114-Status: GOOD (  10.91  )
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

On Mon, 2026-02-23 at 16:16 +0530, Aksh Garg wrote:
> Enable the PCIe Endpoint Glue driver for the Cadence PCIe controller
> present in the AM64, AM68, AM69, J721E, J7200, J721S2, J722S, J742S2,
> and J784S4 Texas Instruments SoCs.
>=20
> Signed-off-by: Aksh Garg <a-garg7@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index b67d5b1fc45b..103f4763b88f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -241,6 +241,7 @@ CONFIG_PCIE_XILINX_DMA_PL=3Dy
>  CONFIG_PCIE_XILINX_NWL=3Dy
>  CONFIG_PCIE_XILINX_CPM=3Dy
>  CONFIG_PCI_J721E_HOST=3Dm
> +CONFIG_PCI_J721E_EP=3Dm
>  CONFIG_PCI_IMX6_HOST=3Dy
>  CONFIG_PCI_LAYERSCAPE=3Dy
>  CONFIG_PCI_HISI=3Dy

Regards,
Siddharth.

