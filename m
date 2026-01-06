Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC4DCE9D40
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcfsFS04VN0Soi3THqaIkbsPmr9ODp+iS17uQAxtAY8=; b=ZZjygb4hz7x226ighNJQDDAXKo
	pHcfFM5QtXbqucSABfe6WNQ7iWE5IwjHZ7IVF/IQjSlPn+sbmnZLJs2QQMW7qrw2X1AwgJCNMyMsW
	JVDOH4LN2cU3p0fSRJO4Xd4THe/HkyccaMOhOozcQ9RFYFKu2uT3D3WJ7XUrk9zwPISAaRVpcK8TW
	+jvD0D4f9KZW+GqjQZuXVDr9tdmGEHnzTnBZzC4JpfGy8sMWynyQAaQu4XxWplygtmI86AddrsryG
	uquP6xcDtx2IG5C6cZaL58d3u+30Wy7NfBctp7O80WZoKhprUWUIztxl+pjxu6cWAtc6yHPwkUoyN
	OukKRuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8LC-0000000DK49-1Z3a;
	Tue, 06 Jan 2026 14:47:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8L9-0000000DK3U-475q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:47:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AiuDZ3272198
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 14:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcfsFS04VN0Soi3THqaIkbsPmr9ODp+iS17uQAxtAY8=; b=bAr0MDmyIkL6yg9w
	SUhQGeEyloBC+6OLCP+Q9x2cmKDih9Qt2O+RNLsXi+P/5JNviDJTAJAmyG+UW7XS
	8Yc9YKoxhy4wpIJ5o0PBYb+uOceiEHUa/iLd1hDEn0c6mNCIaDsRp0XX0BTVd0h7
	bJ5XZVpd8fyWllMfnz82uX03oAnq5b4xGClzIF52jRziejYayiPJX/yrdy5nY3j7
	7YAnA53HsbgyrLtRNLH+60i6G8UNG4ra7KGvPOw1SJdMS4Xqf7j56B6L3mManify
	wn7cZTudXPInisJ96H0WIkOlaMzv059RiOyYygntr9ulFgv5habNGxs522wp3IMj
	UkSAyg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv03mcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 14:47:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c48a76e75so2313238a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 06:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767710838; x=1768315638; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcfsFS04VN0Soi3THqaIkbsPmr9ODp+iS17uQAxtAY8=;
        b=Qz78xNZ9xXsAlWT7EgkY+EBlbKso/40Uydue87pXLnr8G6OH3x6rb8dplCEAhPtrlp
         V6uNNUQez9NbNwQtdM9RuGbG04qMgbyIQ3pvsJiHCF8sWSoqzCw/CA4N/oTcvD85ncRV
         v5DLPReYbqWrN4nnKMeG/EMdjoPudDzWKfofSzuwesKo6d9eR01qys4A0geWKEu6WIKB
         /tiH0ivnE7zWRnRBVAdTAavC4ZBGGAlMRfGlsRglr+aHjuJA9xAiyBV0/pdM3p419c5/
         FsXjRDT2r+4U8T3kK8/UE9t05gmwfnTJA+4cVS99MJgGKv75m7odDsIp75Ur1T4iRmOR
         goHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710838; x=1768315638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcfsFS04VN0Soi3THqaIkbsPmr9ODp+iS17uQAxtAY8=;
        b=j/trhc0TIEyqYqB+ud5kz3Z1JpdkNChSFn5daPlGSyok/IjlpJkZLz4J4rNIz7yRHo
         ga+mLQJ8akxnNIHSRwC5mRXLXwMEqTHq5OXNZ9eqmBQoO0cmlh7OGsXNYAauN5YswvCn
         J52jrlKKfivxNj+WfNmDREu72fEW8PEzzNi04dBvlCj2fVHKvljcKxjTBs1G3l0CbJOL
         71jmY26pA128ybyO2ijQFAqlrtXjizZhIq+mDKz4i3jhZis32AX9oD4tuVT3tJbRXJmb
         KDEZb7eeSqmBpHUQ25XzikHDjJRKy9u1QWdGcN4oeYQmiFylOG/RGibZWXGSJ6afu7rP
         JV3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX88N+ZTkny6EIteshAMxbOGnZ37G9z8hvvJywXMLNUJBm+KO8ziT7yC5yD4yQvvnhlzOaOBG7XczrNlUkYiROS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8eGRIWOuS+HXmXp2Af8Mb3d7bEDKdCBGnvEOYvHk2mztcwZwF
	dSuAN3BqCUOGd9n1lcW6xmEI7QpGzJY/2+sP3AGMtj3zMqGexu9wBsBkQ1mOnUqk2i36J+LDi0D
	oHTzch1tVj/7/X8MKAwPKLhuLrCg8SX6vPO02i0O15x2oycNi99Thc796DiYlqm+0ucb/bIloE8
	nmtMdw4Y0vjg==
X-Gm-Gg: AY/fxX7F89OJLKSLtNMNsxrYVwctTo5+/Cl+Hf0ckDvSSV+FchIGHJk7fv0nu7F/Mry
	dVsIwfMjhB0rtbIYbXRyjDGln3msiwZq2k+MOESpafPdLQx/es+XKnIqBEYwxWTSb3SzTnokiq/
	cuwakRxWI6MX8fU2JCYw0atOcllgYR+53Hbv52liwhlFJ427r7msQzvvI3rGzmdmqlLoq/Ls14T
	gZH5jt+dtDOqWSlv/Oar3KGR76V6AAkPrEkmoONiCkRrHjGJ7ctchSHf0ZYAlbSsNnLGNoUTkNP
	dIAOnJG8BqawTTwqp0wbZQaMzYQgBE7Mu7VzegEoPfcuv/Qaec1+qGB4+CDgC4CBgt7Mr7rjzq0
	mQlV9SYz2LU2L4vekW0WsWPQlwFvIMEB2h23X1DPpors=
X-Received: by 2002:a17:90b:4f88:b0:32e:5646:d448 with SMTP id 98e67ed59e1d1-34f5f30038bmr2743051a91.21.1767710838384;
        Tue, 06 Jan 2026 06:47:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNSDUxkQhO/yV3l5ELdMmGOkQbRz1mErp+pZNgrdUbiWyRnlViktR5bVwFxL5b/wwflX2M1A==
X-Received: by 2002:a17:90b:4f88:b0:32e:5646:d448 with SMTP id 98e67ed59e1d1-34f5f30038bmr2743028a91.21.1767710837911;
        Tue, 06 Jan 2026 06:47:17 -0800 (PST)
Received: from [10.216.40.68] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29521sm2634999a12.23.2026.01.06.06.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:47:17 -0800 (PST)
Message-ID: <107b43ab-85fe-8b09-a622-854f9672f45f@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 20:17:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v19 01/10] power: reset: reboot-mode: Remove devres based
 allocations
Content-Language: en-US
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-1-ebb956053098@oss.qualcomm.com>
 <CAMRc=McEB+yVYxropzsqLExZCU5Pd_iy_=5N3pTxu28-ZX=7_w@mail.gmail.com>
 <acbb37a1-3189-4d4e-5c05-55b13cd40a7f@oss.qualcomm.com>
 <cvmtn335gwnl6rvmlm4vgyablsj735rknga4ffv53gpk4k7d6g@tt7ebuyusocu>
 <e4b01dc7-02dc-060e-d1a6-abd2c801a78a@oss.qualcomm.com>
 <CAMRc=MfaCKe2-Eca6fZ00NQkdLqJV-NH0XAsTKHkU3N7P7pnEA@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MfaCKe2-Eca6fZ00NQkdLqJV-NH0XAsTKHkU3N7P7pnEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695d2077 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uBB1BXs7VCbqA7mTJTUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 1yart17-uqSpXotTj9NeZM1qlRVmUba1
X-Proofpoint-ORIG-GUID: 1yart17-uqSpXotTj9NeZM1qlRVmUba1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEyOCBTYWx0ZWRfX+imlYPVpZpeK
 EHKNvdk3Mlc6ACPyJsT3gFpmyKkPKJlRIiak4T1NIfuxhuxZonX/O3x7TFEXa5Z1L5pIF3Q3Edx
 9h2ekmyxySXDOVW9N96tD1ltDF2ArxfKV5x4+itYYnxlFppb83KDv4WySg8otRVwyI3U4cy+PTe
 rLJYgZYdvUADcIHIXhwmWaYRvXbZLq0JeurTH/KBGfbgaJcmhARmsNptKw4xVDY1SuaG5UgKeCO
 OdmxYtE32WNaruq6t1zDV8vpJVbT6Os5mcwHG24LF90vKHhAsif1rsP/gmcaH7I5pwR1WO2zyad
 fEJ/keKxErPgGCmjECssF7eeFN3NUJ20oSOkU+zy3Ji92R5z3VdeVApZtY46N2Fe3lzt6JzZqpa
 izbWnbXbfMSYUG/wFucI/oNWPBEAttqANtNJpLkmU9Rbs3MhvxjdS/LiVBmeg/8jPOYJmr1GtDT
 9miDO5aju/Ax5Ducr8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_064720_369479_C5695708 
X-CRM114-Status: GOOD (  16.04  )
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



On 1/6/2026 6:00 PM, Bartosz Golaszewski wrote:
> On Tue, Jan 6, 2026 at 7:31 AM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 1/6/2026 3:01 AM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 05, 2026 at 11:46:40PM +0530, Shivendra Pratap wrote:
>>>>
>>>>
>>>> On 1/2/2026 3:35 PM, Bartosz Golaszewski wrote:
>>>>> On Sun, Dec 28, 2025 at 6:20 PM Shivendra Pratap
>>>>> <shivendra.pratap@oss.qualcomm.com> wrote:
>>>>
>>>> [snip]
>>>>
>>>>>
>>>>>> +                       pr_err("reboot mode %s without magic number\n", prop->name);
>>>>>
>>>>> If this is an error, shouldn't we bail out?
>>>>>
>>>>>> +                       continue;
>>>>
>>>> This is not an error as per original design of reboot-mode framework.
>>>> The code as of now says, if the reboot-mode node has an entry without
>>>> proper magic value, ignore it, and, process the next.
>>>
>>> Then why are you using error level for the message printout?
>>
>> I have changed from dev_err to pr_err. Can make it pr_info. Will
>> that change need a mention in commit text?
>>
> 
> If we can ignore something safely, then I'd just use pr_debug().

Ack.

thanks,
Shivendra

