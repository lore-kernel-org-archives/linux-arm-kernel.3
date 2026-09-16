Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13070C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Mt4vKOZALY1yI7qCOWowx88+jkqRlUaEI4ns7rSpbY=; b=vBCBF2HXgrh9lNtnqQaQcvcUU4
	W7cDWlNK5F+lpSiFnNJIa62bvOueJgdgIhti4k4NXHrMct6bGs6s69VpdaRveTZxhvP9HFs5+T4Kk
	P8T/R/SEbemDASeP6vgOUeVBeS7VYv7+zXRqOzfuKkFXCDZhgUCzpUgQToYC3wY4Lse89bMgXHvVz
	E/p4vj6xzKyy/+ra/e4nk1ik2I86X/pbkcGnAAyjkBipACJ5+mByRPkb2K3i45QtI3qnqLVj/v47U
	RQ4/JnN/8isCSGwNyNiI01QTZJRheiKq/N3EJV4VOxc0eVxNCyX1jW8WOqt6JQVro2awKUNvQwo15
	1TjFtlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6fwl-00000008DSD-0GRQ;
	Wed, 16 Sep 2026 03:04:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6fwi-00000008DRr-0KSN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:04:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYdE03680394
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 03:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Mt4vKOZALY1yI7qCOWowx88+jkqRlUaEI4ns7rSpbY=; b=V5E96PD8JDfAzOlY
	rYURV+EVteT0BEUWkzaCgwi92Zoa9ICO/4OhQ4SX+Cp9yO4o5EvgQ+aW8T2qdGPW
	qDAdw25yuFiJKDcuZSvmJmOfxfjZnVyK1bckD4oyBLrfp02+wKQomCogYy7zKkW0
	W/ZR7pwgJABwUHJqHlfjE75CWtPPYaw5SCdwBv9jgPoeNTJDb8nGghXDZ4iFViOP
	y9HBe2Uxjtveyhje0MC7w1CT+Y8hk2zY+5gzhSnGXMrmFD1U5dcaQdYoNQKZ4Oef
	hja++lJNKhxjSzDdA0DivpOG9Z0m1YxJJ5cPA72PHC44Z+5z+FHZ8dnb3WTNx/hd
	4eAnVQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqe1r8yr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 03:04:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a2639398cso8197638b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789527865; x=1790132665; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Mt4vKOZALY1yI7qCOWowx88+jkqRlUaEI4ns7rSpbY=;
        b=gBiT/WAqfp/aSE3zsxy+V5+LL4vd3hLyDx6VtmxVkBDXWC2PIj/EyBkmQH3FpxXFhs
         0OBw2njOSa7v1goEG6IgU0gq6/uQhaT4ZneNdyh7qrtCHWaE6AcnJzMqewURDpeFfpGC
         6zs7RTYzG9XDGVJ7WjbjIZAyyZ63LM531aQpFVMZuY5tULBa5GusJ5OTidKEoD9Y4v6b
         4CBieIhWxJvyrPrHNq5gXXIzrtt4j0aJ+mXr8/ddqIK1QL1jjzycGlLnO2Yn/MFK/jVd
         IzMmVuXMrs+ciEnb9KdnacbgRs30g9y4TnYrpsNhj3lYRQeov0JM6Ja5FRbqWn5oAcEL
         30Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789527865; x=1790132665;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Mt4vKOZALY1yI7qCOWowx88+jkqRlUaEI4ns7rSpbY=;
        b=lrsNRVna/Qly3lh0HvtaSmMa8UxJAbEgjECiV6bOwE9ig1y56ZLceRt62Bb6JAixx6
         QkJfYI6JX8TsaHzZ/o9EBzSvYoSRKcDL4LjV5IwJqoMgwicwWo1hEb892f0j9WZ9WzZT
         AxuFan7S0X4z8hMxxEfKFxF0oIJyecv531YP+jP0whVGuyrRJjzEDkIZ39UK45NftSal
         UnmEz9NX8Mt3mozYYBz1Da1WND+JYQhF3W1OHzl2ibpXwt0ng5bhLsiTyrTGXhcMfsHq
         nbssY7PTgTYWjVtjdT1T+KYQZrOOb+ju+1rcbUAHA67+vpt5VzBOLSbuHY0AfMTV2kv7
         6+OA==
X-Forwarded-Encrypted: i=1; AKwUvByQnYACn9iy3K0QoGcrX+2jrGHkdoTY5xQJm1TpTT9gXZkWUzm4eMiDeZGu8BAjaVinhI3QuLhVwXeZwpY0cbPq@lists.infradead.org
X-Gm-Message-State: AFuF++mAqgnk/36FKpuGPB5g4JJheOnfF5+QyiMVt1HsPjDT+/lBKjg6
	UXpu6bFc/PjKNIodmVqESXwuo9ux7Wr7XGsRN6+1tDIFfpZuko4rpNvcJy5l3ORhD87iEOAnNN8
	pwdXgd0xO4L1oAkUb8EKHDrBE4mpIldJIifscdJgRozZ9Xy95v3jgLoCA2vZ70Sqo1woxqk8kdB
	ML0Q==
X-Gm-Gg: AYBFou29Munl4x+2zXIE9j8T2VN+clSHgrLwKXcN6Fp3QHQMTdTiQFgP8SE66/vtQd3
	94RRNpOXKCPd3uYcWbS1mxfpPU9hi5Ub3yAtOk+5VeZ2+4VVLq+WnBy4gYdCYHQYCL8hr/QNA80
	WFNd/Ks+WpPUqvD9OAOxFOyD9pdT27QgZXFJ70vtZvMAkENm5slLfFOu6LcAphrD3KLTXaJZFIv
	ct/L3I1/6fTV1QalhdM7r23tiWl+BADo6JJfQZjkWpMHzU9YTOdaWbRaBkvph9sTsD0630pDmUm
	IHj9P3J1Z8GDJmtDEUWT7tYr4udFJhCyM3Xv8lw/9oILY0la11wjJrFKzyb5uaUZgBrKbfs0kMu
	Yqd7T1PmPZ9U/rNiyc6VwQHuOINy0HZo8PHxANzVozrUs2bVXEL7WkyMjvKYMUOWjdA==
X-Received: by 2002:a05:6a00:17a6:b0:845:e9e8:645c with SMTP id d2e1a72fcca58-8723a7a4fa1mr1400447b3a.6.1789527865173;
        Tue, 15 Sep 2026 20:04:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a6:b0:845:e9e8:645c with SMTP id d2e1a72fcca58-8723a7a4fa1mr1400412b3a.6.1789527864705;
        Tue, 15 Sep 2026 20:04:24 -0700 (PDT)
Received: from [10.133.33.124] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720124322esm442266b3a.31.2026.09.15.20.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 20:04:24 -0700 (PDT)
Message-ID: <b803b63c-8278-4159-9305-f71ed001bdc7@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 11:04:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] coresight: tmc-etr: Sync the trace buffer for the
 device
To: NoNine <chenmin83@gmail.com>, suzuki.poulose@arm.com
Cc: mike.leach@linaro.org, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Min Chen <min.chen@siengine.com>
References: <20260915130503.645953-1-min.chen@siengine.com>
 <20260915130503.645953-2-min.chen@siengine.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260915130503.645953-2-min.chen@siengine.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAzOSBTYWx0ZWRfX0trWSSz26pUo
 sdYJPYmmY+h1Rcjy7Ge2VdzpaZ5smrcNEOZ8xZmcK0/LkRTyS9Wi27isINpyGX9Z01oOFMjBUeg
 PoQmMZJtiZ3Svgesx/coUz+wJO0+USM=
X-Proofpoint-GUID: CPYO0dwfIwSA51NZDqY21KZ04xjIHVOO
X-Proofpoint-ORIG-GUID: CPYO0dwfIwSA51NZDqY21KZ04xjIHVOO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAzOSBTYWx0ZWRfX2Quo5lHk4KL4
 RBnKh6Eahm9F4KpRnA3Dcr6wXLYuAj3SAMCpO1t8VSSoL1yLUZLFbDweZ8FabUlwaOqHYeU9G5y
 dNIxn69czNH0ItOfCGmQVBS1j5R/MyNHma8Pf/5BsReAaleHJvh88epSO0CFIEjnFwbbJHLzWoN
 CQGyGwsT7yqCEIcr7RIEfVgpKY7qFTPCyLcJOKfEapjJdWate590Qz/MVWdK6IXZYia0539/2A1
 LMQwUXzxeoPWF9j4P4ggK+aqwi7TcdSlfvDJ4H3IpOgiGNZz0huPG1ZXCJ63PsWl4VOTsgD3fbi
 7IvrgekGY6VHjwRDdillKULYcxJ1Riz1Gm4l1MKox2M3EfFJ/HCRT6ZMoDrtZi+cRBGz57DonN8
 kT5ZfOq6SMjeXTMk6ZtISfHJw+GzwRifdgFEq12WiVycWiZ1SbOCBmZH5S4uKCAfKsl2ljW63Cq
 dqGWZxq2Ez7Abg4/G7Q==
X-Authority-Analysis: v=2.4 cv=ZIhCCn7b c=1 sm=1 tr=0 ts=6aaa0739 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UdC6xETiAAAA:8 a=HTs3lNVCq07o06pvmvIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=ybX9D8xwk0CjW0O53t9p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_200428_140758_2A9FFA74 
X-CRM114-Status: GOOD (  33.16  )
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

Hi,

On 9/15/2026 9:05 PM, NoNine wrote:
> From: Min Chen <min.chen@siengine.com>
> 
> The flat ETR buffer comes from dma_alloc_noncoherent(), which zeroes it
> with CPU stores.  The DMA API requires the caller to sync the buffer for
> the device before the device writes into it, but the TMC driver only
> ever syncs for the CPU afterwards.  On a non-coherent sink the zero fill
> is therefore still dirty in cache when the ETR starts writing, and its
> write-back lands on top of the trace data.
> 

Agree, without the sync, the dirty data may overwrites the trace data.

> Add a sync_for_device() buffer operation and call it from
> __tmc_etr_enable_hw() just before the TMC is enabled.  Only the flat
> buffer implements it.  The ETR_SG and CATU data pages are synced by
> dma_map_page() when they are allocated; their remaining corner case, a
> barrier packet followed by a live-drain re-arm, is left for a separate
> change.
> 
> Tested on an AD1000 EVB: five first windows on freshly allocated
> buffers, including the first capture of a boot, all without the
> previous all-zero-formatter-frame runs.
> 
> Signed-off-by: Min Chen <min.chen@siengine.com>
> ---
>   .../hwtracing/coresight/coresight-tmc-etr.c   | 29 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
>   2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index 76a8cb2..bf1d6c6 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -689,10 +689,29 @@ static ssize_t tmc_etr_get_data_flat_buf(struct etr_buf *etr_buf,
>   	return len;
>   }
>   
> +/*
> + * tmc_etr_sync_flat_buf_for_device: Drop any CPU cache lines over the trace
> + * buffer before the ETR is allowed to write into it.  The buffer is allocated
> + * with dma_alloc_noncoherent(), which zeroes it with CPU stores, and the DMA
> + * API requires a sync for the device before the device writes into the
> + * memory.  Without it a non-coherent sink writes into memory while the zero
> + * fill is still dirty in cache, and the write-back lands on top of the trace
> + * data.
> + */
> +static void tmc_etr_sync_flat_buf_for_device(struct etr_buf *etr_buf)
> +{
> +	struct etr_flat_buf *flat_buf = etr_buf->private;
> +	struct device *real_dev = flat_buf->dev->parent;
> +
> +	dma_sync_single_for_device(real_dev, flat_buf->daddr, etr_buf->size,
> +				   DMA_FROM_DEVICE);
> +}
> +
>   static const struct etr_buf_operations etr_flat_buf_ops = {
>   	.alloc = tmc_etr_alloc_flat_buf,
>   	.free = tmc_etr_free_flat_buf,
>   	.sync = tmc_etr_sync_flat_buf,
> +	.sync_for_device = tmc_etr_sync_flat_buf_for_device,
>   	.get_data = tmc_etr_get_data_flat_buf,
>   };
>   
> @@ -1113,6 +1132,16 @@ static int __tmc_etr_enable_hw(struct tmc_drvdata *drvdata)
>   	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
>   
>   	writel_relaxed(drvdata->trigger_cntr, drvdata->base + TMC_TRG);
> +
> +	/*
> +	 * Hand the buffer over in a state the device can write into: drop
> +	 * any dirty CPU cache lines first, or they get written back over
> +	 * the trace data the ETR produces.  Only the flat buffer needs
> +	 * this; the ETR_SG and CATU data pages are synced by
> +	 * dma_map_page() when they are allocated.
> +	 */
> +	if (etr_buf->ops->sync_for_device)
> +		etr_buf->ops->sync_for_device(etr_buf);

Can we add a condition to perform the synchronization only when flat_buf 
mode is enabled, instead of introducing a new operation that is required 
only for flat_buf mode?

if (etr_buf->mode == ETR_MODE_FLAT)
	tmc_etr_sync_flat_buf_for_device(etr_buf);

Thanks,
Jie

>   	tmc_enable_hw(drvdata);
>   
>   	CS_LOCK(drvdata->base);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 6541a27..3dd17da 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -277,6 +277,7 @@ struct etr_buf_operations {
>   	int (*alloc)(struct tmc_drvdata *drvdata, struct etr_buf *etr_buf,
>   		     int node, void **pages);
>   	void (*sync)(struct etr_buf *etr_buf, u64 rrp, u64 rwp);
> +	void (*sync_for_device)(struct etr_buf *etr_buf);
>   	ssize_t (*get_data)(struct etr_buf *etr_buf, u64 offset, size_t len,
>   			    char **bufpp);
>   	void (*free)(struct etr_buf *etr_buf);


