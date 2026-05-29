Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C996CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKcwd9MWaUtPKni3P9v2KO6dNdslVHLHPQmpmH4aFvw=; b=CRrKfGAPCKRuPUkyB5VZlIlEwz
	e+TiIZ1eX/sZP5lq+iO1ZRw0IbuDs4ZmrJXQkaJ34f88vrzASKP7vtDoMLujoOZgoRKEk8kC7z2vA
	Kjb6U9cKWQM/7gpH/s4s86/E9CHmBd4FBWDhOsDjRoK3ugn6xXDIpQijDl7iACIHZkuay0Nozq4fZ
	nmqb+5CS3Q621ZtABmXl+fMYTEtAIQmTBl5hLUwIjlDDH4q2bOsnehwUYAWx7eERc8PiTSdHbM29j
	U5n9/9PvWqhsFlI8vjgUoe3Zf9rQBE4H4r+qyTbFfH5dQg7mHR8ssW+qFtplOtLCet9d5jR0zJKUM
	mIhyzTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuQf-00000007BO1-3pJJ;
	Fri, 29 May 2026 10:27:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuQc-00000007BN2-2khW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:27:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6LMaN562448
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 10:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKcwd9MWaUtPKni3P9v2KO6dNdslVHLHPQmpmH4aFvw=; b=RnjH83pmAiHippPc
	S8Rpcc0JtoOlC00V7WG6iwGfN7zy8LACGNPmwF2lj4ssIkCSQKTe2lp3ydgghZSh
	2vsEzkgpI/6d2JE6zfXYawhB4GdsE94tpo7cEAsIzd6Tf2acI5kOq4wrvBuxR5q8
	qt2f/tu20x7cOvyoK9ewN4wRskuWQCnWCTIe6xFr5RDLOyHejlf5mraiVL4RbuOZ
	lfHt6yeT68OKQOrphefe0GhutNGdUwhbBeRXpIuep7mB637G5zN8bKrtTl8ZbJFq
	Nfh3BqAD1JpjIWdISZLQ8PVQtJ8S/96C8neK05tGTeyJ0zcklezAMcWXOYiJmUcS
	Ay1XlA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug33vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 10:26:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368ac44b26dso12460437a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780050416; x=1780655216; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKcwd9MWaUtPKni3P9v2KO6dNdslVHLHPQmpmH4aFvw=;
        b=HyRn6b4u6Bi2j2+FTSE+a71+wJ2Hh0i4i0sJQ0h5pDER04LUXapDHoZ4BVn1l5pXic
         PryFbWWbFZjm9tTL5KZgOcp5GZFpG3ZbCX5WIHoRU9S4OWp5g0kCJ+9ZgG3F0Xi7co5r
         LIGk9wdvOKmZDIoE46nrkKQ01vhne8pnr8bqwVcZ+TcvXHSX0NcSCBHsKV4STKrHrnjV
         ojShfdbeSogoVN1+fLE992gZo5R1bbKMESJxIoolDawS5bhVy4u/IuvXzxa/87Gn/YnL
         14kTyhVa72GPNcr2+7MTrHnaBUpuv45Zh1xWZx6dO6KnJWQiavhJAvlYjKvq3O4uk6gt
         AjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050416; x=1780655216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKcwd9MWaUtPKni3P9v2KO6dNdslVHLHPQmpmH4aFvw=;
        b=ZVMOntwYmDOsqUO9xN3TB4ouW5JJPa5ZYyPoArQwb6Hq4nLrdr2IkuM3VaXzSxBefu
         nNX/zkPR0K8xAnjiAGZT1fhg1DpqRPUsWin2/D/uLCBBHEhx8lKI2rQUUISVra0jPoJn
         9sD5zGN5+mQ6+7sLdWJllwCp52xitORCCefCKXJ8TPE2mUIFb07W4cSGC8JOAOkOoZqK
         vc+RbuFQdZZ+on2U2m+CTmINgF142YxypP6MBMhrxgObzhPt8WPbPXbAfR5BNg0VEMW+
         rQdvTRpRlybV2HKrh9TGtlbelqmQh6QbQIYPqXoiCOJkYUAmwwJDDnGMUyZmzyxd1Jup
         NN1g==
X-Forwarded-Encrypted: i=1; AFNElJ9TmLbyRtnHMkKi8KyB1Zg4X0nr9WVanfkNllT7LTYSqUDPH66DOi93i0SM4SN9WeN2kr6cxbKycVs9uAg5Uc7J@lists.infradead.org
X-Gm-Message-State: AOJu0YysNVI4OYxKDI/OiREWzn38+T9GpS37GooUCdMX5U671B/rIRjN
	uVBYEeLDZdNSYx0hc3qM9M/80K+PugiuJMrRPkDN/IEDjnFyL7s14ib0Okp3XXLRlkNvqO22/GO
	Ua585jaNcNH6ICqz/QJQFcc0jNiS6cWoS2HlhpLLJL7+TnKXSV7IYwrYfV+A24jPhjbPmtV2wIO
	ebZg==
X-Gm-Gg: Acq92OFxbgxTADFKnMBpBMwp/pI95zPU+oXDuKdWLualJZZ54M16fZvA1Blruy4Z9hK
	8ux6BzBmxHkb5fwzB1M3fAIjhj5xMfPGGI4LatqpSyuqcExRjc/PJZdAxPuevqcIqN9oqNwWUBU
	IvYkSEOZ5ecX8+/M2Yn51aDXWRp+lMbFNb07SuhbSulvWDwsekuJDXj57qsdxdjEd3jKtTsUrVH
	mm4Z+arY+pN973AaJMa5xEDQoujVpZQiikXdYSVzEl1TKJdqDL4FS84BEQ/vaUeQVoafBrK7zwv
	/30jYibm441XVV/K0DzU8Jc6Hxyz7XVVN12Bplq0zGOyUBHOB2Q1auKwYpDlVQaskvTYVl7zZr/
	FJh/rSm1lFLvSnWOdfZhjTbmfOMzqfeUWflSetdKNcEKVAIXkCxsR0oPTJ7JRdgvvAKQQuibPdA
	IrJrx+AEU8DRJ9VT9Qn3c3CA==
X-Received: by 2002:a17:90b:4ccf:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-36bbcad635amr2645383a91.4.1780050416336;
        Fri, 29 May 2026 03:26:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccf:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-36bbcad635amr2645363a91.4.1780050415867;
        Fri, 29 May 2026 03:26:55 -0700 (PDT)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc02b8b57sm1804194a91.7.2026.05.29.03.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:26:55 -0700 (PDT)
Message-ID: <f2f23d0a-dc24-4a06-948d-56df913994ba@oss.qualcomm.com>
Date: Fri, 29 May 2026 18:26:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwMyBTYWx0ZWRfXxo8m3MY/TcAg
 p/dHtgjDsEw9TgN4rWrsOsXhGoaqDEI66jJGWd+KvaCikAc4k+ApKpYCVcOOa6N4xBIdttHXX6h
 fXAvpDxIPoYrul7CWUzF7s8NF9r1lzsyN+AFwjPibjYkQo+GM6OWGEShOGui0S9jM/+iNbMAa97
 8xVb5HGS4MSzsK8sE6jTb1IKVfa3tZP6vmARSZm8hEytGuaP/qoKCuj4DCLJeUa4462ZedYUM5k
 3bR9khw0NWPCfzo8mQgx5nMhMuTuKyvcJ8gsZdSYhyyTaxlVeUM//TKV5s8g/HjWY1sY63k2oXQ
 /ScL/TlJnlISsvPbbGm0Y5bJo20d2lG/N44llds3UOZM87QrUIoTBE9l+l5IlBrRWvBJ7g91XHL
 H7FQ57MK1RwwL3sW8m+mgcEt7U7LTk64jSEqRkcRx3Ts2CrPBYKWKYZK4Z1xnhzzqK8tnCysiqx
 NOWNVODmJDWdWUyJvbg==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a1969f1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=nTQ8HVyESOUA6E9D-IoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 4lHDztYMA6EZciRO5vZuvkhuMi7Q5mir
X-Proofpoint-GUID: 4lHDztYMA6EZciRO5vZuvkhuMi7Q5mir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_032658_715159_A3BB9F76 
X-CRM114-Status: GOOD (  22.13  )
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



On 2/27/2026 6:10 PM, Suzuki K Poulose wrote:
> Hello,
> 
> 
> On 04/02/2026 02:22, Jie Gan wrote:
>> The DT‑binding patch adds platform‑specific compatibles for the
>> CTCU device, and the following Qualcomm platforms are included:
>> Kaanapali
>> Pakala(sm8750)
>> Hamoa(x1e80100)
>> Glymur
> 
> Given this is predominantly DTS changes, and there is very low chances
> of a conflict with the binding yaml change, I would recommend this to go
> via soc or the qcom platform tree.
> 
> For the series:
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Hi Suzuki,

May I ask is there a chance this patch series could go through the 
CoreSight tree?

Thanks a lot.
Jie

> 
> 
>>
>> Since the base Coresight DT patches for the Kaanapali and Glymur
>> platforms have not yet been applied, I created DT patches only
>> for the Pakala and Hamoa platforms. I will submit the Kaanapali
>> and Glymur patches once their corresponding base Coresight DT patches
>> are merged.
>>
>> The Hamoa‑related patches were posted in a separate email, and I
>> have included them in the current patch series.
>>
>> Link to the previous Hamoa patch series:
>> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa- 
>> v2-0-cdb3a18753aa@oss.qualcomm.com/
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - change back to the numeric compatible from hamoa to x1e80100.
>> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v2-0-aacc7bd7eccb@oss.qualcomm.com
>>
>> Changes in v2:
>> - change back to the numeric compatible from pakala to sm8750.
>> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v1-0-a5371a2ec2b8@oss.qualcomm.com
>>
>> ---
>> Jie Gan (3):
>>        dt-binding: document QCOM platforms for CTCU device
>>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 +++++++++++ 
>> +++++++-
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++ 
>> ++++++++++
>>   3 files changed, 340 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
>> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
>>
>> Best regards,
> 


