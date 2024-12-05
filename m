Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48381E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acODbYzobAE0Dphz+eIe7GNwKUbyyVbd5QQ9b93IuCo=; b=3aEwnxkAJr4OYFSveE8vx8zXid
	KMJMTAhpmhyiuFLO5Zsuk6CbcbIIFFkIL4+3Ox1Um0dgrr/K9QTT9oA+TTD5pDqXC4jlvi69Cwb4v
	1mcR4AdWyIHBhQzdoDHYnrqI1xAi30UvCQVTFa8m75tnQ71t6PSXhfNwl0IrTxFUNXwCzxDZeMGLc
	EUBZ213CbFJTicRWisVMhJlD3GnJvtY7z67OnNwgcPpcj1enty77AY6GRJLkj2et08+e5T46QA6UY
	/H+q3/xD5CC1szscRluGpoCsJbu6jlxxJo9e+MTDIetc3TKm7aY6OSnk8pjRX69sogtfWltiQkRgA
	c/c8OcLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGUr-0000000H6PL-2KF0;
	Thu, 05 Dec 2024 18:22:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGTp-0000000H6Fu-3CuH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:21:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaVIu004765;
	Thu, 5 Dec 2024 18:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	acODbYzobAE0Dphz+eIe7GNwKUbyyVbd5QQ9b93IuCo=; b=TFTT9GLYoYB8Q8zu
	SwsYwzmufsh74OYvxdkJb3YTTlm0ZcP0E5iy9gsMvlgXu34BtwI7ZF7gUSsdfjhW
	hpv+4cSfZH1DizSRxr4QX78TWBvAwQnZgw4bhtAhN1rjypqVWqbdkFmiHkffauks
	ef9TMz62pdeFMBQj0CPPGgOg6Gcd6B6Nr2DVgVVMiRMvis2OPbqjDh9rzxzGwVw7
	3r6rwXP/4CRdI3WihSjvodZF/2pSZJ5pIDABx+54mGgHEAxdJxDEcpXq+cl9WK/7
	ro5azyjEKoiiu6yVN9EnWwsPB9+hl1MYxUv4F0+yDgVxA+UbIKLWb1JHFkabalbD
	rBr6ng==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3faye8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 18:21:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5ILV2P015058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 18:21:31 GMT
Received: from [10.71.111.113] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 10:21:31 -0800
Message-ID: <79e55e6e-e560-4f43-8d6e-bbaf7fcf157a@quicinc.com>
Date: Thu, 5 Dec 2024 10:21:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: Add board dts files for SM8750
 MTP and QRD
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
 <20241204-sm8750_master_dt-v3-6-4d5a8269950b@quicinc.com>
 <b9225284-7830-4aa4-aed2-7f58fb7320e8@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <b9225284-7830-4aa4-aed2-7f58fb7320e8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ra41wQQj1CLGgFRpQ-gtTLDBKbtBTp6f
X-Proofpoint-GUID: Ra41wQQj1CLGgFRpQ-gtTLDBKbtBTp6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=732
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_102137_825514_1828CAD9 
X-CRM114-Status: GOOD (  11.69  )
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



On 12/5/2024 8:45 AM, Konrad Dybcio wrote:
> On 5.12.2024 12:18 AM, Melody Olvera wrote:
>> Add MTP and QRD dts files for SM8750 describing board clocks, regulators,
>> gpio keys, etc.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
> [...]
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
>> +&tlmm {
>> +	/* reserved for secure world */
>> +	gpio-reserved-ranges = <36 4>, <74 1>;
>> +};
> Any chance you could describe what those specifically are?
>

I'm not too certain, and even if I was, I'm not certain I'd be at 
liberty to say.

Thanks,
Melody

