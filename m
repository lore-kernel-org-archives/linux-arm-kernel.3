Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579D7D0C844
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mDPaq0hclLjwSYmTrQ6n+kDZ3N8OGbVHga1O58ScVs=; b=STVYV93dHYN9h85tzd9EVUhohQ
	UdPoF6Bz+og4w3/bRMTUFqABFISp2rUP06JPoAf1OKwCtVciY9IFFdvwKo5kBU298XDikH78DwVMm
	cIS7mtqXHfL9q6JA8QZOciELkaajGYWjBIruvPApw16cueL1sUsuND7a+VCk0Uf7vlZYgWIuJ0qV+
	qsrxr5GmUZV65ucPCXSO7uqMAl2DQNd94NkGsSTExMPnzIFhg6LavVP0Yy4rNF6merEUza5fH6Yyw
	dCOdCd3WTM91LefQ/lhjXhrsHBGn40irRXwdiaV0nYZJVPL5wrW+aQR2r/UTMk4HICk3koJWnZ7FZ
	UA5xcc3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbiw-00000006ukt-3OId;
	Tue, 13 Jan 2026 10:34:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbiv-00000006ukI-08J2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:34:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5bAXN3637494
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 10:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8mDPaq0hclLjwSYmTrQ6n+kDZ3N8OGbVHga1O58ScVs=; b=hQchbHPF+Uvlvg1y
	CXDUcj8D6h1bepkHTMSbtg1vC968XhvjSJE4qiW5DsW9SaCBEsI3esoUAQdlbYQI
	qKGPy4sSHAwc7Lc+21ue5X79YVxC1CbJfOWibnOCk5E/rvBzH0t4q31aLrJ0yW4n
	kbZCVvzl7h0QfH4EmXq4H7d2A+7qvbw0HKbJLnpOxH5fDYQian5MUmemgxX4hrPq
	//38Dd/VLsx423jfBFqPdLODGwriNqJdE+AJGDTdHJp2lk9xjoR7bQ6EO3MC8ISd
	8+uvP8f+mZeQXflUwfTse+SpNNm2oqDCP1dsigpHVQgsMoA8He7eDc6xBhaepmq4
	LGYaDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c0xj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 10:34:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52d47dfceso252685a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300443; x=1768905243; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8mDPaq0hclLjwSYmTrQ6n+kDZ3N8OGbVHga1O58ScVs=;
        b=SK+05PTT6O/66bZXfBg2Uk/9rgJGf/H5dpiy09DG7zhVi1gvFO4QBsJJm6v4NvDD2r
         zC6AzQ42ZzvYchRPd5qwSosUgFCGT/GqQ577Lsa6QUWIcXLEgnpbgQXMNtWSwXVFSDmy
         hpk/bOz5Ihfy8wDsJ/OsBvBvaH+Tiv91m/C3z6UTWxLBU3LeaBKmaJNWcJ8BoyLim7Hq
         l9DCnq1nKn9akO9JTLivO/M6OuZ4JFj0MZy0yuf7aUhPkBQUI5/HUCCkKRYqcP4LDBDy
         mbOVoTg8cGgr8UeNNVYUPuayLbdj+ODTnUGHVv6YIEb3TIun8ajUW37yfdlLo7U6k9YU
         V97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300443; x=1768905243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mDPaq0hclLjwSYmTrQ6n+kDZ3N8OGbVHga1O58ScVs=;
        b=HikNItFxV2xaqoVpbsC2LMljYr8OU/zqGjdNC21CSOxJSRKkURLY04ibZSEutx/6K7
         WLvWrxt1m5Myw7P4Xp9A5aZIcQln7PgpwZbbnFN+h1ITzjYlsZBLCqrQsJsZRR+QxRb+
         X4uiv7KBWA8i6rJVg1uylMXfgSgZ7ClL0iYLAe6FHvZDP8NBBYBw9YaBda+ShZtcG4Ny
         NrEhUUXCM7ud8Uf6Y56Sdot1ROwc3A9IvR5PKt64OlL3JUopOhYTasqTWXoxWjbsUU2r
         Dsocxm0wuMQDgmyRp/fILX7j+AlCoV2ENCSRABdjLEuzm/GLx4vCzNvS9cBRWeJFYax8
         wKTA==
X-Forwarded-Encrypted: i=1; AJvYcCVlEPHM6GcxsWk2OJaGX0gHEss1XD3dvf3YbVdzxTsxu5WGCoVJIw+lc5xwzjhI6q4icw6O2G7kSC3OQz5O7mRl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3XKEA5V3Gln/CgaOsS2h1d48bMEFHt5Q3e4/tDWdvFtLJd1+h
	p2XMVGBhavVJRLT8DrWvMvF7p4Lo81thJPTsguwo4ulfOrpx31yT6fJPw0N8gr5m07XK2+EFvJr
	K++zVM8vRJ7g0VXhyx/O5v+rn+ceoRB8jF0Q+saD06QTa4rGQ2lkFUCFQvenigXIPj30zVnsUQ+
	tmNg==
X-Gm-Gg: AY/fxX5WfEmCTNdnNuWrw32OEfxPWN4DvQnh9adnRx9g+3g18+V30LQLEsnyDnKO7ye
	Vi46MO9sVl3oTIc5eeKtBTSGjEvKuY0y4MNoe1YgFggZPN4PA1fLKa63OtZMBr2SALGS1dKLcIH
	PWwLq0o2yd/zgz3SJHywJnvZfYn5n+WigMwtk1kgI4afJAwlJQrRhzqkucua1FT5z5SOHTzlHoz
	4SdLaOOG06nxk081lqgco8CqlIP26GiyEpbQM7OgSdgJS+gGykqZNEXtTGKvUQsPZ5Y4D1cNt3d
	1fgUafPgIq+4hJQoOtpwCszjZfnxeqOeM/7DaqJfZllFnw1TdDIjp50eTWRlUEse/LIJjORzm30
	KXeKoNnKDr8cFL1sUzXJSX0WfxHZwrhwFGE0Wtxd8Yu39Uqm+L+SwQd6emwbubqDRCOg=
X-Received: by 2002:a05:620a:bcd:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c3893fd8femr1953528185a.9.1768300443183;
        Tue, 13 Jan 2026 02:34:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJACxFutkrDz6BTVbO+uCz2sZFjD+cOF/xK1HFoRB0R+KXXMAzENrCTjFRt6r4V9cac6GAwA==
X-Received: by 2002:a05:620a:bcd:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8c3893fd8femr1953526085a.9.1768300442628;
        Tue, 13 Jan 2026 02:34:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fee09153sm899209166b.29.2026.01.13.02.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 02:34:01 -0800 (PST)
Message-ID: <c5569d62-1dd5-4dec-8cb9-dd1c6e3938c6@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 11:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OSBTYWx0ZWRfX5UIlLqKBUsxq
 pROdaup3wtiB2Vsvx6odW339NO6o9pDiq4I4CrP2sA+RrbaXTTqQ/GPe6ABGS6+Agh4+i6tQYDG
 19dlmXk0azycZR2wEy1AOs/WL8Y0SJLVzC6wW4ZSGFtxhF+wJ/V3IP6UX0s95tp+uY8lxMYHXFi
 nngKz9nUzVyt13K4TDcovT2XTB0vHFN1uF9o04CcvoKj0F8AcSK0BpnSQMrQ/1whTIG75QqUTWz
 YG60fCkSg1NIWN8upz+wRJ6hHqwTS7i5knJs867RyQxgCSYMCpPRuasSCUUzHJ0wG78kj2Oltzi
 26RQuFpkjVOyFuihuAoYSvOEDzihzWI9pgzvNwBK5r+cd3W01IUue1nv/3NJHIJxI7DRcGzLlSl
 QWiWvNG0Ql0A9jnwNHB6QM+CpGhQohRi1BE6AhX76LIOAXc2MYLvj1yuAoD37F/Bpst9WJG8t67
 W2ongdzFWR0VOna21Yg==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=69661f9c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VZhoWKq-FIP5gklq0E0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: fgigffCWtfpSbXyv_2Anj_b2xSH-4TRF
X-Proofpoint-ORIG-GUID: fgigffCWtfpSbXyv_2Anj_b2xSH-4TRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_023405_080309_44B39DB6 
X-CRM114-Status: GOOD (  29.42  )
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

On 1/9/26 3:11 AM, Songwei Chai wrote:
> Add driver to support device TGU (Trigger Generation Unit).
> TGU is a Data Engine which can be utilized to sense a plurality of
> signals and create a trigger into the CTI or generate interrupts to
> processors. Add probe/enable/disable functions for tgu.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---

[...]

> +static void tgu_disable(struct device *dev)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	guard(spinlock)(&drvdata->lock);
> +	if (drvdata->enable) {

if (!drvdata->enabled)
	return


> +		TGU_UNLOCK(drvdata->base);
> +		writel(0, drvdata->base + TGU_CONTROL);
> +		TGU_LOCK(drvdata->base);
> +
> +		drvdata->enable = false;
> +	}
> +}
> +
> +static ssize_t enable_tgu_show(struct device *dev,

'enabled', in all references to this, please

> +				struct device_attribute *attr, char *buf)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	bool enabled;
> +
> +	guard(spinlock)(&drvdata->lock);
> +	enabled = drvdata->enable;
> +
> +	return sysfs_emit(buf, "%d\n", enabled ? 1 : 0);

!!enabled


> +}
> +
> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
> +static ssize_t enable_tgu_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf,
> +				size_t size)
> +{
> +	unsigned long val;
> +	int ret = 0;

Drop the initialization, you override it immediately a line below

[...]

> +static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct tgu_drvdata *drvdata;
> +	int ret;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->dev = &adev->dev;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	drvdata->base = devm_ioremap_resource(dev, &adev->res);
> +	if (IS_ERR(drvdata->base))
> +		return PTR_ERR(drvdata->base);
> +
> +	spin_lock_init(&drvdata->lock);
> +
> +	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
> +	if (ret) {
> +		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drvdata->enable = false;
> +
> +	pm_runtime_put(&adev->dev);
> +	return 0;

Please keep a consistent \n above return as you did in all other places
throughout this file

[...]

> +/* Register addresses */
> +#define TGU_CONTROL 0x0000
> +#define TGU_LAR		0xfb0
> +#define TGU_UNLOCK_OFFSET	0xc5acce55

Please align the values (it's easier with tabs)

> +
> +static inline void TGU_LOCK(void __iomem *addr)
> +{
> +	do {
> +		/* Wait for things to settle */
> +		mb();

What are we waiting for here?

> +		writel_relaxed(0x0, addr + TGU_LAR);

If you do a prompt TGU_LOCK()-TGU_UNLOCK() the writes may arrive in
the order opposite to what you want, I'd say this shouldn't be _relaxed()
and we should probably have a readback here to make sure the effect has
taken place immediately

> +	} while (0);
> +}
> +
> +static inline void TGU_UNLOCK(void __iomem *addr)
> +{
> +	do {
> +		writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
> +		/* Make sure everyone has seen this */
> +		mb();

I believe this should be a readback instead

> +	} while (0);
> +}
> +
> +/**
> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
> + * @base: Memory-mapped base address of the TGU device
> + * @dev: Pointer to the associated device structure
> + * @lock: Spinlock for handling concurrent access

Concurrent access to what? (presumably the TGU?)

> + * @enable: Flag indicating whether the TGU device is enabled
> + *
> + * This structure defines the data associated with a TGU device,
> + * including its base address, device pointers, clock, spinlock for
> + * synchronization, trigger data pointers, maximum limits for various
> + * trigger-related parameters, and enable status.
> + */
> +struct tgu_drvdata {
> +	void __iomem *base;
> +	struct device *dev;
> +	spinlock_t lock;
> +	bool enable;

"enabled", please

Konrad

