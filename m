Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4F3C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BA33c04zG/s0Ltuw12G0cx/mbnPEXUJh7lFeBxmokg=; b=MJSEGR9mtnFk/7xfrtBG6Pwzee
	A1ssB51LtlfR79XmVPFejWOf8W2YPKePyf/TMDSeGEBlGos3LWjzwy7z5xfgVbAYp06gLWYClOEGA
	0wmkHvWaZ77iNUMnv+SE7EPBl8TpIKKWCjv5eheBLCcix6AKkf4hSF7jyCX4huPRDlVka+7m5DFx6
	dLzp9FlGGa4Cft2G72L+YF3xySKTNEUmNgFPRaH+jSHS3opnJE99MhldXzUY97hZ2iftDkBeCIkgC
	ohNSQ8ka0JcSXBDd+264ik0Np2WQACb30nfBMq58nTYHnMGFEF7K3bc0ShYcYUs6tFuf0QZq6Dy7q
	1TvKwQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRRX-00000008eA5-1gjq;
	Wed, 26 Mar 2025 14:09:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRCO-00000008c0e-3Ag8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:53:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q73lvH006894
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 13:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7BA33c04zG/s0Ltuw12G0cx/mbnPEXUJh7lFeBxmokg=; b=F2G1EAewDGFCeXUe
	zYCYQ4MFvBNdSbLz1+sxBAGV1Fvb2D74YEjtBVRXVpwdp6tyIRuQnKsH6TYxzohh
	7TXFcPtpeO6L6mYN4m0w2u02BTvLU8ItT5nMlPL2JSdKkRkZHaIP/TTCn1afVpxF
	avNnVqgowFb+IXIag40RSd8wdJScS0y8OL6bYfG224bGRqICLwQhHsuWGthOu/Ev
	dSWFmo+a6Wj1r1O8sDdGsRIaQOqug6H7a88MuBWjOwKnQJ5462hsaMFpsacHjWs/
	6NQHt9LW0vCgMYQUdeigzDw6gBEkFLPfihAqa2PGV9iUrS0Qyt5TqCWUPuuR7Ati
	BnmhvQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45k7qjf52n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 13:53:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-477608e8e4aso184151cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 06:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742997218; x=1743602018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7BA33c04zG/s0Ltuw12G0cx/mbnPEXUJh7lFeBxmokg=;
        b=AceiGr+CM2g90N5kL/QQEusfVzH5XNMm0HivsFh+MUhBHQY61wgKhaF7KIfbvTtzcF
         aL66nV+0+a3c0fhvGnvAxPNGB6Kh0QPR20SoZzgv8PdZkMI2d864quZEz7d7DZUva27L
         adPZs6yz+cnGMPGcUgSZbOa2H4Q1LcZnw4hsCftN1ya2wQcYORjugCF8Nq2NOqfZddWN
         iLux6zWYGLdgoLRl3PfBLwWiXMRetqAQwr/3wMyNddj+upa0CchqfOEcO8PRPkMmqS+9
         PdzNcgDig04UDee2xqBk5j+C/t/WV7cxWDjjdkZLmznXOWozBkS+fOSCnyLLlWocdteN
         /3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXcs0PJmzJpW6lhCYlhi2VOJ0P1hxY0YclK4dxTw+APxMSeCEcKcnLtM9wnE7Puj4Mgyo4iBg1jzjqg/hKmZ3e4@lists.infradead.org
X-Gm-Message-State: AOJu0YwWh0w6DJ7vGIcdN0FFuxCReZ/Fbf4hMtPBmAGBFgZIdLEhml70
	biY1cQqIm7Uni6KOysLka0rPbgk9af5zPMctgsd6TvPZuI23AZrzkjOlmJFyjf9OYrtcXhooVe3
	B/SQsG9igGJqBw1p7KmammR3r3DHQXg+VXc5DE5kIyQDYMOrGL7cBVmndTEN2x/XKlNcKX6aNHw
	==
X-Gm-Gg: ASbGncucTSBWlFemHB547WWFRex7Pve0IrEh3LgaqgPZvw4njUeG+rmnUFo2RbaF6fz
	UjEn0aYEZD+NAZ1eDyZS0gdivF7g0vozJS0azUkopldLFdqDgV6/NrcfK7oAZgvGZVWQmC0dgE0
	P0qi9pMNjgJY5Qj7W984EqcfofEytGyo6JQCjren/1BKr+4IRalEFKhk3In/vKHlFpFIw5mqXp0
	QTGiZVKLpULJ9ILxbIRwNejBLrNiP9TfpGvP3KcpgG5Vg+J7+m34d3+KfhkguoaQDMBf9/fd16u
	qAH2GNpEvSS0Fh9Qb4XwtdI2MM4jYAfSMhgeFhRPTQ/qSGUj3OCJxIC1lXB5Dviu7hYyPg==
X-Received: by 2002:ac8:5894:0:b0:474:bc4a:edc8 with SMTP id d75a77b69052e-4775121d71dmr35379641cf.0.1742997218268;
        Wed, 26 Mar 2025 06:53:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHebjyONIhZv+DeY46JivB3zqnPTztA+Se1h9eQ9cmVWaA0E0xMl/fWl7R8P3vHJk6AzYv29A==
X-Received: by 2002:ac8:5894:0:b0:474:bc4a:edc8 with SMTP id d75a77b69052e-4775121d71dmr35379341cf.0.1742997217624;
        Wed, 26 Mar 2025 06:53:37 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0c6f47sm9303266a12.52.2025.03.26.06.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 06:53:36 -0700 (PDT)
Message-ID: <5895ecc9-68c0-4ea2-b351-c48ed7a593a9@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 14:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] phy: qcom: Add M31 based eUSB2 PHY driver
To: Wesley Cheng <quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-6-a698a2e68e06@quicinc.com>
 <69fa7f33-e957-4dac-93dc-6fd40167873c@oss.qualcomm.com>
 <1956a94e-b231-4458-a1c1-6d9f158da669@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1956a94e-b231-4458-a1c1-6d9f158da669@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q8YG58snmN82pq3CLh9II6yK6cnmrT1E
X-Proofpoint-GUID: q8YG58snmN82pq3CLh9II6yK6cnmrT1E
X-Authority-Analysis: v=2.4 cv=feOty1QF c=1 sm=1 tr=0 ts=67e406e3 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=O-TZl5gO0o4KVnlI8YMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_06,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_065340_809885_CC8C6242 
X-CRM114-Status: GOOD (  19.72  )
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

On 3/19/25 8:03 PM, Wesley Cheng wrote:
> Hi Konrad,
> 
> On 3/11/2025 4:19 AM, Konrad Dybcio wrote:
>> On 3/4/25 10:56 PM, Melody Olvera wrote:
>>> From: Wesley Cheng <quic_wcheng@quicinc.com>
>>>
>>> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
>>> sequences to bring it out of reset and into an operational state.  This
>>> differs to the M31 USB driver, in that the M31 eUSB2 driver will
>>> require a connection to an eUSB2 repeater.  This PHY driver will handle
>>> the initialization of the associated eUSB2 repeater when required.
>>>
>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +static int msm_m31_eusb2_write_readback(void __iomem *base, u32 offset,
>>> +					const u32 mask, u32 val)
>>> +{
>>> +	u32 write_val;
>>> +	u32 tmp;
>>> +
>>> +	tmp = readl_relaxed(base + offset);
>>> +	tmp &= ~mask;
>>> +	write_val = tmp | val;
>>> +
>>> +	writel_relaxed(write_val, base + offset);
>>> +
>>> +	tmp = readl_relaxed(base + offset);
>>> +	tmp &= mask;
>>> +
>>> +	if (tmp != val) {
>>> +		pr_err("write: %x to offset: %x FAILED\n", val, offset);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	return 0;
>>
>> Is there a reason we need to read back every write?
>>
>> Does this have to do with some funny write buffering?
>>
> 
> Probably because its just a form of write synchronization, since we're
> using the relaxed variants.  If desired I can switch to just using writel
> and remove the readback.

non-relaxed variants are defined something like:


writel(foo) {
	writel_relaxed(foo);
	wmb();
}

with readbacks enforcing much stronger ordering (via a data/address
dependency) than a barrier, i.e. if you write to an address and read back the
register, the write must have arrived at the destination hardware (which is
not a given otherwise, see:

2f8cf2c3f3e3 ("clk: qcom: reset: Ensure write completion on reset de/assertion")

Konrad

