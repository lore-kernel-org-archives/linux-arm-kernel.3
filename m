Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83987CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rps4+MRn8b+/NfK3qw8jn7TXbGFAbhWtr90VLiZIiHk=; b=j0DylaRYoJUxG88g3SrbqjracD
	oucutvxXUmFp+AItDQSanmPozuJEugtlhI8t8GnO+U5rz9dcnf1e1Uw0Jz+yEi5cNMfb/IGuDECXz
	5Ttt0qBeWMnU6AJf5UaoVEAdq7be2BJmfQoMENGsl9Qbgdgg2Lrlg5CSXaLwZnG+2HOMCcmzYReVy
	KaHMTuC8WTN0fCP5rPb/s1fvb29CpcAbisV0lYeL0zvdvWIEtkBiSnwDKXYYBI1nvunuEgLlVp9S/
	kMZ/gHjCGUXb+7QJo3hS+MLiq8wGqYHgU/K60QOLZvtGBBbXuApMqnxrVwctKbAEZQNPDYSvD9oJh
	+ILsRgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgxr-0000000FpnL-1oGT;
	Tue, 12 May 2026 06:51:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgxo-0000000FpmX-1XGk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 06:51:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5DxNm2186676
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 06:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rps4+MRn8b+/NfK3qw8jn7TXbGFAbhWtr90VLiZIiHk=; b=jalJ0c4CDRMSfezs
	Dl1dgmNW9TD7oJ3eDj4RI0y0TKbotUzWHDqQAkQt/ETWFTT9E8HcQA7QBsein95h
	q8zAb3Dnyk0bYKEoq4LPZ1rQg1dqmQrlZbEfIwFJA2ZK8gf9p1stuiErrKt+VHkr
	LK6W0ELpbqUMMlTBPivsWakT7E6bOnhNVkgkEqsT0ITJTyo2lKgHFZ+x0gbiz/dc
	Q1IqiwG2vWxE7pULWT7QiEjCG32ULR/pRiYQ0k807dfoXn0rR2D+/MIJYorZ/CPJ
	dvZJSKY6X94gN7hJhNteIdfG7dIzE577ZGtN85AK1GytKWAV3+cnJs+kjH8Huro0
	Cymw0A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0su9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 06:51:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c822bc6ff86so684887a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 23:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778568691; x=1779173491; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rps4+MRn8b+/NfK3qw8jn7TXbGFAbhWtr90VLiZIiHk=;
        b=YlQAAAAUHLmKiKCjZGd5iT/ViFQA1w2dK/cYo+ySGhA8e7fcGYsJ1Kywq4iVZb8dMj
         KyM2qYA5jl/M/pvAdtaPr+q+2YTwj8MmfvHCzBn7ZxSn9bXEvqbYswAHkFh8qrtOHL3H
         ZwJ8iCQjkdGmdaxUFCjy1gkrFLuIJKlNqTYzsHAxt7EMT5BwNFAIKXrX/M2h4ziSV/UT
         Tdoz6gUF9RsXqqBQdf3BlrDlqR2h/u0rBlRNjVQOmeqnyTymO716uPECx+8SRi2L5gBw
         JoznUdPPqtfvL6bmtg9woYP+ESWdl5BJapD+qqKjD7fA1gUEID0/BXmZ0sNF1c/XmBym
         dG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568691; x=1779173491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rps4+MRn8b+/NfK3qw8jn7TXbGFAbhWtr90VLiZIiHk=;
        b=NR0LZv4GONW23tcPPuNHxSql39avlk1SQmvgAYxr4s8SU7koHuhetYgBMXZZKqhY2B
         Uc9569pkHdojwlD66DPNp4s+aBlxqBxnJv41D0APTe2t50QtVReci3jNhL5enXruN2VK
         lArDEhy3h06+y0qRrU9MqfngZ0YtBno/dU48Vz0sTJX8DNT+h6hoUVu+kTBJ0KTVfYvw
         pwj5glCsXBFYCAdE+aB5OutL4zCTkMezEm5yzLdKmLzavp/9/x0Em41wOBDzrdnzpv5W
         sds0eTZhKZV5D6D+oma3+sT6iK0DAvQJFFu87F6WXAxXX298Q5sI9TwtObQWQ5lAuEZJ
         o4iw==
X-Forwarded-Encrypted: i=1; AFNElJ+0xJRSDdYEabM4TRcMQEA0PmWaVAi0l0CsfQtAgkKi0qfEw97Xz5EIMM2w/ond1PLz4XXshr5oiPF698U6QZXB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9ptWYiGrR9WwV62e7H6ID4yx3RqmWXw4jqRlvKOg4hV7WX1n3
	+I8Oyf1X5dszvges4CFfitVhx/sSSuZ2DHw3+kx0/8y6C68m0J6H++y3baw0Wqvf3r//5s2WZrd
	hhKQ97d7wb1Pct6hylUH03uz9sSEjOwsXcVffV3AwWc5q6wi2DYADsDenyNHvNgHcwt2CGZuV0C
	cwxQ==
X-Gm-Gg: Acq92OEf/EAULdK45ahvIBfrCMp/+7FJwLJagBMRVOU99X3+g4Y7a8wqIdkyvV3BrVl
	T3pwwAHcmL/nsHNrJ8tpKTYHIQ71nxH/xUe3gFluW9fl/2hGYxUTFgEPAm2j/r0QBdNcWnxHodb
	f3K9EQm3LXM9ZrSz/boetk571Av+gJrdgZXBLscSJBPmEU9PqKO8/z67nhu6itXYs+2A+aM4vGc
	fqrtkUhfBfXDLyWHRWLaZuf1bzQw6HDC0h6uOFQobgS3Htl+IZxYUXr3IxkWxq7BFA3kcwJuAlN
	nA3GFjOm04cf7bEaZsJljPCVWeYyDfRnFFOfDuV9QvATQYRw2nr9wth4wW/V6DQRcTLkhQ0cheC
	xS84+vzoW0G7s7hDKWBKckY2v4xZwV6RZL2IAebeftvgjzyqAGcg=
X-Received: by 2002:a05:6a00:a804:b0:82f:21ee:270d with SMTP id d2e1a72fcca58-83a5aaf7794mr13651037b3a.1.1778568691151;
        Mon, 11 May 2026 23:51:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:a804:b0:82f:21ee:270d with SMTP id d2e1a72fcca58-83a5aaf7794mr13651009b3a.1.1778568690660;
        Mon, 11 May 2026 23:51:30 -0700 (PDT)
Received: from [10.92.198.185] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839683a6252sm22579715b3a.59.2026.05.11.23.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 23:51:29 -0700 (PDT)
Message-ID: <fcd68c71-2581-47dc-9e9d-2ef558b7a6d3@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:21:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] ras: aest: Add panic_on_ue module parameter
To: Ruidong Tian <tianruidong@linux.alibaba.com>,
        Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-4-d5d6ffacf0a5@oss.qualcomm.com>
 <24e7a997-9479-447e-a1e2-cfab9a904668@linux.alibaba.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <24e7a997-9479-447e-a1e2-cfab9a904668@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NSBTYWx0ZWRfX3H4IBXgrZwu9
 y4fCVeZWo5LVztF1yHv2ptm4gwBD4c2qy04BhkMahyNzg0TFHd8NYFOUz4w9+UmxL416J7qqUBE
 sFJQc4MIOWTUJ5Hps7fFt5iKLwsU3uNiHElUd3BqFa24knZuFv/ETEXNqWm9yNIx/UY+g6XsK2U
 kMVb9ivj+r0qaN9Vp/cgyVJ7HdTDym2o+Zfd5vztGPRjOdekIIf/QlJeR3rpNdadzUWyQ1y6zfY
 6fPFUiQe17fPCYnKNcpInlLUA3PQ6LFKj2eMHvQEirwq2cMow1OeZ6gfSQMuMr3l/PpBE2TnrE0
 Nw07Z39uCkfAXNc7JBc6Jr5VY4Zy4INY//KU3I4CjZrRmsdegC9tu0dmNz6limiNf/rz3K6E89o
 TuNC910LsadDVXMmaBjvkgBxBtzCkEj7RlUTVs8GhPmKpBL7mtxUg1h2ljqHtF3ddv476sF01Sq
 ZiFmMOZhZyvwWca1E7A==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a02cdf3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XXTmVIMiA0tzt-EScKkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 7tp1LAZfj1prOeScwAqUAkk0qqEqD-Ml
X-Proofpoint-ORIG-GUID: 7tp1LAZfj1prOeScwAqUAkk0qqEqD-Ml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_235132_407378_0DD26602 
X-CRM114-Status: GOOD (  29.94  )
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

Hi Ruidong,


On 5/6/2026 1:36 PM, Ruidong Tian wrote:
> 
> 
> 在 2026/5/5 20:23, Umang Chheda 写道:
>> The driver unconditionally calls panic() whenever an unrecoverable,
>> uncontainable UE (UET_UC or UET_UEU) is detected. There is no way
>> for the user to suppress this behaviour, which makes it difficult to
>> test UE injection or to run in environments where a kernel panic on
>> every UE is undesirable.
>>
>> Add a module parameter `aest_panic_on_ue` When set to 0 the driver
>> logs the UE and continues instead of panicking.
>>
>> Usage:
>>    # Boot time (kernel cmdline)
>>    aest.aest_panic_on_ue=0
>>
>>    # Runtime
>>    echo 0 > /sys/module/aest/parameters/aest_panic_on_ue
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> 
> Hi Umang,
> 
> Thanks for the patch.
> 
> I understand that this parameter is intended to facilitate UE injection
> testing and to avoid kernel panics in certain environments. However, we
> need to carefully consider the potential risks.
> 
> When a UC (Uncontainable Error) or UEU (Unrecoverable Error) occurs, the
> hardware state may be unpredictable, and data integrity cannot be
> guaranteed. Allowing the system to continue running instead of panicking
> in these scenarios could lead to silent data corruption or other
> unforeseen side effects, which poses a significant risk to system
> stability.
> 
> For the sake of robustness and data safety, I do not believe we should
> expose an interface that allows users to suppress panic on such critical
> errors.
> 
> If the goal is primarily to ease testing, I suggest handling this via
> local driver modifications in your test environment rather than
> upstreaming it as a configurable runtime option.


IMO, it would be useful to have a module parameter for this. In some
cases—outside of test scenarios—it’s necessary to avoid triggering a
kernel panic on UE errors.
Would it make sense to keep the default behavior as panic on UE, while
also providing a module parameter to disable it when needed? This way,
we can preserve the default safety behavior while avoiding the need for
local rebuilds just to change this setting.


Thanks,
Umang


> 
> Best regards,
> Ruidong
> 
>> ---
>>   drivers/ras/aest/aest-core.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
>> index b4f4c975da1d..9ce782a66edf 100644
>> --- a/drivers/ras/aest/aest-core.c
>> +++ b/drivers/ras/aest/aest-core.c
>> @@ -22,6 +22,11 @@ DEFINE_PER_CPU(struct aest_device, percpu_adev);
>>   #undef pr_fmt
>>   #define pr_fmt(fmt) "AEST: " fmt
>>   +static bool aest_panic_on_ue;
>> +module_param(aest_panic_on_ue, bool, 0644);
>> +MODULE_PARM_DESC(aest_panic_on_ue,
>> +         "Panic on unrecoverable error: 0=off 1=on (default: 1)");
>> +
>>   #ifdef CONFIG_DEBUG_FS
>>   struct dentry *aest_debugfs;
>>   #endif
>> @@ -342,9 +347,11 @@ void aest_proc_record(struct aest_record *record,
>> void *data, bool fake)
>>               aest_record_info(
>>                   record,
>>                   "Simulated error! Skip panic due to fault
>> injection\n");
>> -        else
>> +        else if (aest_panic_on_ue)
>>               aest_panic(record, &regs,
>>                      "AEST: unrecoverable error encountered");
>> +        else
>> +            aest_record_err(record, "UE detected, panic suppressed\n");
>>       }
>>         aest_log(record, &regs);
>>
> 


