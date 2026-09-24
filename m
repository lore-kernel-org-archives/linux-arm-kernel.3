Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3238FC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32xAgp0iORpg4Acec/AzJvfVNP09X3eJZq2Lg8ig1hM=; b=30WJ1stiCOokszCch777+uB/UP
	3G2PJ6CV0L+VvV496EnoYe+bF3AiH7OtSM28kW4Z1dqVW7oz9ATDtz/EitWoFmkjliCrNDMMo/ekL
	/1UbApkSUBK+Z83Yxx6NhD27KD/zFxEoA2FWpuUfgF6e6s51No//BKhAJ2ZIiZ3VkXTzbgbx+y2ZU
	9VR2EMjLhiz3QkwOzYSAEHRC6EotbpqV5SzpTKH3yP/37AbjwVzn6DrkbG30zpXJKRbwsopW057DK
	QU2PtLnFkk2JfgoKvv0EwJWwlaJZ+0ZLzFiwinMkGq23MqJsVL6iyKTMw1CSdk+ZepebMDGM9jMvV
	qAfA1fGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mqz-0000000BgGn-3C2V;
	Thu, 24 Sep 2026 17:03:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mqx-0000000BgGK-1o2L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:03:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeYvk2469676
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 17:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32xAgp0iORpg4Acec/AzJvfVNP09X3eJZq2Lg8ig1hM=; b=A+HnZ1plxeuKDVQG
	N15/ZpJVehZ4hzwOaRrr9lHfc1q466qhpy3LxhnXgsF+P5nCduqUZ8Nxw9shRQHE
	X26I3PaNjOMXaQoDKLWk1j6mu9REbH9Z+Jna34491FRdhLqYKqFirVfaClrmVox0
	1CkbwVdeju8Mrxiw53vjPejXVebAzxwIf5L9KgoCHAtpb2rH/xVoW8g5IQHiavPA
	ChyTj9GCdYCeu7hHsbl6MZ0ESyqjqmbcVmAiLVCYQXx2tu6/j6FZnsOrCEdj4UKD
	i0edVhJUmMy2xx2amxOLlA2+nhZtPRsUuTGoCRctQqyAh8O/gRZAT95+zpGOvMiK
	qraX/g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8rnrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 17:03:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so90426a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790269401; x=1790874201; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=32xAgp0iORpg4Acec/AzJvfVNP09X3eJZq2Lg8ig1hM=;
        b=OzmeK1m8po8RnLRhTBMcGNoITYknENmuyBWUFuzgqe9OqGL0l1tTjgQA054wygGWQv
         i+tsEFJCaLOhqHMtjsglXzU7VPqhij7k82jWmOEB28yzEY5gawai8xUBJ6J8XdG/EfpA
         4KBVRpWdIKU5UwDdmpY+NVac4Unos3yqKUP0fxJWu7RNaj2WynqKzZ8VOjPgQsgqzTuz
         qdE4witSuKgHdRiE5DKpsL1DgV28ynK05lyHQwR3milUhgrzma4GbDKZDLFAgfxTkLm0
         UV/szHAgD/l9hNbYXf4n3dFtfZE4O4Yzi/DG2YAmoqbAJ9Ok8vGcJoPivKJCZzecgxX9
         iscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269401; x=1790874201;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32xAgp0iORpg4Acec/AzJvfVNP09X3eJZq2Lg8ig1hM=;
        b=jwnyvJWBJIKThCIP1LGLutAPGfBE+Ia0h+2Pp1Nz6z6R7v8zfazfRNZPKjCGHLIwDs
         4AHSRHsgXHcxCkZn9by3TSAoLfpvpDD5rFTvZ25gZ4gpoxCYTMOehGy6y0cKd/mBXnwQ
         zmpGxDSdpYIksHVNI8m0bbHh8sVFY9SH16/xfkqcjvP7yXoXZ/0TSKVJ0W7qES0WxQKG
         OxOKzNGTEg2VRbDjTcdSlGKrKAnUXEz7rzPMk9QP/dAwJQleG39umQ1ZG0IPlDfDOKGa
         f6zKRgldgruNWkcMtU5eJlNlwxKVXsv63fnDNNaZrUmmNywyrw9qKxbprCdFO7spDVjr
         VC7Q==
X-Forwarded-Encrypted: i=1; AKwUvBx00x2GxYHkqQKb1vjgfTDwyjorwkio2LN3ZPHg6ux0WyqZCmMn4GRqF9zJo8yvF10PGW1jH4gRPvM35UWGftyF@lists.infradead.org
X-Gm-Message-State: AFuF++kcEbYDigaXsUkzMQjrtlcmjspbeE98xDIRABZKKTXHNylVAuA5
	8ynnlXBEeF2fe4clYyf83cnOgQWKurdBp81EbwDNsZxG38SzbLB8T6zQEBD5Kkqce9ZPPuCkHFV
	W+0uop3dkV51biHz71Zzud8mO8ymJO9DQR2tHrlpd3u6bFdv8maZxsU9jRz+g6QRFPgcrGADX/T
	0gsQ==
X-Gm-Gg: AYBFou140QgEtxOLMk/PiEVfbERIo4hc9Qd80mJ2uyDcp+pmWGkDs7jOlEDSCrztkNk
	RF3XZlItlaNuZCjyFxPZQ0vc1po6HOpdLAHuVTmz5USbMxHRMFhbJXxSp65wVNbBU6WWbeDrKih
	d8QUQ68yYkxyq0DSbFeQntzZK3p54t09Di7t4FIkufKI4DamznpMHbCbRa989ALaWMASebFgA3U
	Z2+IH/4XbTtm+QqFgzzeUAQ3SSUR3NnJchaR1y/bBqvfXejHaJcDiLNTOM3QaKtfSX23NUz3mB2
	XtKXMOl/NQXMfE7dDEKZtiDuHnJhy+NLmV5EjkHHV35FKb0Nb9ZgvHDcheYQVTafVqV466vB6MT
	I4k24m5I4u8uzIf/bdtCNnlTEYhVZO15dxbRL65JSlc+6aDdliANIuQ==
X-Received: by 2002:a17:90b:2752:b0:39e:6c6a:209f with SMTP id 98e67ed59e1d1-3a098ac28demr2636448a91.64.1790269401160;
        Thu, 24 Sep 2026 10:03:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2752:b0:39e:6c6a:209f with SMTP id 98e67ed59e1d1-3a098ac28demr2636404a91.64.1790269400632;
        Thu, 24 Sep 2026 10:03:20 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972efa0bsm5582969a91.8.2026.09.24.10.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:03:19 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:03:13 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
        sudeep.holla@arm.com
Subject: Re: [PATCH v19 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
Message-ID: <20260924100313.00003be7@oss.qualcomm.com>
In-Reply-To: <20260924135201.850038-4-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
	<20260924135201.850038-4-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfXwiQIjujG9z/l
 u8QLTZXYaIeLTJeTZDdN/DcTJltaP8Fs6yIxofPVlFKCBywl9rnZcSMMtuYqN5yJH8yrARQCJCg
 A/dwTfVMcou2V9d0+9r3ey7Qnr5oxXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfXzOP7+fKdgZeB
 eAGWhz+kHB4htalQ12Rv5Hxly6x4EF9BeZ5qL6vDvHafZRwcEqCTJTtG+aW6wm3YVbXqsux27v/
 yZ6lHts/UvxLmSrmngC4oshGE2IS2KMNzI6gAF9DkwOVAi+sPnH4vljVG73xHaCyezqlHycOlx/
 J9XWYKdfp4QpNMClFiTg7BvznwxmcxovYwDsg5RKQX+EqBw36ETcv55zNMDrxqAnr7XoAPG22ZI
 7spY08YtcohFxDZevusTD+LnVfWeVNfG3R5d0O3SV20ape9E9TWdop5+9ANs8mHkG60p1fkrfSu
 oonOkckk0ysaz47Z9YObxrXwAVMBeVT17k8U0dPP5IdxyAeiN0Ol+6yjFrvLqbQuchXenkOliAr
 aUq3mpeFNYNxcPL4ySyVyz4rhltFpBfalpQ01deBVRVuf/XBGpuVz8apRh59HSgQ3HMRDy0NY6N
 QYUL8QCsabQ0pRRvlvw==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab557da cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=t3n5nvtZY-KuBPRqFMwA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 82zPnLyqJ9gb6zA5o4NS55ckfIpoT2Cw
X-Proofpoint-ORIG-GUID: 82zPnLyqJ9gb6zA5o4NS55ckfIpoT2Cw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_100323_615285_DA32D47D 
X-CRM114-Status: GOOD (  27.63  )
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

On Thu, 24 Sep 2026 14:51:57 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> RMM v2.0 brings the ability to set the RMM's granule size. Check the
> feature registers and configure the RMM so that it matches the host's
> page size. This means that operations can be done with a granularity
> equal to PAGE_SIZE.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Hi Suzuki,

Some trivial stuff inline.  Assuming that is addressed.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_rmm/rmi.c | 70 ++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index 3baba931f92e4..c9ea964fd9081 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c

> +
> +static int rmi_configure(void)
> +{
> +	unsigned long granule_feature;
> +	unsigned long granule_size;
> +	int ret = 0;

Value not used.  Fine if it is future churn reduction, but I didn't spot
where if so. I'm guessing left over from refactoring

> +
> +	switch (PAGE_SIZE) {
> +	case SZ_4K:
> +		granule_size = RMI_GRANULE_SIZE_4KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
> +		break;
> +	case SZ_16K:
> +		granule_size = RMI_GRANULE_SIZE_16KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
> +		break;
> +	case SZ_64K:
> +		granule_size = RMI_GRANULE_SIZE_64KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
> +		break;
> +	default:
> +		BUILD_BUG();
> +	}
> +
> +	if (!(rmi_feat_reg(1) & granule_feature)) {
> +		pr_err("RMM does not support %luKB granules\n",
> +		       PAGE_SIZE >> 10);
> +		return -ENXIO;
> +	}
> +
> +	struct rmm_config *config __free(free_page) =
> +		(struct rmm_config *)get_zeroed_page(GFP_KERNEL);
> +
> +	if (!config) {
> +		pr_err("Unable to allocate memory for RMM config\n");
> +		return -ENOMEM;
> +	}
> +
> +	config->rmi_granule_size = granule_size;
> +
> +	/*
> +	 * For now we set the tracking_region_size to 0 which is the only option
> +	 * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 16KB/64KB).
> +	 * TODO: Support other tracking sizes via Kconfig option for other
> +	 * PAGE_SIZES
> +	 */
> +	config->tracking_region_size = 0;
> +
> +	ret = rmi_rmm_config_set(virt_to_phys(config));
> +	if (ret) {
> +		pr_err("RMM config set failed (%d)\n", ret);
> +		ret = -EINVAL;

		return -EINVAL;

> +	}
> +
> +	return ret;
	return 0;

So obvious this is the good path without anyone having to think about it!

I did quick check on whether this was to reduce churn due to later changes
but couldn't immediately spot anything


> +}


