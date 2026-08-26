Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F68C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 18:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdQirvkgfGU1wylee9k5+VS64sXWRurrqgI/ua7BbNE=; b=nw61p28PxccCpsZZ/pM6ENdu2D
	dOv5/6Du5meMp4qvnwH6GhD0F5YVHhnvp7ac7C0HMri/drbcaOYL4vrTecsNSfmNCmzPG9uZExrf+
	W0sd6Pcuq/HUyXdGzG8kLW26zW/iP932+jEiP9vA7jA6r6CK6gTa9yxEomqjvO5FBs9QPqkml9MDp
	lgAPIGrXQvltiufW0SxagljhPjwfuPxf31UuQ6k/EPB8QZhq3r64XNXuHT9VZgSnIQZPykX3+XgZe
	/wUsuFNTOZDEpIr8T35gqftqoXgx9AEqyPzgnKwNXMIb8aELDcixkd8UeLsfhkvhKvsTMHsCnf8Qv
	V0GsFhwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzIDD-00000002rTm-3dCw;
	Wed, 26 Aug 2026 18:18:59 +0000
Received: from mail-northcentralusazon11013040.outbound.protection.outlook.com ([40.107.201.40] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzIDB-00000002rTE-1cij;
	Wed, 26 Aug 2026 18:18:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCKV3pqrDpoGJIU9ukNDIh+gS6Zi+mtflOZqCVZzV8PsviEbfMVDoNblDEovvtWBiIm73crhTEQBIY+5gj/WWwpYO8pbVKS0r4MYxJ4reJel0CF1XRCVlIL+4zTASX74+ikcqqL5pYe95n6S5wi7Kh+qDIoQbZ20tshBiYrYAIOMl3mGOzCz5aD6Jj+6BGEygg6KfI9XtMPxnk6rfb4dhDMMgeq/ZkC0ZU/mJniRbK/KS5HMqvx1WCY2LSTOT3+daxmLAMaqcaJCJ43PN7Pf1An3/DUPVrZlUNV3hWKRnm5xB/kKomfO3Y5iDWPprI1s/GLUrihn7buf087GhxKDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdQirvkgfGU1wylee9k5+VS64sXWRurrqgI/ua7BbNE=;
 b=iWEfzSuMuNWmAdCSPoAA74If9ob7d6TWh3pwpw/nhK64E8aMJlIg9p1OmEVUy5VtGZkIAbVczz3dydChAxxxcaKryl9UImBO1XnWVuJhA5UXZVlUK1/hQCO0E8f9Prt7C99TcN+A2SNbg55fxlcP9AigGvV/i5TciiDcN4m71nLwK0ACeh01X6yPL4OK0fV/UFFK6C2aH9hK7d5w/gHWACxz4j1UhGwDA071lkFN6GpZktfWoOCGc6vR+N99ynTE+kx092bQgIcvd57l71KbYkk6spdfcpYXPslKrbhyzXvF5MQgn3LsKKHBDFbrjC4dBQf1blSzAVNuJA2obXTxYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdQirvkgfGU1wylee9k5+VS64sXWRurrqgI/ua7BbNE=;
 b=JXtM2AF7pPWMpVPF+VdR4ZNlPVXdBCu5aaJ4wERlBHUGRra9SbEVOuQzy0fhh26pLv8iiGbNsLL+cVUDWmjnFGK+6g7nxfdYI1clpjX5ty2oeKo82iTygKvwKb4FnqDtXwc6aADkmJG58dwemf2C6ydkEiGWL7KgzUXGUPxWmsaQwAVLCZwadZYM024zdr7r5/y429xQ9hukLK04oF8T/SxihE79kzx4/7CR8skccLxy2SionSMyYFMOqNmXyV9q4Jm3p6jPF2q/wHqE2yiNbvD+SnQypaAhFsrfW2+q+tpxTCOqmB3MrXubwFxNW5ZLDp1w2cXV0w1iyvSijm46oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW4PR12MB7437.namprd12.prod.outlook.com (2603:10b6:303:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 18:18:44 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 18:18:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 3/5] iommu/generic_pt: Add Broadcom BCM2712 page
 table format
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
In-Reply-To: <20260825-bcm2712-iommu-submit-v3-3-7f143e7289b6@reactivated.net>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
 <20260825-bcm2712-iommu-submit-v3-3-7f143e7289b6@reactivated.net>
Date: Wed, 26 Aug 2026 15:18:41 -0300
Message-Id: <178776832179.3356902.2549494595646134732.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: CH2PR14CA0056.namprd14.prod.outlook.com
 (2603:10b6:610:56::36) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW4PR12MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: b11b7582-265e-4191-9ba8-08df039e76c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: N6fc5aMVWNkYS5cE2LJDK7yixm0yfIAnb2dGVamP111+eFXAflz5MWjEtfoQi/JmCIQRAZcus7fJtndujCsLPkMhNb7UTxkB6dSC5wLaEXWZ/R0nqikBeGI9GMMG+FP5AEOE6xpkny5+Il1fHgPbxM3oFqAD8+jMglLSV7hHkIBxvtvJdMk779JrwaTjOLyzoPS0lg+UU3wLZbsVxLYa+X3cdPnZyOtBIajpgbsF7XBlPb2mvWFyEGi8VN5Rjsb5OdMTPxtuw8wCB2/2NGvmn9zR/Z7XdjM10FKvH+3GDLFmbJNJbm2JgTBQAx+Lb59cIdG9APCyCdSPPkeV9jw/35F2fwUg9MK/wx5irdf8aTfxwL1IMLXT8VNtvwTKJ2zMwl+52MkVWBPWrlxc8RhaXA7CcUpb5kgtCbjUGZ32zy9v+TnBhuNiT89yqMY4V0zapRFxMjux+/ycgHBoHD8JzPaRHckZsF1WXMUGjDrrLVvRVOqQbqXIDkfJmTgnKVxZralLLSXRKMBFY/foXCusQNRgIyKqTqpWZDert2LKOrafYj/gjexxIv2JwcF6onKGnSMMfpvEMAvc8n7rCL8D/dgCC6xBLSzaYBIewn17nrolBCwHK6C2uoWol1CLMrrEdFNTaMZoQyxyob+AczHpG95MlnuhVVKEZWXju/VrejA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emRHcVRjUGx3SFpmcllFT3h3MmZPczlzU3BZRDdxbnZ5cHlWYmlqQWhEMm9B?=
 =?utf-8?B?NG5KVlVaZDJCMHJWRzQxMDV2V0ZkSk1vTEdlRUIzOFlmQ0ZkZG5SdUkyai9v?=
 =?utf-8?B?YVZXbDM2NHhUamRtQlcwdmNTSVoyM0xPNlZ5Z1dMaURxSmFVQ0h2VS9lVXN2?=
 =?utf-8?B?bHdGUkpLMXAzZlA5MHltS2hDQlNoWjlvRWw4aWFtQjRwb0RDMHFLWWYvRmhH?=
 =?utf-8?B?cDdIdlJZd1NrQ0t4LzM3YTJQeldvb1NlZWdCUWcyNWJ3bXVMZ2dzbmNtaW15?=
 =?utf-8?B?OWprREtnU0liRG16d0lHU1EwL2plNFJSc0pLdWhyaDFZTUt0ZVR4d2FmRXlB?=
 =?utf-8?B?dzVxT2RwaHhJcEFoSXBvWUVTNFZvcUpLVVZ0ZzBXUmRwc3JHb1Rwb0t1VFQ0?=
 =?utf-8?B?azZTU2tmaXIrYitqTXpMb3BjKzhPT3NpdloyTzFpaEhUSUpPTUZQdUFiRGRx?=
 =?utf-8?B?ODBsUXRGTmdMaEMwNlZIOVA4NVNFREZCWEFPeDk2Q3N4UlpZdnVKR0VjOWEw?=
 =?utf-8?B?Q1lISUxQS0JIZjBaNFRFNDNiVEZKQXYyalVkRmI4S0RnclhrYmZoNEM3ZHBE?=
 =?utf-8?B?TkJyaW5mYkVIN3A2M0E2NW80UklERVZKeU4rUUhaMW1PNStHSXh1Zm9zeHFj?=
 =?utf-8?B?akJtbjB3Q3d1eWJ6V3FpcEYzbG5XYTZFUU95eXJBT1RVZzFDV0RsdkFFMVhN?=
 =?utf-8?B?S25QWWZGUE0xb2RxYmlXSTcxSW9mUDVTdVZOK3YxSFV1YmVJUHRLSjREOGNp?=
 =?utf-8?B?aDJPNCtDeTVEbkRMbjFHV05hUG5GZTZPaHFvU09JSUkzY0ZjSUljalZvK1J5?=
 =?utf-8?B?MTg0QUczN3RVM2tDb3hFZjRCUWl3NTN2NHJMRFpyUGIrVzhGM2E1T1ZPUk5I?=
 =?utf-8?B?TjltS005NzRLTGJkVzR1ckdCdVhzSkpuQWNmVFRjSHVxYTBZWDJudzAvWngy?=
 =?utf-8?B?R256Zjg4M0kxZTZXNm5PaXRNaDZ3US9DTWFvOTlERzYrZ3M1cmdBSDY1RUs5?=
 =?utf-8?B?NDVubnpmMHkzV2J6dUhvV2FxVGREckpCcG1KNmo1R2xiQzZTKzdDSGRZeGNp?=
 =?utf-8?B?RkdHdVJ5OGN4NHd1N3NONEhHRG9QenR1VE1DVU80T25hTVAvMGF3VTFOeVYy?=
 =?utf-8?B?elJ6VmpWN1hleTRjTy94SUtoZDV3OXFpYXEzcm95SndIRG02OHMyTlRid2I3?=
 =?utf-8?B?L0I2SmQyTjQybEs3dm5ybWJ4Y3l4VURJM283T05CT1M4bU54ZkNIaGtkLy9P?=
 =?utf-8?B?SVNGQ2xGNm5JZ3dlaHVIUE9PK294VFE4RlVzTnlIQlJ0VHgrV0JFcG1VQmRG?=
 =?utf-8?B?ZDdidm1RSzNvWFUyZS81ZHhTQlNCSTlBYnNOeUYvTmxmUEhWY2FyNDVIR0lq?=
 =?utf-8?B?WFJWK2RLNFRUVVNnQ1gyOWowdmF4MytMUzZQZW9BNXl3bUxVV2xWcytUZjNv?=
 =?utf-8?B?QkRTUXNON2dJSkdVTVNMQnVKSGRKWkI2azZxbkl2UDk2R0dDbUlNT09rN1VZ?=
 =?utf-8?B?REttbm5VcThxQjRhTi9VY1ZjeEZITmh1Zk1OSnRBeVVDRWRlL29aQ0Y1dTVu?=
 =?utf-8?B?d1oybWRscmlZSUR3elFBU0w4SWRVR3pMODJ0WkRHM0d6aDN5RHdaS1dRNS9Y?=
 =?utf-8?B?eVQ0QzJoWTQ0WTRyR1FFNlN6emJIUVlLN0prU0lQOUFhNC81Y1lFNDRGYnRl?=
 =?utf-8?B?cU1SbEY4YkhwNTM5Wlk4blRkeTdzNFJRdlBMN0RzSTZmVmJNY2x6WWdKQ0Qx?=
 =?utf-8?B?YkV1aTgycm5zTlIxbUdreUU1S3BKUGR0eHRQYnkxeHdVcHhUa1Z2WDUvdUY1?=
 =?utf-8?B?UmQyM051Rm5SZmU1Q0NxenNNUGhaMThqUkVSZ3dlWjFaOHRpb2ovMGQzWXBi?=
 =?utf-8?B?bkRyWW1ST0JsZmNxK2RiUnhRRUxZSDdWY2JWd0V5ZjNUeEd3NkNlNHlybkQ4?=
 =?utf-8?B?WDNFUEdqb0RBazJ1Ym1NcDVpdDZsb2YrMGR0M1N1YTZsUW4rOWNlcUc3YStz?=
 =?utf-8?B?TGwvSW5tUVdmUDNocStxbDlwNVY5Q1J5NDJsUG9oZGR2WE9QY2lEUU14aTZQ?=
 =?utf-8?B?MnBRcEMyMHhCNE5YNjVOVmRqYy9PT1FKaVlFdW12d0VyZzF6RkVKd1JqalJW?=
 =?utf-8?B?SThlZkl3b3VsVE1EYlNkbmM1by9LSDJHTGtXdlUxWnlUM2FvQUZ4aUFPY0Vk?=
 =?utf-8?B?NURBcHpwOFI4enl0eGR6RWNDVm1BK3UzaWZ3U1JKYlNhU2s1d2JNekJkU3Zk?=
 =?utf-8?B?VGlXb1l2Z0c3cTBhRzM2MmpqUWp3U090MWN3c0pORkxqZzFoYjBZRm52Q0tW?=
 =?utf-8?Q?5O6sfhJJB0yHucZfOU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11b7582-265e-4191-9ba8-08df039e76c8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 18:18:44.6022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7TIPm4CLsiM1+6Cj92pz4WUkpolhq5R27jliej+r2sYVI6/JT/RU6uzSVjDmv38
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7437
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_111857_439358_DB35A1CC 
X-CRM114-Status: UNSURE (   6.72  )
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

On Tue, 25 Aug 2026 21:56:06 +0100, Daniel Drake <dan@reactivated.net> wrote:
> Implement generic_pt support for the 2-level page table format used by
> the BCM2712 IOMMUs.
> 
> Adapted from Raspberry Pi's downstream bcm2712-iommu driver (original
> author Nick Hollinghurst).
> 
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

