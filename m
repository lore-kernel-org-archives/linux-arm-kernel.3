Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BB7C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 13:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58l8T/OOo3ZCMXUklFmgtyHY1VmXpl5dXrfeRDP8j7I=; b=u5X8iVut8RKggPxfDwGsgR/9pf
	Z3Wfc+VHMLckiMj6oKta3oB1I5uYQmcBA3Fnh7Q3IyN68oXhuNGz0Hlg6xlfH95kNoCGGaZfoddfg
	sV6GkexqTjw6Sp+uK2HL2g5+y+CqLBLl2rKYUuwbd8gBPP9RzznYia+REBMoy123wZHhAnW1O4ZQA
	r0HeZ7qODSXlYVNZvvAQRnO9y5//eLasG8mme1hnxgrKRewdnQp4fnUGMXtB8zWl0dEtKvZdFgZqT
	VVgg27JwZEJe5WZ20cDfWp+U5CRX0M1t0gNdj0mDzY68X/SBllBea7Tol5Xz0zWtoqNZQAcLe0grr
	+cp2eVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbHl-00000005YxV-3Qef;
	Tue, 01 Jul 2025 13:44:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZn4-000000053El-1mky
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 12:08:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619oRdd008527;
	Tue, 1 Jul 2025 12:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58l8T/OOo3ZCMXUklFmgtyHY1VmXpl5dXrfeRDP8j7I=; b=Fp906hrxou7mwLeS
	mFd4s6IwIsLo45JjzWTZM2mHs3IrhkyZvrhcfosqPMFcRYneTDE7rjj0Ccr8qJJq
	n3vfg/67iUgT5Uo1/ZeIYUm3OghrsIdOCZB9nDr/+zCt/VTYswacwbD741OWR7R+
	xNDd3adJdO+jc8Nl4VhB1WzAfbgasHeEKFGz3XzkqV6Ho5ZXBsKiyJOnFocLgtES
	bffCXegvlXBByKyym5l48OmgU2G6V9XzYjNgpCrW4To5WEQRLS5b/dnvHoG4BzBH
	fTiD+jVdHtCmoibI/nee5oHMm1LC/sJzzlF7Ft2cKd4TjlL/aXuv+Se1tL9RfCJ3
	eoryRA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmwgdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 12:08:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561C8aNx012429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 12:08:36 GMT
Received: from [10.235.9.75] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Jul
 2025 05:08:29 -0700
Message-ID: <db1d07f4-f87d-403a-9ab3-bf8e5b9465b3@quicinc.com>
Date: Tue, 1 Jul 2025 20:08:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Luo Jie <quic_luoj@quicinc.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: ipq5424: Add NSS clock
 controller node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov
	<djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran
	<richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Anusha Rao
	<quic_anusha@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
 <20250627-qcom_ipq5424_nsscc-v2-7-8d392f65102a@quicinc.com>
 <cd6f018d-5653-47d8-abd2-a13f780eb38f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cd6f018d-5653-47d8-abd2-a13f780eb38f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 53KUHXRXMg_U-w1wGFJp9ve0aqlWp6mS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3NSBTYWx0ZWRfXydNpWbOOQGf1
 Wv+siRXa/2cbh3Z8Eot4kcDX+2h6b7kX/JioCBVsghq5jUWr9KcDnW5swNqBn7tC/bCiizQf5ca
 vQAtClfnilZtupqGfVaV10qNUocag9nSM+OqIrsY+BnxqFZhMoxb2RK3ijlo4Af5WvOsNAlkNyk
 gx2Yqd++S5ol6Gk7G5vV0lt55rJJL6BBkVUQeGG6IselcbCmRlT2Y1VLZawJb78I1N+74wkBEEn
 EcbGm+PxV+fzTwHfyL54oq3owHMNU09Pnr7uYJTKm+NzA5nVSkpT/d+9Qkycd1j2GKkKIPgxVUB
 goqX4dVBlCVkYg4viZedXrBnozlZazfIbDBtrvtaUWbhlRU1R8tDm53kms2igQ8m2pz+vdUjLlx
 RlTAuD61CHme3I6B9dxnjgYmhOuW6Mmc2VEn12Z3kZ4quTdjED7pqLDovWrEL1M0uHNBwLl9
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6863cfc6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=8K8LTxnoByzQzqUqCa4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 53KUHXRXMg_U-w1wGFJp9ve0aqlWp6mS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_050846_621765_A81DE834 
X-CRM114-Status: GOOD (  14.76  )
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



On 6/28/2025 12:27 AM, Konrad Dybcio wrote:
> On 6/27/25 2:09 PM, Luo Jie wrote:
>> NSS clock controller provides the clocks and resets to the networking
>> hardware blocks on the IPQ5424, such as PPE (Packet Process Engine) and
>> UNIPHY (PCS) blocks.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5424.dtsi | 30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> index 2eea8a078595..eb4aa778269c 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> @@ -730,6 +730,36 @@ frame@f42d000 {
>>   			};
>>   		};
>>   
>> +		clock-controller@39b00000 {
>> +			compatible = "qcom,ipq5424-nsscc";
>> +			reg = <0 0x39b00000 0 0x800>;
> 
> size = 0x100_000
> 
> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

I initially thought that a block size of 0x800 would be sufficient, as
it covers the maximum address range needed for the clock configurations.
However, the NSS clock controller block actually occupies an address
range of 0x80000. I will update this to 0x80000 in the next version.
Thank you for your feedback.


