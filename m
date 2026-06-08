Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C4CCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phyB/f/MmGVDBTTZHnGaVeW2BAL985CqIC01PeAdgi8=; b=B+wHXd8AkALRot1gOdhqLshhMJ
	hG6zkyhUChpacMs/uWEcmYs0pWveAPCgECpdq7FIh4ZJVQefpF4HfxVUfMwK1hnkJUDbzxOcEZVVe
	PFvG6az77tnhU985JzUe68ZWJeoSiE4mPjgCYh0AnR6ELy7ic4wYQ0ghMB6LEEBuC2lQeqXzBPA6G
	pjPsGzinjMFHN7YN3ztR0tYtMk9FLPBfIIgyoyD57ER3F3XtgByYivrGsUpnbOB7gcPfUQEFIibqg
	OW3Mwipxsp8bwT+6VZfH1piQs7FOmVNhUWdsZFc9lgk2RM4aUlEKvUVVr0ObvcIxSE/xc9Lt2z0AW
	VSM6ISHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb6O-00000003mCM-2jnG;
	Mon, 08 Jun 2026 14:37:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb6J-00000003m86-3m2u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:37:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EY0Cj3835753
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 14:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phyB/f/MmGVDBTTZHnGaVeW2BAL985CqIC01PeAdgi8=; b=kvp+drH3ktQlQkD5
	z97b6zFqqntjW16AtiJ6RlbqmRsNm2oc9usjfGX/TYZaEdbQ+Gw/k7ooh2n4YgOK
	TfUcrcjE/IRF0xVJrv8Sj3BtU7m2PZjQU88LLht8airbemCq9Dmgg0PF6uojBTg7
	JNfIGUSndCF6U+cRcHUJj2SPKkmG08vT6TGTNixBz9KDn3VyjPCDo/DehY12l+E8
	Q+on8JjHKEXqp3jgsezBzXIicBCmSYWlU0YxBM0EgfTehFcapN0lX6PujEI31n2Z
	jtH+Q4+YMZtfQDbxt+ApCFsvzjy5xzFh3EBtbiaCdgF3oUUUuc730yquXHZrJssw
	h5gODg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rrhgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:37:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842308adb3bso6123842b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780929434; x=1781534234; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phyB/f/MmGVDBTTZHnGaVeW2BAL985CqIC01PeAdgi8=;
        b=M4JZ6xjGYnO81TBVyGpJicBAz85jbptRri+DFwVABKO8ve8oSHynJdCDHlQC9lIuSj
         9ZwDfIeqJmOLTsnVTJnVLnmCfqzXYoMOBjIvQxOY2oj2zH0ElRdXaIRM471J8iqn97js
         IARvJGV+gW0qvJMyprOKmuL9Y08RnA7Z7ux272ExnCk5OJ0z7+kpsYRCp2eEs7iZ1aId
         EXvwxvyzQd1sPXZcF3yFlBGH3DBkQGfAFoiiNHdBD732cS7Wy5etETqGyKO3mQFbXuiU
         q1tYvLNfJ3lAtRIK8vs/OoKKwxM+XV9Zri5Znpgc9tgYXovfwKmuR0u2UmIZ1mrt2K3C
         D5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929434; x=1781534234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phyB/f/MmGVDBTTZHnGaVeW2BAL985CqIC01PeAdgi8=;
        b=J8aTNnlMIAYrxiS7vaMT6PSPgKgEHylyPjjoHYDFC1afb+LMobSTKHyCuH4fSX14tH
         FdH0gTpGrYRrx7pJFRqNP1jAnE0XH7YWFBatbh5stqa3NVZODFu9eSSSmw0RuW4q6/1N
         Q87RniJTB3DgMnpqMpWrCvGF14Z3qGBFHCW+Cw7wx4rTNcJ+q3tsnkZHogZfNgPwctAT
         U2ZB125GWaJg9IH5sJnJY+SPy7eE9Jc7m9NAm3uctOZneuwemhr8YbZMxP1QrHBtFFyD
         6emihxfYs+7cQ66aaJ9L0ez8NGi0HreRZvHgX4L6YOwplC7CnncBNLeTADSdnQp82NeE
         FjCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lHy+RAQ02rFXd8yoSTi/avU3VI6lhm6mW2G2FTdCr6qzStBULlftOWjY1xsjlDqoyown7WSyKaWBiavFY6dam@lists.infradead.org
X-Gm-Message-State: AOJu0YwapscCT+QpkzJfnSfxJSYLN5n/6CaQYwwzAK7gtntExjxs35nP
	QwWFIS0BOsWW9S1N0BoT504kNWK0oo1pleqeHvWGFLEESD5QFh0TOydqKnhWt0+mi+b/F/8IyTN
	LFxMlTps2ceW8nVxqFohN8tL4mligg2iRtgupzLu/PEleG19SXXvhF3tuGeEREzit0D6MsfeByw
	yGAg==
X-Gm-Gg: Acq92OEKULYuHozC0zt5mOApKSlXZrFYf2mllu5y+07XVIngHDfKfk4PbVLXZDlavRP
	NCJwZrVdZ12Md09J/Q38p75r9FvF2HO9r0ljnmr9Ib6gzw8UaPS4aDkXHZQLipaLRJFxjYms9Jd
	tFfVuzUaQrWZ2GfGhh7q1dHHYxMnBcBiuzDFPH0BIA0zjczjpzf41bJSD1mysKbF+DoKHyTz8s1
	vGTcLlmKFutzeYxFOToEkY38EKiTyJ8D3b7E7bs+3BL3nXbGgpcoj2ER2Pz6kYDta7ldOfLj/1l
	p1AmFaku8IE8KMOxnjgnWJaCvy/Zbc87YX5qgVCDnHXg8kFdCdzIqWTJV0Prf/VPbjRlhXt/UmE
	LHBjGZ83RjlTY3LfI1BuLKxC8/RMGl3cmglaazWsumbKMIMH3vqioQ+M4jysI
X-Received: by 2002:a05:6a00:4c0a:b0:842:708f:39a6 with SMTP id d2e1a72fcca58-842b0e1e208mr15671461b3a.10.1780929433677;
        Mon, 08 Jun 2026 07:37:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0a:b0:842:708f:39a6 with SMTP id d2e1a72fcca58-842b0e1e208mr15671413b3a.10.1780929433126;
        Mon, 08 Jun 2026 07:37:13 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221470sm19692216b3a.6.2026.06.08.07.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:37:12 -0700 (PDT)
Message-ID: <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 20:07:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
 <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9p6b0CscfYkNbed1wgoYbKCJnCwL6t58
X-Proofpoint-ORIG-GUID: 9p6b0CscfYkNbed1wgoYbKCJnCwL6t58
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a26d39a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5xEeDdGLKqE-Cjx_tAgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzOCBTYWx0ZWRfX1/uxjU+5X3XX
 qQPSQnLq76FLb5XtqM/ObV20Tk/jqxQZs0+P/X00346uxMo14uzQqiBu6i247HpPkAQfmMBRoHv
 d5WavsKuS1w24OVIt4K9JdM6MOQdgZGWcL7VLENEAFArIptL4foawIFB+aRZakq7WlecswnAjGm
 Qk10RJFhgDvtjM/yOnLpRCtj9/eUrXH1gOG6yC4wjmI5teroqpywu6QXdlCkoB2Qypdt+VRRvZ5
 5CofixVBafEIW9e4Hmv+uvWHSM/8yXTW/FPGJTgL1aNLFi0euef9VnvH+7jhVBR3Cl8CFm4fI7L
 Bzq8Rz55N62QJFBTcCoU8MrwlRI1nh67WuhPUAQgWTW0MaN9mDaE6g84mqwzdH2S5/QTYUVuQXY
 fbz97CTYpZoEuQ5nRSGKiEW9MR/N26929JVIBSUeqvk6V8tJe8oU3TNCpHyi45oV+ro2AjQPSN5
 X1lxtbxYjRYymd8BE4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_073716_260388_6592DCB1 
X-CRM114-Status: GOOD (  21.27  )
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



On 6/8/2026 7:27 PM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>> are accessible. Without this vote, the SMMU may become unreachable,
>> leading to intermittent probe failures and runtime issues.
>>
>> Add the required interconnect to ensure reliable register access.
> 
> Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
> be voting on other interconnects too? I guess so, because currently I
> see that TBUs vote for various interconnects. BTW: should apps_smmu also
> vote on the power domains?
> 

This race mainly occurs in GPU SMMU, where the GDSC can have an
independent vote on the Adreno SMMU. However, the GEM_NOC vote may
already have been removed by the GPU (or any consumer of adreno_smmu,
e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
errors.

Mostly this race reported in suspend/resume cycle (when gpu/gmu devices 
moves to slumber/suspend state before adreno_smmu powers down
and the later doesn't have explicit interconnect voting).

In the case of APPS SMMU, such a race is not expected for any known
use case. APPS SMMU is part of a shared infrastructure block, and its
power is typically kept enabled as long as attached master devices are
active. Therefore, explicit power-domain voting from APPS SMMU may not
be required.

Thanks,
Bibek


>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>>   
>>   			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>   			dma-coherent;
>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>   		};
>>   
>>   		gfx_0_tbu: tbu@3dd9000 {
>>
>> -- 
>> 2.34.1
>>
> 


