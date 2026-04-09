Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CD9E98FA8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 05:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+WQCybGlL4QigHsZgqmfBWWmN0VKUE8WJCHz2x1DQo=; b=T9riMEy6g35aLQRudjiHxjElmy
	yVu3IKi85pj74yYNms/VY9t+tspDpREixunKNAkr7UtgJmhWDHEw+AcECw+9e9MiCDbNDTVnPBnXw
	uzqQLJuFrmTHXsrIL1cmQUDPG9wWxi0NhhktWSEsbQBj1IG+HJVsnjPxrY7Dvt0moW3Iy3FSaISfW
	AAuqP209mevno5gtlJPE9gP/ZPB/L8S0KpKGT96R8LwU0TXDOJBom2TOmGuxRqxyjyYCh8bRNFmdJ
	ptL9DzVX3IIsp3VL3g/D4ooLfy5AujISWOvM5lqM2ZWR+S7GjsEef7zpip5A7YGJbjs8Ct3aglh6m
	ssvX+N5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAiBt-00000009jIN-2ClK;
	Thu, 09 Apr 2026 05:44:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAiBq-00000009jI2-2vfz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 05:44:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395OLb23712758;
	Thu, 9 Apr 2026 05:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R+WQCybGlL4QigHsZgqmfBWWmN0VKUE8WJCHz2x1DQo=; b=hGfnU83J+MuZuU3H
	dEEagdkvig/GpdZj9kFrgH3EQdYYR3jxV75U2vBzREyLZb8W8EPZkoc0uirX2aQ/
	yJxn3FWHXpn2OcGObFBv/2QCec8u6vAZf+DRoYNkFk8zO7E2JD8LXKaJ8OYuM88o
	kuRCvOPDobd8oHUdETBPsEWyIx+CN0ns1OYAUzqhfnTY9jxM8Cwyrnk3QN3WYQ42
	wnGZRcbcM91zstd1h0ezMwUWqojnZ9pYncwYoZfKbprdNoOXk0YY2Ie0jKJf9PAA
	z2FvTwTG6PJXb9W+1mWdjV5q34Rcn/4CjaLZyEl/jWPSJJAvSGU5TiFpXV2Ojaqz
	zTA1fg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74agma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 05:44:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 6395iPQp005642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Apr 2026 05:44:25 GMT
Received: from [10.204.78.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 8 Apr
 2026 22:44:21 -0700
Message-ID: <75d22f54-eb55-4e55-9582-5b407f41ee81@quicinc.com>
Date: Thu, 9 Apr 2026 11:14:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
To: Bjorn Andersson <andersson@kernel.org>
CC: <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
 <acHwvzjcvqNxUjm3@baldur> <ccb11c2a-4cf1-4486-be71-d4bcc983cee6@quicinc.com>
 <acVWseivbxLQ_uDM@baldur>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <acVWseivbxLQ_uDM@baldur>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d73cb9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=aBhg6lAgCmotgtkINXQA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7WIROd-NrMSWNwZCJBRQx7cIGvSuiUE0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA0OSBTYWx0ZWRfX5vM6VqO5rN+i
 v6LUPkUK/b15O2dhDuBGalFDRemVvnr2yDQydvGJwAAAOwA+slMCzMAknVM0D+cBZCMrz4p2trI
 kBWEI/uDIWzeQNYVy/zZv3O+0pjA3+LfuhOaXX84cTaTgo+hiHkXTKOHzFGGCd4NNE4+tiRXvMH
 LROfd9T0yVqP4OFQgq0ODlRkegPEREdwykIP9ZppJ06WfiCOcuF2KuVFzHcbOAYuQ5ecNP+EVxz
 +2EJYYMH9Nw6o/2w5PfGhbsTPVbC62fkhuZ3e/OPChVXkoiCXV+PW4YBKWpzG+WrLEB2zH27kUL
 H8fmsIbzJ6hKerriKr4Uv0/AWQ8CUNuD5INbvkbwUKHknqgEu3D9fROE9y0MlFx0S3B7h7IOfEh
 G6tv10cGaFkC6NBDexJLbldDH+9yvb9+HiIFeY8UxvCBQFcpd47o4OsgFgYabFfFPP9Tlb3qlQZ
 JzHGj7hwCHVBrRE73eg==
X-Proofpoint-GUID: 7WIROd-NrMSWNwZCJBRQx7cIGvSuiUE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_224430_781006_950A2A5A 
X-CRM114-Status: GOOD (  21.84  )
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

On 3/26/2026 9:28 PM, Bjorn Andersson wrote:
> On Thu, Mar 26, 2026 at 03:06:52PM +0530, Ayushi Makhija wrote:
>> On 3/24/2026 7:34 AM, Bjorn Andersson wrote:
>>> On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
>>>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
>>>> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
>>>>
>>>
>>> Please add Fixes: tag.
>>>
>>
>> Hi Bjorn,
>>
>> Sure, will add in new patchset.
>>
>>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>>
>>> Please start using your oss.qualcomm.com address.
>>>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>>>> index 3837f6785320..6ba4e69bf377 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>>>> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
>>>>  
>>>>  		vreg_l12b_1p8: ldo12 {
>>>>  			regulator-name = "vreg_l12b_1p8";
>>>> -			regulator-min-microvolt = <1200000>;
>>>> +			regulator-min-microvolt = <1650000>;
>>>
>>> Are you sure it's not supposed to be 1.8V, given the name of the rail?
>>>
>>> Regards,
>>> Bjorn
>>
>> There was already discussion regarding the minimum voltage for this regulator on sm8550 target
>> on other upstream patch. 
>>
>> Link: https://lore.kernel.org/all/aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com/
>>
>> This values is according to the NT37801 panel sec
>> "The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
>> VDDI=1.65V~1.95V."
>>
> 
> Yes, so the panel requires 1.65V, so regulator-min-microvolt needs to be
> at least that. But regulator-min-microvolt should account for all the
> consumers of the rail, are there any others?
> 
> Which leads me to my question, the people designing the board named the
> rail VREG_L12B_1P8 in the schematics, why didn't they name it
> VREG_L12B_1P65?
> 
> Please check all the consumers and make the regulator-min-microvolt work
> for all of them - if that's 1.65V, then your change is good.
> 
> Regards,
> Bjorn

Hi Bjorn,

There is only one consumer of VREG_L12B_1P8 rail, i.e. NT37801 panel.
So regulator-min-microvolt as 1.65V should be fine for VREG_L12B_1P8 rail.

Thanks,
Ayushi


