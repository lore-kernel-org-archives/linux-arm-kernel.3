Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99715CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 01:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izhTeIV2e9xijy8tq2CEayUpGN/P5cZH+g7aMRXy4c8=; b=FXWXX9T2HdxYKpeNUPKbKIVNY6
	ksvEjpnwRcLQjyMjvInuGZE31I5Z3qOcgP+pHUQmHdKvK/7b5Xh0zcFPsC10ErgnswmVC8UpUyh0r
	tahZ4cU1BCJK8hu+vxU6PelvhbnVz9zXAu00AN7vxuw/3SehbZRcNAP1C5z3IZOURSPZiavCtTRee
	gbNBlA0RBp5JDn3HWgYt7/4wb/iZbhgWR82A8hVV4xdPuPxo5YR1DTiScqb/hl6IncJgD48gvzPoN
	PguuiR8LvwXNckTq7vLx0VgdswSrw1yAo6s33lt6/tJSVJ2crVkzzFceAy+mtIGoL5ws2QEindmh+
	5lu6AnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1cN-0000000FWEv-3FxP;
	Tue, 21 Oct 2025 01:56:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1cK-0000000FWEU-25Uh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 01:56:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL1pDf028023
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 01:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izhTeIV2e9xijy8tq2CEayUpGN/P5cZH+g7aMRXy4c8=; b=nljDf+BVMHNp6Rvl
	KarIsPrhhyW2mBIOmLBnKAq5faH/3tzjT/mbnfArA5ADGZrXAolo5kN1DbhDmc78
	tZYIfLEgUeUxFDjAthFRr0VyHMHn5bGMzEUZAg2+MWewa1tZgr5/5QJhhJXMD68K
	Sw7P0rob08isnPy1tdagkLRl0TdDdd8mqOzCbfVXsIXJv+jfNLBJg+h/BPjftEv1
	GpxUbxtwpVIyO6MenkYFg4ImqV77WyaHtBk+xW/QNtzBulkH01uH+riFnP3LZox1
	A9CSsstHn38kX5m4MkRQKsKcJHBBI6bvZSdtb7RY4bXFza1hLqXgp2GNpvbogH/p
	lDcExQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27hxt4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 01:56:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-780f82484faso3530252b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 18:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761011809; x=1761616609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izhTeIV2e9xijy8tq2CEayUpGN/P5cZH+g7aMRXy4c8=;
        b=cIQ8NQyveN01L5szTsb/6UsEK+Fp6dzCA4HYMZBhgIl5S7zh8xnXtfi/XHB0gqMulR
         3pWIunfkWPxS8MWKXPH6JG2qXNNBn9e39VA4u5IhaY12bi0OiWDkx4nwkOfUUVG11Nup
         DeXLxbfPFCe+Ay08KJqpZ6X1FPPwdHghR8caO6St/XnTv+VBClvEBQMtDAGlfKtUQYm6
         bRpxMo56L4HCCrlb8zwH3GLoWRncW1dBi8wJIEGZipFuHpmbC61GLuOM2ncxj0fO86vT
         pUlL+/cx4zuenRx37nYhauQNr6OFENzsi0eQc9dmnPGlBWoKwm0U5gLghw8gi8cDPHS7
         oxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpL8dTVFHRuFKLKTpL73XsJ/g3uPu9eyW/OWJIcC4N3LV1vKZ/XgBmL0jY+2cWhb8WCc8aYyF+84Ih7cki4OuZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyEKjPxzB4qBt4muX7gPqO1qYAw8OJ5WrQsS/qb9JVSTynWHPrU
	JSZ3w/xAVfnCtpxfh1ZOjgtTWlVyKTm9CgxMKvswkFs4WHqoPHeyxVY8p7ceV0blez4PkAVl0h/
	JImayJ1g3rKdZmwXq+AnQL6iSUPMA5p0YeNUhCD/yLHYF8E8I2R6R6IqLNQqnHQ8+lO2DuVMZhi
	mGPw==
X-Gm-Gg: ASbGncu5pEhqrbqOqU1u2l7fyO6hfTpJqNY8MpZY+EioF3hyfkAK0v0oAdJEZl9f2X/
	Z2d8luwcyklSUoU4l/vYgou3JDajsYXmK/ouIbtnyBRzPpuHsYrsBrAey03RPE6KuCGfmh0AhrF
	E5c8Cp8ROBDKa5jZPPwwhFvLowH70PP3AF2vgig7vp3CC3EjDucXYPrpl5LxHsJ5jxdQ+fJ6nbs
	66w/SImnOS9++GJSWtYaO91VhRYhDWZoMeCACeyFqx/5zFfBkoS7kIBIVjmPkyb8Z0P9Yk7Rfnr
	TSmyJbiOc9XxMkzXADxB8tbuY+AHf+asQKsl0ksBgHNUAcGtha9k63F0kjbSMOXdDyIJQ5YhZrc
	FUq0fHUsyBfOw4KuGCQWe6NXXV2hJQUs3SCvUnAoufn3BuBP3MXX4SywCKfp/IMqQ
X-Received: by 2002:a05:6a00:2e03:b0:781:17ba:ad76 with SMTP id d2e1a72fcca58-7a220b34252mr18292566b3a.24.1761011809446;
        Mon, 20 Oct 2025 18:56:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3UpsB5sbvHyYTrr9etsD3AraqUiTnb3KgXNq2kLmRCdX0oNZ7KV05IVAcmSlESGas5oeemw==
X-Received: by 2002:a05:6a00:2e03:b0:781:17ba:ad76 with SMTP id d2e1a72fcca58-7a220b34252mr18292534b3a.24.1761011808902;
        Mon, 20 Oct 2025 18:56:48 -0700 (PDT)
Received: from [10.133.33.105] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34adasm9601087b3a.19.2025.10.20.18.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 18:56:48 -0700 (PDT)
Message-ID: <6e6c3034-221c-4e79-8971-7bfbe26f91a6@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 09:56:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: ETR: Fix ETR buffer use-after-free issue
To: Leo Yan <leo.yan@arm.com>, Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
 <20251020143718.GH281971@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251020143718.GH281971@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX67XYq99dRIY3
 FM+fV+JNvAyg/MCZ+ONo5Jn9x0usLKI8k3bA4tjAKe1hnnYg+OdvmWmLA4ZJv4iYs64B/0ODU2K
 /OzZR4mPIwmg/7htwtp0SRYlcLFpMkXuEYRUDxlVrNXHFrVizGjoVfXaerGVni6wnmkDakb7U0g
 FPDP7DB4Ybn75qv3epjfSeyyHJum5D9dX3q8kGWMsFm24FZsIDm0W96oD7c4ilICuov1mHxRh6+
 6RZ2V/Vwcsa//bEiYszvkdHPGTRX9dJ9HBvJIP6NKqMXsMeLaPHZeeENovp0FTbWnwlTjzm73+V
 2E1W7BBQKC4GmdM8xnwNAzQG0z5BT+880AaY1DxfmWMM0GaX4fd85KyQBJkxnh7wOghFwP727nu
 pFbSlxR6qoIpN26WGxjiR6tEC9s79Q==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f6e862 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=U0zv61LCSj-UQdD20V0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Yk3wCOaZjy0qEmTJac73TmguzRLRwZXC
X-Proofpoint-ORIG-GUID: Yk3wCOaZjy0qEmTJac73TmguzRLRwZXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_185652_679513_10AA49E1 
X-CRM114-Status: GOOD (  51.52  )
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



On 10/20/2025 10:37 PM, Leo Yan wrote:
> On Mon, Oct 20, 2025 at 05:06:46PM +0800, Xiaoqi Zhuang wrote:
>> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
>> and enabled again, currently sysfs_buf will point to the newly
>> allocated memory(buf_new) and free the old memory(buf_old). But the
>> etr_buf that is being used by the ETR remains pointed to buf_old, not
>> updated to buf_new. In this case, it will result in a memory
>> use-after-free issue.
> 
> I struggled to understand how to reproduce the issue under the condition
> "if the buffer size is changed and enabled again."
> 
> I don't think the flow below where the trace is re-enabled would cause
> an issue:
> 
>    - Step 1: Enable trace path between ETM0 -> ETR0;
>    - Step 2: Change the buffer size for ETR0;
>    - Step 3: Disable trace path between ETM0 -> ETR0;
>    - Step 4: Enable again trace path between ETM0 -> ETR0.
> 
> In this case, step3 releases the buffer and update "drvdata->etr_buf" to
> NULL, and step 4 allocates a new buffer and assign it to
> "drvdata->etr_buf".
> 
> The problem should occur when operating on two trace paths, E.g.,
> 
>    - Step 1: Enable trace path between ETM0 -> ETR0;
>    - Step 2: Change the buffer size for ETR0;
>    - Step 3: Enable trace path between ETM1 -> ETR0;
> 
> In step3, the driver releases the existed buffer and allocate a new one.
> At the meantime, "drvdata->etr_buf" still holds the buffer allocated in
> step 1.

That's the scenario of the issue. The system will report a segmentation 
error when the driver try to sync the freed etr_buf.

> 
>> Fix this by checking ETR's mode before updating and releasing buf_old,
>> if the mode is CS_MODE_SYSFS, then skip updating and releasing it.

I agree. We should bail out as earlier as possible to gain some 
performance efficiency.

> 
> Given that we now have a couple of reported issues related to ETR mode,
> I'd like to refactor the ETR mode handling and its reference counting
> thoroughly.  I've drafted a large change (it's quite big, but we can
> split it into small patches if we agree to proceed).
> 
> Thanks for reporting the issue!
> 
> Leo
> 
> ---8<---
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..d0fac958c614 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1241,6 +1241,8 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct etr_buf *sysfs_buf = NULL, *new_buf = NULL, *free_buf = NULL;
>   
> +	WARN_ON(coresight_get_mode(csdev) != CS_MODE_SYSFS);

I think we should check the WARN_ON result and exit if there is an error?

> +
>   	/*
>   	 * If we are enabling the ETR from disabled state, we need to make
>   	 * sure we have a buffer with the right size. The etr_buf is not reset
> @@ -1263,7 +1265,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>   		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>   	}
>   
> -	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
> +	if (drvdata->reading) {
>   		ret = -EBUSY;
>   		goto out;
>   	}
> @@ -1292,30 +1294,14 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>   	int ret = 0;
>   	unsigned long flags;
>   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -	struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
> +	struct etr_buf *sysfs_buf;
>   
> +	sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
>   	if (IS_ERR(sysfs_buf))
>   		return PTR_ERR(sysfs_buf);
>   
>   	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> -
> -	/*
> -	 * In sysFS mode we can have multiple writers per sink.  Since this
> -	 * sink is already enabled no memory is needed and the HW need not be
> -	 * touched, even if the buffer size has changed.
> -	 */
> -	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
> -		csdev->refcnt++;
> -		goto out;
> -	}
> -
>   	ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
> -	if (!ret) {
> -		coresight_set_mode(csdev, CS_MODE_SYSFS);
> -		csdev->refcnt++;
> -	}
> -
> -out:
>   	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>   
>   	if (!ret)
> @@ -1735,11 +1721,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
>   
>   	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> -	 /* Don't use this sink if it is already claimed by sysFS */
> -	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
> -		rc = -EBUSY;
> -		goto unlock_out;
> -	}
>   
>   	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
>   		rc = -EINVAL;
> @@ -1759,18 +1740,14 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   	 * No HW configuration is needed if the sink is already in
>   	 * use for this session.
>   	 */
> -	if (drvdata->pid == pid) {
> -		csdev->refcnt++;
> +	if (drvdata->pid == pid)
>   		goto unlock_out;
> -	}
>   
>   	rc = tmc_etr_enable_hw(drvdata, etr_perf->etr_buf);
>   	if (!rc) {
>   		/* Associate with monitored process. */
>   		drvdata->pid = pid;
> -		coresight_set_mode(csdev, CS_MODE_PERF);
>   		drvdata->perf_buf = etr_perf->etr_buf;
> -		csdev->refcnt++;
>   	}
>   
>   unlock_out:
> @@ -1778,17 +1755,76 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>   	return rc;
>   }
>   
> +static int tmc_acquire_mode(struct coresight_device *csdev, enum cs_mode mode)
> +{
> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	if (mode != CS_MODE_SYSFS && mode != CS_MODE_PERF)
> +		return -EINVAL;
> +
> +	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
> +
> +	if (coresight_get_mode(csdev) == CS_MODE_DISABLED) {
> +		if (!csdev->refcnt)
> +			coresight_set_mode(csdev, mode);
> +		csdev->refcnt++;
> +	} else if (coresight_get_mode(csdev) != mode) {
> +		ret = -EBUSY;
> +	}
> +
> +	return csdev->refcnt;
> +}
> +
> +static void tmc_release_mode(struct coresight_device *csdev, enum cs_mode mode)
> +{
> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
> +
> +	if (WARN_ON(coresight_get_mode(csdev) != mode))
> +		return;

the mode here could be set to any CS_MODE, so I think it's possible to 
encounter the secenario below:

coresight_get_mode(csdev) == CS_MODE_DISABLED, mode == CS_MODE_DISABLED,

With the condition, the csdev->refcnt will go to negative number?

> +
> +	csdev->refcnt--;
> +	if (!csdev->refcnt)
> +		coresight_set_mode(csdev, CS_MODE_DISABLED);
> +}
> +
>   static int tmc_enable_etr_sink(struct coresight_device *csdev,
>   			       enum cs_mode mode, void *data)
>   {
> +	unsigned long flags;
> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	int ret;
> +
> +	ret = tmc_acquire_mode(csdev, mode);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * For sysfs mode, the higher level mutex ensures exclusively
> +	 * enabling sink, it is safe to bail out if this is not the
> +	 * first time to enable sink.
> +	 *
> +	 * A perf session can enable the same sink simultaneously, fall
> +	 * through to call tmc_enable_etr_sink_perf() to ensure the sink
> +	 * has been enabled.
> +	 */
> +	if (mode == CS_MODE_SYSFS && ret > 1)
> +		return 0;
> +
>   	switch (mode) {
>   	case CS_MODE_SYSFS:
> -		return tmc_enable_etr_sink_sysfs(csdev);
> +		ret = tmc_enable_etr_sink_sysfs(csdev);
>   	case CS_MODE_PERF:
> -		return tmc_enable_etr_sink_perf(csdev, data);
> +		ret = tmc_enable_etr_sink_perf(csdev, data);
>   	default:
> -		return -EINVAL;
> +		ret = -EINVAL;
>   	}
> +
> +	if (ret)
> +		tmc_release_mode(csdev, mode);
> +
> +	return ret;
>   }
>   
>   static int tmc_disable_etr_sink(struct coresight_device *csdev)
> @@ -1796,30 +1832,20 @@ static int tmc_disable_etr_sink(struct coresight_device *csdev)
>   	unsigned long flags;
>   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   
> -	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +	tmc_release_mode(csdev, mode);

mode here is undefined?

Thanks,
Jie

>   
> -	if (drvdata->reading) {
> -		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> -		return -EBUSY;
> -	}
> +	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
>   
> -	csdev->refcnt--;
> -	if (csdev->refcnt) {
> -		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +	if (csdev->refcnt || drvdata->reading)
>   		return -EBUSY;
> -	}
>   
> -	/* Complain if we (somehow) got out of sync */
> -	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
> +	if (drvdata->pid == -1)
> +		return 0;
> +
>   	tmc_etr_disable_hw(drvdata);
> -	/* Dissociate from monitored process. */
> -	drvdata->pid = -1;
> -	coresight_set_mode(csdev, CS_MODE_DISABLED);
>   	/* Reset perf specific data */
>   	drvdata->perf_buf = NULL;
>   
> -	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> -
>   	dev_dbg(&csdev->dev, "TMC-ETR disabled\n");
>   	return 0;
>   }
> 


