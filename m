Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144B4D7494F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 04:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E69SEkz/DYZB+spxQIzrekSgQrAuMyhQoKpusug3Ox4=; b=pIJV63At6r3W9tI5Figxlt0f4d
	2+OGEHf21pdXlCLlk6dShLcmIx3k0uTL6Zp6WIUd0Z4Ti0mY6XUal6s1fDTCXP5LS38gnx5edrDDe
	Xetba5HR35W1Nf8QS/TVfhbiHIxq5nrf/ynKKUEeFMv25jIEYIQj09ZdKCnOtAIBnOVgkVijgLyM7
	lg66/wXbuhseYbjjguWcKMd4z8u+C7jg7H2+KcIzIT1e58PEH3wNVJqxv4lxjvQsYTYXibqMbeL7q
	W1ViT/ljNFwDTO6wz3uhqwd6bQLdE+5TiVAkZUTI4ohznq9WdjqjlbRVLfgSGZFvOS9ny4OCdbGYn
	a8EDKPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWSVI-00000009c3b-3W1c;
	Fri, 19 Dec 2025 04:54:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWSVE-00000009c22-3s4I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 04:54:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cFe13319217
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 04:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E69SEkz/DYZB+spxQIzrekSgQrAuMyhQoKpusug3Ox4=; b=S1ws4+eLfRJqFAKI
	pcpXlwRY/97INKVVmX4OnRkkMZI8HuIFobDyJNBOLWRMJi8/I9m0mFM/ZAaOqo6y
	Z4ghEAmYNhlBAeB1xxvvu6wLyToHQvebdeOhhxjwg6IpHxhTtOpyCknzMKIipIov
	4YEze8/tDdsUkG4NM9j/j/yuf2VYFEtT2bOsq5O3N9D6lisiUTwWL9JIoCzY0lXe
	uweHHamDmb2vqEqYV7OZy+oPW6dM0ieyOI6dClIClOlBlDZOmsTaLliUHKP79lqo
	YUxsf2+DPAFYDRCv2sBvFKRIVtEt4bF2UJ/OeG44MFDEb1fkaJgnXSFU8GIs4WHW
	aqzYvA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2es7yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 04:54:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0dabc192eso26467785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 20:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766120047; x=1766724847; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E69SEkz/DYZB+spxQIzrekSgQrAuMyhQoKpusug3Ox4=;
        b=hOsprDrAxlUjl8vAgPdqo+vV6LIc+g793YfwghpSYe0qozNDxTMqqlXwVsnRy6UUel
         8gNX4+YpIjBza1tyPt9phDwLnKssvdUBTRg6JlHVRo4p8IJOUXfFU/CD2nbnY6gWZ7nv
         jyVAjVpm2dVUBT0+2DSx9FPqGdYNYyDM4blCODjkBb77c/WvbxDoEZEfUb0Z4Bxm0oRN
         HNxQHWcilEFXc4YAEQ4NYQxe7LlndYrDV+NswHAeei4V3xJUMDV6OBrPWBlMWLkrqnlz
         yDbOqHXtUknJsL5QrrSXcCBznGGUjy73iiykv/VsmpWuzBcpWYi0n/1Q1YW92vuHtR28
         Zq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766120047; x=1766724847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E69SEkz/DYZB+spxQIzrekSgQrAuMyhQoKpusug3Ox4=;
        b=Mmv0Zz7LOiM2pF9pw286DzrwdByHv+umsEH+lF2s6TY+02cZAXr/OBMd2/8Nyazm4H
         EPVAWA+4M85/Gs66JDz4S3g7hLoGMLjrMYfMBOWMfPHApM4B8/OBwOY7wR4tSeLyvuNM
         s48EQV6OGXh+UZYbVJnc/Zw5l1rMAAg9yge0xI107q3cF561s62UPi0WqnIKNa2MtPOw
         R46cGSEqu4BkTr2FAbu5qC3b3w1jhHGPWNV5BG7KFTjS2S4hUsmDwKECrKii/gdLppJy
         SGJjHrvMiDAQ43ZBv/fHl4qYRChlHMnq4nFemVn5yM4mc71In99/wg6AVhKW97ZTFIHR
         tgcA==
X-Forwarded-Encrypted: i=1; AJvYcCX/7YXoWGSIYuCZYSzwz/TO6540LOu3qAnTS/P+8pdpqeNbLWUGvHz0VLSjjG+2KYdvsIvpyMJQ7lRZ0v6mY50K@lists.infradead.org
X-Gm-Message-State: AOJu0YxcjKkdoGjnVBoftCD6NkoB1leuIxLsNIQOHd8ykYSL5j9RiCLF
	/1JKAQkV5Rz4MOX1uBxxR8LioI4ipoA8wjc+p3yVZa5VhRU5YooTXxddEuFEZPW+WppALi/7KyF
	ZdOD3gIThXFuP+rOzqUQ7O/No/t2/ADWMICMuDsO0159IEAMYJoiBi/2uNXa1KFAGfocFWH6LQK
	eekA==
X-Gm-Gg: AY/fxX47Sdkz1k8XFrSb5Ny4TH2FDrWpEzotqrVl0BccPzMh32zTmr4tOpG2RP1koMI
	pHIOHkdOkrAhnwScexYCPrKUMeZZGcoSonY2fkS84GUW5wtyTp5tK/Aw6uDN4w9hIatBQ5MuCSO
	vk5mmjAluWCTYMiJaYHQZuD5zWGk0FWNkGKiastYMBNELtlxoHvmS9fOIsFmkTuaYrwtGDwf4yB
	dclYy816+mUiPyiUiSzw7i6EHHBxJ9S/zv+cCPbR0ViY3gVWce79opqoP+c4Yn2Sx4tzhmNsj05
	no6bjrqztzKsqYMAG8pbiMn0dC+dut2TuHIWKoAd4nV2JXLZoAhOR24vbYKaRVB8/UtqEVqvn7A
	n3Wlw0IQGu7rp/HVfqBObo7UljXGSIQ6wOW2VVFaT7aqHj+vjdRvmSYlO8O2tFyH5u3bNgeKkSM
	8=
X-Received: by 2002:a17:902:d4cd:b0:2a0:8ca7:69de with SMTP id d9443c01a7336-2a2f2830566mr15711935ad.41.1766120046620;
        Thu, 18 Dec 2025 20:54:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9EBNY3i0W7yCJhG2BhGWLwpwu8RPzL2t7tHEnw5l7nfW9y12f66dJp3K56XgjmdZqvgzt4w==
X-Received: by 2002:a17:902:d4cd:b0:2a0:8ca7:69de with SMTP id d9443c01a7336-2a2f2830566mr15711735ad.41.1766120046045;
        Thu, 18 Dec 2025 20:54:06 -0800 (PST)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82bbesm9029265ad.35.2025.12.18.20.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 20:54:05 -0800 (PST)
Message-ID: <83130e02-4510-41d8-be5c-bbe9ad49dba1@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:53:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
 <20251028-configure_tpda_reg-v4-1-23000805d21d@oss.qualcomm.com>
 <a785ced7-95ae-444b-b8ca-b40aecb35230@arm.com>
 <a95dc8ee-0b65-4ab6-966f-b15c31f6c6dc@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a95dc8ee-0b65-4ab6-966f-b15c31f6c6dc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c0CLr2b0UEwxai4uZogk7q5dc-xIo0Os
X-Proofpoint-ORIG-GUID: c0CLr2b0UEwxai4uZogk7q5dc-xIo0Os
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAzOCBTYWx0ZWRfX4xYZz6n8k9tJ
 QGs1Ko51xHWDtW6w7fzJ0SIClkHk7qAlPX/KAX6F1lkw8nntwr/7aSkeMSFGXqgWcBWHodfskjJ
 57slledcQQlRijeXVq4P2fvaXiBW1cZmHlEllETUjnRoMGNvw6L/ZnmelDxPMZxbw0edcExE3Ls
 otl71l7jK9zHPxNEOfQcS43TxOqEotXoUTz7mo6v5Isz9kIFP7BFBHWHkzrKf0JM2EiNlScn81f
 WQkGWFPrateNJ7M8Ow0WsEHiPYUOnD7VJmxRsz4AmVqf4EWyNCedqeKRBjO4NVyxc7OixGddRlW
 UXwT7nb/vCPP0S3GPUZkgO+Ok++40VwRtU7zQ+HqPDOP+xXBB5f1yylX/2IiP4QE36ENaMRKnOA
 fEno12ZxSsdhwbcTJVi931vNqbHwWbJlBXCSCVnKdMu7Tq+RUMyXSZeLhhjUWkmjcMPm3Tf+tzj
 dFSQQVG110otfCaCoIg==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=6944da6f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=-IRLh56tHnBc2i77m7MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_205409_094960_C05AE822 
X-CRM114-Status: GOOD (  23.77  )
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



On 12/18/2025 7:20 PM, Suzuki K Poulose wrote:
> On 18/12/2025 11:10, Suzuki K Poulose wrote:
>> On 28/10/2025 02:02, Jie Gan wrote:
>>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>
>>> Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
>>> These registers define the characteristics of cross-trigger packets,
>>> including generation frequency and flag values.
>>>
>>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>> Reviewed-by: James Clark <james.clark@linaro.org>
>>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  43 ++++
>>>   drivers/hwtracing/coresight/coresight-tpda.c       | 230 ++++++++++ 
>>> + ++++++++++
>>>   drivers/hwtracing/coresight/coresight-tpda.h       |  27 ++-
>>>   3 files changed, 299 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>> new file mode 100644
>>> index 000000000000..80e4b05a1ab4
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>> @@ -0,0 +1,43 @@
>>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_async_enable
>>> +Date:        October 2025
>>> +KernelVersion:    6.19
>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Enable/disable cross trigger synchronization sequence 
>>> interface.
>>> +
>>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
>>> +Date:        October 2025
>>> +KernelVersion:    6.19
>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Enable/disable cross trigger FLAG packet request 
>>> interface.
>>> +
>>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
>>> +Date:        October 2025
>>> +KernelVersion:    6.19
>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Enable/disable cross trigger FREQ packet request 
>>> interface.
>>> +
>>> +What:        /sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
>>> +Date:        October 2025
>>> +KernelVersion:    6.19
>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Enable/disable the timestamp for all FREQ packets.
>>> +
>>> +What:        /sys/bus/coresight/devices/<tpda-name>/global_flush_req
>>> +Date:        October 2025
>>> +KernelVersion:    6.19
>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Set global (all ports) flush request bit. The bit 
>>> remains set until a
>>> +        global flush request sequence completes.
>>> +
>>> +What:        /sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
>>> +Date:        October 2025
>>> +KernelVersion:    6.19
>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Configure the CMB/MCMB channel mode for all enabled ports.
>>> +        Value 0 means raw channel mapping mode. Value 1 means 
>>> channel pair marking mode.
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>>> hwtracing/coresight/coresight-tpda.c
>>> index 333b3cb23685..a9a27bcc65a1 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>> @@ -147,9 +147,37 @@ static void tpda_enable_pre_port(struct 
>>> tpda_drvdata *drvdata)
>>>       u32 val;
>>>       val = readl_relaxed(drvdata->base + TPDA_CR);
>>> +    val &= ~TPDA_CR_MID;
>>>       val &= ~TPDA_CR_ATID;
>>
>> See, below.
>>
>>>       val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
>>> +    if (drvdata->trig_async)
>>> +        val |= TPDA_CR_SRIE;
>>> +    else
>>> +        val &= ~TPDA_CR_SRIE;
>>> +    if (drvdata->trig_flag_ts)
>>> +        val |= TPDA_CR_FLRIE;
>>> +    else
>>> +        val &= ~TPDA_CR_FLRIE;
>>> +    if (drvdata->trig_freq)
>>> +        val |= TPDA_CR_FRIE;
>>> +    else
>>> +        val &= ~TPDA_CR_FRIE;
>>> +    if (drvdata->freq_ts)
>>> +        val |= TPDA_CR_FREQTS;
>>> +    else
>>> +        val &= ~TPDA_CR_FREQTS;
>>> +    if (drvdata->cmbchan_mode)
>>> +        val |= TPDA_CR_CMBCHANMODE;
>>> +    else
>>> +        val &= ~TPDA_CR_CMBCHANMODE;
>>
>> Could we clear all of the bits that are configurable in one go in the
>> beginning and set the appropriate ones based on the setting ? i.e.:
>>
>> Do we really need to retain any values ? And if not, why not start
>> with a fresh set of values and avoid the read ?
>>
>>>       writel_relaxed(val, drvdata->base + TPDA_CR);
>>> +
>>> +    /*
>>> +     * If FLRIE bit is set, set the master and channel
>>> +     * id as zero
>>> +     */
>>> +    if (drvdata->trig_flag_ts)
>>> +        writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>>>   }
>>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>>> @@ -265,6 +293,206 @@ static const struct coresight_ops tpda_cs_ops = {
>>>       .link_ops    = &tpda_link_ops,
>>>   };
>>> +static ssize_t trig_async_enable_show(struct device *dev,
>>> +                      struct device_attribute *attr,
>>> +                      char *buf)
>>> +{
>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +
>>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
>>> +}
>>> +
>>> +static ssize_t trig_async_enable_store(struct device *dev,
>>> +                       struct device_attribute *attr,
>>> +                       const char *buf,
>>> +                       size_t size)
>>> +{
>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    unsigned long val;
>>> +
>>> +    if (kstrtoul(buf, 0, &val))
>>> +        return -EINVAL;
>>> +
>>> +    guard(spinlock)(&drvdata->spinlock);
>>> +    drvdata->trig_async = !!val;
>>> +
>>
>>
>>
>>> +    return size;
>>> +}
>>> +static DEVICE_ATTR_RW(trig_async_enable);
>>
>> ...
>>
>>> +static DEVICE_ATTR_RW(trig_flag_ts_enable);
>>
>> ...
>>
>>> +static DEVICE_ATTR_RW(trig_freq_enable);
>>
>> ...
>>> +static DEVICE_ATTR_RW(freq_ts_enable);
>>
>> These attribute are boolean and looks like we could save some space on
>> code by using dev_ext_attribute.
>> see tpdm_simple_dataset_rw()/tpdm_simple_dataset_ro() . You could
>>
>> #define TPDA_TRIG_ASYNC        0
>> #define TPDA_TRIG_FLAG_TS     1
>> #define TPDA_TRIG_FREQ        2
>>
>>
>> tpda_trig_sysfs_show/store()
>>
>>   bool *ptr;
>>   switch (eattr->var) {
>>   case TPDA_TRIG_ASYNC:
>>      ptr = &drvdata->trig_async;
>>      break;
>>   case TPDA_TRIG_FLAG_TS:
>>      ptr = &drvdata->trig_flag_ts;
>>      break;
>> ...
>>
>>   }
>>
>>
>>
> 
> -->8--
> 
> Cut here
> 
>>> +
>>> +static ssize_t global_flush_req_show(struct device *dev,
>>> +                     struct device_attribute *attr,
>>> +                     char *buf)
>>> +{
>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    unsigned long val;
>>> +
>>> +    if (!drvdata->csdev->refcnt)
>>> +        return -EINVAL;
>>> +
>>> +    guard(spinlock)(&drvdata->spinlock);
>>> +    CS_UNLOCK(drvdata->base);
>>> +    val = readl_relaxed(drvdata->base + TPDA_CR);
>>> +    CS_LOCK(drvdata->base);
>>> +    /* Only read value for bit 0 */
>>> +    val &= BIT(0);
>>> +
>>> +    return sysfs_emit(buf, "%lu\n", val);
>>> +}
>>> +
>>> +static ssize_t global_flush_req_store(struct device *dev,
>>> +                      struct device_attribute *attr,
>>> +                      const char *buf,
>>> +                      size_t size)
>>> +{
>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    unsigned long val;
>>> +
>>> +    if (kstrtoul(buf, 0, &val))
>>> +        return -EINVAL;
>>> +
>>> +    if (!drvdata->csdev->refcnt || !val)
>>> +        return -EINVAL;
>>> +
>>> +    guard(spinlock)(&drvdata->spinlock);
>>> +    CS_UNLOCK(drvdata->base);
>>> +    val = readl_relaxed(drvdata->base + TPDA_CR);
>>> +    /* Only set bit 0 */
>>> +    val |= BIT(0);
>>
>> What is BIT 0 ? Please document it
>>
>>> +    writel_relaxed(val, drvdata->base + TPDA_CR);
>>> +    CS_LOCK(drvdata->base);
>>> +
>>> +    return size;
>>> +}
> 
> Also this, global_flush_req seems to be a separate change from the rest 
> of the additions in the patch. Why not split it into a separate patch
> with appropriate description of what this is for ?

Hi Suzuki,

global_flush_req is part of the TPDA_CR register, it's the bit0 of the 
register.

I should document it in header file:
/* Cross trigger Global (all ports) flush request bit */
#define TPDA_CR_FLREQ     BIT(0)

We also have below bit that is not in use:
#define TPDA_CR_FREQREQ   BIT(1)

It's frequency request bit, that determines the frequency for generating 
frequency packets.

Thanks,
Jie

> 
> Suzuki


