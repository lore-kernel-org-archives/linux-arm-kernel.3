Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F3ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 01:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44CzTWg1c4dMBWiv6waWmGCSk5F+vWUs1TNVMk9ImRA=; b=ve2MpsIlGIhKBdyJPnWX/bNpYc
	RGuBxRyLJ6hgr+rReb6j+pGe54a2EvsMJpSH3AyPSyRXcxNipHwaTytSzzVn9d8LEQCUkYmAcg6tg
	KMJwV/FWysaL6l58PET88O6zkbSczs58nVxUN6DgLTISbe+njKtczXWvP+CZZ3+AYOHguulbYfhHF
	UDZZt5/Q0nqRGG5PwIXaAuYKZXQBlwbMe2qzRPT2p+CzzV1Ivrh7OASHQYWYTdQ8ZKiuF3I+QQv4C
	HER6ezHw9TGVCv6+vgMk+IpzOrnEeIrj4ibAM1sk/1j/9j0xjQuVpkoAROWHFPWEX8B3BOWCUR3yF
	lTjzHBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzmX6-00000004V7w-10a7;
	Sat, 20 Sep 2025 01:37:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzmX3-00000004V7Z-0fby
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 01:36:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K0gw9V006749
	for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 01:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44CzTWg1c4dMBWiv6waWmGCSk5F+vWUs1TNVMk9ImRA=; b=WhLXEWJ34UyiwkE1
	19poSTDWSPQagduthwL76YKoRERF4FxTHgqpnQ4byKZtVf4rU1e045vu7IBbPkeQ
	PHo+98TXR5hFVZAZws3uxpPXGXKDAmKZ0IptbDOpNyUL9Zt5GDxW6yi0TvQBZICx
	RasrQ6uFj7eGZcFj2XGgX7hP+Ae8ilerG1nqQhG/fDweLPotknC1LL8mfDpWYCax
	gnRuvoOk5ZtDa9wZfWkO0aEadFsm4qUCuw+so7wRHYrv3odzikDRIlGLpKNiUN2w
	bbODqouPH7ThK+O9SN3OGkgmRbJ/VsGXu8/ZeT03XRrFRLhhK0e07CmP6YnYVo/C
	1YUpLA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeg2mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 01:36:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f14f6a553so652317b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 18:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758332214; x=1758937014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44CzTWg1c4dMBWiv6waWmGCSk5F+vWUs1TNVMk9ImRA=;
        b=w2BE0iNIpOH+qj5e7yKQAXP57PAGwDhmeDIAA4MKfKmvO5gH5mIxtv99lTZ/NRQGvf
         /i/Q/iq+m0AfBQtO6HIzNXEv3F/kqilPONs8Aa2DJCB7+CnHE06NBdzz1NlwNNTMs6d0
         bkcnhUZAFcvP6usZSofpM/SUXAezXVI++ZeMsWW8Yqw/pKlscDQ1fo9FPDUj3VSytUQ4
         R/lS90+GLfaQlw98KAUFhyqqgVCspCLfX3afoDFUz3dXljFjwEkOM+qsa9VB1R8RL7DK
         rmX3dn8NHdNi6pNROHWKc4bHkJ/Uc90GtP25Oc7dlukeZBrDJHL9n/gBY7x4XhrHNYYs
         CHQA==
X-Forwarded-Encrypted: i=1; AJvYcCWAM04zQTPWksGBTCcg4+fo8c7mZZ9ABgLfx6zqxSYkFKaHhkzxzfR4yCuNowFWFG7oLh5CPecwTrpZl5CRG/+7@lists.infradead.org
X-Gm-Message-State: AOJu0YwPC1cixd8fAt2arcAI7TBgXNHXYznz75d4dRrBskk7k2FjQ9KK
	zJGjt+sUbozd6ynkUXUYpu8pbv505/d5Vm/Ub4utYXnp/FVmciIza1UYt1s1++rgpRWosO4l4ez
	37ZrTmhTAv8Vp5ijdwUEFRZ2xWwrS4ioY7laC5PxH5pTYkm2dIoCLqnTXkXQ2NscC5C0PtywHQs
	xhwQ==
X-Gm-Gg: ASbGnctsZgnIolkOYyJ7vmTX/YUXj0O2QAWBy1dMjniFfr3EfEhsxeTEOXnzTQNzKmr
	vk/GsAGxrQzcf15Ah3Gi44nbT6DNr4+zXBEXuT76iIv0q1djrMom3OS+TF1mC4dOvrAp72xNB5K
	btmBdcY5Zir1Iu71UTtJbnviU8fV9lyy4dTKLX4leGTgcRoGbDSxc+dpe3q3bMSK1OJltMdrwCj
	ZESrEHMptDRcKPAZLSz3tAEco9pLCBV4d22unyeoAsZa16Nx9Opt3hANFODymRuerVmsQU+pM03
	N8G7EQEYEka6rtlngWrc9K0VpV4X+UT97XMhTM0H7puchRBnbJG7vSx6SCM7A64F8v8wD/Gljya
	/BnlkGIH5/utEuh7grctnRiEyPsE9
X-Received: by 2002:a05:6a20:e210:b0:263:767c:28d7 with SMTP id adf61e73a8af0-2921f140ee8mr7571597637.30.1758332213558;
        Fri, 19 Sep 2025 18:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGj4mV+QNnbp3eYM/r8Q93KP7UgEreeNVPgSHMISOG0LbCHYSX5DhqDcQD0i/Jm1RbPOGLIKA==
X-Received: by 2002:a05:6a20:e210:b0:263:767c:28d7 with SMTP id adf61e73a8af0-2921f140ee8mr7571562637.30.1758332212932;
        Fri, 19 Sep 2025 18:36:52 -0700 (PDT)
Received: from [10.133.33.68] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55156734a4sm3845689a12.4.2025.09.19.18.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 18:36:52 -0700 (PDT)
Message-ID: <ebbe2e22-e094-4d3a-bac8-b6ed8a8e1ef6@oss.qualcomm.com>
Date: Sat, 20 Sep 2025 09:36:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: Fix data arguments to coresight
 enable/disable helpers
To: Carl Worth <carl@os.amperecomputing.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Sabrina Dubroca <sd@queasysnail.net>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <e1a2ee99-07bc-40f3-8742-a0cb1c273350@oss.qualcomm.com>
 <20250919174932.3490404-1-carl@os.amperecomputing.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250919174932.3490404-1-carl@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: y3UZe6Dg8ics3hOnR4ee2DXnqsb0LNJ6
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68ce0537 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=vzhER2c_AAAA:8 a=ScZMK1ZTS-vwp2uqSIIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=0YTRHmU2iG2pZC6F1fw2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXxp8D2hlHI397
 B16lPVxY38E+5Nzmr637fo/5C8yqcTsmIl2Zlsd2w469qFzHjxKC8EdgA7JSUpwezYVxj6zGGmA
 Nq1vGNAy99dTDGznAGLhU8BqH6mYm4WfRMhOjxZFBHSPZUWwT6dwGjEVcEVnSnVa7uTLChu1UoI
 ZCoGZhvRSeIFjZ22O7ZsOaqoHNmyD2HlK+2ArnnzOkCziUKjQzfK1phlu0L9uzQzCFL8Hiv2uP+
 +rCo3nSeNspZSmYJ6UleYDR7/cvl43uBdqdLRXgqHJLYKGOlXVV7D8mZEVDUHVxzb/oJcGFuejC
 QjQLblL5FbhE6Ykbh8cZdjf1DoDn25VHvzLkyxiw9A99HE+hlybmHpChEy0jERrpNq1NiJHQ745
 el7+UlKx
X-Proofpoint-ORIG-GUID: y3UZe6Dg8ics3hOnR4ee2DXnqsb0LNJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_183657_216015_DB26F335 
X-CRM114-Status: GOOD (  42.18  )
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



On 9/20/2025 1:49 AM, Carl Worth wrote:
> In the commit being fixed, coresight_enable_path() was changed to call
> coresight_enable_helpers() by passing a struct coresight_path*
> as the final void* 'path' argument, rather passing 'sink_data'
> as was being passed previously. This set the groundwork for the
> subsequent addition of the ctcu_enable function which interprets
> void* data as a struct coresight_path*, but it also broke the
> existing catu_enable function which interprets void* data
> as a struct perf_output_handle*.
> 
> The compiler could not flag the error since there are several layers
> of function calls treating the pointer as void*.
> 
> Fix both users simultaneously by adding an additional argument to the
> enable helper interface. So now both the struct coresight_path and the
> struct perf_output_handle pointers are passed. Also, eliminate all
> usages of the void* from these code paths and use explicit types
> instead to make all of this code more robust.
> 
> Note: The disable function is also changed from void* to
> struct coresight_path* but no implementations of this function
> need the struct perf_output_handle* so it is not added to the interface.
> 
> The existing bug can be reproduced with:
> 
> # perf record -e cs_etm//k -C 0-9 dd if=/dev/zero of=/dev/null
> 
> Showing an oops as follows:
> 
> Unable to handle kernel paging request at virtual address 000f6e84934ed19e
> 
> Call trace:
>   tmc_etr_get_buffer+0x30/0x80 [coresight_tmc] (P)
>   catu_enable_hw+0xbc/0x3d0 [coresight_catu]
>   catu_enable+0x70/0xe0 [coresight_catu]
>   coresight_enable_path+0xb0/0x258 [coresight]
> 
> Fixes: 080ee83cc361 ("Coresight: Change functions to accept the coresight_path")
> Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
> ---
> 
> Jie, I looked into your suggestion of adding the struct
> perf_output_handle* to the struct coresight_path, but I couldn't
> justify adding event-related data to the path structure, which has
> nothing to do with it.

The AUX event only available in perf mode. Each subsystem can access it 
from the path if needed. Since the Coresight system operates by 
constructing a path — and this path is passed to each device as data - 
it’s acceptable to include all relevant parameters in the 
coresight_path, provided the devices along the path require them.

Do you want me to create a patch as example?

Thanks,
Jie

> 
> So, instead I took the approach in this patch to plumb both arguments
> through the enable path, (and changed away from void* as you agreed
> to).
> 
> Note: I've tested that this fixes the bug for catu_enable. This patch
> also obviously touches ctcu_enable, which I believe is correct, but I
> have not tested since I don't have ready access to the necessary
> hardware. I will appreciate other testing.
> 
> -Carl
> 
>   drivers/hwtracing/coresight/coresight-catu.c  | 12 ++++++----
>   drivers/hwtracing/coresight/coresight-core.c  | 23 +++++++++++--------
>   .../hwtracing/coresight/coresight-ctcu-core.c | 11 ++++-----
>   .../hwtracing/coresight/coresight-cti-core.c  |  7 ++++--
>   .../hwtracing/coresight/coresight-cti-sysfs.c |  2 +-
>   drivers/hwtracing/coresight/coresight-cti.h   |  6 +++--
>   drivers/hwtracing/coresight/coresight-priv.h  |  2 +-
>   .../hwtracing/coresight/coresight-tmc-etr.c   |  4 ++--
>   drivers/hwtracing/coresight/coresight-tmc.h   |  3 ++-
>   include/linux/coresight.h                     |  6 +++--
>   10 files changed, 45 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 5058432233da..724c25d0afa4 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -397,7 +397,7 @@ static int catu_wait_for_ready(struct catu_drvdata *drvdata)
>   }
>   
>   static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
> -			  void *data)
> +			  struct perf_output_handle *handle)
>   {
>   	int rc;
>   	u32 control, mode;
> @@ -425,7 +425,7 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
>   	etrdev = coresight_find_input_type(
>   		csdev->pdata, CORESIGHT_DEV_TYPE_SINK, etr_subtype);
>   	if (etrdev) {
> -		etr_buf = tmc_etr_get_buffer(etrdev, cs_mode, data);
> +		etr_buf = tmc_etr_get_buffer(etrdev, cs_mode, handle);
>   		if (IS_ERR(etr_buf))
>   			return PTR_ERR(etr_buf);
>   	}
> @@ -455,7 +455,8 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
>   }
>   
>   static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
> -		       void *data)
> +		       struct coresight_path *path,
> +		       struct perf_output_handle *handle)
>   {
>   	int rc = 0;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
> @@ -463,7 +464,7 @@ static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
>   	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
>   	if (csdev->refcnt == 0) {
>   		CS_UNLOCK(catu_drvdata->base);
> -		rc = catu_enable_hw(catu_drvdata, mode, data);
> +		rc = catu_enable_hw(catu_drvdata, mode, handle);
>   		CS_LOCK(catu_drvdata->base);
>   	}
>   	if (!rc)
> @@ -488,7 +489,8 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
>   	return rc;
>   }
>   
> -static int catu_disable(struct coresight_device *csdev, void *__unused)
> +static int catu_disable(struct coresight_device *csdev,
> +			struct coresight_path *__unused)
>   {
>   	int rc = 0;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fa758cc21827..cc449d5196a4 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -353,14 +353,17 @@ static bool coresight_is_helper(struct coresight_device *csdev)
>   }
>   
>   static int coresight_enable_helper(struct coresight_device *csdev,
> -				   enum cs_mode mode, void *data)
> +				   enum cs_mode mode,
> +				   struct coresight_path *path,
> +				   struct perf_output_handle *handle)
>   {
> -	return helper_ops(csdev)->enable(csdev, mode, data);
> +	return helper_ops(csdev)->enable(csdev, mode, path, handle);
>   }
>   
> -static void coresight_disable_helper(struct coresight_device *csdev, void *data)
> +static void coresight_disable_helper(struct coresight_device *csdev,
> +				     struct coresight_path *path)
>   {
> -	helper_ops(csdev)->disable(csdev, data);
> +	helper_ops(csdev)->disable(csdev, path);
>   }
>   
>   static void coresight_disable_helpers(struct coresight_device *csdev, void *data)
> @@ -477,7 +480,9 @@ void coresight_disable_path(struct coresight_path *path)
>   EXPORT_SYMBOL_GPL(coresight_disable_path);
>   
>   static int coresight_enable_helpers(struct coresight_device *csdev,
> -				    enum cs_mode mode, void *data)
> +				    enum cs_mode mode,
> +				    struct coresight_path *path,
> +				    struct perf_output_handle *handle)
>   {
>   	int i, ret = 0;
>   	struct coresight_device *helper;
> @@ -487,7 +492,7 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
>   		if (!helper || !coresight_is_helper(helper))
>   			continue;
>   
> -		ret = coresight_enable_helper(helper, mode, data);
> +		ret = coresight_enable_helper(helper, mode, path, handle);
>   		if (ret)
>   			return ret;
>   	}
> @@ -496,7 +501,7 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
>   }
>   
>   int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> -			  void *sink_data)
> +			  struct perf_output_handle *handle)
>   {
>   	int ret = 0;
>   	u32 type;
> @@ -510,7 +515,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   		type = csdev->type;
>   
>   		/* Enable all helpers adjacent to the path first */
> -		ret = coresight_enable_helpers(csdev, mode, path);
> +		ret = coresight_enable_helpers(csdev, mode, path, handle);
>   		if (ret)
>   			goto err_disable_path;
>   		/*
> @@ -526,7 +531,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   
>   		switch (type) {
>   		case CORESIGHT_DEV_TYPE_SINK:
> -			ret = coresight_enable_sink(csdev, mode, sink_data);
> +			ret = coresight_enable_sink(csdev, mode, handle);
>   			/*
>   			 * Sink is the first component turned on. If we
>   			 * failed to enable the sink, there are no components
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index c6bafc96db96..9f6d71c59d4e 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -156,17 +156,16 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
>   	return __ctcu_set_etr_traceid(csdev, traceid, port_num, enable);
>   }
>   
> -static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode, void *data)
> +static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
> +		       struct coresight_path *path,
> +		       struct perf_output_handle *handle)
>   {
> -	struct coresight_path *path = (struct coresight_path *)data;
> -
>   	return ctcu_set_etr_traceid(csdev, path, true);
>   }
>   
> -static int ctcu_disable(struct coresight_device *csdev, void *data)
> +static int ctcu_disable(struct coresight_device *csdev,
> +			struct coresight_path *path)
>   {
> -	struct coresight_path *path = (struct coresight_path *)data;
> -
>   	return ctcu_set_etr_traceid(csdev, path, false);
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 8fb30dd73fd2..f92e3be4607c 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -799,14 +799,17 @@ static void cti_pm_release(struct cti_drvdata *drvdata)
>   }
>   
>   /** cti ect operations **/
> -int cti_enable(struct coresight_device *csdev, enum cs_mode mode, void *data)
> +int cti_enable(struct coresight_device *csdev, enum cs_mode mode,
> +	       struct coresight_path *path,
> +	       struct perf_output_handle *handle)
>   {
>   	struct cti_drvdata *drvdata = csdev_to_cti_drvdata(csdev);
>   
>   	return cti_enable_hw(drvdata);
>   }
>   
> -int cti_disable(struct coresight_device *csdev, void *data)
> +int cti_disable(struct coresight_device *csdev,
> +		struct coresight_path *path)
>   {
>   	struct cti_drvdata *drvdata = csdev_to_cti_drvdata(csdev);
>   
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 572b80ee96fb..2bb6929eeb19 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -112,7 +112,7 @@ static ssize_t enable_store(struct device *dev,
>   		ret = pm_runtime_resume_and_get(dev->parent);
>   		if (ret)
>   			return ret;
> -		ret = cti_enable(drvdata->csdev, CS_MODE_SYSFS, NULL);
> +		ret = cti_enable(drvdata->csdev, CS_MODE_SYSFS, NULL, NULL);
>   		if (ret)
>   			pm_runtime_put(dev->parent);
>   	} else {
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index 8362a47c939c..73954369654c 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -216,8 +216,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
>   			     const char *assoc_dev_name);
>   struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
>   					   int out_sigs);
> -int cti_enable(struct coresight_device *csdev, enum cs_mode mode, void *data);
> -int cti_disable(struct coresight_device *csdev, void *data);
> +int cti_enable(struct coresight_device *csdev, enum cs_mode mode,
> +	       struct coresight_path *path,
> +	       struct perf_output_handle *handle);
> +int cti_disable(struct coresight_device *csdev, struct coresight_path *path);
>   void cti_write_all_hw_regs(struct cti_drvdata *drvdata);
>   void cti_write_intack(struct device *dev, u32 ackval);
>   void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value);
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 33e22b1ba043..65c4984d98c0 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -136,7 +136,7 @@ static inline void CS_UNLOCK(void __iomem *addr)
>   
>   void coresight_disable_path(struct coresight_path *path);
>   int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> -			  void *sink_data);
> +			  struct perf_output_handle *handle);
>   struct coresight_device *coresight_get_sink(struct coresight_path *path);
>   struct coresight_device *coresight_get_sink_by_id(u32 id);
>   struct coresight_device *
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..2ed7fa2366ce 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1325,9 +1325,9 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>   }
>   
>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
> -				   enum cs_mode mode, void *data)
> +				   enum cs_mode mode,
> +				   struct perf_output_handle *handle)
>   {
> -	struct perf_output_handle *handle = data;
>   	struct etr_perf_buffer *etr_perf;
>   
>   	switch (mode) {
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 6541a27a018e..b6e2b00d393a 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -440,7 +440,8 @@ struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
>   void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
>   void tmc_etr_remove_catu_ops(void);
>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
> -				   enum cs_mode mode, void *data);
> +				   enum cs_mode mode,
> +				   struct perf_output_handle *handle);
>   extern const struct attribute_group coresight_etr_group;
>   
>   #endif
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 4ac65c68bbf4..450cccd46f38 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -422,8 +422,10 @@ struct coresight_ops_source {
>    */
>   struct coresight_ops_helper {
>   	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
> -		      void *data);
> -	int (*disable)(struct coresight_device *csdev, void *data);
> +		      struct coresight_path *path,
> +		      struct perf_output_handle *data);
> +	int (*disable)(struct coresight_device *csdev,
> +		       struct coresight_path *path);
>   };
>   
>   
> 
> base-commit: 46a51f4f5edade43ba66b3c151f0e25ec8b69cb6


