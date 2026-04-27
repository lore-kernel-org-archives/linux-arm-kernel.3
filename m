Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56165FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 07:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSF93J6G5/0g0jzcBWjwV6lhwpYbylA3GIwtBNzfErQ=; b=Two2DOvbLhpSG2TM3KkPfxtuWW
	P5KBgcoKxA6RxEqo2/dMiCJDnI9vMWNZt1+qXhUn1tMPaqR4QVG4TQSyqtLSg9PggduqdLGdcqKdJ
	x1Lv306ufk1qS0Uh1uyZhisJ54Stel0M/ui8oz49FlthdrmwDhKMaogKt7g6I46LGuLmkcO5dlXQV
	9Azj0M2iZRDIfCdONO+X/+AeBc5YdDilQH+DvmkZFp5K7XDlcCDMNE+xNdIVwtoZ9gc87pbd9sZIK
	HyAeC4fA4mY1/9cIsCZ+xmegATsmsv5jFmTmb3nD3ozO+7hqlVudpLJNlfjbXXV84Ssf3moXvboCC
	4BO9paCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGYi-0000000GONR-0Ggu;
	Mon, 27 Apr 2026 07:39:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGYf-0000000GOMu-3ItB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 07:39:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R6wf4h2982608
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 07:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YSF93J6G5/0g0jzcBWjwV6lhwpYbylA3GIwtBNzfErQ=; b=fDvbdHqMf1/pO/D1
	QOP2xYhcr+zEsdG6Eefd2y4/MS8TTcGwEVQcvWMCBbmpuGi3HFoI35OZ1eGbNx9O
	3o7P24RTPA/h7atSOBWxo917XIM/DQjpBipZUTsL3LMKHpKyfrLIMrO6uC2e2S1s
	91ILCfJZNPMO7G8f4JPO4hSn4zR0QP5ZcZIBlRYobFxmma+pmCOUdDd3nxYdFHLP
	HUtMP4wrcctgLl5BZLgnVOmu9HJnB7lClRiTNk7JmQy+VSZSF2wlObBNNPK+SXRh
	hbzIYFeVspfLdttjpGgyORiyyQrG+ZjmATdElueDSu+F9To99lpT+d1B6j5+bfH5
	M/i6wg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgvuta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 07:39:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bce224720d8so5612958a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 00:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777275548; x=1777880348; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSF93J6G5/0g0jzcBWjwV6lhwpYbylA3GIwtBNzfErQ=;
        b=UiNZ0/h0D4Hmm5IAq9UzvvtFxTCYFMIbA3Tows3MaCV0vS42z7dX2FCa26ko1fGLdX
         UaCj9z2A3pyCWdfxNRqH1fNvPfBor/sYO1QMxt8PZJKhlLNlowFEx4hiAvr9JyePlwN4
         AA9YG1WsX867Zh8KzRe7S2Y30NreB+/yIJ1Z7JPSNJXfvUytfGO5pf6XLhtMM4zJsSe4
         Unzwn4ZVqJpepAg8p5OJB4SbCEED7MkwfOeoEjPlANkA/WLX3Nr4iW72zF4Z/tTgQob2
         F9gmXXyHy7boFUY0AX8sf3P+iqYt+clUjSnyqOfqJAzYWluEWaNcH8KRhAg2p91Xjg0Y
         Bb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777275548; x=1777880348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSF93J6G5/0g0jzcBWjwV6lhwpYbylA3GIwtBNzfErQ=;
        b=NXKN4cB8XfuJ+13lN/Rz4JzYip2xytXuKhxGSZSM86L+qtR2suF+pUbnglqBvOXHic
         RPMw4NpCqNGWVndtJUfVkF8/vIWQum+i6KBH59SA9HjGBjV+1Q8M/evchRsSboLlAxdZ
         2L2niSM5xnCFKd6laoFLlhG8krPjfOvnc9zQgsBLImwzAhqMaAnFFYUC3Ru1BDiVuxmk
         sBV69UCMx+zULyrH3N87CQiu0MtHTQL9QTqEXOfb/jXp/w767vJT+vX4WWaURiQj1fPK
         9+raPCa+NIy1K9VPHFBYlNMtSUMWDj0216MRW+FJHaysYipG7zpPPRZTTEzd7W6xPeJu
         GYMA==
X-Forwarded-Encrypted: i=1; AFNElJ/O3+p2Gbth69WwVbtFde0suDRVhvCaE0kgZCohqM5xthCLBSIQyDBkfsq9OxQ2OI07lhoWbBi7I9lU+ZXblOWD@lists.infradead.org
X-Gm-Message-State: AOJu0YxFHhsjHAx3rGOCF43oc8VyxosCEvbsGJdv4CwINa5fCnlkhm2T
	PL7AfuRsKeWkcRG96m90nA63UkC2gJYxg1bS/1l58Ve9PzqJ5ZZLJuvRfrg4B0EG4eZqocwBWzA
	VHWJ5EEQSUM4zHIkcmhO3uIkbVsAy8D7ezNUTzQHCcRc+gC5zaDneuC4/pjRFjtvP6ZJc8GdvPM
	I8Lw==
X-Gm-Gg: AeBDievFo+rEF9PxkRAEii3v0Pv41vf4CUzlZa78dJI4sCvSijadhbq/1atZLeSQxf0
	J+22vv78Y8XhpXqJdkytKot/jbSxd6eYE8JsWugJ6/0kqM2xy5glbhySc+5c71OQNMq/pY3hA5x
	XYnHVgTIBN43XShqS/upKaYdkuNLDGDQL08BPVRQFjWWlZ20juxy7bF+/sWUnEO8zWSgKHDPfyA
	B87kmNKz4daxwjICnJiDXdOfOtUMRavtKRu7GTnmAHZDZZ/WBy6zjrEYOpVg7Yu28ob2Z1tA9RY
	iZNfCMmEHirtb4X3IyinXceNv8vxyXHBEKQyi73hi5PFw4fyG/U/WXyQZep/ZHvUJuxzrWUy84a
	BEVmjZidM8HRugX/ck4HE4Ouiol7aUYToIsMniw1DJd0OXArkybQ66C2y1/G8lPRVN4mu+BNuhj
	pO5scRgVh7pBWjzRaLrf29
X-Received: by 2002:a05:6a00:2d15:b0:82f:6a87:f75 with SMTP id d2e1a72fcca58-82f8c93e84bmr44502089b3a.33.1777275548174;
        Mon, 27 Apr 2026 00:39:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d15:b0:82f:6a87:f75 with SMTP id d2e1a72fcca58-82f8c93e84bmr44502050b3a.33.1777275547640;
        Mon, 27 Apr 2026 00:39:07 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d2f9asm33111087b3a.19.2026.04.27.00.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 00:39:07 -0700 (PDT)
Message-ID: <337789c5-7311-4613-9daf-915fcae0c6fc@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:39:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-3-23b900a4902f@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260426-extended-cti-v8-3-23b900a4902f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4UD31ZQyx-FiDAX78TBhXQXcWbvYBvJg
X-Proofpoint-ORIG-GUID: 4UD31ZQyx-FiDAX78TBhXQXcWbvYBvJg
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69ef129d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Fi1y-F4gZlMYRSbziuEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA4MCBTYWx0ZWRfX/FV3Jd5ngQWJ
 5l2PQx+DWs+Wy+0/yZssFL3DNldHxV5fsyAcaqNwIOAEQR4sI+CbEP0wRUdNEhnqDKsXViTOLzD
 ukUFG4kE5NW4WKZovNPzvdhCKT3TDIc0oA05JZdllCHs1es9CR0G9W3ZXQ4knGwvVdK57ciw6jD
 uvBd1MdwFF55A5DnLysnkIs4WlATMPi6bPKwMaGtd+ImEdwdOQCCXkfbIQgUxpqao1Dh7REs5xE
 9BouWypevZls34ryvsyEryTGVPlhaK+Mzx6YRP8jF3bttv18ueXL1j5GIBRVczACPVGjzuUgukW
 muCyfDleMXXsnuQtAfDZZyu9I99Mj1FAQpcrz2hzGGwUL8Pfg4XiZpnKgsqTDcsigou/tm8q8q3
 GYBudnlmHm3bBP0LAHi/kSNtsfxb1J7lI6gxHoqAxtMjR7iHcBVQNXHnp9R9gbMW2Uqn/wGfsdL
 OGlZqFdlp8iTJ0WlMZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_003909_846253_00C7CC81 
X-CRM114-Status: GOOD (  35.95  )
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



On 4/26/2026 5:44 PM, Yingchao Deng wrote:
> Qualcomm implements an extended variant of the ARM CoreSight CTI with a
> different register layout and vendor-specific behavior. While the
> programming model remains largely compatible, the register offsets differ
> from the standard ARM CTI and require explicit handling.
> 
> Detect Qualcomm CTIs via the DEVARCH register and record this in the CTI
> driver data. Introduce a small mapping layer to translate standard CTI
> register offsets to Qualcomm-specific offsets, allowing the rest of the
> driver to use a common register access path.
> 
> Additionally, handle a Qualcomm-specific quirk where the CLAIMSET
> register is incorrectly initialized to a non-zero value, which can cause
> tools or drivers to assume the component is already claimed. Clear the
> register during probe to reflect the actual unclaimed state.
> 
> No functional change is intended for standard ARM CTI devices.
> 
> Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-cti-core.c | 28 +++++++++-
>   drivers/hwtracing/coresight/coresight-cti.h      |  4 +-
>   drivers/hwtracing/coresight/qcom-cti.h           | 65 ++++++++++++++++++++++++
>   3 files changed, 95 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index c4cbeb64365b..b1c69a3e9b99 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -21,6 +21,7 @@
>   
>   #include "coresight-priv.h"
>   #include "coresight-cti.h"
> +#include "qcom-cti.h"
>   
>   /*
>    * CTI devices can be associated with a PE, or be connected to CoreSight
> @@ -47,6 +48,10 @@ static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, int reg)
>   	u32 offset = CTI_REG_CLR_NR(reg);
>   	u32 nr = CTI_REG_GET_NR(reg);
>   
> +	/* convert to qcom specific offset */
> +	if (unlikely(drvdata->is_qcom_cti))

I prefer to drop the unlikely here, let the cpu do the branch predictor.

> +		offset = cti_qcom_reg_off(offset);
> +
>   	return drvdata->base + offset + sizeof(u32) * nr;
>   }
>   
> @@ -170,6 +175,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
>   /* DEVID[19:16] - number of CTM channels */
>   #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
>   
> +/* DEVARCH[31:21] - ARCHITECT */
> +#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
> +
>   static int cti_set_default_config(struct device *dev,
>   				  struct cti_drvdata *drvdata)
>   {
> @@ -700,6 +708,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   	struct coresight_desc cti_desc;
>   	struct coresight_platform_data *pdata = NULL;
>   	struct resource *res = &adev->res;
> +	u32 devarch;
>   
>   	/* driver data*/
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -724,6 +733,22 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	raw_spin_lock_init(&drvdata->spinlock);
>   
> +	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
> +	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
> +		drvdata->is_qcom_cti = true;
> +		/*
> +		 * QCOM CTI does not implement Claimtag functionality as
> +		 * per CoreSight specification, but its CLAIMSET register
> +		 * is incorrectly initialized to 0xF. This can mislead
> +		 * tools or drivers into thinking the component is claimed.
> +		 *
> +		 * Reset CLAIMSET to 0 to reflect that no claims are active.
> +		 */
> +		CS_UNLOCK(drvdata->base);
> +		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> +		CS_LOCK(drvdata->base);
> +	}
> +
>   	/* initialise CTI driver config values */
>   	ret = cti_set_default_config(dev, drvdata);
>   	if (ret)
> @@ -780,7 +805,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	/* all done - dec pm refcount */
>   	pm_runtime_put(&adev->dev);
> -	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
> +	dev_info(&drvdata->csdev->dev,
> +		 "%sCTI initialized\n", drvdata->is_qcom_cti ? "QCOM " : "");
>   	return 0;
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index dd1ba44518c4..2598601e7b93 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -55,10 +55,11 @@ struct fwnode_handle;
>   /*
>    * CTI CSSoc 600 has a max of 32 trigger signals per direction.
>    * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
> + * QCOM CTI supports up to 128 trigger signals per direction.
>    * Max of in and out defined in the DEVID register.
>    * - pick up actual number used from .dts parameters if present.
>    */
> -#define CTIINOUTEN_MAX		32
> +#define CTIINOUTEN_MAX		128
>   
>   /*
>    * Encode CTI register offset and register index in one u32:
> @@ -188,6 +189,7 @@ struct cti_drvdata {
>   	raw_spinlock_t spinlock;
>   	struct cti_config config;
>   	struct list_head node;
> +	bool is_qcom_cti;

missed document.

Thanks,
Jie

>   };
>   
>   /*
> diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
> new file mode 100644
> index 000000000000..fd1bf07d7cb4
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/qcom-cti.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _CORESIGHT_QCOM_CTI_H
> +#define _CORESIGHT_QCOM_CTI_H
> +
> +#include "coresight-cti.h"
> +
> +#define ARCHITECT_QCOM 0x477
> +
> +/* CTI programming registers */
> +#define QCOM_CTIINTACK		0x020
> +#define QCOM_CTIAPPSET		0x004
> +#define QCOM_CTIAPPCLEAR	0x008
> +#define QCOM_CTIAPPPULSE	0x00C
> +#define QCOM_CTIINEN		0x400
> +#define QCOM_CTIOUTEN		0x800
> +#define QCOM_CTITRIGINSTATUS	0x040
> +#define QCOM_CTITRIGOUTSTATUS	0x060
> +#define QCOM_CTICHINSTATUS	0x080
> +#define QCOM_CTICHOUTSTATUS	0x084
> +#define QCOM_CTIGATE		0x088
> +#define QCOM_ASICCTL		0x08C
> +/* Integration test registers */
> +#define QCOM_ITCHINACK		0xE70
> +#define QCOM_ITTRIGINACK	0xE80
> +#define QCOM_ITCHOUT		0xE74
> +#define QCOM_ITTRIGOUT		0xEA0
> +#define QCOM_ITCHOUTACK		0xE78
> +#define QCOM_ITTRIGOUTACK	0xEC0
> +#define QCOM_ITCHIN		0xE7C
> +#define QCOM_ITTRIGIN		0xEE0
> +
> +static noinline u32 cti_qcom_reg_off(u32 offset)
> +{
> +	switch (offset) {
> +	case CTIINTACK:		return QCOM_CTIINTACK;
> +	case CTIAPPSET:		return QCOM_CTIAPPSET;
> +	case CTIAPPCLEAR:	return QCOM_CTIAPPCLEAR;
> +	case CTIAPPPULSE:	return QCOM_CTIAPPPULSE;
> +	case CTIINEN:		return QCOM_CTIINEN;
> +	case CTIOUTEN:		return QCOM_CTIOUTEN;
> +	case CTITRIGINSTATUS:	return QCOM_CTITRIGINSTATUS;
> +	case CTITRIGOUTSTATUS:	return QCOM_CTITRIGOUTSTATUS;
> +	case CTICHINSTATUS:	return QCOM_CTICHINSTATUS;
> +	case CTICHOUTSTATUS:	return QCOM_CTICHOUTSTATUS;
> +	case CTIGATE:		return QCOM_CTIGATE;
> +	case ASICCTL:		return QCOM_ASICCTL;
> +	case ITCHINACK:		return QCOM_ITCHINACK;
> +	case ITTRIGINACK:	return QCOM_ITTRIGINACK;
> +	case ITCHOUT:		return QCOM_ITCHOUT;
> +	case ITTRIGOUT:		return QCOM_ITTRIGOUT;
> +	case ITCHOUTACK:	return QCOM_ITCHOUTACK;
> +	case ITTRIGOUTACK:	return QCOM_ITTRIGOUTACK;
> +	case ITCHIN:		return QCOM_ITCHIN;
> +	case ITTRIGIN:		return QCOM_ITTRIGIN;
> +
> +	default:
> +		return offset;
> +	}
> +}
> +
> +#endif  /* _CORESIGHT_QCOM_CTI_H */
> 


