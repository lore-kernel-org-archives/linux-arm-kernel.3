Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F62CA100D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faEL/orMJYn1h3sO4yVlQ1KRr8KMxwLo1N6sktjkMEQ=; b=Gz5l9rzFeQR/mK0n6PR8e8n6l1
	6E13zTnEhjzHzTMzd/dSDCLaO7k9vG3+53cuPcPPfRVlRIgTJ5v0TKmaDN2akAX6xKjcw16494+pq
	WM+sYRv1TZ/fVm8uCMn+giLUoS9gzMdh7CrHK07TWfz/5cPyuQqPc14jYq6u/1RjtGVAzAfSIRUvb
	5CvOFZ52+DUdznux14M/Jm3sPhVw1jxYu12KI2WtQG+xqYpHu1WMwrtZcdBxZyDDWZB1LTMt66Qml
	PXrnuhcgTkTB4xQXMzn7BXAEfJ3vmET79SZKKbNDwvbnSViAvqvzv8WdKsp06OmEwc/TOXDDny7gC
	JRv73XEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNY-00000001Z56-3bFL;
	Tue, 02 Sep 2025 19:09:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQbI-0000000HTnT-0xXI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:59:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Ancqt016548;
	Tue, 2 Sep 2025 12:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	faEL/orMJYn1h3sO4yVlQ1KRr8KMxwLo1N6sktjkMEQ=; b=TT5X9+esQFDZwx4X
	kl4e1TQ2CLvfjSDIQiYy1owg3KLggbRGcnkhkh6k0QXKMvbMyi6DiUdKqYGgNnpX
	9fP/S0CbyfTMfl6l7PjIJ2PKuL+LC8/EZTMMk3aepjLLxaYsDx07iJc3so3OwdO5
	CoPd22PMgZ5kOhrwpU6s6jPSJkrN7Y/FmdIas57AwgdPm3R1zJVbGKvuR70vcAl3
	39w95059iDx7usOqfm4Sgv9rz1Yzl53HupCTCesIur3jMhzvlemSnNuGMcjLPjnf
	v+jqEUinuoYoryaUdMbb4reHDocgPPEFwPMSorduHeccO7NFHOhPw3JKEttRDjZT
	vm4Seg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyyu81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 12:58:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 582CwsI5006736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Sep 2025 12:58:54 GMT
Received: from [10.253.38.125] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 2 Sep
 2025 05:58:45 -0700
Message-ID: <fbc9baa3-041d-4018-a23a-aa428fdcb45c@quicinc.com>
Date: Tue, 2 Sep 2025 20:58:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Luo Jie <quic_luoj@quicinc.com>
Subject: Re: [PATCH v4 07/10] dt-bindings: clock: qcom: Add NSS clock
 controller for IPQ5424 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Varadarajan
 Narayanan" <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        "Manikanta Mylavarapu" <quic_mmanikan@quicinc.com>,
        Devi Priya
	<quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_suruchia@quicinc.com>
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
 <20250828-qcom_ipq5424_nsscc-v4-7-cb913b205bcb@quicinc.com>
 <20250829-quick-green-pigeon-a15507@kuoka>
Content-Language: en-US
In-Reply-To: <20250829-quick-green-pigeon-a15507@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KdX-7E0jp7NDz_sEx4UwHAOWY9h8bKAl
X-Proofpoint-ORIG-GUID: KdX-7E0jp7NDz_sEx4UwHAOWY9h8bKAl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXz2LxEWqCFNFu
 kzLviiRpVBuw7Mf1zBwk7nec8cNd2SNwmtfFbhQXtSO1fNr2VPe4y+UCXD+nNX7UtOV0fTtiLFE
 wXSelzEyzQOROdhhTdz4yIfSu0zlOqiR+4+UnKkRNlbsC3eyn+6tiTOym3VLe8dC8DjRFCxdtwq
 75U+QKhk6cz53mkpkj0jvX9Hu0pUuFTDWj4NyZdfbxdJpt32r29VDDwvk1QHZdhR5jCRXT1dGCd
 yIkdDwlCbUeeUwb1/qSoegF34WBiGlp1nteznHFc2iKnSQgUfeB5xocxicSLwb04prMVpCV/41W
 qcMqCs0elBcEkZhOsD+99YBiirT2LRo3jw5Pxa4UXDsDoVnzP/AWDsE0pcA3uXduhEVhCNwHMPA
 8Uei693c
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6ea0f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=T-GtwWB8VZZ7glhfeBgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_055904_387983_11EDEEEC 
X-CRM114-Status: GOOD (  17.11  )
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



On 8/29/2025 3:38 PM, Krzysztof Kozlowski wrote:
> On Thu, Aug 28, 2025 at 06:32:20PM +0800, Luo Jie wrote:
>> NSS clock controller provides the clocks and resets to the networking
>> blocks such as PPE (Packet Process Engine) and UNIPHY (PCS) on IPQ5424
>> devices.
>>
>> Add support for the compatible string "qcom,ipq5424-nsscc" based on the
>> existing IPQ9574 NSS clock controller Device Tree binding. Additionally,
>> update the clock names for PPE and NSS for newer SoC additions like
>> IPQ5424 to use generic and reusable identifiers "nss" and "ppe" without
>> the clock rate suffix.
>>
>> Also add master/slave ids for IPQ5424 networking interfaces, which is
>> used by nss-ipq5424 driver for providing interconnect services using
>> icc-clk framework.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,ipq9574-nsscc.yaml         | 62 ++++++++++++++++++---
>>   include/dt-bindings/clock/qcom,ipq5424-nsscc.h     | 65 ++++++++++++++++++++++
>>   include/dt-bindings/interconnect/qcom,ipq5424.h    | 13 +++++
>>   include/dt-bindings/reset/qcom,ipq5424-nsscc.h     | 46 +++++++++++++++
>>   4 files changed, 178 insertions(+), 8 deletions(-)
> 
> 
> Are you going to change the binding in next version?
> 

As discussed in response to the comments in IPQ9574 bindings file, I am
not planning to change the binding itself in the next version.

> Best regards,
> Krzysztof
> 


