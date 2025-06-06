Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D5AC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 03:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9PhJc/ebj7RXi+A2fgi3pqjuSf3ogOUSEdbyYkfo54=; b=tBJFykhDlI4paynsLw2UDfNOkC
	wyw4sJ04+Za7e7RatXhXIYCavXa/zwsfMQtLhQGp1cQfNhXLyxWsOVtGJTdZtbfwbNYdJg9rOA/1a
	/u9a36/xma1EIOnHttoUgLjGgvrAgsVf8fzmhwt554Ka8qx5D809/CqRAWHK5PzJmA5W1JgQqwxaU
	RgOG62jjJh51EhPEdbu/wN/dKvxsHgr7bX3R4yEUSOT0Oi6G0x/Rb2cFy3rbRqxZFCY72snVhQ94P
	GqHPvtvA3IJRnSdAXpa2unC2zZ6qmP5UvajDWBsc6IXsaR+bG0OOuetYZJlW6u34QP+uE71lZ/jLC
	mt0AVvdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNNPv-0000000H0yN-2SSM;
	Fri, 06 Jun 2025 03:06:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNNGG-0000000H0DO-3VP4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 02:56:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GrJxX006553;
	Fri, 6 Jun 2025 02:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c9PhJc/ebj7RXi+A2fgi3pqjuSf3ogOUSEdbyYkfo54=; b=UmSr2mbFAmreNBU8
	wsivTSw7xRz2zED9YRoHop6OBXAPs3Tlumj6bgNgtyc3Hl5rsfLw+jst/BsgRdwL
	2bx7DwLWOd3ZQVY1etlSCwgQWrG8+szIh6GaVu0RINm0QW5y03Pw4Kww1iHwET5Z
	ftqe+YuJWS1MzE+nIxAOUZyD7CKnfH66iiGPKAT8hnnjhO8GALLel8r4KKdKLjep
	OVtv3g7OnM8I5n9+PtU9Ntj5gwveBg3W9nJlWWl0ugviZDQQVTw46AsjgtbjFECT
	5IA3eiMsnMoOu3pZkveRaPQn/ZrjJpI9z7IPoCSy+dBLq8fjJ1iQVBR/Gg+wGLn0
	AJGCaA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t38ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 02:56:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5562ucgJ026105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 02:56:38 GMT
Received: from [10.239.133.242] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Jun 2025
 19:56:35 -0700
Message-ID: <a820b7c9-0919-4c78-a5cc-bf8289dd0b59@quicinc.com>
Date: Fri, 6 Jun 2025 10:56:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] coresight-tgu: Add TGU decode support
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250529081949.26493-1-quic_songchai@quicinc.com>
 <20250529081949.26493-5-quic_songchai@quicinc.com>
 <20250529123204.00005b78@huawei.com>
Content-Language: en-US
From: songchai <quic_songchai@quicinc.com>
In-Reply-To: <20250529123204.00005b78@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -KTZXwyQ4vCOer1Jwvm39QZv7-WdxDFI
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=684258e7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=AYfyxP4j3TdDPRqpEJ4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -KTZXwyQ4vCOer1Jwvm39QZv7-WdxDFI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAyNyBTYWx0ZWRfX6op8+FGKWe8x
 VDR0S3AmS4bW+JOLS73ua0oryDpRxmTxDWwyOuxnIJHxflYrQc0rPsVrWTVDpRapt8nJMLhIP1P
 elstbWr6e9eJCjLjhAp+FlKhkeLm18VYaty4CxmS8qcS4Q/gWr1O9A4K9C/IPMl1U7xgoNGa2I3
 zvrv86erzQOSAs5WoRWUQWkNyqYKCFOc6GbZrV8EktFECuULIUKD4/Kuv9tv0MlsTbJ9lPGkCXv
 joNdkVh5Ma31v2N9iRm+dcn9StYg83cy5oxcBJvv6taRyygqee6SDPiYcj0mgo/Ty49X9grN0HF
 sXUz7iHZP0hF5ZEcp3ZzZ1C2E741ZFsiDuh41GwMXA6TGVjz9VyIOZRHXU+ElUj9c7dMBMIQt5N
 sV+Ja/bfPPuNbp+F2AvwXkEE9Uoiu5aBeibvSxLbInoFLl+TTbmRNm1YCLTOBLBhsIJYT73e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_195652_887655_F7AEBB9D 
X-CRM114-Status: GOOD (  18.09  )
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


On 5/29/2025 7:32 PM, Jonathan Cameron wrote:
> On Thu, 29 May 2025 16:19:45 +0800
> Songwei Chai <quic_songchai@quicinc.com> wrote:
>
>> Decoding is when all the potential pieces for creating a trigger
>> are brought together for a given step. Example - there may be a
>> counter keeping track of some occurrences and a priority-group that
>> is being used to detect a pattern on the sense inputs. These 2
>> inputs to condition_decode must be programmed, for a given step,
>> to establish the condition for the trigger, or movement to another
>> steps.
>>
>> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
>> diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
>> index 6dbfd4c604b1..8dbe8ab30174 100644
>> --- a/drivers/hwtracing/coresight/coresight-tgu.c
>> +++ b/drivers/hwtracing/coresight/coresight-tgu.c
>> @@ -21,13 +21,35 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
>> +
>>   static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
>>   		      void *data)
>>   {
>> +	int ret = 0;
>  From what can be seen here, looks like ret is always set, so no need to init.
Would this initialization improve the determinism of the code? :-)
>>   	struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>   
>>   	spin_lock(&drvdata->spinlock);
>> @@ -150,11 +264,15 @@ static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
>>   		spin_unlock(&drvdata->spinlock);
>>   		return -EBUSY;
>>   	}
>> -	tgu_write_all_hw_regs(drvdata);
>> +	ret = tgu_write_all_hw_regs(drvdata);
>> +
>> +	if (ret == -EINVAL)
>> +		goto exit;
>>   	drvdata->enable = true;
>>   
>> +exit:
>>   	spin_unlock(&drvdata->spinlock);
>> -	return 0;
>> +	return ret;
>>   }
>> diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
>> index f07ead505365..691da393ffa3 100644
>> --- a/drivers/hwtracing/coresight/coresight-tgu.h
>> +++ b/drivers/hwtracing/coresight/coresight-tgu.h
>>   enum operation_index {
>>   	TGU_PRIORITY0,
>>   	TGU_PRIORITY1,
>>   	TGU_PRIORITY2,
>> -	TGU_PRIORITY3
>> +	TGU_PRIORITY3,
> And here is why the previous patch should definitely have had the ,
Thanks for your clarification.
>
>> +	TGU_CONDITION_DECODE
>>   
>>   };
>>

