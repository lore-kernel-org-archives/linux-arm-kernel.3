Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8166DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naqNMluZvhh1zpVu6XPv1SQCAhNN/GX6Unyao2I5ZNI=; b=ngA8JeRLZmVsrtxgb7/u9vlA8g
	MKqM4SZ/jB3jp0EsX5SYMYlqSz1+PYN4UWUYE2pF9LdUfLjXsXz0UJ18JbVnYrV58h9nFhgw5o/Aw
	SzIuLIzrNRlBIwsEOoQgS1LHUKr/DHItuqQViQHhk0SETjflqWBKbMz2VM5nzmE5Jzko9Wb3NsCkc
	xAfry5NzU5ztGWLBuEc3ifeWZ9gQ6p1SrGvpV6aIpXV7vhWQ/vDuGPrBO9oSyD6duYhIOBd5RAGf9
	IgfssFqlFJRTV0x4/Mtfb77nMidPAltyaoMAD18o+5E10loidO7RUrsr7ytBIcAZY92TW6apRubs6
	uM+sK5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepQN-00000000uHh-0vHS;
	Wed, 01 Jul 2026 07:31:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepQK-00000000uG9-3cN1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:31:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lIWk138701
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 07:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	naqNMluZvhh1zpVu6XPv1SQCAhNN/GX6Unyao2I5ZNI=; b=IbO2GVuMXURSMRsF
	LRpjClDudvMqMNVJZqH1icTdQwvnrB335lkClOSpgpH5NxURfQyaT2VCpbqCbzBH
	5yDxZ1fHAGonqABfbe4eSPysXpXzJfnruVJv83g5cXB3Z/AxCbv6/cLfeTf32CqN
	gjzzqr2ANytjyg3uk5PdsTjnrofiVsJT0noHFHLe5en8l2wNpJLIt6vpgbgUWBLs
	qyBJKViRDXVa39/WDBekRvabw2AbW1Pnz8nfkltQq0NQ5tJk21NJIl1yZr+62u38
	ZOvkhuCqj3zBejzNgsanvCxy21S3m2j/iSS7ZXIXgSCzoqNeBQG8AFkyBJsYxG5w
	H88CXg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw2q6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:31:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c80be91ea3so8216495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 00:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782891116; x=1783495916; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naqNMluZvhh1zpVu6XPv1SQCAhNN/GX6Unyao2I5ZNI=;
        b=VHV9DNNTLeM5zsCAOxp3OCDB+jLYDhBx8q5MHMTrMl/G/SF4VAmZZyv1P5TExTIBo5
         eB93SC9Gm9aW2tPRtQDq+xU8cNiaj7mw1mafReLGJc++58MvHWeoay52YQ0eCXvgZO4o
         xgB5EmPNfOsCkvdX3/+PRosQ8EwX9jhFaBp91MSXHSccHxp32f7H7cwtWjw4f9qrBJiC
         xTSFFEW3/WYoWrw2fa1bKzGPHZSOk3AkqRM/DuA/C8ex7UAu+fy99NC8zZvKhTKbQHZF
         Mx5nIgpwWChRb19d2GmQ4BaZRsNb36dZ0ErVSaZcliBmXy6uExwMBmsxU/ZtVKhBt9R6
         5ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782891116; x=1783495916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naqNMluZvhh1zpVu6XPv1SQCAhNN/GX6Unyao2I5ZNI=;
        b=X1tHgC5+uVx8+yQjcQBV55VJvMhaBktFLS2wdxn8X/EfBLS9EUGrtDtqZklvl4Jq/N
         PSrqG699AyFzf8aODK8Whs/XrVgFeSJQJDAxyDXTyfuRi1ExA+wVwpYfgssFlh2hcey0
         JITkF8Rsx9hOON8uStVcsqYH0YeAva1DbYBcDtMD0/kZwkdg6HmIiQvWbdWE51NcK3yG
         fu8fUQmivb6QX1R0oHAZ9GKyRXICaZuJADTlElnYwX4ly0PdM6LhY+uEwa5rbj+GPe8T
         OruCb58gPd3Ea/IFc5RWGBJkvb+AKZ5sKwtOojmIPnc5zFQppHDi8FJgyve5XMciME6l
         Ri4A==
X-Forwarded-Encrypted: i=1; AHgh+Rq6qPdb1FtoRTGZv7cyVNfE4jN54lg/+g5nEzhGHFLYHuNkaRxhOEwhc0D1Mf6ai21bdDVSrHgTV1ID3AIFZOaf@lists.infradead.org
X-Gm-Message-State: AOJu0YyEVezME7/4ksndaboEo7F8OzfsE9Sht+1GL25TB+bFbPt5zClI
	87r+CUz2BGgxAyspgsAnxzsrs/qYo4/OnSbz4RFFV/TdwjqyVK6zMtxzLUUH+gpAhXm46YKmNek
	UECq6n8T00Ihy85MZfM88qqDDW3Qy5XwSeJ2GsZdN+pGHmzef3CpPH9IGSpK8kBHpOvV/angCAg
	uiDw==
X-Gm-Gg: AfdE7cmjP/H9iaosZSI7R9O5NrTq300A1jioa0+4Tlt6OD5OLMrlX38f9qJ+zCmX3Nm
	HBo846C2S2c1jtqF4MQUtZ7D/oGXHx2/HFucDnGgOq6dwB28uMgJqxRkkQixAuWZ2CGdP92sCz0
	KcooKPJucpO7uVqBS8WoQAIWBNv04nLDDD4Sgs3sn1F3TcK3j/m8TiLj4xlg3+OGRobeStdPX3W
	NJhUE/qggR7Xd7rIvCRVxUHA7H5PWLPDaXCtLU221HSanQg3vJTWgEsgJk0AGxghQwg3I/Oh7id
	7Y8tbq/lwg+7jeP8if6HgXMVTW07DqtgGCUKTaQLF5VKXUG7Og1ZWj6P3t1ZVqd5zztfhhpVLRM
	DjCn0gpMDuQEPa75nKt0gtGma54kTyi+ElE4W1Q7OmodAZN9MsD+6nr2Y4SnRfZVNZp+NtmTeU6
	4=
X-Received: by 2002:a17:903:2f8e:b0:2c9:ff83:41e3 with SMTP id d9443c01a7336-2ca7e6e1653mr6427345ad.21.1782891115637;
        Wed, 01 Jul 2026 00:31:55 -0700 (PDT)
X-Received: by 2002:a17:903:2f8e:b0:2c9:ff83:41e3 with SMTP id d9443c01a7336-2ca7e6e1653mr6427055ad.21.1782891115085;
        Wed, 01 Jul 2026 00:31:55 -0700 (PDT)
Received: from [10.133.33.76] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828c2e8sm26960375ad.43.2026.07.01.00.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:31:54 -0700 (PDT)
Message-ID: <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:31:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
 <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
 <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44c26c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=TEn5Sf8rmKvuiEhX-CAA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: MTZrxuqcX-AmkFcZBCyKyO_aZ6cruAJj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfXz3xf1Y/EmT5i
 C18e+cPJjpxOES/BX3/1EZso9Dg5HpZqTkrHSifXagRGSNPtFYHBZvPDRJHDy/3J7mYTYolMoX5
 UaS3U8Kg6XFlUjQQRplNtcqKAO9MtBQ=
X-Proofpoint-GUID: MTZrxuqcX-AmkFcZBCyKyO_aZ6cruAJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfX/WJy16POFSYa
 KB8248EK6x2u2gVJenLuRtNAaQ/vuI2IG0NUR7DB8ujfcDEC/E0nwYF+7TXq/zfGHjPycMhnRbp
 Z6RlUwfrIR2bfLY+H9MvO8yboed24GQfHhgCixc8BL6CaHTjrEBYZYNdB4zM2EWdEHYDemENVnA
 jXTp7UxzI2z+luMq+R8ax986S148sC3Px43BGAsfHI9ggpOI07V1R4E+NI8846oXvBi1vLEupqz
 SUgW+Bki86ifLvEhRgpYn+ZjmD2TSRXFxMNRXA3zgVQJ8DUReJjMlTE9XXMDsN00ePMYS4ZcvRJ
 aPVkPYWORb1vZ/w+eQInUc/N3RUfLs5cytRWVpu5OtGKsTVM6k8FWBJQBiIMTpuE3gmGjbPu/Kl
 NtZyhnvGcpT+P6/Ec/W1OULvVHxr4f2AdDn9UYLAjKeaMLRDEG7gp36Ln9LjJ1hoN/KnqgiiUx1
 C6TuFfg421BUXo8BMfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_003156_910686_FEA0FB46 
X-CRM114-Status: GOOD (  28.22  )
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



On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
> On 01/07/2026 09:16, Jie Gan wrote:
>>
>>
>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>> AMBA bus.
>>>>
>>>> Convert the compatible to a oneOf and add a standalone
>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>> created on the platform bus instead of the AMBA bus.
>>>
>>> That's a Linux driver specific reason, so not a valid one.
>>>
>>> Describe the hardware instead.
>>>
>>> Also, you do not get other compatible for the same device.
>>
>> The device is intended to be discovered and probed via the AMBA bus.
>> However, due to a hardware issue, AMBA probing does not work correctly.
>> While adding the arm,primecell-periphid property would allow the
> 
> If this is not AMBA bus device, then drop primecell compatible.

Will drop the primecell compatible and update the description.

> 
>> existing AMBA driver to bind, but I think that's a temp WA. As
>> Suzuki/Leo pointed out, we should not add the property to pretend the
>> device as an AMBA device.
>>
>> Instead, I introduced a dedicated compatible string so the device can be
>> handled by the existing platform driver without relying on the missing
> 
> As I said, that's a Linux driver specific reason, so not a valid one.
> 
> Fix your drivers if you insist on that.
> 
>> AMBA primecell identification. The purpose of the new compatible is to
>> clearly distinguish this platform-specific case from the standard
>> AMBA-based implementation. Or shall I re-use the existing compatible
>> "qcom,coresight-tnoc" as platform standalone compatible?
>>
>> We already have a similar pattern for the interconnect TraceNoC device,
>> which uses the platform-specific compatible string qcom,coresight-itnoc.
> I do not see there a fake, duplicated compatible for the same device.
> Can you elaborate how is that relevant?

Will fix it by removing AMBA related description.

Shall I update the clock name from apb_pclk to apb as a platform device?

Thanks,
Jie

> 
> Best regards,
> Krzysztof


