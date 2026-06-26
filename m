Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B431FCDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 02:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fI2OuhHoYS1TEYwzBIeud1+ZcMcRB/y8x6pd7S0Vn/c=; b=ktTAbWoaqqaQbLi3nupe9RLIjm
	fkX4TCjopCCXqzVD6vS4ii7oFzdL+XwycUgUkY4aHf8lXeNlwkpCjMJpNW1/6EXffaNjM5wN1MXtn
	rF70F3M6QzZlTFBolIuHluaOmYhOMZYZJV4B2oKc736U12S5N8sjuhMFlssGxKT5rITCW4wDcWr5O
	86prcPzW6THA5B5aJgGC4x3wH5pd5yZy7hp/oy+RD0auMdFwV1zZ0pKUb4yCXlFJiN9P+EiekU7Fq
	BXz0TbPzL8mUVijZpAzYbfGWp2FayPoDYPVrDJkWpqOXtAgKUmuCiWfdtnO70s9eexswGTw+CjSlr
	SzuSWLTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvv7-0000000AFKM-3brR;
	Fri, 26 Jun 2026 02:03:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvv5-0000000AFJk-3R3F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 02:03:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q18oD23471258
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 02:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fI2OuhHoYS1TEYwzBIeud1+ZcMcRB/y8x6pd7S0Vn/c=; b=XymeawGhpcsDSqSg
	l/SiQg5HzhqXg+aGThmSRpAqJ38b3ZwY5lSRI/Fi/D9F9VakXrzsmiZzdkiUaNS9
	LvTNgHOxwdYRvZuUnii/m4sV/F8n7I88g2nEZjIfbyWQTJSFpKet28i5lcehlBJ2
	yODzKN4Mx/2UfbdNBcRgqhs9g/pFD5ygR1SdQ+caOmB2IT5R5NDSm+KA27eylngB
	Ux9kBQ9Pi4ke11Hut1RUGC2MiJz6Itll5q5lbLEFLT0qzd9HWyUTt+tWMQwjG3uG
	xLEWQVdk3Ald1BeC0Q1EhEF4HSUUC9NYRzD6mR3C9M8SYndHmxSdrc4IRBmc7Iq+
	CTp6UA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdr50e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 02:03:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88e0f04e51so235674a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 19:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782439430; x=1783044230; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fI2OuhHoYS1TEYwzBIeud1+ZcMcRB/y8x6pd7S0Vn/c=;
        b=BiWw8O4RuL0fEjvqyGSD3QegeRgSKIKuWuh6UzhG0SMCZXcUoh8Je32nzd2yTHnEZn
         wNQtZ+RueOVz7UeDzLdFl4HkZK5qr/6rtt//lfmBWHeBMgYE1Emv82W32vROMGGMxQI3
         x4D1f5HyLHPgHKN95ZZ14SIuWIDIOx6KurjILvzC1m4sZ83F/g2LCDLicUilFx50JJiM
         9jheIGPjJDRUyfjwDeu15s4wrylhhr5Pzq0ZuIUiIvnr3QFFAEjzZyHrkkRK7PvDST3v
         BYohTUQRLpOV4TiwbVrgzyo86Y1YvOi7qHbG0WYym1yknVicWfj07UWMpdxuDPdEccyy
         GcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782439430; x=1783044230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fI2OuhHoYS1TEYwzBIeud1+ZcMcRB/y8x6pd7S0Vn/c=;
        b=AqXjqvv+s3FNn/krhfsGmZE9KKVfaR3yPyEGNImh+l47FI/f3CUc6h27nbcOx6Ps3m
         62ZydVUsPMTx2Ju5xgaiQbB2fwz/MbMD/axd3u4yetxK/DMaHc/FZKL2w1KDjwZ2Ff/j
         0KL4jKqW9kcO9NLEDTO+568xucWV7NMuas6XHsJqJGXW/PtGdICNM2yDpdgpmObYEFkL
         vY8+kDz3Np7fwEkizSUIb7yBN3YE+oYe/DslJEJxd1kjomkdH+VEfXtiLQG9lbsjm3sV
         V2kwxYR7oEqZpevQeen+7cx0Ij7qfsD1eFaaLafDC5wK8lvvoEOjmnr9KmSBsvzEQ86k
         Mh+w==
X-Forwarded-Encrypted: i=1; AFNElJ9ViDEyEDoj/Cg97gG8S/CqUd6Pxej9cep/Xj7aPWGR73bZIJOFJf8/Pl4BYMnIJUic1KOWWAJpOe+FuQf7AwI9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1JXxBBbbQysL3wjvn81PA3yXse1DgbHFr+kr38kdsI1yo7izn
	2eHEykRBDZ1v7HAexlyKct/FWnmHnDAr9EQuFd8XnFy/5F1t/8Pt1Ph57VXTXX4gmgmwXPOAbNv
	D/e5ldy8ZuWHjMEwexb1y1zY2PLZkDdOnufe3eqMOzYeexpjMcHxwh5gfzb6QRJ4IUGCEB9+dSO
	NR7g==
X-Gm-Gg: AfdE7cmeBYOCg0YQvvdMR2QfEi2ThbIDbCxDdznFIC1e33N0GFJ4r5Y+X7T7l2DAWb5
	anbfpAanJAMoK/BAmd0Umyg4vj4zGEvjwOqK1c//3QTRUgAEnoHdFMgizDi3OFzqYeQcAYz7Xqv
	W0DT33Q/krIRNghBoRrvplw0gF1l1JQD8ontV9RyNItoenTVS+aB3QM9hQQt4YlNa9jOf78621W
	sI+Rp4Rn69vkeZVGs0mfy3tqfsGSB3uZ3k9EtlYOP3C8MH/tdIHC3H0hTS/mKmkn87QE805oH8M
	3sAsmDxvny2G7SdHGq00OqqR7u1wpqfrSrjuWJo3++Bh1+oZYHo9Pl6EiHEZ/Ef0WzmD5fAw86k
	KS5CjzPCQKVw2DIY1G52yxWjwbNQmlFM=
X-Received: by 2002:a05:6a21:3994:b0:3b4:8818:fd34 with SMTP id adf61e73a8af0-3bd4ae0fae1mr5588774637.25.1782439430518;
        Thu, 25 Jun 2026 19:03:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:3994:b0:3b4:8818:fd34 with SMTP id adf61e73a8af0-3bd4ae0fae1mr5588728637.25.1782439429938;
        Thu, 25 Jun 2026 19:03:49 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bd55985asm2535896a12.31.2026.06.25.19.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 19:03:49 -0700 (PDT)
Message-ID: <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 10:03:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260625085643.GD575984@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3dde07 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bmbh54CRVxo00WvuETkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAxNCBTYWx0ZWRfX+j3WFjLIA9pT
 l8e/9jOa21EXbmkQ2nCXu1QXLkBpu5eQ3ui2aMdAn486QvU8DRgALdYNDXAEnRHp/dpgG/GRv4f
 RPB+4YffucSGG0ih2zRtqCpKetY77EmLnv5NQEu8J7yCnxqy64jSRwZsOMzJhCQQC4FahBSrkNp
 Kdla056ejkPXRiOYaoLRifeDVhR1OHk10ajqJkg70ZjlKA+gjhsJcJbBIoZSifDWrt8IsK9OHOA
 EGi3RWHURE88ADAhRyd083ixeiIwcvUafjASKjVwOS1KglyjSn8BAfP4m4OA2loo2gobBFziOup
 qJvT2dDBW0UPPyX+vQTAtoEB172TFFG3/mA3LLdE8QCa6JbP9iqOuzkiGbo+S6AFAa4KTP+6S1F
 hDq5nu4p5aptSMq7EEYp/k65oYn4SPwwYuRkteIvrJKcVQN2vSRf+ssV94aiayg0opcfW90IQB+
 IdurwdSnmTsaG1amtXw==
X-Proofpoint-ORIG-GUID: yMG-sVa8RQrhnluc3zCPCPn69OOoS2c4
X-Proofpoint-GUID: yMG-sVa8RQrhnluc3zCPCPn69OOoS2c4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAxNCBTYWx0ZWRfXxDA+Reue988V
 mId/n2q7Ye6vrgapnL4mPJOelailerfBkXca2tXt+qaG4b/aKmE+Hf6FgoPtRaHwfcxB092V0qJ
 VLB3F2WmIgcR6aC/yKqtqyFu/38mOrw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_190351_865762_DA3BB666 
X-CRM114-Status: GOOD (  27.32  )
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



On 6/25/2026 4:56 PM, Leo Yan wrote:
> On Thu, Jun 25, 2026 at 09:01:18AM +0800, Jie Gan wrote:
> 
> [...]
> 
>>>> However, I believe it is acceptable to allocate an ATID for the itNoC device
>>>> and the issue can be fixed with this way.
>>>
>>> I think so.
>>
>> Hi Suzuki/Leo
>>
>> Which solution do you prefer to address the issue?
> 
> I will leave this to Suzuki.
> 
>> The interconnect traceNoC platform driver is intended for the itnoc device,
>> implying that no TPDM devices are connected to it. So, if I modify it to
>> allocate an ATID, I think it would be better to rename the “itnoc” node
>> accordingly? Or it's ok to leave it as-is?
>>
>> BTW, the traceNoC device definitely is an AMBA device with CID/PID
>> registers.
> 
> Just to share a bit thoughts on the driver's design.
> 
> I think it would be better to keep the probe function generic. The AMBA
> probe should not be specific to TraceNoC, and the platform probe should
> not be only dedicated to the interconnect TraceNoC. The probe function
> should simply handle a device that appears on either the AMBA bus or the
> platform bus.
> 
> So the question is: if allocat an ATID for all traceNoC devices, do you
> still need to distinguish TraceNoC types? If no, then the code can be
> unified.
> 

Hi Leo,

To be honest, I would prefer not to modify the interconnect platform 
driver. On some Qualcomm platforms, multiple itnoc devices reside within 
small blocks(one or more than one for each block) and are connected to a 
dummy source. In such cases, two ATIDs are allocated for a path (the 
dummy source and the itnoc), which is inefficient. This is why the itnoc 
platform driver created to avoid this waste.

The TraceNoC (called as AG TraceNoC) is a generic TraceNoC device which 
connected to multiple source and link devices, aggregating data from all 
source devices into a single output path.

This device is implemented as an AMBA device but lacks proper hardware 
configuration. As a result, it must be handled in the driver as a 
workaround, which unfortunately breaks the original design intent.

Thanks,
Jie

> Thanks,
> Leo


