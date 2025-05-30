Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84716C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCkkqy4vApGz2Fcr6sUFdDKm308UJD0nqqbHUovYzug=; b=1uaI3EFRdcXAInJuwphkv+Leo2
	nlU24YK5PEOjkNtuQT7bfG2lNcUllrDh9kVpo02Xac3HVutIEf/DXFQOO/fODhcs3daGOOELI8CHY
	QtAushlaZpOCcq3ZTOvLGhK9MpU4A3irtNSGe4kIL5YEdH4FO9PCLofThPEgMAhx48cIbY13OmPIn
	AOzk5G4BoxXjuKDaTZFdYMSMoTTATPfWx3ZuIxN9L6QwyuGpG+OhwQSRlYAwpGnAkWH17iPiTbhum
	vwHAAfoBEGRTygzpF6aTtmuORbm4GpVRgKNaTZx28bgf5BqwP7M4uHv15FDOwzmf/pV1rJw5aHLwj
	+YH2vi7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2xH-00000001Fhl-2lE7;
	Fri, 30 May 2025 16:51:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2fz-00000001C8s-2dv7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:33:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UANCVr008586
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 16:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uCkkqy4vApGz2Fcr6sUFdDKm308UJD0nqqbHUovYzug=; b=dcweAjVDE/LjqPwp
	oTZoLRzOpQtI1JYDCMartltY2c5NB7YMlo/dTDRPndvS7pd9PPQfhgSBch3PEh4H
	oc5W8IPBmxXc8y9f0eJegWB4pykMBiCEZN8j+v7aGdrixd7VyGS2/kjhy0zo0QqA
	XUgfiq0u1OrBVtwV/38j7YZVZ/qTbTyZsx+lQ9ewM1baMS0WsetNFx0znDmQ5qfz
	BRdtzazkc4/gCaP/Gb9+EA695ygVe/1eKNTHi32s/wCYmY4odDJHX8u9qVCsOZJk
	9jXkDDFD0qe9Gq1ZUFCJmTcOm/GSbItFs5zFtondN5eTlNacUbBVYKOzoLNvsXQH
	LTVIag==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992uxd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 16:33:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-745fd5b7b65so1793175b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 09:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622823; x=1749227623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCkkqy4vApGz2Fcr6sUFdDKm308UJD0nqqbHUovYzug=;
        b=i4Ms3nAEtTxDY20zBYNSHXypOdPrup2ItZUNJhptaKMtFjHPztC6ujcE331NPCbRL9
         DyuYzVsPZA8e3VTL+LPfU+ccDY/YhXSLlif8nWdnn4eKj+2syvB+5kpkOcj79Hj2i/Uz
         Bo7NGNsk/TOba5+S79d2QMuWDIdaGO0cCt2D+K+vAkYiwbJnoKqxKc6D2v/WRMnSi0z4
         Z3tEEshHI1gKANkwm8vL3t+KEhT1y40q2E8Tw0WPciuEqhhsXyGfhA4ffczZaKcHBLq1
         tjaBpOCz8BuTO9uWGZPKXYDBrvFIN1HGI+PSTDqqV83mNCVuPiHIczLtqYxprukBk6NW
         awJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvPnKipxb0wAoIfjTrB64jNQzypRoN4QoHn9fGWk/CDMuMQ91+5PhbaNeHCcJX+I478jtAHJSZfGPaanWfxfq/@lists.infradead.org
X-Gm-Message-State: AOJu0YxLigL4qygHzwYGllsRmoERHqzWLTfOg0gGbKjz0On4+Co/hI5s
	DlyU7EjifRviDDHCluFzMHRCDg4X52jGpjrjbjdq/0uC41J5tXdR1G3hp/HSIdADBXsJjSaY/8k
	nlqtbjpCDwujmuRFozvGVbxzonH0UryTXG2rgjIZGVh856UhVtOyq8CmlpkcaZWYGGAjwTgAqrV
	W1lw==
X-Gm-Gg: ASbGncvpbw8gBA130MSBUCbWQORRFD0d4OohFbSmzIusleQC2SvOhAib0vlveRy2lUs
	lWLyQFvMR6T2QYDlm6yzVTzByXg4vh/jYGR1+rxlbo4h5lWHX+0/jVNY6deCLKea6U7rCTVTSO1
	6UJTseUOfkXkROYdruEtWyb/Lh360abqJhj8hz0zqVV1p5Q3yM8EAmMOYgG3zaPw1RwtNG5GLtz
	ir0zPeqoU4ZyqO2JInNKbmY6yKAXRANCJ46ZAF6G4h0a2DR5CBZvVbn21/dVrb3+r1C41QvFgyX
	13xZPIzPxR3X0kZVvv5/fNpLF/9xzaJE9KI77PuXo1z8E3tJiQid+LdPpm7L4q/Nlx1i80io
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-747c1a48890mr3832881b3a.2.1748622822622;
        Fri, 30 May 2025 09:33:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtqNwQxZU0xTr2WITGJuLCEWHrD4jd+DcWqKzqx8uZbn4MTH/bomjNfm/KY2N3fVJbrV50ng==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-747c1a48890mr3832859b3a.2.1748622822240;
        Fri, 30 May 2025 09:33:42 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab820sm3347905b3a.60.2025.05.30.09.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:33:41 -0700 (PDT)
Message-ID: <34a9bf5e-34f1-46ee-bebb-96bca551768c@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:33:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] accel/rocket: Add job submission IOCTL
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
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NyBTYWx0ZWRfX88FlMsrHV2Oj
 Odv90kgVDN9y83xdyA1DLxv6d6O+rFzrqrMKgISWTxWR1hs4FnYAfoyxM6vIZ0asml2ZzMwEoc8
 lF6E33Pq9l5rOPsMuZ2KwRnb67CEeihTE2aWm8csH8ZXw1xU2bWL8w/6LTgHcj7ulPO1YrLlbWm
 4R+PY9Di7HskwGWDrADmwbrD1ZIpiix3CfmEodeRbEjqxQPrk4X6Ec4IWrcqIOKO/YxKkblgE+3
 eg9V8FYYpwIfk8m1Hf4mMzudpdDbnYXshuk4uRjmZn2kSbDA0DsGg4HROK92lVnFBNKVHrOpY0V
 Hd9lHiM6YJFmYSMXp6ynV9EvWtlZ/q+5E3YhrnzBQ0QRWxzQNfld/OdMt8YJSbMQW1gJtj7QU4g
 A7kEsdRDZVKGkj3t+WsmHSE+95FXW9q7G3BpKnYsW6AKtRnjKmKjdOG3/qeugemnYqp3ey0P
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6839ddea cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=YifSY7n-Kb6RBMa0OVQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: RVLjEyR21z39c-OzvHhlp9Nu2fRkXYlG
X-Proofpoint-ORIG-GUID: RVLjEyR21z39c-OzvHhlp9Nu2fRkXYlG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=909 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_093347_675626_A7F6CCB6 
X-CRM114-Status: GOOD (  17.18  )
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

On 5/20/2025 4:27 AM, Tomeu Vizoso wrote:
> -	version = rocket_pc_read(core, VERSION);
> -	version += rocket_pc_read(core, VERSION_NUM) & 0xffff;
> +	version = rocket_pc_readl(core, VERSION);
> +	version += rocket_pc_readl(core, VERSION_NUM) & 0xffff;

This seems weird.  Feels like an eariler patch introduced a "bug" and 
you are fixing it here.  If so, then shouldn't the origional patch be 
updated?

> +static int
> +rocket_copy_tasks(struct drm_device *dev,
> +		  struct drm_file *file_priv,
> +		  struct drm_rocket_job *job,
> +		  struct rocket_job *rjob)
> +{
> +	struct drm_rocket_task *tasks;
> +	int ret = 0;
> +	int i;
> +
> +	rjob->task_count = job->task_count;
> +
> +	if (!rjob->task_count)
> +		return 0;
> +
> +	tasks = kvmalloc_array(rjob->task_count, sizeof(*tasks), GFP_KERNEL);
> +	if (!tasks) {
> +		ret = -ENOMEM;
> +		drm_dbg(dev, "Failed to allocate incoming tasks\n");
> +		goto fail;
> +	}
> +
> +	if (copy_from_user(tasks,
> +			   (void __user *)(uintptr_t)job->tasks,

u64_to_user_ptr() ?

Same thing down in rocket_ioctl_submit_job()



