Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE87DF588C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fO6Bv48GlQW/gZ/cujzOgLlpdMteDsrc0v7DT/6Qj+Q=; b=QGne9mmSkDD8aUIx5ghYDjKjlN
	eqWK5e61qzGERLgbhTUkNK6jXcCWj+bctr3CHX3Dm6ZaEUxGOLDkX4t4vMWIx1OSDli7qsipf39R2
	kpvG7f/5jGz3U1CI6tBzQ750kaV8NMFpEvQhvMDPPiM19yaY1+wLiUAS0V6PTh3l9N77QyuZ3/n5e
	D2FPxid8OZ70T3neQ3bYm91CtLSUXdPK+mBDt3nAe2vFVcdDCZw79o6jWaoMjWFNfPG+lnCSHZ5fV
	j1U/QNF3N40MWyIskeOfiumbFh+w9QTnFZwnCKPYqkC4l4/ZTxkSptbC7Mf4jFd0eBwOta7KjxwBI
	j62IZtgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoh4-000000071ob-3Koo;
	Mon, 20 Apr 2026 13:29:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoh1-000000071lM-3fsu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:29:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KCxJGR3455879
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 13:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fO6Bv48GlQW/gZ/cujzOgLlpdMteDsrc0v7DT/6Qj+Q=; b=eqFmSSkNLdnqkFvo
	aVaADt1cwOCjtltureMzK+4Bwx0NCa1vP4tnB4xxDm3DJXoGbSiMia9wMTt9+JSF
	Ou5VYJfNCmI63gRZHzNUfiIrmKsuqVuuq07GwcHfAKX/I3sJ8/L3f11M5f+TbK0S
	j/TdN7eRiG8IyUUGX4Li/cKuV6YH/bsmjxA0n8MCFd2oBFD8MYOTPdOy/GiGzFG1
	5EodhUF6iUV64YaSP0rBmgckn9pV+++obLZXURolL/j8eUV++n3De8iy6NN12+KP
	i78sEuVhZzJ7GQJq8UO9AW4uf0ucFwMfeswQK74Ab9pjawyGqrVe5OcA9Fm0S+sq
	IIEAfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjseg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 13:29:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35e5791871fso5807658a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776691778; x=1777296578; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fO6Bv48GlQW/gZ/cujzOgLlpdMteDsrc0v7DT/6Qj+Q=;
        b=Bibjne/1gDRMNIMEXvgAH8p47myp+HKSHZ2AZaCInhZb85SLgsoeLJwPCV824thnsX
         RAd3+E7vNDgH6SYSCMJuljsB2VGzBNlBouPm32J5RuNqiErxqan7mQcvf9BDOY5i6ij+
         VDYU/xYsL8yaSNomgW0MG3CpMNqXifqbpt0Mjp+Ktc0hFqZl/hRPLMwCZhZdA94+ghQV
         lVbZGVb+PO+s1itR1UgdlVYs7SFQRToWuIfp4ut3KmyYMo+FQHBpJn0cejj5wJm2wVm1
         zgNaUys+VoSBLxn0m7N5UiCwXRQtjfgaiMcJOShhavXPlJSEzYefB+7Ces0ihVIzmjxN
         6Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776691778; x=1777296578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fO6Bv48GlQW/gZ/cujzOgLlpdMteDsrc0v7DT/6Qj+Q=;
        b=i1s+Vl2KObr3yXqJpMFohpNjel63l8N4UaLcOlV7D6Ny0QQs9TTiCoPLgSI7Mvbehe
         uY1akjqMlW5BwNF+A2fnCmZJF+KxL7HDM2nl5Mw+yXhNhvlryHKhydZNaeYs5OwTxiqw
         KqLzcglXRZJaFLIbRp64pkmqt9G8QnznxU7PatS1a+Tm34S2MIX1W96VCN8zbpAnsDOu
         HA+9G4Fxu0LGDPQ3CeAdAfqFJpgGkBpavFxqpNxNjpTrI+epbGkfFIB8vzq2cGPghTjj
         2Jg33dKFDrribhrnFRFfHFuepzXTIFSXtc+8KlxcxJT+YDZaRIZbArUFVjJgDJX/ql18
         jpkg==
X-Forwarded-Encrypted: i=1; AFNElJ92g1CBeOh52rE8I+CoeSNvOkOM+Q39Ld5jzF8lSDo19PAreWF9v1awvcozXB524yFCUZ/GaxhYz9DMQtC5AOrk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf9vENkDZGpvxnFzAwv73Ixx00TTnf1v58tELf9PMtV3hzYrYC
	0Ki+kNgI9evkthVXAqIyXthd7YDrLDWzbC44EawHl2qf6D7kJGB5WHZjcEpFr6Do6qwY9xNieUs
	cJTf7goHS2iHVGR0qQqsPf6OaIt8rxnRrcSZXYuWXNKX/XQRgjg6SgwfjceLzcz4cmBt/qgePt4
	xK7BJEMo7VtWzq
X-Gm-Gg: AeBDiets8mPDzajXkoscf2ky6Yxe+2QlbeG1syyXsNDHqxWSJhrGEMVgF09n+oXSk0O
	eiZyWx48wbR2/6h3ol4O6CQa0RJPtMyvVEZ3HLww5z26aBRUPt0L4QiDKNYOyDOv+mupZTt70J1
	RBJEaxeQvUR4SfTYVhdj8zHVaTymQkHXEvfxxNVzuoEqpDCiuJ8a41dCDnJdR2ZLnVbAlnN28Av
	fz5corOpjtCaBjanYrTVhdOt2LAKMFBKicZcTpTe4aViTYQ8eonmyejGAL1ysb9vneGFaPONXbI
	WUSU1fofpGs49Vw3kIShrXDKcAL24fdtNWMKDdHvhzJd8MNfQpSkwntcr6r7OZlQq3dENWzFzPG
	m0Wvtf2BWhCc/72R6AeHWECKYfWyPoCsGBiR6H1p4v9/yJk+jQX0sKl7pqDtGShcQaTOD6YbnND
	DIj7DKSOcyNhKynlRVIHgl
X-Received: by 2002:a17:90b:1642:b0:35f:b107:f1ae with SMTP id 98e67ed59e1d1-361403adbcfmr13890628a91.4.1776691777593;
        Mon, 20 Apr 2026 06:29:37 -0700 (PDT)
X-Received: by 2002:a17:90b:1642:b0:35f:b107:f1ae with SMTP id 98e67ed59e1d1-361403adbcfmr13890573a91.4.1776691777015;
        Mon, 20 Apr 2026 06:29:37 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fe07c7sm10502749a91.5.2026.04.20.06.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 06:29:36 -0700 (PDT)
Message-ID: <488faf07-3d22-49f5-af7c-cd27d9bc87ec@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:29:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 7/7] qcom-tgu: Add reset node to initialize
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <20260417073336.2712426-8-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260417073336.2712426-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sb7_WTSjWEVmKCYW2zQov8T50NtAUWDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEzMSBTYWx0ZWRfXzUrVA7L+ubLZ
 /J1GECxd2cPmajWNHsWtXBLY71+DScgH7ELkePtMxfc+YYE1jNR0yuaimyB/JyVGOO7o0HiTR0p
 3JC94o8CtDfNgTeBNXHHr5pjmc+VYf0DkBT1aiyXb+tfA+SQAUVOLtx2swuLiZVgiZ5rp5D+p1P
 Lgj4Z3ZNoaaZUy2zlwMxHl7K+evkgOUbkpGxBKaTng8g9lB8txzJM7qNLbxqfTRivh29igHNukh
 xWot+mKZvKekwdC+S5kEZEKrM1e3yxgCBnGKyqXMbSLHcf7cPKvzpVdFUt7HAM7nTj3SMHQO9gD
 RNXB3bAAIu4BP1yTui/EGwYWkSgEj0ucXbPGvHZhoQtj8V8hKOuX0K0vN5sIN+I+aELF9NSG+VC
 jEQnSA70dshlw5KiT1UaR0DvJRsoyLgMGKXodQhAvsEKZ3RHlNfCuL0Fvr+cW44i5pJMhySDg5a
 5uqjxYf69Z4j7qw2qLA==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e62a42 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XEOHbNyQ1_GqabX02WAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: sb7_WTSjWEVmKCYW2zQov8T50NtAUWDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_062940_101749_4B79C126 
X-CRM114-Status: GOOD (  22.87  )
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



On 4/17/2026 3:33 PM, Songwei Chai wrote:
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes.
> 

LGTM.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>   drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
>   2 files changed, 81 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 7a3573e03e27..a6b6019c8ef1 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -42,3 +42,10 @@ KernelVersion:	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the counter value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(Write) Write 1 to reset the dataset for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 6d5bf2621cb0..9fb51f2a912f 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -420,8 +420,82 @@ static ssize_t enable_tgu_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(enable_tgu);
>   
> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
> +static ssize_t reset_tgu_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct value_table *vt = drvdata->value_table;
> +	u32 *cond_decode = drvdata->value_table->condition_decode;
> +	unsigned long value;
> +	int i, j, ret;
> +
> +	if (kstrtoul(buf, 0, &value) || value != 1)
> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->lock);
> +	if (!drvdata->enabled) {
> +		spin_unlock(&drvdata->lock);
> +		ret = pm_runtime_resume_and_get(drvdata->dev);
> +		if (ret)
> +			return ret;
> +		spin_lock(&drvdata->lock);
> +	}
> +
> +	tgu_do_disable(drvdata);
> +
> +	if (vt->priority) {
> +		size_t size = MAX_PRIORITY * drvdata->num_step *
> +				drvdata->num_reg * sizeof(unsigned int);
> +		memset(vt->priority, 0, size);
> +	}
> +
> +	if (vt->condition_decode) {
> +		size_t size = drvdata->num_condition_decode *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_decode, 0, size);
> +	}
> +
> +	/* Initialize all condition registers to NOT(value=0x1000000) */
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_decode; j++) {
> +			cond_decode[calculate_array_location(drvdata, i,
> +			TGU_CONDITION_DECODE, j)] = 0x1000000;
> +		}
> +	}
> +
> +	if (vt->condition_select) {
> +		size_t size = drvdata->num_condition_select *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_select, 0, size);
> +	}
> +
> +	if (vt->timer) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_timer) *
> +				sizeof(unsigned int);
> +		memset(vt->timer, 0, size);
> +	}
> +
> +	if (vt->counter) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_counter) *
> +			      sizeof(unsigned int);
> +		memset(vt->counter, 0, size);
> +	}
> +
> +	spin_unlock(&drvdata->lock);
> +
> +	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
> +
> +	pm_runtime_put(drvdata->dev);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_WO(reset_tgu);
> +
>   static struct attribute *tgu_common_attrs[] = {
>   	&dev_attr_enable_tgu.attr,
> +	&dev_attr_reset_tgu.attr,
>   	NULL,
>   };
>   


