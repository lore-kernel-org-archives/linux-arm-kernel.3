Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C561DC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nkw+WsKEVnM/AWz9Ogn8r+VXbyW5eIxZjkyDan3DX84=; b=Dvvxm23zEEQCibPS83Nk2NBaRI
	PY83VB+Jcc8QfllArmJF2wRnmXrERb5c4KB813RG0hO8TFnPydynFgiwEtf0qxs82Wsd8o5i/mAlv
	jQRE/G31ReUGuIRHPKU1xPoVvHiJTFVgQhD/YHhwoCCHyq7FfRxRddPa9NyxNWVYQFkJGPXH/vkeY
	IWcaskEjtIU18Z9JhJ1OzI5KbctheJBtfbUOOqAqhH5WRnzw6gTQ6OPxmM21/6vuABS4IrbUcQplA
	ZTOq5uBebqbWHfcTqD28nT4ecyMYEh7wjG/QezpyjklqewBmQt5Kb2LNvDOI3267gfEOXpoQ4Txvw
	98XQkspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAii-00000002Eq8-3BNd;
	Thu, 20 Feb 2025 17:52:20 +0000
Received: from mail-mw2nam04on20614.outbound.protection.outlook.com ([2a01:111:f403:240a::614] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAhE-00000002EX8-0Tf4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 17:50:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFG8mgHgBlXtfi31JoImgPpjxv3rVJBskbweqWr7hhTuL6TWiMeWQ+MJHheSq12GlyOxIYijW3nBX4+gzgNE/Jw7vl81EvZWBVoN9qd0GcJauZicuAbFTa3vkt1oZbKfhUPgXcUSuIaGCEmWl3t3hkEkOm/ff2cvuv1GUxDlGD50CUXNxRelLP9rsAlK9A8AA1C8JBR0ODUHYj3WltLnMuiL1z+24wxwodYI+jV2PW+zmaZ6cOkBWgRJOTf177dmGfdbELlh6PF7W4RJThdvrgbE+JUqyg9JlfZ0aRqrsE1ONFJbcgS3MWcWCu+fDAoLb/njcLQCN/sFGajgo3zZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nkw+WsKEVnM/AWz9Ogn8r+VXbyW5eIxZjkyDan3DX84=;
 b=ZdYwrKzAemYcVl/OYWfotL1H+8pqULUPEtSen0Ior/VPc0iyqK/WsoCwTi/nxGeggsqa2VWTxGKSSDSA1L/bTc6O3sLYuzK1wF2/1tPGhqtyHwdIVDVThbhx4GblJFXgmJfSwpINQyQG/Nc+zSLr120oXmFBqj2ft9p6/pRP/zx633Ny4JcIHeFfWC9mYOEou9wUMloFP/C9smlWroddO7d3FrCB2CdpuTqukTEpbH5w1rXJFraAZPEKASi7rE+x/hbRhozPTsZE1lgWDNi+YjUuov0Dd1mcc5Hc3iNqu1eX1x/iF+o1p5XTFL9Rf96arz8hl/cb0K+ZZdO5avDNww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nkw+WsKEVnM/AWz9Ogn8r+VXbyW5eIxZjkyDan3DX84=;
 b=YQMgQbuM0UVgvP3UgZXMcfpYE+5GhblqBnCThZ83rq06vzBfFobprFfJ5lQt5buuZaLtjGp7sRr2i7gNhQPDUeHioecuvWFs6e/BtlxqgfOp321G/SKeVnjiteh4PYl++P5nqXHWUR8wJd+CQaJeZBrWChpAp7uWWZWi47p9C1XyCYi5RQE4HheQ4KH5rZPpc+/dGEXjLyCRzmweG7iHstxd3F/QazJIdwvgNfIuXcAp2YvcR4vo8mn/rKhUAroNEQfyyZJ975KtPZcCnx3+m4pJc9QBGXUYMsVEvRMJcEeDPjLhw6COn0gs+YJRJ/4iMH2B9zf5CXuSNzA8WjdT8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA0PPF04DCE520E.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 17:50:42 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8445.019; Thu, 20 Feb 2025
 17:50:42 +0000
Date: Thu, 20 Feb 2025 13:50:41 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, tglx@linutronix.de, maz@kernel.org,
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	shuah@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	baolu.lu@linux.intel.com, yi.l.liu@intel.com, yury.norov@gmail.com,
	jacob.pan@linux.microsoft.com, patches@lists.linux.dev
Subject: Re: [PATCH v2 5/7] iommu: Turn fault_data to iommufd private pointer
Message-ID: <20250220175041.GF50639@nvidia.com>
References: <cover.1740014950.git.nicolinc@nvidia.com>
 <ee5039503f28a16590916e9eef28b917e2d1607a.1740014950.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee5039503f28a16590916e9eef28b917e2d1607a.1740014950.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:408:f6::13) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA0PPF04DCE520E:EE_
X-MS-Office365-Filtering-Correlation-Id: de941c7d-77f1-495e-34d5-08dd51d7183f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I91fTGULEHav9vCdGcApxbSCfQ/PVQrWSQKmE/PGH5BZokl5heQs/7DMzPNf?=
 =?us-ascii?Q?OggId93QRFfEXasg6AgXAIMmsKWX3lqLSk6UCnTlXMOXOsz1EyMWJBvrCbur?=
 =?us-ascii?Q?iQry9fo46/g4H2E5FAC21dTIxN6nsLgX77qONq7C3QZuVJGsvD6R5gJL19E4?=
 =?us-ascii?Q?oGoj9ihWmN1vuqfHIJgbiOFyL0ZzEWDoUcXKVMf93DJAMvFlVZTSdSNLul8T?=
 =?us-ascii?Q?CajXBCXroRGLS3Mx7rW/EluKfporcC4EcHoehpHp6VRvmMRWLFmeDK+SsA49?=
 =?us-ascii?Q?LarYACBlj0uz4qer0os1N10CykORUhZTr0V3uMLbpWLUD6+ihdvtsctAVavB?=
 =?us-ascii?Q?/2Kp+j5AnCwZ2I8tQETKk94jhwuaC8uGcsUuvmkv8RdLYkwbdEtohYWUgBcS?=
 =?us-ascii?Q?d+0MOBo7WuooV6LJX77BuYAj0xWVS6149q6MWqa3cBO7mFWVtXloHuE4meQW?=
 =?us-ascii?Q?wnpRKvi9s2v4bAG7QnkdvfailrHcVdRu0deWqmsmp2xdgC7LeQJ0p80RDtkz?=
 =?us-ascii?Q?63WXDLK0z6G04buEacgPzOShPQzBM933GEDDe1Z10M1MkT5enghKyFjePZDn?=
 =?us-ascii?Q?NHUfYwPtt+L8Jtu7E2sSCqHj2o8Jxzv/SZmgjeMULp8skThgmStwnNGd/u0e?=
 =?us-ascii?Q?8HYoMvFzt/URMYDXbHYzHyVX0MW1pkF5QmIHXPVvOUvK62C0netF7IJuRd8K?=
 =?us-ascii?Q?/oe5Rg+GMr8yraX2YK8P48pLo8LXNkS8uilznQQdnPFCIQOuZHp5kSn9ZjyX?=
 =?us-ascii?Q?RasY1jsZ3D/WrGAp2l4YaZi2dLXHwklYjoJPC4bsRMtEmKOI4qHlf/M+1poJ?=
 =?us-ascii?Q?0P9KHB79Ia7911UoyvTEnwyLtDooE682fbtAdnwjDt6wVl5PB0jLYwQUYycC?=
 =?us-ascii?Q?1z/rVq1vGyiHcwS6X/TQWMB/kuYzOXugPCTczoBkVYg4zV1xB+AC+3YruOAD?=
 =?us-ascii?Q?33igne9Z2Qob62Nt5wgBs6iZYBID5oy8aTGLlBJ/RIIVf8xBzDitWuvt8odD?=
 =?us-ascii?Q?g8fL3CZXQivv8ccudM9huHfzkHZaUYPL43o6d9bfv92MYE+Rb5jRsRgdqv1Q?=
 =?us-ascii?Q?Hnlx9Pb0kQncceTIjhRPjrybFEfHaFTUGvfdMNLNI/LZkih1jLCLcbHeOvZr?=
 =?us-ascii?Q?iPsHHk9q9shDJSGu0Kvc8L1QHBvWhureqcLcdVUiMf6P5mxxL1ATWLcr4YE6?=
 =?us-ascii?Q?cCObWn0PmRTMKJ1iZk8lcI+WVYeQBLuhHB4U59K4Q2CWuUY9KoPE+AKdxd19?=
 =?us-ascii?Q?s+fZyQpqs9N6n32OqwprlORXkn4JhqxEqYPn1jICp/s3oUENFztkxybkmb4p?=
 =?us-ascii?Q?hem58HXrkp8YdRybDqBJzA6M5P4bIyMc+fTX6tuRjug/HpCptF5g83sXJ9eH?=
 =?us-ascii?Q?Rp+8n1QIHxrhKKDXkBkDOPZW1BBk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wu/IpYAh+lUaVe9cpyTkl6wcVij7SY4YfbNlWGRzy4X645sdUT7GTPuJnGUS?=
 =?us-ascii?Q?ZG9KxBVDs5X3dIHKO3XPKLc2Mo1nlJZw6dA8zr8ArbA74Vnb7KyoUGyGo3U1?=
 =?us-ascii?Q?4BEYl8o6kxiD6hhlQm2FSZIR7g0vkQ5PdgTbbpndFn7ySpljDr11lKnDwuLo?=
 =?us-ascii?Q?44INBTnpREqbtDE1g2+4IAmxZZ6OwE1KXlBbG3+k+JdpdQYYJNDm4vMMTqR8?=
 =?us-ascii?Q?3jJppJvqiFRU47wae3BIJzQPlqSS3cpYUhdcezTw9Z5MeAMRG7NHpiu7NTKy?=
 =?us-ascii?Q?HfzygWA59iMFHpwIkHMnaQZqX/ZgKSF3guCD2O7BEi9P92U+Z8A8hIbrZV5S?=
 =?us-ascii?Q?oD/mJfCZQ79GhQ2qznBU2HmP/rjkzOZS6GYCrWy0DW4xdCJv2Wb8tnlQSd03?=
 =?us-ascii?Q?Ir8jD6QmmQ3PMwraw2IsyiWW/oQ8jAA1grBil8X5UJdeNIH8C+axOnUfY0yt?=
 =?us-ascii?Q?LujtWOcrkx7GpAwRdtV5dJbGcRwELIVSijvQEklvCRBEK64cDvHaRdVZyPkL?=
 =?us-ascii?Q?/DEw9d2m6gGMXOLwpuffCmnyTXHwtpEyiuEAjyDjyKnCWxDLh7GrGMjTXKyc?=
 =?us-ascii?Q?l3yI//JUkdG/uzfKHHD2DK/8D9pjGPITk5GrMDcoZfEPX7cyVfr5txJJnyFw?=
 =?us-ascii?Q?D2WPc3Xq1Yv0gf1MzSzlfgdQtM2GPNxs0hYoaClnpc/QmH97+94LVDOlC+aQ?=
 =?us-ascii?Q?GsXCC1WlYwGbt8EpOCeU6J0t311ULZKsnTJB5OBe17XW/qiUlFJYGKSXUGnP?=
 =?us-ascii?Q?41rX2S3zuFK89ZWJEz5eeMlfKLFyiKktn/OwjXL2CVN7LEApYayJqdimQ08p?=
 =?us-ascii?Q?LtuK8wNPMIk1yMbhs6vwMespzalqHUWpW3qQ9eq4e+VNS4x/W4Qa6qCdokpB?=
 =?us-ascii?Q?z+XSbf4tIIC/AdHbvedjsyra+Bj2UcO8U2+omogdJsqtVTGNDpAQNfxJKkhF?=
 =?us-ascii?Q?FwjGkIFCCsi8Rfy6rjOPiaK6AFS5QKrDi9hT5P5odWKN9BKFb2YP/P/lW9cG?=
 =?us-ascii?Q?gNMw0b6ROKyi7AWCRoLwQbrB/U+6tc92KLuxf7txUzmiTt9fazzkKB9P78nG?=
 =?us-ascii?Q?/8jW2sTZPTuEL1MpvGtT4zvh6zs65R2w2GSHUmlQix3/Tue4zOZI6Sgkncip?=
 =?us-ascii?Q?iTJk+VlR5m+AnjtK95Fv1g9s2dTMWsGlqBy0E9lG3JAME3Q8TxUP2Zxd4EwP?=
 =?us-ascii?Q?TQuGTjMq9k4R9tsIfZj+2R7iMd/nap/SWM3JqG1NDApnAHmW3gpJzNqltjAd?=
 =?us-ascii?Q?qWhkuigt6I9nuEaLzc1Nm4wAU0a2oon6LC/K7IpTbziGYgn/JaQUTaq/Pc4/?=
 =?us-ascii?Q?CkdrppjZFOQavju7Jzb7GXX5FqSgE93aK8DEbOYd1z3gsPgFkZgZz793SViX?=
 =?us-ascii?Q?I4+4qkCQXen+mX//MN8xKTAdye6Z3iBhK6SMO6HFH0adPsviXwBJMCMhzZ6G?=
 =?us-ascii?Q?qdyGffntcUiFzaJKUwwFDl3nLk4/mfpPjJYdAOGXJ6TJdF2tHhhLLirp1K77?=
 =?us-ascii?Q?g5H6J3xLVZ+Mc4T+6zLgxT5Pr4uG2o+9hHd/te/JN0I2Uqwra2V4BuGkQLMI?=
 =?us-ascii?Q?FJwcmSJ51g9J1vxvUYk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de941c7d-77f1-495e-34d5-08dd51d7183f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 17:50:42.5495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joTMpvBOcgmK/CR2NGwV/tJAk1Nh+T/O8qrSZTsO6auIT7NqIkCmkEgWfWzJvWS1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF04DCE520E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_095048_166744_8EF94E1C 
X-CRM114-Status: GOOD (  13.99  )
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

On Wed, Feb 19, 2025 at 05:31:40PM -0800, Nicolin Chen wrote:
> A "fault_data" was added exclusively for the iommufd_fault_iopf_handler()
> used by IOPF/PRI use cases, along with the attach_handle. Now, the iommufd
> version of the sw_msi function will reuse the attach_handle and fault_data
> for a non-fault case.
> 
> Rename "fault_data" to "iommufd_hwpt" so as not to confine it to a "fault"
> case. Move it into a union to be the iommufd private pointer. A following
> patch will move the iova_cookie to the union for dma-iommu too after the
> iommufd_sw_msi implementation is added.
> 
> Since we have two unions now, add some simple comments for readability.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h                | 6 ++++--
>  drivers/iommu/iommufd/fault.c        | 2 +-
>  drivers/iommu/iommufd/hw_pagetable.c | 2 +-
>  3 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

