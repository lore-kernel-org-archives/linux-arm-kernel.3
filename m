Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310E7CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 01:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9Nczp6ZPD9k3X0chhFsGz8D+YeWBBIoPg1GZIWffTM=; b=pqYPMggCcIw6p+mC0rY2ElnaXi
	TRVA5SH+mIEj5ZGFiJTbumPANfTKMjqkCULuuMndp6ej0IVtgQcEkuL/Nh/KSF8BT2GeepVe8FgaX
	vYRum7OxMF1REzgGOQyGJOvyE/xrymoF3he5e2bjwytnNOgUecRnHTVlN0PnkuUdbmGH06+33DSw7
	uzeSktXoDEv14YoS9hV+1YduE1InLC0zNf8qUBnaOpTJxsWeMgmyscZtsOMjlUDnIxNvnaZvQvjKA
	QFzdkwjF7WxIihUiFb97DjEF9zWlyqJ49X38DDMiqhFkhbqPcCVZIAr/ZDSDdfrAPdA2ndMZG8KDH
	r3Pnhs8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcYTD-00000008Urd-0ntV;
	Thu, 25 Jun 2026 01:01:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcYTA-00000008UrH-0PYe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 01:01:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLqa1j166570
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 01:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9Nczp6ZPD9k3X0chhFsGz8D+YeWBBIoPg1GZIWffTM=; b=ZvA9h5M7xX7s9iOu
	5kdKGdO3Uprji+67EKohMHTyzZL3cqzFUQYDNDaD7aep3vQmeeFn5czi/BBmkPaE
	6lkwreJDTBey9OUM/9KzVVNkyuUmK/szGOVgQQkyPE2a4qosqOjpbPWENsM/t5C4
	/MCOR09Z5Nt4GysZckZrQSzrE3Z80uWbezJu5y8mAPyG3yxwGjV/1nqZMJ74Kn5i
	FreDKnT8shxu5fXAg3aqNHKMZ8L7z8PM0BTPLr/PVXprudx4vHIij6RrxXEVGLby
	ajyNE9BH1w9sxBQ02LABObmurXrirLDVJ1xfBRxpTFk19KtjavxTbA+7XhqY83KC
	30FIFA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dstpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 01:01:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c2d0a8b5beso13888875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 18:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782349286; x=1782954086; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k9Nczp6ZPD9k3X0chhFsGz8D+YeWBBIoPg1GZIWffTM=;
        b=ixNGr/92vU3GiM4cnXX2d1sV4zgDRMQ4iNxVit0OYiPv2VEgvNiks7ozINVpAHQ7yT
         vyBcziDqeokQyQtWR9l2WI9sdTOn5pwtTdjmxjz/bsImSF1XxB2C5uhiE9+zMGK47BtE
         r+d8qAZUjC5MHuONc3HUq95g0qcR9g462z3L+R15gORXY+hFn0B4sPWj4VRIz59wUJGG
         WUFdoWLaK6gdYW8KdF4J9Xa+Z3Gl8mfC6YN+ErHhf1gqG6ibbev8Gmqx7kQP3B9Knn72
         C6ULBPSREfYAM3VnwbJF9780rn/IPILDetC9xyELFvE7Zru40rEqc/733hOcESaEBQMo
         CWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782349286; x=1782954086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9Nczp6ZPD9k3X0chhFsGz8D+YeWBBIoPg1GZIWffTM=;
        b=KnhoSZB4fQuvoON9aYfTD4QpPtIZ/j+qqy+JhQBOycMeucyd6cTi78x9NY8Q09VVkX
         LsbFzcdS1kjmsdGaaG93HwFZaJjO3M/uKj/kwDiaWe54+Jz5IrN5tAphvIDrJBN6fkbP
         wHoDsOKTqgz4dsgK5AdozPhV4gfSq6A1hfNJ6Ra8T7FP9hTFkhhUiX+BRiXuFeiW6Lx9
         lMFQQVTNEBRzPyhYhF9tIHu60ZWWpANGVr8LWxYUWbsm5dmzehWFNb27oPIYqd2bgPrY
         toN6BMKl0WzRpwMxlT18OYS/NGXiqJqLqQr6hC8hhcylnd+xnfnR3p8XOr5UJ6tXZ5bu
         W+iw==
X-Forwarded-Encrypted: i=1; AHgh+RqifCn9HUU+TzlwkGYVs/val3jkOgzqW/IpR2iig/gpyINCkkpDas+HKKADNCuNmfIWp1vCsfV2FSGn3DbyeYVN@lists.infradead.org
X-Gm-Message-State: AOJu0YxSxtrXG2qw8b/taWr2p4tc8vy8MrgeqR/qXg93OQoNESZMOJUa
	A+jq5movgJeH1f939qvUqjF4vHz1z6Z6c0yluUIIdWliNyb1pBF62VhXi/sZnQ6av1L0nxbYQiJ
	itr7xsnnisl1vVw8G8fJjV8Q2QyP41juzkY64jtVH5+xmRcu9/5AmY55bf4SmPoeeZfdEfg3r6+
	KCVw==
X-Gm-Gg: AfdE7ckzI5R6yKc8LvP0JDZlK7qIE1h6avCsEa/N3kK/7JYZ6GIbPZ87ZW79Qo8EjWS
	sStXzcJ0Qo1J0zl33nJ2+0skAsAoYvNaKoSnKW7rGdpMQgiHC3jhPcO8cR+atAJMa9YOq7JEQwN
	uTzA/rLZxlblECdbRBzLgjnGJDYkAEyfuQyW4hnTyyoo0u2cs9yZFklSXvKRK1S8wvF1llrb8ja
	b/Xv0bIdGlU3mYUAMrHFHgCyjobeiy2BpfO+Ac3WwPZdHXc9RHsYHoedr24g8JNpdFjbBt8nwDf
	PbLQDW4vU7ZJPeRdkRhTtxGuWCR45eDrZSqoVR77SYxlTQejjIeDrKNJm2CGjtulA9zu5F9fDo+
	VziPHzgTSxXBnllU11Jx2EdWJ+kBnEUo31vdLdm2aMHEvLTUoP+kEJ/tVYjiBqE793BYMasBl+A
	rF
X-Received: by 2002:a17:902:d489:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2c7fc382d31mr5407025ad.0.1782349285566;
        Wed, 24 Jun 2026 18:01:25 -0700 (PDT)
X-Received: by 2002:a17:902:d489:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2c7fc382d31mr5406375ad.0.1782349284807;
        Wed, 24 Jun 2026 18:01:24 -0700 (PDT)
Received: from [10.133.33.237] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f65062adsm7653335ad.75.2026.06.24.18.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 18:01:24 -0700 (PDT)
Message-ID: <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:01:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260624151610.GC575984@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VqrYE4syavm7galp44TwKkdvN5ZFKCIv
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3c7de6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=jcv4FM0po0oPS6h7aqIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAwNiBTYWx0ZWRfXw4f7K5owKUe3
 4UypczHMfT0mlOQjoHUSJsJJenS7EMd90JkEM7p8B8QM/GpGUDtAPxUsolyk1H9+rUD1iMUslQ3
 XD/uOnPgoFsG5s9gHLC3vn0zpBVecIM=
X-Proofpoint-ORIG-GUID: VqrYE4syavm7galp44TwKkdvN5ZFKCIv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAwNiBTYWx0ZWRfX9PMsAofOklad
 58BLonEzMIi77GpgoyvHkXPELeQKXGCvlrsKY+v196N1JXOYEEIiSJ71IH6iRmpIj+7OtCSERwH
 /2pNhMPiUZFGrYoYYSW0dH6U0TaKPw25pPPOfivyGUb8L8VKuGOEKLarOoCwGqVU0xlaREqtVFD
 Sq1BRxbQ1NvOB39EoBSfvmXoeSB/8x978uQJZUw568sUxF55Ypmi+pIz48/0dtJCu1Vh4UTMqTb
 w01E8yosM/JOCaGldDGqUiz7T8ZhY0CEak7HGDmMCoykgPpIMV68+5rKkY/NkSi/CAcoMIF0YTS
 kpdaDiY3WeC36KpWzNSE2krrVtdAdUe9IfOgVR9gan4syK5pBQpLedUGgBddDbBNGRMadKRQKy9
 vsTzNR8fNP5TITdqWa25WkEvs3oLbKs/WRsIGeaXppRXRv9HbtNuTwpU9QNxIXjKoZV94K9W9yZ
 tGXZkqjZ9JSMD75WHwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_180128_305398_C1ED6E81 
X-CRM114-Status: GOOD (  21.83  )
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



On 6/24/2026 11:16 PM, Leo Yan wrote:
> On Wed, Jun 24, 2026 at 11:08:32PM +0800, Jie Gan wrote:
> 
> [...]
> 
>>> Why does it fail ? power management ? hw broken ? Is it really AMBA or
>>> do you pretend that to be an AMBA device by faking the CID/PID?
>>
>> The CID reads as 0 from the register, which I suspect is a hardware design
>> issue. I have not yet confirmed this with the hardware team. As a
>> workaround, I provided a fake periphid via a DT property to bypass
>> amba_read_periphid.
>>
>>
>> Leo commented in other thread:
>>>> tnoc.c registers both an AMBA driver and a platform driver. Shouldn't >>it
>>>> be registered as a platform device instead?
>>
>> The platform driver is intended for the interconnect TraceNoC device and is
>> not designed to allocate an ATID. The issue is that the TPDM device borrows
>> the ATID from the TraceNoC device, resulting in the ATID always being 0 when
>> associated with an interconnect NoC device.
>>
>> However, I believe it is acceptable to allocate an ATID for the itNoC device
>> and the issue can be fixed with this way.
> 
> I think so.

Hi Suzuki/Leo

Which solution do you prefer to address the issue?
The interconnect traceNoC platform driver is intended for the itnoc 
device, implying that no TPDM devices are connected to it. So, if I 
modify it to allocate an ATID, I think it would be better to rename the 
“itnoc” node accordingly? Or it's ok to leave it as-is?

BTW, the traceNoC device definitely is an AMBA device with CID/PID 
registers.

Thanks,
Jie


