Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161DCC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqTzkJ+m0M+WwOs1Ufc/BTxcDL+AaLfZVAxh4o4YAwY=; b=bB7dRHCS0XMwAf/pjix+Aan4Te
	0S3jrSCPq6GNWbns5A7s0U1tyEEgAP2xBraNQjG+XP5NAWYyoR8b/mmJ6ugfifLzzW4lZdFOyVyay
	SMU6UEkamsnor4q64aA8qz0E4SptvV4ML+d2gRz1HgXIOO+8Ic+Sv0ohz9uidrpy9dmv90w3b/pHF
	Xd8Y/5sL8UX3SlEsWspu8JSv8wcLSo5c2AWIiURfSC9b61MhjhBQ4B0luZW+rj6FZHWYcmjgOySfa
	xyl4mOWQL+QF4Z6G4hV+o8bxPnge9I676yHphqXy8xq5JAppc4mdrqftb/jpMrbh5GTHJC11opqTD
	OkiEPqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2kZ-00000001CkA-3EFj;
	Fri, 30 May 2025 16:38:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2TV-000000019K8-0Q9r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:20:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBagQN008286
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 16:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqTzkJ+m0M+WwOs1Ufc/BTxcDL+AaLfZVAxh4o4YAwY=; b=mNjXMMHHA9/IsnPJ
	bLB6OGDnRHH6TsGyzMA9Y6YkKzuXxYzxYKwYBQX+y+WDSDMLnUbl3xlPyN9RKEFU
	VR3/076P8sMLc4qnBFFmc4zhLDyfAcT7Lbljewd8Rk48yxywVfXPLzNIH2pSUDeV
	FpSbfvepy+aBXNj6PUFKHihnQ8dK3XhbEU6CuA1z0EsuVpqK7yNpuQ4kySb2CHsp
	VDzwbNirXwHGIaLJfPCVsmK4kjj2HUigxBXP08htjUMTjgmKTfbGe5A9aAilBuOV
	Bc70kDQml7vGlIt3HFedEAWQGOLVSgL82pvT9rhxMt5NwjuYCgdvp5QjQ+fvWGFd
	tM5RYA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whufa5n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 16:20:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742c7227d7dso1758786b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 09:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622051; x=1749226851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqTzkJ+m0M+WwOs1Ufc/BTxcDL+AaLfZVAxh4o4YAwY=;
        b=njJSSicMuWL6YBDQDu/0Z+k/Dr4/DAaipEzjN15I9pwHbg+2ObrAWi8kHk6+FRIXW/
         VSpZy78/KFuzyFEVupjw1yUDQeb3gWDl2qAB6yM+1LGuDxrxQRha5s9h2NP9C2XvnOsR
         6aThIGC4m53NC8WWhpQYPAbY2s6hxRcTjjDeQA9KVJq61JYxjr25XqaiCmXuI6anZYPs
         f4kOSChihiMU/xZNoqtR5ISIB+FGfK09UgpBo2cYGcNIKZRPprgizDdeFjcCf70v7bDl
         X4uB8II/f+XctSJOuR51h5R5ardz49rDaoDvbQ4weriab2cfb0s+b/7CjglB5NNJ7On/
         qEyg==
X-Forwarded-Encrypted: i=1; AJvYcCV43T/Y4v6CIB129P+1rLV6i/xa6deO7gHqcxv8kIapXm0yo4Rd6H/PivkOpKVSi45exh5As4nM8tfgKH0yjFSm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4e+LQVh/oKkxBg+p2EK5HRyZ39or/+aU4SliHQQOQtssyQQLS
	cntDOvV0b8NWfmJFlF+zNgPyDTRbTMiy+cXZWA4B+pQ2XUO5HmryT60hVg2QX8OKxvlgAjWN1fg
	i3zvWjOMLGR92bjTw2zWpSGyl3HIWpR2YNE9S4AhZz28iHIyLxobGdMSlcs1EvE/KeSeyGlju2U
	8Gag==
X-Gm-Gg: ASbGnctr2F4/SX3ycLc5BQ0MKRlqPPPSbtK1v/46LIXQ5SR67eBHqbbuCn34K9dxf5e
	2Ss9XLIEVU76a3WaGcKDLwNLlLeTbNgX6B5xc97tmyZGx/ZrM1oz88hevl1l/Hp1HTk5DLDPpEU
	zKNgkU4mckPWGpkji38dVSGUgPvRhJ2jaujikG31hh2C4+hpamtcCQ+5pA+RrmokgvrPieRfkOi
	W8li9v4+HgcWg9Y4GSijJpS2OvHjg9D56WCKzEcOQtf240XLHup3moEf5lmjAgf58uCFUrbTdYI
	+MBSnV0llRDQZz1obTba/UNyCB+Exrs57WfBpuRhqXm/xzL0mkm5POL+FJNLosdFqogdy1Ob
X-Received: by 2002:a05:6a00:7491:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-747c1c83852mr2995549b3a.23.1748622050766;
        Fri, 30 May 2025 09:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3KvuYJT4qbQ5u5CbTu0XT/yKXicfsd+dn08wq+4nYHqmMZGv9KAdolvB8TbaAHA/+TUu3/A==
X-Received: by 2002:a05:6a00:7491:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-747c1c83852mr2995515b3a.23.1748622050335;
        Fri, 30 May 2025 09:20:50 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd2c86sm3325986b3a.144.2025.05.30.09.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:20:49 -0700 (PDT)
Message-ID: <463162bb-5e2d-4768-8811-ede7b2063c85@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:20:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] accel/rocket: Add a new driver for Rockchip's
 NPU
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
 <20250520-6-10-rocket-v5-5-18c9ca0fcb3c@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250520-6-10-rocket-v5-5-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6839dae3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=DISFzqtZAAAA:8 a=HlDAqVJfg7-00m_e3XEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-ORIG-GUID: D-eCjGyR8qzLS1eY4DRxQr7jXyhHvNMK
X-Proofpoint-GUID: D-eCjGyR8qzLS1eY4DRxQr7jXyhHvNMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NCBTYWx0ZWRfX4CzHXNFcDWhw
 0PBspUgpEM4Rm2rLfJck4EVzNT0kcKi9JgSi9SPUa0ToYL8ISm7IffS3hkguclcCaVf3cUQXBmI
 x9VP2C2Dj0chgqsAugosmaaKJn0mumq7ArI/2GKOmpfdN3Naq34unsBRcrIFlQtlBGP7SwShoaV
 xSLJBev81tGysEn5LKOv504EfTjCH/lW3y83RhSkrw99kSjA9ABIBCChKb9cXTbkaMADoVlhv9R
 d999JL/RNq/VVr4BX4iIPuYD4V3v8Y7gKSKtGJ1jVbljUId1X/NNE86pH/Pms3F+MwsGLfj8ONC
 1NTSGaqLdpTrOcIvaXIheOdzy7jU/16FJV/L0AOu/7eswkeNqDzBBXpxjqLwCIqCPCmXDOHOJWK
 hV/dcJzLffOEIPe0L0yDxesvS8+JmG4dxhZZ/1DUkvWCTdXGK5WHj+eAfN8EZTj64FuvL0Sd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=982 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_092053_166720_2115CAFD 
X-CRM114-Status: GOOD (  18.41  )
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

On 5/20/2025 4:26 AM, Tomeu Vizoso wrote:
> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..55f4da252cfbd1f102c56e5009472deff59aaaec
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_device.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#ifndef __ROCKET_DEVICE_H__
> +#define __ROCKET_DEVICE_H__
> +
> +#include <drm/drm_device.h>
> +#include <linux/clk.h>
> +
> +#include "rocket_core.h"
> +
> +struct rocket_device {
> +	struct drm_device ddev;
> +
> +	struct clk_bulk_data clks[2];
> +
> +	struct rocket_core *cores;
> +	unsigned int num_cores;
> +};
> +
> +int rocket_device_init(struct rocket_device *rdev);
> +void rocket_device_fini(struct rocket_device *rdev);
> +
> +#define to_rocket_device(drm_dev) \
> +	((struct rocket_device *)container_of(drm_dev, struct rocket_device, ddev))

Include container_of.h?

> +static int rocket_drm_bind(struct device *dev)
> +{
> +	struct device_node *core_node;
> +	struct rocket_device *rdev;
> +	struct drm_device *ddev;
> +	unsigned int num_cores = 1;
> +	int err;
> +
> +	rdev = devm_drm_dev_alloc(dev, &rocket_drm_driver, struct rocket_device, ddev);
> +	if (IS_ERR(rdev))
> +		return PTR_ERR(rdev);
> +
> +	ddev = &rdev->ddev;
> +	dev_set_drvdata(dev, rdev);
> +
> +	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
> +		if (of_device_is_available(core_node))
> +			num_cores++;
> +
> +	rdev->cores = devm_kmalloc_array(dev, num_cores, sizeof(*rdev->cores),
> +					 GFP_KERNEL | __GFP_ZERO);

devm_kcalloc will handle the ZERO flag for you.



