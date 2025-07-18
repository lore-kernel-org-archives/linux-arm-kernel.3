Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F18DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvQRsE2lG7WyIIQnwV/DeD9T4vuk4piXmEgdbjYc460=; b=jD6jzQ9YP/h96ljfZnOSjVXVKm
	MhFm8m1SG9kjoyJ1kcaUiHWhAiNDLhYIiAhJmDgzabd9LS3q8/vBq3n8NkZLIPPt+S7qyUSkT5KnB
	5oPZ09y4HVlaQ7T5HcEXK+L4PfGnk8E+hbG8FJh04eig6Hx0rOIhJCL4Tyub5XZPGdSfyiVgkwy4j
	65wICcl1HaxcMLTniEAZaCcasfqc9kHHAdX7sEuz7d4QYSfgstS6AYmmAVzh0h5SN+0Q7ag61VZSD
	uL4sGvHtp5BpPD1qxnryW01FVhGbuzN08+MXBV4PGrOqRORQgoxZO/H7Q01cHZX++pe2FHcrjQAHI
	aIytyEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucopy-0000000DDIu-2u8a;
	Fri, 18 Jul 2025 17:25:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucofZ-0000000DCGm-0QML
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 17:14:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8tvJP021699
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 17:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hvQRsE2lG7WyIIQnwV/DeD9T4vuk4piXmEgdbjYc460=; b=G9HONGQ2Qa2uUbLZ
	VJY4Lqvyrv1n/8Lykdjk8ImdB8+wf9SYMMzho7gbPSwHGSDoxrUBE0CiNNwxX9tU
	eiuk2i03SYOOUMR/fzdvSMV4XqbJNDyDuvShdivyYxYc+NZo6O9pnZkJG20id4xH
	+GQ6CivijZWO/Yf86g+q8FR696sTRXmGqNM957Ntrk/wR/1dcjZG442XRPYcu9Dl
	2t6TTIi6n2flM1t9PB5QfE+BihzXzRoIFag/A/QdGofEojZLvcAH6xsAgHzN8Kev
	m3Vck5j3SQIkQddI4fbh5TebcaUGQBnIOFC3p8FE571tDb26sN/rlJWab2c9WjXO
	d5BCRQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8m79y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 17:14:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-311ef4fb5fdso2839580a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 10:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752858887; x=1753463687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvQRsE2lG7WyIIQnwV/DeD9T4vuk4piXmEgdbjYc460=;
        b=B815edIfryAlPHLBRmGn680nIEN1A/miJeFzQwTcAL3Wk5c5AEnEdXTB6C5aa5dJFc
         LXDrIW0OmfcuM6sLHFxpdkgMlukg01KMh4t8FbqTTSM1VnTxq+pHvtMwQclrZ19Ht33k
         GEWb6x7iAuA1mxGqrYqB+yZHpA3mKdxZmpjRD5OIPIcan9TL2I937oQJiHULVOiVamkG
         GGmpVg1FFQkoq7MqgCAKKWjr8zWtXqyRmn1qIXM95tpqeWvXN/mNwl4AdJaPEPqhgNmE
         vPLSzr0rUyAS9CJH/F/OTkcpB/jSPNKv9dtIgIlKgbBU6atDHOjMBY5+7icA6/3VMFmz
         CNgA==
X-Forwarded-Encrypted: i=1; AJvYcCVa7rfPJUsSxspuD39Wjvcuxhq4uLcLD9wI2Dl4aV6fVJ+BWpUmuPj6SOgZGtoqW3qnWoGYzUY8wtpeAAz/qj62@lists.infradead.org
X-Gm-Message-State: AOJu0YyKBTZUfaLiP3pFAL1EzLbaqY33WLVcbBxz8SLSBexzfsE3JVob
	WKmGEaicuiu6m/w9XftjQ3tVh/yP2kfaBnz5qJGJCVruEonXIGZ2wUmW0zeOYNW+rekIPx3n5j9
	TKqIY3oMf8wPAiCUrdqHKC1cijIKspXxGiaAfRvjpynkNvIdO5ME4EjXIoojpMr/E3X+NKQmBr5
	gxAQ==
X-Gm-Gg: ASbGncueAEKzBcoCBPXP9pJTkAZdnV7M2Qtn5u+Y3yjMxB4hZ2lg6hVYmuBFhScobdV
	GEmIIyhLqlppsL5SzS7yq3PxwiRmVwAaEs5FvlTNzAYARZTW6ouunjs8CSc0QZKYQDNJuCc6+wO
	07T8/on1pMKtaCZA+CC1dRkPXN5Fch4biSOq2MxTo/Syb+FmDvruzw2YEUmfoK3Fbnh8Aw0k7rn
	T0cabgonrQUrfGEFvQiG4j4zuXrDBg8b436bt0PXcbY6PCYszsOePKst4AVTud3gP+Tndrv+cI+
	9UUzB0lHT/3IcyG2zmJBt87JbVWfzkwMOQ4uR1anR34PDSd0R+qUukeu9zi4tgPIDubFDzNKeky
	SQiXdw1IbaXfEbA==
X-Received: by 2002:a17:90b:48c8:b0:315:b07a:ac12 with SMTP id 98e67ed59e1d1-31c9e6f71b8mr18347605a91.14.1752858886434;
        Fri, 18 Jul 2025 10:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAZ4uYoT0jpgwok+1LqJLQaSu3L2fEp1diUxE597ewVDpbjd87lEWbuWkSUsEweCpZR2VK2w==
X-Received: by 2002:a17:90b:48c8:b0:315:b07a:ac12 with SMTP id 98e67ed59e1d1-31c9e6f71b8mr18347517a91.14.1752858885895;
        Fri, 18 Jul 2025 10:14:45 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e5b56fsm1593934a91.16.2025.07.18.10.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:14:45 -0700 (PDT)
Message-ID: <7753e1e8-5e2d-4d8b-8a46-a6fbc58a144d@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:14:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/10] accel/rocket: Add a new driver for Rockchip's
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
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Robert Foss <rfoss@kernel.org>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
 <20250713-6-10-rocket-v8-2-64fa3115e910@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250713-6-10-rocket-v8-2-64fa3115e910@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzNiBTYWx0ZWRfXyDa6+hYn7G3M
 bOwMxo3F1x3R89qswYohXg/ozr/MHuCdcmU/Mkq/sAlMxXa+ygMQp8sdbp4pMZylU+YHRqt1DY/
 K94S7Evw2W6qGYDrrPNEatq3pkXroz2G4MtReJx/6cHLP/fHrXJY29xWNrsXyKXQngJuFK+TOZg
 A9XbLGFqtqAasz6p722bT+51cJP2PyqFS9CBsavfzuZyOgmzh9cw6ZxEBW2de/u7fX/FZyqk9dl
 +GdTwvUHngwS5LkkuZiK0emQDkDz6jMGqPdwrps7UAHiXTlFP06FGZUIVym2fByoSaGndne2V5T
 cgPh0YBl5g2VwNFidtJtAyANq2oPpJVIrzj9+yt9prqePOITGBKf1bR9Hp7T48BMcUh218bLmGf
 EGiU9wbmBj0kcyhr98L9wDg+CBqh9z5bbPO7LWHh/7pcubkrm5wFe+UhPgFDsxZjgR0mJs8N
X-Proofpoint-ORIG-GUID: iL1ACA_uitS38DWF6IWS5pqFl04ufBWd
X-Proofpoint-GUID: iL1ACA_uitS38DWF6IWS5pqFl04ufBWd
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687a8107 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=DISFzqtZAAAA:8
 a=EUspDBNiAAAA:8 a=V6djkQ_TFPnTOxwyQKcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_101449_253357_8829FC00 
X-CRM114-Status: GOOD (  19.86  )
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

On 7/13/2025 2:38 AM, Tomeu Vizoso wrote:
> This initial version supports the NPU as shipped in the RK3588 SoC and
> described in the first part of its TRM, in Chapter 36.
> 
> This NPU contains 3 independent cores that the driver can submit jobs
> to.
> 
> This commit adds just hardware initialization and power management.
> 
> v2:
> - Split cores and IOMMUs as independent devices (Sebastian Reichel)
> - Add some documentation (Jeffrey Hugo)
> - Be more explicit in the Kconfig documentation (Jeffrey Hugo)
> - Remove resets, as these haven't been found useful so far (Zenghui Yu)
> - Repack structs (Jeffrey Hugo)
> - Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
> - Use devm_drm_dev_alloc (Jeffrey Hugo)
> - Use probe log helper (Jeffrey Hugo)
> - Introduce UABI header in a later patch (Jeffrey Hugo)
> 
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>    Frattaroli)
> - Move registers header to its own commit (Thomas Zimmermann)
> - Misc. cleanups (Thomas Zimmermann and Jeff Hugo)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - PM improvements (Nicolas Frattaroli)
> 
> v4:
> - Use bulk clk API (Krzysztof Kozlowski)
> 
> v6:
> - Remove mention to NVDLA, as the hardware is only incidentally related
>    (Kever Yang)
> - Use calloc instead of GFP_ZERO (Jeff Hugo)
> - Explicitly include linux/container_of.h (Jeff Hugo)
> - pclk and npu clocks are now needed by all cores (Rob Herring)
> 
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>    Stone and Robin Murphy)
> 
> v8:
> - Kconfig: fix depends to be more explicit about Rockchip, and remove
>    superfluous selects (Robin Murphy)
> - Use reset lines to reset the cores (Robin Murphy)
> - Reference count the module
> - Set dma_set_max_seg_size
> - Correctly acquire a reference to the IOMMU (Robin Murphy)
> - Remove notion of top core (Robin Murphy)
> 
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

