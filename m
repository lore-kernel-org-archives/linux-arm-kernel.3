Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E3ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWnjRT+iol/D3VOcuiKVyQ2qPF47KUnKgJ6RaZdkVLA=; b=zgQJJ6VJPFAHpDNf7EFP07Y7Q9
	/EyrYsgE/rxBX0StJe/dpm5LrLeHjK6DK5D8NS6oZKKifh/9XnTsX4E91raPjVX9KXNxIWQ152d7b
	3eokk8E23pMp9meRUB9vLoDtGKqp/vfufZeZ6L5rw3h/w22rVjYgIZumXKwoi4HlgEX+L9/ptH5fZ
	Wsmv2vzNEleqTZ4Za351mn6w4H0ri5I8Ykzjad2BK3U7nTqJqiUeK9YzmrlIL07hKbe0K01eU1LSr
	cwNryyfpbM+fMMXrsN9PwTRGhkSe3+TOTFoJtortOWSvPeWbfZkdItcGF48r6Th2oyUZYspbd1wqZ
	DEj59+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ePI-00000006tv0-3QVu;
	Fri, 17 Oct 2025 06:57:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ePG-00000006tu5-0n9c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 06:57:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLLCT006091
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 06:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dWnjRT+iol/D3VOcuiKVyQ2qPF47KUnKgJ6RaZdkVLA=; b=RVIMjl32fN7QhdUg
	3An/rCuH9Ka8MihEghHkKvYZsk7tIkOTRcR3Q1UkavpqBnWYaNvDKZnx/O81vGY3
	9rjh67Ag72MuBqk2IsrKbKKncjB2PIrIXVLQSwh1YC6ccvqM/Py1FU3Eix2G5PFk
	B7oOmGm4C6Xa/Vgd+GI7pNlgKdrVUYfkTUdnSfhzCIGN2BQihWi+QrfYsNcdNq+E
	rYCd9VQrlSDZOPZ89+siBc78i2vVF9J2ZV5h7B7Tv7tehiUZsXLdrqhqv8JZ0EIn
	Q8WTEUNW0Xq3y8G7D7bvxRWDgqn55YORhvbcDt1KdC03+3f8Vtg9HoOTZtEnmRUH
	+A8Cyg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwwgy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 06:57:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780f914b5a4so1753879b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 23:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760684260; x=1761289060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWnjRT+iol/D3VOcuiKVyQ2qPF47KUnKgJ6RaZdkVLA=;
        b=uUaFSOBnitIeQu2mUOETgFVIJ6kxU9TDQ5HV0Be7NfMgqgxnNGzMvszJjh5n9L+QmF
         lqYMX2S07xzVOy4rjaL5zk09v3LG1wzZbCrIdRs8mxkL/4g7v4cAhBTrKJ2O84MNqL78
         9rqfCk0UgSd7qrbILPAWlKNnNPmz6LnpNe/FibPMAKcLnjm49KRA0+TuYIM+VS5uV75n
         NB28iSLQfUPInTW+rZI4if7T8jj272g64U82Paw0WG4HyEnZy6rByVgjerBQYUss4LGH
         fl/5nvSddM7QdFYNS/TppS9GZv7OP1LttAKVHTHHXrX8LH7ezGtXt6W3qZt97NFa0h+6
         ZVsg==
X-Gm-Message-State: AOJu0YzFZ1fRtZRGnfh9h5OiiWmXKp/p1q4LNhJCHSJnUtLNdnPupoxn
	NDb7rGciUKhlN45sy2QZnLCeLz7km9OPC4qsTveAjGoHIK5Pr/4fHFkcW5kZR0YaVitvSUxQ6/l
	djulLSqBj/3t0NQ+kIGer6JiYITonShCe3uDPbB0znykhuqpLdFElcTPQZ3r3+awjTlZK5/OAOZ
	idigClI5Tb9w==
X-Gm-Gg: ASbGncuTf8irk3Ny+IDeA4dIU0ldZbracLG0YXIl6hqK3WyY2E5bxD3a8YGWk5zxaad
	SPOqnnJarj8k1lntyLSYvEpdVwD1nG9k6PkSEVTE68eCc3/F/AJcpM3mV6k9kDi2BhyOAakeVZv
	VmkF6R1JyGiVHEk0/4XdC+unH1UJn22He4Qrqj9a/e3urDl3NJj9oY4IoAf3oZKHKgQOestEWn+
	aH6IZulkHX8r6YebtsjAryM738R3q+PR3QIQ+DIY4phGwprYrQIFargSMTsm6/3MyzEqaL0YRfL
	ep2nMMYdlXhbc4He2tbQ5I4WlL9mqn/RyIKzel5JvABPkpAgugel+m5kX+/VdcGJtwBvgpjCcvI
	+FSjwBAKb1APxDouyfwg6mB//SeY=
X-Received: by 2002:a05:6a20:914b:b0:311:99:7524 with SMTP id adf61e73a8af0-334a8536f96mr3755773637.18.1760684260319;
        Thu, 16 Oct 2025 23:57:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqZWftpaAFpTBdRv+zzFXHHnBlGjVD9evMbr1rJgR4khpMxNQmHGfZ19i7eqiMZFahnCVBKw==
X-Received: by 2002:a05:6a20:914b:b0:311:99:7524 with SMTP id adf61e73a8af0-334a8536f96mr3755737637.18.1760684259880;
        Thu, 16 Oct 2025 23:57:39 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb66a216bsm4371114a91.13.2025.10.16.23.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 23:57:39 -0700 (PDT)
Message-ID: <f07fa7fe-b89d-4d1c-9ac8-be5ecbf1ded0@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 12:27:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
To: Krzysztof Kozlowski <krzk@kernel.org>, Taniya Das
 <quic_tdas@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
 <90c8dda3-f753-43dc-8bb9-d03a808c8704@kernel.org>
 <38b8468f-5006-46a3-a4ea-28e6692ef14a@quicinc.com>
 <03ac36fb-a227-438e-bdf6-f787e26008b3@kernel.org>
 <8580ae8e-50e9-481c-b9f3-125b6d1cb494@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <8580ae8e-50e9-481c-b9f3-125b6d1cb494@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX3VYkgUpF6P8L
 WOCoGn/5ci1jwZMVSh/Gysa+8rV4yGmjUdRTbLO+0/37W7YEMfN8w7gwmeJnHEMlAbA/W2syp5R
 Z8wgf4WVtFqvgw2euQRUNezVC59hMssyLIQ6Yvmy+tk4Hx8XkA9POREvGxwqT5hZFCYL81gxW13
 0Y3BhqkIUV+LgDWy7JU/9P+uUKr74ybvyLbgg8Wffi73yNexKo2jg+AKGSzCC+xQNL9ZKAOt6VC
 CyKx/VN2ThCl28TSYfRSKEQtGN3RrjHrpTUhc/K8U5IMstnyw5wzMHqMDttW1E0bRVlHhi3FpjA
 RvzPlUDPMI9DvQN2FYdN+8GGGicX5h0sFr6CgnXTlVoWxsUFpAdcyR6AnsBfMSDaamlZXXRISWO
 j1jDgAAbgv2KIFNoKu4qXH9j1OuSyw==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f1e8e5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ek7cbK586cxQBMxakbwA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: qc8lbSx_yIOg5RKeuJRnTpDjg-Ank0UX
X-Proofpoint-ORIG-GUID: qc8lbSx_yIOg5RKeuJRnTpDjg-Ank0UX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_235742_233492_F5D74DC8 
X-CRM114-Status: GOOD (  25.58  )
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



On 10/17/2025 12:24 PM, Krzysztof Kozlowski wrote:
> On 17/10/2025 07:56, Krzysztof Kozlowski wrote:
>> On 17/10/2025 07:49, Taniya Das wrote:
>>>
>>>
>>> On 10/17/2025 10:51 AM, Krzysztof Kozlowski wrote:
>>>> On 17/10/2025 07:16, Taniya Das wrote:
>>>>>
>>>>>
>>>>> On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
>>>>>> On 16/10/2025 20:53, Taniya Das wrote:
>>>>>>> The TCSR clock controller is required  during boot to provide the ref
>>>>>>> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
>>>>>>> the UFS driver successfully probe and initialize the device.
>>>>>>>
>>>>>>> Without this change, the UFS subsystem fails to mount as a usable file
>>>>>>> system during boot.
>>>>>>
>>>>>>
>>>>>> That's not what I observed. UFS works fine, especially that it is a
>>>>>> module, so no, this is not a desired change and explanation is not only
>>>>>> insufficient but actually incorrect.
>>>>>>
>>>>>
>>>>> Krzysztof, on Pakala MTP we are observing the below issue and it
>>>>> requires the module of tscrcc to be loaded explicitly. This patch also
>>>>> aligns to how it is on all other targets.
>>>>>
>>>>> /soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
>>>>> [   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
>>>>> [   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>>>>> find vdd-hba-supply regulator, assuming enabled
>>>>> [   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
>>>>> find vccq2-supply regulator, assuming enabled
>>>>> [   10.565955] platform 1d80000.phy: deferred probe pending: (reason
>>>>> unknown)
>>>>> [   10.573078] platform 1d84000.ufs: deferred probe pending:
>>>>> ufshcd-qcom: ufshcd_pltfrm_init() failed
>>>>>
>>>>
>>>>
>>>> I don't and I am testing regularly, so I assume you have incorrect
>>>> config. Maybe I have incorrect one (which works), but then commit msg is
>>>> incomplete - you must explain the bug and provide proof that this is the
>>>> correct fix for it.
>>>>
>>>
>>> We have tried booting up recently and and that is what we observed. The
>>> patch from 'm' to 'y' helps the UFS probe is successful and the rootfs
>>> is picked from ufs partitions. I will add these fail & success log
>>> snippets in the commit text.
>>
>> That's not enough. You need to explain why UFS fails. After explaining
>> this, I guess bug in UFS would be exposed thus that one should be fixed.
>> You just provided band-aid without fixing the real problem.
>>
>> NAK
> 
> 
> ... and to prove your analysis is wrong (because your setup is likely
> having issues) I even tested now linux next with defconfig. Works all
> fine on next-20251013. You did not share which kernel even has this
> issue, maybe some downstream tree?
> 

I have added how the commandline looks like for the test. Are you using
using the ramdisk as your rootfs?

> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das


