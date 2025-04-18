Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED967C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 09:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rA3sdyVQ16H8kPttRg91Jt1G7uDSj/gcw6eTTAKQB5c=; b=0xr7MFVkddZG/8cRoju9AlJIPS
	RDLdIv194CEgZmb/XjonDEIwhdiKo7xp6N1g0p1RSwm86Fk5bBHcZRXZgKsVDppBr1hSdUB54sRUn
	04zUk2bmyKhpCoxwpFh8c8BIdu5hZ4PqtR805DxeisG+OIIj1VAS0TNtkdMRHwIEqinBqqNPVltjd
	GOFaQVo5Qqv3mcLijTI/MUFS8TK+6kJ8uO4lixfVp8gaEHSb94srG9wR/Pw3uYvnoD9cJfjkxKq1G
	pQmDbf6vVx1pV4U2VpcE6DhjgRCUkS/b5EViSA8Z9zMs08C6MmL9dD8d3FW+SnenVrcJVtllvYEhR
	G49Zf2vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iPR-0000000FnoP-26j8;
	Fri, 18 Apr 2025 09:53:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iNZ-0000000FnVq-1Skt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 09:51:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I1xHYB013336
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 09:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rA3sdyVQ16H8kPttRg91Jt1G7uDSj/gcw6eTTAKQB5c=; b=HwwhoVLEu9m/84c/
	izpixz+E1FYpZpSYEhwGskeFb8/7o9N2GWSo62T5C4Diwsr/dxEMUQzCUklx4rg3
	jnksSTFHQQo+UPXubMSkt914vvoRX317E3k/+WTh1V469h5y3QBBQnAkdMi6GALQ
	avc036Vf/bnYej3fUw8Wjkc2piUyI75EhILfq4XKjRJ1kvnJX4b2X3TSDsxj35Rh
	Du8dvHU4r+6wdK37romVDqsSMpbgUDAXLo9jGTg8owSAaAR4vjF/uLGi5N/EcC6d
	1wL6M8Vqyp6wKUJCN67m88CLdrSCHb+PDt7d163csMLgtI0ccEQy1OaV/d6cN6Bc
	vIiapw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvextw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 09:51:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54be4b03aso31753685a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 02:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969882; x=1745574682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rA3sdyVQ16H8kPttRg91Jt1G7uDSj/gcw6eTTAKQB5c=;
        b=Igam/ap8f5C/SUEdzicuVMqucp+tpijzWi1vBNmMluL6XbrNe1NIvxMxAQ16u2STyO
         vqvFOGNkZ4pLleLNUmXmrFqGn+9YJVgGUkgG8ReoJaRwFH9HctlACp6nVqxhUzU1I8ju
         tYkUYhNrFfm94F6nSV+iXwkVWo/EAgZLLVwdKUh2sO490UE8k1y7BKDsvKyv1gXJ5wHn
         X2clgCFVoMZQPIQBTDDShPN4w54I5fQbrGQcQbVIVRb/1SRSPgKSKpPk0AESUy46iBLz
         kiHaJ3rn/1DhbnW2n9X6SEdS9/yd7/LIOqS2bUkBcHZgSIVa+iyCPFeOOBr54ej0yjez
         ZWbA==
X-Gm-Message-State: AOJu0YwvnS+kzAiHzHF7pC/5ImmLGaQQVBfLYP8Wk0+r9S8mFeIABh1U
	CYdlAns7ifZH45I2q3I5s3t0v4dro0LzN8yeue3l5ZjgfrhFTbdWdE6clPnTaFNWzgwUHydMYvc
	ektsQGIIPwcpLLY4kKoGtoVYC7o93qViSlqv6yjB4lwvHkLrpZ0bmTmRe9jxBogi6I39ihr8Z9w
	==
X-Gm-Gg: ASbGncv1LuacRJd+i31r0rsh8nrB5mwL2J5XUmzhpq+NKazH5aKDF0K+nQEjQxBnLPF
	lIi3ufk6IxXFJ3aTrOVc/b/tVm5igmtiVeExk3ZM2RP45ljg30bmz9ohfCFgSTq72Vm0xpAk0QT
	hfZLZ3kRtE+IAU8r5nJlHpomex61dujn5c4RPqXPQVKLWlmQlsx1m4Cytqkzf3zrWDezfspZgZX
	JkD6WQgLp1nAPWYQ2y2vOScdpmIcT/8ALSv6eZe4Nir/z5h+CO9PeQV9jUnIsT7CS6SyBSe8HMZ
	jF8kf28lMl6b8dmavf7vspKRqywGZDUZq2HqRerPMb4EuZQ7QNpar8k9Vey/VQ7+hA==
X-Received: by 2002:a05:620a:2592:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7c927f9a9f9mr101648985a.4.1744969882148;
        Fri, 18 Apr 2025 02:51:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqDwroTCof2h7lnX1zVhtLN5ZBbsfi9HNceZCvlYWCbV0282LNM0+SsV1JAE41A/dMk5vamA==
X-Received: by 2002:a05:620a:2592:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7c927f9a9f9mr101647585a.4.1744969881711;
        Fri, 18 Apr 2025 02:51:21 -0700 (PDT)
Received: from [192.168.65.58] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0c64csm102377266b.13.2025.04.18.02.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 02:51:21 -0700 (PDT)
Message-ID: <5e6a3c7e-4e58-4e42-ac31-3666f49d07f6@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 11:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
 <65663927-cc11-4810-8714-7600786f299b@oss.qualcomm.com>
 <7fd92093-3efc-4f24-967d-7e267162b26d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7fd92093-3efc-4f24-967d-7e267162b26d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xMePTa0D6oFHUgbyuVV2J3ZREx6GfKvb
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=6802209b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=-5tugLDAGQjhnTpWTo4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xMePTa0D6oFHUgbyuVV2J3ZREx6GfKvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_025125_412979_7C1E0E8F 
X-CRM114-Status: GOOD (  17.41  )
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

On 4/18/25 9:28 AM, Vikram Sharma wrote:
> 
> On 4/14/2025 7:18 PM, Konrad Dybcio wrote:
>> On 2/10/25 4:56 PM, Vikram Sharma wrote:
>>> Add changes to support the camera subsystem on the SA8775P.
>>>
>>> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
>>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>> ---
>> [...]
>>
>>> +            interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
>> 760> +                     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
> 
> Hi Konrad,
> 
> We cross checked internal documents to confirm IRQ number for csid_lite2/3 and vfe_lite2/3
> Calculation for IRQ number is done with respect to vector number as
> irq_num = (vector - 32).
> csid_lite2 vector -> 791
> csid_lite3 vector -> 790
> vfe_lite2  vector -> 793
> vfe_lite3  vector -> 792
> 
> thus irqs are as
> csid_lite2 -> 759
> csid_lite3 -> 758
> vfe_lite2  -> 761
> vfe_lite3  -> 760
> 
> Please let me know if this looks fine to you?

We had a similar issue with qcs8300 - the reported vector id skipped a
number at some point. In that case the SPI ports indices alongside
them were advised to be used. Please check with the HW team, but I
suppose this would be the case for this one too.

Konrad

