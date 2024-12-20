Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBE5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 22:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+8b6e6jRHrSttDHYR8cAwb0VW+Uoydd9QgaTXl44A0=; b=EjAgwQuJIgrN1IIEkjs57In6bh
	+OUURkNGqjqq0lhuzTMVjGbDYEKgboQjHXzcib4CgnTScdiFveYUNsgNJn+uNK+GptHi56T2YMa+K
	+7vl8W53yy7j38QsSZXyK1Mqp2DPA/MM85TaK8N7cLMTVfng9VI3QAR+J+3yGirro7xSWbaMayByn
	GFRkpBEhEDUxUGydF+LVra+YLPYnhc25hUoh20hvMz1/TN695IACRZAJoXCCetq5NH/HT1A0GwEbx
	DbDDPG6HWeJRBT5FYluR5jAwanRxsFGjhJIoJVr3B8cUflUKAGh3VgmkT8vBtXB5N6m4pv0D2obgl
	G4vierkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOlcs-00000006D2r-1qqD;
	Fri, 20 Dec 2024 22:37:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOlbg-00000006Cw0-14aH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 22:36:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKLhIgW012754
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 22:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+8b6e6jRHrSttDHYR8cAwb0VW+Uoydd9QgaTXl44A0=; b=dBCCcW+u3xXl/Z0c
	Cdbt48XWOYlqBJndl0r5/DFgOPGi9+DZPzYqxrsc+jEyXW7OSbiRPB2H6sB4wKAQ
	MGpig4NyMlse/WM7q2wPGA2pTShWU2KaPeYYS4yNaDSEJAQOO8QjS/BIGfd3kCov
	0xOc3ZtGDlVvaQntubPSJnHNP36LdE3oKIpOgQPGVV9h3N2A2ysJPadTJHe/idrp
	5e08yRnDZCovtJDS4kQps5vUu/TAQFlAoF4brrVpVt7sdv1Kgh/usk+H/8piMTmR
	r3TbBqjQ5g3P5AEXS2CCYykqciKUiOuM6vWqNmPmEBET8JATzYot/tB8wl3QgO3C
	6Uc1Ag==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ngr082u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 22:36:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4678aa83043so5569011cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 14:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734734186; x=1735338986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+8b6e6jRHrSttDHYR8cAwb0VW+Uoydd9QgaTXl44A0=;
        b=tkbXswVrl+EagIl+4mYDsZpFUt4g4LsXjHkC9hGmdO7N0raYPqHyS+jYA49UWt18Ym
         KduFLBnRY5ouxiKqdLzwiSL9vKffyd9gHEaxAisSzdTfhMPMDkQ0RL54cuNNsrInj2cW
         kT0sARCe2vujtpw7rf6iYHCkQ2yDm8CNoltTNmR36zZRt1snpy0GDHMH3e4zjQh6WSFP
         kCbfRaSRq/cM8p8IMvVUL4CTlvhaNykubt6xPGeB5BLWWSjfjv86lSWZpZRgp6IwZS9r
         stLFcjwgj3459uy0bZEHyqRbnJ8kLHnuOyW+uphjywx/t1re4iIBqvoSoBsbiSkn5iyv
         H19g==
X-Forwarded-Encrypted: i=1; AJvYcCVXeJtTsIk+SBdYP+zd+SS6b4qLeiDnvEyAG86rzt/MxwBPUSVFhIkm+TceJG1JYoDx7MS6YwQ1k3KKxGLcGNpb@lists.infradead.org
X-Gm-Message-State: AOJu0YyAv1csc5WGtcEWanj4UsrTQ07chBGQVgrstSQ5dWrFuRpe8CQk
	jcF9+Y+KdImy26dAYhPPDNTF0O33xujSdij+lwvpsA6Vf+b8NMXDgIgZZ+CJey1+HRsbO4Qyvql
	Yiox7eXDQNyCYEbIlw7zWfqccWt1x10c/nZC44N1nfSUX2NadAZSagmR/b7x44RFKNko8mRArtA
	==
X-Gm-Gg: ASbGnctKv7UDDJ4hv9WauFz6lLnfRrkSvtNEVAZUOYaPdWkqEBZunxmYejOccIAOHEo
	XGdi6GRfvOPMjkvgT1Nu6ryZTCE8mA55AQbmMjRWC83ORoa+acBqGxIKwGgeics004IulshwvWn
	C34xAm5lmTwc2fpaWMByiIYUJpwVFeO/+yoceDFE4xLtKnjA3S3nod6jbqY7YarOUF6gS/aDwFK
	Dj5hl8u9juvIRm1VZbltp5pkyAlU/qqIqJY63Wq7rnH1rTCGC/WAkn1N/YJvXmFongFrhpgApCa
	5HLb2yzdnVsr3VUkn4zG6pvnG/oqGuezE+Q=
X-Received: by 2002:a05:622a:490:b0:460:ab1b:5ab7 with SMTP id d75a77b69052e-46a4a989daemr29327581cf.12.1734734186424;
        Fri, 20 Dec 2024 14:36:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8gbNeQPHS/8Yn78FHyieLkXIn1YU+XQ24+LgZl2xi7GVw4RrR/0RsWtJ+SrK1tHA8p2aMAA==
X-Received: by 2002:a05:622a:490:b0:460:ab1b:5ab7 with SMTP id d75a77b69052e-46a4a989daemr29327531cf.12.1734734186095;
        Fri, 20 Dec 2024 14:36:26 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06cf19sm217265666b.198.2024.12.20.14.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 14:36:25 -0800 (PST)
Message-ID: <8a591019-acee-447c-9636-c4788743c62d@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 23:36:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9D=8C_FAIL=3A_Test_report_for_for-kernelci_=286?=
 =?UTF-8?Q?=2E13=2E0-rc3=2C_upstream-arm-next=2C_06a57361=29?=
To: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: cki-project@redhat.com, linux-arm-kernel@lists.infradead.org,
        catalin.marinas@arm.com
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
X-Proofpoint-ORIG-GUID: vlrINPq5wGGFVWdVKJgLDqFJysyVK7eB
X-Proofpoint-GUID: vlrINPq5wGGFVWdVKJgLDqFJysyVK7eB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=755
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_143628_320052_597FE32F 
X-CRM114-Status: GOOD (  16.56  )
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

(resending as thunderbird prioritizes replying to the list instead of
all correspondents, sorry)

FWIW I ran a bisect and this breaks X1E80100 / Oryon as well..

4k pages, CONFIG_ARM64_LPA2=y, id_aa64mmfr0 = 0x2100122100001024

Konrad


