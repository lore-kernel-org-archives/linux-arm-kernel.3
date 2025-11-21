Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEED0CFC279
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 13:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkmKpEGfK1yTuLB7Ru6Pn3Mp4WEE1nRRhfsR3hdnYlc=; b=FSv8ltDqzUmN4ghHfAGRXrIgi2
	n2LTokHSotQ7SDP1Liuah/DfcL9TmVInSvdDJK0XsllAyietGAHAnZoGrCgW1OFMrtES9HdccoXay
	7CfbyLCxMgIus4TlOKd6LKYhksTSR5+Bxvpw3kYQNKrzFSXLamTZoR4BRKswafLuS8Cw4zirYso+U
	QG0PqsWYP9+xWkfmUt1ye4hIkr6Xc84nPlbI6RjEjPpzYJsxDapjTX+f2cj0CczHrkm8qfFVywj+Z
	qKjBc1GoxbMEjIBwt7437Fa4nbbQPCBGcDcVaXDWTWm4GoOWorM/qgBuv36rwju6M6CrW7FzZNdKF
	Ngfnm7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMReo-00000008UQp-1jtX;
	Fri, 21 Nov 2025 13:58:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRej-00000008UQP-3Wrz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Nov 2025 13:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WkmKpEGfK1yTuLB7Ru6Pn3Mp4WEE1nRRhfsR3hdnYlc=; b=rQzpkaPznk7ZFWGb6wr3GQvd0u
	TdD/UbI7ldUWyuYu/V76rJeT0E5taJWOKxr01WbUJbjP2IcWlTnkbUwQd0ZVvAxEzs0TPL3/Hm4fw
	vxtFMoPInAAvjESSKzZ1qiEHgG0YgyhU/vIedby+xv/OVECirrDt04Z9SbOkU+ptJ73662Og+AqBp
	gT02AjQoLNRHLiiwxPTWM4YM71WUZVSURhlNNhbMZ1ctxOgwcIIMmDRQTGxiQj84p9OUz1DX4aCSM
	SunpNqvRd/y0ywbKQ21rHS/MF66rfG6cGFxfa2DPkQf1PTXr+jMKPDyebSwsqI+N/NuVY/YfkrjR8
	2gstLdlw==;
Received: from mail-northcentralusazon11013032.outbound.protection.outlook.com ([40.107.201.32] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQn4-0000000GuLC-03DF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 13:03:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lx/G8RdneHvComyLteMIT73gDVuvbgya6N9jNhJUo4XeNGq8rIlKk/TCQKV6AX2KtydXTmqm2x21vBvueWWsPQhGn5mAgmgVbnxECGkEgxjwF8HA2NE+8iOrH4lj4hGPJGsE8bEwkU6fGZVkNfMUxmrzNpRcpre7LUdYiAnMZBmfmiqOjmGb/HtKbbgqlfeFnfzrlXpM9boezHv4srbKzuKVw9EMnC544fIviw28aY8bqHbrHVr//LiXnD7yPwpcHGcsf2JiisEY4C60N0jkLojoDFzWiCN6I4H+4XhpF6zHkM96+kxDgr5FOBej+R/swf+95n649O0iKK914IqGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkmKpEGfK1yTuLB7Ru6Pn3Mp4WEE1nRRhfsR3hdnYlc=;
 b=ldg9UJmt5O3oPuMnJqHFLSjX+rN0D9gvDBK1ECQ+Ox4474yQidG9ctEEBG7BVbBExgJEj+H0bhyDlRWz499HdnHki67mnl0e2Cm2hMV1lg06dbcL6HQjzfPuIVd+EuDcSJiZn3ReumizMPB02ghBPChX6ifn0zNB9Q3HZ5g6XlJtDRxtbg6iasODWF17H2XGTqjdFthm5Dzqlrx2yWgrh7zmH9khnNQWzgpMux4CLo/D1l3y57IoJBjJ7KJPi6H+Y2UkJzESmfFO8kDHz5aCt56l/5bBJzZL62FaanZwxf9QiAWMdapbYnhPz09iXzqfrWpl8nYymCPwsxxZmA9Lqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkmKpEGfK1yTuLB7Ru6Pn3Mp4WEE1nRRhfsR3hdnYlc=;
 b=tHi/sCLHS9EjFFSDHYXMgJjcyx8PcvRkK0OSksjLsCWivjtMQSj2IsfOhNYI7rxlLp85JeT+UCZ/f6DxVMbcY5d5HUQOxVGx3VKfiicKpbtMCXRz3Q9SkOmFzQ8mFGtC82A8XOHol8jPJs3mTF34wk7fYp66BXbjr5Au6A6Imsg=
Received: from BL1P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::17)
 by SJ0PR10MB4414.namprd10.prod.outlook.com (2603:10b6:a03:2d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 13:58:25 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::22) by BL1P221CA0021.outlook.office365.com
 (2603:10b6:208:2c5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 13:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 13:58:25 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 07:58:22 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 07:58:21 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 07:58:21 -0600
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALDwI8Z1325040;
	Fri, 21 Nov 2025 07:58:19 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: Add missing applied DT overlay targets
Date: Fri, 21 Nov 2025 19:28:09 +0530
Message-ID: <176373265677.739386.14425144373891089295.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120141936.190796-1-vigneshr@ti.com>
References: <20251120141936.190796-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|SJ0PR10MB4414:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a2d9e5-8881-4711-567b-08de29060a43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWRHMURTWE1KbTBRV3FPaEk4c2R1N2hsYnFIRXZMNkFZdlFVNVNRSlY0Z2VY?=
 =?utf-8?B?aVhJVHZvWkkzNU85a0YweW0rSmpUY2J3UXVNUTU2VmlSYUl0YlJZWjlMcWh5?=
 =?utf-8?B?S2JmVExSTHE1UUNYL3FBb0dEZk5RcklJanBXdkZDUkxtWE53Z3JQV0YxM3li?=
 =?utf-8?B?blRWdGliNW1iK25kZUpUU3JCdUx2MEVSa241ZGZ2SGhUUytoOFRreERwVHZM?=
 =?utf-8?B?T0dsdkhJS0ZUMWlGSjIzTDBuYWdrQ0ZnZTNyKzZVRzA1c2V3VVFIbmlIU3hJ?=
 =?utf-8?B?bnZ0b3lFRDVoZVE5akhMaG9DQnRSMTJUWmJhUUJIQjdaQS9IcmRGT2tVRWlh?=
 =?utf-8?B?M2RDTTVwVGFaOC9nT2cxaDQ3U1hPTDR5enRxeEZ4VEJzdzk3WmV2NEM0ZFJm?=
 =?utf-8?B?ZlV0Wml2cTdhVUJMam14Q2NScERBbUYyejBSVU85dVpJQzJBd2JHZkV2ZkFI?=
 =?utf-8?B?VGYxT3doZUNhb0c4SVkrU1FlNzl4ZkdFOFRvKzJDMVlXRm1RbUdKbUxpeGNT?=
 =?utf-8?B?UmFtTlVRMTBFTllRZmY5ZVcrVm10aEk1YkRXbXNVV2FPdW1jMUdvMmlXaUNv?=
 =?utf-8?B?eDVURDE1alFPZFR1TjNHL1FEM21KWS9vNUg0Z3BWUlI4K1VmWkk3d1djaUdC?=
 =?utf-8?B?bWpOZUt6Z1lOUkpvclVxbXphM2kwcm9OeFZqbFpSU3dORVh0SGp4L3lnM0lx?=
 =?utf-8?B?TjRaWElwTXVVcVBRSnBoYndsYmp1ZUNIVFZLYnEyREpPQ3UyMzFOUlBQSUQz?=
 =?utf-8?B?K2JFUkhjeWJnbkl3VVR2N1FTZ29MeVNOVTc5QmZIaDVJM1d0cE8xRFFjZDRM?=
 =?utf-8?B?eDRVMjlzUE5wZ3M2VGhLWGpkQWh4T3E2ZFJEZlpPSUt2V3ZXQWJ1QlBLWS9O?=
 =?utf-8?B?b1NxODhIQVYzUGZILzVJa0grOTA4REdlVVpjZ1pvMWF4VVFCOTRuWDNFUGpo?=
 =?utf-8?B?MVVWQitqbTc0bFZrTW5xRnludXpGR2RzMnVtMnhRRGFra2c4TmZkSlNjeFFu?=
 =?utf-8?B?MXJNTGg2Ui9EbGtkQ3FNQTVVQ2FXVU0zUDFwSHg2N1lnVk04VjMzeE0ySCtP?=
 =?utf-8?B?bklzaE4vdWpDKzFma1h2Yk1GcFBnaTBjUXkwcFdOTkdubS9pZ3MwT1dkaytt?=
 =?utf-8?B?OVhmQmttNG1ScUlFY29jOFE2TDVibWZGZUYrL1RneWphRkhXSGVlVlVTWTVi?=
 =?utf-8?B?VzBxWXZOR0xZRHhNSXNkelArTG9KM0F2eU4yc3ZEMW9lK3J1SDdhYTR6VXUr?=
 =?utf-8?B?dUZNQ1RkdnN1OWFXUU1OSmhUZEFncUtwMW5uanQ3R0R4UEVIcGpBUzZIWktw?=
 =?utf-8?B?bUpZdnZXODNDZkM4a09BaEJFNk9UdmxLTTBFaEQ3NEZzek9XNDNKVHBZUklL?=
 =?utf-8?B?c0JINzFReWI2SFZLTytVNkFaWUpsWlBwUW9Zc1ZUMFFqRUtGeTh0blM1OWhN?=
 =?utf-8?B?NGI5NDhYQ1A4Z1N3NUdXcnZTdFN0NkR1Y2JEZndBdCtGd3ZtdU1kNzIzR0ND?=
 =?utf-8?B?Yjlqb1g3NTlJQW9LdEF6N0V6NXU3ZkQrb1JIa3hGaGM3eDNSNW9nMEoyWTd3?=
 =?utf-8?B?bFNNZmtUWVhmTU1IMm9SZml4UHJCdC9rL3YwR3BzWXR1NldBbkovaW1YNits?=
 =?utf-8?B?eG1OcEFwWlgvUmZZdzFoZFhnV3g4cEdPUG5HaytXcDRqaXhndWNQUUVBNndX?=
 =?utf-8?B?RDNwZmZYanRPVnF1RnVDUXVJQndoeWY1YkNTSHhIRHBXR0R6Ykt5bXZ6by96?=
 =?utf-8?B?SEw3YTFrVnMwTFhsT2x2YTMrZnpjQ2pOL2N4cDdTL002MlZMNGxESE95WklD?=
 =?utf-8?B?MlI0WHpxb1FhaGVoclpRSFZSZy9WRGxxZ3JsZEtIR2VROW5RQUF2bDRDN0tK?=
 =?utf-8?B?cUhSSEpXeUxoQlJtTFBHMEpTQUdYZjVyKzFkL2tUREZGMG9VYlkzQlJ2VHlo?=
 =?utf-8?B?TWJORm1OMnpDUmN0clhQM1N6R0h1eUdGOXRTd1VEOEY5NGlMdjV6em5YN2kx?=
 =?utf-8?B?WEFHaFdzQ0Mxam82T0FHd1B6MElEbC95UUV3SVAzbGIxUEp3NVRvaFF0VXli?=
 =?utf-8?B?NTcvZXh6anFYaldRWFJ3MXRJTDkwOStBcXN2WXJXMmNVWDlFWW8yOHN0OEJm?=
 =?utf-8?Q?NO+w=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:58:25.0765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a2d9e5-8881-4711-567b-08de29060a43
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_130306_200574_61216BA1 
X-CRM114-Status: GOOD (  13.29  )
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

Hi Rob,

On Thu, 20 Nov 2025 19:49:36 +0530, Vignesh Raghavendra wrote:
> It's a requirement that DT overlays be applied at build time in order to
> validate them as overlays are not validated on their own.
> 
> Add the missing TI overlays. Some of the TI overlays have the first part
> needed (a "*-dtbs" variable), but not the second part adding the target to
> dtb-y/dtb- variable.
> 
> [...]

Fixed the authorship to Rob locally before applying the patch

[1/1] arm64: dts: ti: Add missing applied DT overlay targets
      commit: 56ca5a3030143906d27a0ce3e999fdd633a6e91d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


