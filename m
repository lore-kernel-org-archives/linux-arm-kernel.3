Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6FFCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kI8zcYrHp4olaaTkkMbYNIg3QVOdFBuKcUJ/qcjsNhI=; b=fqYWUKtXFu1Ydxqp4u7z1Q4RTr
	sSWEtO4DT6OSYEDpXJaN8QSJCUxD8Enux8u+LIq3/D/UYzFoakV2ZvwC4ejzjKl95WgtbZT+7Drs3
	TtGYejkOPMeWOvipWBu2s7x64OT0RZW4K21yN+0eVeuMaoI74mofCw0djceZBotDEt391HaIKDsrO
	Fv4o7bw5QblDC8m7OR07qT0d1q0kX/ADM6h1MHFc07vExlQWFOCtUC0D8oZ7rGHAlJk+qq5anBGnK
	gHPhm3nCZi0qDOF1vuqq0rcyQjBNO9lGCcZM/jy8bQt4lSVETl+rVGZsgPSK1mARmW384s1IBn0co
	7W4FLMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsBC-00000007ICZ-3MuR;
	Wed, 03 Sep 2025 18:25:58 +0000
Received: from mail-dm6nam10on20604.outbound.protection.outlook.com ([2a01:111:f403:2413::604] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uto1t-00000006fkv-1d3E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 14:00:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laGhmUK3zFrap3pNHxm5RfaP0hyBPa2fD03vgJgDnyg7M8XlEyJkbZtmojOJrRrTbU1ec4mRDUkC9Z+Fl6aTztA4FSRpMJotv69sOhCH75fxeEdLDZ7CKHlEN/VUpaHQFjG8klm6LwjFiTethn/H7d0cDsBlCETJCtdS3a7E+tsfaj7ylapI3CwVp3rmWfoyuvEeU6PYf7AtmVLpncxaLBPZ/fplYV0inOkE+E0O/fQQNiPOaLYsBivpScw9gVdRsu+N9ZpEJuSvv6jlrqSSYHG3vQSVznnT5yqCVB0PlH2FFP7WWZ/TEs6o36hfW6sTB7c+tOu35hCdx2+FufxNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kI8zcYrHp4olaaTkkMbYNIg3QVOdFBuKcUJ/qcjsNhI=;
 b=G6MxU2xBQ65p2aAQsOXQMB3Os/byOUBuE8cU+o1yGdlirZxz4mCpE45rAgZAwJmRz9bjcw5eOR2JkR9s0chE6GarF6C4uMr5ud/C5UbWWdF0MLcMAJkyD5PPcH7LHPbX2ctvmO5hWGgg+nAZH/hfPtvJm0oDfblcBl8dDUvoQA8XaIvURbmEbFQyikeQ/AmBELznhU1YH6WTrlIzu5Fkeh3HVXN/HM5z/Hb7JTTejNzzSz0Y9I7BA+qDbuZvD7HzkILslUIXc0dudsPOK6aCWr5Eo4Br/vYQjRo4FTbXIeriwKJEx2DIlRwKJoBYtHnr4jCxARC6RTBGrn57+pAewA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kI8zcYrHp4olaaTkkMbYNIg3QVOdFBuKcUJ/qcjsNhI=;
 b=K7FWTPyqO6Z5QYEqDN1jJZ690llYqPKS6UqwMEXzZW6lpSSiXCQ0mVDchbgsV9Ja2gMQJJQZpebSw2UOh+nMSgf7gNLrdl7cpV+nLU47Q39tyLt805u88fKyg0Nr4dvH/5Ve450rzl5m745C48BjuD6aPryzGYE0+diBCDYHoqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Wed, 3 Sep
 2025 13:59:59 +0000
Received: from BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1]) by BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1%5]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 13:59:59 +0000
Message-ID: <7e772d53-e151-4b20-8ec5-1d57bfb5f4eb@amd.com>
Date: Wed, 3 Sep 2025 15:59:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] drm/fourcc: Add DRM_FORMAT_X403
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
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
 <20250425-xilinx-formats-v5-5-c74263231630@ideasonboard.com>
From: "Sagar, Vishal" <vishal.sagar@amd.com>
Content-Language: en-US
In-Reply-To: <20250425-xilinx-formats-v5-5-c74263231630@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::17) To BL1PR12MB5969.namprd12.prod.outlook.com
 (2603:10b6:208:398::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5969:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af17ad7-1c6d-4a95-5e29-08ddeaf22be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WElVbEswWVFhT1ZtWWRBbkV1Rnp1Z2xDdmFxRDlkL1VDRVVxcFJPcTFvd0Nt?=
 =?utf-8?B?S2lWNkZWcGFsOUt6Q3dWSWpNaDJYcUZqbVRRdDZPUVhQSHRpR0dPK0VGYWtH?=
 =?utf-8?B?L3YwOHhsWk1iVUUyVjdWM1Z5QW5UTjgzL3dkUzRmYm9xTFduQVo2bm9wYkFm?=
 =?utf-8?B?RlRPSGh0YTRmYzdEUVFjVlFmRENsSUFQTGl1ajFxSXpYZHFhVjl4aVNlWDhX?=
 =?utf-8?B?N2JPMDJJVzh5OGJ4bGgzK1gvN3NsTnp5QlZUSEtxOEhrMEdzQ3BFODdHLzZ3?=
 =?utf-8?B?d2h1RGQxVDRmcDhqUXl1Z0owK3k0eDBMWnBXWHVxUlRGOStRYnpUWHQvdUpL?=
 =?utf-8?B?dkpTWklMYjk5c3duQWxnOU1CSjhyd3paYmxIRjVYZHpnNm1iWDQzV2lqMGZt?=
 =?utf-8?B?YmZLTjNuZ2NEWXE1dmVqQ3JFcW1BTTYwSi9wNWdadnU4TXlFRUg0WDR0T3RZ?=
 =?utf-8?B?MDZtaUM1enBxa3pXOEEwNWx3N2xFVnd5anY5WWR4NUdaV1JZcUMyUVlEQW9n?=
 =?utf-8?B?WEExMUlab2xUMWV6eWhaU0lrelZGTzFsamV6M0dJd1F2VVhuYlRCeXp4VU8v?=
 =?utf-8?B?MlEyUVhsSmpUOUo5REZ0dzNzZVlWTjdjSkd1K04vQXA4NEV5cVVSTjZuZG5m?=
 =?utf-8?B?M3MxVys0aWhGL2lTRCsyNE1ESUtjaFJYb2doVEF5REs1ekFnN0NyMG1QdW1v?=
 =?utf-8?B?bXlwRS9rYTVCNDA2U21XWHl4Skx2TE5KczlmUG1tSEo5OHJBc081WThRY3ZZ?=
 =?utf-8?B?TjVLU0RTSng2NnB5R09GUmVXK3RkWW1nN2FqWm5Gb0Q4RGR2K0hKZjRyaU1P?=
 =?utf-8?B?dWNCRjA4YmlHelhpZk1IWUpleE9DWW5YSnpkRkx0MmdWQU9pdDVoVlp6ZDc2?=
 =?utf-8?B?RGtCQVhlZFNQMTY0VHBBdk40TVhxMmc4TkxSSXF4dlFhd3NQdnJyZnZSZko3?=
 =?utf-8?B?eG0zcFhTMExmOXJkb3VuRkdxME11WitTWFhDMXZGbkpDalNGeEJkODBaUlFD?=
 =?utf-8?B?ZGlRZDJySmd2QWFFVlBJclBEOUtpVzRYRC9sd1E5Z2FBTlk0YmUvck1FYlhk?=
 =?utf-8?B?Q3BzY2dlWUsxdll3cngzb2ZnV3g5clZBYnQwTDJIMDlEM2RtdktiZEpuaVFM?=
 =?utf-8?B?blVCVU81cHFWLzZhMzV4eVdESDF2TFdVNER4K2RNeGluamxoNCt6aS9ZWGxp?=
 =?utf-8?B?bWRqbHhoSTNPc1B0K1RBaEVwVFZRMFV3NkhGK2lIVkRGeHpaR3BqZ0QxV2k1?=
 =?utf-8?B?dEFKa1cza1FyNkNCc2UyOWhIQkd0d01GelZBaGgrVVZtelduQjlxWW1vM1BV?=
 =?utf-8?B?K3NRWGZaNmtKbXNibUtGaW9mTWpGOWdiK2QvRi92Tnhic3N0c01tOWh3Z1h2?=
 =?utf-8?B?bnFBdklKakFJbmxBRDFmMEpxZDc2aitpYXcwaUNIdUtmMVgzTUFJV1J0Z0Fu?=
 =?utf-8?B?Q1dnUHM1am5Xb09TbjI3T3RRNkFhaTVLclEzcVhrQUVCOW5SNmhHQnpOdXZK?=
 =?utf-8?B?SXJGNk1CNklKRFppMGRQV2hydFBhNjI4c2lHRElUKy94VkJ0NWl6Z2JOVTJp?=
 =?utf-8?B?R0Q2MEJNeU9ldDA5alRRcDk3UGt1RDNKY3RzN2IrVUt6WitaQzBXQXhOcmRM?=
 =?utf-8?B?dy9NMm9JaFdPTThtU3J3enMyWHRSdVRnRmRCNHJFcVpwSUZKVTU0S3lnb0FE?=
 =?utf-8?B?U0cvRGh5SFk4N2QvSnkvOGpHM2JaMk5vek1ZUlMybGFtZjZOaEJBN21meW9l?=
 =?utf-8?B?UHF6ZE5CcXk3VGt1RHVaV2FZdkJjbFgxcmRkejdOZ0ZaajlENGxPeW51Q3hX?=
 =?utf-8?B?dGNIemNoVXpLWWo1aENBdk15QlhlajBiVGlvSkE4VmFLMHRCa0ZWRS9JclEx?=
 =?utf-8?B?N1prbHpsQmV1ejFVVVdYRTNnQXA5M25ZbTkwT25wRU9aWEJoRkpBQUN0TkJR?=
 =?utf-8?Q?rvuR4ioW/e4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5969.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nms2cWtCYkkwQnZnYWJXTC9iVG5CclpoOXowSjVmNUNwUndVbWYwWU1LdERF?=
 =?utf-8?B?MDk0ZlI1WWtCNk1xUEVKekNheWVtdUhVOGFKNVFCOEU3Yk5CMCtFMEJmeE9D?=
 =?utf-8?B?LzBDZUNBMVNwcExSaU0rYXhzd0lJYk42NWFDS2V6bUJtTG5wKzBsUGlRTnFx?=
 =?utf-8?B?Yml2T3V5c3NlM1hkRE80VnlvTzFIRVRiSjlqd0VwN1dvUDB6Zm11Nm04eUZM?=
 =?utf-8?B?Q0FXR2lBK2dFN3pvVm1YdjBtUU5hUFlOanAyNmwrcm5TZVJzdjBneUVQOEVF?=
 =?utf-8?B?dzkwWjZjVEs2NzY2OHJLaHpVS1BqS1NWWTR6Q0NQbU1aZU5OTlVGbTIrZmxK?=
 =?utf-8?B?cFkveDk2alhOQUZmQnBlNldxRlZkUDZ4dzBpa3kyczhnejB4YXFzVHFBV010?=
 =?utf-8?B?V2o4M2dEdE1ON1R5eXRoZ3pXMXh0ZG1IejdzUTluZ21SNXhLYWk4M3ZiMUdI?=
 =?utf-8?B?WDJxVk9LRXlOS1ZBR21jdnNucXoxUE1XYitmc0ZYcmxDU2ZET2NDa0d3TnFD?=
 =?utf-8?B?M3NMMURYZXlwU3BLRmQ3b28xZ0xoRGUzTW43Qi9GdzVOemI5RDhTdTRyUFVN?=
 =?utf-8?B?eVMxMEFCV2pYY0Z4akxCTTJMVUZhK1FMa2w0L2QyU1MvbENrclFKMVluKzhE?=
 =?utf-8?B?TElGZlZBQkNSQnI4amVkMWxRM1BGMVVQd0ZEeDJ3MW5NaklFeGhFcnRwc2ti?=
 =?utf-8?B?OURGNW15NUloc0Y0L0NvTXJ0TVpFbmVta3UyNzNpUmcrcnhMeUM5cmtUQXdy?=
 =?utf-8?B?bUFOeUw2Zml0KzF6RUhrWHNoaGZXQy9XYnpLcmFZbmI3dytQMVFqYm5pWUg2?=
 =?utf-8?B?N1VnMFZnU2ZVVFh2djNlU3hTU0tQQTMxeGdiREhBMUpUQTRaZk15enRBUnVG?=
 =?utf-8?B?RmxHQjhJbFR0WHRYdXpNUUpjcE4wUXUvTFRRTHVERVhmWkVvME1vOWQ2M0J0?=
 =?utf-8?B?ZkxlODNvb3laMGN6eE1LdE9HS0VlNlZ1cDg1YmhocndKZm1pd21OTTVtc3Y2?=
 =?utf-8?B?cW51VGFLTi9Ta1pEd2pWTTl4cmJCUEJwQ0docTdSckhmWGt3UWtuTnlZV09H?=
 =?utf-8?B?TGlHNFBmNGJ4NzhLVHVoRFdqUzI1MWtUSy80Q25yanVGMG96WTRmRkFKZzU4?=
 =?utf-8?B?aXVMNWR1dTlaa2pSUHVxdEhoSU9Ra05sNGxZaEx0MWp6K3FvN0ZvZ0YzWUJH?=
 =?utf-8?B?cWp0OEE4bWt2Y2hSdlU1aFh3TWVxLzFncThMbXhKZTdxRndBMEI0Q1lQMkZh?=
 =?utf-8?B?cjROOVlaMm5pNGREc2ZzZTNXZ08rZXdXK21iSlhkMUxqcGNpbkVNVVhzTE9H?=
 =?utf-8?B?Y09FSXJBY1FuZnpkZHRlYWtmUlYyZ2ErMjdydUFRbHR5eVh3bjVidTBhc2s0?=
 =?utf-8?B?Mi8xMXN5Yi9GbElaTzd1ZUsvdmFBYXJ4blFNUE94QmhHQU9WY25vQ05vR1kr?=
 =?utf-8?B?SHNyTnRlcE5PakE3cldDamNaOUtoNUwrakZBWjlBVnBNZkVsaStPa1lSenhz?=
 =?utf-8?B?MjBMQy8yUlVCSExWbmZ2emo0eVhidWozc2g0QWtpWTU5N2hMMkQ3OVltZ3lt?=
 =?utf-8?B?RGR0Tno2MUtxbkRnYnNrUG9NUjJ0dXhIYWxLbUhNUWNEdytXVHZJK0JjdHFV?=
 =?utf-8?B?WWwvKy9kdkEvVTkvTy8zSEdLdkRWdVlCRzArQlVzcnZUUkV3UVBrWVlRTVpo?=
 =?utf-8?B?RjdmSTZVb0FiL1FDZ1VSOTQ3TVpFWFRxYk5SVXNQQ2pQNSt4ZWk4emgrbFlY?=
 =?utf-8?B?UTRVd0lHU2Q3NWd3aHdiaW9aMXE5THhnMUdQQkxQYTdjYmxJQU91TGk0eXkw?=
 =?utf-8?B?SnlIMGJkZ2pQTTNvTEp0YmM1SWtSRGJlNW9ESkZsSThqN3h6bVFUcjZGRkFj?=
 =?utf-8?B?STRKbTJGKzhXK3NsRnlmMEdROWtwRmQ1d21XUU5hZG8wb1paOGxKRzYzdlRm?=
 =?utf-8?B?MDA1SzRyYlhRR2UxSzlXYU91cTRTZUQxc1ptWkorVkJOK1dnVVRyYWpPTnlj?=
 =?utf-8?B?L3U5SjhnVmt3UlhiL3hHV1A2U3JwNFVtV21HUmw0WDF2WUpBcmd0KzZLYlZ4?=
 =?utf-8?B?WXBPVDJBTytlQ2Z3bFJYQVF1ckIydldRTkdQbUc4cUZCUVRBZGhncFNyUWVY?=
 =?utf-8?Q?a08mbOqkjFSQrIpZ1oWs7sbNx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af17ad7-1c6d-4a95-5e29-08ddeaf22be2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5969.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 13:59:59.7671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a98be4Yx9TwVX1LUVd8Ft1cDJh+3I0h8gdJcriV3NlgGEBcAy5L4tD3FhZChwS3T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_070005_424432_ABC9A036 
X-CRM114-Status: GOOD (  15.22  )
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
> Add X403, a 3 plane 10 bits per component non-subsampled YCbCr format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/gpu/drm/drm_fourcc.c  | 3 +++
>   include/uapi/drm/drm_fourcc.h | 9 +++++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index e5f04f7ec164..60684f99f4a7 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -356,6 +356,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
>   		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
>   		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
>   		  .hsub = 1, .vsub = 1, .is_yuv = true },
> +		{ .format = DRM_FORMAT_X403,		.depth = 0,  .num_planes = 3,
> +		  .char_per_block = { 4, 4, 4 }, .block_w = { 3, 3, 3 }, .block_h = { 1, 1, 1 },
> +		  .hsub = 1, .vsub = 1, .is_yuv = true },
>   	};
>   
>   	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index fceb7a2dfeb4..df3dbc36c26b 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -385,6 +385,15 @@ extern "C" {
>    */
>   #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
>   
> +/*
> + * 3 plane non-subsampled (444) YCbCr
> + * 10 bpc, 30 bits per sample image data in a single contiguous buffer.
> + * index 0: Y plane,  [31:0] x:Y2:Y1:Y0    [2:10:10:10] little endian
> + * index 1: Cb plane, [31:0] x:Cb2:Cb1:Cb0 [2:10:10:10] little endian
> + * index 2: Cr plane, [31:0] x:Cr2:Cr1:Cr0 [2:10:10:10] little endian
> + */
> +#define DRM_FORMAT_X403		fourcc_code('X', '4', '0', '3')
> +
>   /*
>    * 3 plane YCbCr
>    * index 0: Y plane, [7:0] Y
> 

This looks good to me.

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>

Regards
Vishal Sagar

