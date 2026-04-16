Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC02F88089
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 07:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8/xrLMEPrFTyOnKmdKqD3eyRWqDsad4satL3wX9Vpg=; b=jbjRj4N+HVqqEUTcQ7B8Q9A7Pp
	X92KHSNlAOOWDjLrOSjKm4tKN306sZqisrowbZut26DJhnSlwyEwRIlW0GrRU6GxxRW4udS4V5smA
	V1eRdbn9AwWaaQ2qTSlS/Pmi9K5KcnWFLkvwEo5ysNZosGN7QzD9JNFltB4WvfSRHX7C6mNKD5V4d
	xTNSSmyTsNv7hgKS6lqyn/C4tMlFFbAMZ0b8hQLHyPhR7rZ4QbEJH28DMqAxL5V1p2/yOMFRJ/xiZ
	XL525fd45LH08DBtb706Z3Ct4egpIwLoBd1dlC4tnD+I/utWmHk8EKHzYp8i/OeOfo9gPMXFnb4Xx
	tEnB8Ang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDH1l-000000026bB-29Fb;
	Thu, 16 Apr 2026 07:20:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDH1i-000000026a7-1wYZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 07:20:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6ohbp218870
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 07:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8/xrLMEPrFTyOnKmdKqD3eyRWqDsad4satL3wX9Vpg=; b=MmQP+JNtM35tQloT
	IbR0omuBbOc6EDQiWyZiSf/+PnAPCUicaO3s/kg4/r/HEfnk4UdBBYIeii3PMlOQ
	QA3/UPZKia9MzwcDfuwFWhpSHr3Q/+wbpcas+comoIcIRR40FDLp6ysiJRmblSPJ
	N4OezGEHwmP01ia0MOuRt5VaL3HvbSXcGFEZkpZYr/hhNX9d5uptEZdvyMNdF2CU
	NPTXV6/T2QG60+ZlVrDted6QRtgvHwtUda8frRgr13XM8PzEmkPQCX8pA/vrzYaQ
	masSGZIhLIv8FsmKcR7HAM+zl+tQ9wqtdUTkSrWIO70lYD3A6yBVySwSTqJ+bRwh
	Fyi/CA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtuyg3he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 07:20:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82ce34a78edso7945694b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 00:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776324036; x=1776928836; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U8/xrLMEPrFTyOnKmdKqD3eyRWqDsad4satL3wX9Vpg=;
        b=UL4qQazIPuG3Ue/mbI1aGE2b6M2IsA+cksmRfTrEqWNtLkBg2sLNwDGUcMxy7deMfN
         nCubGm8B6y4LDOu8u60KdhQAvS8W0MOFakvxyvs8CJ1AKKbmLMdkHRTYsxYIBhBAaGOW
         6TdRlXrpnRxp1acE/1iLKsVFCSvjXlSDeeJ0z8MwcxuKufXj3r/FXck9QT5dTqMws0Tz
         LrN24Es/Bzqo8GDd5qKKN7r6CD8MKtM23x00cdu3Aj0oGLGUEXqZtaKekx1VmbWVECZ5
         hSa95dLjoiiYYGkCW+Xf5u9dkJtyWp8bpb5TPs4utPoEdbH94F2G4QXLBZVDWuiujxqz
         vVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776324036; x=1776928836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8/xrLMEPrFTyOnKmdKqD3eyRWqDsad4satL3wX9Vpg=;
        b=sZRu4CGj+GDrvHR4L/axot1mrQLupkgfVJ9n9aZjUVTJ+Y6oJ1Bzjxp3TC+AOTUcts
         ZNNW5+a77sZXHTQVlCg6XPZGkF3ekMbWHqQsWRD7mX6HbDTeewS5CvKjBdKCJcLLGyDw
         qRB1QGtrZ7ArJIMx752zYlpyCe09THZOHFyho7/CPRZxQR22NtPTO8S1rr0TzgapCwJQ
         ZVjB4JMs4FAUAFkUcXxZUJ42d2BAagGu3y54cZDA6VbpxctuegYWXg4W2l8y34/nYbU4
         UcnLhlVGri+hMwObVHdE4punaB5XClD9U5V413HKvo9G+gimAvuI0G9ebYxPfR+1S2GX
         uUaw==
X-Forwarded-Encrypted: i=1; AFNElJ/1b6ZS1666kf3bUXV/upLILeWt7APrtL8MtEfH8AdwUXxhkQwh0pO+igS62ZNqym4CDXpuO89+cJK6a3wQluML@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/ngnxsghsLwTaap2oVytjOYTl0S131FnPCfK7pz3Q/+p1GUHA
	QPqFIRYWiDvY+6F6NxMAFBKCPt/NDZkDrOdkutSiKHGF2tx2jJZV4kcTwAHdoWvII1IDXY9SS/i
	qtVoD60Zd71fHWmPPObMPCrviy7Gl2f4YLqzesG6zVJWnLQR5c2YIDijxFXHjXV1qVU+d2vWOyB
	/7Cw==
X-Gm-Gg: AeBDieuFLcm+ecjIX8G9fNk/+rernbGNuT0LGqlTKIMBllHvOoQlkrI4fUU5LMAaOTf
	ydJviukcMytJ5jWTqNluze2Bd0DpmmYti4P80tVIlKPV38o4v1okFsAJNNWEJ5jC6VyLL1+WxQl
	N8V9VR9iWh8gumiXORdXTBjV5l5Ko6NIG8yjNfJ5Ai+J1op7iYXfMr1t9shvIqTPW7adbEcNKt1
	n/pJUwNs9foNAh/ZQt5sZymp8CyYWKJNr7DVRcsnVBvRAilBuoWiXHUVlcnNy+tBScQHU10Rbhp
	ZtGDWSxGmnVSIFpa54dOGqgMt2o1UgSiLJU0EfoCVIwOF4gjFW9lUCpCS6SU13Y1KwrhtitxfCY
	X+wFgHzRClV6ZaaxxIVYCyWFpibIFSDD4qDVFK+VWxGty/+81tMvfq+ra1FCc6TkKSLDaWFHYc8
	W6s6VbI/Cp/IQ=
X-Received: by 2002:a05:6a00:1823:b0:82f:6b64:1b0d with SMTP id d2e1a72fcca58-82f6b641f7dmr5017241b3a.17.1776324036103;
        Thu, 16 Apr 2026 00:20:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1823:b0:82f:6b64:1b0d with SMTP id d2e1a72fcca58-82f6b641f7dmr5017185b3a.17.1776324035493;
        Thu, 16 Apr 2026 00:20:35 -0700 (PDT)
Received: from [10.133.33.185] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f74c3b680sm2417829b3a.41.2026.04.16.00.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 00:20:35 -0700 (PDT)
Message-ID: <750c7a05-76a3-4992-a539-fb3c41b56ec7@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:20:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] coresight: etm4x: exclude ss_status from
 drvdata->config
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
        mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-5-yeoreum.yun@arm.com>
 <778a826b-918d-4f7c-95a9-1cdb013618d8@oss.qualcomm.com>
 <aeCHnToKG43oKQNF@e129823.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <aeCHnToKG43oKQNF@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA2OCBTYWx0ZWRfX2jyqZoB6jeOw
 MwxM/JHTZFOFzSrKOtUuiUnOyvV/jbC+t/mOky1JDbAtqZ25HmsZmKCFVEQRXu39ZZ2ri7jwkL1
 0SA/P8VDPYHMpgbWmip8o/nzbo7pUG1+glvbZNheVUMkOJc2mBPg8E+AFrbwBDXB6n9gurOFuRP
 V9Mszt6gV06tNiCK889X2ZMv4C8uWzo5vt5O/V+TNSW6tJ8UAAP61dyAfxUm98tzVpuDLzroZ9D
 LEu+dIVG22ea+7T1lLBNdcnKCTF+xyUsint+vBPeQFCZGdQC81hG7JhIjgaeMjZEEAwm26DroxZ
 9U41N54Pzmn0qgBCmE1qMGe1o87+15LWXrEijKJT84zo1qg509jATjgzHrLR605SFUru8N4PAox
 t8aBK2aJvPTMzRDaw0V0hbSVHhhTPS+dgClNGpy1FDlRrF5otRvAvMVmLfRRNvfKUAllcz7FegT
 jXW9Cwhj0hg4u0I/KDg==
X-Proofpoint-ORIG-GUID: iWoZZbNRkhuyqQXAechRYfBdMPhxunMK
X-Authority-Analysis: v=2.4 cv=Ipgutr/g c=1 sm=1 tr=0 ts=69e08dc5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=eToclKRzwCUNLeFNS-YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iWoZZbNRkhuyqQXAechRYfBdMPhxunMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_002038_646593_C00F2439 
X-CRM114-Status: GOOD (  28.85  )
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



On 4/16/2026 2:54 PM, Yeoreum Yun wrote:
> Hi Jie,
> 

Hi Yeoreum,

>>
>>
>> On 4/16/2026 12:55 AM, Yeoreum Yun wrote:
>>> The purpose of TRCSSCSRn register is to show status of
>>> the corresponding Single-shot Comparator Control and input supports.
>>> That means writable field's purpose for reset or restore from idle status
>>> not for configuration.
>>>
>>> Therefore, exclude ss_status from drvdata->config, move it to etm4x_caps
>>> and rename it to ss_smp.
>>>
>>> This includes remove TRCSSCRn from configurable item and
>>> remove saving in etm4_disable_hw().
>>>
>>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>> ---
>>>    .../hwtracing/coresight/coresight-etm4x-cfg.c |  1 -
>>>    .../coresight/coresight-etm4x-core.c          | 19 ++++++-------------
>>>    .../coresight/coresight-etm4x-sysfs.c         |  7 ++-----
>>>    drivers/hwtracing/coresight/coresight-etm4x.h |  7 ++++++-
>>>    4 files changed, 14 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
>>> index c302072b293a..d14d7c8a23e5 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
>>> @@ -86,7 +86,6 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
>>>    		off_mask =  (offset & GENMASK(11, 5));
>>>    		do {
>>>    			CHECKREGIDX(TRCSSCCRn(0), ss_ctrl, idx, off_mask);
>>> -			CHECKREGIDX(TRCSSCSRn(0), ss_status, idx, off_mask);
>>>    			CHECKREGIDX(TRCSSPCICRn(0), ss_pe_cmp, idx, off_mask);
>>>    		} while (0);
>>>    	} else if ((offset >= TRCCIDCVRn(0)) && (offset <= TRCVMIDCVRn(7))) {
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> index b2b092a76eb5..f55338a4989d 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> @@ -91,7 +91,7 @@ static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
>>>    	const struct etmv4_caps *caps = &drvdata->caps;
>>>    	return (n < caps->nr_ss_cmp) && caps->nr_pe_cmp &&
>>> -	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
>>> +	       (caps->ss_cmp[n] & TRCSSCSRn_PC);
>>>    }
>>>    u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
>>> @@ -573,11 +573,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>>>    		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>>>    	for (i = 0; i < caps->nr_ss_cmp; i++) {
>>> -		/* always clear status bit on restart if using single-shot */
>>> -		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
>>> -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
>>>    		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
>>> -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
>>> +		/* always clear status and pending bits on restart if using single-shot */
>>> +		etm4x_relaxed_write32(csa, 0x0, TRCSSCSRn(i));
>>>    		if (etm4x_sspcicrn_present(drvdata, i))
>>>    			etm4x_relaxed_write32(csa, config->ss_pe_cmp[i], TRCSSPCICRn(i));
>>>    	}
>>> @@ -1055,12 +1053,6 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>>>    	etm4_disable_trace_unit(drvdata);
>>> -	/* read the status of the single shot comparators */
>>> -	for (i = 0; i < caps->nr_ss_cmp; i++) {
>>> -		config->ss_status[i] =
>>> -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
>>> -	}
>>> -
>>>    	/* read back the current counter values */
>>>    	for (i = 0; i < caps->nr_cntr; i++) {
>>>    		config->cntr_val[i] =
>>> @@ -1503,8 +1495,9 @@ static void etm4_init_arch_data(void *info)
>>>    	 */
>>>    	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
>>>    	for (i = 0; i < caps->nr_ss_cmp; i++) {
>>> -		drvdata->config.ss_status[i] =
>>> -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
>>> +		caps->ss_cmp[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
>>> +		caps->ss_cmp[i] &= (TRCSSCSRn_PC | TRCSSCSRn_DV |
>>> +				    TRCSSCSRn_DA | TRCSSCSRn_INST);
>>
>> Just re-go through this patch and had a question here:
>>
>> I’m not sure whether this new change should be documented in the ABI, given
>> that the TRCSSCSRn_STATUS bit is masked. In my opinion, this change breaks
>> the existing ABI description.
>>
>> Description from the ABI document:
>>
>> What:           /sys/bus/coresight/devices/etm<N>/sshot_status
>> Date:           December 2019
>> KernelVersion:  5.5
>> Contact:        Mathieu Poirier <mathieu.poirier@linaro.org>
>> Description:    (Read) Print the current value of the selected single
>>                  shot status register.
> 
> But, as I mentioned another thread:
>    - https://lore.kernel.org/all/ad5yV2FoNbGGLE6R@e129823.arm.com/
> 
> Till now, sysfs doesn't show the *current value* of the single shot
> state since the config->ss_status is updated enabled/disabled sysfs
> session. an I think once the session is disabled, other status bits
> (currently STATUS and PENDING bits) don't have any meaning.
> 
> I think it's enough to change the doc's Description for this.
> 
> Any thought?

Thanks for the info. I have missed this info, we are calling it 
'comparator' instead of 'status' by focusing on the capability bits.

Make sense to me.

Thanks,
Jie

> 
> --
> Sincerely,
> Yeoreum Yun


