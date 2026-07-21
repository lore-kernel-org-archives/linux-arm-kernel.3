Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0781BC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1daOcfcPekbXPTo1ZKu5apWsbmT+eRXZYZR1KNyfufs=; b=xCx3pTPbablONKFgip3mARyJe8
	1EiR9t93jZlNt6nMlcFc7FGuqziZUekfABMDoeI2sOF3DRkY+EVjDOIEVLis0b4E42+Eds1v5Wby6
	L8kh0SixtVQINfeafmQaneQcVKYUKCJ9t39FDmChfHNhPad8NRwhBNKeHrdtroh56f+NQRdcgd1Zr
	eS6svrfTY46N5BGDiU42gDTSBDBHrQEUqHbqTVRVW7gi2WRBNLz/AiTpYYy0a5KbBPA8itAVOBbD/
	oZ9p8p9NOVOskFk14s9qD30S1qCD5q39IQLYaQjrx5MIQnJct07I0NxrlnaGjXLU9+CUgzidyWk9L
	2tC1V5oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4SX-00000008c7t-32Fq;
	Tue, 21 Jul 2026 07:00:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4SU-00000008c7X-2JWn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:00:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6KFAm935491
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1daOcfcPekbXPTo1ZKu5apWsbmT+eRXZYZR1KNyfufs=; b=KFLky9X30NQClw9T
	JPAWRsdbrK6VOQyXuR21u7NgiOH8n0FF8dCbSdKTWupGJEZnZ7CLVxSLCdxsGCOj
	V03pvP1ZeFOGNITQ7WXxSbFvhAQ5O/Tx7O5V/wGUVLaBgfDYaY1kowntYuygYO9L
	u7sm39nHMe/LZOvcO9ob5EJnHJ73xAuJAIdjPFXdf6GyVM9ssgfA3k2ouMOnoFbm
	mn06qgcnzRaZbTl/hLiKa+kS2HkvkrroVV0w75zKbJloM1SUTXaRmPTmPA552Stn
	PJC6GWlA8k/ZzOtgtdSWts3gPbie7E5aT2mddShTCi4cW4gxK5SOYWpeKRsbEoSH
	YX+QEg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5tu35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:00:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so3906509a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784617201; x=1785222001; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1daOcfcPekbXPTo1ZKu5apWsbmT+eRXZYZR1KNyfufs=;
        b=f63JN7QpTN+56P8HmY5N3rJteAejZ3M+1N87mwQyiDfTrpJVnq+s4TRh8KwB/fCWKk
         qoZ2qSZHPs/prUwYiNjzG2cBXSccCchIah1DuBtw4oo2+mxsyn70M/59FeseaoByFdvx
         ELGegCKhh3b1m0XnsSevtLv1rHdAfYO6BCZ5kGMZo9tz6zmCcs/xP/Lf9lIThbWacTwH
         53f6M27BpuZhk5YQmDvnZUNtsTDv5YJHU67y+2sekJMMqr+LIlMhV3wJV60xYDOAVRMY
         KYR88U1SnRiZLIDrwcY64+1euBWr+hNTI+wCUZG10w8qAUwOao/IcDxGBN16lI1vs7Zm
         y/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784617201; x=1785222001;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1daOcfcPekbXPTo1ZKu5apWsbmT+eRXZYZR1KNyfufs=;
        b=DusIKJHPTpl+VSO643YDzCtCfq+rwbfXlhBLRKUZleGDLh1HepPkCfDXY9TCN8o1N2
         GkmSQ2Tg3XffbFNB+crgfBO9Jl80WtH0wGX6EfU+0tC0HxIIRY2j6ln8sGTGbP2+mQit
         z/3zzblszXJg1R4oAJALf+HeAaiS0s7QCSen3YAs3sz1uD9se1iHBNSwBo6J8MmosGNB
         HfBWjjDpcvir/e73CUpb3fcMgzg6MQerGHclYvpinw52hv7M/+0dd+nn9ST/79mcu4pL
         ZtQJQPZLFt/QjNeD+FYzERXTOZcQYMzPzA/Ocj+SGfywkB8QkryHRxLthwLHAgFWFdj+
         kTTA==
X-Forwarded-Encrypted: i=1; AHgh+RqG0Lp75U4DIdN2UQx9sXdvH1UEIf3Li4/pW2QefGzeoX4X0SXev6mHAl3/63pw1xiONpfdGwauDf7Y9O+klug0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4nIwmOWm7NXU+JiBhICTlqJUjINyZvTVuZaahkn4GHYLjPkyq
	41ysLgcqRdu9tj0vmkpnt1I2Tco5tiUxDC19ajOyffbrDmJwy4VujJNzIEkPYcMYA1yQfcDqe8D
	jkYn0WYq6xJLpyzo/ZMwr/DJzvRVtvqEK6LPFNT/Bfe1B5WOXTQfflI/ifL6ZJThrZXuq99gL1p
	Qyyw==
X-Gm-Gg: AfdE7ck+H4TaFWZsgbQnuy3bXXJCiL5p5i15i6shAv/9g9IjGea9bNOx+Za4LfvRlMC
	ygykGVl2e5RioeNJp+idF+62Uak7RSa2VMS6zPL4smx9VplFFz6UgTtZOSk51FnKKeJ2sn1TZTp
	Gi9JTm3rJtERMO6ptWsGXvYjGx2CtQUahft4XYP1UoZATQ8537qZ9ahkvFl0c/FQIogtLOkZXxo
	OwZ66zbr6YA4EQi3n39tMtel+uAe7XzdJRsMOjl3CUb1+1QCbJ8+BeZwMDRJcuVUNreJtm36TNF
	7tiztAAyMXWpKHI+Xd6KaCNbS4R4GxheOwCSZvStFXS1gRWBQiyZO65G8xN4eeZ2WZ1LdiSiKkI
	WMxPBTDLCIUdovjQ9SCt/TWvLxjJ6
X-Received: by 2002:a05:6a20:9145:b0:3b4:b340:411d with SMTP id adf61e73a8af0-3c3ad64da60mr18812487637.24.1784617201195;
        Tue, 21 Jul 2026 00:00:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:9145:b0:3b4:b340:411d with SMTP id adf61e73a8af0-3c3ad64da60mr18812449637.24.1784617200719;
        Tue, 21 Jul 2026 00:00:00 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429ff04absm40704841eec.8.2026.07.20.23.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 00:00:00 -0700 (PDT)
Message-ID: <f2d4b312-4a11-425e-8329-33838ed37d15@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:29:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
To: Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <akfHIH_dZrr5bosu@J2N7QTR9R3>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <akfHIH_dZrr5bosu@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4ugGhrrztOXk7Ngsc01nPqX-6-EWacta
X-Proofpoint-ORIG-GUID: 4ugGhrrztOXk7Ngsc01nPqX-6-EWacta
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5f18f5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RLVnq9SYGZ7K_u37rsQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3MSBTYWx0ZWRfXzv6q3KtnDB/O
 TktEffSkUKl9pUuSRzPV79Q3Qf9og+knsqiAGiVEKnxMHhO+1R4vDqopcrpriEJqK27RSBVM7XO
 KtpJItDPaFREOB0ZPMvwoUJfyIMV6Ac=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3MSBTYWx0ZWRfXxNTA9XZXS6+W
 2Gi7qnfcMIFIwm1xiarISrKDB6xo1Fbi9JNBiRJ7oOpxhXBvB6vRyhO21Pw2h//z765FjD5QAdL
 TD9xyvDJxLSDjbmGcbrqM8EHE3qU8ObBFLOqcSQ5AX5L2WvtKJYwPx91yAoTgP2VSXlaycSySGB
 iSSc2X7J07XsWABz23sm2XeocndD8f+N1yIQk4SG40556bovlVAdChZpHxpYJnAssDAKjqW6OvM
 phFg8lvaqb5VCloqGh4qIMWrjjgKNrf1GmiUHlT2aceF51Wntn/EFAnRptPE9pnIRnOqjOKLGMh
 JcOPczScCKZlDoui7yU6zgyIh7eXUBl3BzG2DISK7bQTpPtLQQLhBexk0B8MsbBHhcYpd16zY4L
 8DrRrl1PEzBTnGFEEA7qbTszLgMp/jqDMWXDi6uJSi5OTiycvwqtK393s0U5Ax9wDBhVIDQ9iug
 kliI5p0oJKX67fczROg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_000006_626378_43EC2DD0 
X-CRM114-Status: GOOD (  32.28  )
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



On 03-Jul-26 7:58 PM, Mark Rutland wrote:
> On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
>> The Qualcomm SoCs like LeMans, Monaco 
> 
> Are those released products?

Yes, the SoCs are present in upstream:

arch/arm64/boot/dts/qcom/lemans.dtsi
arch/arm64/boot/dts/qcom/monaco.dtsi

> 
> Are those mobile phone parts, or somthing else?

These are ride (automotive) chipsets and IoT boards.

> 
>> support suspend to ram which leads the SoC to ACPI S3 similar state
>> where SoC is turned off and DDR is retained. The hardware design on
>> these SoCs forces a constraint to suspend and resume the system on
>> boot CPU / CPU0.
>>
>> If CPU0 is already offline before starting suspend to ram the
>> freeze_secondary_cpus() picks alternate CPU as primary / last CPU and
>> proceed further to invoke PSCI SYSTEM_SUSPEND.
>> This leads to a system crash.
> 
> Ok, so that's a firmware bug.
> 
> Why does the FW permit CPU0 to be offlined in the first place if it
> can't handle this?

FW permits CPU0 disablement because it functions properly in regular run time.
But there is an additional hardware constraint in above mentioned platforms, that
suspend to ram has to be performed via boot CPU / CPU0. Due to this constraint,
CPU0 is required to be online when suspend to ram is triggered.

> What does PSCI_MIGRATE_INFO_TYPE report?

It is a optional function call, which is not implemented in firmware.

> Ideally it'd report Uniprocessor (UP) not migrate capable (1), which
> would prevent CPU_OFF on that CPU, and would force suspend to happen
> there...

Also, above platforms are multicore (8 CPUs each).

>> In order to prevent such an issue introduce PM_SLEEP_SMP_CPU_ZERO_STRICT
>> config and when enabled prohibit the CPU0 from getting disabled.
> 
> I don't think it makes sense for this to be a config option.
> 
> This is a platform-specific property, and it's possible to build a
> kernel that boots on this platform and/or other platforms.

Yes, but for that reason the config will only be enabled for SoCs that have this
constraint, it will remain disabled for other SoCs.

>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Moved the check to arm64 specific code.
>> - Link to v1: https://lore.kernel.org/r/20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com
>> ---
>>  arch/arm64/Kconfig       | 9 +++++++++
>>  arch/arm64/kernel/psci.c | 6 ++++++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index fe60738e5943ba279e5571862423df4fed3db661..21697a535a25d286a2f8afe4921a41b13cc32c0a 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -263,6 +263,15 @@ config ARM64
>>  	help
>>  	  ARM 64-bit (AArch64) Linux support.
>>  
>> +config PM_SLEEP_SMP_CPU_ZERO_STRICT
>> +       bool "Disallow boot CPU (CPU0) offline"
>> +       depends on ARCH_QCOM
> 
> Why can't others select this?

I can remove ARCH_QCOM dependency if any other want to use this.

> 
>> +       depends on HOTPLUG_CPU
>> +       depends on SUSPEND
>> +       help
>> +         Disallow boot CPU (CPU0) offline when the suspend_ops->enter()
>> +         has to be executed by boot CPU.
> 
> As above, I don't think this makse sense as a config option.
> 
> Either we handle the FW bug, or we do not.
> 
> Mark.
> 

As mentioned above, its not a FW bug. CPU0 is allowed to be disabled from FW and HW constraint is for
suspend to ram to be performed on boot CPU.

Thanks,
Sneh


