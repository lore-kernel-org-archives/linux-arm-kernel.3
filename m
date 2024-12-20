Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EF2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 22:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tb+MZIyNZ8+V5XSvDcBv3P8KnQ6sRGc7noi7qEZ+pw4=; b=rFxhK40bfRsFEHn3fGXN+Fe9jR
	k9VtuSAa7zkdFFPUFZgz+zOGupkWNBf4F76t/0qC9qXoIe+g/UsQS+Lskb6jPQja6ctYXPOhz1Err
	nFokP2HvE+fZTcJpAtVCnmYWMfJJyLPsqIeJMX1+/+HksGL4PbwVjsIm7ttX+sdTTa2sXnJVdriUt
	d4pQAGlM+ySrxSR+jzYG8rVjGtijHVYFuaSzTT6wp7v8srTY2L6yFs2Wc4jLoQi8EZr6LeajHSFNk
	pZnCoHuWKgJ4gBanm70BSToW7jdSWdn3cOT/glAqKUXAuSbhETr4NhQ9i9i5UI2yFoP1d0eXmYQ/H
	UhAR+pnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOlbd-00000006Cvr-2zkP;
	Fri, 20 Dec 2024 22:36:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOlaL-00000006CqF-2dsG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 22:35:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKADmcm008511
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 22:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tb+MZIyNZ8+V5XSvDcBv3P8KnQ6sRGc7noi7qEZ+pw4=; b=P+3RqObOSCT5mluZ
	CJlQ0HLlJjUY8XOeSE6NKbcLY2tEc7Rnoddu3dheszfr8Tm2Z+9N/kAAjpcVTyQ7
	L5yx8955H5uxt+7wiyWf7pUerht5niKJQW/12ZgrYjBFY/egMoRtweqG2imyQfbW
	M8/iYolsIby9ehQvktsKiMQSTjtVKV7O32BY0zzqFHZVYk8sAZoUVlRTR/WWOv9/
	28ZJwgmKmNxexk2SsoxR2NR0hhxItdkR4rCZ7gkEY4p0LD0IwDLQ2o6kZ7qDnXpZ
	8S5yRPj+i7+HUWDNlScqvCEE2CyfacbrS/nXggJCF6PC+JTGxV/Sxa4Rmptybe2n
	lTNx/g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n6n4hq0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 22:35:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8f15481bbso6653916d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 14:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734734103; x=1735338903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb+MZIyNZ8+V5XSvDcBv3P8KnQ6sRGc7noi7qEZ+pw4=;
        b=e0hfMfC5C8L6p2pX078KMurjGugHUVuWOn2irheJKu93r3NQ1tNIUceIEXtS4qFHj6
         PWT+CqGBd8a8z2roecb9WDxEaBTuNG3g5KtHW9/iPpAgvv6c4kL7MeFB34E2/uCN03mL
         77Vh1IepKCnJ4xFCaqn1981FpL6kp7by/vQIA0tHCwoNUXGqPCepkKNxA9gppT9xNJt0
         8OqQaCM42Si70f2y9NC2RlL5sU2p8T0gD4+7O28KY6gHmR0NC3Mh8bJAUT9Ic2DNlf9e
         wV5WxZG+K7Pmd3aWNwJcPSUM4qYGcmta+n/jNmZjSZwbp/79WfZOfS25G2CE8N3sJgQN
         Tuwg==
X-Gm-Message-State: AOJu0YyNu1sEXXYk1d7aDgPkbstYVPkW2VRONxFIBXIYilzeeRiNp1V2
	ad1AJsOLRSswgrnQrXsa+OMRXDhrZ6y1h0DMNieuZLKNDOPEc6UEjzbCcp/jC+n/OTbXk6gDGUN
	Lfx76c3Rw6Kkrz2Q2PNXQe7Zqw3lBZk0WOZUcHThs/Sw+U4R+dr2iFA+i8tUNoxCiRpAZrsECC6
	R2gIOcVQ==
X-Gm-Gg: ASbGncvP6m1BhksTqfqwp3u++AsGNAarLPUYbpnoBzfmal/xv2jLkNYubSjSh24ey86
	cpQCV0nZ1VdmgHPM30sBZULD2UrY9Zjadl4DKzhJlZi+iUSO7j/PZlZZofa8aSTJqmWDvyi5x7p
	lzVwhx3+wi9Np4A28sN9UW2titp1wY+0gLvzBDyq6VqDg92HBUCVzADRcH06bmyVlFrTuMwrfZW
	WZswNiKqmJnKr594v8sQtcrR+zLtI+wpKejmwy5SAXOYZk3BNeM9ByWx9xE2h7MXeB9zhly5/Qo
	ublpCPcrTpJeHJ0HaJQCTWUPINoNUSAubSo=
X-Received: by 2002:a05:6214:54c6:b0:6d8:8ae3:ecf8 with SMTP id 6a1803df08f44-6dd2331a4acmr27523376d6.2.1734734102941;
        Fri, 20 Dec 2024 14:35:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHRJQqrdSkCSk4Dhr8LoULF5HEO4x0tsGlistHGz1mMTjqi3ftxw3DfkNlBNyBkoDTJvFQJw==
X-Received: by 2002:a05:6214:54c6:b0:6d8:8ae3:ecf8 with SMTP id 6a1803df08f44-6dd2331a4acmr27523256d6.2.1734734102602;
        Fri, 20 Dec 2024 14:35:02 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae5902sm216654666b.85.2024.12.20.14.35.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 14:35:02 -0800 (PST)
Message-ID: <b759d34a-60fc-4b34-a95b-4cc1c4a68bc7@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 23:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9D=8C_FAIL=3A_Test_report_for_for-kernelci_=286?=
 =?UTF-8?Q?=2E13=2E0-rc3=2C_upstream-arm-next=2C_06a57361=29?=
To: linux-arm-kernel@lists.infradead.org
References: <64955.124121918121002524@us-mta-554.us.mimecast.lan>
 <20241220123526.GA26697@willie-the-truck>
 <CAMj1kXENrzsF6JzvbGSwiJT5nupfJbij86zp0k2+YbqUCqvqNA@mail.gmail.com>
 <CAMj1kXGx+Li4qwh_05Uf-aTtEOLSThv8o3JjKgWrPp9t8rqQyg@mail.gmail.com>
 <20241220132549.GA26731@willie-the-truck>
 <20241220134324.GB26731@willie-the-truck>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220134324.GB26731@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QHUwkhi-VvNr8bsQbyVZENKn7Q7xbIib
X-Proofpoint-ORIG-GUID: QHUwkhi-VvNr8bsQbyVZENKn7Q7xbIib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxlogscore=667 lowpriorityscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_143505_705925_EC42833D 
X-CRM114-Status: GOOD (  16.46  )
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

On 20.12.2024 2:43 PM, Will Deacon wrote:
> On Fri, Dec 20, 2024 at 01:25:50PM +0000, Will Deacon wrote:
>> On Fri, Dec 20, 2024 at 02:06:21PM +0100, Ard Biesheuvel wrote:
>>> On Fri, 20 Dec 2024 at 13:49, Ard Biesheuvel <ardb@kernel.org> wrote:
>>>>
>>>> On Fri, 20 Dec 2024 at 13:35, Will Deacon <will@kernel.org> wrote:
>>>>>
>>>>> On Thu, Dec 19, 2024 at 11:12:08PM -0000, cki-project@redhat.com wrote:
>>>>>> Hi, we tested your kernel and here are the results:
>>>>>>
>>>>>>     Overall result: FAILED
>>>>>>              Merge: OK
>>>>>>            Compile: OK
>>>>>>               Test: FAILED (Did not boot)
>>>>>>
>>>>>>
>>>>>> Kernel information:
>>>>>>     Commit message: Merge branch 'for-next/core' into for-kernelci
>>>>>>
>>>>>> You can find all the details about the test run at
>>>>>>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1596629923
>>>>>>
>>>>>> One or more kernel builds failed:
>>>>>>     Builds that are failing to boot:
>>>>>>          aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redhat:1596629923-aarch64-kernel
>>>>>
>>>>> Hmm, I can't find any console logs here. Did the machines really fail that
>>>>> early?
>>>>>
>>>>
>>>> This appears to be my fault: commit 32d053d6f5e92efd
>>>>
>>>>   arm64/mm: Drop configurable 48-bit physical address space limit
>>>>
>>>> inadvertently sets CONFIG_ARM64_LPA2 for all VA space sizes. The
>>>> following hunk needs to be applied to address this
>>>>
>>>> --- a/arch/arm64/Kconfig
>>>> +++ b/arch/arm64/Kconfig
>>>> @@ -1418,7 +1418,7 @@ config ARM64_VA_BITS
>>>>
>>>>  config ARM64_LPA2
>>>>         def_bool y
>>>> -       depends on !ARM64_64K_PAGES
>>>> +       depends on ARM64_VA_BITS_52 && !ARM64_64K_PAGES
>>>>
>>>>  choice
>>>>         prompt "Endianness"
>>>
>>> On second thought, let's just omit commit 32d053d6f5e92efd  for now -
>>> it's at the tip of the for-next/mm branch so it can just be dropped.
>>>
>>> I'll revisit this later - I have to double check that non-LPA2 configs
>>> (such as the one this report is about) work correctly on LPA2 capable
>>> hardware, and don't deviate from LPA2 configs booting with arm64.nolva
>>
>> Sure thing, I'll drop it for now. I've managed to repro the failure
>> under qemu using the CKI .config, so I'll check that things are happy
>> again before I pushed the updated branch.
> 
> Ok, now pushed!

FWIW I ran a bisect and this breaks X1E80100 / Oryon as well..

4k pages, CONFIG_ARM64_LPA2=y, id_aa64mmfr0 = 0x2100122100001024

Konrad

