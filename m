Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3CAC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 06:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pm/hq5RxWKA3oBhwX5M3pYnjNEf8WRhoOjebq9Z0RwE=; b=Y++eZb3PG8bGsVPFh2N/zGf+EH
	fo3TJre1fqJ7MrABhESJPUhgT4D4cnTs1JkvqAPNNLAstba2ik0dp39Vt3uGMxei2tUgDynCoA5Zg
	swdIYQQb6ZXWU9Tf3xZK9ijuw6sUF1VpLFfw8etkRJ4Dzz/lrE/Di3yTOj9p4xInMBIzz+c1K6lRZ
	MX5uhilD3ouLt9A38ExFVgrEzpXI3hS6fpCTtidP6SRhjtND34Ptjdii0E1CZ2s8UnVFENK2wOTOY
	CjMnMSqinunKWGsj4YWAXzTY0DRnEFN3uW40lmTSd5m/0OKZgVyWj44lj0VrJQsqd+pE2V5GxrdUG
	5O4A4r5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBuC-0000000Aib1-02pZ;
	Tue, 06 May 2025 06:35:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBfL-0000000AeA9-2s7L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 06:20:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545M4uTu011184;
	Tue, 6 May 2025 06:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pm/hq5RxWKA3oBhwX5M3pYnjNEf8WRhoOjebq9Z0RwE=; b=ms5kAG6lvKTMV+ki
	v51pu7lSKLT3bXYKaLvDqyvaHm4rdsDAZxSrJjzqeDUzLoDsy1tiZ67pGkKSks5Q
	CjW3zfN2ZkuR5hmRDnWH6yexpeZztPDEQMYiVyCau1M/SQqiJ5lgn+s4NGbXGxXC
	7oIbSl5FgR8k6dL2Cl2Jjg4Z1uAjb0rderRgbYkILVUghZvCC3cd4gpXu0tn5V+P
	OoIh8UThfov83tvuMAl4xbI8YdE9L7CwXmPbXq4xgm8g8NrCxW3s7l17mOXUWXis
	ZsqYZh27WeX+YGJ7OISNL1UoOioPItBe0kjxN1EaaPcFssgep5PYkfSqV6DOPAyK
	XXILBw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tb95cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 06:20:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5466KMBZ016526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 06:20:22 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 23:20:19 -0700
Message-ID: <fe714aaf-8e0b-432e-b238-240b46be64e2@quicinc.com>
Date: Tue, 6 May 2025 14:20:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: Add Qualcomm extended CTI
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250429071841.1158315-1-quic_jinlmao@quicinc.com>
 <20250429071841.1158315-2-quic_jinlmao@quicinc.com>
 <20250502-notorious-granite-gibbon-1abf15@kuoka>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <20250502-notorious-granite-gibbon-1abf15@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JRacaERoASwWh4zXVuCOBYUfKxQt4QbP
X-Proofpoint-GUID: JRacaERoASwWh4zXVuCOBYUfKxQt4QbP
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=6819aa27 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=zLDVIwd1xLDUi3fjDS0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA1OCBTYWx0ZWRfX6lc+DLL4SLlR
 ioV7f11FpdY6/SIiiMDTFDm0pdIS8hpGaPLKwHKP4JcHThtcjPj8o8yyz992Bxbj7QrvWfIPtpR
 /oskDtQ7BStJGpUVZpR4UoGBJKEkKesiaqlUjoldzCCxCpSl7liXlLGzl2VgyeemuJjHP3pEjhQ
 qoPp2M6pzJ7/K+gmm6D5S/zIBEM4IvajwjMQ2xlBdiaIZZG443jKG+1sd6GwRhUAng281xPbIIj
 A+eWLYHw+Oc/k4ua8wAKX7BH9Pe62miFmUbjpruHlrvEF+moc6FTBWTXVC4tRXbqbdZbSecxarZ
 YldBXV15JkXSHMf47Hqvu0j5N+eQdbOAAisLucySBueKbIHYk/VpHryRqCxcl2FPXO5bA+oUg71
 yBAXO3znLWo2k2JE+q+BUrSzgmJzpadVq7YhwNapBvtzZOwP7nun3ZDftvMpG5TlsvKeXaeB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=826 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_232031_852348_C35F5B16 
X-CRM114-Status: GOOD (  13.44  )
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



On 2025/5/2 14:43, Krzysztof Kozlowski wrote:
> On Tue, Apr 29, 2025 at 12:18:40AM GMT, Mao Jinlong wrote:
>> Add Qualcomm extended CTI support in CTI binding file. Qualcomm
>> extended CTI supports up to 128 triggers.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> index 2d5545a2b49c..1aa27461f5bc 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> @@ -84,7 +84,9 @@ properties:
>>             - const: arm,coresight-cti
>>             - const: arm,primecell
>>         - items:
>> -          - const: arm,coresight-cti-v8-arch
>> +          - enum:
>> +              - arm,coresight-cti-v8-arch
>> +              - qcom,coresight-cti-extended
> 
> cpu phandle is not required? Or not even valid?

cpu phandle is not required for exteneded CTI.

> 
> Best regards,
> Krzysztof
> 


