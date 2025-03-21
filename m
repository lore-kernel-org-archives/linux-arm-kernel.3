Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DDBC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdOuElFLpccoJsuXgqKPQO+xF/9Y5vee1gm2/OiO0Gw=; b=RELXm4etmtTtxjAqfZH8nGAyya
	ijPlj0UASXPfvSn/K54c3+wHkUsxOg7mRODfin0M9qhGlOPjkV+DXxsPgVmDmYpmdoCNzsAHkONh6
	lF/asQOPozgVJxVg+vL1WGp3coKQHwu1GDN8LZCyIGV4044yvHlzpcSeZvgKzDn3NtBe/QLW9q/ep
	mTQn0GbWr086tG3c93e/FblHHn0QWi+omtwf8aZjebHv7ljBD7gNffAVZzCjcYOrhlT8UM/GQresf
	h+QoIxs3/LXw0Ins+RFgjvCh3Jcw3b/iFLowOoU/+BkxtDIc0wrCaAUp9fpXNnUKP0YgnbIXkfMNw
	WZHScNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvexY-0000000FRDf-2LLh;
	Fri, 21 Mar 2025 16:11:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvevs-0000000FQpz-1aKD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 16:09:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LAThMR003246
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 16:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdOuElFLpccoJsuXgqKPQO+xF/9Y5vee1gm2/OiO0Gw=; b=MBt27kD4ga1ISE1Y
	oYW+r5SB7YuIJ+WP2qd2UrnA9bVoMbvLpp5Ag6nBiypSs0xrww2+q4JskgZvPgEh
	FfXtDFZQSKbkuuGSua1GvghQRGqBh+9M0S6PEv7JSilvs2kl6QO1uM2FN2H7Zjnr
	LDT7PioLyMjyMH0rl3DqPfPkkWX9cjW4KzssK3WpktwvD0pvXnotcSGd2uKYVkCB
	JM/Tqlr0ZQUgjKJTcL48w3PJVc/nAGf82cwFwiuHmOegvi9e+AD/uQwQWf5RFnOc
	sVLDE2CO6twu/klPDlOell0cX7YaIgiWxafKlBrI1ye4lLVmpLJdRKzyD+3HWF3K
	IrpZ2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4p11a0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 16:09:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2240c997059so45845725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 09:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573355; x=1743178155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdOuElFLpccoJsuXgqKPQO+xF/9Y5vee1gm2/OiO0Gw=;
        b=LrlkdO3h/CBXhj3z8xWjDAFuPsQoFyRrPWl8NR1rMg/nLHId22s89gAX4aGFavjAHu
         wvca5DPl8lRq1BXE7QaEps99GcqVjgasVmvKq+FUeA652XXQbIbKUMm2+1lmcKUz7qhz
         i2CDTR394/EO1CMtbXvO9hICQZDEWOo/em42mX4/ilamtRq/vt8dBqeq7a36ph1wXafb
         ayYvL/Vq/vAFQvnzkiggjKJ3Vrq1knr/RfNPxUd9EhnA9YMFy13gZZncjbKbRqQEV4NE
         2AhLvqbVFTtJ26rzyf3VJMJNtlRNNWGTHuCjkKqzmjsqoaHx/u86RxyYcTSMQ8Ly1g+Y
         Sz+A==
X-Forwarded-Encrypted: i=1; AJvYcCWKD7tiSepUaGYX5D8bnpnLxKp8kkt/m2TM3VkKWt6mMBIQNmFWJnfHhkE+hLcemRc1n5UCHaUwSy0k0rPWVS2C@lists.infradead.org
X-Gm-Message-State: AOJu0YyHZwDKll9UUOGbKTC8c7HPpMaQ7juYCecclSFZ5VR9y0iMYlln
	Jqd8zuuAzRoJr47F06Dd3eK+asV78FeajKQFUjfZFwESiMOkIyGGXxuYbGU7OXBtU+TW6fR4F7z
	yacvfkyhC8YWmqs3QU9IHADtrqo2Hqot36J2epgvkvevhtxg56qXuqEhwFGids9sdnpnDsZz9yA
	==
X-Gm-Gg: ASbGncsr2ZSmOSIQuKDdSK1b7xUhCwZm3deWRqEcGeviO2XVhShJ2o/bDta0SU7PC2o
	YiMR9PyqcXZOQFvP6OTCE0mkvHYrSpfxrvMfQO4tM6SXaIRbWyv7vsNY5Qu4WAQ4fbjJHuT9eCO
	JG6qE4Zag7O1vpvqULOC5ibURmXnaYdsgbBLhlB05vIztceRXy5imSW+6C+/xypXxr7H6Suok65
	WjN9Lelzg/V1m+eZWgsgasX9w1/T4i8qFOiSWFuKVfiagdt/ahxdl8Ogqkg6YUg1llWdCjcViRz
	2mEQi6B1hgLI5AlXhXH3/I2LF1iZYLV132tXavU0VXoiaxT2PPwEF8pRVhzNLWbLuw==
X-Received: by 2002:a05:6a00:4f81:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-73905a530a9mr6797783b3a.21.1742573354394;
        Fri, 21 Mar 2025 09:09:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL5fYByHbvsD/gRtsSQfXYP8pBS52gj7BStPaMfEBPmc/gB4ybx9sZflEDEhvH+V7H0dixLA==
X-Received: by 2002:a05:6a00:4f81:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-73905a530a9mr6797719b3a.21.1742573353797;
        Fri, 21 Mar 2025 09:09:13 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a27de717sm1957838a12.12.2025.03.21.09.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:09:13 -0700 (PDT)
Message-ID: <4d617199-191c-47d9-a0f1-5bf9c149d09d@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 10:09:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] accel/rocket: Add job submission IOCTL
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-6-d4dbcfafc141@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250225-6-10-rocket-v2-6-d4dbcfafc141@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KIidPLATFGcumFrXZvoOUsFt6v-ABcEn
X-Proofpoint-ORIG-GUID: KIidPLATFGcumFrXZvoOUsFt6v-ABcEn
X-Authority-Analysis: v=2.4 cv=NZjm13D4 c=1 sm=1 tr=0 ts=67dd8f2b cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=otp63fjl-Mw8CRR8ssMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_090916_424872_441BE189 
X-CRM114-Status: GOOD (  18.90  )
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

On 2/25/2025 12:55 AM, Tomeu Vizoso wrote:
> +/**
> + * struct drm_rocket_task - A task to be run on the NPU
> + *
> + * A task is the smallest unit of work that can be run on the NPU.
> + */
> +struct drm_rocket_task {
> +	/** DMA address to NPU mapping of register command buffer */
> +	__u64 regcmd;
> +
> +	/** Number of commands in the register command buffer */
> +	__u32 regcmd_count;
> +};
> +
> +/**
> + * struct drm_rocket_job - A job to be run on the NPU
> + *
> + * The kernel will schedule the execution of this job taking into account its
> + * dependencies with other jobs. All tasks in the same job will be executed
> + * sequentially on the same core, to benefit from memory residency in SRAM.
> + */
> +struct drm_rocket_job {
> +	/** Pointer to an array of struct drm_rocket_task. */
> +	__u64 tasks;
> +
> +	/** Pointer to a u32 array of the BOs that are read by the job. */
> +	__u64 in_bo_handles;
> +
> +	/** Pointer to a u32 array of the BOs that are written to by the job. */
> +	__u64 out_bo_handles;
> +
> +	/** Number of tasks passed in. */
> +	__u32 task_count;
> +
> +	/** Number of input BO handles passed in (size is that times 4). */
> +	__u32 in_bo_handle_count;
> +
> +	/** Number of output BO handles passed in (size is that times 4). */
> +	__u32 out_bo_handle_count;
> +};
> +
> +/**
> + * struct drm_rocket_submit - ioctl argument for submitting commands to the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency order.
> + */
> +struct drm_rocket_submit {
> +	/** Pointer to an array of struct drm_rocket_job. */
> +	__u64 jobs;
> +
> +	/** Number of jobs passed in. */
> +	__u32 job_count;
> +};

These 3 structs will be different sizes in 32-bit env vs 64-bit env. Yes 
the driver depends on ARM64, but compat (32-bit userspace with 64-bit 
kernel) is still possible. They should all be padded out to 64-bit 
alignment.  When you do that, you should specify that the padding must 
be zero, and check for that in the driver so that you have the option to 
use the padding in the future.

