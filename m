Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B5CCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQKfOoNTKGaeq2MEhQshMbwKg2l1HZ5ShY4DsqQAqqc=; b=UDRIupq3BaPw77xWneMb7NIJWA
	HYJ2TyWmHnUJketI3FBC/aaruYrduxBrSQvdlsiGD8P9JN5hgJnSRebfS0l36Z1UK+B25ZAjvihyK
	9coj8k3ZPw9BFXIJezkCWErwjbL8ihpcxL43ebCjLnvzVZCDwO7MQbYIJ+EuUuLEhIten6TSvBgfb
	D2gpqx+O/301nB2mq8de0SC796CMWjUIYlGHSQZ3tNzA0cU7fU3EuYtDsMORlSRYaYAakysPTP3HS
	hE68gh/UUvd+kbxLnUxQpwbDLfQizKt6hUtGGdA1RryhDJLB8TvS/aP9QIjzQIOKpZZveiLEzbLEG
	ZkruG5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpi3-00000007LP4-1ZDg;
	Tue, 11 Nov 2025 14:51:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpi0-00000007LOf-1rmD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 14:51:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABCgHVd2236327
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 14:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VQKfOoNTKGaeq2MEhQshMbwKg2l1HZ5ShY4DsqQAqqc=; b=QWUrGr+kybBXpAqZ
	eVFNu7En4AnnweMfH0ZrlAKNOIic0TGodp3EwaWpsweDNv8p6nvuCr2+OMNuoi4S
	UDbyqqWNpC7buLR2zqI0WZtdLTnINWPYwCE+KroPuQvc1E3UOOxPGfPQhGERM0eB
	gFvvj0O1hiuPyFi6v8BTeejolbBVamqusa/i5b14m2NWYGO6UAm0mcjn5+QQPWLG
	BBDOVmx8Ihi3BBO8ZVUGnHEAwSKEZ+IGxfd2u6As4IH/wcTMV3o5mL3bVwwA2OEG
	uA1B5gpDOluLxJaQqqj40x/lgsoUaYzyc3w95onaLmBSbqwREosztjQRdi8SgCWa
	QN+GNw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac11x15tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 14:50:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62da7602a0so3869037a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 06:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762872658; x=1763477458; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VQKfOoNTKGaeq2MEhQshMbwKg2l1HZ5ShY4DsqQAqqc=;
        b=WwEo8/7PMJ+do1IQbSsrCMAofutT0ENoujxeS5Y+C+i9B8WeIR5riv6v6e5ubqkVOj
         XzQS06MZzEwK4dFixG7tIW3Eh2AlWSnnYgaUNFYTOmlIam/HmbdeWSp0oZPUJc82CZhu
         S9FBGAirji4ujxH0g5yq0BhIWFH32togVPPciU7eKCeifeKrLswnZ2rBjsQ4IlEbQAWz
         Amsb573HFR1SnRRJVTp/uELL++q3Wc6GVeylYTeHdNZculUtRlOwZ3jxR5ihatyOauAA
         3eKco+R69c2WRZc/J0yS5OLRe7+qwNuZVAADSdMS/srR2EZxkQn7jY1u5RWilamyvZwu
         aRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762872658; x=1763477458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQKfOoNTKGaeq2MEhQshMbwKg2l1HZ5ShY4DsqQAqqc=;
        b=bQLPQ65UmHuS/4zo8fyb6wvCNk0JKIn1t+FdtXN7NJ9Fxhw/B1gNAnvxUSs69B2Gug
         cm+YqGSSwE+Jmoemo1KNKi7/YXcoiNn5cb5nxNB6PisyUevxt5TONro/YIz3b0twzZ/e
         4Dx+zRJiKS88Y9IOvoalbP7OCjqinSPltmR6/7m+voj09EHctc2OsInnWPerfEAp20vW
         i8XGuhgZtASZieaARWPysDYBwQq4zQjfNyOIU+iawV3GGIkHHayzLyU2mC2Yt7UTlg9y
         b/PEDvQtOoYfN0tZ1cXuLTJskgUlMZgTIUo22D2fE7qOBnFwjTi+7vJyYmqRNygwrXjF
         YBxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEf0h8EdN+UFzfLtf5iOj0kbJVNphBmSHLhG1Gk9CGbJPmBsOucg8fePQmau4AKcpzeiZ5svlJbjuBMVc908lu@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ+Llsi1rJJmJpIsUrD59ORRH/7rckSws0loTLFSnU/MGlQEFQ
	NPZ23+NrSbvoE2iTC/KfL67fT4fDZLZAotB1ojOrw65y2wZnFzbSrU5MxfcIJRemsYuLHKg1UXd
	Z8AYSrPIFbIqii9dPUy2eC7mYGsUD7nSL7mxjxtDLymFQ/TixzqjC4eHYjgXJ3xYrr8tBOv5LZ4
	XnaA==
X-Gm-Gg: ASbGncv7P1jlDBbxwlxQbFc2LcXK9vh2eJRmryGdnL1vCftC/N+7N3yalKVOoww6GLN
	1Rb587o5MZWnuO6au3n9wLF7Jh6ldhFMB5nGtnmDQVxrSHjoIGIaUccI5vsa7OH/a+sdWXrPJZo
	moMfsfWZ1X8BS0Fzc0TrOO4Lbx1a5nmzZdawR5zpOzCIiaemP4wWj4VtFWVFBe9OxZB02FAaOtH
	hysBYiRkcWL8y8bznDUhNRKU0iCKvopwPG7KUictSMKKj5Ba1SJY62p9Z4GkaPwbV2cl5XtdfEk
	nrIDjxauhXKNrXsYnsJYS0gJ1suhyR1YF6L9qkzoEoKd2EJeNfAOo+NWRvnisxbS0suUwKbHLKv
	JDYxwDfDciHXa/vz1y8pXHEszsxtRdLba
X-Received: by 2002:a17:902:f791:b0:295:9e4e:4090 with SMTP id d9443c01a7336-297e5712c4amr144629095ad.52.1762872658243;
        Tue, 11 Nov 2025 06:50:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeUjej48jQjUKrbDfpu/j0dgTD8cgD0cCmhW/5bvBfjdYMThBsF6L1pVJDVnEci/p3XVNrpg==
X-Received: by 2002:a17:902:f791:b0:295:9e4e:4090 with SMTP id d9443c01a7336-297e5712c4amr144628625ad.52.1762872657520;
        Tue, 11 Nov 2025 06:50:57 -0800 (PST)
Received: from [10.92.180.19] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc179e7esm15787230b3a.46.2025.11.11.06.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 06:50:57 -0800 (PST)
Message-ID: <5c83c9a1-e123-95bb-1434-588ee8c52b25@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 20:20:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 03/12] power: reset: reboot-mode: Add support for 64
 bit magic
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-3-46e085bca4cc@oss.qualcomm.com>
 <20251110134529.uljjqzb3vhda3vya@hu-mojha-hyd.qualcomm.com>
 <gzj4r4elqewjt2gjzhuamslvobz5fgyvt672brwknoozlsplaq@wsebzmi2l6pc>
 <681a72ba-d8fb-bfc2-d2bb-d80ac667bc5c@oss.qualcomm.com>
 <zejaqakbtufwzlzs7xc7xzxezcylqjkmu4nne2mro4riuhgbkc@hlgu3u2w36bb>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <zejaqakbtufwzlzs7xc7xzxezcylqjkmu4nne2mro4riuhgbkc@hlgu3u2w36bb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDExOSBTYWx0ZWRfX/XMu/2kEcvWe
 Xi84lCUKs11ZPJzXMQzHE6mtMbVfQhqGDEu2rEm4hsYwYWZNSdC9zUPBx0bmYkSHULASPSynMks
 2Fyxo9BJXojJvaJdLnkVt5JkW0TnOpbl4ZCBpyXRq0YwyVshf5Y1Q92zOkcbS67XZh4KvoduF2z
 JA+RDH+RdHMq1Rhc30Y7eXYv3ujG1VnBAnchN4/oegyU7Lk/5gTIYzj77uJI2mDbmGYh25dzRop
 PCjH0/0aWECOFBfAdnqEeHOR+BgA0+JaY5GO4zSqM540MsCmdugqGLKtcp+YCfM5FbcdPGRxl+i
 TbqsQjbr7bhG0ZwdHFM/G3xfp042acmGhDFw1pRAj12HoMocawOPHjw87FQ0LuiFPH4JEgUSkBL
 xTtp+YgsmrdVtcK0Q+kxZVXrTq613w==
X-Proofpoint-ORIG-GUID: aMPvtIVEfAel8ragN6yN8KUkHNkMb3a8
X-Authority-Analysis: v=2.4 cv=L94QguT8 c=1 sm=1 tr=0 ts=69134d53 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=WYJ1fy7EX9OiPUot37EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: aMPvtIVEfAel8ragN6yN8KUkHNkMb3a8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_065100_507944_7B6B3DCB 
X-CRM114-Status: GOOD (  29.34  )
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



On 11/11/2025 12:03 AM, Bjorn Andersson wrote:
> On Mon, Nov 10, 2025 at 11:22:40PM +0530, Shivendra Pratap wrote:
>>
>>
>> On 11/10/2025 10:00 PM, Bjorn Andersson wrote:
>>> On Mon, Nov 10, 2025 at 07:15:29PM +0530, Mukesh Ojha wrote:
>>>> On Sun, Nov 09, 2025 at 08:07:16PM +0530, Shivendra Pratap wrote:
>>>>> Current reboot-mode supports a single 32-bit argument for any
>>>>> supported mode. Some reboot-mode based drivers may require
>>>>> passing two independent 32-bit arguments during a reboot
>>>>> sequence, for uses-cases, where a mode requires an additional
>>>>> argument. Such drivers may not be able to use the reboot-mode
>>>>> driver. For example, ARM PSCI vendor-specific resets, need two
>>>>> arguments for its operation – reset_type and cookie, to complete
>>>>> the reset operation. If a driver wants to implement this
>>>>> firmware-based reset, it cannot use reboot-mode framework.
>>>>>
>>>>> Introduce 64-bit magic values in reboot-mode driver to
>>>>> accommodate dual 32-bit arguments when specified via device tree.
>>>>> In cases, where no second argument is passed from device tree,
>>>>> keep the upper 32-bit of magic un-changed(0) to maintain backward
>>>>> compatibility.
>>>>>
>>>>> Update the current drivers using reboot-mode for a 64-bit magic
>>>>> value.
>>
>> [SNIP..]
>>
>>>>> +	if (magic > U32_MAX)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	magic_32 = magic;
>>>>> +
>>>>>  	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
>>>>>  
>>>>>  	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
>>>>> -				 syscon_rbm->mask, magic);
>>>>> +				 syscon_rbm->mask, magic_32);
>>>
>>> As above, if we're no longer silently discarding bits, I think we should
>>> compare the magic against syscon_rbm->mask.
>>>
>>> No need for a local variable, just type cast after checking the validity.
>>
>> Trying to summarize below why we added these check-
>>
>> the patch in v11 used typecasting and did not have any of these checks(link below):
>> https://lore.kernel.org/all/20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com/
>>
>> As per below upstream review, type cast was removed and bound checks were added all-over patchset:
>> "As a general rule of thumb, code with casts is poor quality code. Try
>> to write the code without casts." - 
>> https://lore.kernel.org/all/8d4a42b6-657f-4c30-8e25-4213d8d53a89@lunn.ch/
>>
>> We can revert to the typecast way. Please suggest.
>>
> 
> Okay, I'm okay with Andrew's original request, stick to that for the
> nvmem case. Although I don't fancy the name "magic_32", and would prefer
> that you just call it "value" or something.

sure will make it proper wherever applicable. 

> 
> 
> For pon and syscon however, I'm wondering why you have ignored Andrew's
> other request from that same email:
> 
> """
> You might be able to go further, and validate that magic actually fits
> into the field when you consider the << pon->reason_shift.
> """
> 
> Writing "if (magic > U32_MAX)" in a snippet of code where magic isn't
> allowed to be more than either 32 or 64 is misleading.
> 
> For syscon, it's true that the parameter is an unsigned long, but the
> actual limit better be based on syscon_rbm->mask.

May be i was not able to interpret it correctly. Basically tried to
make sure that magic that now coming in a "u64 magic" should be passed
ahead only it its a 32 bit value.

So should i get rid of the checks done here for syscon and pon?

thanks,
Shivendra

