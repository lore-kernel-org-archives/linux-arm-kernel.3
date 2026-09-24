Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1A9C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zZceZgWFQ3ZLDRQVIpqHYrcnvzmelr0JdvwQT4DK6A=; b=rgMnqVb22VztuwHTHls8mghUmq
	61eWDbTXOa8RPESN6fKzEn0+jKD9OzDDCNw7PjWexuZCp+DMXxZLIAWTgayKpO0D98UuiSSevpIv4
	yOtOpWV5peV8Gp7pzT736mPukPS+yP3bz7Zt5b9w5VDqz6xShJDD2I0XRUE3cqRh8oO6fA/+bmhCt
	Vbl5Hoa9Xs5cVuKqy7X+iGx0Aj3kkQ7cFasl7Qc6ytwiUhLnH3AvPUih3sikSIuZjsra0bK1csszw
	zBupW5+cYPsNDi1V4pKOPEDMU/6xvSrYs7aJmebIR8B5MFxoQO/MT8q7OSMQA+xrN0Q+EriSYgzVY
	Un5kkcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rnq-0000000CH5o-0m3r;
	Thu, 24 Sep 2026 22:20:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rnn-0000000CH5T-3JQQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:20:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdZV42295182
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zZceZgWFQ3ZLDRQVIpqHYrcnvzmelr0JdvwQT4DK6A=; b=HrdbwMeIqm0nSjmN
	zCT4rY+9fjyOwZnb86hfmPeEx0yFmklUtVf2lzQL3djhfocyVLQPPLI4CTBUDgdv
	A+VIqqMUH5lo5eRQhxff+UQFhsGBr8lWbb3+8x+JRR++mjoBxqBZMyBeimadoZ+1
	9omb1qw4EQGcMJeHkkaO/jfpEHS5LPuw2yEw9TEPzsXbEvmjFf0tCHrTHXxJK09s
	EooV/JiZdiyFnqdFfbQLyTwyJw+RWyzmgHrG7IpO/MWKN07vrUGdxSUPwKrZVq8d
	tbbsm+RlLcKJf7XVMApEI+82DzfaCCejMFFBCBQ4xmvI9QGWQr3BFno4sqODbhPk
	URo0hA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94k8rpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:20:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3284bbaa89dso932830eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 15:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790288425; x=1790893225; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4zZceZgWFQ3ZLDRQVIpqHYrcnvzmelr0JdvwQT4DK6A=;
        b=Qh01jGi2ztZecMMMBpxuKUA38By/msF6NOMYOrORsKSPu33GDC6iLDcLypT19wF5vE
         rxf+eOx0qxOxNA8KuUPRxgLjuehfNWg3UCYJf8Hg/PZFJbhlOiBEFOYXPpPKBghoLAAU
         fSmZe1oA+/z+0s/83zLnZBnyr33x5Qf50TuW6xPCS6IVTEMBBvgq2U35M0zOpb3xfg+d
         noJ6AB3ylQrH5xEVo4sdUlIwYDLcCKzkyCb0rHvILPIUw2RnIVXi0kP/xJVxymXhq4KJ
         iKarYQUHbMWHOaRLGeIcrwjwP9546yXaeTeVaadWhdLj/c9CtEM6u/UcmnEulZ3l2L9B
         HyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790288425; x=1790893225;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zZceZgWFQ3ZLDRQVIpqHYrcnvzmelr0JdvwQT4DK6A=;
        b=GYx9RZ7YfD/S2Oh0BYREjWAYSMJV59gzEUNXg8fxPuZV+vwPzO2PCJP73OrszY9iW6
         kX20+gh2kRTRCgSW+0yrrMJAT6ykpC4Z6fWxfMPCthogoJluU1BzvP9V0+2lc5haJNTN
         slz0HeSwfxBk2HevM+EekKm+G9BACVs3R4fwD9K9Tv9YCjt00Vq3vfyq9PvJ16NnTHT3
         vLPhpufW6SVpxnl+N/IyaAEGlSDDZ8l9LX/NJcYFXStu2C0HIH/cQjfZv2h3Txzag+oq
         RElO+HBLiGmtI8lhnBIgZBJRW/q3OawH+dLNSihf0IgktaUyRu/DoRYQYaYupLuAjkAs
         nqjg==
X-Forwarded-Encrypted: i=1; AKwUvBx897wcpYwmctVGdiRNX+6JRdPtMzYJNk0NTlcFfRz0lQCGbbCIi+44kw0OBWNpP0iz/GgYvpSVqnc0cHmKGs/T@lists.infradead.org
X-Gm-Message-State: AFuF++ldWGVzxa6N3X23rUqIPA4Dv+hqqTZAGXBtUQcQ+brygCbRsXlz
	hfsIKSOPkHCGL1t34dOpFp1Eev0Ev3nDb3VChq8cImNdSghrDbooPe5hZVs4taZr2GZODcshikG
	GgTseYX7PxExCOPH6uT40iTJwx33D8VW4qvWqURpIALQhid/QCYIEDfM0vvijqqCWK5VieAQ9n7
	gh0/QVxOJkSg==
X-Gm-Gg: AYBFou0P7FpVn2Wz9Z6n66cownya3uTkhomyshyFOwOjFpW4Wq9wigeTlewyw77ausT
	tkAYCdBLb1E/9IjxK8PQRfVAkoNGDgyn31E5wk4pFmwjPyqBpz6gm948Lzib3a6zJiRpFzjTrj4
	n4Jh5ajiEaQNMhuEyNc80Mwc1hopZ6C/oADR3SuZq6X0QWqGpXRWe5Msb5OhBnRpTyoqsJhote5
	MNmItKxikd9C5lwNxxfc3R4yZ4EkfW54BA9pV7Ged59/npXUY9JKYMHyGMX3akScOxT64mCzXOn
	9AMv0d8Bu3AU68zl8sh2XxSXSpjxsvljR5qQcx8kA42iJGyZQ4GgQvPc4YB1iVqokPsB6RkWTOy
	7WJMYU4o/pS50qY0mApYrxbhVF07UUToDL3uzENpAjolfGySVlExylQ==
X-Received: by 2002:a05:7300:cf90:b0:339:7b3b:236d with SMTP id 5a478bee46e88-34001f081bcmr3059381eec.15.1790288425238;
        Thu, 24 Sep 2026 15:20:25 -0700 (PDT)
X-Received: by 2002:a05:7300:cf90:b0:339:7b3b:236d with SMTP id 5a478bee46e88-34001f081bcmr3059364eec.15.1790288424751;
        Thu, 24 Sep 2026 15:20:24 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c166cfsm1343887eec.28.2026.09.24.15.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:20:24 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:20:17 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma
 <ritwick.sharma@arm.com>,
        Gavin Shan <gshan@redhat.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 08/13] arm_mpam: propagate MSC access errors for
 interrupt control
Message-ID: <20260924152017.00004ec8@oss.qualcomm.com>
In-Reply-To: <20260924152739.2865510-9-andre.przywara@arm.com>
References: <20260924152739.2865510-1-andre.przywara@arm.com>
	<20260924152739.2865510-9-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab5a22a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=BicPeEsDMmYJQF04euIA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: EXSFdn6OQ95D6wEboKv5HYt2ggdZGuMF
X-Proofpoint-ORIG-GUID: EXSFdn6OQ95D6wEboKv5HYt2ggdZGuMF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MSBTYWx0ZWRfX7GyLoetHYXyX
 eeYy9y96Lnw7uRbnDT3UeRtImc9TuRpBblVdMnI0eS3ZCqflhJFGt1Z6CLvIYS5nHsKBZffS828
 1yopvQ8NOmadrHEXn8jbP4TF3/Z6btTvQVvXW4DXuGg9+eU7WjR5QM50M3EywngL7KjLWQlrJ/q
 xLq35LGAbfWyIxqXpe9DboyDyR0XgRfPlbgQWLqgG4MEylVhb8SRR3SaYgt9coBnO2i6JAlnOO9
 ZKrnn/6whoSc71kNA7d5USHoWAk2Q83lUnDRb4w6DQGpXi+yjcNcODNufdlLR8ZupPesDeYEDCs
 XkLGwtu1lZlNO+5VPXflXaCQPB4Zq15e5BJKus4pVPzw6U6MSyhrnzRxD8mAcWio9lrPQ+raKu+
 5wr6moBhL5zo/VZX6UcFt+KGv0h29t1zZqGZeAv3YWD6w7ppbKe5yaYjZLjdIRFrW4h8Md6nLIr
 hNscDG3a9FS5KfdeaZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MSBTYWx0ZWRfX8LtiSZ4aY1Ex
 XxB+d4sQ38l0NINWkkDo6ITDCQ+DAg4Ilh6fDioZ1O8+l4OyF+1Wsb7OTi/nfN4+6yc3Y2eOq/k
 WR6yTyCheHeHtLX1RTfasAjvoO1EWXo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_152027_851684_CDC02D2F 
X-CRM114-Status: GOOD (  28.63  )
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

On Thu, 24 Sep 2026 17:27:34 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the functions dealing with interrupt registration and enablement
> to check for and return errors, and propagate MSC read and write errors
> from the lower level up.
> This does not cover the IRQ handler yet, as this needs some more
> attention.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

A few trivial things below.  Anyhow, I don't really care about them so

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/resctrl/mpam_devices.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 558efab75f911..eb26c25b9f970 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1105,7 +1105,9 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  	}
>  
>  	/* Clear any stale errors */
> -	mpam_msc_clear_esr(msc);
> +	ret = mpam_msc_clear_esr(msc);
> +	if (ret)
> +		return ret;
>  
>  	spin_lock(&partid_max_lock);
>  	mpam_partid_max = min(mpam_partid_max, msc->partid_max);
> @@ -2668,9 +2670,7 @@ static int mpam_enable_msc_ecr(void *_msc)
>  {
>  	struct mpam_msc *msc = _msc;
>  
> -	__mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
> -
> -	return 0;
> +	return __mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
>  }
>  
>  /* This can run in mpam_disable(), and the interrupt handler on the same CPU */
> @@ -2678,9 +2678,7 @@ static int mpam_disable_msc_ecr(void *_msc)
>  {
>  	struct mpam_msc *msc = _msc;
>  
> -	__mpam_write_reg(msc, MPAMF_ECR, 0);
> -
> -	return 0;
> +	return __mpam_write_reg(msc, MPAMF_ECR, 0);
>  }
>  
>  static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
> @@ -2777,11 +2775,13 @@ static int mpam_register_irqs(void)
>  				return err;
>  		}
>  
> -		mutex_lock(&msc->error_irq_lock);
> -		msc->error_irq_req = true;
> -		mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> -		msc->error_irq_hw_enabled = true;
> -		mutex_unlock(&msc->error_irq_lock);
> +		scoped_guard(mutex, &msc->error_irq_lock) {
> +			msc->error_irq_req = true;
> +			err = mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> +			if (err)
> +				return err;
> +			msc->error_irq_hw_enabled = true;
> +		}

Scope ends here so unless something else gets added in later patches, you
could just use a guard() and reduce the noise.

>  	}
>  
>  	return 0;
> @@ -2800,10 +2800,10 @@ static void mpam_unregister_irqs(void)
>  		if (irq <= 0)
>  			continue;
>  
> -		mutex_lock(&msc->error_irq_lock);

Given you don't return early as a result this is an unrelated change. I don't
really mind but in ideal world would be a separate patch.

> +		guard(mutex)(&msc->error_irq_lock);
>  		if (msc->error_irq_hw_enabled) {
> -			mpam_touch_msc(msc, mpam_disable_msc_ecr, msc);
> -			msc->error_irq_hw_enabled = false;
> +			if (!mpam_touch_msc(msc, mpam_disable_msc_ecr, msc))
> +				msc->error_irq_hw_enabled = false;
>  		}
>  
>  		if (msc->error_irq_req) {
> @@ -2815,7 +2815,6 @@ static void mpam_unregister_irqs(void)
>  			}
>  			msc->error_irq_req = false;
>  		}
> -		mutex_unlock(&msc->error_irq_lock);
>  	}
>  }
>  


