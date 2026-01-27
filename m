Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A0FD13C1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 02:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlyBoZIoVqBmBc/HIZd0w9u1HtTltCmF3/e8gfFCH8A=; b=S/In4Ng52vZyZCkKoA2kKaR4z0
	HOyg60vO8L5kz0uoesHrlBUDAJrzpRmGswoJGF7C3zEksn5aUlZbD3XDtOCQEDrpvSKh9xqW900wy
	cE9jc6QxNsHuKUeK2v3dgH8ijS5H5FEEkc8gwBq0TTbDuXaJCG1B0hnf9TUlR5O/0IVygHUi3ZL5M
	9Ebp+vaE0Na4iSLaY0/HNlGawCjoSxpmBWsyfgWDj0F7COpAtfoer03sO6eRdTf7SQcdkWhFppz7W
	dxKm+Tj14mUeh/uQWEkuvm5WYWOMTeUak19BQIxcm9Q7g5CrXq7XIrIwev3asEfYlURk2SzHPUZid
	jDZ42tmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYuO-0000000DUjx-1kwD;
	Tue, 27 Jan 2026 02:34:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYuL-0000000DUjU-3h6o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 02:34:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgJGj3707349
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AlyBoZIoVqBmBc/HIZd0w9u1HtTltCmF3/e8gfFCH8A=; b=mTogfLhROAiYNiWv
	gTkQ5eRKqKb2QVF9q0Q8BIEYDJyt7Mg13VZkRs3I7o65JebNU1uMvXa0wiaiclo6
	2MR8Xoijo3IQpne7czIqtpJnfGLSJoVA1FY5SIPoLx7uXKl/KJyffFjxUX6kV4LP
	fdwRnqTxsrlofZUppDKH9Xq7BuGJP+Wx0mjsd0Ja8jFzZ0sc4jvLRm16QEEG/pVU
	oe34vqaCtlxkcfRBzipYby2WEaR3BnuP6oeozw8k9uX8K4/0Og35dvIOAlMD9ced
	FIz0bC7v87PvidpK/oyVq+FfJbN+NM9il2YPYgHbCbTu/vtIAOTyadLlGuVnIKer
	072/0w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bgv9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:34:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso38942675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 18:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769481260; x=1770086060; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AlyBoZIoVqBmBc/HIZd0w9u1HtTltCmF3/e8gfFCH8A=;
        b=eSPTlh+DaVobgVLjlaSPkE8DUlcwwrIHrNrRMQuG/ByMOU9VXloEz5StjvM5x1Lz3H
         mNiOGhwoPlM3xdpcZCEzrYsdKvglnT4+ywJYU2WzUZUYI5yedow5814dK2HbzlwQ39BK
         st06dG64qvkG9sv9z0winBKbI/P3oMh45JCX3pvUFX5ADkUZ7aoN2KDBRBiZzpV/h+yF
         plRCZ7vykAjlwJDlOWa9xmGzS4+moe0i9USw+wQ7SeYIxL2LZYTTanOzjxa4dykAxlPh
         voshhojRi3pinTgd9CXvdFN3ZEe3eczMqLzP1DQFStV7//pkzsMgKL2nt/6UPip6ip+f
         57XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769481260; x=1770086060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AlyBoZIoVqBmBc/HIZd0w9u1HtTltCmF3/e8gfFCH8A=;
        b=W5AQHYiNjobiwgp2EXiVRQCcv91WcQ0/vzp3TX2jPpi19rsXWfbUyxcxcrQITwLzv3
         x/D0FMCazDqXk3W4aSgTD+9hZpqrB7Ilk1mLgZwOVFoVcroKIjRlKyZO31F7N7xzOhgl
         CLs2T6dPh8kdoo+WaXa3QJq7Al4kzTSPFL342qwDP+EMAhBjfhwUE1qRwLbV25fisZx+
         1hExXimCousZOxFdE0nihi0Yy1FSWZGUzKd4cFupEl1M+TVhL948ZP7zcJYat6tnGrSc
         TpnOb+K+1QauES0CwnA4weK5W7GvZ2FiXinmw2FXhE030wuLXcNdZ+NfppWlK7YzSt3D
         aB4g==
X-Forwarded-Encrypted: i=1; AJvYcCUn8mQNmWOhQP8RXlF8XIIvkNIsA9JC0oRBzdfnG9xrL+t8qUbwcmUkb3HCdlvO6WacIHqMsmuGM9xF++3Es66x@lists.infradead.org
X-Gm-Message-State: AOJu0YxzvxwXd+YzSRDJPNSyvhrG5PVqBiaUvxN6G2NF6UjefrrVXBmN
	AtAXDVOcgs61QjPUznGCl21IM7PXDUsnLs+/W9cWEGALqQivLZKayHdnNRVvepqFfyQH45Ob7U8
	Iur91XT8rqVX0Zug9WXRVa1hcm/3ShJ8nqz8ZWGYifm414y3y4SxFSPpzsd5SIpd+d4EJgZAEWC
	mzhZZpZrWQ5w==
X-Gm-Gg: AZuq6aL83KiHPZsrmhyE/MtNN1tRhJ2lqaKrLdQQXpI5/j7MSFc4XYxMyoipaC25dkA
	4F10Ird8EGqrrSYniIHN8nQ2K36E3cz16NWT/6QIL4mvzF8Zyp/jTafpYc1/X2b4+BRcLA0V+0q
	GIassPpU20p+VzBuJjTIyIE+XdPjVMdpv3RzAjeZhttD/hPN8etdc5CDLL9HXzCbuSks8Ozmde/
	NO8hUvEfCRk/xmX4TmsGRYST3pEf8wi4FEokV8BEIlcImp7RrHpUI7KXsGdX0WJzVc7PzV45lg5
	g09MQ9E1tspR+mz3Papk0GGgAn37CiBbXDtbviSGfM63/gV1A5uNpZce9TFDolcOwkjB8LgzKNH
	7U6uEeBVBwrJTbtUWQtgLXqxCVoFd5Lrv7oCApXA=
X-Received: by 2002:a17:903:2a87:b0:29f:e787:2b9b with SMTP id d9443c01a7336-2a870dd93a8mr3029595ad.41.1769481260215;
        Mon, 26 Jan 2026 18:34:20 -0800 (PST)
X-Received: by 2002:a17:903:2a87:b0:29f:e787:2b9b with SMTP id d9443c01a7336-2a870dd93a8mr3029215ad.41.1769481259720;
        Mon, 26 Jan 2026 18:34:19 -0800 (PST)
Received: from [10.239.133.242] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97a3bsm98535175ad.49.2026.01.26.18.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 18:34:19 -0800 (PST)
Message-ID: <66aae641-a340-4f0b-9d68-535ac296a335@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:34:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/7] qcom-tgu: Add TGU decode support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-5-songwei.chai@oss.qualcomm.com>
 <beb63598-a7fc-4e77-a68e-8622fbd93972@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <beb63598-a7fc-4e77-a68e-8622fbd93972@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AZL1Ie5q4Pqr9O5uAOPF5Oe8DE_S4oiY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyMCBTYWx0ZWRfX+A3WDo6S8pWp
 i4cnTLtU2Lc5awIwbjO1uSZIaCrE64DxX9osE1Pfoh6zghZWQXPPr1TbJgZwi0xpMXcojD7gd24
 wvx5iGMDo8jWF5po58+/H2Ori0j7/h0I34t38YXUL8EdujFVmH/biMtcJ1c55EjSYX65DKVYV7l
 yVgXSFashO8OCTEQOy0CcHXBUEcWpXcizm2MSF/awBi1KTVSFdVZuXVQW3cusXZUVX1JLVI+xue
 gRZGjEQ/OZNqf798/gi2vdiZGBcjDzncpk2c5HUg+ORQd+0kf/tjhnfPnxsOJK1nj1sYeVhqVcH
 EItKe+C5eRbV1K2B0sXER7gUISRnR2WmwXLi5k+BES9NuUBRN9UF/Qz4dyeKx07yYXZ/mZ29VOa
 WDMnadOkAAwsnyXybIzMR6pPIYeQaOVPO5ctYPqJ2JqjnMpfOlERxuciKiNDJISzzaiucAT7FEe
 R3o2ItC1WYnL4AERZaw==
X-Proofpoint-GUID: AZL1Ie5q4Pqr9O5uAOPF5Oe8DE_S4oiY
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=6978242d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=M09XoMm3SDISpC_kuzgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_183421_931855_C4157826 
X-CRM114-Status: GOOD (  23.75  )
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



On 1/13/2026 7:13 PM, Konrad Dybcio wrote:
> On 1/9/26 3:11 AM, Songwei Chai wrote:
>> Decoding is when all the potential pieces for creating a trigger
>> are brought together for a given step. Example - there may be a
>> counter keeping track of some occurrences and a priority-group that
>> is being used to detect a pattern on the sense inputs. These 2
>> inputs to condition_decode must be programmed, for a given step,
>> to establish the condition for the trigger, or movement to another
>> steps.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -18,8 +18,36 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
>>   				   int step_index, int operation_index,
>>   				   int reg_index)
>>   {
>> -	return operation_index * (drvdata->max_step) * (drvdata->max_reg) +
>> -		step_index * (drvdata->max_reg) + reg_index;
> 
> I think this type of calculations could use a wrapper
Agree, this calculation is already wrapped in the calculate_array_location.
> 
>> +	int ret = -EINVAL;
>> +
>> +	switch (operation_index) {
>> +	case TGU_PRIORITY0:
>> +	case TGU_PRIORITY1:
>> +	case TGU_PRIORITY2:
>> +	case TGU_PRIORITY3:
>> +		ret = operation_index * (drvdata->max_step) *
>> +			(drvdata->max_reg) +
>> +			step_index * (drvdata->max_reg) + reg_index;
>> +		break;
>> +	case TGU_CONDITION_DECODE:
>> +		ret = step_index * (drvdata->max_condition_decode) +
>> +			reg_index;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +	return ret;
> 
> The only thing your switch statement is assign a value to ret and break
> out. Change that to a direct return, and drop 'ret' altogether
> 

I kept a single return intentionally so the function has a single exit
point. This makes it easier to extend with common post-processing or
debug logic later if needed.

That said, I’m fine switching to direct returns if you prefer the 
simpler style here.

> 
>> +}
>> +
>> +static int check_array_location(struct tgu_drvdata *drvdata, int step,
>> +				int ops, int reg)
>> +{
>> +	int result = calculate_array_location(drvdata, step, ops, reg);
>> +
>> +	if (result == -EINVAL)
>> +		dev_err(drvdata->dev, "%s - Fail\n", __func__);
> 
> Avoid __func__.
> 
> The error message is very non-descriptive
Marked.Will update.
> 
> [...]
> 
>>   static int tgu_enable(struct device *dev)
>>   {
>>   	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +	int ret = 0;
>>   
>>   	guard(spinlock)(&drvdata->lock);
>>   	if (drvdata->enable)
>>   		return -EBUSY;
>>   
>> -	tgu_write_all_hw_regs(drvdata);
>> +	ret = tgu_write_all_hw_regs(drvdata);
>> +
>> +	if (ret == -EINVAL)
> 
> stray \n
Sure.
>> +		goto exit;
>> +
>>   	drvdata->enable = true;
>>   
>> -	return 0;
>> +exit:
>> +	return ret;
> 
> ret = tgu_write_all_hw_regs(drvdata);
> if (!ret)
> 	drvdata->enable = true;
> 
> return ret
Will update.
> 
> Konrad


