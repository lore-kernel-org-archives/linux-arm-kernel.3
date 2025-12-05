Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77222D2CE01
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 01:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ES8FkVhlyY6ZBE+Y/f+xBmWFC9CfoOa6Zybsf7X4Dq0=; b=Y/DjiFtMu6E830DtjQjyWIeM27
	8GylqmQxGAiDrqnIW1LiE1EjuGwwLEotAc8M/AtL57HwoeJqno9XQx2KgV1lmjg8jmGhD6+9mkTCK
	pOzvmiwLHpiqDo3mE3R/UEGuxMP8CTfnyIZWINYpCxWLzswZp5t90YoiSDBs1+DPiD+dl1QqX61Lk
	aRqu+9q3j0jPHSedakyodH1GVpqdEV2lAM2HWJ/O7HI2MS/8P4PdF0CFw5eRA39bVF64tw4KyQGdy
	TuIa8OYfgGLc2rZedNf+JHUc8VzGB/k8ssg5s2AcCdmT39WDpWYy1Cl6Th1a+/S4AG1hsVpwAl5hO
	CCgZ9/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKOR-00000008rB4-0zKq;
	Fri, 05 Dec 2025 01:13:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKOG-00000008rAA-1CTR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 01:13:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4N5C2i2298127
	for <linux-arm-kernel@lists.infradead.org>; Fri, 5 Dec 2025 01:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ES8FkVhlyY6ZBE+Y/f+xBmWFC9CfoOa6Zybsf7X4Dq0=; b=fC1f+/NRtJ/hVpTF
	39lWd42hcFm/KCH7g0nic3Qow8T6Nv3pFiK0fMJC04/mCfewZTlCqxexIB6FytT2
	zNGN7S8UijiXgtRK8Dqu4DbC52n32Qw4DNI7y4tY3+VSKN+8YUzGq8PeleqpvS3f
	LYwe2dAyCJc7QCAlYCuxg0wlrJqX0O0+4+ELs2CwB9k8qhriFY2DTyEZpzyg+LAx
	aHSGVR170c7qPcdJh1VthSbAsJjgDbvtImZl3gOGwTp4uETeV1K8DBtnt7vWeUG0
	V8WwRQALoTqIV0HfXxC4jmLyDAvs8+ITZ3vZPdTG99lGr6XP19rYmGBc4DSNrAPU
	WEr/2g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auknf87xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 01:13:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956cdcdc17so16711985ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 17:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764897222; x=1765502022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ES8FkVhlyY6ZBE+Y/f+xBmWFC9CfoOa6Zybsf7X4Dq0=;
        b=YehlLykvfGLYupLt52T9AI6Rvarso/ooAyXLSYIzpCetf7WOiUzxVe0YD413VR47IT
         2oBkhDq3z5gxh2/HpCAH4Va+Icvp0orpm7fCVuEZmnbLKdx94MkR4PLECTzWv3BdeMKh
         J3FT23hJKWPO/8gwEsItSTQ3HbKq+YHxzRrEeWJrRBQgLH3iTszwSyWBBt5FPoIS+GUj
         HiqWRcQW6waXkdJ64TPm4J2EDDD6S322T2T2GjCKlfdOY29DRHlDzjEWX2/tTTxgCAzy
         YqJMWB++dVkQfW0lUzzEv+Os//o+a9dObw3TGMOyLd02EYue4oM1LyUkySRbS6WuYHZv
         kQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764897222; x=1765502022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ES8FkVhlyY6ZBE+Y/f+xBmWFC9CfoOa6Zybsf7X4Dq0=;
        b=s3kfy0hr/lA2yBC8jZ7ZBWbvmBJ64aV2DENMUs0DiFLPlyCCoawKm2N2K0TOXfGU/e
         GVl5sTJDlm/eKRUR0KrktrBUevrNpTEO4F5DdsOpuIY6i4r9ukrVECwD2qAr558LtgjV
         ttj90JhnvxZuetj8skPXNCmbS6G2JjonKx4BV1Pi6R1Xb632tGnPaZebbcG/6K84G+yA
         pwvMqddiiy5ASrCF6izpv0KY2nkQKXiarcyw3U819vJdNh5f7BPE4WgeUfHB270wPR9M
         kNjILUzLqm+jYP9qRr1BHwgpcIi0x8j2wnmOQs0ezyfDfvulzxOh46YGgI9Bnh43i/eH
         y74g==
X-Forwarded-Encrypted: i=1; AJvYcCWZfBqSxkTzxglPuHvE5CpjpRhuftCBV+ITS7qWxMIxm3cfyXkTJjhRhYMtqaf69kbR17O6tF1QVOew2h/5OWYJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxPF74g2GtVmrUqxYflWpvcSzhE7+lr85XM7d5NhC6We84FtK+V
	jCcXH+aULJorTGFW2ofedTQ4o7g1GNiqHK/X8mImjr4fJ+u+xueg9zonmjWXDnBpWpxe2M+aJFy
	KDYoY/HUR6QCTSfaOxr/lMTHpyV+t9hL3k1Qeae+ChQ3ijtxx7QcZ4DcZPcbmAHglRL4LAQIDYu
	H/Ow==
X-Gm-Gg: ASbGncuGrvSWx6prNZFbNFODYHHgWLt/O3/TQXXsP188LAsSHUInfwIWjrHojFKb5Nn
	VuzCUYw+7W1hcuiq1igv4sAqV6Abep7ipXMn+/kfmc2zlAysndNEN8QhP1gl1I6UyFu2rmmSMOL
	E3Xyb+jorTEiMWJJ0zTWdciA6lKr41Kfd8USvBEbO8h8+6BOoIqGpzlofNU6jCBaUZ73PomRVWy
	hy72gj6Ja8C+gEvqFQue79nVuep2Ua7NfWSHay1S4kxK78c5N0xo04zg8cJlaAJ+1d28QjG8aNo
	Xq1XZ0CJLP8G1H3R1lLNvdJQAdKbDEymbGGkkpm8h5zuSE8DCHSFhHOD+i9tw+hiONQnz6sZt+V
	y1HFLpBpZvg1wIxVEHw0YqREj0RXgSK2goZG9nQwqs6eSQctIdmj4kzjLD/X9waLjhXlXaNm4gT
	CFm8bI
X-Received: by 2002:a17:902:f54e:b0:295:5132:1a99 with SMTP id d9443c01a7336-29d683b0135mr88087745ad.44.1764897222070;
        Thu, 04 Dec 2025 17:13:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+iWfWYud26rmtPI0Gd5cgq1HtwMmDA5U4WgyQfBF8rZTCz19c/VJFXbDWoac3xNzZRQv4sw==
X-Received: by 2002:a17:902:f54e:b0:295:5132:1a99 with SMTP id d9443c01a7336-29d683b0135mr88087335ad.44.1764897221424;
        Thu, 04 Dec 2025 17:13:41 -0800 (PST)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49c358sm30913595ad.5.2025.12.04.17.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 17:13:40 -0800 (PST)
Message-ID: <b2f3c31a-76fa-4f59-9ba4-0f93f861ffb2@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 09:13:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] Provides support for Trigger Generation Unit
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, kernel@oss.qualcomm.com,
        mike.leach@linaro.org, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
 <4f53766f-6338-4d94-a947-19b95952e08a@arm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <4f53766f-6338-4d94-a947-19b95952e08a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDAwNyBTYWx0ZWRfX0tF+4RNOijDL
 lWG3kpKfJzjq769hJOtP54Cf+qxkCQoqQmcIoQlFBTALmy6ap7P0s2A/fa+B3MODYxNq+73dKOE
 by22sSoBWgnxE4iasv7ZJ0bbVTjC5qIjk2aQvGbPhfaAccRoalppDFsGBo009droUV5Imc3TvXa
 VXQaZb/gi2WNULjr23YRGx+mEs6i7e6ZlhOGYuad6cWTjQrU7FDnBb7fkgmKgu5IyNfmnBTBl4M
 MgaaM+cvI93hKZE3jitTeC6E/lLEgkODJjS4vz3b7okvTveJfDAFQx1JsCRQWLaDn2THyjlb572
 h7d3e6s8DGSMxWJqat8zhAukabG3AMdIGAnzo775G8FmSdXrQvrdVTe6ioIPq0Ou/KJLW3KP/Cn
 WLjM+CLNT9R4XCEa2Vnc1EtTWdZm6g==
X-Authority-Analysis: v=2.4 cv=P/Y3RyAu c=1 sm=1 tr=0 ts=693231c7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=MOl3Vg1xW4PLRbHwqxUA:9 a=Mm_3ml_JzrRrl0x6:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 21zJQzNdpKDwgWSBSrNrpQ9ttIW2pPZS
X-Proofpoint-ORIG-GUID: 21zJQzNdpKDwgWSBSrNrpQ9ttIW2pPZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_171344_354577_37B1CE72 
X-CRM114-Status: GOOD (  29.44  )
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



On 12/3/2025 11:48 PM, Suzuki K Poulose wrote:
> Cc: Greg
> 
> On 03/12/2025 09:00, Songwei Chai wrote:
>> We propose creating a new qcom directory under drivers/hwtracing
>> to host this TGU driver, as well as additional Qualcomm-specific
>> hwtracing drivers that we plan to submit in the coming months.
>> This structure will help organize vendor-specific implementations
>> and facilitate future development and maintenance.
>>
>> Feedback from the community on this proposal is highly appreciated.
>>
>> - Why we are proposing this:
>>
>> TGU has the ability to monitor signal conditions and trigger debug- 
>> related
>> actions, serving as a programmable hardware component that enhances 
>> system
>> trace and debug capabilities. Placing it under drivers/hwtracing 
>> aligns with
>> its function as a trace generation utility.
>>
>> We previously attempted to push this driver to drivers/hwtracing/ 
>> coresight,
>> but did not receive support from the maintainers of the CoreSight 
>> subsystem.
>> The reason provided was: “This component is primarily a part of the
>> Qualcomm proprietary QPMDA subsystem, and is capable of operating
>> independently from the CoreSight hardware trace generation system.”
>>
>> Chat history : https://lore.kernel.org/all/ 
>> CAJ9a7ViKxHThyZfFFDV_FkNRimk4uo1NrMtQ-kcaj1qO4ZcGnA@mail.gmail.com/
>>
>> Given this, we have been considering whether it would be appropriate
>> to create a dedicated drivers/hwtracing/qcom directory for
>> Qualcomm-related hwtracing drivers. This would follow the precedent set
>> by Intel, which maintains its own directory at drivers/hwtracing/ 
>> intel_th.
>> We believe this structure would significantly facilitate
>> future submissions of related Qualcomm drivers.
>>
>> - Maintenance of drivers/hwtracing/qcom:
>>
> 
> Fine by, me.
> 
> 
>> Bjorn, who maintains linux-arm-msm, will be the maintainer of this
>> directory — we’ve discussed this with him and he’s aware that his task
>> list may grow accordingly. Additionally, Qualcomm engineers familiar with
>> the debug hardware — such as [Tingwei Zhang, Jinlong Mao, Songwei Chai],
>> will be available to review incoming patches and support ongoing
>> development.
>>
>> - Detail for TGU:
>>
>> This component can be utilized to sense a plurality of signals and
>> create a trigger into the CTI or generate interrupts to processors
>> once the input signal meets the conditions. We can treat the TGU’s
>> workflow as a flowsheet, it has some “steps” regions for customization.
>> In each step region, we can set the signals that we want with priority
>> in priority_group, set the conditions in each step via condition_decode,
>> and set the resultant action by condition_select. Meanwhile,
>> some TGUs (not all) also provide timer/counter functionality.
>> Based on the characteristics described above, we consider the TGU as a
>> helper in the CoreSight subsystem. Its master device is the TPDM, which
>> can transmit signals from other subsystems, and we reuse the existing
>> ports mechanism to link the TPDM to the connected TGU.
> 
> Please remove the coresight_device and other dependencies. You may use
> generic bits, CS_LOCK/UNLOCK etc. But including coresight-priv.h is
> not something I would prefer. It brings in unnecessary dependencies
> between two subsystems and I don't see any reason for using -priv.h.
> It is named as it is, for a reason, coresight private definitions.
> 
> 
>>
>> Here is a detailed example to explain how to use the TGU:
>>
>> In this example, the TGU is configured to use 2 conditions, 2 steps, and
>> the timer. The goal is to look for one of two patterns which are 
>> generated
>> from TPDM, giving priority to one, and then generate a trigger once the
>> timer reaches a certain value. In other words, two conditions are used
>> for the first step to look for the two patterns, where the one with the
>> highest priority is used in the first condition. Then, in the second 
>> step,
>> the timer is enabled and set to be compared to the given value at each
>> clock cycle. These steps are better shown below.
>>                |-----------------|
>>                |                 |
>>                |       TPDM      |
>>                |                 |
>>                |-----------------|
>>                         |
>>                         |
>>      --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
>> ------
>>      |                  | 
>>                                                  |
>>      |                  |                          
>> |--------------------| |
>>      |    |---- --->    |                          |  Go to next 
>> steps  | |
>>      |    |             |                |--- ---> |  Enable 
>> timer      | |
>>      |    |             v                |         | 
>>                     | |
>>      |    |    |-----------------|       |         
>> |--------------------| |
>>      |    |    |                 |  Yes  |                    | 
>>            |
>>      |    |    |   inputs==0xB   | ----->|                    | 
>> <-------- |
>>      |    |    |                 |       |                    |      
>> No | |
>>      | No |    |-----------------|       |                    
>> v         | |
>>      |    |             |                |          
>> |-----------------| | |
>>      |    |             |                |          |                 
>> | | |
>>      |    |             |                |          |      timer>=3   
>> |-- |
>>      |    |             v                |          |                 
>> |   |
>>      |    |    |-----------------|       |          
>> |-----------------|   |
>>      |    |    |                 |  Yes  |                    | 
>>            |
>>      |    |--- |   inputs==0xA   | ----->|                    | 
>> Yes       |
>>      |         |                 |                            | 
>>            |
>>      |         |-----------------|                            
>> v           |
>>      |                                              
>> |-----------------|   |
>>      |                                              |                 
>> |   |
>>      |                                              |      Trigger    
>> |   |
>>      |                                              |                 
>> |   |
>>      |                                              
>> |-----------------|   |
>>      |  TGU                                                   | 
>>            |
>>      |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- --- 
>> -- |
>>                                                               |
>>                                                               v
>>                                                      |-----------------|
>>                                                      |The controllers  |
>>                                                      |which will use   |
>>                                                      |triggers further |
>>                                                      |-----------------|
>>
>> steps:
>>      1. Reset TGU /*it will disable tgu and reset dataset*/
>>      - echo 1 > /sys/bus/coresight/devices/<tgu-name>/reset_tgu
>>
>>      2. Set the pattern match for priority0 to 0xA = 0b1010 and for
>>         priority 1 to 0xB = 0b1011.
>>      - echo 0x11113232 > /sys/bus/coresight/devices/<tgu-name>/ 
>> step0_priority0/reg0
>>      - echo 0x11113233 > /sys/bus/coresight/devices/<tgu-name>/ 
>> step0_priority1/reg0
> 
> Why do they need to be coresight devices and appear on the coresight bus 
> if they are not coresight devices ? As I understand they are simply
> devices with some sysfs knobs.
> 
> Otherwise, happy with the proposal
> 
> 
> Suzuki

Hi Suzuki,

Would it be a good idea to register the TGU device as a platform device 
so that it will appear under "/sys/devices/platform/" and the code could 
also be decoupled from coresight-priv.h

BRs,
Songwei>
> 
> 
> 
>>
>>      Note:
>>          Bit distribution diagram for each priority register
>>      
>> |-------------------------------------------------------------------|
>>      |   Bits          |       Field Nam   |    
>> Description              |
>>      
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     29:28       |   SEL_BIT7_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>>      
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     25:24       |   SEL_BIT6_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>>      
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     21:20       |   SEL_BIT5_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>>      
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     17:16       |   SEL_BIT4_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>>      
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     13:12       |   SEL_BIT3_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>>      
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |      9:8        |   SEL_BIT2_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>>      
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |      5:4        |  SEL_BIT1_TYPE2   | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>>      
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |      1:0        |  SEL_BIT0_TYPE2   | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>>      
>> |-------------------------------------------------------------------|
>>      These bits are used to identify the signals we want to sense, with
>>      a maximum signal number of 140. For example, to sense the signal
>>      0xA (binary 1010), we set the value of bits 0 to 13 to 3232, which
>>      represents 1010. The remaining bits are set to 1, as we want to use
>>      AND gate to summarize all the signals we want to sense here. For
>>      rising or falling edge detection of any input to the priority, set
>>      the remaining bits to 0 to use an OR gate.
>>
>>      3. look for the pattern for priority_i i=0,1.
>>      - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/ 
>> step0_condition_decode/reg0
>>      - echo 0x30 > /sys/bus/coresight/devices/<tgu-name>/ 
>> step0_condition_decode/reg1
>>
>>      
>> |-------------------------------------------------------------------------------|
>>      |   Bits          |    Field Nam        |            
>> Description                |
>>      
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |For each decoded 
>> condition, this       |
>>      |      24         |       NOT           |inverts the output. If 
>> the condition   |
>>      |                 |                     |decodes to true, and the 
>> NOT field     |
>>      |                 |                     |is '1', then the output 
>> is NOT true.   |
>>      
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from 
>> the associated|
>>      |      21         |  BC0_COMP_ACTIVE    |comparator will be 
>> actively included in|
>>      |                 |                     |the decoding of this 
>> particular        |
>>      |                 |                     | 
>> condition.                             |
>>      
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from 
>> the associated|
>>      |                 |                     |comparator will need to 
>> be 1 to affect |
>>      |      20         |   BC0_COMP_HIGH     |the decoding of this 
>> condition.        |
>>      |                 |                     |Conversely, a '0' here 
>> requires a '0'  |
>>      |                 |                     |from the 
>> comparator                    |
>>      
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from 
>> the associated|
>>      |      17         |                     |comparator will be 
>> actively included in|
>>      |                 |  TC0_COMP_ACTIVE    |the decoding of this 
>> particular        |
>>      |                 |                     | 
>> condition.                             |
>>      
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from 
>> the associated|
>>      |                 |                     |comparator will need to 
>> be 1 to affect |
>>      |      16         |  TC0_COMP_HIGH      |the decoding of this 
>> particular        |
>>      |                 |                     |condition.Conversely, a 
>> 0 here         |
>>      |                 |                     |requires a '0' from the 
>> comparator     |
>>      
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from 
>> Priority_n    |
>>      |                 |                     |OR logic will be 
>> actively              |
>>      |     4n+3        | Priority_n_OR_ACTIVE|included in the decoding 
>> of            |
>>      |                 |    (n=0,1,2,3)      |this particular 
>> condition.             |
>>      |                 |                     | 
>>                                        |
>>      
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from 
>> Priority_n    |
>>      |                 |                     |will need to be '1' to 
>> affect the      |
>>      |     4n+2        |  Priority_n_OR_HIGH |decoding of this 
>> particular            |
>>      |                 |    (n=0,1,2,3)      |condition. Conversely, a 
>> '0' here      |
>>      |                 |                     |requires a '0' from 
>> Priority_n OR logic|
>>      
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from 
>> Priority_n    |
>>      |                 |                     |AND logic will be 
>> actively             |
>>      |     4n+1        |Priority_n_AND_ACTIVE|included in the decoding 
>> of this       |
>>      |                 |  (n=0,1,2,3)        |particular 
>> condition.                  |
>>      |                 |                     | 
>>                                        |
>>      
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from 
>> Priority_n    |
>>      |                 |                     |AND logic will need to 
>> be '1' to       |
>>      |      4n         | Priority_n_AND_HIGH |affect the decoding of 
>> this            |
>>      |                 |   (n=0,1,2,3)       |particular condition. 
>> Conversely,      |
>>      |                 |                     |a '0' here requires a 
>> '0' from         |
>>      |                 |                     |Priority_n AND 
>> logic.                  |
>>      
>> |-------------------------------------------------------------------------------|
>>      Since we use `priority_0` and `priority_1` with an AND output in 
>> step 2, we set `0x3`
>>      and `0x30` here to activate them.
>>
>>      4. Set NEXT_STEP = 1 and TC0_ENABLE = 1 so that when the conditions
>>         are met then the next step will be step 1 and the timer will 
>> be enabled.
>>      - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/ 
>> step0_condition_select/reg0
>>      - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/ 
>> step0_condition_select/reg1
>>
>>      
>> |-----------------------------------------------------------------------------|
>>      |   Bits          |       Field Nam   |            
>> Description                |
>>      
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This field defines the 
>> next step the   |
>>      |    18:17        |     NEXT_STEP     |TGU will 'goto' for the 
>> associated     |
>>      |                 |                   |Condition and 
>> Step.                    |
>>      
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |For each possible output 
>> trigger       |
>>      |    13           |     TRIGGER       |available, set a '1' if 
>> you want       |
>>      |                 |                   |the trigger to go active 
>> for the       |
>>      |                 |                   |associated condition and 
>> Step.         |
>>      
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will cause BC0 to 
>> increment if the|
>>      |    9            |     BC0_INC       |associated Condition is 
>> decoded for    |
>>      |                 |                   |this 
>> step.                             |
>>      
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will cause BC0 to 
>> decrement if the|
>>      |    8            |     BC0_DEC       |associated Condition is 
>> decoded for    |
>>      |                 |                   |this 
>> step.                             |
>>      
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will clear BC0 count 
>> value to 0 if|
>>      |    7            |     BC0_CLEAR     |the associated Condition 
>> is decoded    |
>>      |                 |                   |for this 
>> step.                         |
>>      
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will cause TC0 to 
>> increment until |
>>      |    3            |     TC0_ENABLE    |paused or cleared if the 
>> associated    |
>>      |                 |                   |Condition is decoded for 
>> this step.    |
>>      
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will cause TC0 to 
>> pause until     |
>>      |    2            |     TC0_PAUSE     |enabled if the associated 
>> Condition    |
>>      |                 |                   |is decoded for this 
>> step.              |
>>      
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will clear TC0 count 
>> value to 0   |
>>      |    1            |     TC0_CLEAR     |if the associated 
>> Condition is         |
>>      |                 |                   |decoded for this 
>> step.                 |
>>      
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will set the done 
>> signal to the   |
>>      |    0            |     DONE          |TGU FSM if the associated 
>> Condition    |
>>      |                 |                   |is decoded for this 
>> step.              |
>>      
>> |-----------------------------------------------------------------------------|
>>      Based on the distribution diagram, we set `0x20008` for 
>> `priority0` and `priority1` to
>>      achieve "jump to step 1 and enable TC0" once the signal is sensed.
>>
>>      5. activate the timer comparison for this step.
>>      -  echo 0x30000  > /sys/bus/coresight/devices/<tgu-name>/ 
>> step1_condition_decode/reg0
>>
>>      
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from 
>> the associated|
>>      |      17         |                     |comparator will be 
>> actively included in|
>>      |                 |  TC0_COMP_ACTIVE    |the decoding of this 
>> particular        |
>>      |                 |                     | 
>> condition.                             |
>>      
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output from 
>> the associated|
>>      |                 |                     |comparator will need to 
>> be 1 to affect |
>>      |      16         |  TC0_COMP_HIGH      |the decoding of this 
>> particular        |
>>      |                 |                     |condition.Conversely, a 
>> 0 here         |
>>      |                 |                     |requires a '0' from the 
>> comparator     |
>>      
>> |-------------------------------------------------------------------------------|
>>      Accroding to the decode distribution diagram , we give 0x30000 
>> here to set 16th&17th bit
>>      to enable timer comparison.
>>
>>      6. Set the NEXT_STEP = 0 and TC0_PAUSE = 1 and TC0_CLEAR = 1 once 
>> the timer
>>         has reached the given value.
>>      - echo 0x6 > /sys/bus/coresight/devices/<tgu-name>/ 
>> step1_condition_select/reg0
>>
>>      7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
>>         i.e. when the timer reaches 3.
>>      - echo 0x2000 > /sys/bus/coresight/devices/<tgu-name>/ 
>> step1_condition_select/default
>>
>>      Note:
>>          1. 'default' register allows for establishing the resultant 
>> action for
>>          the default condition
>>
>>          2. Trigger:For each possible output trigger available from
>>          the Design document, there are three triggers: interrupts, CTI,
>>          and Cross-TGU mapping.All three triggers can occur, but
>>          the choice of which trigger to use depends on the user's
>>          needs.
>>
>>      8. Compare the timer to 3 in step 1.
>>      - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step1_timer/reg0
>>
>>      9. enale tgu
>>      - echo 1 > /sys/bus/coresight/devices/<tgu-name>/enable_tgu
>> ---
>> Link to V7: https://lore.kernel.org/all/20251104064043.88972-1- 
>> songwei.chai@oss.qualcomm.com/
>>
>> Changes in V8:
>> - Add "select" section in bindings.
>> - Update publish date in "sysfs-bus-coresight-devices-tgu".
>> ---
>> Link to V6: https://lore.kernel.org/all/20250709104114.22240-1- 
>> songchai@qti.qualcomm.com/
>>
>> Changes in V7:
>> - Move the TGU code location from 'drivers/hwtracing/coresight/' to 
>> 'drivers/hwtracing/qcom/'.
>> - Rename the spinlock used in the code from 'spinlock' to 'lock'.
>> - Perform the 'calculate_array_location' separately, instead of doing 
>> it within the function.
>> - Update the sender email address.
>> ---
>> Link to V5: https://lore.kernel.org/all/20250529081949.26493-1- 
>> quic_songchai@quicinc.com/
>>
>> Changes in V6:
>> - Replace spinlock with guard(spinlock) in tgu_enable.
>> - Remove redundant blank line.
>> - Update publish date and contact member's name in "sysfs-bus- 
>> coresight-devices-tgu".
>> ---
>> Link to V4: https://patchwork.kernel.org/project/linux-arm-msm/ 
>> cover/20250423101054.954066-1-quic_songchai@quicinc.com/
>>
>> Changes in V5:
>> - Update publish date and kernel_version in "sysfs-bus-coresight- 
>> devices-tgu"
>> ---
>> Link to V3: https://lore.kernel.org/all/20250227092640.2666894-1- 
>> quic_songchai@quicinc.com/
>>
>> Changes in V4:
>> - Add changlog in coverletter.
>> - Correct 'year' in Copyright in patch1.
>> - Correct port mechansim description in patch1.
>> - Remove 'tgu-steps','tgu-regs','tgu-conditions','tgu-timer-counters' 
>> from dt-binding
>> and set them through reading DEVID register as per Mike's suggestion.
>> - Modify tgu_disable func to make it have single return point in 
>> patch2 as per
>> Mike's suggestion.
>> - Use sysfs_emit in enable_tgu_show func in ptach2.
>> - Remove redundant judgement in enable_tgu_store in patch2.
>> - Correct typo in description in patch3.
>> - Set default ret as SYSFS_GROUP_INVISIBLE, and returnret at end in 
>> pacth3 as
>> per Mike's suggestion.
>> - Remove tgu_dataset_ro definition in patch3
>> - Use #define constants with explanations of what they are rather than
>> arbitrary magic numbers in patch3 and patch4.
>> - Check -EINVAL before using 'calculate_array_location()' in array in 
>> patch4.
>> - Add 'default' in 'tgu_dataset_show''s switch part in patch4.
>> - Document the value needed to initiate the reset in pacth7.
>> - Check "value" in 'reset_tgu_store' and bail out with an error code 
>> if 0 in patch7.
>> - Remove dev_dbg in 'reset_tgu_store' in patch7.
>> ---
>> Link to V2: https://lore.kernel.org/all/20241010073917.16023-1- 
>> quic_songchai@quicinc.com/
>>
>> Changes in V3:
>> - Correct typo and format in dt-binding in patch1
>> - Rebase to the latest kernel version
>> ---
>> Link to V1: https://lore.kernel.org/all/20240830092311.14400-1- 
>> quic_songchai@quicinc.com/
>>
>> Changes in V2:
>>   - Use real name instead of login name,
>>   - Correct typo and format in dt-binding and code.
>>   - Bring order in tgu_prob(declarations with and without assignments) 
>> as per
>> Krzysztof's suggestion.
>>   - Add module device table in patch2.
>>   - Set const for tgu_common_grp and tgu_ids in patch2.
>>   - Initialize 'data' in tgu_ids to fix the warning in pacth2.
>> ---
>>
>> Songwei Chai (7):
>>    dt-bindings: arm: Add support for Qualcomm TGU trace
>>    qcom-tgu: Add TGU driver
>>    qcom-tgu: Add signal priority support
>>    qcom-tgu: Add TGU decode support
>>    qcom-tgu: Add support to configure next action
>>    qcom-tgu: Add timer/counter functionality for TGU
>>    qcom-tgu: Add reset node to initialize
>>
>>   .../testing/sysfs-bus-coresight-devices-tgu   |  51 ++
>>   .../devicetree/bindings/arm/qcom,tgu.yaml     |  92 +++
>>   drivers/Makefile                              |   1 +
>>   drivers/hwtracing/Kconfig                     |   2 +
>>   drivers/hwtracing/qcom/Kconfig                |  18 +
>>   drivers/hwtracing/qcom/Makefile               |   3 +
>>   drivers/hwtracing/qcom/tgu.c                  | 737 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  | 252 ++++++
>>   8 files changed, 1156 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>> devices-tgu
>>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>>   create mode 100644 drivers/hwtracing/qcom/Makefile
>>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>>
> 


