Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B03E83070
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIlYTEBvQtkwYWZcv8IuffFYb2FhapRL1ZNY/pZvKmI=; b=rtoQXl95AJsX+RneegEPWAFoES
	Ci8dVwQCwz1XeiFoDPcabW2TESVPMJxwoYgloew1f85JNhHBm1LMBx+NF2TJFqgEfgyuVW5OTrg2n
	bAT37vT0SYyBr2+Dl4IMvn6gU7dUyUP+xriRfehQz4PXbM5wBeSabfcTeWPxJ1SBhHJ46j4mvmh6N
	U2e2k4COUeDFnnThfmHzxao1B384r4SJfSXXWasrN/Kuw9s0ZP2u4PsVG6+laociO+W/gi3vRpUHU
	Njn/yF4Ukx4txIXeqEcdEZOEQGnX8QXcU9PWBg99DzCfk+tulFAJCWxEwEkktPdHEaiVVWkKIASQt
	NXMoPCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCvC-00000006Olc-40VU;
	Tue, 03 Feb 2026 09:42:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCvA-00000006Ol9-2UCE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:42:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134Ai4k571041
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 09:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UIlYTEBvQtkwYWZcv8IuffFYb2FhapRL1ZNY/pZvKmI=; b=la5sT9TMzGm8ZbQW
	JymcOwfpFGrAspnNB2zxFw4DAbMoDk26kDcDaKxDHVpM2eFsjqx3i80w1kd4PtmX
	LUbwj6PeYkZWKUlC0gcF/RxnR466gyrw1LFeRb2XfyVqJe66wRbJgpz55JraFlmU
	DMVYxOXOF0GVVMmvhVc+1rLiXRAo1Q2yeHK9I2G0Pb6msjud8emAnHhwzb1jJWj6
	F61Mcz08RxX8T5KjLdqzuW/q+TOfW0tdloZzqGyvzILLPp/qH2XDnqYJfc7Nx5QN
	sQYmeffE0NDBLtqXlbEOEN5aMm+1RRa93FlFtyc5noS31Vvzjf+v8cmsV9indpI9
	oZeq2w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmku8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 09:42:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8234ea73bdeso6807942b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111726; x=1770716526; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UIlYTEBvQtkwYWZcv8IuffFYb2FhapRL1ZNY/pZvKmI=;
        b=YiWWNL3yCA75zkStrDw6OZ97tu4lQ3T3A1/SYZpugNQ5BXNyxxF1jR1hbq2HcZyBmZ
         6bwOp0RnOt/VdmP0/w6icxoSaSKq1VMKpnOcbmGG741/IVIeOAbF55TLf+4BWXM6HrH0
         EcBWWR/zxVg80n8RuL3SURFrYA/khE8VDSp76aVzOcoQmtagoIYHKJOHub/sy16pHPLj
         1ztxpZW5/VDgnqUc//XA5D5IcklzF8Hp7/1o7yGdfW/cAqoT53TuQ1t6rct+0gHAYF7s
         UPeAkAAosIUiVydG7+058t+zJoIHp7QLuDUePEmcwjZ9C4NojDuiKT7WX7zzuDB5fhyu
         Uc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111726; x=1770716526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIlYTEBvQtkwYWZcv8IuffFYb2FhapRL1ZNY/pZvKmI=;
        b=RZbZ6nZ1Nmzl1sZQdDMHaM9M4pPd6pxSB2wXQF8HqbOkvDaIeFM5W51Z0Npj8Befxs
         4Hq0rzQy9Zz0F1eK5Sbx1NfFMKUJCSXkkiD4sSMzGTHOLUAVk6uq+xxA1wmC1b9nFHq1
         W30kYTwt+0YZd3+t1gadA1Sk6i43sfW7nkjsJowPdVe/xmJ6vxa7nYu6b9VarAlCXySy
         83FTvSSbCB2+Lv29B31+++iJPU8QgILQLHMJF+iFm3ZIri1tbZGThyFumc4mjwkioNg8
         nhWXF/2cmxASwQKhJwGEG5xBp3zJKcfVFsIF9jkOLFrrc57DFuZoNs3vSUmD2dXCbXyE
         Wzuw==
X-Forwarded-Encrypted: i=1; AJvYcCWnbWGFNuBx+HZPICLTLADl9dsYWehJ1aBbm1pmf53JSO2AMp7G+96XhrDm0L+i50o6qFyAihSYPceL4qci93jX@lists.infradead.org
X-Gm-Message-State: AOJu0YyF/4NPGcR5/SsF5gfYBjTv3045p7Q2AmpndMvttU2F21Cg8KPV
	BYhEU6z5oFZV3Zk3G89D+r7Jf2ISYQwmGMI9u9u9uqy1Ye3svYVD23l4wZ3jAINQWin0OMlmKMg
	PcBJTU2/Q0ZoWR2Siyk7c3aOAQ8p4GHySPU3VozLWeUpRrj9yG7KC9cM3cDiS4ZlRm/z37RziMz
	BjNQ==
X-Gm-Gg: AZuq6aJsz712SaZBxUpRWUDbAgVKaAgtR6aL1Yp9zts7s1aELbZ2wXj/oD+F1FV/GiU
	liKdzw4twMMuw4wlg6RcvauxZXuBx5eHJK/LZAlwKdRMbF6VkCp4hKxlba9hcvsHX8K8ggdTyjA
	pt7wfjt2jvBvyX1Ab/hLOLX1fJGmHPgyPFa718kODuAgt/MB7HzGuQSwyfD44vr3hCIZ/8zyXIB
	YYaQ0inb1uJNg+1bJNwofcQz3+dlujSGLF3z2e2Mb29qFUZ+YgAllyuTX6edYUkhxob0t9KW6jB
	vFNScCBweEJe9HfvzG1DO9nL3ONXDdWSWXiZtXTFaoZmIcxCwSsKNOKyu4rq5h6wyFKINn5agQ0
	dEVDkLFxlJb3a7WvTUqdoves0+lWtzAY4vrX0SjDcfqb7hDe6oUjXsChDk8XXVjSNmIxCE6acfg
	==
X-Received: by 2002:a05:6a00:10cf:b0:81f:9a5c:5b95 with SMTP id d2e1a72fcca58-823ab98212bmr13637107b3a.68.1770111726401;
        Tue, 03 Feb 2026 01:42:06 -0800 (PST)
X-Received: by 2002:a05:6a00:10cf:b0:81f:9a5c:5b95 with SMTP id d2e1a72fcca58-823ab98212bmr13637082b3a.68.1770111725913;
        Tue, 03 Feb 2026 01:42:05 -0800 (PST)
Received: from [10.133.33.97] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c22672sm18151053b3a.51.2026.02.03.01.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:42:05 -0800 (PST)
Message-ID: <09605e0f-6975-44c9-8f27-4b4301c412d2@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 17:41:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-binding: document QCOM platforms for CTCU device
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
 <6019b38d-3a15-41f5-989e-1f576c327446@oss.qualcomm.com>
 <6c823646-9085-409e-a692-ae3e77347742@oss.qualcomm.com>
 <5911fe77-fe2c-4321-96a9-a1b6b3b5d1e3@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <5911fe77-fe2c-4321-96a9-a1b6b3b5d1e3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=6981c2ef cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wkLu1GTWYP2ahK5n7AMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: -06sDruq-YQAfvRBiLSMtmu-9sYyNbpT
X-Proofpoint-ORIG-GUID: -06sDruq-YQAfvRBiLSMtmu-9sYyNbpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NiBTYWx0ZWRfX8GNy6TjbZAai
 gOKZNnmJyWJ45orLfuxgjAj2UGOM/Tei1cuuZYL4pUHVqsz9ylnzGrIwRkNpaFp2OoXZNMh1MTC
 NV8bbhKdcGpweZ0XjvO2SeNyFGpILcAhblvNbjeFwp1yI8SoxoSyCZSGwSfF9QCsPo5Mz0IFV9R
 oWASK/758RmtiNEMQ3BEp/wfpi6/FnM9QxnqSZ213SMHJ3GkeOLyjO9J+A3usUsB8gvkyPdV8Gb
 QKV+oizMddWypaOtNTbcfLCMWcqccfN3fFgxBitVsHVyZXIoptZulJxOTKtcXJohQl+ze86zykf
 boiB0E+8dUkQTAEfI3iBHBblCGBM7ypgg1GXrfru7T18rm1rQYKfK6kDEd7ubRCEtV8d02m5GZy
 7Io5I0CzPJx395fkn2txj7HaPoBKCusr1j9GUjNnOl2TH5XVrEAdbmw4sApCJFXJtRgRw7NpGyS
 m+QV34OhFKvE/HrJbbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_014208_749934_8F3FFA9A 
X-CRM114-Status: GOOD (  19.21  )
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



On 2/3/2026 5:31 PM, Suzuki K Poulose wrote:
> On 03/02/2026 09:00, Jie Gan wrote:
>>
>>
>> On 2/3/2026 4:50 PM, Konrad Dybcio wrote:
>>> On 2/3/26 9:08 AM, Jie Gan wrote:
>>>> Document the platforms that fallback to using the qcom,sa8775p-ctcu
>>>> compatible for probing.
>>>>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 
>>>> ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>> ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>> ctcu.yaml
>>>> index e002f87361ad..68853db52bef 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>> @@ -29,6 +29,10 @@ properties:
>>>>       oneOf:
>>>>         - items:
>>>>             - enum:
>>>> +              - qcom,glymur-ctcu
>>>> +              - qcom,hamoa-ctcu
>>>> +              - qcom,kaanapali-ctcu
>>>> +              - qcom,pakala-ctcu
>>>
>>> Platforms with existing numeric compatibles should continue to use them,
>>> so that the mess is somewhat containable
>>
>> Sure Konrad. So for Pakala, I will change it back to qcom,sm8750-ctcu
> 
> Why do we need different compatibles for the others ? Are they not all 
> compliant to the CTCU programming model ? i.e., sa8775p-ctcu ? or even,
> a generic,
> 
> qcom,coresight-ctcu

Hi Suzuki,

The platforms here have two ETR devices, using same "data" in driver. We 
also have platforms only contain one ETR device and we need create a new 
data for these platforms.

I have proposed previously to have generic compatible for CTCU device 
but I got comment for preferring use platform-specific compatible.

Is that acceptable to use qcom,coresight-ctcu-v1 for TWO ETR devices 
platform and qcom,coresight-ctcu-v2 for ONE ETR device platform?

I think it's better to avoid annoying dt-binding patches for the CTCU 
device.

Thanks,
Jie

> 
> Suzuki
> 
> 
> 
>>
>> Thanks,
>> Jie
>>
>>>
>>> Konrad
>>
> 


