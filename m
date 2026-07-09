Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760EDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOoqpkxalQnGgn2rNAM92KHFKF9kGa/rlb46Hia6Qak=; b=wazxLV74jba0361dtXBiRMcBBV
	WZGxV5jm5lYboF5/SmtIH+v5+5/I1BXDMppuKZR4hzIJsZPEgooom4/cxRXsuAwDVqGkjO/wcuVts
	7pXj634oAhU/pUvkBnWj5iH73oiX8ucwEhIrwXuK0/yTDsBJQ5FUAghop+zyJSNPnqWbrRZ3W6jkr
	PSzerfut1sX5/FdH6mNVYAT3WNITQ9nAq0ekss4ZwndB8ah34bOhahcDtZedsW52YjFbC8H/4T5LC
	Q9IKrSXvPT2DVNx0dnOGTmpsiCuO/tQurzs29K9MzITq4s962hIqjpZhRDrMXzYSY3NvPnfvPkK04
	qGZfM3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whke9-00000001hzJ-0JBW;
	Thu, 09 Jul 2026 09:02:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whke6-00000001hya-3pQa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:02:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960HHL887989
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 09:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EOoqpkxalQnGgn2rNAM92KHFKF9kGa/rlb46Hia6Qak=; b=AulfuAlmG2nMc/yj
	QmLRWmYJZcbVBduUxmvmp/+QQOfbcw1XNli9D1qps4BTCWRJV+YgY+Z6/tA7Swpl
	YZdtE0exoFj6K8e+VJ1sfaEFl7/M4plsnVAvPX4Yoll8azBclSgTe1K7Zbp9h4Sa
	ztEjjJkSwy0Uxdx7NxiJqgZFvFPeW/49I2iy4ycArnnVmwQN9hGf+9HKy7VHEfaO
	DkdP5XTNJ/SRuEERvwY3TdRWwvKCF3r5aS+CPCbJcE/Y/KztnemFrKM9pALTWyVM
	332VS3PU2dYPIoDjpnFc/bqMpAkS2Ibh/DWKWciZQlb7HhAmpWh9Wr3EKt0iATwE
	MOHVcA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33puw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 09:02:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3810960140eso3213094a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587733; x=1784192533; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOoqpkxalQnGgn2rNAM92KHFKF9kGa/rlb46Hia6Qak=;
        b=NsJicFlah8w0/s8r/CcHItU7C0QCt3Ke4LF16c5HPEOCqoGaNxKgOEv/coTpENKDVr
         lbb7t+N0PkQIa0iuTVWI8P+SYWRMWB9/FX8+41JdLYiR6KIitm7GCUtsacBDj1zW+FME
         gYgnH/hXHSTkpWtztfv2YWLJnBZwlm6Tqhc/quJPapzVlekoXpcLNzJExNlNfLe/F1Hb
         V6/bdWZEuQQKRejHfPOBQHj/wGVWJrS1dAK2RSmUxvNE0hMrZBTROXLB/hXrn/ve4tom
         W+wc2jOZbNpZtTHAvT7MQqO59+FpDGczmk/D68rD+ayq/k7ywJdehZ1db8ECpKEQyoVO
         TxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587733; x=1784192533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOoqpkxalQnGgn2rNAM92KHFKF9kGa/rlb46Hia6Qak=;
        b=d1WBb456PJY1Gi1b8ezqriX1qolF3mjmoJ8gLBKDiZm9nb+1alJda6ijsDp0ksAFG1
         VRkdLiork1/DD4HmBVgxtCL+iU5DNAUvlvZqrPLC38jpftteFhv3gC3wkXDrkzyXJz4g
         T/uIp/wE6flPgo7FwbPlVEAFQ/ub4NuAbVDwbt1Tl6gPcADK/xgBwDwE96KofsX9iwA8
         XIbMHq4vrVQ/6yVhg1Vk+5LVkUGTQwtyYnKd3KkppDAs37PT7d50uXm5x6Ozf43jmo/V
         QBOXHd7oRzf1wbWgY40bGkKlNeN6sX/tK3eImGIxjVqabzgQBkd4wkJBp/r2WvtNlgm7
         F50Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr3kIJQL/pI1JXT4lFM9TyASRHNbLW5VfKKUjXij2opelyChv2PmG2/SdVm6352Yf0hjljWUlInZHsERgSE0v4v@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ61NYojJfqWmQExgRCpuxQHr7pvuOc+T9rY7AjJprzWeKtxpn
	DNMW2QtGt+rZclPVEtdgh0lQy56K8zWr8wAZ69kVW/QZ3tM4tIs+V65TNVEBuJqJwtNMGf5MklH
	M4F5EL0bZRjkPJRuafo54wLA/92L0P00ZWlyL5vDsdGw0pUi9l67F+BFdcyAwOvDUfk9Iv4RBtQ
	xx8w==
X-Gm-Gg: AfdE7cn5pokVCm/f2J5yOAHN/BtLd20YmyOTT0xinIICOjqmYYeWPAvRD/spm0cj181
	aSUmZ9hPuQPIdrbRmvoW11D+ETxb//QY6wVmX/8691WAY8G2zMLzyzIJlubpGp6k2h7WeqHksf4
	2/ljZtY+hNjPLcClawEjqgDoUFXxKYXl1WD2b9ygBv8LXj797EQyTSrD+qeGrPDborrWl6msJFZ
	vMn57OA0GUoAcYBEUY4lqfepmSWRsfUmuAoiu98/l9fv67HC2eMgGgeenXUjC5U9mH3jrD5ASCF
	Ps2rkYoAnOvYwPFBYmVZmwUCaUoOKG2504RPPgqkxLc8stPYjqBgbjea50ecHkYpAu/9s5I2iZu
	aV4OBRQ4pBkDA3DB2DD29+XeOX1m3CteItBAq5bNg+iT2QaBe/kGktaA6CpCdhFpmQ1M5wAtevW
	32
X-Received: by 2002:a17:90a:d2d0:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-38941cc7844mr6222196a91.24.1783587732735;
        Thu, 09 Jul 2026 02:02:12 -0700 (PDT)
X-Received: by 2002:a17:90a:d2d0:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-38941cc7844mr6222140a91.24.1783587732151;
        Thu, 09 Jul 2026 02:02:12 -0700 (PDT)
Received: from [10.133.33.179] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a57dc53a0sm823440a91.9.2026.07.09.02.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 02:02:10 -0700 (PDT)
Message-ID: <c120ec84-c125-4dec-945a-da12624d82e7@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 17:02:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: coresight-tnoc: Drop
 arm,primecell to bind on platform bus
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
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
 <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
 <20260709-versed-marvellous-pigeon-22e2ba@quoll>
 <e5876525-4568-43bd-8c91-6dc462b18fa3@oss.qualcomm.com>
 <02baada9-3f87-4e60-a469-44af5ebe1afe@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <02baada9-3f87-4e60-a469-44af5ebe1afe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X-uLK8COcSghc_O25upDb4bZP4_-Zar0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4NSBTYWx0ZWRfXybdsR64VPIGx
 3AL3UmLirUry5WpzqrrxtCDsBLn8KmSammumZqbWRvwSCDwCns980+9Py8Iws/ilWbficMPFFvl
 1K84QuoROm7MMVCLSW1aWl/066XRV9B8s3vzq7DBkDFB0nhGZKsDdNnB2xM/al7e2iiv2MLvfM4
 vUqOPi5cJ1a60BZuCE2SNxpkuKV4kQ/950YeXJFuS7S6Zo6a7oXAxnN2WxjRn9mccQQ7oeyllj7
 cyPF1ggTpOcCtga2vkyuaf8gfgliHv3KjnQ9SdiDbExnv2I3100vH/ps1LMgy0bP+Agr5l/BEnh
 JXJaLa57GtSn8m42dDbYw3UktEUtRJozRtFKrPJL/3xZYcOyIPNY5BuuPrgj/3GV1BMbQY9JpS9
 F8Vcwmo9Z/zqKpBhNJmkg6sh3SmCDJ6NBz8rT2AcEG2rV/7wpc8mLTqIb2d34FP0fg6hqi0H0iH
 dbRGZ0uByGVSHXefx7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4NSBTYWx0ZWRfX/TiR0Oi7fwp5
 KlyhetaUMcW2j6RlIlNSjZef1WMSzzdUX1JqARWyLVFk2J6xbS5Mrxpqy1qq4bDeX1QIalCwc7E
 9YLFP//PRR9fs4iM5j8j+g8HGmy+nXA=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f6395 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Zyal9cr7WW2U8Oh0dT0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: X-uLK8COcSghc_O25upDb4bZP4_-Zar0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_020215_075270_4EFF83C9 
X-CRM114-Status: GOOD (  20.26  )
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



On 7/9/2026 4:46 PM, Krzysztof Kozlowski wrote:
> On 09/07/2026 10:34, Jie Gan wrote:
>>
>>
>> On 7/9/2026 3:59 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 07, 2026 at 05:08:49PM +0800, Jie Gan wrote:
>>>> The TNOC compatible previously required the two-string AMBA form
>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>> AMBA bus.
>>>>
>>>> Change the compatible to a single "qcom,coresight-tnoc" string with no
>>>> "arm,primecell" entry, so the device is created on the platform bus and
>>>> bound by the platform driver through its compatible string.
>>>
>>> I asked already: this is not a valid reason. References to Linux
>>> structures are not correct here. If this is your reason, then answer is:
>>> fix drivers, by renaming or doing whatever is necessary to platform bus
>>> to behave like amba bus.
>>
>> The issue is that we are not allowed to introduce a DT property to
>> bypass the AMBA bus validation, which reads the Component ID (CID)
> 
> It is the first time "bypass the AMBU bus validation" appears in this
> patch. You do not see that as a problem?
> 
> Again, third time and the last: describe the actual hardware and the
> actual problem coming from the hardware.

Understood, will focus on describe the hardware and the hardware issue.

Commit message description updated like below:

The Aggregator TraceNoC hardware exposes CID registers, but the 
Component ID value read from those registers is 0 instead of a valid 
AMBA Component ID. As a result, the device cannot be identified by the 
AMBA bus and is not discovered as an AMBA device.

Since the hardware does not provide a valid AMBA identification, 
describe the Aggregator TraceNoC using a dedicated compatible string and 
bind it to the existing platform driver.

Thanks,
Jie

> 
> Best regards,
> Krzysztof


