Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16165C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7v7mwV3kL+pNqZlpuPeN3iMHS9Dj14zbCE44HBuwDdc=; b=3W3qbNcXfY6u3OkU+ndqzozq8x
	40hEUAjddhdmQUFMJxGyDR8C/mcOoKXuW6CM+BvTHAnXVtDaBa1e5cHlBn6teWxFlUkcFX63OtElM
	ETuZbTl82Ml0ExTa9DPzHWHiSoZTqVvT9zO+/nk3KwaB1HiqfIQlZrgxihXyg5u50AMMRt0fEauiE
	UFEroSdjE6t93xrH1TpWXeiEca7FYi6jgYETWHsmdgR0rnnMNn/Jlhd51AUswqvsUMuepsTq3sHif
	VCX1GocJLBszoZb9TTO6s9Zs8rLHRvo/ZjLpBsRcio9aHRYitoozKMqcouAUPUknyCX6EODV6woKL
	IadEQ3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9otS-0000000C0rb-2hTT;
	Thu, 24 Sep 2026 19:14:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9otQ-0000000C0qx-0guh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:14:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdU5T3152315
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 19:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7v7mwV3kL+pNqZlpuPeN3iMHS9Dj14zbCE44HBuwDdc=; b=grAZx5ctnOkhdTlJ
	Tbx3UTtNyuHD/sr5o5S9iAosrcwL9vTgFX5n+qgkBa8eJlCDluGlJmxRGLzQFDp9
	DNTotWQ7bej5dT0xfn70EAehqKhfhEvCn3M9xVQrr3bE6g8+ythywAZx/OeJitpd
	N58VTQPEmBCKldJPszmeAMbxozdDm3HfnGTEFFMBUwRnLZP+l9asNVg8vEV0aBhS
	B47EBSt9mP94NZbIGO1X1Y/YrRm6XrQwu8J4zQDrIgiYlXT/tP86H8pL55G7Lf8f
	e22DjROzCJFkF16UcHQcoqsBhj2kMOts7bn6k0M/hwe6kJItxVTabXAQga7Wyqm6
	eidmPg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898rgk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 19:14:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33310847fcaso134358eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 12:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790277243; x=1790882043; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7v7mwV3kL+pNqZlpuPeN3iMHS9Dj14zbCE44HBuwDdc=;
        b=TmMlFfSmMlqw5bHGOMVP5Kb/L8+/d3kTNd8wYUuvGaXADfhxWoK9ZUcZ86z0kwcjhp
         rcchIHk45krBjOSydgEgM3Y8YHIR9v+AUrdOcFSLyoxE4rD39yiIlfXyHF2LMFdEhJGC
         RQcZJSsVZ2M9j8zcVegQ8NAzZ+GRGcZpKmRaCG7zASAxO3ciP6Qhh0IDHYj1pKvUzLbZ
         Y2x/kvefTzL+swF9hn/57OvHOWAJplbvunY8RYOS8rc4qcBARmRdWfVl2JDOx0a843lJ
         kQfZ3ywLZ/B+eiEPZH8TnjAsGskqca1YIoFBqn9/H2SqbeCH/uuHgpnO7ceMSspfSuzE
         aW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790277243; x=1790882043;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7v7mwV3kL+pNqZlpuPeN3iMHS9Dj14zbCE44HBuwDdc=;
        b=KYWrkOAyY2kDTAP7zkU7OvC920/EENtESG1KGI1NXz8QKWIFOXMcv7Jrp9h5uJSdSD
         C/2Tv+ehJ5/hLPO+aVbJqsjJfaoMIKDIQG/YUpJalHUKWuMqw5xosg/gUTwDip94Y+wt
         bCXPMzKsphPvCD9glIiM75KIvwjmG+m1DdDrB2vzuktkcFTajQLWpSlXHCIeJzpg3INq
         sM03H1ovQNPiyIaGhDGmqUY/h+YXH44ViXGCk1TBMxFfmc1bFSnc55Lo7TTLoaqTWKNm
         QirdM9y7P/DTM4cBX+2COMxIHNWheTB1wU7gKhro0PCpNdUqiJ++V3LAJC4f12DEsBFF
         lcHw==
X-Forwarded-Encrypted: i=1; AKwUvBx8iQvAOf4mPzQF2QanoZySViUstO5f9sXSzop7JaybDDm1vu3UD03nq1bbe9/Hqt+VbknDU603gT3SszNtkIrY@lists.infradead.org
X-Gm-Message-State: AFuF++ma2R3r27mprKwDspzSB95BNaiaE5/94eBofnvKO9F0gXmpI+tO
	CVLYAs+IcMLu9OMwUZIngeI9yxq8hjEM4Y259edi+N3MA7JlYYd5U4v+35EqFWEQrYyPfqh0xn8
	5gcPSu2sfSjTyWkBhjL/0HbV7RnL/kmNMaIKTbWxudyGDCDFYDJeiQqQT/CD9+ZdtUx6VMHO+5K
	Qw/g==
X-Gm-Gg: AYBFou2h5uaZoMeAZn73SekTISEaXc8tQD0n4If0I2j1E8Ei54V5RaFq2GIlaaEruPo
	/HO5KYod7Rzo1DGftZvqxLaTqI5tXWiEXUewvSbrLIk1JM4TbkkRVFOLnheMW5gUlP9SDMNNwCQ
	0IVa2P0bCimeRVCFcQOG93Vavns1iJknEkeK0gLDSmZpqVak5lxYBx+EOtxQwl/7Y3QRO5Airj7
	dKeYmmV067VKLzkFIcNou7Oy1fMLaXhGPWmEu9fyRJRHPkHVJ1XroakVz9m4Fih1u6fx/a6nBsO
	qeT/SrZGtD5JVteF/oRSB5WmlEfMqOuI+RH6qvoxJlBAc2Biu4nXi8Of1oRciL+JJ3wZogL2z9W
	bwwIuxs3rak5Ae53LqeXmcf/VJt30JbVwlRvH8JpqPmlJwd3Gj6crWw==
X-Received: by 2002:a05:7300:1905:b0:33b:fc17:e786 with SMTP id 5a478bee46e88-33fff65015fmr3559962eec.16.1790277242515;
        Thu, 24 Sep 2026 12:14:02 -0700 (PDT)
X-Received: by 2002:a05:7300:1905:b0:33b:fc17:e786 with SMTP id 5a478bee46e88-33fff65015fmr3559927eec.16.1790277241676;
        Thu, 24 Sep 2026 12:14:01 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341447576b9sm641843eec.15.2026.09.24.12.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:14:01 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:13:56 -0700
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
Subject: Re: [PATCH v19 4/7] firmware: arm_rmm: Add support for SRO
Message-ID: <20260924121356.00000d4d@oss.qualcomm.com>
In-Reply-To: <20260924135201.850038-5-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
	<20260924135201.850038-5-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA3OCBTYWx0ZWRfXxgl6AMQRkGwF
 i6h5I46F2KHZnxKEipv3XhcxbzOavXbX4wHaKxZFMwJkfrqqKhR4+L53ys+AMBQ/pxSg5km7djf
 jzYAy4t6G+B3O/MPdpICWcxTDykOVgs8U8Tquz02+OD2KOBZ8MpV4kHZfPj5crl1TKD5NTyQ4bp
 500rmD5GAqqidnTjeadeUdYVHJ4bv2tf/31vU9zSUWQDak3/yTr8G2yC0fR7Si+OrfhHVEKEvHB
 R1Ii8hTCBisBmtL2dZknA7azQjxv3ROXL7mC7Eexw6e93rGFrTw22SfCJHi0ri4slo5e8ZsKI/V
 ULMfMiLa8PNJL+K4521vBs0cRBjg6uk/o7m4km64QCzW05bECdUQKRh8wN1F92Ywe0757ijqWW+
 fN2NBvWxe2z12/I2eYde7JguKEZJAoCBe+Dvp4mmrPMu6Y/ydVQQ7tDRDcv0sHHh1acYLt6fSQd
 62KQTCTtsb4f7TpGTuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA3OCBTYWx0ZWRfX+LeWp4v6zdIi
 VDGId2x/P0vqw6EiJ2kZb2Xdk31MWMdSzvjPF11uPisCrxmG+njkAKB02O+CUJ/xBaVhrKX+shy
 +Yx53Ghj5GMuEbDdJIztIUa9kokxBX8=
X-Proofpoint-GUID: eL5dR9POQcDOnV8xF1EKTJ_L8iIFhhRv
X-Proofpoint-ORIG-GUID: eL5dR9POQcDOnV8xF1EKTJ_L8iIFhhRv
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab5767b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=g7tT_HrEe4iQpSKoiZcA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_121404_229933_C5A0D293 
X-CRM114-Status: GOOD (  49.53  )
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

On Thu, 24 Sep 2026 14:51:58 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> From: Steven Price <steven.price@arm.com>
> 
> RMM v2.0 introduces the concept of "Stateful RMI Operations" (SRO). This
> means that an SMC can return with an operation still in progress. The
> host is expected to continue the operation until it reaches a conclusion
> (either success or failure). During this process the RMM can request
> additional memory ('donate') or hand memory back to the host
> ('reclaim'). The host can request an in progress operation is cancelled,
> but still continue the operation until it has completed (otherwise the
> incomplete operation may cause future RMM operations to fail).
> 
> The SRO is tracked using a struct rmi_sro_state object which keeps track
> of any memory which has been allocated but not yet consumed by the RMM
> or reclaimed from the RMM. This allows the memory to be reused in a
> future request within the same operation. It will also permit an
> operation to be done in a context where memory allocation may be
> difficult (e.g. atomic context) with the option to abort the operation
> and retry the memory allocation outside of the atomic context. The
> memory stored in the struct rmi_sro_state object can then be reused on
> the subsequent attempt.
> 
> Wrappers for SRO RMI commands are also provided here because they depend
> on the rmi_sro_execute() implementation added by this patch.
> Delegate/undelegate handles are also added here because they now use the
> SRO/stateful command infrastructure and are also used for the memory
> DONATE/RECLAIM flows.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Nice.  Everything I spotted this time around is pretty trivial.
So assuming you'll clean up and bits that make sense to you for v20

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


> ---
>  drivers/firmware/arm_rmm/rmi.c | 666 +++++++++++++++++++++++++++++++++
>  include/linux/arm-rmi-cmds.h   |  41 ++
>  2 files changed, 707 insertions(+)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index c9ea964fd9081..035f21d3f26b6 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c

> +
> +int rmi_undelegate_range(phys_addr_t phys,
> +			 unsigned long size)
> +{
> +	long ret = 0;
> +	unsigned long top = phys + size;
> +	unsigned long out_top;
> +
> +	while (phys < top) {
> +		ret = rmi_granule_range_undelegate(phys, top, &out_top);
> +
> +		if (ret == RMI_SUCCESS) {
> +			/* Buggy RMM ? Let the caller leak the pages */
> +			if (WARN_ON(out_top <= phys))
> +				return -ENXIO;
> +			phys = out_top;
> +		} else {

Similar to below, why not deal with error case first and reduce indent of
the good path.

> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(rmi_undelegate_range);

> +/*
> + * rmi_delegate_range: Delegate a physically contiguous range.
> + * We iterate over the range until we hit an error. So we may
> + * return an error, but with a partially delegated range. The
> + * caller must always look at the @out_phys to figure out, how
> + * much progress was made.
> + *
> + * @phys:	Base of the physical address range
> + * @size:	Size of the physical address range
> + * @out_phys:	Top of the range that was completed. This is always
> + *		valid, irrespective of the result.
> + *
> + * Returns RMI_SUCCESS on successful completion. Otherwise, returns
> + * the Linux error number or the RMI status code as described
> + * by the RMM spec for RMI_GRANULE_DELEGATE_RANGE or RMI_BLOCKED.
> + */
> +int rmi_delegate_range(phys_addr_t phys,
> +		       unsigned long size,
> +		       phys_addr_t *out_phys)
> +{
> +	long ret = 0;
> +	unsigned long top = phys + size;
> +	unsigned long out_top;
> +
> +	while (phys < top) {
> +		ret = rmi_granule_range_delegate(phys, top, &out_top);
> +
> +		if (ret == RMI_SUCCESS) {

My instinct here would be to flip this and have the error out of line given
it breaks anyway and that gives you smaller indent for that ocmment block.

		if (ret != RMI_SUCCESS)
			break;

		/*
		 * Buggy RMM ? Let the caller handle the failure. We can't know
		 * how far the RMM delegated in this iteration, so we return 
 		 * the best known good limit. RMM can deal with granules 
		 * already in "undelegated" in a given range. So, it is fine
		 * for the caller to try the range we return.
		 */
		if (WARN_ON...

> +			/*
> +			 * Buggy RMM ? Let the caller handle the failure.
> +			 * We can't know how far the RMM delegated in this
> +			 * iteration, so we return the best known good limit.
> +			 * RMM can deal with granules already in "undelegated"
> +			 * in a given range. So, it is fine for the caller to
> +			 * try the range we return.
> +			 */
> +			if (WARN_ON(out_top <= phys)) {
> +				ret = -ENXIO;
> +				break;
> +			}
> +			phys = out_top;
> +		} else {
> +			break;
> +		}
> +	}
> +
> +	if (out_phys)
> +		*out_phys = phys;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(rmi_delegate_range);

...

> +
> +static int rmi_sro_donate_noncontig(struct rmi_sro_state *sro,
> +				    unsigned long sro_handle,
> +				    unsigned long donatereq,
> +				    struct arm_smccc_1_2_regs *out_regs,
> +				    gfp_t gfp)
> +{

...

> +
> +	/* Gather the suitable entries to the end of the list */
> +	i = 0;
> +	while (i <  addr_list_start && found < count) {
> +		unsigned long entry = sro->addr_list[i];
> +
> +		if (RMI_ADDR_RANGE_BLOCK_SIZE(entry) == block_size_fld &&
> +		    RMI_ADDR_RANGE_COUNT(entry) == 1 &&
> +		    RMI_ADDR_RANGE_STATE(entry) == state) {
> +			addr_list_start--;
> +			swap(sro->addr_list[addr_list_start],
> +			     sro->addr_list[i]);
> +			found++;
> +			/* Continue from the swapped in entry */
> +			continue;
> +		}
> +		/* skip past the entry */

Bit random on comment capitalization.  Have a quick final look through.
For instance I think this one is Skip to match Continue above.

> +		i++;
> +	}

...


> +
> +static int rmi_sro_reclaim(struct rmi_sro_state *sro,
> +			   unsigned long sro_handle,
> +			   struct arm_smccc_1_2_regs *out_regs)
> +{
> +	unsigned long capacity;
> +
> +	/*
> +	 * We don't do a partial free of the entries. So for
> +	 * now free the entire address list as we prepare
> +	 * to reclaim more from the RMM.

Rewrap to use all that nice space up to 80 chars!  I guess a refactoring
side effect.

> +	 */
> +	if (rmi_sro_ensure_capacity(sro, 1))
> +		rmi_sro_free(sro);
> +
> +	capacity = RMI_MAX_ADDR_LIST - sro->addr_count;
> +
> +	rmi_op_mem_reclaim(sro_handle,
> +			   virt_to_phys(&sro->addr_list[sro->addr_count]),
> +			   capacity, out_regs);
> +
> +	/*
> +	 * RMI_OP_MEM_RECLAIM always return RMI_INCOMPLETE, except when the
> +	 * input parameters were invalid.
> +	 */
> +	if (WARN_ON_ONCE(RMI_RESULT_STATUS(out_regs->a0) != RMI_INCOMPLETE))
> +		return -EINVAL;
> +	if (WARN_ON_ONCE(out_regs->a1 > capacity))
> +		out_regs->a1 = capacity;
> +
> +	sro->addr_count += out_regs->a1;
> +
> +	return 0;
> +}

> +
> +long rmi_sro_memxfer_execute(struct rmi_sro_state *sro, gfp_t gfp)
> +{
> +	struct arm_smccc_1_2_regs *regs = &sro->regs;
> +	bool cancelled = false;
> +	unsigned long sro_handle;
> +
> +	rmi_smccc_invoke(regs);
> +
> +	sro_handle = regs->a1;
> +	while (RMI_RESULT_STATUS(regs->a0) == RMI_INCOMPLETE) {
> +		bool can_cancel = RMI_RESULT_CAN_CANCEL(regs->a0) == RMI_OP_CAN_CANCEL;

For a flag that is "can" or "cannot", do we need the RMI_OP_CAN_CANCEL (1) / RMI_OP_CANNOT_CANCEL (0)
defines?  Doesn't feel like we'll ever get RMI_OP_UNKNOWN_IF_IT_CAN_CANCEL and I can't think
of any other more reasonable options that would justify needing the explicit field value
match.

To me

		bool can_cancel = RMI_RESULT_CAN_CANCEL(regs->a0);

is obvious enough.  I don't care that much though so up to you.


> +		int ret = 0;
> +
> +		switch (RMI_RESULT_MEMREQ(regs->a0)) {
> +		case RMI_OP_MEM_REQ_NONE:
> +			rmi_op_continue(sro_handle, RMI_CONTINUE_KEEP_GOING,
> +					regs);
> +			break;
> +		case RMI_OP_MEM_REQ_DONATE:
> +			ret = rmi_sro_donate(sro, sro_handle, regs->a2, regs,
> +					     gfp);
> +			break;
> +		case RMI_OP_MEM_REQ_RECLAIM:
> +			ret = rmi_sro_reclaim(sro, sro_handle, regs);
> +			break;
> +		default:
> +			WARN_ON_ONCE(1);
> +			ret = -ENXIO;
> +			break;
> +		}
> +
> +		if (ret) {
> +			/*
> +			 * All memory donating SROs must be cancellable. So a
> +			 * failure in memory allocation shouldn't be an issue.
> +			 * However, if we encounter a random failure (e.g.,
> +			 * buggy RMM), don't loop forever, just give up.
> +			 */
> +			if (WARN_ON_ONCE(!can_cancel))
> +				return ret;
> +			/*
> +			 * If we have already cancelled, and came back here due
> +			 * to an error in MEMREQ, then there is no point
> +			 * in going in loops.
> +			 */
> +			if (WARN_ON_ONCE(cancelled))
> +				break;
> +			rmi_op_cancel(sro_handle, regs);
> +			cancelled = true;
> +
> +			if (WARN_ON_ONCE(RMI_RESULT_STATUS(regs->a0) != RMI_INCOMPLETE))
> +				return ret;
> +		}
> +	}
> +
> +	if (cancelled)
> +		return -ECANCELED;
> +
> +	return regs->a0;
> +}
> +EXPORT_SYMBOL_GPL(rmi_sro_memxfer_execute);
> +
> +/*
> + * rmi_sro_execute: Execute an RMI command that is Stateful but not memory
> + * tranfserring. Takes regs, filled with the FIDs and the arguments in place.

Spell check. Transferring.  Also why does Stateful get a capital letter and
Memory Transferring does not.  They seem to both be properties of the comman
so I'd expect some consistency.

> + *
> + * Returns :
> + *  -ECANCELLED - If the operation had to be aborted and SRO was cancellable.
> + *  Otherwise, returns the result of the RMI command.
> + */
> +long rmi_sro_execute(struct arm_smccc_1_2_regs *regs)
> +{
> +	bool cancelled = false;
> +	unsigned long sro_handle = regs->a1;
> +
> +	rmi_smccc_invoke(regs);
> +
> +	sro_handle = regs->a1;
> +	while (RMI_RESULT_STATUS(regs->a0) == RMI_INCOMPLETE) {
> +		bool can_cancel = RMI_RESULT_CAN_CANCEL(regs->a0) == RMI_OP_CAN_CANCEL;
> +
> +		switch (RMI_RESULT_MEMREQ(regs->a0)) {
> +		case RMI_OP_MEM_REQ_NONE:
> +			rmi_op_continue(sro_handle, RMI_CONTINUE_KEEP_GOING,
> +					regs);
> +			break;
> +		default:
> +			WARN_ON_ONCE(1);
> +			if (!can_cancel)
> +				return regs->a0;
> +			/*
> +			 * We can't get here normally, but handle this anyway
> +			 * for a buggy RMM implementation.
> +			 */
> +			if (cancelled)
> +				return -ECANCELED;
> +			rmi_op_cancel(sro_handle, regs);
> +			cancelled = true;
> +		}
> +	}
> +
> +	if (cancelled)
> +		return -ECANCELED;
> +
> +	return regs->a0;
> +}
> +EXPORT_SYMBOL_GPL(rmi_sro_execute);


