Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2A5CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfxtYW0Oo06VHNdpHDE9fjYazTZAO912yvoOJIh/sBk=; b=reS6H7fl66bs8JsJEDKWRCiErC
	ncE8e7tBwlAI05BrgQtIWPj9G4FiFqrgiigRxNc7evB0wJsDWfeECGL9ZINu2f17Iof4EdpOfiywI
	K3JmqcATGLAGa+NG+wZb7mPERtn1U1EWrXLQ45Ec+ywSst9W8Joynjd661zem1rBToxZoFru9RHkd
	JtqLNQL/b3R/KNUc3qbYVyC9YjcnnHZG+rDJBVNMfQsxmKYwfYEhdndzmXusC+XPPdn6exYH56Xid
	qwQxAB+Qsg/IMGZMmfGEl72xWjMfXGLZSkl68f3WpoX2ObZGV4guP5MRQrqzN6xsoTmUQsEsqcKMP
	mwAMb0tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uts5n-00000007HSI-3d6Q;
	Wed, 03 Sep 2025 18:20:23 +0000
Received: from mail-bn8nam12on20615.outbound.protection.outlook.com ([2a01:111:f403:2418::615] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uto1W-00000006ff1-1c0A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:59:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTAqGyKI7NPm5C36R1fSpMs9b7W8Ozs5mMMfP8kUkYsFIzYvwd/g9lXyg6MP2sPYPDSkQJRR7Q2VYzkkaOhr/wzXpxzCUTfeU2BY6cv57S5m4nQNFOv2BitzntDKzg/SC8JZXUvGrHJdfVAB7gl41wrm20iki4n+uEsBLiT+/yhhydiN7sj9vEwj59Iu7im+f/0VSSWncjRhM1RWZjS6uUNm/Nz82sDE5r9SvxZJwhsmUHipSyKkOqJ0FcsVZHsETf+susGJvBqkIDaWt8ANLSRfsWBgIjetqgnB8wtKSaraetYfl8PufHkHADyfo0bxQo6iMwfzbAvxodG8jBOHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfxtYW0Oo06VHNdpHDE9fjYazTZAO912yvoOJIh/sBk=;
 b=mXUchf0DjISJxABuW1lRqSw3AmmGoq41e0CdyVm9DelLsyFI8Q5dd5Tqgwt33DCFgP89cc2CrHrdFUR0CQdeBtK6zLlrCn4IH+lW5ECvtGDcl2O/OY6ogsZ8OQTgRfM+vAM6LPUsRtLVGpi54aBW1ArYUYWTSzq3xTMgH44OnybUQahjwl5P0EPuNCj+LBhkwuIZ1WxS/9HJC2BkCRe9XZG1/gE/AduUE8/DryNf7leub350+SyOr2oqE5sRx+SHHn1+LXUzwDtFISwRk9JGmPMg8kYuRzuXV54B3uisbL52oxhsH8BoVHiiwEGbYG1k2e46L1M6mTvKZ9DT8IlnIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfxtYW0Oo06VHNdpHDE9fjYazTZAO912yvoOJIh/sBk=;
 b=bQ1hwsKCl9XR/7bfaeFLx6kmwILuX7zdnXMPndUkItbPGTr59w9f62Gfp8+AGEJsUSN6WST36ElL1J2fRbP1UhJC5MMqnndH22ElTks465zsN8KMM9tNhYJCbDSTtm2FswebWNbV/sCvomHcU+G63KwGwKL72L91kAOcdEqSffo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 13:59:25 +0000
Received: from BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1]) by BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1%5]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 13:59:25 +0000
Message-ID: <52c7e4b4-6531-4268-a867-78b434fed9d3@amd.com>
Date: Wed, 3 Sep 2025 15:59:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] drm/fourcc: Add DRM_FORMAT_Y8
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
 <20250425-xilinx-formats-v5-3-c74263231630@ideasonboard.com>
From: "Sagar, Vishal" <vishal.sagar@amd.com>
Content-Language: en-US
In-Reply-To: <20250425-xilinx-formats-v5-3-c74263231630@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0047.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::22) To BL1PR12MB5969.namprd12.prod.outlook.com
 (2603:10b6:208:398::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5969:EE_|DM4PR12MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: ce677def-5e0b-42b5-470e-08ddeaf2177e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzhxcS9jdk0xZEN2enRicW1VS3dqS2pLMkVBWjl4Q0ZpSmhJRG9Jalpqczkz?=
 =?utf-8?B?R0YvazRNN0cyZFRDbVlETis0R1hCK2t3cHdWY3MyMkltaWxKZTExM25DV3ZH?=
 =?utf-8?B?d25LcWZZVmlHcHdWVmQxSjUvTXU5empwTk94eG5rSXY1SkFVZWNZNy9RZytn?=
 =?utf-8?B?OTNOcUNuRVg2YlFnNW1RTmlSUnM3eGUreXoxUDk4L0NFNk81aEdTWjN0VGlZ?=
 =?utf-8?B?MkFHQTI3cVEwWkk3ZTJkT3hFdTBxSG1IY0M1U3pRMHN4Z3ExclRJTGNhdUx6?=
 =?utf-8?B?UkhhS0MvMDZza1YzQUNrVWtnNEIyTHRhVlhmemdldFgvV3lTTnpjKytwV3BV?=
 =?utf-8?B?cFBOclBwVDRzdVR1TjZzZ2dTbDcrVVdQSTk2elRFWWtQTnpyZGFvakpRZkxp?=
 =?utf-8?B?U1ovL2JUMklZaUtjMGVoOHhuZlQzdHlPSkp0Mm1oS3FOOUlrWlQxVks0clZ1?=
 =?utf-8?B?dGltbkJUS0k1WUZqWWZ4RHN4RjRuSWtrT0Y3a2M2Tk5KV2dVQmNSSjVjNjkw?=
 =?utf-8?B?aUxoY2V0czhRR1lUWTlvd0hXRlJuU1FhSDRGaFdJdXBFYkxCUk14QW45ZjNr?=
 =?utf-8?B?YnBXQU1nQ29meGw2WHo0WDNXYmJ0Q1hZTGFtbllqa0g2aDEzKzNqRjdjZ29r?=
 =?utf-8?B?UXJxeDRFQVBHRzgwM0lKekd3ZisrczFkd0plOVphaDlPRzVyNTAwUCtVeGNm?=
 =?utf-8?B?L29pMXdTQWZMNTN0UjFLQUZ6dUhVdG9zSUs4U1d5cm1Rd1JrR09sSzZQR3hq?=
 =?utf-8?B?RkdyUGQwZ2Z1eW1CRFpON3dROHgvaitWL2I3NTNGTGNYWER3c3dWTkdUSC9B?=
 =?utf-8?B?ZWhmWGJ1bUFRTjdIcXFUN0tQcDBvcndWM0NDV2tvaWR0V25zc25DOU5RV0Rp?=
 =?utf-8?B?bWlsK091d01VY0M0WHhiQU5DbFc5bXUxSkduMENSa0NZN2sxR0Z1S0tYUU1H?=
 =?utf-8?B?SzhDRThXZUkyemhvTDJZdlpIMEIxQ3N2NHJYcExwYXF0dDFBN0syRGtCNWdQ?=
 =?utf-8?B?YkZZMWdmTnhYZDJ0S294cGF2K3FTSXBOSzlYaTJYSHFCcnRaSkJ1aG5yc0Qv?=
 =?utf-8?B?Q2R3eHpPbnUwU2xlRlFPbmZsYUJuWmNZWFlnMytKbHZyUXJQMW8ySmQzWkNs?=
 =?utf-8?B?NWF4MXVOUURkME1PeitkQUM0elhOZUx1Q0dkM2JZdGF0cHAyUC9yMUtGeFhE?=
 =?utf-8?B?VFhnOVh5bm1scE1XenVUM1BwdmhHbjBscXZXeDB6RTZ3SDMzWWU5WEpNcUd2?=
 =?utf-8?B?cmtaNDVqNmlSK0Q4YmliY0RpcytqTjJ4MzBRTEtXT2hCWEFiS3pxemlBRytm?=
 =?utf-8?B?bU1nRkY3V1ZESkRBQU5jTUE0NXFpUmJ6WURtTnVCcHlUdkducTNueTM5NGtI?=
 =?utf-8?B?aXFsOXlxNjU2Nlo5VEN2SEtVS3lmYXZPdVBPa3JJbVdSbzRLWmpFS0NaVnYx?=
 =?utf-8?B?VDdRSWhJV1BpZmpLWWdqQUx4UnRhdU5odTF3YlFDQWZZWmdBcXYzTUR2N243?=
 =?utf-8?B?VUcwS094bGkxNTA4dWRYMlZhaE1hYm1UcDlWaUg1TXgvSktVNFpoalg1cXd6?=
 =?utf-8?B?Y090QnRwazZFSWZuZEtmcFBVRjZBNzhtN3dVSEpyV2d3YUEreWgxWDlpVUdP?=
 =?utf-8?B?dnA5MjlUOEFFY1pzN2I4NXJUWDZIQ3JHaFo4c2d4Y3p0MkE2dCtzRGlWTzRY?=
 =?utf-8?B?cGhyUlM2ajFMTXlISUlnYUNNRjUyUktMcy9vbUx1NEhVeU5adWVqVURuTnJ0?=
 =?utf-8?B?Sys5ejVaR2FMZmFpZGFwL2FxNkt5VGliR0M0NWIzSDZ3RzIxWTVIY1Jzc21t?=
 =?utf-8?B?NjRQOUphZzZXMjB5WEZXZkY3V09pSHlOTVVXUnNtRW1jTHJmQkpEcjdOZ0cr?=
 =?utf-8?B?UjRaMm5Ka1ordDBUUWtRSVV3S0dLYmRrVzRDRVFFODdPeGJ0Sks5TXlTSlBm?=
 =?utf-8?Q?7KkDLvEj5qQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5969.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVNMN01WZ3I2MGRzVXFXWVpDY29pOE4wRW5IZHNyYW9yK0pEbm54NW1yYjRi?=
 =?utf-8?B?V29WVlAvZGhzdzdMT1hQZ3JKSGkwYWZ0UVBvK0ZFVUhXRXNZQ0Z2OUhZWEhT?=
 =?utf-8?B?QzBTL2pxOU90bGZEdGk2b0JjQ0lMV3JtTnJxU1RaSGJTS1FRYlYyT2NUNFBl?=
 =?utf-8?B?YTl6dHNJaTU1UmJUTW15SWM1S1lXMi9adG9iMU94aEZ4Mnh1U0hVK3lWc2dr?=
 =?utf-8?B?c2lLOUhIcFNVRlJ2N2xrMUZLQWZ2Z1dyRTZralRrRm5sSHYwbmRMRmlLVENU?=
 =?utf-8?B?OW9PS3psQnJnRXRsZ0RrYVZjczMzWXpaek94Zmpka1Z6SWlkT0VocDdwU05S?=
 =?utf-8?B?MDNTUUlTdHMrUjg3VzdqdGhpcXcrSWRtMEJFak5uMUNleFB6dmV3NDc5MUpL?=
 =?utf-8?B?MjNhbzB3L3RNTTFmY3NCbEhFRUd6K0xVODc0b3oreGk4cW5CMzRWamx5S1lv?=
 =?utf-8?B?ZnZoWVU2bUhGZkQxak0wV3lRdWlYRXNxTE5mNERsclI1Z3Y4bnN6UmVHeWV3?=
 =?utf-8?B?VHlSMmlmQnM4MGx5NkRxS0k1N3RYR0p1bmVEbmdvY2R3V29qNEx3Uy9lQVZD?=
 =?utf-8?B?YXArdFYxeHlqZmhjeGx0bTI1aFY3UDFKZWZFbCt0S1kxc015MWVJRUpoZTR0?=
 =?utf-8?B?QkpUdEZLSm9sSU9sY01URVB3bmdHaGFkWDJpSFJnV2UwS0dmNlpsVWRoa3Az?=
 =?utf-8?B?VnFEWG8ydmt5RjA2dWlUY0hsTW5JaXJ4bjJJYWpGVzZoeHBhY3FzWUF2ZUM2?=
 =?utf-8?B?RUV0V0Y3cGlMcFh0WXJsZW51djFSamhMenVTRDJHZUo5OTBKZUdtdFVrS0Zk?=
 =?utf-8?B?b05zVlpuRFdQbWdaaTA0U1FEUkQrQWtQcnlrY1o0M2VVNjRuVVRrMVJONVo5?=
 =?utf-8?B?UUFBcFBCY2pjU1R5SGVQL2U1blN3Rjh5Zm83ZUJpejZadnlWTlFxeE4yVXV3?=
 =?utf-8?B?bFMzRldnbXVZek9HOUlYTjE1UjloTjlVNTNDTllUVWVaZUpCTDdETExoRFFB?=
 =?utf-8?B?ZWtZRHhHUEdiakNNWjZBQ05PNVNTN0x0cGxXZDRoeVUyUGxNMGJXSTJlcmhD?=
 =?utf-8?B?OEdWYWViZVdaOGY0czJSbU03ZW12UXlNWFRZY0pBSWtHSHVyaU1LR1BFZHV2?=
 =?utf-8?B?R3F3TVI4TFlFN3lJOXZTdEhGSGlZMlZ0M0tOOWp1UXRWNlVEUWgrUG9IZFIz?=
 =?utf-8?B?RW12Y0ltMXg3UGd6NkhCQTF4d0dhOElUNUtVdW4vdVFMcXhkdDdQWkJacmNy?=
 =?utf-8?B?QXJJb1I1WDhINFQ1RHBuRTBiMDBUWGM5cEo0VjkxemJ6QlFBcklRMFJaejRT?=
 =?utf-8?B?eUk5cmdpVnlEUlMwYzYwelUxV0Z1TTZBYVhUaFVvbEFDcWtjcENZYjQ1cG9j?=
 =?utf-8?B?Qkt3RVljY3dZb0tiWFJtazE0K1orb0cvaW1adVV6NDgyTWMzckJ1STc0WUNG?=
 =?utf-8?B?ZkhYdG1mOEQyN2Z1clRHcmFHbGI3UTNkZkwza1FodjBkbW1TREZlUWRud08y?=
 =?utf-8?B?WUgzVHc1K09DZFdPU3JTVkQ0NVFwYURnd0J4MWdJcGNrNWZMdlVxajMxM1h0?=
 =?utf-8?B?K0EwZFFrU2M3b0JZSXU2cDN6dUZMSnNtOUxlc3hsVk5TREVwcFNiZjlIYnBa?=
 =?utf-8?B?UnAvNVBJNmlBeFJBWEhPSGtmSURoTzhPa0Q3NW5ERlVvRHRsczFiMXpCbnUv?=
 =?utf-8?B?eEEyekF2QlRUOEVVQXlFWXAzV25hSmNpUU4zMm5hb0Qwd0Q2Vk42RjJXUDAx?=
 =?utf-8?B?WjdpejlDNXJhRnZTREM3VWV2M3NZZTRLZGNlU2Q4aTRybkpSckhuTWhRRjRZ?=
 =?utf-8?B?YUJMWmJjZmFpSnJmUk9zUFM0aFhFYmtkTklib2o2SVA1WmZ1dlR0RktmaGhz?=
 =?utf-8?B?bjFrOVBRK2krUm14YzlLN0NURXd3dFIzUFppeXdaMVFSc3oxUVZrd1NuZlRl?=
 =?utf-8?B?V09kL0hKaEZkYVljY3NqZ010bjBtNVRQRStvWEVmMERheGJUSnhwNUhlc0Ez?=
 =?utf-8?B?dlo0RUZZQWV1RU51WFNXUFgzdmIrakF3dGo2TG5DcWJoMmdySDVCUmxZWWVU?=
 =?utf-8?B?YkhiUTVPUStqZk9DTTNEZWVyMWdoQTZyb0d5SkswbXRLNTlMZmllVEQ5SjRS?=
 =?utf-8?Q?l0zVthS24oKOOVtVBooJa2rKs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce677def-5e0b-42b5-470e-08ddeaf2177e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5969.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 13:59:25.6506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODSMFueTT+BRpQDYpHcsjqhfWKWFSBDeMGyr/K47TW8RxkOgehXQm+7CArs8uAQA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_065942_419691_73612F16 
X-CRM114-Status: GOOD (  16.94  )
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

Hi Tomi,

Thanks for the patch.

On 4/25/2025 1:01 PM, Tomi Valkeinen wrote:
> Add greyscale Y8 format.
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/gpu/drm/drm_fourcc.c  |  1 +
>   include/uapi/drm/drm_fourcc.h | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index e101d1b99aeb..355aaf7b5e9e 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -267,6 +267,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
>   		{ .format = DRM_FORMAT_YVU422,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 2, .vsub = 1, .is_yuv = true },
>   		{ .format = DRM_FORMAT_YUV444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
>   		{ .format = DRM_FORMAT_YVU444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
> +		{ .format = DRM_FORMAT_Y8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
>   		{ .format = DRM_FORMAT_NV12,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
>   		{ .format = DRM_FORMAT_NV21,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
>   		{ .format = DRM_FORMAT_NV16,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 1247b814bd66..5af64a683dd7 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -405,6 +405,16 @@ extern "C" {
>   #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
>   #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
>   
> +/*
> + * Y-only (greyscale) formats
> + *
> + * The Y-only formats are handled similarly to the YCbCr formats in the display
> + * pipeline, with the Cb and Cr implicitly neutral (0.0 in nominal values). This
> + * also means that COLOR_RANGE property applies to the Y-only formats.
> + *
> + */
> +
> +#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
>   
>   /*
>    * Format Modifiers:
> 

Feel free to add -

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>

Regards
Vishal Sagar

