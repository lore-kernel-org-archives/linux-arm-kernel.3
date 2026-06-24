Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C7ECDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3GdgZ+o5lITYD2ZGmitJILxX6Tbi6MycbzRQo9WHWM=; b=JRJDavDf63Bn6eeyU9GkEn8CTi
	Tz3gdhQHw6AetyuB1w1BCkiaUR7fdUmLT6jvO/XQN2iHF6DXdefP3z/cnN5DqwgB4OSmxdUwWorNY
	z3t6h7wsh5Ps9r62uJa8ZfSSVnUDz31U4lR4ZgEqxWGSAbuc0uWWxNh5VdpRgEs+6Qy58N7hMknno
	OEsuKx7Qxs3o0bjCCv8NbOL4upNgZzkRy3YstngKaRSrNfFQxNG4L8pQVBsYAhCND1WDHO82rgzwp
	1nzsPvsdaYhHVM33tcRH/jn5WIbmWZVcqzPKSZHhdSM8BaDi122QI4UCY6GSKY1mNMJEB+IpaBvsN
	dWXMqQQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPDY-00000007yC7-0WcD;
	Wed, 24 Jun 2026 15:08:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPDV-00000007yBZ-2QLV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 15:08:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEfM4O3076075
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 15:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j3GdgZ+o5lITYD2ZGmitJILxX6Tbi6MycbzRQo9WHWM=; b=afyu830Txnvo8Xao
	EZ7atpr+S7VLhmcX9qYrjzY5Lqqzeuc5iSV+Zato7jsh/aTVxmXBsCeeBODUci1J
	NuolLEzxP6FlVCDxAQxea964qdYfrDcHsIzPv2+luXZrDwIRgrK1K0lySP2wkk5O
	qtmW4RCtq6nsVNJgQUy1+opVVJKfGr73cSQQ1WnF2Rkgzhn0PKuFcBDiz5++nU1e
	76Vw9kMSmMcFb/+shPVMZTBV5fKQVEpQrnphBWCWbwd+tqC9wUJdMg5PQgkJeWa3
	gj7iiGYDlJ1xZ7MMHuJ+/WjeekSOyuz6NrbWhdbrUIM4zeAVa39hAfPIYO0n+62h
	rJmbqw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d4517mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 15:08:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37c64f7ff48so1300853a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 08:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782313719; x=1782918519; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j3GdgZ+o5lITYD2ZGmitJILxX6Tbi6MycbzRQo9WHWM=;
        b=cUWEz14N4o6qAUbyBNvsTsbkivePpJgfLTVhir2H5LyRPUwXRyXDWqfyvBjhBi9Toq
         kSWX1VA5/mgdHBi1NQRWGkFzlzhqEPANQN9WQi2WZzASseGq5L+t+4JiV3/U0YT3G2we
         E4xQHM5GxtkvEdpu8zLBCe1l9buk61cBJDoKUeDhbD5c7OemPWgQ/rnqccbQS14HSNBc
         lHUIZh4fhkfn+tnwjRHwThYCxtbMbe4u9mMWrxaSVrlsWTQY6wcTTLh3A9G2uSyjfeJl
         EBQajCMtHLdX4F4FaDaMoYQV3acfLDWAe94fjfZlqDaVhUhr+NsHNbvQaMC3qGxSx/Hc
         jFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782313719; x=1782918519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3GdgZ+o5lITYD2ZGmitJILxX6Tbi6MycbzRQo9WHWM=;
        b=nZwM3Y8kGF2J41ho9lEyjBUvlNjIGGUGIpr49R2WAypT2GZUqQoN8vRPmAJzhsk+Fu
         lrlw3BE3JdEBC7ztRMB2mYiyU/+CuaEjiVESEKwpkTaUnxz2qGy4nc/9z8lWv7KTJ8pd
         4Sl5WPgzYUV+1ixt2WACDa/yriGN7/bTerUndUEXVohM+k8QQMjt1mW2lTMnsk00QAXY
         hH8S6BPW4nH4nxHe84IS0qXe7b5Gn05yJmytZYilgP5lYtvpxfoUkXWRp1VKtTF8onWy
         yNQCKp0DARaxXR3WtnHcZEwUrsv4hiTaZYeWc4IFlCTZIVt+NHwIlctklCVGRy/YCupX
         1VCw==
X-Forwarded-Encrypted: i=1; AHgh+Rol7nQMZczKg9aUIOL+mwOKGlK/I1YjeC5BwibfXkp0+azllDaqskhlJu2ftrs3VMSQAw/9zSkpiOKcSbBP5hBp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5VbGmbJ3xO4mg/yUfK7zsD9efA8NbjBZ1BH8kSFF2J17RYC0H
	+zeRagwqFj76LTZKcI0PG9J32NjA1iScWcDssT7xaMejjM1LHUZ5AxhJRjeG2oJ2dhHXzrhqmtP
	CEUotAromfTaJUblW4mTD3Cojn0pZycl9dC+5SWwKQvT3kanRPqWA88BGrHK6Fkpbt5oQqgSDBF
	Pa8w==
X-Gm-Gg: AfdE7ckZVnoqAaw6eBJ17h1sfud4/ESbi2iRmepzbpLgCWp22gxSqfGu3uygfHEc3Ug
	uBvDU191cEXVjN0B0RwWlsTGGkM1KrTNc76olD41AVzkzqygNGCP+H70r3fsZrGwj5Y0unnKS2W
	WQ84EmtJE6xvwEjiNQVxMAB0UrrHCxSMLOIZPH043NXUfnOadtQSpsHwdWB2Lgh3QDr/rgB6J/J
	JbMhZwf6TnJekdL6txgmY1Ug9eMiFXsWa7BA9VjHDz3VKW8ACekIcSdIQM/dWD1JJ9+F1r6TeXd
	hckWUSlx/U29dV510QUg5uJS3delkv2ukGzn88BGb6OtwhRiLchCpViRad5uUEhhbH+yE6QSe+q
	oUV2OgeXMvPHDzSfHO+f5QWSjKwIduZvuPgtPzPvsCJADSgXu1E6f16zbJ/lotTK0pDBi2PaIUT
	Fv
X-Received: by 2002:a17:90b:5242:b0:37c:6505:e7c3 with SMTP id 98e67ed59e1d1-37dd0dec9famr9384571a91.22.1782313719541;
        Wed, 24 Jun 2026 08:08:39 -0700 (PDT)
X-Received: by 2002:a17:90b:5242:b0:37c:6505:e7c3 with SMTP id 98e67ed59e1d1-37dd0dec9famr9384520a91.22.1782313719042;
        Wed, 24 Jun 2026 08:08:39 -0700 (PDT)
Received: from [10.133.33.213] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3bbc38asm2684833a91.0.2026.06.24.08.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 08:08:38 -0700 (PDT)
Message-ID: <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 23:08:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
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
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <471d7a92-3629-4274-a303-8906d3626037@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyNyBTYWx0ZWRfX2Sr30SRDAx/U
 TxHjPGtxe83msrGuuYTYwUvZeKLvAa5/uYZUF+orNFfOd0bmFWkDs997O3YCwne7BvTbvzDcnfU
 GrUs+SDaJnAdtqn7hSGDI+SrCinwyec=
X-Proofpoint-GUID: Xrt9NvJIsGApXhFwXGlah5RT36MnUisy
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3bf2f8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3Q5jxKAVfJmP3VMBrLwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Xrt9NvJIsGApXhFwXGlah5RT36MnUisy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyNyBTYWx0ZWRfXwVbfOww+2JQp
 eZWqYCihHcdckl709zx7njjjgI0BeopRQ1/cuu+DCKNm4VMl6NUl9P7EHBCMwPSQrCQE41na6Q0
 Z3wZm1F220pf4xAbTU4uv8MipZSfnPKGhMzXxp8sNXpawEAWwjOBL6WTUw6fQxSzj8309jjD2kP
 c50g/AfhHawYBQFsxD0JN8yeHcGiuBSzS1Z5Rcd4YJzARWVvwnzB0AeS5kvjtlasupHx3c0+Pm5
 qb0XSQGC5nNukc5Hf1xJ8+Txs8c8tPOdYPsmGTW8btrvSOkKwwieKQwIx7JJGJBxmV0ERwUZoGk
 Qcby9GBM8mO9CBlcs+Vy6RNVpCVUtIfH2ohZ9w/SjAmYavoWUiezELWbfsXPmAWd3pjcM9ssN9s
 sft2uqtN94m+TpsUy+tx2QptAAeK7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_080841_629457_D56B1B50 
X-CRM114-Status: GOOD (  24.58  )
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



On 6/24/2026 9:51 PM, Suzuki K Poulose wrote:
> On 24/06/2026 14:48, Jie Gan wrote:
>>
>>
>> On 6/24/2026 9:27 PM, Konrad Dybcio wrote:
>>> On 6/24/26 11:49 AM, Jie Gan wrote:
>>>> The AMBA bus attempts to read the CID/PID of a device before invoking
>>>> its probe function if the arm,primecell-periphid property is absent.
>>>> This causes a deferred probe issue for the TraceNoC device, as the
>>>> CID/PID cannot be read from the periphid register.
>>>
>>> Why does it probe defer?
>>>
>>
>> For an AMBA device, the periphid is mandatory for probing. In the 
>> amba_match function, AMBA attempts to read the periphid from the CID/ 
>> PID registers if the arm,primecell-periphid property is absent in the 
>> device tree. If this read fails, it returns -EPROBE_DEFER, and the 
>> probe ultimately fails.
> 
> Why does it fail ? power management ? hw broken ? Is it really AMBA or 
> do you pretend that to be an AMBA device by faking the CID/PID?

The CID reads as 0 from the register, which I suspect is a hardware 
design issue. I have not yet confirmed this with the hardware team. As a 
workaround, I provided a fake periphid via a DT property to bypass 
amba_read_periphid.


Leo commented in other thread:
 >>tnoc.c registers both an AMBA driver and a platform driver. Shouldn't 
 >>it
 >>be registered as a platform device instead?

The platform driver is intended for the interconnect TraceNoC device and 
is not designed to allocate an ATID. The issue is that the TPDM device 
borrows the ATID from the TraceNoC device, resulting in the ATID always 
being 0 when associated with an interconnect NoC device.

However, I believe it is acceptable to allocate an ATID for the itNoC 
device and the issue can be fixed with this way.

Thanks,
Jie

> 
> Suzuki
> 
> 
>> Most AMBA devices expose valid CID/PID registers, so specifying 
>> arm,primecell-periphid in the device tree is usually unnecessary. 
>> However, for the TraceNoC device in this case, AMBA cannot reliably 
>> read the periphid from the corresponding registers.
>>
>>> And is this required for all TNOC devices?
>>
>> So far, the TNOC device has been added to sm8750, Glymur, and 
>> Kaanapali platforms, and all exhibit probe failures due to the same 
>> root cause.
>>
>> I prefer to fix it on Kaanapali first.
>>
>> Thanks,
>> Jie
>>
>>>
>>> Konrad
>>
> 


