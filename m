Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E2CC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIrtVHNQp2y7Zse3vzNGVDYfeRg/j/EJRvoTEwsCgjo=; b=bt+Y5PckWtsh0+Mc4tvoCt+1ly
	H+FSIOo5ZjcsC7e9/ZAzqw4SHqLA63t7AD80e7g1/WsXIzK4xLiPaCa9OTXF8ZwGBJNuJWwZeCxKz
	vKSVqXIgVeAxHO7DW5k9A9azgGRQzXDvENoyxtdoSF7qIChG3AhGgCfWRq8PtPDmZjIMCXq98pYLv
	bmAv7AInFSuDKnZiPWp79/MWYz2Yw3fsjFeLjS0tWy8s0Xc04BXIhV38jkhjyCepdwABUM6srqizo
	hdnBvPnLDtWFsuNXwXEKWOofcaNpIKpQFR4yhJVwNVzlre2cOaryW4CcxYsa1UazqDClDeez8dZpz
	sLB9hqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxm1-00000004pvc-1h1E;
	Tue, 24 Jun 2025 07:08:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxYN-00000004oOu-1Xxi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 06:54:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NIN2wu031794
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIrtVHNQp2y7Zse3vzNGVDYfeRg/j/EJRvoTEwsCgjo=; b=d+VH9ff26SfHRQMG
	uq6FbSoqgS5UZ6zmmRu8ogqtvVnV4Xm6mNtnJrgMc88NiP3H7NtxIb0g6R/SZleH
	/fJZiaGPg65ww+K5/m4YJ1WHw/J6KTefJT4r+h2nPti18qTbqiTSfANw1CjYqoi4
	rPnRmc4M3w5yiIzcWJgd0ET0FH59T4ZOLnmwWAc3asAQoHlrpGE3Yxr8RE7/2zI0
	sqfqLcnPTAUmrSoYi2JF+N9BYfEf1UfDDAZoq4HkpvhQrDlHTdxw1PylDeW5aagd
	uCO6NwJjvVHtNaPfJyxLoWnW03QyHKX6xd/xxX3U25rx+MGcgVnQzoh7e9dzfEJl
	Oy0ghA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec265ba2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:54:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31bc3128fcso6503735a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 23:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750748085; x=1751352885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIrtVHNQp2y7Zse3vzNGVDYfeRg/j/EJRvoTEwsCgjo=;
        b=Asv6H8rD4Pwzwrs2EfbYzh/L+hQznlXbb44iZ/dAsyvIuqg+/fiqU8TUEEzcFE5H3E
         TSi1X9+jGo6FYzae+y3mT+PuR7aT+HbVRyBxEVDdPMgvbElM1UrtIEGBMcrlu0FnOLBW
         qBU7b5gMjOBeY15a95smGpG6JNP7ZTQ7e0am6VzBNGsQ7TCo04wEMCMcijFqTxXFLtTV
         DG8FI6nvtzb2ScGqyn3xzQUbNLHCm4DBmGvwJfhhv9XaVwxAAHB3Q/tFu9DOpS8aitRd
         D+TbRkKR6FqmkdvA86QDausUuPo8426So2ZsQiFub64TKE4AYW08gVQpxSIvPET1l1Rc
         vZUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN/pczUpxnqvvSRDyAmD7f9EtemlNU43HD4xoPasCyotckVQN987R/ph1fm0C7v23Lf4WXqVU03Wn8DuBxXNXt@lists.infradead.org
X-Gm-Message-State: AOJu0Yznmu0t/7jokYcG2zY30lzVIgi/3HoVA5rfbWUfiTDks8XKjTc3
	obNHNtMlfgD4rhlxdZ+rhWI1pa+c4WQUa19hD4zpbm7U7m285UlDy5pK4AClCW63uFflGqPdX1G
	5VKCQXupiBEpj2s9YjGdrwkTxd2DGZpnZ0zXjemggQhR3M1FVkVlHY1LxAFDM4N36Cs/rOjiVWN
	rnWTBDs15a
X-Gm-Gg: ASbGncvBgm/MHm3tXbZwwFUo53syBWD2gVCmFNBmcTY9LKnXjhjC6hNOyZ4wSwk0o//
	BKsF7iEvetCT8dWdSNe6WAUMZKPXnEQNIdC0WQAYTz4wcy5CVIO2XDQGbnIUfyMVDWZXhWAR9ga
	e/ba4RALcSRbJQC9sfDi+2vBk6n+AVEs9vbCo4QTypKwGZK1kRVjsTMzWmbH33Xh+JIHhYLG61h
	dWdakc3CuORZCins/W4tGZ3911ceJA1cAF4YPbYaKMzL1QSHmRALLOMRHzI05Gk+2s/nXUGAh7X
	wwkGzjxY3Tz4CAPPOvZllWdkAR7K+oJunMHMGOzEDm20hMgDxCpRXHKD9nrGXZjTNxAt0En7eJv
	8ZchZ63GVJRt3sP63sBI6
X-Received: by 2002:a17:903:22cb:b0:234:df51:d16c with SMTP id d9443c01a7336-237d9badd36mr242209485ad.45.1750748084409;
        Mon, 23 Jun 2025 23:54:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExUm37dtay0q0velYcFv3DxtYUDTccTngr+8MncRLErFXqkPNRqyeek5noM/HvJdeGJNIpTg==
X-Received: by 2002:a17:903:22cb:b0:234:df51:d16c with SMTP id d9443c01a7336-237d9badd36mr242208865ad.45.1750748083825;
        Mon, 23 Jun 2025 23:54:43 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86103e5sm98486035ad.120.2025.06.23.23.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 23:54:43 -0700 (PDT)
Message-ID: <2d93ee96-0c36-4651-b6ad-9fddd0f6ad88@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 16:54:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/9] optee: support protected memory allocation
To: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
        linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        "T . J . Mercier" <tjmercier@google.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
        Daniel Stone <daniel@fooishbar.org>,
        Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-8-jens.wiklander@linaro.org>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20250610131600.2972232-8-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1NyBTYWx0ZWRfXxlsi4eSX+wfw
 KnwdpXweUgSGkBYr4C7RYSTkyOgv0cPr/ZZtokCy1UA1yWt4VQXHAms8QGPBM4tjfDjXAeDsYcn
 p7gpA25BHDoW9uMkFSIDQ25R3IjgsBAqjVn0lxAfSqqqlkCE2SUtkRIHACE5u9N1sR1RIccamaT
 7c9xZ+GFndr7A67L8ZPIaPvr4AutjpkV7Hk/3SOUoMhXZ+vRKFh2LeH6g+O1eajkAn1MZA18m1U
 QBcbtAkpgBqREfehiry3qMCAvoGtDxi1yV/jvVYgBNr97dJbMrrnRCnBQFzUMWED4HEL2mMFO3R
 cIXJuSlcabh6eg7i91Jz+2+oqL9NwAlUs9OdTAR//Odtpyq6fFwwdQ06iduqR7iruB979GEF3qA
 gKq2qG41Xl8+B7LF6I4fC9L0W/BWHUq8fjzYXkd+5yG0ySIA5Vt5xTdUSWiuuHMKWKgsLdKA
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685a4bb5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=99H9UyJNq6-z9PcZsEwA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: D9VZziW8crXks2PyGsyImOL00LeB_-8X
X-Proofpoint-ORIG-GUID: D9VZziW8crXks2PyGsyImOL00LeB_-8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_235447_421238_1A12CFD2 
X-CRM114-Status: GOOD (  33.94  )
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

Hi Jens,

On 6/10/2025 11:13 PM, Jens Wiklander wrote:
> Add support in the OP-TEE backend driver for protected memory
> allocation. The support is limited to only the SMC ABI and for secure
> video buffers.
> 
> OP-TEE is probed for the range of protected physical memory and a
> memory pool allocator is initialized if OP-TEE have support for such
> memory.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/Kconfig         |  5 +++
>  drivers/tee/optee/core.c          | 10 +++++
>  drivers/tee/optee/optee_private.h |  2 +
>  drivers/tee/optee/smc_abi.c       | 70 ++++++++++++++++++++++++++++++-
>  4 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
> index 7bb7990d0b07..50d2051f7f20 100644
> --- a/drivers/tee/optee/Kconfig
> +++ b/drivers/tee/optee/Kconfig
> @@ -25,3 +25,8 @@ config OPTEE_INSECURE_LOAD_IMAGE
>  
>  	  Additional documentation on kernel security risks are at
>  	  Documentation/tee/op-tee.rst.
> +
> +config OPTEE_STATIC_PROTMEM_POOL
> +	bool
> +	depends on HAS_IOMEM && TEE_DMABUF_HEAPS
> +	default y
> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index c75fddc83576..4b14a7ac56f9 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -56,6 +56,15 @@ int optee_rpmb_intf_rdev(struct notifier_block *intf, unsigned long action,
>  	return 0;
>  }
>  
> +int optee_set_dma_mask(struct optee *optee, u_int pa_width)
> +{
> +	u64 mask = DMA_BIT_MASK(min(64, pa_width));
> +

nit: Why not dma_coerce_mask_and_coherent() instead of bellow?

- Amir

> +	optee->teedev->dev.dma_mask = &optee->teedev->dev.coherent_dma_mask;
> +
> +	return dma_set_mask_and_coherent(&optee->teedev->dev, mask);
> +}
> +
>  static void optee_bus_scan(struct work_struct *work)
>  {
>  	WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
> @@ -181,6 +190,7 @@ void optee_remove_common(struct optee *optee)
>  	tee_device_unregister(optee->supp_teedev);
>  	tee_device_unregister(optee->teedev);
>  
> +	tee_device_unregister_all_dma_heaps(optee->teedev);
>  	tee_shm_pool_free(optee->pool);
>  	optee_supp_uninit(&optee->supp);
>  	mutex_destroy(&optee->call_queue.mutex);
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index dc0f355ef72a..5e3c34802121 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -272,6 +272,8 @@ struct optee_call_ctx {
>  
>  extern struct blocking_notifier_head optee_rpmb_intf_added;
>  
> +int optee_set_dma_mask(struct optee *optee, u_int pa_width);
> +
>  int optee_notif_init(struct optee *optee, u_int max_key);
>  void optee_notif_uninit(struct optee *optee);
>  int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index f0c3ac1103bb..cf106d15e64e 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1584,6 +1584,68 @@ static inline int optee_load_fw(struct platform_device *pdev,
>  }
>  #endif
>  
> +static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
> +{
> +#if IS_ENABLED(CONFIG_OPTEE_STATIC_PROTMEM_POOL)
> +	union {
> +		struct arm_smccc_res smccc;
> +		struct optee_smc_get_protmem_config_result result;
> +	} res;
> +	struct tee_protmem_pool *pool;
> +	void *p;
> +	int rc;
> +
> +	optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
> +			     0, 0, 0, &res.smccc);
> +	if (res.result.status != OPTEE_SMC_RETURN_OK)
> +		return ERR_PTR(-EINVAL);
> +
> +	rc = optee_set_dma_mask(optee, res.result.pa_width);
> +	if (rc)
> +		return ERR_PTR(rc);
> +
> +	/*
> +	 * Map the memory as uncached to make sure the kernel can work with
> +	 * __pfn_to_page() and friends since that's needed when passing the
> +	 * protected DMA-buf to a device. The memory should otherwise not
> +	 * be touched by the kernel since it's likely to cause an external
> +	 * abort due to the protection status.
> +	 */
> +	p = devm_memremap(&optee->teedev->dev, res.result.start,
> +			  res.result.size, MEMREMAP_WC);
> +	if (IS_ERR(p))
> +		return p;
> +
> +	pool = tee_protmem_static_pool_alloc(res.result.start, res.result.size);
> +	if (IS_ERR(pool))
> +		devm_memunmap(&optee->teedev->dev, p);
> +
> +	return pool;
> +#else
> +	return ERR_PTR(-EINVAL);
> +#endif
> +}
> +
> +static int optee_protmem_pool_init(struct optee *optee)
> +{
> +	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> +	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
> +	int rc;
> +
> +	if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
> +		return 0;
> +
> +	pool = static_protmem_pool_init(optee);
> +	if (IS_ERR(pool))
> +		return PTR_ERR(pool);
> +
> +	rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
> +	if (rc)
> +		pool->ops->destroy_pool(pool);
> +
> +	return rc;
> +}
> +
>  static int optee_probe(struct platform_device *pdev)
>  {
>  	optee_invoke_fn *invoke_fn;
> @@ -1679,7 +1741,7 @@ static int optee_probe(struct platform_device *pdev)
>  	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
>  	if (!optee) {
>  		rc = -ENOMEM;
> -		goto err_free_pool;
> +		goto err_free_shm_pool;
>  	}
>  
>  	optee->ops = &optee_ops;
> @@ -1752,6 +1814,9 @@ static int optee_probe(struct platform_device *pdev)
>  		pr_info("Asynchronous notifications enabled\n");
>  	}
>  
> +	if (optee_protmem_pool_init(optee))
> +		pr_info("Protected memory service not available\n");
> +
>  	/*
>  	 * Ensure that there are no pre-existing shm objects before enabling
>  	 * the shm cache so that there's no chance of receiving an invalid
> @@ -1787,6 +1852,7 @@ static int optee_probe(struct platform_device *pdev)
>  		optee_disable_shm_cache(optee);
>  	optee_smc_notif_uninit_irq(optee);
>  	optee_unregister_devices();
> +	tee_device_unregister_all_dma_heaps(optee->teedev);
>  err_notif_uninit:
>  	optee_notif_uninit(optee);
>  err_close_ctx:
> @@ -1803,7 +1869,7 @@ static int optee_probe(struct platform_device *pdev)
>  	tee_device_unregister(optee->teedev);
>  err_free_optee:
>  	kfree(optee);
> -err_free_pool:
> +err_free_shm_pool:
>  	tee_shm_pool_free(pool);
>  	if (memremaped_shm)
>  		memunmap(memremaped_shm);


