Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15A5CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqzoWKkrt5+c9FGYZMvWgmfyorU4cLeLEBcnPFydhV8=; b=BTWGz6rKDLxOSBiltih+VTF2EO
	L7mygjjsQyQm654xqYSlnjsw55RVaLUD0EKAXD5iC2X4A5dzE/xMqEu2+mcu4hCOs0i3DdLkLfIzn
	0gRGCDxkZvBXOx5jTVzouTiFt2Z7rjp0N5aEad2dWsPi4sRjgA3eE2j8ZYtWIapuXjTEhopZSTD+6
	l1VY+vzlsShopqgDdJli1TyodBqjGc9UywyNg+DiNqvISulls3PKERfkuZ2F0ZN8g2RzpBdxHroCi
	r0CQpur3Zon4FYUqIhTebfrEby9QKO5lgLMz9zTHg+nzX+MDVS95cbC7gH4mKN8Hlm/ta28yzeEIc
	ax6Z/Xag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNqv-0000000D6Qx-1Slf;
	Mon, 11 May 2026 10:27:09 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNqs-0000000D6QG-0H1A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 10:27:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5zTmM8AbiGu5f90O9tPO6TaAOlIzD0uMRAlzLNtHNg0fmMwY4e09oBlQLHOvWc1tgsgfG5ZrQz01ZhDa5Ll03xHqwMWOg2qXw5BVcTQEbPUQ+Pj1bVSQ+sVnSP0NBgw3q/qd2gX8IDJEPoBZVInitjYOuSum0oVz9z8yVQ9jxyMtnL6lrXzVxwtJHCG6sow7Er7l6eqtkagyd9Z5BVdtdk9YpdrnFY7hZMr2ODKIdusIURlchIeMmGlor3TnsSsr1V8v/3KfGsmmXBAnuzFmAm51g2LGpqRz7HzTCoiqJq7+fV3OsSYFXa61cXnVeJGp5jIBGy5vjP3HgM+C1W9hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqzoWKkrt5+c9FGYZMvWgmfyorU4cLeLEBcnPFydhV8=;
 b=yu9tfRzd5C0v5Rbm5tbmxfPHrN65/X75+60CYBPFPIvWkm7k5F5YMrsvTSc49MXcqKLTtPsLTuB1yz6tE78yJl8vHZ7K/ldV6inxmI3UnV/P0WAMLvKZU00VU9NNDkYIOHh9D/qcZMEF1nUxoAc+1HheGHfirF0ylBE6iw4F8dkyYAcXkQfb2tJCz5W4gsnjuSUCDWlo5Rikalv98cj7qct8pmTh2n7pInBIyUF1yQN4YVMv1BJMW6DNSMulsjxKhE+RfH+B8EyXx3wAFmjMTAfe+iKpG4UUPN+eNjKPb4jy/5mP8QDtz8wn/Zqov+cSjBeU8NSzTK39cHHtWfv8dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqzoWKkrt5+c9FGYZMvWgmfyorU4cLeLEBcnPFydhV8=;
 b=kTrLS6EQxWfSyiFTmwQ6n2yZLTpvfpbNPGMS3TnqkSRHosegBzzQw0FqJnJ7KDn6LjS3sdXGZbfIAxjd1455GImq0ZjlgmPxQlApfYpWOSAtyL6ic6qdq+iQZfTAUIMlnxpQr9l/PWkrqvZSiJR+BEIerYrh4LTD0POuupw9fe1a3Jo3YjjCI7itre6l+VtpJuD3iEOy2FrmwApjPRU7/M/vSMK18ugmAMhuhE6LctDj22T2W4c5xwZ/PjiUv+ChgWzgFbuMAYjOzFbBDN1QJH8irAO6zf8uvzKtwPVV0iUQFclTeGAk4+gyhIjShCpHpOK3BPMFB+v4QGitz5b8eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by CH8PR12MB999206.namprd12.prod.outlook.com (2603:10b6:610:35a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 11 May
 2026 10:26:58 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:26:58 +0000
Date: Mon, 11 May 2026 18:26:54 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] coresight: fix missing error code when trace ID is
 invalid
Message-ID: <agGtIfD0W74ls2c8@MWDK4CY14F>
References: <20260511-fix-trace-id-error-v3-1-ac4c8356efff@oss.qualcomm.com>
 <agGd1AB19yz0U2s1@MWDK4CY14F>
 <146d34e9-caa3-4119-a3f3-79515b3f2c46@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <146d34e9-caa3-4119-a3f3-79515b3f2c46@oss.qualcomm.com>
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|CH8PR12MB999206:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae676c7-dd10-4567-ec25-08deaf47d4f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: GDgDGEKdC/idlNPwllEAsDCjdOGYPOT5MvEWRh2lcGMbTq30gGNI5nTZqIz000MwaYytX6LFTd9apBWRU330TcU/vFKQA4/qTj/N5tpE1OWXJPK5fYwvbABmb16DD3i60qPK7h+VCgya3AaUeqhaaIGnUFvITJg93fGfb52rNHDg8nwqH7595iU61xnFwANROfmegrvJzQfYTBmfqeKisKI5tdJ61XuCKPF6dfIy6BKERibuEObgB3zTP6POlMxwZVeCMyzVEizyiJartHh8ATPUMpQNmDoh3RNVPPGnHhNHHTWTZJ7/p5bO0GS0JDjL7ehPsEHcZHBEQqKMK6JzO0mHbYnnAkjJIMV1v+8OfCMDCCFvk0+oZEgX+2bdREwjngAYkPK6Tz3mQISB0TIdaU8p989brHW91mAaxjJzEEzKjHQB0XDk4wrbv24KXSfC/Yc/Dz1NjInZ4auRbODuNeP6Zht4yi9nC7jerEGwPCEbs/TIUHGz6I04NqIQZlj/ARla57tMKmdR8qPTe+tE4cqf6XNg++DATH/cisUMVPXzSI7JCl5sYFMw3P3p03ENRxf6kf78N0tGvfV44Kp1m6SPP6692NnQEFJDlSavvFpsHu4KPOXTftf+/uKm7NsLQVQP/v2IJzlV7ZWcxtdixTXlH/nEdDwwEMP2TYsqmVAqb4lNPRx4mPmPK0Ce+/Jdw0CwtaCqMQStdPt/bwnpXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Fol79zWm8ffzUerTo36wVfdQ0KpfVBKJsDw3MCcYPBaAFfeexL6Ubidbzqg?=
 =?us-ascii?Q?4730sg/sRUsbYMlw85zuJ8ogDFYeScQ/qEnmoKWZ3rjqOXk/NRpypjB63sY4?=
 =?us-ascii?Q?0MvDSfMlo03YlX7xRbbhUnd0sYQMJK5SqJ4SjLEIDPnnpln4QuAPNprrrjvR?=
 =?us-ascii?Q?xN1CXZ2aFKog206lbIp4BmPlTSwEx0CYnGGc4ZldnYwzN/dTlk7WO1eDK+yY?=
 =?us-ascii?Q?b4kEphLB+bjbB1vdyvIl+e9g41uV7KtR/A1kDqGbhS+lJ8QW0wOP8FLAWRui?=
 =?us-ascii?Q?7gXoY0yBVz06EZwQ9FBFhVs1IcejtEQtqLOPGqmMLgsyF+DEhUZSjYLu8Oes?=
 =?us-ascii?Q?uxLsm03iF7ThAlrNB8nw+289Elo3ly3Dx+8GxZFhUAJllc6I09bVf616QWct?=
 =?us-ascii?Q?sb2FDzjW4s2hAaASHoRuZbWVmdb2YiudD2oaScKBriyyGtv1/QqLQbkJPQFX?=
 =?us-ascii?Q?CYda9DG7YbJkLailBs0nVAH5imTVGJ5nafjP4Dfh1ehCayD8bntS3GYIBkYT?=
 =?us-ascii?Q?Fyc2YkwibEPyGgHwRdzmArsa9QnrprXj4K5lw2vj9A7Ve/z/iYETP9kSxYHd?=
 =?us-ascii?Q?u5Cyqa/NiAzV/9mu+kBLsggNFK+tPDWQtKp7UNPCeWC0Qo3Z4wipHcrmsCUG?=
 =?us-ascii?Q?ttu1+ADtazYf3WXiFOHW7U+nPE4noIa2Ggd+8f1+rse5bJkdlUFckpIPzZs6?=
 =?us-ascii?Q?T1a4WtwBrDZenWz6oa47iyxilynH/UcBccPDvEOBTPkmR/MgcObZruN1NIWn?=
 =?us-ascii?Q?PpxNu6eN56a4N904IlWaoqch4xGytaf+taN68mBIJHUSju8IqeTjDPvG9uvP?=
 =?us-ascii?Q?wtiPFbc8RUlppLWoqpf2nFGxnLYxpNWiUfH9wyA1oHTjyZeS4wylaaK1QRou?=
 =?us-ascii?Q?L1jrST6i16M/UP/56TVeW4Qpeg5/rTqNFQnQ4kWUAkygECf8StbRcZ7KMBeT?=
 =?us-ascii?Q?cQG2gn17p3hRo3MCxFGVUOyZ/d4FpkVjUSBwY0YmazTq3FnoSGRDjoXbI6wo?=
 =?us-ascii?Q?ybJhqcgEH3Ni6U+TyAr4JJFDun7mb6UYPG6XFx4A/bYz/yDdCHCW8B1NqjXq?=
 =?us-ascii?Q?25WA/SMqbC1ryCzl1foY1TYXi0b1/sgsYgCk6GOQZUip7wquvIMfHJutDPV5?=
 =?us-ascii?Q?A1MStu8jLvjrfRrU8xwpHNrzk16OhJSeW54aCVwjp4Ur9xkxlk3GLepPVZKD?=
 =?us-ascii?Q?PulLSvH/beaBo37E/H4O1tSouEC0v5XB8/e3yXtAcdbBn03wAlI8vrPMQoQ7?=
 =?us-ascii?Q?PR93XutS0t/zdRkFlsNiDolakIqWG/zwX9U6RFe0/X1EQb+5gmfSEwvaHK3q?=
 =?us-ascii?Q?eD41yGhkdrzjPV4MurUsU54C2rqIjMvhstHMqwyLo38dFPInn8SnJ30rPeMQ?=
 =?us-ascii?Q?v9KYstmGQBGCKi+7KG8MO5rVGkkW5uMcCKOqjn6x/1gZF0II3VEkgCiGnToR?=
 =?us-ascii?Q?fGqHUTX5F2dGoLmlqLkEd5zGZn4CCCWuvjq7kg8LkKR++zDOnhO3q0cLiieq?=
 =?us-ascii?Q?xv4/IsQRmZw2CyhTOt2OjhuML7XbwBzDMqrjSHVN0dglA+ZKHLNlq9nRIShY?=
 =?us-ascii?Q?tY4WQ856hwNRRG4QN+YJJomX6AlEw+Io3QycfzHkJUOQsCEtl6CgvsXzkLGC?=
 =?us-ascii?Q?BdaixSeMtacifSzkpV43OIGH7R/f9sq//OQgeDEHrhf0GHE0+/CZhpMheOmI?=
 =?us-ascii?Q?KwZf7+dNJ67j7sfiUUUbuWEg71bj1JnAe8zFjrsGwwR5e7ENMMpm09+/rHuD?=
 =?us-ascii?Q?rsU2noXIJA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae676c7-dd10-4567-ec25-08deaf47d4f8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:26:58.7035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmudLtc0/O6GpOHHyXXesOjHYvqehm16FD0awkxB5aQ0TXDtBf/j2UJyqNHMqPAJTmo5pg6oZaWYkxlOI7oO0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB999206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_032706_210993_B6A3FC51 
X-CRM114-Status: GOOD (  37.63  )
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

On Mon, May 11, 2026 at 05:27:10PM +0800, Jie Gan wrote:
> 
> 
> On 5/11/2026 5:19 PM, Richard Cheng wrote:
> > On Mon, May 11, 2026 at 04:36:18PM +0800, Jie Gan wrote:
> > > When coresight_path_assign_trace_id() cannot assign a valid trace ID,
> > > coresight_enable_sysfs() takes the err_path goto with ret still 0,
> > > returning success to the caller despite no trace session being started.
> > > 
> > > Fix this by changing coresight_path_assign_trace_id() to return int.
> > > Move the IS_VALID_CS_TRACE_ID() check inside the function so it returns
> > > -EINVAL on failure and 0 on success. Update coresight_enable_sysfs() to
> > > check the return value directly instead of inspecting path->trace_id
> > > after the call.
> > > 
> > > The other caller in coresight-etm-perf.c discards the return value and
> > > continues to check path->trace_id via IS_VALID_CS_TRACE_ID() directly.
> > > This is unaffected: on failure path->trace_id is no longer written, so
> > > it remains 0, which IS_VALID_CS_TRACE_ID() rejects the same as before.
> > > 
> > > Fixes: d87d76d823d1 ("Coresight: Allocate trace ID after building the path")
> > > Reviewed-by: James Clark <james.clark@linaro.org>
> > > Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> > > ---
> > > Changes in v3:
> > > - directly return the value for clear expression.
> > > - Link to v2: https://lore.kernel.org/r/20260509-fix-trace-id-error-v2-1-c900bcbab3e9@oss.qualcomm.com
> > > 
> > > Changes in v2:
> > > - Refactor the coresight_path_assign_trace_id function.
> > > - Link to v1: https://lore.kernel.org/r/20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com
> > > ---
> > >   drivers/hwtracing/coresight/coresight-core.c  | 14 ++++++++++----
> > >   drivers/hwtracing/coresight/coresight-priv.h  |  2 +-
> > >   drivers/hwtracing/coresight/coresight-sysfs.c |  4 ++--
> > >   3 files changed, 13 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> > > index 46f247f73cf6..254db91a8ac9 100644
> > > --- a/drivers/hwtracing/coresight/coresight-core.c
> > > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > > @@ -739,8 +739,8 @@ static int coresight_get_trace_id(struct coresight_device *csdev,
> > >    * Call this after creating the path and before enabling it. This leaves
> > >    * the trace ID set on the path, or it remains 0 if it couldn't be assigned.
> > >    */
> > > -void coresight_path_assign_trace_id(struct coresight_path *path,
> > > -				    enum cs_mode mode)
> > > +int coresight_path_assign_trace_id(struct coresight_path *path,
> > > +				   enum cs_mode mode)
> > >   {
> > >   	struct coresight_device *sink = coresight_get_sink(path);
> > >   	struct coresight_node *nd;
> > > @@ -755,10 +755,16 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
> > >   		 * Non 0 is either success or fail.
> > >   		 */
> > >   		if (trace_id != 0) {
> > > -			path->trace_id = trace_id;
> > > -			return;
> > > +			if (IS_VALID_CS_TRACE_ID(trace_id)) {
> > > +				path->trace_id = trace_id;
> > > +				return 0;
> > > +			}
> > > +
> > > +			return -EINVAL;
> > >   		}
> > >   	}
> > > +
> > > +	return -EINVAL;
> > >   }
> > >   /**
> > > diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> > > index 1ea882dffd70..34c7e792adbd 100644
> > > --- a/drivers/hwtracing/coresight/coresight-priv.h
> > > +++ b/drivers/hwtracing/coresight/coresight-priv.h
> > > @@ -153,7 +153,7 @@ int coresight_make_links(struct coresight_device *orig,
> > >   void coresight_remove_links(struct coresight_device *orig,
> > >   			    struct coresight_connection *conn);
> > >   u32 coresight_get_sink_id(struct coresight_device *csdev);
> > > -void coresight_path_assign_trace_id(struct coresight_path *path,
> > > +int coresight_path_assign_trace_id(struct coresight_path *path,
> > >   				   enum cs_mode mode);
> > 
> > Hi Jie,
> > 
> > Thanks for your patch,
> > 
> > I'm thinking will "__must_check" should be added so in the future the next caller won't accidently
> > introduce this class of bug ?
> > 
> 
> Hi Richard,
> 
> The return value has been ignored in perf mode. It will introduce noisy by
> adding __must_check. So I think its better without __must_check?
> 
> Thanks,
> Jie
>

Hi Jie,

Ahh thanks for the head up, my intention was adding a compile-time check there
to be safe, no need for __must_check here then.

If any new callers were to appear in the future we'll see how it goes.
Thanks.

Reviewed-by: Richard Cheng <icheng@nvidia.com>

Best regards,
Richard Cheng.
 
> > Best regards,
> > Richard Cheng.
> > 
> > >   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
> > > diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> > > index d2a6ed8bcc74..b6a870399e83 100644
> > > --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> > > +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> > > @@ -211,8 +211,8 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
> > >   		goto out;
> > >   	}
> > > -	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
> > > -	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
> > > +	ret = coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
> > > +	if (ret)
> > >   		goto err_path;
> > >   	ret = coresight_enable_path(path, CS_MODE_SYSFS);
> > > 
> > > ---
> > > base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
> > > change-id: 20260508-fix-trace-id-error-dbfdd4d8f2d1
> > > 
> > > Best regards,
> > > -- 
> > > Jie Gan <jie.gan@oss.qualcomm.com>
> > > 
> > > 
> 

