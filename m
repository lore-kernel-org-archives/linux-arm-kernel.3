Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85D2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 17:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fv+mEh4f0MhcLN21Yyg9tehverC4r+K2gbgLijocXdM=; b=hHBmcR47SxxeL1Lnp4WeZfbIWh
	nHlIAxb+0dn9dTKlvZkwS+gNU78WUSi+3Itu59C84DwMLWJ9C40QobfDcZwWhhT1xTOvY3AEqLSsV
	AwPlCrFLoax/Be/HlBalbc0gUqRA+mO8Ez2OiKaPerCTwMBU0yEJt8lfMeobQXW8hyFbssic3Pc+S
	zkU66enVnbT4t7a1+esYOCdRQDFQ1VZ83rVpk2rOS7oOO7yg92vZllzyROJ+Z6XkkIPrQSLbZz/ia
	cyf2wgomOUZ5EnemQo+6EzOz98i0POh0qC+m1hSAu4pixGq+0eN4L0U0MqTfKdLNxUA7DOmtYtuje
	lKNRPnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucoxK-0000000DEaS-0N6G;
	Fri, 18 Jul 2025 17:33:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucorD-0000000DDlC-1xXQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 17:26:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IEK9RZ022220
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 17:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fv+mEh4f0MhcLN21Yyg9tehverC4r+K2gbgLijocXdM=; b=WkhBU3LMpFoMdlPM
	vAqhiFUJdo1Zy9EYgRDMvp+udPTuHcKx9lPDzeI2ZXq/5cm7elI1QDI9LLxeG7gS
	hM6o9dZC2AWKDDE9ER2UAtPb/2eWJ6s7I3lTT8VDrIQ8Lz+8/oZgNsOnR6tkiv3M
	94c+I8oV1nqbS5IF9e9qGIAskI1hdNYx8UqAIqikMGRgjMivqEVAGMXOOwgcHFDw
	86IzJ625OAki5wWOvc3cxljvy5wf4/Gn9QN7kvCjiE5iYaW7iZNCxeJgbNqMtIKR
	jnNnOF8dKB9rBjiPu7wk4qG9V5hUF7oHJKiK64hHUIbeNs/4uKN/X6SZ8025kYzP
	0hTlwg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsycefj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 17:26:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748e1e474f8so3290321b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 10:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752859610; x=1753464410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fv+mEh4f0MhcLN21Yyg9tehverC4r+K2gbgLijocXdM=;
        b=dsDR4meNFiXXEC/IOWafDUds4r3BCwfYw0fEPF4x9SEtEw+Ak7S763Dmjv60eZqzhF
         7Vw5m1s/aCCbKNxMtJIiTVD17Cb7WSUhViHS9yR7Mc4ukTKP32Lc6X6dfSG8MDS9bhcH
         4ms8gEh0exgZvi2aeKxlOfUfOD2MGf8ox604kjN1EUeVDhokhYyzu/V4jzabOTK3KEqX
         ve0HcAUGpkHLRRVe57p7rDybkQ3xLUs1Jr08mh2TSnC4LaDdpRsTpEe6IXKrVUfx79H9
         o46Y4GLInENIR8gLFRzy0s0oaTWum60szge7BkGHV8SplwD6W7MvEXrww7yaDLpvZGBu
         QrrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFBNUKev9XqzrG3gyXPR9NVpS8rDpqkxlK9JFeQPJH54ERq6066coiaHUWrEneEqqYKpfCCREb0/BTOhunRRE5@lists.infradead.org
X-Gm-Message-State: AOJu0YzZI3ZRjbuHInw7UXBgC1G5zLJPkg+oy8NDDxBCzUmeZ1VQDmtF
	Z1NTlas7uFY+wOKq0rQBqYgWJ4POzWul13dRaYi2Qq4ctmruzXLHvMcWfGtgmgpR5SgY0Hnn9wY
	wxZwuopcubTrRFDT2P1Ik15LHq6g5GRyRo88kT00W7QQ3953Fb6xRD8CvVXf2hMhJgwYoRcuHUD
	4Ijw==
X-Gm-Gg: ASbGncsd29qcmpT/a0+Khra8fj2/mDrpIJ3OpCbXmV/34kYDpczIefdQDrBdOo6RM2R
	D6oZbAqOvtEnFK2gU4oy28fLhTS5eNmBaITZ7VGlPkGcdUvOrCPDXAGKS47ei/D852Eb+w3Hxrf
	oaCavzNhhrTV7gND3ayJlM7LBI5QjdfZnEejVddsJUuKAz+bQ9KVotGOb7k8cOzxl+iLKyxBFOr
	fvMpmnRaIrkE17b3sgg1LOIKSBF5jXpAk0bNmjclnbxEvSuKWdpuePqzkGAh82y+8tLaiukgcQ7
	J6OdqosX2fzpMgLcD8c5Rl4fISIzM0bw9opvCoJirg3Ux052NRRJhMlJjPRd7nJhJl9BpST9x2X
	+5w0+UuLbLx2Geg==
X-Received: by 2002:a05:6a00:3392:b0:740:9e87:9625 with SMTP id d2e1a72fcca58-7572267d1f8mr16458227b3a.4.1752859609784;
        Fri, 18 Jul 2025 10:26:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqQ9S63kSJn6y6OyUDc3uTWz9C+4cH8naBY6AZisiTbM1Dmrh1Aqbj7AEM/eK1YFdABEhA9g==
X-Received: by 2002:a05:6a00:3392:b0:740:9e87:9625 with SMTP id d2e1a72fcca58-7572267d1f8mr16458162b3a.4.1752859609159;
        Fri, 18 Jul 2025 10:26:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbd67ed2sm1530796b3a.135.2025.07.18.10.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:26:48 -0700 (PDT)
Message-ID: <cd36e463-2499-4e3f-8a02-60ea43de83dd@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:26:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/10] accel/rocket: Add job submission IOCTL
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
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
 <20250713-6-10-rocket-v8-4-64fa3115e910@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250713-6-10-rocket-v8-4-64fa3115e910@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOCBTYWx0ZWRfXyZnTL9BvJIP2
 PF56ONoAqbVvo/FGRvJNCCm36wyQEDY4vbfU/DZN35IDptJ9delmW1kU91PWkutl2O/N5hiYrbd
 jB17amCvT6wRz5JEXB6N/8TnzX4k7dZnWqq5rw65teMvnqO01Tr80ArWRu1JRrxVPRn5p5fscau
 NRu98iNBOUKLwrsJn5KXiyk+FXSu/qGrI03it1Dpyg0i5YHOnmdpl/CXCSm5ZedLhiwInM76aFp
 yUpyCbU9ow0r/YgUQZIhZLnNF2rrB/DGLiVfCECZFFERs5tBm7AkaXZal3HVq1F0EuXIJewrLcW
 Oc5u8i0LIHsI7bgF6l8fs8KolnmLuia0AhNyPp/IaGKyjFZIVQxV/+LC3MG86VQiELcFE6Q4YBO
 cMmgxDBg3pXoxvHTItwrugbxRpui5hMFH1A5UVxfFy2Y2gx8vxRjZ7gMYhQOWOaSGBCWjcqk
X-Proofpoint-GUID: ZvTBa5tdDb3tjMX0UgHhWxx24RSKXOIR
X-Proofpoint-ORIG-GUID: ZvTBa5tdDb3tjMX0UgHhWxx24RSKXOIR
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a83da cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=DISFzqtZAAAA:8 a=EUspDBNiAAAA:8
 a=OV0_J1LtQ3fB1FIpcGAA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_102651_517278_4F941302 
X-CRM114-Status: GOOD (  23.46  )
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
> Using the DRM GPU scheduler infrastructure, with a scheduler for each
> core.
> 
> Userspace can decide for a series of tasks to be executed sequentially
> in the same core, so SRAM locality can be taken advantage of.
> 
> The job submission code was initially based on Panfrost.
> 
> v2:
> - Remove hardcoded number of cores
> - Misc. style fixes (Jeffrey Hugo)
> - Repack IOCTL struct (Jeffrey Hugo)
> 
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>    Frattaroli)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - Use drm_* logging functions (Thomas Zimmermann)
> - Rename reg i/o macros (Thomas Zimmermann)
> - Add padding to ioctls and check for zero (Jeff Hugo)
> - Improve error handling (Nicolas Frattaroli)
> 
> v6:
> - Use mutexes guard (Markus Elfring)
> - Use u64_to_user_ptr (Jeff Hugo)
> - Drop rocket_fence (Rob Herring)
> 
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>    Stone and Robin Murphy)
> 
> v8:
> - Use reset lines to reset the cores (Robin Murphy)
> - Use the macros to compute the values for the bitfields (Robin Murphy)
> - More descriptive name for the IRQ (Robin Murphy)
> - Simplify job interrupt handing (Robin Murphy)
> - Correctly acquire a reference to the IOMMU (Robin Murphy)
> - Specify the size of the embedded structs in the IOCTLs for future
>    extensibility (Rob Herring)
> - Expose only 32 bits for the address of the regcmd BO (Robin Murphy)
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

One optional nit below -

> +/**
> + * struct drm_rocket_submit - ioctl argument for submitting commands to the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency order.
> + */
> +struct drm_rocket_submit {
> +	/** Input: Pointer to an array of struct drm_rocket_job. */
> +	__u64 jobs;
> +
> +	/** Input: Number of jobs passed in. */
> +	__u32 job_count;
> +
> +	/** Input: Size in bytes of the structs in the @jobs field. */
> +	__u32 job_struct_size;
> +
> +	/** Reserved, must be zero. */
> +	__u64 reserved;

It does not appear that this field is needed for padding, and I don't 
see the rest of the series using this. This could be dropped, although 
maybe you have a use for it in the near future?

