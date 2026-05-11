Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC5ECD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiaiILtQHi9T41D0R9qcd9RPfclKUjmjeycp2/8VrXg=; b=ByPF2BUt5SxOiFrqEYa9RYygzN
	LjTycn9SyODd4B1DXGbhdlwJH/d8kglaSu6amXJwRTB/F5obwMWX9NVurnBB1P/v0Ljs4VR1PKMGf
	FZM/fzX1kqZUjEktOmmaNnzl+86DG1VBLpsfoJ+LSYjXzn4Kkmr32fXNWa/J9/e0v/dXO7wwSgXk6
	jGWeN6+s8Y+pwMYtSebUj1380B908mEpzZnUH5yYvkRADwL+QzjP/5ORUJNBoLIh1EKlmqNpmDc4N
	E3IB29HPgxcqL6oMpOq7oHT03TBb68St4kVmCVmZM33Z8qqrcGjdtlkTN4gPf0FggdLILkcl/de3R
	fWqEEbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMnf-0000000CsLT-0icX;
	Mon, 11 May 2026 09:19:43 +0000
Received: from mail-westus3azon11011051.outbound.protection.outlook.com ([40.107.208.51] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMnc-0000000CsKv-0iXf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:19:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rz6VbyJvT7XWcVYRy1EGgNWdy4LpKtl8qWVQ3wexC+PIbsXBfBO2a0dFgHNaqtO3ODPt8oq/WJbjsV4KFCvM0moTBfjkMmqIcuAwJC7lMqF0y1Tgec/sCz4Xg4zFbg17M0S5QlS/WWpOrG9a2doXlzxBRioEY+9NivsjbKBk7L4T3dPbNPUI3Z2/QgR6a0TgEvGofNMJrnpu6WKjjVInwinjnq3GCcartC+R/5lH4VBPFy67zkuA56DAFe72PhZy/pFbDXLaqfnaBgJBt+ksiDTScDX5lXs2yBUV/t0qv0f6llGvPh3T/iVVX4zwc81yMQPmBRAJFGA5NexVwUMYHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiaiILtQHi9T41D0R9qcd9RPfclKUjmjeycp2/8VrXg=;
 b=HQLnXbKKWKqhYd5rp+X/DFVNS7GQaxqIypMwXy/OATNxndgNhHrqX2reNm0owfZs4RQok9lP1tHi5uNhQekObVpsL+xQxUC/0nfFgCtI7hpx/2dD5cMpeU9Xxp3yMuH/LiRdS82QbPW2P1G3S0Vu9FLfSMLRKyCmTdR9/h7JIW1pXM2CUE0BwIx5N07SZwnt5GiHRbXjZLEpmXhQm14Bmg0MFZ38YqZugWALw0QRkYACRelcspLDvThW1djUzM5Z1XV7FUTmvk4kqldCFYP1DVwe1JkacjuB1P8LOpkLBQ+TFBiNXKGyv1n4u3aLgShj1mjdmOWBDbrqER/iGGBfyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiaiILtQHi9T41D0R9qcd9RPfclKUjmjeycp2/8VrXg=;
 b=RF7fiJPDOFIDMAsi6UBDc+kcHGeyk2YO2J9rLE3osLHjHbHmLIIutxYMnBDLpcTkMBbRfI3pBAEy3mUOKZNxWRSNoKYPzHb0xZI363Vk8yJGypFRfT2w4R+TIw7qGs7j2gYSmCMSkH2vR1TCDuQirNDlJxr1RvCvvHHf/qfjk59kBG8dJeSJ3ej+82R4uRmEhw09Tnr4ItA1eF3+/dy2rEmc3v9HJAHDYIy+QI0BjDkSalifVlcxOUZhCG9UavjY3YFvm+ZCzbXZu6UCWPKSEwi54YpEfcZFRaTNTi9sPgBNOy19O5OXgEatE9Cy0VcTen5d9/dUaPDZsPgX8N+5yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by IA0PR12MB8715.namprd12.prod.outlook.com (2603:10b6:208:487::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 09:19:34 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:19:34 +0000
Date: Mon, 11 May 2026 17:19:23 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] coresight: fix missing error code when trace ID is
 invalid
Message-ID: <agGd1AB19yz0U2s1@MWDK4CY14F>
References: <20260511-fix-trace-id-error-v3-1-ac4c8356efff@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-fix-trace-id-error-v3-1-ac4c8356efff@oss.qualcomm.com>
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|IA0PR12MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aed12a3-0600-4430-8e20-08deaf3e6a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 4mIqtjCGTzrptgp/pIBSHA9UYVWq+0ieKeYh0C4Rs1VCv/I1Rub4iZSyNsfbo3RU4hfGADUs5KTRiworC5nMB9+q1EKi0tUhdVqvI8sS+O0ewEKHjl8Q+c3ffzDQvFtZgPBC17zGwuOYpJGUtYyXkwI8YmveBMEpFwWtBlpK+7HwkkCkNVaYI8QvlKCcfT/B80Yeo+x3osE2rrGPRxqL50cu9FhVcGTGa+ktmBKTzTsxfRrSIFJ47uXKprXZFWR+XnShhz+CcKT1Y8jqaZXGWcanI99/vbl9sUF855eMOm3FATwe2ZKroTbzD5W9CncVgEYWL2R2nOou0JSDJa1ZfVrHz850G4YW9h2TaNDE9Sq9EYdtpBSBvpunvwooY66ZFP0cC3lRYDxyfkcTXuURQlVHiZOlRoKDgE7ttrSoCj+HI4adTlfjFB5PhSqk1PJ+YvhNBVdJx5FcwbAfvuea5uzZ7cLtmyO9h8ksHiOGcn3cat7zDuHvM7kLuIIa3xwNIGJuIxb884ecD9h2rt0uxLcQxtVCf/wHybLh4zIVuo/UW07Nbx3zGKSh5Q1OLxXqUFZTdRRVRH8xnRdPa8pZi+zC435clxXFpzMuwAL0HCE+/AfK8AVo/s+7B+z/EFGvvd7Vckzo3mTe4ytubCv8m5wx1UL3Nkqk5kyBVjjA0dKshtmYxN7HQ3H06vr5GaXXnTPAYpy4PadEtDieN+8scw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?25DHAqDt3V0eS//bpDUIoaCyiPnYDZmDOBBwXpg1nQ489hHpYMnllEFbJyDv?=
 =?us-ascii?Q?jO8lHwAnZzBweNjQq3FeXGnUR1yaFBJo7o3q1xhoRZoLG99vLnxzBim2JhX9?=
 =?us-ascii?Q?lkLlObOThp15J7ZdW9pKqH98KYKERCrG4vWaRt6AVeaoiHyDkFHYYFbyr3FQ?=
 =?us-ascii?Q?n7Xa9sFA+PPHfqRNv3FTjz90R/Co6R/nZIuPSaly+pxi/xd4XFaql3h60yL/?=
 =?us-ascii?Q?CVOhg6F67VE/rXSDEqJDoLHvgMtAtE2bJObOIJmQe19I9jT8daj9hhDjTUpe?=
 =?us-ascii?Q?XlM/T/2PBgn/EGb7/bdRFUfD/dYqCbvIGuByrRoe7CvHYYXHP0Q/nJsR/9gz?=
 =?us-ascii?Q?06MbvqjMcZ2fmB2rwZNitcfkVIdNLZyL6yYTPJckakSuKMnmJfcVz+1pQV8k?=
 =?us-ascii?Q?JDxfmDMmiCKqhXkNKG1dWrEayiCFu7NecuFduG7Qz0wwO+mPEaNThEJ1wm9L?=
 =?us-ascii?Q?kJ5aMFHnta502BQlYKzw4hcDpzFGpv4HBopCfMOvUXubWclBS18P2Mer4r6A?=
 =?us-ascii?Q?IXZOHkSfx6bE8rd31CK7spcZVE8p+DpkcyZQSG2JvO9UYCnuGI7uv3gwfBYY?=
 =?us-ascii?Q?aaohiqjpVSzRTiwbSaaFqnufwSkQISj6VLGQw+gqTIlf8dvIfCHEVptJ/Pri?=
 =?us-ascii?Q?HW0nm3JVzT6wjcGeFrbSIi+9C4Rah2qWz6Or8OEvjMbJlqAPv+/MVRXCeodi?=
 =?us-ascii?Q?/m84/HeaYG/FrVBBhKzxGtGpB3QQTE50OvHr8JlDu+03+RLqo6UAqIBkCwKP?=
 =?us-ascii?Q?wsWHrUU/XVxyDDLxAy91S4iYBBUy09r/jDJsPpqglIGkPiMwzfp1sO3FAj6s?=
 =?us-ascii?Q?zJzR12iZ41jZFONKl5B7g1GMDMW2pfCZuaoywG1m+qxcq2izAmm9iMXKK93M?=
 =?us-ascii?Q?mM/cmFS1du3iTRCtARJbx/yv1H5XXud18lTezY0xDQyNrRF/vb6TZUVEX5ad?=
 =?us-ascii?Q?4R1GmL3M8CD5hWGjVHzt4UFZQAOfvHMRgo6db5NpTNnTy//CMKNzDldjZUA5?=
 =?us-ascii?Q?fo8uRdhO6aBKJr+gm6qEItI3wmdCFAlrA1GPKN5/Uuu3L4MNnENNwqVSNGMr?=
 =?us-ascii?Q?IV5LMRNy7ky2409lXQnr0YFMum/uhs9/bqxHYMQTlVCRjb5Q1bXPLmQF7N73?=
 =?us-ascii?Q?hGkRSFffsb2xjqrPNZUk3h8uGx5Nd/C5Qd1nK2+LiHptvXgH5y7IV3SifYii?=
 =?us-ascii?Q?uMzjL/ablBtblyrwrqeUhyenBKTCCJU8/RWrzizRK44DR40Ccj/57Xxq9Acq?=
 =?us-ascii?Q?iQLxW+admNLZpx+fnk3T7+seOTy5YYrSFkn59soq2LjVUgeNIF6gboZYSBI8?=
 =?us-ascii?Q?H71h5Quvym3TjuYWF+FRDR7DL30/ICfRDiG2qwDmwOzBbafcKw2Rm5VHwlGA?=
 =?us-ascii?Q?PkkNTmlWbki7dAv/R3fs0pKWIb1M3XZp700hn5xyEZYja6UmEPiblw9XzgIT?=
 =?us-ascii?Q?W8VdfhL2S+KdYSkg/FL2XFmsQpVt3MCL8EgnhGDhqQWqsjEapgAb0mHH8x+R?=
 =?us-ascii?Q?5kDJZwwxyEIXYhSIOrgeXaooCxAqHuQZWwxKKLv06DrUzswDEJtX+VTtae1C?=
 =?us-ascii?Q?50qkqkTYD98PTWqEjTtmTjaeaJ+t4B3EfsqjMTCL6q4j+fubwIPd4rYpMwQq?=
 =?us-ascii?Q?RlQXGyR0VZqU774EUeNuus6p2Sv2Ar9b9XdiP9hCrJW/pU3hEtY601lrNbMI?=
 =?us-ascii?Q?D3ii7iY3kJ4MENr09cFpXSKyGwmuLjCBtf1LOjm2MUtAbKqJENJQj6GCq3tL?=
 =?us-ascii?Q?PSA8UNbnzg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aed12a3-0600-4430-8e20-08deaf3e6a5e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:19:34.4372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTDAi/Y66PUryQfoKfg23d5Dr1BwEQW0zBJXhl0GNex7KEB8cTgbH9cIgtqWV/Jkb/lIxZbB+WmXzTql4MfBNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8715
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_021940_217955_2D923E87 
X-CRM114-Status: GOOD (  29.69  )
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

On Mon, May 11, 2026 at 04:36:18PM +0800, Jie Gan wrote:
> When coresight_path_assign_trace_id() cannot assign a valid trace ID,
> coresight_enable_sysfs() takes the err_path goto with ret still 0,
> returning success to the caller despite no trace session being started.
> 
> Fix this by changing coresight_path_assign_trace_id() to return int.
> Move the IS_VALID_CS_TRACE_ID() check inside the function so it returns
> -EINVAL on failure and 0 on success. Update coresight_enable_sysfs() to
> check the return value directly instead of inspecting path->trace_id
> after the call.
> 
> The other caller in coresight-etm-perf.c discards the return value and
> continues to check path->trace_id via IS_VALID_CS_TRACE_ID() directly.
> This is unaffected: on failure path->trace_id is no longer written, so
> it remains 0, which IS_VALID_CS_TRACE_ID() rejects the same as before.
> 
> Fixes: d87d76d823d1 ("Coresight: Allocate trace ID after building the path")
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v3:
> - directly return the value for clear expression.
> - Link to v2: https://lore.kernel.org/r/20260509-fix-trace-id-error-v2-1-c900bcbab3e9@oss.qualcomm.com
> 
> Changes in v2:
> - Refactor the coresight_path_assign_trace_id function.
> - Link to v1: https://lore.kernel.org/r/20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com
> ---
>  drivers/hwtracing/coresight/coresight-core.c  | 14 ++++++++++----
>  drivers/hwtracing/coresight/coresight-priv.h  |  2 +-
>  drivers/hwtracing/coresight/coresight-sysfs.c |  4 ++--
>  3 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 46f247f73cf6..254db91a8ac9 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -739,8 +739,8 @@ static int coresight_get_trace_id(struct coresight_device *csdev,
>   * Call this after creating the path and before enabling it. This leaves
>   * the trace ID set on the path, or it remains 0 if it couldn't be assigned.
>   */
> -void coresight_path_assign_trace_id(struct coresight_path *path,
> -				    enum cs_mode mode)
> +int coresight_path_assign_trace_id(struct coresight_path *path,
> +				   enum cs_mode mode)
>  {
>  	struct coresight_device *sink = coresight_get_sink(path);
>  	struct coresight_node *nd;
> @@ -755,10 +755,16 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
>  		 * Non 0 is either success or fail.
>  		 */
>  		if (trace_id != 0) {
> -			path->trace_id = trace_id;
> -			return;
> +			if (IS_VALID_CS_TRACE_ID(trace_id)) {
> +				path->trace_id = trace_id;
> +				return 0;
> +			}
> +
> +			return -EINVAL;
>  		}
>  	}
> +
> +	return -EINVAL;
>  }
>  
>  /**
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 1ea882dffd70..34c7e792adbd 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -153,7 +153,7 @@ int coresight_make_links(struct coresight_device *orig,
>  void coresight_remove_links(struct coresight_device *orig,
>  			    struct coresight_connection *conn);
>  u32 coresight_get_sink_id(struct coresight_device *csdev);
> -void coresight_path_assign_trace_id(struct coresight_path *path,
> +int coresight_path_assign_trace_id(struct coresight_path *path,
>  				   enum cs_mode mode);

Hi Jie,

Thanks for your patch,

I'm thinking will "__must_check" should be added so in the future the next caller won't accidently
introduce this class of bug ?

Best regards,
Richard Cheng.

>  
>  #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index d2a6ed8bcc74..b6a870399e83 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -211,8 +211,8 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>  		goto out;
>  	}
>  
> -	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
> -	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
> +	ret = coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
> +	if (ret)
>  		goto err_path;
>  
>  	ret = coresight_enable_path(path, CS_MODE_SYSFS);
> 
> ---
> base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
> change-id: 20260508-fix-trace-id-error-dbfdd4d8f2d1
> 
> Best regards,
> -- 
> Jie Gan <jie.gan@oss.qualcomm.com>
> 
> 

