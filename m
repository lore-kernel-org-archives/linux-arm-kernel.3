Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806A6C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJibrsgdKpLgM3AS+ocnljTMwAJGOjWt6hZZVaI3eDI=; b=i8+dsgbHk0n7gss0mAWtfCpxMe
	J3gQD8tEAu/rX/mhDQ9NogKH8mmNxDddJ5yi1Ih6eAVYZjWN9zaIyvTb0Skj6myubF/wcwk/pC2RU
	PqqFWsZgT5KCqoJvMe8nqAMe+CkzszscCleg5BvdKKzAkKWOnnNbxVL58aDhsFHJRFDHBfNsWnPkN
	teuoNdsiN8fKC1U0HDYJ15A60fe9vSKbE5KQubbk3F2a5VoTaW1yUNJC+eXsAyraETEZ3Qw+xjNkN
	ZUTOLNEvtEV0DH+hxEgCv0ysURomMhpZnbnl/+frXfOLveewWOrn0+4/ELm3KALPjVPvzuKIxTeoo
	CfaXhATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuR3E-00000000CMQ-2YX4;
	Thu, 13 Aug 2026 08:44:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuR3C-00000000CM4-0GBo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:44:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5fmRb2974510
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 08:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJibrsgdKpLgM3AS+ocnljTMwAJGOjWt6hZZVaI3eDI=; b=ImetMsYpVuNho+kC
	2M2Q/8woDuxyzkigS7XYJLqrtznt6ivjARPDSIlMJTzax8BI0rSHIg0nAT/rz4ym
	UjhsePoIw/2q6XbQAyghBrdZn1zsQX4efynQqEpyAgUAytyJRKEtWyR0/1PKk3lJ
	/Llkm7WdydxAN+yukNYK9d4aA61r/KS5KqsqEHCC0bBbA70AfrR//YJQcGj4y+OA
	VDwiYcsEQ8fHfFtLsV8mj9XaK2ua4Aw/84CUvRYl39e2ZDIt6+/M2EKuH+SPVQLz
	5vSw/rIV4O1zrX5XOtvT6u0qgZcbjKgwRqNwXuiQEFhmAgTL8RfrOF3jJOdwlP59
	lnMfkw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g152m9cfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 08:44:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84eee2147ffso587749b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786610672; x=1787215472; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJibrsgdKpLgM3AS+ocnljTMwAJGOjWt6hZZVaI3eDI=;
        b=Dty+UNYCFywFE5ITSHApFppx8LUoCabWJGYn2WFs3/P5t+xAIEe3mfJFyOqwhK21A1
         XK9Wg/9jUKpBnQMPd3PvPr0xDXhnc90Tg8OOV8EO5fxvyfWDEoRaBt3RZl8zkrI0WAda
         3TO4i8OKhDWSPlHQLDtWmtKItDV9UuXvxMdHLt7ODcXIQvomJod4ABn3A5cG9P587pKm
         6vyKWAyfltEgVMgKfgUuRyDY+np7679VjQnh15tWJw/Eb5R4wif1cXDUrtbQpzzptWxM
         Okd73aXMOOyDYYo8XD5+Mh9yObS5XlV8GJQ+blm3BrRsKGamP20HGD/p0rs6rNxum8sA
         y+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610672; x=1787215472;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJibrsgdKpLgM3AS+ocnljTMwAJGOjWt6hZZVaI3eDI=;
        b=d6u9kWus4MwX8oHmPYuMR92x6OlKedmVFA0AC4Aw4xWT5F+iEdsOHNWxCQyB+DX0M3
         XGvbuKhuMCTl2kZuMlllmW1NHo0CPYspVpIny4TNTHZxOspL2ltBJ9Zm8fL6c35wLa54
         v8aYzKkXltUoVP2iZh6sydBKbOU9SSauh0pgT81xnX76CId0tQ1qBECG+Alae7uI7TnO
         IzeHVhGjTOJXyYcgrxMnOFY+78IEEXzboacgSPHmHmn9B0oZDhJHB2eYBFVHVr3P6Mq8
         N1HJi6eeoyR7h1t+2Qz0mq+72ol3RAIYggOGNrHo03+Q/AAe0sFb0K+GMP37BWwQ5aOP
         V2pA==
X-Forwarded-Encrypted: i=1; AHgh+RotdrhQWHHYXMdQu8qfl/8tiT6/jLtfP9u29fXhNAx5NjMnhTZ3AATP50pr8AAPlwRNl+5I4HiJVDlrFqhHRU+o@lists.infradead.org
X-Gm-Message-State: AOJu0YxtC58Bh6ESCRnSY92ctRrL2eK3pBvLvcoFP5Fk0smmmEeWbDFv
	mzmnrdyfRkuWe/EZ4ANdlSbSi7i1llT/jbF0TkTo5PLrsTx902GSY1ZwWOCy0+B53DOfu+cm2Ga
	co/Vp+j3EjYzT5pNLELujUa0xWDx5DaJkLIxUensNU/KkCFzjy2TCH6vnht5gRsj6ztZC3ZfT9g
	E99Q==
X-Gm-Gg: AR+sD11PW9TttAaiWTcs7sRYNSmHEcbjTHJ/JNdUjRjEOjhev1VO6W51+NfMHpoZjxj
	jrdEx+mklc+X2G4r40Mg7E0UsLCkabHo0ea9fgNtQOzgrzhxiMWrfLLaKDfv5KnEhLngkwEcf/4
	1hc0vllOW452UknWQmheK2PureA1vn7ghem3JEntt8DhizVrbdpcRUttW5XedmNE3yt0jfSzPxX
	Xh+htcDIiPdDGbsmVNfb7wIGi6SC6J2MkwFgI/GkPNGzK2l52sC4pcWRxGYT9N/odEeleJ66n9S
	frG4wD6znDys5KoIFLt7MEntV6vvNiJQbc7GwZPRYCDJKJTRJK0Yh31RgsgXnqtkb2p7vnNTtVU
	lyI4q2CBTWnv5b16MbC+uzl/Ssyay56Qp9K2Vuzv17wzR7O0mFpiisIHccELHJGKOCrXaZyS7
X-Received: by 2002:a05:6a00:1151:b0:84f:a7bf:8fb9 with SMTP id d2e1a72fcca58-84fc749372emr4167093b3a.3.1786610672053;
        Thu, 13 Aug 2026 01:44:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:1151:b0:84f:a7bf:8fb9 with SMTP id d2e1a72fcca58-84fc749372emr4167019b3a.3.1786610671230;
        Thu, 13 Aug 2026 01:44:31 -0700 (PDT)
Received: from [10.133.33.239] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef710a897sm620776a12.18.2026.08.13.01.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 01:44:30 -0700 (PDT)
Message-ID: <f8b85eab-3796-4380-a006-4398aa2efe0b@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 16:40:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 0/7] Provide support for Trigger Generation Unit
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songchai@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <77859de2-62b9-4575-ba6e-3ee6bd73125c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <77859de2-62b9-4575-ba6e-3ee6bd73125c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA2MCBTYWx0ZWRfXyJd2IYLPNKMK
 eb/TANrpi59OB+WGZFTQhT0yNi4JdBGRHA02CALnHJIQEv49rnwQXQz2lnSnIvIK2Ye38bepnlN
 h3T1vU7aLRSMqCPKyG2LYVlKf8+27aY=
X-Proofpoint-GUID: 0BvEimQmkhdwZiUUOzXoctORPDx31lD8
X-Authority-Analysis: v=2.4 cv=D8R37PRj c=1 sm=1 tr=0 ts=6a7d83f1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=5eLzQ0bWK4boSlSgYO8A:9 a=MVWzkhXIBweMGwdD:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA2MCBTYWx0ZWRfX3rQcbusqYKhk
 6zKJi8BqYzHE7GCRHBBs8Ceal6zPJSQZtqgzFTklmxV5BmV0PNCY7Yo5imj+e4iVBURE9787nPL
 oo2ovVNx3nxl8Q49f4Uikct2/IaP4MXGeEIeF/fDiqgkE+zpTCApmOaJeinmuJZn+h/DVhUnQxI
 L7eFKVVYnCr8y4madQ8JxqKKP2iSQtVJsycCVQ2FLfI0q70s203066FjgzS/yJ8thSocscPA2ij
 WTRkP5AQeQ5iuekqRqckmCB/wC22vbniEV5D5Puvwdv2QaKrrN8QyemrAGLMgOVuHMs95t7XdTF
 fph0SzLWO+UL3BDcQ5dkpStfFN1Phj7Y0mskJiLbWWaCNyyj57nG5ycb1yjQeWK1F00r0G3A0HI
 J6Qh4rieD890AYipKahDfEGZ1ZRkkdfIjrOOWcFaO7IE+9qgmOUTrUXqq6BM+h9nXq6jsjOhLoa
 ovfdo+fC8t5/kOjHtuQ==
X-Proofpoint-ORIG-GUID: 0BvEimQmkhdwZiUUOzXoctORPDx31lD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_014434_123802_9C8D0B40 
X-CRM114-Status: GOOD (  40.78  )
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

Gentle Reminder.

On 8/6/2026 1:30 PM, Songwei.Chai wrote:
> Hi Suzuki,
>
> Hope you're doing well.
>
> First of all, thank you again for agreeing to take the Qualcomm TGU 
> driver through the CoreSight tree. We really appreciate your 
> willingness to support this submission path.
>
> We understand that, as a maintainer, you are naturally cautious about 
> any code that goes through the CoreSight tree, especially when it 
> involves introducing a new driver. That's completely reasonable, and 
> we appreciate the level of scrutiny you apply to code entering the 
> subsystem.
>
> Since the initial submission, the TGU driver has gone through several 
> rounds of review and refinement. In addition to multiple rounds of 
> human review, it has also been reviewed by Sashiko. For the issues 
> identified as false positives by Sashiko, I've provided clarifications 
> in the corresponding discussions. Each review cycle has helped improve 
> the overall code quality and robustness of the driver. Hopefully this 
> helps address some of the concerns around introducing new code into 
> the tree.
>
> As some background, TGU is a new Qualcomm debug and tracing hardware 
> block designed to improve developers' debugging efficiency and 
> flexibility. We would very much like developers to be able to use this 
> hardware directly with upstream Linux rather than relying on 
> downstream patches or additional integration work.
>
> When you have some time, would you mind taking another look at the 
> series and sharing any remaining concerns or review feedback? We'd be 
> happy to address any issues that would help move the submission forward.
>
> Thank you for your time and continued support.
>
> Best regards,
>
> Songwei
>
> On 7/30/2026 4:06 PM, Songwei Chai wrote:
>> From: Songwei Chai <songchai@qti.qualcomm.com>
>>
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
>> TGU has the ability to monitor signal conditions and trigger 
>> debug-related
>> actions, serving as a programmable hardware component that enhances 
>> system
>> trace and debug capabilities. Placing it under drivers/hwtracing aligns
>> with its function as a trace generation utility.
>>
>> We previously attempted to push this driver to 
>> drivers/hwtracing/coresight,
>> but did not receive support from the maintainers of the CoreSight
>> subsystem. The reason provided was: “This component is primarily a part
>> of the Qualcomm proprietary QPMDA subsystem, and is capable of operating
>> independently from the CoreSight hardware trace generation system.”
>>
>> Chat history : 
>> https://lore.kernel.org/all/CAJ9a7ViKxHThyZfFFDV_FkNRimk4uo1NrMtQ-kcaj1qO4ZcGnA@mail.gmail.com/
>>
>> Given this, we have been considering whether it would be appropriate
>> to create a dedicated drivers/hwtracing/qcom directory for
>> Qualcomm-related hwtracing drivers. This would follow the precedent set
>> by Intel, which maintains its own directory at 
>> drivers/hwtracing/intel_th.
>> We believe this structure would significantly facilitate
>> future submissions of related Qualcomm drivers.
>>
>> - Maintenance of drivers/hwtracing/qcom:
>>
>> Bjorn, who maintains linux-arm-msm, will be the maintainer of this
>> directory — we’ve discussed this with him and he’s aware that his task
>> list may grow accordingly. Additionally, Qualcomm engineers familiar 
>> with
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
>>                     |-----------------|
>>                |                 |
>>                |       TPDM      |
>>                |                 |
>>                |-----------------|
>>                         |
>>                         |
>>      --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
>> ------
>>      | |                                                 |
>>      |                  | |--------------------| |
>>      |    |---- --->    |                          |  Go to next 
>> steps  | |
>>      |    |             |                |--- ---> |  Enable 
>> timer      | |
>>      |    |             v                | |                    | |
>>      |    |    |-----------------|       | |--------------------| |
>>      |    |    |                 |  Yes  | |           |
>>      |    |    |   inputs==0xB   | ----->| | <-------- |
>>      |    |    |                 |       | |      No | |
>>      | No |    |-----------------|       | v         | |
>>      |    |             |                | |-----------------| | |
>>      |    |             |                | |                 | | |
>>      |    |             |                |          | timer>=3   |-- |
>>      |    |             v                | |                 |   |
>>      |    |    |-----------------|       | |-----------------|   |
>>      |    |    |                 |  Yes  | |           |
>>      |    |--- |   inputs==0xA   | ----->| | Yes       |
>>      |         |                 | |           |
>>      |         |-----------------| v           |
>>      | |-----------------|   |
>>      | |                 |   |
>>      |                                              | Trigger    |   |
>>      | |                 |   |
>>      | |-----------------|   |
>>      |  TGU |           |
>>      |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- 
>> --- -- |
>>                                                               |
>>                                                               v
>> |-----------------|
>>                                                      |The controllers  |
>>                                                      |which will use   |
>>                                                      |triggers further |
>> |-----------------|
>>
>> steps:
>>      1. Reset TGU /*it will disable tgu and reset dataset*/
>>      - echo 1 > /sys/bus/amba/devices/<tgu-name>/reset_tgu
>>
>>      2. Set the pattern match for priority0 to 0xA = 0b1010 and for
>>         priority 1 to 0xB = 0b1011.
>>      - echo 0x11113232 > 
>> /sys/bus/amba/devices/<tgu-name>/step0_priority0/reg0
>>      - echo 0x11113233 > 
>> /sys/bus/amba/devices/<tgu-name>/step0_priority1/reg0
>>
>>      Note:
>>          Bit distribution diagram for each priority register
>> |-------------------------------------------------------------------|
>>      |   Bits          |       Field Nam   | Description              |
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     29:28       |   SEL_BIT7_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     25:24       |   SEL_BIT6_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     21:20       |   SEL_BIT5_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     17:16       |   SEL_BIT4_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     13:12       |   SEL_BIT3_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |      9:8        |   SEL_BIT2_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |      5:4        |  SEL_BIT1_TYPE2   | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |      1:0        |  SEL_BIT0_TYPE2   | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
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
>>      - echo 0x3 > 
>> /sys/bus/amba/devices/<tgu-name>/step0_condition_decode/reg0
>>      - echo 0x30 > 
>> /sys/bus/amba/devices/<tgu-name>/step0_condition_decode/reg1
>>
>> |-------------------------------------------------------------------------------|
>>      |   Bits          |    Field Nam        | 
>> Description                |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |For each decoded 
>> condition, this       |
>>      |      24         |       NOT           |inverts the output. If 
>> the condition   |
>>      |                 |                     |decodes to true, and 
>> the NOT field     |
>>      |                 |                     |is '1', then the output 
>> is NOT true.   |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from the associated|
>>      |      21         |  BC0_COMP_ACTIVE    |comparator will be 
>> actively included in|
>>      |                 |                     |the decoding of this 
>> particular        |
>>      |                 | |condition.                             |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from the associated|
>>      |                 |                     |comparator will need to 
>> be 1 to affect |
>>      |      20         |   BC0_COMP_HIGH     |the decoding of this 
>> condition.        |
>>      |                 |                     |Conversely, a '0' here 
>> requires a '0'  |
>>      |                 |                     |from the 
>> comparator                    |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from the associated|
>>      |      17         |                     |comparator will be 
>> actively included in|
>>      |                 |  TC0_COMP_ACTIVE    |the decoding of this 
>> particular        |
>>      |                 | |condition.                             |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from the associated|
>>      |                 |                     |comparator will need to 
>> be 1 to affect |
>>      |      16         |  TC0_COMP_HIGH      |the decoding of this 
>> particular        |
>>      |                 | |condition.Conversely, a 0 here         |
>>      |                 |                     |requires a '0' from the 
>> comparator     |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from Priority_n    |
>>      |                 |                     |OR logic will be 
>> actively              |
>>      |     4n+3        | Priority_n_OR_ACTIVE|included in the 
>> decoding of            |
>>      |                 |    (n=0,1,2,3)      |this particular 
>> condition.             |
>>      |                 | |                                       |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from Priority_n    |
>>      |                 |                     |will need to be '1' to 
>> affect the      |
>>      |     4n+2        |  Priority_n_OR_HIGH |decoding of this 
>> particular            |
>>      |                 |    (n=0,1,2,3)      |condition. Conversely, 
>> a '0' here      |
>>      |                 |                     |requires a '0' from 
>> Priority_n OR logic|
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from Priority_n    |
>>      |                 |                     |AND logic will be 
>> actively             |
>>      |     4n+1        |Priority_n_AND_ACTIVE|included in the 
>> decoding of this       |
>>      |                 |  (n=0,1,2,3)        |particular 
>> condition.                  |
>>      |                 | |                                       |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from Priority_n    |
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
>> |-------------------------------------------------------------------------------|
>>      Since we use `priority_0` and `priority_1` with an AND output in 
>> step 2, we set `0x3`
>>      and `0x30` here to activate them.
>>
>>      4. Set NEXT_STEP = 1 and TC0_ENABLE = 1 so that when the conditions
>>         are met then the next step will be step 1 and the timer will 
>> be enabled.
>>      - echo 0x20008 > 
>> /sys/bus/amba/devices/<tgu-name>/step0_condition_select/reg0
>>      - echo 0x20008 > 
>> /sys/bus/amba/devices/<tgu-name>/step0_condition_select/reg1
>>
>> |-----------------------------------------------------------------------------|
>>      |   Bits          |       Field Nam   | 
>> Description                |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This field defines the 
>> next step the   |
>>      |    18:17        |     NEXT_STEP     |TGU will 'goto' for the 
>> associated     |
>>      |                 |                   |Condition and 
>> Step.                    |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |For each possible output 
>> trigger       |
>>      |    13           |     TRIGGER       |available, set a '1' if 
>> you want       |
>>      |                 |                   |the trigger to go active 
>> for the       |
>>      |                 |                   |associated condition and 
>> Step.         |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will cause BC0 to 
>> increment if the|
>>      |    9            |     BC0_INC       |associated Condition is 
>> decoded for    |
>>      |                 |                   |this 
>> step.                             |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will cause BC0 to 
>> decrement if the|
>>      |    8            |     BC0_DEC       |associated Condition is 
>> decoded for    |
>>      |                 |                   |this 
>> step.                             |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will clear BC0 count 
>> value to 0 if|
>>      |    7            |     BC0_CLEAR     |the associated Condition 
>> is decoded    |
>>      |                 |                   |for this 
>> step.                         |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will cause TC0 to 
>> increment until |
>>      |    3            |     TC0_ENABLE    |paused or cleared if the 
>> associated    |
>>      |                 |                   |Condition is decoded for 
>> this step.    |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will cause TC0 to 
>> pause until     |
>>      |    2            |     TC0_PAUSE     |enabled if the associated 
>> Condition    |
>>      |                 |                   |is decoded for this 
>> step.              |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will clear TC0 count 
>> value to 0   |
>>      |    1            |     TC0_CLEAR     |if the associated 
>> Condition is         |
>>      |                 |                   |decoded for this 
>> step.                 |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will set the done 
>> signal to the   |
>>      |    0            |     DONE          |TGU FSM if the associated 
>> Condition    |
>>      |                 |                   |is decoded for this 
>> step.              |
>> |-----------------------------------------------------------------------------|
>>      Based on the distribution diagram, we set `0x20008` for 
>> `priority0` and `priority1` to
>>      achieve "jump to step 1 and enable TC0" once the signal is sensed.
>>
>>      5. activate the timer comparison for this step.
>>      -  echo 0x30000  > 
>> /sys/bus/amba/devices/<tgu-name>/step1_condition_decode/reg0
>>
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from the associated|
>>      |      17         |                     |comparator will be 
>> actively included in|
>>      |                 |  TC0_COMP_ACTIVE    |the decoding of this 
>> particular        |
>>      |                 | |condition.                             |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from the associated|
>>      |                 |                     |comparator will need to 
>> be 1 to affect |
>>      |      16         |  TC0_COMP_HIGH      |the decoding of this 
>> particular        |
>>      |                 | |condition.Conversely, a 0 here         |
>>      |                 |                     |requires a '0' from the 
>> comparator     |
>> |-------------------------------------------------------------------------------|
>>      Accroding to the decode distribution diagram , we give 0x30000 
>> here to set 16th&17th bit
>>      to enable timer comparison.
>>
>>      6. Set the NEXT_STEP = 0 and TC0_PAUSE = 1 and TC0_CLEAR = 1 
>> once the timer
>>         has reached the given value.
>>      - echo 0x6 > 
>> /sys/bus/amba/devices/<tgu-name>/step1_condition_select/reg0
>>
>>      7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
>>         i.e. when the timer reaches 3.
>>      - echo 0x2000 > 
>> /sys/bus/amba/devices/<tgu-name>/step1_condition_select/default
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
>>      - echo 0x3 > /sys/bus/amba/devices/<tgu-name>/step1_timer/reg0
>>
>>      9. enale tgu
>>      - echo 1 > /sys/bus/amba/devices/<tgu-name>/enable_tgu
>> ---
>> Link to V15: 
>> https://lore.kernel.org/all/20260701055529.445819-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V16:
>> - Fixed enable/disable race and PM refcount handling.
>> - Fixed sysfs exposure before driver initialization.
>> - Fixed priority allocation and access races.
>> - Fixed uninitialized return value in condition decode.
>> - Fixed sysfs attribute naming collision issues.
>> - Added ABI documentation for the default node.
>> ---
>> Link to V14: 
>> https://lore.kernel.org/all/20260417073336.2712426-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V15:
>> - Add a maintainer for "drivers/hwtracing/qcom" in MAINTAINERS
>> ---
>> Link to V13: 
>> https://lore.kernel.org/all/20260402092838.341295-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V14:
>> - Fix some typos and formatting.
>> ---
>> Link to V12: 
>> https://lore.kernel.org/all/20260317032639.2393221-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V13:
>> - add ":" after "KernelVersion"
>> - add an enablement check in the enable function to avoid increasing 
>> the counter each time
>> ---
>> Link to V11: 
>> https://lore.kernel.org/all/ee1ca8e6-8e5f-47d8-8a24-f904ee2fc6d0@oss.qualcomm.com/
>>
>> Changes in V12:
>> - Remove the in-ports property from the bindings, as this device is 
>> decoupled from CoreSight.
>> - Update kernel version and date.
>> ---
>> Link to V10: 
>> https://lore.kernel.org/all/20c5406d-3e9f-4fdb-84ba-4cbe629c79b5@oss.qualcomm.com/
>>
>> Changes in V11:
>> - Change the names of members in drvdata: max_xxx -> num_xxx, enable 
>> -> enabled
>> - Use "FIELD_GET" to replace "BMVAL"
>> - Use devm_kcalloc to replace devm_kzalloc once create members of 
>> value_table
>> - Keep a consistent \n above return
>> - Keep reverse-Christmas-tree style
>> - Add checks so that the enable and reset nodes only accept 0 or 1
>> ---
>> Link to V9: 
>> https://lore.kernel.org/all/20251219065902.2296896-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V10:
>> - Modified code formatting based on Jie's feedback to improve 
>> readability.
>> - Applied inverse Christmas tree order to the variables.
>> ---
>> Link to V8: 
>> https://lore.kernel.org/all/20251203090055.2432719-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V9:
>> - Decoupled the tgu driver from coresight header file and registered 
>> it as an amba device.
>> - Retained Rob's reviewed-by tag on patch1/7 since the file remains 
>> unchanged.
>> - Updated the sysfs node path in the Documentation directory.
>> ---
>> Link to V7: 
>> https://lore.kernel.org/all/20251104064043.88972-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V8:
>> - Add "select" section in bindings.
>> - Update publish date in "sysfs-bus-coresight-devices-tgu".
>> ---
>> Link to V6: 
>> https://lore.kernel.org/all/20250709104114.22240-1-songchai@qti.qualcomm.com/
>>
>> Changes in V7:
>> - Move the TGU code location from 'drivers/hwtracing/coresight/' to 
>> 'drivers/hwtracing/qcom/'.
>> - Rename the spinlock used in the code from 'spinlock' to 'lock'.
>> - Perform the 'calculate_array_location' separately, instead of doing 
>> it within the function.
>> - Update the sender email address.
>> ---
>> Link to V5: 
>> https://lore.kernel.org/all/20250529081949.26493-1-quic_songchai@quicinc.com/
>>
>> Changes in V6:
>> - Replace spinlock with guard(spinlock) in tgu_enable.
>> - Remove redundant blank line.
>> - Update publish date and contact member's name in 
>> "sysfs-bus-coresight-devices-tgu".
>> ---
>> Link to V4: 
>> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250423101054.954066-1-quic_songchai@quicinc.com/
>>
>> Changes in V5:
>> - Update publish date and kernel_version in 
>> "sysfs-bus-coresight-devices-tgu"
>> ---
>> Link to V3: 
>> https://lore.kernel.org/all/20250227092640.2666894-1-quic_songchai@quicinc.com/
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
>> Link to V2: 
>> https://lore.kernel.org/all/20241010073917.16023-1-quic_songchai@quicinc.com/
>>
>> Changes in V3:
>> - Correct typo and format in dt-binding in patch1
>> - Rebase to the latest kernel version
>> ---
>> Link to V1: 
>> https://lore.kernel.org/all/20240830092311.14400-1-quic_songchai@quicinc.com/
>>
>> Changes in V2:
>>   - Use real name instead of login name,
>>   - Correct typo and format in dt-binding and code.
>>   - Bring order in tgu_prob(declarations with and without 
>> assignments) as per
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
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  60 ++
>>   .../devicetree/bindings/arm/qcom,tgu.yaml     |  71 ++
>>   MAINTAINERS                                   |  11 +
>>   drivers/Makefile                              |   1 +
>>   drivers/hwtracing/Kconfig                     |   2 +
>>   drivers/hwtracing/qcom/Kconfig                |  20 +
>>   drivers/hwtracing/qcom/Makefile               |   3 +
>>   drivers/hwtracing/qcom/tgu.c                  | 782 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  | 318 +++++++
>>   9 files changed, 1268 insertions(+)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>>   create mode 100644 drivers/hwtracing/qcom/Makefile
>>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>>

