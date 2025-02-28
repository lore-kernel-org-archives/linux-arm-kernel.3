Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B479CC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 07:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6O06nCues7TjS3vEUr8Hzch/RGBixqkLvbgwaXBhdM=; b=3qYZMjhjlz2bAAcIEmtrJxZPBa
	opLT7cFaTGKgqCv2wkD2j4hsaw16zVFjyyvQ3Kx+pLewO8767NHKJUPQkIqUjPtP4H0FM1Dgskhpf
	xMJE2ipt99t7GdyV0skRSiGOZ19HSe5aMXb2cePDpmERv2vwJrTgx+HkS+C+IHfuSv4NN+ptoLr6O
	quqaa8tKujw2MhSG7/iOVG4NCr+9xLMFnpS3karrC8MblVUQMFf0PqcV6Cxr08E0HLboP2jgtj4nr
	0uTx+4DpNkurOe5+l40aCQro2TP4D8P72fbwhfXV/mQhzjWEHQ8p9WPKhD4enU9PWaFJiRgH7HRdU
	3ev1qsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnv4w-0000000A2Pd-2T4F;
	Fri, 28 Feb 2025 07:46:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnv3M-0000000A2BM-41HH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 07:45:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RL65d4030047;
	Fri, 28 Feb 2025 07:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6O06nCues7TjS3vEUr8Hzch/RGBixqkLvbgwaXBhdM=; b=QJqtmSocELidA9nF
	1ETFYpiplNR8b4rlg7TT84Aka2XKbuAf8ziVRm+4gpDtuJZwC0B28bBS9cC3sT73
	EVFY97ub2LQZTAeT1aKXlQtnpz5PtMUrEOcS8RDG2CaKb/4YRP0wW1Le47f8WnJz
	mUFXNpwosPcSqHhduQXM3I6ADepLS7Ilp5b9ZF8RLFRp44fJZtZdhFdG5188rZ9p
	ZgUACHxuCx0++2+IvYgkHzT1FG2/0cSh0mGl8V4kCr3gwH2yKKazE81qozDI/KVf
	aKZLG0HqQN3jWF1g3eLqWuXy23YnCsMzM6+4vwvyBx9GXtIzCU7cCm4Lok7ZaSZx
	zl+S5g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452ynwsc3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 07:44:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51S7ipLu002399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 07:44:51 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 23:44:45 -0800
Message-ID: <36f63775-cee8-46e0-a5bf-5e44ff0e582e@quicinc.com>
Date: Fri, 28 Feb 2025 15:44:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] coresight-tnoc: add node to configure flag type
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
 <20250221-trace-noc-driver-v1-4-0a23fc643217@quicinc.com>
 <d9eff439-27ae-4555-a0c5-21acdf60d321@kernel.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <d9eff439-27ae-4555-a0c5-21acdf60d321@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8kWV_iwHsAArISmsCcAxWvAsf4HTuX20
X-Proofpoint-GUID: 8kWV_iwHsAArISmsCcAxWvAsf4HTuX20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_01,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=822 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_234501_122939_22C5A982 
X-CRM114-Status: GOOD (  10.77  )
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



On 2/22/2025 6:55 PM, Krzysztof Kozlowski wrote:
> On 21/02/2025 08:40, Yuanfang Zhang wrote:
>> +
>> +static ssize_t flag_type_show(struct device *dev,
>> +			      struct device_attribute *attr,
>> +			      char *buf)
>> +{
>> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +	return sysfs_emit(buf, "%u\n", drvdata->flag_type);
>> +}
>> +static DEVICE_ATTR_RW(flag_type);
>> +
>>  static struct attribute *trace_noc_attrs[] = {
>>  	&dev_attr_flush_req.attr,
>>  	&dev_attr_flush_status.attr,
>> +	&dev_attr_flag_type.attr,
> 
> Where is the ABI documentation?
will update in V3.
> 
> Best regards,
> Krzysztof


