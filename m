Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79741C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emCEPnGAgBEvgFMwBTfT/bBd93PEBF8nxLoLKxqgSSE=; b=JNKv/gABpa1+09VGZk95M9GcMW
	6F7gvB4ShrrqotLaQK4+1rLoZHFtuRnlU7eYKSVX0JC+sTMsQHdm6aAbCOYGgqqghpTHn6uG3emPU
	f31Y5nZKx+Py7fQuHr9VSDQPEMQcKPssqw0DqAWL9mc9eLj2t1FoZHGmnSO+AH3726t1CkkdO5SMh
	jKHykWH9OPIiDN0shUVQMoDZVVCkZsKXhDsdSZhknTQm3BpBHUtNirF6bRwZUj7Dnsh7kKMp7vFuB
	Rc7gWAxuFSxx8aR8gug0S6S+aRyU46nGdlsMDTqt9rBINQb2jtJJJL0cernacH4qIXQKC1SEViJcA
	752gSM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZKH-000000023sz-49Zg;
	Mon, 10 Mar 2025 09:21:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZEC-000000022ea-2YlS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:15:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529La2gE014060;
	Mon, 10 Mar 2025 09:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	emCEPnGAgBEvgFMwBTfT/bBd93PEBF8nxLoLKxqgSSE=; b=Ri0b0wyFa9ury9oV
	2QBOGDT7Dj48KSkhAnsGyolHYYOZemWGzPp4SB9wWIWja+GncMWfxQWzgffWTKuR
	5u2cUnjR2Gmuozvdwg6VxISgk0tBSb3ZvKJcDeb3Sd8uDdYrQJoTgZfzsRgB+rxi
	gnPkTsflpotERgRmhApI/n2s3jBdM9sEPz/uCrjqln7IleNS6RYk+ynmHN0brKiE
	7wC0ETskiUTFa9aTFaqaHx7oK+0eulWWxrJUfI6BW+ZQBR/Tug5zI5RcGUJqAkVS
	cxcAQnuayVxqSUZjMg6YFts6kiszfxGwxNCh0PwC4Sut/RDw8j16D6i+EfWQmSin
	jlK0lw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f2mc8t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 09:15:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A9F43f011069
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 09:15:04 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Mar
 2025 02:14:59 -0700
Message-ID: <55e62062-f85f-484d-b577-87e10e73ab31@quicinc.com>
Date: Mon, 10 Mar 2025 17:14:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] coresight: tmc: Introduce new APIs to get the RWP
 offset of ETR buffer
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
 <20250310090407.2069489-2-quic_jiegan@quicinc.com>
 <b724d9c1-cd73-4e4e-aed1-101049204c90@kernel.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <b724d9c1-cd73-4e4e-aed1-101049204c90@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Bx8FOf-cxt4eCrRdwCyPwLGbAr0Djaq2
X-Proofpoint-ORIG-GUID: Bx8FOf-cxt4eCrRdwCyPwLGbAr0Djaq2
X-Authority-Analysis: v=2.4 cv=ab+bnQot c=1 sm=1 tr=0 ts=67cead99 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Con8ddXmaDJE1B7ER5wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_03,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=697 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_021516_661629_9411A771 
X-CRM114-Status: GOOD (  12.40  )
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



On 3/10/2025 5:07 PM, Krzysztof Kozlowski wrote:
> On 10/03/2025 10:04, Jie Gan wrote:
>> +static long tmc_sg_get_rwp_offset(struct tmc_drvdata *drvdata)
>> +{
>> +	struct etr_buf *etr_buf = drvdata->sysfs_buf;
>> +	struct etr_sg_table *etr_table = etr_buf->private;
>> +	struct tmc_sg_table *table = etr_table->sg_table;
>> +	long w_offset;
>> +	u64 rwp;
>> +
>> +	rwp = tmc_read_rwp(drvdata);
>> +	w_offset = tmc_sg_get_data_page_offset(table, rwp);
>> +
>> +	return w_offset;
>> +}
>> +
>> +/*
>> + * Retrieve the offset to the write pointer of the ETR buffer based on whether
>> + * the memory mode is SG, flat or reserved.
>> + */
>> +long tmc_get_rwp_offset(struct tmc_drvdata *drvdata)
> 
> You need kerneldoc for exports.

Hi Krzysztof,

Sorry for the insufficient description for an export function. Will fix 
it in next version.

Thanks,
Jie

> 
> 
> Best regards,
> Krzysztof


