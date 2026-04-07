Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BC0FEEF24
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 11:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pEf6uKvSI6oCJgjhiIfUYBD3yToz/qagAHgA28vUQs=; b=255eXG42PITjoY9M8rCcB/sKMO
	Seu4qXxCB8BNwS6o6CGqVfKgbWVGX5AEYGkhn1H4TzM3iABs8pwzBeGwzDfFpEYolXwTSjbmMeo9u
	ML+Y0NVn8QyN+U7A1wYUufUH5TJoKzFcYbm0XB/6xpmuc1MJVE1A9ABn/hFv5zzj6z1FZ8DRFPRC/
	56cGLuPbBtvxSPFN/Z9yM9ORZB5B5x2xoXZNNZGpBGuNMBKX61oOR174/hCDcnT9zQH2uf4ALi1eQ
	GQ+EhR1P8KxEfxGl6/GwlPiZbEc/ZHRZv9Oh9Zo4UTSvsSLb0nJkq6cN7PRfthIzAhVQfKVacCV//
	JXVpMcRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4j6-00000006NZR-2YEJ;
	Tue, 07 Apr 2026 11:36:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4j3-00000006NZ1-1hwv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 11:36:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376OO7W3536831
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 11:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6pEf6uKvSI6oCJgjhiIfUYBD3yToz/qagAHgA28vUQs=; b=npziKh9IshzOvxRw
	4ac6g+Tl7qNY2JdkQsjtXfEXoIiZIU9IWYE05R8xxQhz2Kbjz84Mah3kwKBYs0Cm
	HgYWJP7/5ESrY7bAM+d9V9BxryDekaVrerw3PI34QxKp8FY8/WWBGteGRcMZlnIf
	MxqTD7jHp3sBmnKZiSN85k2cHuOzq2vThrXxoyIzqi6jKHCpdn0JWRTIDBldO7t/
	qYO/y78bb8ztJxCa8ev/S1QNER/4tVhlotcbCp4kEuW0/oz51/QXONXgtezung1r
	CY62XG8i0l1eya5dFHdgKhYin4xuOw8IltDpsaRDmCL51jc7PspZiNUlyJXhRGIB
	Dk4+kw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra2gx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 11:36:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8daa0beaso2592031cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 04:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561767; x=1776166567; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pEf6uKvSI6oCJgjhiIfUYBD3yToz/qagAHgA28vUQs=;
        b=aNavk/W1RLouc2sGvLH5eQmGxsgNvE9isn36hdpTNMMm41S6tAcLf2NGjMdOH7kmCJ
         roQyrLW96GXyNjwsh/4ZFkGdDxCP2wJ50pACK7nbg8NqxlS4Gh3DUMlu36UoT19SOtgg
         Kwptq0Mjxjlm5PKyIo+Lf0x5qxiGQxyMgYxjROPTzkGTNCRSSFl5FsrjQcTKfFRrsQmO
         rFDuiwa9KbqgGnX+iv2qbyGW80ue5HaRPmd4wjBXqmTgelYQ4sp4w+8AFRBh5F+4Ahtk
         i0HZCzNiavj8mdlato3j/LA6+z3ULlwP/KhkARZiJFdWNRxkzUi/rxO7/oKYwH5Ta6D/
         12+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561767; x=1776166567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pEf6uKvSI6oCJgjhiIfUYBD3yToz/qagAHgA28vUQs=;
        b=SPGTReU6D0yBr0gFbRo+hi9osAutZBvFOsOPkOKIhPIS9Eoum+w+DMGlvgKJKmNL6w
         CkNKPoKhYQ99xf2G0jBPkKxoWfUauNqj9dx8tSJPxQ37+jrro0QE0Fr1J/n2z9urcdTh
         DlkHJp5c7nssNBhs/dC/StCb9YLcYKXIOBObz/Zk/kn+Vj6l19TqvSOYjmd8WfNGlynj
         U7vGgB+MmPXp8YB1LSgByjC6sRpUESZl4GChLyvJWS11mOutAty1yhER1CT55dfioSRV
         K9g0fIa1UhQdsHv5vrxMLYZSL8P4I9oLevIVp6tHNwv+LdDFzsY8+Cf4BN1xju7Llx7F
         m5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUsCbXcHIUKh5cyHhc2a8DJpTFXs8kt0H9FYTKJubIK6Tc8C33DvH0cY1PP1Za7UrQ1JQnycMHK6a0DXfXiYRos@lists.infradead.org
X-Gm-Message-State: AOJu0YxDVH5vZpSvauA5FWxi/Km6dxsFbSu723L9w+ZDYE+S4QkeT1zK
	yVeqnYN/mtQHAom5ZBuFEpOJ/Khp1rd9dhMhI//IftR6gwAEijrRqeLy+9NvQqniQtON+oVudNV
	dM7qA6LXZOxEWxIi+RmGmYiRiOQ8NbsYnLretYbe844aiNKlKSYuT4o8ECUho3OrUgPCqNSR703
	VOBw==
X-Gm-Gg: AeBDiesimKGOhtKRgg8EraL2EhTIaT7U4Gn90iMVHAKLxqAQel6HpgRKnltVeE+FTqm
	/FYXNUAQaXacuhu+PFray6iSTYvbqj0Vlpz2YMl0m3S+IsHhnsHja3xVj7m8e6t3+Sij325YUEe
	0H99NAOHRg0FtG66qLtu3aQH1eo+7/+/o+ckpthPSezUCmiHK3mJZQklrwIXhbDY6+hmWd+sJ0X
	G/DIA4yUW2Un8fn7aPu9nDLrMyJwgznTdsaNmJ9FnDFVJXAehUOxdoeckO2iykCS4qFrHc4rU0N
	a1ADtmQ0156R31ma3KaXgW4XmsXjRfS1PN9QDPDIHPv/PHUEYTumNwV1tpJJ2VemObZT7YTbcIj
	UxcLd7WbkLrdHbwvTuGqABaSqN2dPzAxfaOnSP+4vXywnxot78Dznh9YFHNk/fFsQgo1D+teAJR
	AB+sY=
X-Received: by 2002:a05:622a:1883:b0:50b:2972:4bec with SMTP id d75a77b69052e-50d62b57f2bmr191597141cf.3.1775561767245;
        Tue, 07 Apr 2026 04:36:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1883:b0:50b:2972:4bec with SMTP id d75a77b69052e-50d62b57f2bmr191596721cf.3.1775561766706;
        Tue, 07 Apr 2026 04:36:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d0287b5sm547504666b.56.2026.04.07.04.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:36:05 -0700 (PDT)
Message-ID: <38f51e0a-fef4-46b5-84e3-0138cc5f79c5@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add D3cold support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com
References: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
 <20260311-d3cold-v3-5-4d85dc7c2695@oss.qualcomm.com>
 <f3344006-5511-4f1b-aea3-7dc81a091cd8@oss.qualcomm.com>
 <4a18abf4-32b0-40c0-bdd1-81ea819c4089@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4a18abf4-32b0-40c0-bdd1-81ea819c4089@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: j7w5sMSAVZ_iWZDSsnThnvvD6OMP0O8j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwOSBTYWx0ZWRfXwLJfxGnNVUS2
 leEcxvh6MjagYLw7r1pNiLqejApTN3beynpM2tIyAYKfOtfXTgLybF6MLXxrQzixO+qHzdOaDKs
 gtvUGfBWdG9/LRNuV9vw+myHdADR9MsxZB1aTbbuD+AXuMZYkQRCCwOyTlGvk/rHapCgulJg3cW
 OBH9UD9WlEm7fSzNLTu51jLhRZ2sQ/kxYtCVoU0fe7cMWH5LW+lmmqnZ/5mSeM12kwMJajX8Mvz
 2X8KpjC5xUd7tCXuztmnlJEHbCCTHHIPB149O4vfuKKA0+MUv2ChjwfRdKY0G8RBARtNq6fFeWZ
 71s6FOJE9BncuRVYZBmFxogjJDivnhYOuk5tL8inm1GLwdXEQHrtxZe41hZgavU/SfBZH5lokuV
 EoO263Kuk6CHeiaGeFhInBL3b88slKPYFeGXXYB6Z0TwvHKPXYayhn2l6J+KwxUPtiyZ/BVXYx9
 Su8jCTPQLPjKvEukDgg==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d4ec28 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=M7nLEK1OKNC5V3jzK1UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: j7w5sMSAVZ_iWZDSsnThnvvD6OMP0O8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_043609_449825_E1DC0D9B 
X-CRM114-Status: GOOD (  13.80  )
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

On 4/6/26 11:08 AM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/17/2026 2:45 PM, Konrad Dybcio wrote:
>> On 3/11/26 11:26 AM, Krishna Chaitanya Chundru wrote:
>>> Add support for transitioning PCIe endpoints & bridges into D3cold by
>>> integrating with the DWC core suspend/resume helpers.
>>>
>>> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
>>> into the DWC host operations so the controller follows the standard
>>> PME_TurnOff-based power-down sequence before entering D3cold.
>>>
>>> When the device is suspended into D3cold, fully tear down interconnect
>>> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
>>> by keeping the required interconnect and OPP votes.
>>>
>>> Drop the qcom_pcie::suspended flag and rely on the existing
>>> dw_pcie::suspended state, which now drives both the power-management
>>> flow and the interconnect/OPP handling.
>>>
>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>>           ret = icc_disable(pcie->icc_cpu);
>>>           if (ret)
>>>               dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
>>>             if (pcie->use_pm_opp)
>>>               dev_pm_opp_set_opp(pcie->pci->dev, NULL);
>> Does calling .suspend not drop the vote by itself?
> No, unlike genpd framework for power domains, opp votes will not removed as part of suspend.

Hm, I would imagine the power vote goes down.. is that the ICC vote
that's still hanging if we don't do this?

Konrad

