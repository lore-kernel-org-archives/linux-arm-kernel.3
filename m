Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD1AC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 21:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPuI30IW6HSkIQ0WfYplqjAWQJEIGM7YwNUkDQocFtY=; b=3ZBEBt3PHzbSd4KO61eo0Du0PA
	sYXUGsMA6udt3ipXqNWHPHm2kXi4ffH78xz6n6QBUCJM8UOUY1hZqwULle1j8O8uxyx13MSY7ebtH
	x/qwRA01hNIhcXXHC81xEzqtFBi/un5+BQBwTN+jjR+wQVAeZn9d6h01MKOlVZCOVPxSVBFKF2sMr
	9wrh5OGEJhaQzCMS+CY6RnIbFVGxMrY2zAPwlsseE103LEIiJxk4GmppBPsEM1uQilqJch6bcUg3c
	CxanvHoQvGE579kGLBhZ77W4uH2voekuxO+oFHf8HH08VEblaUsPRmua3yYKAi6Uv1AtoQo94LKcR
	a7OX9XvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9r9E-0000000CERs-0zaF;
	Thu, 24 Sep 2026 21:38:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9r9B-0000000CERX-1jel
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 21:38:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdjtf2996413
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPuI30IW6HSkIQ0WfYplqjAWQJEIGM7YwNUkDQocFtY=; b=PNrEf8JFzkwn7FZr
	UsqWaAdE1hg1luh+Xq1u26Yaac6StZiDKKxCzlUZfFeRBLkft36AJqiJpwQjlmva
	+TxLaCkUKfQFKtIiotRuLu+RuUouNU/0ut2Gd7+TIx0sj++94mT4AKaA+psLINM2
	qYd4wzqywaltdpxqlYX1qGIWOdtz1Yx1WJkgsvvqK2hP/NyeJvOz/QjSwlO03dlA
	Zd5PyoJApHtNT7En2tEmm7sJjLC/zLd1EfyNrtVRZ6pkDLhtPDzQrw25UfFCv4fn
	qoSNt5bAI01OvfB9c6GqAqaZcuS97obyt7VzDZfQmLr3C9XoFekVnXkDcz1zhrpv
	6cwN0A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw46524vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:38:28 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so1039656c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 14:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790285907; x=1790890707; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FPuI30IW6HSkIQ0WfYplqjAWQJEIGM7YwNUkDQocFtY=;
        b=Jq6O4G4HHvc8Ab2F0bs/w7a5Gm/8uUIpvjwXt8tENr/1eOjiP2KNMDh7fomldydHK1
         wmvnQ4Sf0zlN2D2KGe/6xU1yfz0A7VcUHQ+L8tU4zoCdlg3SOwoMLaHD5hBED5K1AMCM
         n4YAzn1d6IQUAKYAiSJbC84l8QWXhC1quvK+rgnCCtuvrTxwAUZgbp63XLlVPTkj660v
         5L9jprCFKLia9jadpScgiZkhSNF2u2vYi/YcPhjFsUkddHwkdgKXgFxfu26dfzFDu4mT
         xkTHjN+6H6DEDtatRX+zcDtJnSFZPIaubi89oJCJKEezKl7t7wBB00HuAlAwre9Y7C3z
         w7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790285907; x=1790890707;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPuI30IW6HSkIQ0WfYplqjAWQJEIGM7YwNUkDQocFtY=;
        b=J9Q/Nd+YSKMsw8wAsHtl865ABNiuTX2Ckz4cBZu1ime/MymZt51JzfAYmkUbvfOwFx
         O/5+4h9c1UhYknu1HOuu3lHXknUR6cgp4CRzDXu7i9rxT3Kv+NWagdi4CjUCuIR1rd+n
         QaseHvTjSgxfIUasQEPOtsO1UMgBaIu0XYH3DUZhlbnBbsYkzQwMwwqK5ozZEPIstXvF
         qCKWgnlxJVch1GEo3JUxp9LIEW/vtYW8ecSpmQX9334ebvr2YM4iv8ZxUPGIvYwY6mbh
         /jl3FYMKASljjeuybUWXQPtJ/tUY26rKIvuhD6+hZ9ldVBODufppZZrHlW8IK6iLhSxb
         npiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeLV8SVn9Ymw2DyXYiNJTezfpn+rR8+l/c8UnHMB83oglBw82aJEXT0/LF1BHwyJlkczpt7nTehzIbwcRHSrvA@lists.infradead.org
X-Gm-Message-State: AFuF++lPaEm2zHj5aDgIOrHULcQiEt1TLDJoDuVEJNNxKBfGhEq1NA80
	3AVxp6ArU0bqQBv22OkslTgEkisYYKZlILkjDNmD0G9tjvy3pQALiYlpsKyB1lF6EKnD19rjxeL
	RKW2Mew5BH6HXmSheeCZxu4XIGKRlLZUqBXYMdvwwb/2Txh39c4u7dnjFrDw8n3znQTDKVSk7vm
	jx+A==
X-Gm-Gg: AYBFou31EdHzBDwGHUrcr2DzhTNI9pQkwVTnNkyBfdgPgSWb+uLhFbWFUrm/9FYum3J
	o/TFKkfczKM2t/eCdLQ52qI6b8usEn3kYN7wZYKgrs8SY5nql5rLvR8DQGX03/TBZXDohF28pJ6
	VB6uBHbm8Nt24HX0B3l4S67p61jP+FeJfjFNeV4vz9FTH4p38O9XjQnx7C4G140qBRfMXziE24M
	tF4HQIpBZBHsCeGkCljhUF2Y2esZSHH5M92NiKTX5qLl5C8AFJKQaPYhDjPBLCV8cC4lCVKq5VN
	iyqimzOT3qfAGWKuVazwso5HIn1N9P2G3FxbeW/Vjp7YMHkeOwW7ZusVU7XpkBzlsS31is95HWI
	2qPSVZK1bDsXGbc/1rNd5jhiVFN/sA/iOoZz/2W8uYIWc9AHfxewzCw==
X-Received: by 2002:a05:701b:4306:20b0:144:ed03:7c6a with SMTP id a92af1059eb24-14503fa40c4mr2958577c88.15.1790285907139;
        Thu, 24 Sep 2026 14:38:27 -0700 (PDT)
X-Received: by 2002:a05:701b:4306:20b0:144:ed03:7c6a with SMTP id a92af1059eb24-14503fa40c4mr2958529c88.15.1790285905117;
        Thu, 24 Sep 2026 14:38:25 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad9e097fsm1289075c88.13.2026.09.24.14.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:38:24 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:38:21 -0700
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
Subject: Re: [PATCH v19 6/7] firmware: arm_rmm: Ensure the RMM has GPT
 entries for memory
Message-ID: <20260924143821.00003491@oss.qualcomm.com>
In-Reply-To: <20260924135201.850038-7-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
	<20260924135201.850038-7-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab59854 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=8d2wJ0fT7bLMqeC6Z9UA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: qiVrH023vnbN5NkicAtHI1WgxN2q96Q5
X-Proofpoint-GUID: qiVrH023vnbN5NkicAtHI1WgxN2q96Q5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4OCBTYWx0ZWRfXzNzOYPle9TcY
 qzmyWE3RRWRJSXLTFaf9Z36434VZ58u9MXfeSX7ilPTHD71cGg0JzbyZha9/qD/CNYX0Xqj1P+B
 8nJLbPsvn+IChgAmyBjAQhp0cRIKOmYYD4S02MrKIM7xGXmNrxrmbvXZiNmp+3ZqZ6WaFqSheo7
 k+TIAQQo91ZAybqhBy3ec6MrE92Km4Xfz2khEZXORwb9kNxhZvHIMPPl0RLxLTfkBneMeEbFt2v
 ma5DsN4fZ1VjJ81R1JVdZ9vPzPSqCwnKUpgFewL8vnBzhlDinMkNQIbuM3Ixn79QwptOvAByWlW
 7clu2Wna6EVXEXnsfWwTbJR4EoPMJF/fLPu2gssezPXUAcDDaZRUE2uCy6NQbxTbR+BOVDUIT98
 xPk2BeJQXTkmGD74O+XZG7oBxzNC7VtQ2p0eOb/PHPpExfJMCcqju6daJWywfTy6SxeTprEpaSD
 IxEUlB6DzdCSCAr0b/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4OCBTYWx0ZWRfXz98+l4SKBHJQ
 NJdAIzCiwhSzdzEjyvTwh6v44D6jM1oRd/iSOO7b+b2HkXgPS06upD7njUXiQGXSwO/lalhQhgd
 ZupsvZwdx1kONdf/hpvhKkRHrszOxSU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_143829_577889_D1E4D2D6 
X-CRM114-Status: GOOD (  39.26  )
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

On Thu, 24 Sep 2026 14:52:00 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> From: Steven Price <steven.price@arm.com>
> 
> The RMM maintains the state of all the granules in the system to make
> sure that the host is abiding by the rules. This state can be maintained
> at different granularity, per page (TRACKING_FINE) or per region
> (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on the
> underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region,
> all pages in the region must be of the same state, this implies we need to
> have "fine" tracking for DRAM, so that we can delegate individual pages.
> 
> For now we only support a statically carved out memory for tracking
> granules for the "fine" regions. This can be extended in the future to
> allow modifying the tracking granularity and remove the need for a
> static allocation by the firmware.
> 
> Similarly, the firmware may create L0 GPT entries describing the total
> address space. But if we change the "PAS" (Physical Address Space) of a
> granule, then the firmware may need to create L1 tables to track the PAS
> at a finer granularity. Linux therefore checks if the platform firmware
> manages the PAR region. i.e., the firmware is in charge of managing the
> L1 GPTs (creation and the required memory for the GPT tables - via static
> carveouts) without host intervention. Support for dynamic GPT creation by
> the host will be added later.
> 
> If the firmware requires us to manage the tracking or GPT memory,
> deactivate the RMM and reclaim any memory donated at RMM activation.
> 
> Apply the same checks when hotplugged memory is brought online.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> [ Switch to RMI_GPT_L1_INFO for checking GPTs and deactivate RMM ]
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

A few trivial comments. Either way on those
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_rmm/rmi.c | 218 ++++++++++++++++++++++++++++++++-
>  include/linux/arm-rmi-cmds.h   |   2 +
>  2 files changed, 219 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index 0859f256e192b..1a8f3debd844a 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c


> +
> +/*
> + * rmi_gpt_info - Query the GPT info for the given PAR.
> + * @start: Base of the physical address region
> + * @end: Top of the physical address region
> + * @out_top: Top of the physical address region for which
> + *		the GPT @out_gpt_par_state is valid

wrap to 80.

> + * @out_gpt_par_state: State of the GPT covered by [start, out_top)
> + */
> +static long rmi_gpt_info(unsigned long start, unsigned long end,
> +			 unsigned long *out_top,
> +			 unsigned long *out_gpt_par_state)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_GPT_INFO, start, end,
> +	};
> +
> +	rmi_smccc_invoke(&regs);
> +	if (regs.a0 != RMI_SUCCESS)
> +		return regs.a0;
> +
> +	if (out_top)
> +		*out_top = regs.a1;
> +	if (out_gpt_par_state)
> +		*out_gpt_par_state = regs.a2;
> +
> +	return RMI_SUCCESS;
> +}
> +
> +/*
> + * We do not support creating L1 GPTs yet. So, make sure that
> + * all the regions are managed by the firmware.
Wrap to 80 chars.

Not relevant to this patch, but when are you thinking we will support that?

> + */
> +static int rmi_verify_gpt_firmware_managed(phys_addr_t start, phys_addr_t end)
> +{
> +	unsigned long l0gpt_sz;
> +	unsigned long next, par_state;
> +
> +	l0gpt_sz = 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
> +					  rmi_feat_reg(1)));
> +	start = ALIGN_DOWN(start, l0gpt_sz);
> +	end = ALIGN(end, l0gpt_sz);
> +
> +	while (start < end) {
> +		long ret = rmi_gpt_info(start, end, &next, &par_state);
> +
> +		if (ret != RMI_SUCCESS)
> +			return -ENOMEM;
> +
> +		if (WARN_ON(next <= start))
> +			return -ENXIO;
> +
> +		if (par_state != RMI_GPT_PAR_PLAT) {
> +			pr_err("GPT for the region is not managed by firmware %llx-%lx\n",
> +				start, next);
> +			return -ENOMEM;
> +		}
> +		start = next;
> +	}
> +
> +	return 0;
> +}

> +
> +static int rmi_init_metadata(void)
> +{
> +	phys_addr_t start, end;
> +	struct memblock_region *r;
> +
> +	for_each_mem_region(r) {
> +		int ret;
> +
> +		/* Firmware-reserved NOMAP regions are not usable system RAM */
> +		if (memblock_is_nomap(r))
> +			continue;
> +
> +		start = PAGE_ALIGN(r->base);
> +		end = PAGE_ALIGN_DOWN(r->base + r->size);

Add a comment on why rounding down.  Doe we expect that to ever be relevant?

> +		/* Too small ? */
> +		if (start >= end)
> +			continue;
> +
> +		ret = rmi_prepare_memory(start, end);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}


> +
>  static int __init arm64_init_rmi(void)
>  {
>  	int ret;
> @@ -843,9 +1049,19 @@ static int __init arm64_init_rmi(void)
>  	if (ret) {
>  		pr_err("RMM activate failed (%d)\n", ret);
>  		ret = ret < 0 ? ret : -ENXIO;
> +		return ret;
>  	}
>  
> -	return ret;
> +	ret = rmi_init_memory();
> +	if (ret) {
> +		/* Deactivate the RMM */
> +		WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_DEACTIVATE));
> +		return ret;
> +	}
> +
> +	arm64_rmi_is_available = true;
> +	pr_info("RMI configured\n");

Blank line nice for the eye to spot the return.

> +	return 0;
>  }


